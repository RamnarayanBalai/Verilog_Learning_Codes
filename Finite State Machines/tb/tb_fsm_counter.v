module tb_fsm_counter;
reg clk, rst_n, en;
wire [2:0] count;

fsm_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    rst_n = 0; 
    en = 0; 
    #10 rst_n = 1; 

    #10 en = 1;  
    #200 en = 0;
    
    # 20 $finish;
end

initial begin
    $monitor("Time: %0t | rst_n: %b | en: %b | count: %b", $time, rst_n, en, count);
end
endmodule