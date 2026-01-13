`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2026 00:39:39
// Design Name: 
// Module Name: compare_storage_elements
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


module compare_storage_elements(
    input D,
    input clk,
    output Qa,Qb,Qc
    );
    
    D_latch A(
        .D(D),
        .clk(clk),
        .Q(Qa),
        .Q_n(~Qa)
        );
    DFF_neg B(
        .D(D),
        .clk(clk),
        .Q(Qb)
        );
     DFF C(
        .D(D),
        .clk(clk),
        .Q(Qc)
        );
   
endmodule
