`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2026 00:47:41
// Design Name: 
// Module Name: compare_storage_elements_tb
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


module compare_storage_elements_tb();
    
    reg D,clk;
    wire Q_Dlatch, Q_DFF_neg, Q_DFF;
    
    compare_storage_elements uut(
        .D(D),
        .clk(clk),
        .Qa(Q_Dlatch),
        .Qb(Q_DFF_neg),
        .Qc(Q_DFF)
    );
    
    localparam T=20; //clk period
    //clk generating
    always
    begin
        clk=1'b0;
        #(T/2)
        clk = 1'b1;
        #(T/2);
    end
    
    initial 
    begin
        D=1'b1;
        #(2*T) 
        D= 1'b0;
        
        @(posedge clk);
        D=1'b1;
        
        #2 D=1'b0;
        #4 D=1'b1;
        #4 D=1'b0;
        
        repeat(2) @(negedge clk);
        D = 1'b1;
         #40 $finish;
    end
    
   
endmodule
