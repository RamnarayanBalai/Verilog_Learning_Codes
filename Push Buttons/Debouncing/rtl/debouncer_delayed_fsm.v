//this fsm  used to generate the stable debounce output from
// the noisy input of the push button using the delayed debouncing
// use timer to detect the stable input of button for a certain time duration

module debouncer_delayed_fsm (
    input clk,
    input rst_n,
    input noise_in,
    input timer_done,
    output timer_reset,
    output debounced_out
);

reg [1:0] state_reg, state_next;
localparam S0=0, S1=1, S2=2, S3=3;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        state_reg <= S0;
    else
        state_reg <= state_next;
end

always @(*) begin
    state_next = state_reg;
    case(state_reg)
        S0: begin
            if (noise_in) 
                state_next = S1;
            else
                state_next = S0;
        end
        S1: begin
            if (~noise_in) 
                state_next = S0; 
            else if (noise_in & ~timer_done)
                state_next = S1; 
            else if (noise_in & timer_done) 
                state_next = S2; 
        end
        S2: begin
            if (~noise_in) 
                state_next = S3; 
            else
                state_next = S2;
        end
        S3: begin
            if (noise_in) 
                state_next = S2; 
            else if (~noise_in & ~timer_done)
                state_next = S3; 
            else if (~noise_in & timer_done)
                state_next = S0; 
        end
        default: state_next = S0;
    endcase
end

assign timer_reset = (state_reg == S0 || state_reg == S2) ? 1'b1 : 1'b0;
assign debounced_out = (state_reg == S2 || state_reg == S3) ? 1'b1 : 1'b0;

endmodule