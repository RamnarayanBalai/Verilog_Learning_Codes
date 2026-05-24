module moore_3ff_011_detector(
    input clk,
    input reset_n,
    input x,
    output y
);

reg [2:0] state, next_state;

always @(posedge clk, negedge reset_n)
begin
    if(!reset_n)
        state <= 3'b000;
    else
        state <= next_state;
end

always @(*)
begin
    next_state = {x, state[2:1]};
end

assign y = state[2] & state[1] & ~state[0]; // Output depends only on the current state, not on the input
endmodule
