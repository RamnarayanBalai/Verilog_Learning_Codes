`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 05:27:49
// Design Name: 
// Module Name: async_up_counter
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


module async_up_counter
    #(parameter N=4)
    (
    input clk,
    input reset_n,
    output [N-1:0] Q
    );
    genvar k;
    
    wire [N-1:0] Q_n;
    generate
        for(k=0;k<N;k=k+1)
        begin: stage
            TFF FF(
            .clk(Q_n[k]),
            .T(1),
            .reset_n(reset_n),
            .Q(Q[k])
            );
        end
    endgenerate
    
    assign Q_n = {~Q[N-2:0],clk};
endmodule
