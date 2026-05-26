`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module univ_shift_reg
    #(parameter N=4)
    (
        input clk,
        input reset_n, //asynchronous
        input MSB,LSB,
        input [N-1:0] I,
        input [1:0] s,
        output [N-1:0] Q
    );
    /*
        Functionality of universal Shift Register
        
        S1  S0  Behav
        
        0   0   No change
        0   1   shift right
        1   0   shift left
        1   1   parallel load
        
    */    
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    // comb logic
    always @(*)
    begin
        case(s)
            2'b00:     Q_next = Q_reg;
            2'b01:     Q_next = {MSB,Q_reg[N-1:1]}; //right shift
            2'b10:     Q_next = {Q[N-2:0],LSB}; // left shift
            2'b11:     Q_next = I;
            default:   Q_next = Q_reg;
        endcase
    end
    //output logic
    assign Q = Q_reg;
    assign MSB = Q_reg[N-1];
    assign LSB = Q_reg[0];
endmodule

