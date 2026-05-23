`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 22:55:04
// Design Name: 
// Module Name: mod_counter
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

// hardcoded
module mod_counter
    #(parameter N=4)
    (
        input clk,
        input reset_n,
        input enable,
        output [N-1:0] Q
    );
    
    reg [N-1:0] Q_reg, Q_next;
    wire done;
    
    always @(posedge clk, negedge reset_n)
    begin: reg_logic
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    assign done = Q_reg == 4'd8; // mod 9 counter
    
    always@(*)
    begin: comb_logic
        if(enable)
        begin
            Q_next = done? 1'b0 : Q_reg + 1'b1;
         end
        else
            Q_next = Q_reg;
    end
    assign Q= Q_reg;
 endmodule
