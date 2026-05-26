`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 05:02:43
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter
    #(parameter N=4)
    (
        input clk,
        input reset_n,
        input enable,
        input up,
        output [N-1:0] Q
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin: reg_logic
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    always@(*)
    begin: comb_logic
        if(enable)
        begin
            if(up)
                Q_next = Q_reg + 1'b1;
             else
                Q_next = Q_reg - 1'b1;
         end
        else
            Q_next = Q_reg;
    end
    assign Q= Q_reg;
endmodule