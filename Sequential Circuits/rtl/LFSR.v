// LFSR-linear feedback shift register
// goes through a sequence of states, with the next state being a linear function of the current state
// used for pseudo-random number generation, scrambling, and error detection
// the maximum length of the sequence is 2^n - 1, where n is the number of bits in the register
// the feedback function is determined by the taps, which are the bits that are XORed together

module LFSR
#(parameter N=3)
(
    input clk,
    input reset_n,
    output [N-1:0] Q
);
reg [N-1:0] Q_reg,Q_next;
wire feedback;

assign feedback = Q_reg[1] ^ Q_reg[2];

always @(posedge clk or negedge reset_n)
begin
    if(!reset_n)
        Q_reg <= 'd1; // LFSR should not start with all bits as 0 or all, as it will get stuck in that state
    else
        Q_reg <= Q_next;
end
always @(Q_reg, feedback)begin
    Q_next = {Q_reg[N-2:0], feedback}; 
end

assign Q = Q_reg;

endmodule