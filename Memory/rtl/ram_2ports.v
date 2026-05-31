// this ram is implemented by flip-flops(LUTS as memory), not block RAM
module ram_2ports
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)
(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] r_addr,
    input [ADDR_WIDTH-1:0] w_addr,
    input [DATA_WIDTH-1:0] w_data,
    output [DATA_WIDTH-1:0] r_data
);

reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

// synchronous write
always @(posedge clk) begin
    if (we) begin
        memory[w_addr] <= w_data;
    end
end

// asynchronous read
assign r_data = memory[r_addr];

endmodule