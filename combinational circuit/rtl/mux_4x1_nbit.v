`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2026 22:14:07
// Design Name: 
// Module Name: mux_4x1_nbit
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


module mux_4x1_nbit
    #(parameter n=4)
    (
    input [n-1:0] w3,w2,w1,w0,
    input [1:0] s,
    output reg [n-1:0] f
    );
    
    always @(*)
    begin
        //f = s[1]?(s[0]?w3:w2):(s[0]?w1:w0);
        
//        // priority mux
//        if(s== 2'b11)
//            f=w3;
//        else if(s==2'b10)
//             f=w2;
//        else if(s==2'b01)
//             f=w1;
//        else if(s==2'b00)
//            f=w0;
//        else
//            f= 'bx;

        case(s)
            2'b00: f=w0;
            2'b01: f=w1;
            2'b10: f=w2;
            2'b11: f=w3;
            default: f='bx;
        endcase
    end
    
endmodule
