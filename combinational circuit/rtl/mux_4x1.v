`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 00:02:05
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
    input x1,x2,x3,x4,s0,s1,
     output f
    );
    wire w0,w1;
    mux_2x1_gate m0(x1,x2,s0,w0); // oredred connection
    mux_2x1_beh m1(.x1(x3),.x2(x4),.sel(s0),.f(w1));// name port connections
    mux_2x1_dataflow m2(w0,w1,s1,f);
endmodule
