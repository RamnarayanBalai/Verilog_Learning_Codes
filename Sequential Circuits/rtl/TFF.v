`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 05:06:46
// Design Name: 
// Module Name: TFF
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


module TFF(
    input clk,
    input T,
    input reset_n,
    output Q
    );
    localparam C2Q_DELAY =2; // only for simulation purpose
    
    reg Q_reg, Q_next;
    always @(posedge clk, negedge reset_n)
    begin 
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            #(C2Q_DELAY) Q_reg <= Q_next;
    end
    
    always @(*)
    begin
        if(T) 
            Q_next = ~Q_reg;
        else
            Q_next = Q_reg;
    end
    
    assign Q = Q_reg;
endmodule
