// Counter implementation using FSM
module fsm_counter (
    input wire clk,
    input wire rst_n,
    input en,
    output [2:0] count
);

reg [2:0] state_reg, state_next;

localparam S0= 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        state_reg <= S0;
    else
        state_reg <= state_next;
end

always @(*) begin
    if(en) begin
        case(state_reg)
            S0: state_next = S1;
            S1: state_next = S2;
            S2: state_next = S3;
            S3: state_next = S4;
            S4: state_next = S5;
            S5: state_next = S6;
            S6: state_next = S7;
            S7: state_next = S0;
            default: state_next = S0;
        endcase
    end else begin
        state_next = state_reg; 
    end
end

assign count = state_reg;

endmodule