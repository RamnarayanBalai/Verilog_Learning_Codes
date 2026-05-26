`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 01:43:22
// Design Name: 
// Module Name: register_PIPO_LOAD
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


module register_PIPO_LOAD
    #(parameter N=4)
    (
     input clk,
     input load,
     input [N-1:0] I,
     output [N-1:0] Q
    );
  
    reg [N-1:0] Q_reg , Q_next;
    
    always @(posedge clk)
    begin
        Q_reg<=Q_next;
    end
    
    always @(I,load)
    begin
        if(load)
            Q_next=I;
        else
            Q_next = Q_reg;
    end
    
    assign Q=Q_reg;
    
    
endmodule
