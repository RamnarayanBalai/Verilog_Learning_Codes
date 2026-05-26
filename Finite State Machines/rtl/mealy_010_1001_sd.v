// mealy 010 or 1001 detector
// overlapping sequences are allowed
module mealy_010_1001_sd(
    input clk, rst_n, x,
    output y
    );
    
    reg [2:0] state_reg, state_next;

    localparam S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011,
               S4 = 3'b100, S5 = 3'b101;

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
                    state_next = S4;
                else 
                    state_next = S1;
            S1: if(x) 
                    state_next = S2;
                else 
                    state_next = S1;
            S2: if(x)
                    state_next = S4; 
                else 
                    state_next = S3;
            S3: if(x)
                    state_next = S2;
                else
                    state_next = S5;
            S4: if(x)
                    state_next = S4; 
                else 
                    state_next = S3;
            S5: if(x)
                    state_next = S2; 
                else 
                    state_next = S1;

            default: state_next = state_reg;
        endcase
    end
    
    assign y = (state_reg == S2) && (x == 1'b0) || (state_reg == S5) && (x == 1'b1);
endmodule