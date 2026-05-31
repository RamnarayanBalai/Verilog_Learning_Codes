module bram_synch_one_port
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10
)
(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

// synchronous read/write
always @(posedge clk) begin
    if (we) memory[addr] <= din; 
    dout <= memory[addr]; 
end

endmodule