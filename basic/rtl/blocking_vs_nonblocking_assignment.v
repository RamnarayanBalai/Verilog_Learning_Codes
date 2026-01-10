`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2026 00:44:48
// Design Name: 
// Module Name: blocking_vs_nonblocking_assignment
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


module blocking_vs_nonblocking_assignment(
    input a,b,c,d,e,f,g,
    output reg x,y,z
    );
    
    always @(*)
    begin
        //blocking assignment -> block the evaluation of next statement untill current one not get assigned 
        x=a;
        x=x^b;
        x=x|c;
        //blocking assignment but changing the order -> diff ckt
        z=d;
        z=z|e;
        z=z^f;
        // non blocking assigmnent -> assignment at last but not blocking the evaluation of next statements 
        y<=a;
        y<=y^d;
        y<=y|g;
    end
endmodule
