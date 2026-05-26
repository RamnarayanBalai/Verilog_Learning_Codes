module debouncer_delayed (
    input clk,
    input rst_n,
    input noise_in,
    output debounced_out
);

wire timer_done, timer_reset;

debouncer_delayed_fsm fsm_inst (
    .clk(clk),
    .rst_n(rst_n),
    .noise_in(noise_in),
    .timer_done(timer_done),
    .timer_reset(timer_reset),
    .debounced_out(debounced_out)
);

timer_param #(.FINAL_VAL(1_999_999)) timer_inst ( // 20ms delay at 10ns clock period
    .clk(clk),
    .reset_n(~timer_reset),
    .enable(~timer_reset),
    .done(timer_done)
);

endmodule
