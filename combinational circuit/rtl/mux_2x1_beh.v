`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 23:28:53
// Design Name: 
// Module Name: mux_2x1_beh
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


module mux_2x1_beh(
    input x1,x2,sel,
    output reg f
    );
    
    always @(x1,x2,sel)
    begin
        /*if(sel)
        begin
            f=x1;
        end  
         else 
         begin 
            f=x2;
         end*/
         case(sel)
         0: f=x1;
         1: f=x2;
         endcase
    end
endmodule
