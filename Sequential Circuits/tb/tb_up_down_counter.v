`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 05:10:54
// Design Name: 
// Module Name: tb_up_down_counter
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


module tb_up_down_counter;
    parameter N=4;
    
    reg clk, reset_n, enable,up;
    wire [N-1:0] Q;

    up_down_counter #(.N(N)) uut(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .up(up),
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
            up=1'b1;
            enable = 1'b1;
            
            #40 enable = 0;
            #75 enable = 1;
            wait(Q==15);
            up = 1'b0;
            #160 enable = 0;
            #195 enable = 1;
            #(250);
            up =1'b1;
            
            #(600) $finish;
        end
    
endmodule
