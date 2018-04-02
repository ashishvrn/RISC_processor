`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:02 04/01/2018 
// Design Name: 
// Module Name:    offset 
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
module offset(sign_ext8,dataout,clk);
input [15:0] sign_ext8;
input clk;
output [15:0] dataout;
reg [15:0] dataout;
always @ (posedge clk)
begin
dataout=sign_ext8;
$display("At this posedge register B=%h",dataout);
end
endmodule
