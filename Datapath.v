`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2020 08:59:18 PM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(input clk, input pcFill, input RegDst, input ALUSrc, input MemToReg, input RegWrite, input MemRead,
                 input MemWrite,  input ALUOp, output [1:0] opcode);

wire RegDst;
wire ALUSrc;
wire MemToReg;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUOp;
reg [15:0] pc; 
wire [15:0] instruksioni ;
wire [1:0] opcode;   
wire [2:0] RS;
wire [2:0] RT;
wire [2:0] RD;
wire [4:0] funct;
wire [7:0] immediate;
wire[15:0] WD;
wire RFwe;
wire[15:0] RD1;
wire[15:0] RD2;
reg s;
wire [15:0] alu2 ;
wire [15:0] imm_long ;
wire AdresaNeHyrje;
wire WriteData;
wire ReadData;
wire clk;
wire result;

initial begin
    assign pc = pcFill;
end

always @ (posedge clk)
begin
    assign pc = pc + 16'b1;
end

InstrMemory DP_IM(clk, pc, instruksioni);

assign opcode = instruksioni[15:14];
assign RS = instruksioni[13:11];
assign RT = instruksioni[10:8];
assign RD = instruksioni[7:5];
assign funct = instruksioni[4:0];
assign immediate = instruksioni[7:0];

always @(opcode)
begin 
   if(opcode == 2'd0)
   //R Formati
   s=0;
   else
   //I Formati
   s=1;
end

mux_2to1 HyrjeRF(s, RD, RT, z);
RegisterFile RF(RS, RT, RD, WD, RFwe, clk, RD1, RD2);

assign imm_long = {{8{immediate[7]}}, immediate[7:0]};
assign alu2 = s ? imm_long : RD2;

alu_Control aluControl( clk, Funct, ALUOp, ALU_Input);
wire[15:0] count;
wire[0:0] x;
//assign x = ALU_Input[3:2];
alu_16bit aluRF( RD1, alu2, ALU_Input, ALU_Input, op, result, cout);  
  
DataMemory DP_DM ( AdresaNeHyrje,  WriteData,  MemWrite,  MemRead,  clk,  ReadData);    
assign RFwe = 1;

endmodule