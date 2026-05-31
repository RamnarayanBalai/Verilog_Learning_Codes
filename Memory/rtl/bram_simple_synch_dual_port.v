// dedicated read and write ports
// this is a simple template for BRAM synchronous dual port design, which can be implemented by BRAM on FPGA

module bram_simple_synch_dual_port
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10
)
(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr_r, addr_w,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

// synch read and write
always @(posedge clk) begin
    if (we) memory[addr_w] <= din; 
    dout <= memory[addr_r]; 
end

endmodule