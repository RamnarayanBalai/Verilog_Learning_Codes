`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 08:22:31
// Design Name: 
// Module Name: rca_4bit
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


module rca_4bit(
    input [3:0]x, [3:0]y,
    input cin,
    output [3:0]s,
    output cout
    );
    wire [2:0] c;
    full_adder FA0(
        .x(x[0]),
        .y(y[0]),
        .cin(cin),
        .cout(c[0]),
        .s(s[0])
        );
     full_adder FA1(
        .x(x[1]),
        .y(y[1]),
        .cin(c[0]),
        .cout(c[1]),
        .s(s[1])
        );
      full_adder FA2(
        .x(x[2]),
        .y(y[2]),
        .cin(c[1]),
        .cout(c[2]),
        .s(s[2])
        );
      full_adder FA3(
        .x(x[3]),
        .y(y[3]),
        .cin(c[2]),
        .cout(cout),
        .s(s[3])
        );
endmodule
