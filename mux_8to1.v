`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 02:00:05 PM
// Design Name: 
// Module Name: mux_4to1
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


module mux_8to1 (s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7, z);
//d0 = and -- 000
//d2 = or  -- 010
//d3 = xor -- 011
//d4 = add -- 100
//d5 = addi-- 101
//d4 = sub -- 010
//d1 = sll -- 001
//d6 = srl -- 110
//d7 = mult-- 111
input s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7;   //deklarimi i inputave
output z;                                           // deklarimi i 'z' si output

assign z = s2 ? s1 ? (s0 ? d7 : d6 ) : (s0 ? d5 : d4)  : s1 ? (s0 ? d3 : d2 ) : (s0 ? d1: d0 ); 
endmodule