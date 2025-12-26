`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 19:22:21
// Design Name: 
// Module Name: adder_substractor_4bit
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


module adder_substractor_4bit(
    input [3:0]x, [3:0]y,
    input add_n,
    output [3:0]s,
    output cout
    );
    wire [3:0] xrored_y;
    
    assign xrored_y[0]=y[0]^add_n;
    assign xrored_y[1]=y[1]^add_n;
    assign xrored_y[2]=y[2]^add_n;
    assign xrored_y[3]=y[3]^add_n;
    
    rca_4bit A0(
        .x(x),
        .y(xrored_y),
        .s(s),
        .cin(add_n),
        .cout(cout)
    );
endmodule
