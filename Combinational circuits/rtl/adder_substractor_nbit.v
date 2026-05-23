`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 19:22:21
// Design Name: 
// Module Name: adder_substractor_4bit
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


module adder_substractor_nbit
    #(parameter n=4)
    (
    input [n-1:0]x, [n-1:0]y,
    input add_n,
    output [n-1:0]s,
    output cout
    );
    wire [n-1:0] xrored_y;
    
    generate
        for( genvar k=0;k<n;k=k+1)
        begin
            assign xrored_y[k]=y[k]^add_n;
        end
    endgenerate
    
    rca_nbit #(.n(n)) A0(
        .x(x),
        .y(xrored_y),
        .s(s),
        .cin(add_n),
        .cout(cout)
    );
endmodule
