`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 01:28:36
// Design Name: 
// Module Name: register_simple
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


module register_simple
    #(parameter N=4)
    (
     input clk,
     input [N-1:0] I,
     output [N-1:0] Q
    );
  
    reg [N-1:0] Q_reg , Q_next;
    
     // parallel IN parallel OUT
    always @(posedge clk)
    begin
        Q_reg<=Q_next;
    end
    
    always @(*)
    begin
        Q_next=I;
    end
    
    assign Q=Q_reg;
    
    // this register can't hold a value
    // It will only sample it and when the input arre removed the 
    // value gets removed 
    // so we modify it to register with LOAD signal
endmodule
