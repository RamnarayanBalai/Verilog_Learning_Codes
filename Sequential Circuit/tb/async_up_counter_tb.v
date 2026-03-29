`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 05:43:28
// Design Name: 
// Module Name: async_up_counter_tb
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


module async_up_counter_tb;

parameter N=4;

reg clk,reset_n;
wire [N-1:0] Q;

async_up_counter #(.N(N)) uut(
            .clk(clk),
            .reset_n(reset_n),
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
    
endmodule
