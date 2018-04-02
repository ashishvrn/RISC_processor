`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:25 04/01/2018 
// Design Name: 
// Module Name:    pc 
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
module pc(indata,outdata,pc_wrt_s2,rst,clk);
input [15:0]indata;
input clk,pc_wrt_s2,rst;
output [15:0] outdata;
reg [15:0] outdata;
always @ (posedge clk or negedge rst)
if(~rst)outdata=0;
else
begin
   if(pc_wrt_s2)
  begin
    outdata=indata;
    $display("At this posedge  contents of pc are %h",outdata);
  end
end
endmodule
