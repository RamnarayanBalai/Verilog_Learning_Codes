`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 00:04:47
// Design Name: 
// Module Name: pwm_improved
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


module pwm_improved
#(parameter R=8, FINAL_VAL= 128)
(
    input clk, 
    input reset_n,
    input [R:0] duty,
    output pwm_out
);

reg [R-1:0] Q_reg, Q_next;
reg D;
wire enable;

timer_param #(.FINAL_VAL(FINAL_VAL)) t(
    .clk(clk),
    .reset_n(reset_n),
    .enable(1),
    .done(enable)
    );

always @(posedge clk or negedge reset_n)
begin
    if(!reset_n)
        Q_reg <= 'b0;
    else
        Q_reg <= Q_next;
end

always @(*)
begin
    if(enable)
        Q_next = Q_reg + 1'b1;
    else Q_next = Q_reg;
end

always@(posedge clk or negedge reset_n)
begin 
    if(!reset_n) D<=1'b0;
    else D <= (duty<Q_reg);
end

assign pwm_out = D;

endmodule