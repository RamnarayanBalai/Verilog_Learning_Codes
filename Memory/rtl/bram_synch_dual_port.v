// BRAM Synchronous Dual Port(each port has read and write)
// BRAM: Block RAM, a type of memory that is typically used in FPGA designs.
// vivado will implement this specific template design by BRAM on FPGA


module bram_synch_dual_port
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10
)
(
    input clk,
    input we_a, we_b,
    input [ADDR_WIDTH-1:0] addr_a, addr_b,
    input [DATA_WIDTH-1:0] din_a, din_b,
    output reg [DATA_WIDTH-1:0] dout_a, dout_b
);

reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

// Port A: synchronous read/write
always @(posedge clk) begin
    if (we_a) memory[addr_a] <= din_a;
    dout_a <= memory[addr_a];
end

// Port B: synchronous read/write
always @(posedge clk) begin
    if (we_b) memory[addr_b] <= din_b;
    dout_b <= memory[addr_b];
end

endmodule