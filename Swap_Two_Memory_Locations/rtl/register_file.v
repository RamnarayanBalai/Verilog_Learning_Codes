module register_file 
#(parameter ADDR_WIDTH=7, DATA_WIDTH=8)
(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] address_w, address_r,
    input [DATA_WIDTH-1:0] data_w,
    output [DATA_WIDTH-1:0] data_r
);

reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

// synchronous write
always @(posedge clk) begin
    if (we) begin
        memory[address_w] <= data_w;
    end
end

// asynchronous read
assign data_r = memory[address_r];

endmodule