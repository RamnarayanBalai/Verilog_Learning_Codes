`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2026 22:57:06
// Design Name: 
// Module Name: pwm_basic_tb
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


module pwm_basic_tb;

parameter R=8;

reg clk,reset_n;
reg [R-1:0] duty;
wire pwm_out;

pwm_basic #(.R(R)) pwm (
        .clk(clk),
        .reset_n(reset_n),
        .duty(duty),
        .pwm_out(pwm_out)
    );

initial
begin
    clk = 0;
    reset_n = 0;
    duty = 0;

    #20 reset_n = 1;

    duty = (2**R)/4;
    repeat(2*2**R) @(posedge clk);

    duty = (2**R)/2;
    repeat(2*2**R) @(posedge clk);

    duty = (3*(2**R))/4;
    repeat(2*2**R) @(posedge clk);

    $finish;
end

always #5 clk = ~clk;

endmodule
