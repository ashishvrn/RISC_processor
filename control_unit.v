`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:10 04/01/2018 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(opcode,outA,carry,reset,pc_sel,pc_wrt,addr_sel,
ir_wrt,data_sel,rega_sel,
reg_wrt,opb_sel,opa_sel,
alu_sel,re,we,clk);
output pc_sel,pc_wrt,addr_sel,ir_wrt,rega_sel,reg_wrt,opa_sel,re,we;
output [1:0] data_sel,opb_sel;
output [2:0] alu_sel;
input [3:0] opcode;
input [15:0] outA;
input carry, reset, clk;
reg pc_sel,pc_wrt,addr_sel,ir_wrt,rega_sel,reg_wrt,opa_sel,re,we;
reg [1:0] data_sel,opb_sel;
reg [2:0] alu_sel;
wire [3:0] opcode;
wire [15:0] outA;
wire [2:0] alu_task;
reg [2:0] pstate,nstate;
wire zero;
assign alu_task = opcode;
parameter start=3'b100,s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011;
assign zero = ((outA == 16'b0)& ((opcode == 4'b1011) | (opcode == 4'b1100)))?1:0;
always @(posedge clk)
begin
  if(~reset)pstate=start;
else pstate = nstate;
end
always@(posedge clk)
      case (pstate)
       start: nstate=s0;
       
       s0: nstate=s1;
s1: nstate=s2;
s2: nstate=s3;
s3: nstate=s0;
endcase
always @(posedge clk)
       case(pstate)
//*****************************************************       
             start: begin
pc_sel=0;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b0;
opb_sel=2'b0;
alu_sel=3'b0; end
//****************************************************
s0: begin 
// Retrieve Instruction Word from Main Memory
//Increment Program Counter and Store in ALU Output
pc_sel=0;
pc_wrt=0;
addr_sel=0;
ir_wrt=1;
rega_sel=0;
reg_wrt=0;
opa_sel=1;
re=1;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=3'b000; end
//*****************************************************
s1: begin 
//write incremented Program Count
//Load Operands into Latches from Register File
case(opcode)
4'b0xxx: begin
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=alu_task; end
4'b1000: begin// Load Immediate word
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=3'b000; end
4'b1001: begin// Load Word Operation
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=3'b000; end
4'b1010: begin//Store Word Operation Keep 11:8 0000
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=3'b000; end
4'b1011: begin//Branch If zero
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=000; end
4'b1100: begin//Branch if Not zero
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=000; end
4'b1101: begin//Jump and link 
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=1;
opa_sel=0;
re=0;
we=0;
data_sel=2'b10;
opb_sel=2'b00;
alu_sel=000; end
4'b1110: begin//Simple Jump 
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b10;
opb_sel=2'b00;
alu_sel=000; end
4'b1111: begin//Jump Return-- PC = Rs
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b10;
opb_sel=2'b00;
alu_sel=000; end
endcase
end
//*****************************************************
s2: begin 
//Perform ALU Operation based instruction word and store in ALU Out
//Move Memory Word into MDR for Load Word operation
//Write Data into Memory from Register File for Store Word operation
case(opcode)
4'b0xxx: begin
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=alu_task; end
4'b1000: begin // Load Immediate word operation 
pc_sel=1;
pc_wrt=0;
addr_sel=1;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=1;
data_sel=2'b01;
opb_sel=2'b00;
alu_sel=3'b000; end
4'b1001: begin// Load Word Operation 
pc_sel=1;
pc_wrt=0;
addr_sel=1;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=1;
re=0;
we=0;
data_sel=2'b01;
opb_sel=2'b00;
alu_sel=3'b000; end
4'b1010: begin//Store Word Operation Keep 11:8 0000
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b01;
opb_sel=2'b00;
alu_sel=3'b000; end
4'b1011: begin//Branch If Zero
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=zero;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1100: begin//Branch If not Zero
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=~zero;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1101: begin//Jump and Link
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=1;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1110: begin// Simple Jump
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=1;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1111: begin// Jump Return
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=000; end
endcase
end
//*****************************************************
s3: begin
//Write ALU, IR (Immediate), or MDR data into Register File
//Write new Program Count for Jump Operation or it Branch taken
case(opcode)
4'b0xxx: begin
pc_sel=1;
pc_wrt=0;
addr_sel=1;
ir_wrt=0;
rega_sel=0;
reg_wrt=1;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=alu_task; end
4'b1000: begin // Load Immediate word 
pc_sel=1;
pc_wrt=0;
addr_sel=1;
ir_wrt=0;
rega_sel=1;
reg_wrt=1;
opa_sel=0;
re=1;
we=0;
data_sel=2'b01;
opb_sel=2'b11;
alu_sel=3'b000; end
4'b1001: begin// Load Word Operation 
pc_sel=1;
pc_wrt=0;
addr_sel=1;
ir_wrt=0;
rega_sel=1;
reg_wrt=1;
opa_sel=1;
re=1;
we=0;
data_sel=2'b01;
opb_sel=2'b11;
alu_sel=3'b000; end
4'b1010: begin//Store Word Operation Keep 11:8 0000
pc_sel=1;
pc_wrt=0;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b01;
opb_sel=2'b00;
alu_sel=3'b000; end
4'b1011: begin//Branch If Zero 
pc_sel=1;
pc_wrt=zero;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=zero;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1100: begin//Branch if not zero
pc_sel=1;
pc_wrt=~zero;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=zero;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1101: begin//Jump and Link
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=1;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1110: begin//Simple Jump
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=1;
reg_wrt=0;
opa_sel=1;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b11;
alu_sel=000; end
4'b1111: begin//Jump Return
pc_sel=1;
pc_wrt=1;
addr_sel=0;
ir_wrt=0;
rega_sel=0;
reg_wrt=0;
opa_sel=0;
re=0;
we=0;
data_sel=2'b00;
opb_sel=2'b00;
alu_sel=000; end
endcase
end
endcase
endmodule
