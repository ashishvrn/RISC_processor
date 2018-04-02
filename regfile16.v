`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:12 04/01/2018 
// Design Name: 
// Module Name:    regfile16 
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
module regfile16(add_Rs, out_Rs, add_Rt, out_Rt, add_Rd, data_wr, regwr,addr_sw,data_sw, 
clk) ;
  input [3:0] add_Rs, add_Rt, add_Rd;
  input regwr, clk;
  input [15:0] data_wr;
  output [15:0] out_Rs, out_Rt,addr_sw,data_sw;
  reg[15:0] Register[15:0];
  
  reg [15:0] out_Rs, out_Rt;
  wire [15:0] addr_sw,data_sw;
  assign addr_sw = out_Rs;
  assign data_sw = out_Rt;
  
  always @ (posedge clk)
  
   if(regwr)
   begin
   if (add_Rd == 0)
      Register[add_Rd] = 0;//if it is zero ,the output must be zero only
    else 
      Register[add_Rd] = data_wr;
   $display("At this posedge  Register %d of Regfile is written %h",add_Rd,data_wr);
   end
  always @ (add_Rs or add_Rt)
   begin
        if (add_Rs == 0)
          out_Rs = 0;// if it is zero register,then give the content as zero only
        else 
          out_Rs = Register[add_Rs];
        if (add_Rt == 0)
          out_Rt = 0;// if it is zero register,then give the content as zero only
        else 
          out_Rt = Register[add_Rt];
    end
endmodule
