module swap_reg_file
#(parameter ADDR_WIDTH=7, DATA_WIDTH=8)
(
    input clk,reset_n,
    input swap,we,
    input [ADDR_WIDTH-1:0] address_A, address_B,
    input [ADDR_WIDTH-1:0] address_w, address_r,
    input [DATA_WIDTH-1:0] data_w,
    output [DATA_WIDTH-1:0] data_r
);

wire w;
wire [1:0] sel;
wire [ADDR_WIDTH-1:0] MUX_READ_f, MUX_WRITE_f;

register_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) reg_file_inst (
    .clk(clk),
    .we(w? 1'b1 : we),
    .address_w(MUX_WRITE_f),
    .address_r(MUX_READ_f),
    .data_w(w? data_r : data_w),
    .data_r(data_r)
);

swap_fsm swap_fsm_inst (
    .clk(clk),
    .rst_n(reset_n),
    .swap(swap),
    .w(w),
    .sel(sel)
);

mux_4x1_nbit #(.n(ADDR_WIDTH)) mux_read_inst (
    .w0(address_r),
    .w1(address_A),
    .w2(address_B),
    .w3(ADDR_WIDTH'('b0)),
    .s(sel),
    .f(MUX_READ_f)
);

mux_4x1_nbit #(.n(ADDR_WIDTH)) mux_write_inst (
    .w0(address_w),
    .w1(ADDR_WIDTH'('b0)),
    .w2(address_A),
    .w3(address_B),
    .s(sel),
    .f(MUX_WRITE_f)
);

endmodule