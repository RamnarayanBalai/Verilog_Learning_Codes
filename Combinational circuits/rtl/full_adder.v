`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 08:08:47
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input x,y,cin,
    output s,cout
    );
    wire w1,w2,w3;
    half_adder h1(
        .x(x),
        .y(y),
        .s(w1),
        .c(w2));
    half_adder h2(
        .x(w1),
        .y(cin),
        .s(s),
        .c(w3));
    or o(cout,w2,w3);
endmodule
