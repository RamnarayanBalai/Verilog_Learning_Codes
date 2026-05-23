`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 01:16:35
// Design Name: 
// Module Name: tb_timer_param
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


module tb_timer_param;

parameter FINAL_VAL=4999;

reg clk,reset_n,enable;
wire done;

timer_param #(.FINAL_VAL(FINAL_VAL)) t (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .done(done)
    );
    
    initial
    begin
        reset_n = 1'b1;
        #2 enable = 1'b1;
        reset_n = 1'b0;
        
        wait(done) #2 $finish;
    end
    
    always
    begin
        clk = 1'b0;
        #5 clk =1'b1;
        #5;
    end
endmodule
