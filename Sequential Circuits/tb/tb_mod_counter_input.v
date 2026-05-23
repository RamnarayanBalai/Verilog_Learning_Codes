`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 23:50:19
// Design Name: 
// Module Name: tb_mod_counter_input
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


module tb_mod_counter_input;
    parameter N=4;
    
    reg clk, reset_n, enable,FINAL_VAL;
    wire [N-1:0] Q;

    mod_counter_input #(.N(N)) uut(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .FINAL_VAL(FINAL_VAL),
            .Q(Q)
            );
    
    initial
    begin
         reset_n = 0;
         #2 reset_n =1;
    end

    always
        begin
            clk=1'b0;
            #(10)
            clk = 1'b1;
            #(10);
        end
        
    initial
        begin
            FINAL_VAL = 9;
            enable = 1'b1;
            wait(Q==FINAL_VAL)
            FINAL_VAL = 12;
            #40 enable = 0;
            #75 enable = 1;
            
            #(600) $finish;
        end
    
endmodule

