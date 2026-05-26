// fsm to swap
// two memory locations using 0x00 location as temporary storage

module swap_fsm (
    input clk,
    input rst_n,
    input swap,
    output w,
    output [1:0] sel
);

reg [1:0] state_reg, state_next;
localparam IDLE=0, READ_A=1, WRITE_B=2, WRITE_A=3;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        state_reg <= IDLE;
    else
        state_reg <= state_next;
end

always @(*) begin
    state_next = state_reg;
    case(state_reg)
        IDLE:   if(swap) state_next = READ_A;
                else    state_next = IDLE;
        READ_A: state_next = WRITE_B;
        WRITE_B: state_next = WRITE_A;
        WRITE_A: state_next = IDLE;
        default: state_next = IDLE;
    endcase
end

assign sel = state_reg;
assign w = (state_reg != IDLE);

endmodule