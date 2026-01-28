`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2026 01:10:11
// Design Name: 
// Module Name: DFF_multi
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


// blocking vs nonblocking for multiple/cascaded DFF
module DFF_multi(
    input D1,D2,D3,
    input clk1,clk2,clk3,
    output reg Q1,Q2,Q3,Q4,Q5,Q6
    );
    //blocking assignment for cascade -> Do not WORK
    always @(posedge clk1)
    begin: blocking
        Q1=D1;
        Q2=Q1;
    end
    
     always @(posedge clk2)
    begin: blocking_but_order_changed
        Q5=Q6;
        Q6=D2;
    end
    
    // non blocking assignment for cascade -> OK
     always @(posedge clk3)
    begin: non_blocking
        Q3<=D3;
        Q4<=Q3;
    end
endmodule
