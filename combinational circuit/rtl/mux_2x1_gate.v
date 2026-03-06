`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 22:53:20
// Design Name: 
// Module Name: mux_2x1_gate
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


module mux_2x1_gate(
    input x1,x2,sel,
    output f
    );
    wire w0,w1,w2;
    not n0 (w0,sel);
    and a1 (w1, w0,x1);
    and a2 (w2 ,sel, x2);
    or o0 (f,w1,w2);
endmodule
