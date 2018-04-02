`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:53 04/01/2018 
// Design Name: 
// Module Name:    inst_reg 
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
module instr_reg(instr_data,irwr, clk,instr15_12, instr11_8, instr7_4, instr3_0);
input [15:0] instr_data;
input irwr,clk;
output [3:0] instr15_12, instr11_8, instr7_4, instr3_0;
reg [3:0] instr15_12, instr11_8, instr7_4, instr3_0;
always @(posedge clk)
begin
if(irwr)
 begin
   $display(" At  this  posedge Instruction register=memory[pc]=%h",instr_data);
   instr15_12=instr_data[15:12];
   instr11_8=instr_data[11:8];
   instr7_4=instr_data[7:4];
   instr3_0=instr_data[3:0];
 end
end
endmodule
