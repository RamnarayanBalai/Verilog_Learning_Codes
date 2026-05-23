`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2026 00:53:45
// Design Name: 
// Module Name: adder_substractor_tb
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


module adder_substractor_tb();

    parameter n=4;
    reg [n-1:0] x,y;
    reg add_n;
    wire [n-1:0] s;
    wire cout, overflow;
    
    adder_substractor_signedNo #(.n(n)) uut(
        .x(x),
        .y(y),
        .add_n(add_n),
        .s(s),
        .cout(cout),
        .overflow(overflow)
    );
    
    initial
    begin
        #40 $finish;
    end
    
    initial 
    begin
        add_n =1'b0;
        x=4'd5;
        y=4'd6;
        
        #10
        add_n =1'b1;
        
        #10
        x=4'd6;
        y= -4'd3;
        
        #10
        add_n =1'b0;
        x= -4'd4;
        y= -4'd5;
        
        #10;
    end
    
    initial
    begin
        $monitor("time %3d: x=&d \t y=%d \t add_n=%1b \t result=%3d \t cout=%1b \t overflow= %1b",
        $time,x,y,add_n,s,cout,overflow);    
    end
endmodule
