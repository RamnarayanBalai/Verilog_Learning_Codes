module tb_debouncer_delayed;
reg clk, rst_n, noise_in;
wire debounced_out;

debouncer_delayed uut (
    .clk(clk),
    .rst_n(rst_n),
    .noise_in(noise_in),
    .debounced_out(debounced_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; 
end

initial begin
    $monitor("Time: %0t | noise_in: %b | debounced_out: %b", $time, noise_in, debounced_out);
end

initial begin
    rst_n = 0; 
    noise_in = 0; 
    #10 rst_n = 1; 

    // ===== TEST 1: Input stable for 25ms (>20ms) - Output should change =====
    #50_000000 noise_in = 1; // Press button
    #25_000000; // Wait 25ms - output should now be 1
    
    // ===== TEST 2: Noise test - Short 5ms pulse within settling (should be rejected) =====
    #10_000000 noise_in = 0; // Attempt to release (after 35ms total, but during settle)
    #5_000000;  // Only hold for 5ms (less than 20ms debounce window)
    noise_in = 1; // Toggle back to 1
    #20_000000; // This 5ms pulse should NOT affect output - output stays 1
    
    // ===== TEST 3: Stable release for 25ms - Output should change to 0 =====
    #10_000000 noise_in = 0; // Release button (now stable)
    #25_000000; // Wait 25ms - output should now be 0
    
    // ===== TEST 4: Rapid noise pattern (10 toggles, each 2ms) - Output should stay 0 =====
    #20_000000; // Wait for stability
    repeat(10) begin
        #2_000000 noise_in = 1;  // 2ms pulse to 1
        #2_000000 noise_in = 0;  // 2ms pulse to 0
    end
    #20_000000; // Wait after noise pattern - output should still be 0
    
    // ===== TEST 5: Press button and hold for 30ms - Output should change to 1 =====
    #50_000000 noise_in = 1; // Press
    #30_000000; // Hold for 30ms - output should be 1
    
    // ===== TEST 6: Noisy release (toggle 4ms intervals, total 16ms) - Output should stay 1 =====
    #10_000000;
    noise_in = 0; // Release
    #4_000000;
    noise_in = 1; // Noise spike back to 1
    #4_000000;
    noise_in = 0; // Noise spike to 0
    #4_000000;
    noise_in = 1; // Noise spike back to 1
    #4_000000;
    noise_in = 0; // Noise spike to 0 (total 16ms of noise)
    #25_000000; // Wait for clean settle - output should now be 0
    
    // ===== TEST 7: Edge case - Input at exactly 20ms boundary =====
    #30_000000; 
    noise_in = 1; // Press
    #20_000000; // Wait exactly 20ms (at boundary)
    #5_000000;  // Output should change to 1 after crossing 20ms threshold
    
    // ===== TEST 8: Release and clean finish =====
    #10_000000;
    noise_in = 0;
    #25_000000; // Wait for stable output
    
    #50 $finish;
end

endmodule