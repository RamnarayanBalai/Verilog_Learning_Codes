//this rom design is implemeted by purily combinational logic on FPGA
// by using LUTs as memory, not block RAM(suitable for small ROM)

module rom_with_file
#(
    parameter DATA_WIDTH = 2,
    parameter ADDR_WIDTH = 3,
    parameter FILE = "rom_init.mem"
)
(
    input [ADDR_WIDTH-1:0] addr,
    output [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] rom [0:(1<<ADDR_WIDTH)-1];
// read rom
assign dout = rom[addr];

// preload rom content from file
initial begin
    $readmemb(FILE, rom);
    end

endmodule