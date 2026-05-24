//direct behavioral description of moore machine for 101 detector
module moore_101_detector
    (
    input clk, rst_n, x,
    output y
    );
    
    reg [1:0] state_reg, state_next;

    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
            state_reg <= S0;
        else
            state_reg <= state_next;
    end

    always @(*)
    begin
        state_next = state_reg;
        case(state_reg)
            S0: if(x) 
                    state_next = S1;
                else 
                    state_next = S0;
            S1: if(x) 
                    state_next = S1;
                else 
                    state_next = S2;
            S2: if(x)
                    state_next = S3; 
                else 
                    state_next = S0;
            S3: if(x)
                    state_next = S1;
                else
                    state_next = S2;

            default: state_next = state_reg;
        endcase
    end
    
    assign y = (state_reg == S3); // Output depends only on the current state

endmodule