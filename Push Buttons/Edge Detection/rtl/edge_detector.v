module edge_detector (
    input clk,
    input rst_n,
    input input_signal,
    output rising_edge,
    output falling_edge,
    output _edge
);

reg state_reg, state_next;

localparam S0 = 1'b0, S1 = 1'b1;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        state_reg <= S0;
    else
        state_reg <= state_next;
end

always @(*) begin
    state_next = state_reg;
    case(state_reg)
        S0: state_next = input_signal ? S1 : S0;
        S1: state_next = input_signal ? S1 : S0;
        default: state_next = S0;
    endcase
end

assign rising_edge = (state_reg == S0) & input_signal;
assign falling_edge = (state_reg == S1) & ~input_signal;
assign _edge = rising_edge | falling_edge;

endmodule