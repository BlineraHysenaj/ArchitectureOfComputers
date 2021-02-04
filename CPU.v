`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 11:17:34 AM
// Design Name: 
// Module Name: CPU
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


module CPU(
input clk
    );
    wire pcFill = 16'd12;
    wire RegDst;
    wire ALUSrc;
    wire MemToReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire ALUOp1;
    wire [1:0] opcode;
    
    Datapath CPU_DP( clk,  pcFill,  RegDst,  ALUSrc,  MemToReg,  RegWrite,  MemRead,
                  MemWrite,   ALUOp1,  opcode);
                 
    cu CPU_CU( opcode, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, ALUOp1 );             
                 
                 
endmodule
