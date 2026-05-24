`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 
// Design Name: 
// Module Name: rca_nbit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Parametrized N-bit Ripple Carry Adder
// 
// Dependencies: full_adder
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module rca_nbit
    #(parameter n=4)
    (
    input [n-1:0] x, y,
    input cin,
    output [n-1:0] s,
    output cout
    );
    
    wire [n:0] c;
    assign c[0] = cin;
    assign cout = c[n];
    
    generate
        genvar i;
        for (i = 0; i < n; i = i + 1)
        begin : fa_loop
            full_adder fa_inst (
                .x(x[i]),
                .y(y[i]),
                .cin(c[i]),
                .s(s[i]),
                .cout(c[i+1])
            );
        end
    endgenerate
    
endmodule
