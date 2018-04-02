`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:09 04/01/2018 
// Design Name: 
// Module Name:    mux4x1 
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
module mux4_to_1(in0,in1,in2,in3,sel,out);
input [15:0] in0,in1,in2,in3;
input [1:0] sel;
output [15:0] out;
reg [15:0] out;
always @(sel or in0 or in1 or in2 or in3)
 begin
   case(sel)
    2'b00: out=in0;
    2'b01: out=in1;
    2'b10: out=in2;
    2'b11: out=in3;
    endcase
end
endmodule
