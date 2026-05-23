`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 00:57:22
// Design Name: 
// Module Name: DFF_reset
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


module DFF_reset(
    input D1,
    input reset_n,// asynchroonus active low reset
    input clear_n, // synchronous
    input clk,
    output Q1
    );
    
    reg Q1_next, Q1_reg;
    // asynchroonus active low reset
    always @(posedge clk, negedge reset_n)
    begin 
        if(!reset_n)
            Q1_reg <= 1'b0;
         else
            Q1_reg<=Q1_next;
    end
    
    
    always @(D1,clear_n)
    begin    
        if(!clear_n)
            Q1_next=1'b0;
        else
            Q1_next=D1;
    end
    
    assign Q1=Q1_reg;
    
    
endmodule
