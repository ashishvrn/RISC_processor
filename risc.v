`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:43 04/01/2018 
// Design Name: 
// Module Name:    risc 
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
module risc(clk,reset);
input clk,reset;
wire [3:0]opcode;
wire [2:0] alu_sel;
wire [1:0] opb_sel,data_sel;
wire [15:0] outA;
wire carry,pc_sel,pc_wrt,addr_sel,ir_wrt,rega_sel,reg_wrt,opa_sel,re,we;
control_unit control_path(opcode,outA,carry,reset,pc_sel,pc_wrt,addr_sel,
ir_wrt,data_sel,rega_sel,
reg_wrt,opb_sel,opa_sel,
alu_sel,re,we,clk);
datapath data_path( irout,outA,carry,pc_sel,pc_wrt,addr_sel,
ir_wrt,data_sel,rega_sel,
reg_wrt,opb_sel,opa_sel,
alu_sel,re,we,clk,reset);
endmodule
