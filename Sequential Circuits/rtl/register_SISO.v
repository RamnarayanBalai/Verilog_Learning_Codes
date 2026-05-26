`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 01:54:12
// Design Name: 
// Module Name: register_SISO
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


module register_SISO
    #(parameter N=4)
    (
        input clk,
        input SI,
        output SO
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    always @(*)
    begin
        //right shift
        Q_next = {SI,Q_reg[N-1:1]};
        // left shift
       // Q_next = {Q_reg[N-2:0],SI};
    end
    
    assign SO = Q_reg[0]; //for right shift
endmodule
