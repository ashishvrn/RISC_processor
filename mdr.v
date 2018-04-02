`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:39 04/01/2018 
// Design Name: 
// Module Name:    mdr 
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
module mdr(memdatain,memdataout,clk);
input [15:0] memdatain;
input clk;
output [15:0] memdataout;
reg [15:0]memdataout;
always @ (posedge clk)
  memdataout=memdatain;
endmodule
