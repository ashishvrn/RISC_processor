`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:55 04/01/2018 
// Design Name: 
// Module Name:    datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module datapath( irout,outA,carry,pc_sel,pc_wrt,addr_sel,
ir_wrt,data_sel,rega_sel,
reg_wrt,opb_sel,opa_sel,
alu_sel,re,we,clk,rst);
input pc_sel,pc_wrt,addr_sel,ir_wrt,
 rega_sel,reg_wrt,opa_sel,re,we,rst;
input [1:0] data_sel,opb_sel;
input [2:0] alu_sel;
input clk;
output [3:0] irout;
output [15:0] outA;
output carry;
wire pc_sel,pc_wrt,addr_sel,ir_wrt,
rega_sel,reg_wrt,opa_sel;
wire [1:0] data_sel,opb_sel;
wire [2:0] alu_sel;
wire [3:0] instr15_12,instr11_8,instr7_4,instr3_0, rega;
wire [15:0] outA,alu_out,alu_rslt,pcin,pcout,address,data_in,data_out,sign_ext8,datain,
                   offsetdata,memout,opa,Ra,adata,Rb,bdata,opb;                              
wire [15:0]zero,one;
wire clk;
assign zero = 16'b0;
assign one = 16'b1;
assign irout = instr15_12;
assign outA = adata;
//Modules are instantiated
mux2_to_1 pcmux(zero,alu_rslt,pc_sel,pcin);
pc programcounter(pcin,pcout,pc_wrt,rst,clk);
mux2_to_1 mux_memory(pcout,alu_out,addr_sel,address);
ram memory(clk,address,data_in,data_out,re,we);// modified in_data,out_data replaces Memdata
instr_reg IR(data_out,ir_wrt, clk,instr15_12, instr11_8, instr7_4, instr3_0);
mux4b_2_to_1 instrmux(instr11_8,instr7_4,rega_sel,rega);
regfile16 regfile(rega,Ra,instr3_0,Rb,instr11_8,datain,reg_wrt,address,data_in,clk);
signextender signext(instr7_4,instr3_0,sign_ext8);
mdr memory_data_reg(data_out,memout,clk);
mux4_to_1 opbmux(sign_ext8,memout,alu_rslt,zero,data_sel,datain);
opa registera(Ra,adata,clk);
opb registerb(Rb,bdata,clk);
offset offsetpart(sign_ext8,offsetdata,clk);
mux2_to_1 regamux(adata,pcout,opa_sel,opa);
mux4_to_1 regbmux(bdata,zero,one,offsetdata,opb_sel,opb);
alu16b alu(opa,opb,alu_sel,alu_out,carry);
aluout finalout(alu_out,alu_rslt,clk);
endmodule