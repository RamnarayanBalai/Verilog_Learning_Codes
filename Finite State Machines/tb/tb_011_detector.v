module tb_011_detector;

reg clk, reset_n, x;
wire y_moore, y_mealy, y_moore_3ff;

moore_011_detector moore_dut(
    .clk(clk),
    .reset_n(reset_n),
    .x(x),
    .y(y_moore)
);

mealy_011_detector mealy_dut(
    .clk(clk),
    .reset_n(reset_n),
    .x(x),
    .y(y_mealy)
);

moore_3ff_011_detector moore_3ff_dut(
    .clk(clk),
    .reset_n(reset_n),
    .x(x),
    .y(y_moore_3ff)
);

initial begin
    $dumpfile("tb_011_detector.vcd");
    $dumpvars(0, tb_011_detector);
    $monitor("At time %t, x = %b, y_moore = %b, y_mealy = %b, y_moore_3ff = %b", $time, x, y_moore, y_mealy, y_moore_3ff);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    reset_n = 0; 
    x = 0; 
    #10; 
    reset_n = 1; 
    
    // Apply a sequence of inputs to test the detectors
    repeat(50) begin
        #10 x = $random % 2;
    end

    #500 $finish;
end
endmodule