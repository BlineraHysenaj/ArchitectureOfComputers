`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 12:33:12 PM
// Design Name: 
// Module Name: alu_1bit
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

//deklarojm input-s dhe output-s
module alu_1bit(
    input  a,
    input  b,
    input  carryIn,
    input  bnegate,
    input  [2:0] op,
    output result,
    output carryOut
   );
// deklarojm telat
wire a, b, carryIn, bnegate; 
wire [2:0] op;
wire result;
wire net8;
wire net1, net2, net3, net4, net5, net6, bjo;

not b1 (bjo, b);                                    // kthimi i 'b' ne negacion te saj.
mux_2to1 mux_2(bnegate, b, bjo, net2);              // multiplekseri 2 ne 1

and n3 (net3, a, net2);                             // instruksioni AND
or  n4 (net4, a, net2);                             // instruksioni OR               
xor n5 (net6, a, net2);                             // instruksioni XOR

mult mult(a, b, net8, clk); 
full_adder FA (a, net2, carryIn, net5, carryOut);   // mbledhesi i plote
mux_8to1 mux_8(op[0], op[1], op[2], net3, left, net4, net6, net5, ADDI, right , net8, result);// multiplekseri 8 me 1

endmodule
