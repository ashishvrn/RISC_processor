`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:35 04/01/2018 
// Design Name: 
// Module Name:    opb 
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
module opb(datain,dataout,clk);
input [15:0] datain;
input clk;
output [15:0] dataout;
reg [15:0] dataout;
always @ (posedge clk)
begin
dataout=datain;
$display(" At this posedge register B=%h",dataout);
end
endmodule