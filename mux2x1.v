`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:15 04/01/2018 
// Design Name: 
// Module Name:    mux2x1 
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
module mux2_to_1(in0,in1,sel,out);
input [15:0] in0,in1;
input  sel;
output [15:0] out;
reg [15:0] out;
always @(sel or in0 or in1)
begin
   case(sel)
    1'b0: out=in0;
    1'b1: out=in1;
   endcase
	end
endmodule
