`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 23:39:54
// Design Name: 
// Module Name: tb_mod_counter
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


module tb_mod_counter;
    parameter N=4;
    
    reg clk, reset_n, enable;
    wire [N-1:0] Q;

    mod_counter #(.N(N)) uut(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
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
           
            enable = 1'b1;
            
            #40 enable = 0;
            #75 enable = 1;
            
            
            #(600) $finish;
        end
    
endmodule
