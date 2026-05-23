`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2026 23:00:29
// Design Name: 
// Module Name: mux_generic_1bit
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


module mux_generic_1bit
    #(parameter INS=100)(
        input [INS-1:0] w,
        input [$clog2(INS)-1:0] s,
        output reg f
    );
        
        integer k;
        
        always @(w,s)
        begin: Generic_Mux
        f='bx;
            for(k=0;k<INS;k=k+1)
                if(k==s) f=w[k];
        end
    
endmodule
