`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 23:21:38
// Design Name: 
// Module Name: mux_2x1_dataflow
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


module mux_2x1_dataflow(
    input x1,x2,sel,
    output f
    );
    assign f = (~sel & x1) | (sel & x2);
endmodule
