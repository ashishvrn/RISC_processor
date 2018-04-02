`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:01 04/01/2018 
// Design Name: 
// Module Name:    ram 
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
module ram (clk, address, data_in, data_out, re, we); 
//parameter DATA_WIDTH = 16 ;
//parameter ADDR_WIDTH = 16 ;
//parameter RAM_DEPTH = 1 << ADDR_WIDTH;
//--------------Input Ports-----------------------
input                                     clk          ;
input [15:0] address, data_in ;
input                                     re           ;
input                                     we          ; 
//--------------Inout Ports-----------------------
output [15:0]  data_out       ;
//--------------Internal variables----------------
reg [15:0]   data ;
reg [15:0] mem [15:0];//65535
//--------------Code Starts Here------------------
assign data_out = (re)?data:16'bz;
// Memory Write Block 
// Write Operation : When we = 1
always @ (posedge clk)
begin : MEM_WRITE
   if ( we ) begin
       mem[address] = data_in;
   end
end
// Memory Read Block 
// Read Operation : When re = 1
always @ (address or re )
begin : MEM_READ
    if (re) begin
         data = mem[address];
    end
end
endmodule