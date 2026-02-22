`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 00:03:06
// Design Name: 
// Module Name: mod_counter_param
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


module mod_counter_para 
    #(parameter FINAL_VAL=23)
    (
        input clk,
        input reset_n,
        input enable,
        output [N-1:0] Q
    );
    localparam N= $clog2(FINAL_VAL);
    
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
