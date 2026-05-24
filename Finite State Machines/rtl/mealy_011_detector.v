module mealy_011_detector(
    input clk,
    input reset_n,
    input x,
    output y
);

reg [1:0] state, next_state;

always @(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        state <= 2'b00;
    else
        state <= next_state;
end

always @(*)
begin
    next_state[1] = ~state[1] & state[0] & x;
    next_state[0] = (~state[1] & ~x) | (~state[0] & ~x);
end

assign y = state[1] & ~state[0] & x; // Output depends on both the current state and the input, characteristic of a Mealy machine
endmodule
