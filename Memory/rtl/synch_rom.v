// this design will be implemented by BRAM on FPGA
// using synthezier directive (*rom_style = "block"*) to force the synthesis tool to
// implement this ROM using block RAM
// suitable for large ROM

module synch_rom
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10,
    parameter FILE = "rom_init.mem" // this .mem file is added in vivado
)
(
    input clk,
    input [ADDR_WIDTH-1:0] addr,
    output reg [DATA_WIDTH-1:0] dout
);

(*rom_style = "block"*) reg [DATA_WIDTH-1:0] rom [0:(1<<ADDR_WIDTH)-1];

initial begin
    $readmemb(FILE, rom);
end

always @(posedge clk) begin
    dout <= rom[addr];
end

endmodule