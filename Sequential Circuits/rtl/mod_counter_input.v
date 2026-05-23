`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 23:47:12
// Design Name: 
// Module Name: mod_counter_input
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


module mod_counter_input
    #(parameter N=4)
    (
        input clk,
        input reset_n,
        input enable,
        input [N-1:0] FINAL_VAL,
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
    
    assign done = Q_reg == FINAL_VAL; // mod 9 counter
    
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
