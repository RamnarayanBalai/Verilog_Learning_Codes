module tb_101_detector;

reg clk, rst_n, x;
wire y_moore, y_mealy;

moore_101_detector moore_dut(
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .y(y_moore)
);

mealy_101_detector mealy_dut(
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .y(y_mealy)
);

initial begin
    $dumpfile("tb_101_detector.vcd");
    $dumpvars(0, tb_101_detector);
    $monitor("At time %t, x = %b, y_moore = %b, y_mealy = %b", $time, x, y_moore, y_mealy);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    rst_n = 0; 
    x = 0; 
    #10; 
    rst_n = 1; 
    
    // Apply a sequence of inputs to test the detectors
    repeat(50) begin
        #10 x = $random % 2;
    end

   $finish;
end
endmodule