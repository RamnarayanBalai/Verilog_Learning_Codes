`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2026 23:20:49
// Design Name: 
// Module Name: generic_priority_encoder
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


module generic_priority_encoder
    #(parameter N=4)
    (
        input [N-1:0] w,
        output z,
        output reg [0:$clog2(N)-1]y
    );
    
    assign z=|w;
    
    integer k;
    always @(w) 
    begin
    y='bx;
        for(k=0;k<N;k=k+1)
            if(w[k]) y=k;
    end
endmodule
