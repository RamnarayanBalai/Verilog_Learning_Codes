module tb_swap;
reg clk, reset_n, swap, we;
reg [6:0] address_A, address_B, address_w, address_r;
reg [7:0] data_w;
wire [7:0] data_r;

swap_reg_file uut (
    .clk(clk),
    .reset_n(reset_n),
    .swap(swap),
    .we(we),
    .address_A(address_A),
    .address_B(address_B),
    .address_w(address_w),
    .address_r(address_r),
    .data_w(data_w),
    .data_r(data_r)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    reset_n = 0; swap = 0; we = 0;
    address_A = 7'b0000010; address_B = 7'b0000011; 
    #10 reset_n = 1; 

    // Write values to A and B
    we = 1; address_w = address_A; data_w = 8'hAA; #10;
    address_w = address_B; data_w = 8'h55; #10;

    // Swap A and B
    swap = 1; #10;

    // Read back values to verify swap
    swap = 0; we = 0;
    address_r = address_A; #10;
    $strobe("Read from A: %h (Expected: 55)", data_r);
    
    address_r = address_B; #10;
    $strobe("Read from B: %h (Expected: AA)", data_r);

    #20 $finish;
end
endmodule