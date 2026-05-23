`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 00:31:52
// Design Name: 
// Module Name: BCD_counter
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


module BCD_counter
    (
        input clk,
        input reset_n,
        input enable,
        output done,
        output [3:0] Q
    );
    
    reg [3:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin: reg_logic
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    assign done = Q_reg == 9; // mod 10 counter ==> BCD counter
    
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