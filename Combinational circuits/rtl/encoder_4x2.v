`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2026 22:00:24
// Design Name: 
// Module Name: encoder_4x2
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


module encoder_4x2(
    input [3:0] w,
    output reg [1:0]y
    );
    
    always @(w)
    begin
        y='bx;
//        case(w)
//            4'b0001: y=2'b00;
//            4'b0010: y=2'b01;
//            4'b0100: y=2'b10;
//            4'b1000: y=2'b11;
//            default: y='bx;
//        endcase
        if(w==4'b0001) y=1;
        else if(w==4'b0010) y=2;
        else if(w==4'b0100) y=3;
        else if(w==4'b1000) y=4;
        else y='bx;
    end
endmodule
