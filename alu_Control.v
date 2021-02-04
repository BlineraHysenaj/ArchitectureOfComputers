`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2020 09:49:10 AM
// Design Name: 
// Module Name: alu_Control
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


module alu_Control( input clk, input [4:0] Funct,  input  ALUOp,  output reg[3:0] ALU_Input);

//wire[1:0] ALUInput;
always @ (posedge clk)
begin
    if(ALUOp == 0)
        begin 
          assign  ALU_Input = 4'b0100; // SW | LW
        end
    else if (ALUOp == 1)
        begin 
        case (Funct)
            5'b00001:   assign ALU_Input = 4'b0000; // AND
            5'b00010:   assign ALU_Input = 4'b0010; // OR
            5'b00011:   assign ALU_Input = 4'b0000; // XOR
            5'b00100:   assign ALU_Input = 4'b0100; // ADD
            5'bXXXXXXXX:assign ALU_Input = 4'b0101; // ADDI
            5'b00111:   assign ALU_Input = 4'b1100; // SUB
            5'b01000:   assign ALU_Input = 4'b0001; // SLL
            5'b01001:   assign ALU_Input = 4'b0110; // SRL
            5'b10000:   assign ALU_Input = 4'b0111; // MULT           
        endcase
        end
end

endmodule
