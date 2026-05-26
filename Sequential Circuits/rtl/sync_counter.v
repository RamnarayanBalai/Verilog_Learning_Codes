`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 02:01:43
// Design Name: 
// Module Name: sync_counter
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

//up
module sync_counter
#(parameter N=4)
    (
    input clk,
    input reset_n,
    output [N-1:0] Q
    );
    genvar k;
    
    wire [N-1:0] T;
    generate
        for(k=0;k<N;k=k+1)
        begin: stage
            TFF FF(
            .clk(clk),
            .T(T[k]),
            .reset_n(reset_n),
            .Q(Q[k])
            );
        end
    endgenerate
    
    assign T = {T[N-2:0]&Q[N-2:0],1'b1};
endmodule
