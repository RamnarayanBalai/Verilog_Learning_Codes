`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2026 00:30:02
// Design Name: 
// Module Name: arithmatic_operators
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


module arithmatic_operators
    #(parameter n=4)
    (
        input [n-1:0] x, y,
        output [n-1:0] s,
        output cout,overflow
    );
    //wire [n:0] sum;
    //assign sum = {1'b0,x}+{1'b0,y};
    //assign s= sum[n-1:0];
    //assign cout=sum[n];
    
    assign {cout,s}=x+y;
endmodule
