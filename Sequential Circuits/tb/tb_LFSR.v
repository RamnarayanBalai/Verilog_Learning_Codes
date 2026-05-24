module tb_LFSR;
reg clk, reset_n;
wire [2:0] Q;

LFSR #(.N(3)) dut(
    .clk(clk),
    .reset_n(reset_n),
    .Q(Q)
);

initial begin
    $dumpfile("tb_LFSR.vcd");
    $dumpvars(0, tb_LFSR);
    $monitor("At time %t, Q = %b", $time, Q);
end
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units period
end
initial begin
    reset_n = 0; // assert reset
    #10; // wait for 10 time units
    reset_n = 1; // deassert reset
    #100; // run the simulation for 100 time units
    $finish; // end the simulation
end

endmodule