`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 19:00:23
// Design Name: 
// Module Name: multiple_adder
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


module multiple_adder(
    input [15:0]a,[15:0]b,
    input cin_ab,
    output [15:0]s_ab,
    output cout_ab,
    
    input [31:0]x,[31:0]y,
    input cin_xy,
    output [31:0]s_xy,
    output cout_xy
    );
    
    rca_nbit #(.n(16)) adder_16bit
    (
        .x(a),
        .y(b),
        .cin(cin_ab),
        .s(s_ab),
        .cout(cout_ab)   
    );
    
     rca_nbit #(.n(32)) adder_32bit
    (
        .x(x),
        .y(y),
        .cin(cin_xy),
        .s(s_xy),
        .cout(cout_xy)   
    );
endmodule
