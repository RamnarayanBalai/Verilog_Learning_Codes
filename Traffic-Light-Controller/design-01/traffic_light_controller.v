// Traffic Light Controller
// for simplicity , we assume the that the clock is large(10s)
// so we dont use timer here

module traffic_light_controller (
    input clk, reset_n,
    input Sa,Sb,
    output reg Ra,Ya,Ga,
    output reg Rb,Yb,Gb
);

reg [3:0] state_reg, state_next;
localparam S0=1, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6,
            S7=7, S8=8, S9=9, S10=10, S11=11, S12=12;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        state_reg <= S0;
    else
        state_reg <= state_next;
end

always @(*) begin
    case (state_reg)
        S0: state_next = S1;
        S1: state_next = S2;
        S2: state_next = S3;
        S3: state_next = S4;
        S4: state_next = S5;
        S5: state_next = Sb ? S6 : S5;
        S6: state_next = S7;
        S7: state_next = S8;
        S8: state_next = S9;
        S9: state_next = S10;
        S10: state_next = S11; 
        S11: state_next = if(~Sa & Sb)
                        S11;
                    else if(Sa | ~Sb)
                        S12;
        S12: state_next = S0;
        default: state_next = S0;
    endcase
end

always @(*) begin
    Ra = 1'b0; Ya = 1'b0; Ga = 1'b0;
    Rb = 1'b0; Yb = 1'b0; Gb = 1'b0;
    case (state_reg)
        S0, S1, S2, S3, S4, S5: begin
            Ga = 1'b1; 
            Rb = 1'b1;
        end
        S6: begin
            Ya = 1'b1; 
            Rb = 1'b1;
        end
        S7, S8, S9, S10, S11: begin
            Ra = 1'b1; 
            Gb = 1'b1;
        end
        S12: begin
            Ra = 1'b1; 
            Yb = 1'b1;
        end
    endcase
end

endmodule