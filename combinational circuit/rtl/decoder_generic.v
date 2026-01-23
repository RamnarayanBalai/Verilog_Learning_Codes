`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2026 17:34:50
// Design Name: 
// Module Name: decoder_generic
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


module decoder_generic
    #(parameter N=5)
    (
      input [N-1:0] w,
      input en, 
      output reg [0: 2**N -1] y 
    );
    
    always@(w,en)
    begin
        y='b0;
        if(en)
        begin
            y[w] =1'b1;
        end
        else
            y='b0;
    end
endmodule
