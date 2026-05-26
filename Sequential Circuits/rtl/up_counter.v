`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 04:46:56
// Design Name: 
// Module Name: up_counter
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


module up_counter
    #(parameter N=4)
    (
        input clk,
        input reset_n,
        output [N-1:0] Q
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    always@(*)
    begin
        Q_next = Q_reg + 1'b1;
    end
    assign Q= Q_reg;
endmodule
