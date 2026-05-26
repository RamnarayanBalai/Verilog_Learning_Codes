module tb_010_1001_sd;
reg clk, rst_n, x;
wire y;

string test_sequence =   "00101001000100110";
string expected_output = "00010101100010100";
string matched[16:0];
integer i;

mealy_010_1001_sd uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    rst_n = 0; 
    x = 0; 
    #10 rst_n = 1; 

    for(i = 0; i < 17; i = i + 1) begin
        x = test_sequence[i] - "0"; 
        #10;
        matched[i] = (y == (expected_output[i] - "0")) ? "PASS" : "FAIL";
        $display("Time: %0t | x: %b | y: %b | Expected y: %b, Match: %s", $time, x, y, expected_output[i] - "0", matched[i]);
    end

    #20 $finish;
end
endmodule
