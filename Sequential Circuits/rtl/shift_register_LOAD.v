`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 02:12:45
// Design Name: 
// Module Name: shift_register_LOAD
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


module shift_register_LOAD
    #(parameter N=4)
    (
        input clk,
        input SI,
        input [N-1:0] I,
        input load_shift_n,
        input reset_n, //asynchronous
        output [N-1:0] Q,
        output SO
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    always @(*)
    begin
        if(load_shift_n)
            Q_next = I;
        else        
            Q_next = {SI,Q_reg[N-1:1]}; //right shift
        
    end
    
    assign SO = Q_reg[0]; //for right shift
    assign Q = Q_reg;
endmodule

