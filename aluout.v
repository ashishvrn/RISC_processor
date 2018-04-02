`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:31 04/01/2018 
// Design Name: 
// Module Name:    aluout 
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
module aluout(datain,dataout,clk);
input [15:0] datain;
input clk;
output [15:0] dataout;
reg [15:0] dataout;
always @ (posedge clk)
begin
dataout=datain;
$display("At this posedge of clock register aluout is %h",dataout);
end
endmodule