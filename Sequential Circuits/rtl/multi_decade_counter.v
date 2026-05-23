`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 00:37:53
// Design Name: 
// Module Name: multi_decade_counter
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

// count from 000 to 999
module multi_decade_counter(
        input clk,
        input reset_n,
        input enable,
        output done,
        output [3:0] ONES,TENS,HUNDREDS
    );
    wire [2:0] _enable;
    assign _enable[0] = enable;
    wire [2:0] _done;
    assign _done[2] = done;
    
    assign _enable[2:1] = {_done[1:0] & _enable[1:0]};
    
    BCD_counter ones (
        .clk(clk),
        .reset_n(reset_n),
        .enable(_enable[0]),
        .done(_done[0]),
        .Q(ONES)
    );
    
    BCD_counter tens (
        .clk(clk),
        .reset_n(reset_n),
        .enable(_enable[1]),
        .done(_done[1]),
        .Q(TENS)
    );
    
    BCD_counter hundreds (
        .clk(clk),
        .reset_n(reset_n),
        .enable(_enable[2]),
        .done(_done[2]),
        .Q(HUNDREDS)
    );
endmodule
