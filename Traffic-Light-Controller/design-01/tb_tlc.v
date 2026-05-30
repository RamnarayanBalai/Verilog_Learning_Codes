module tb_tlc;
reg clk, reset_n;
reg Sa, Sb;
wire Ra, Ya, Ga;
wire Rb, Yb, Gb;

traffic_light_controller tlc (
    .clk(clk), .reset_n(reset_n),
    .Sa(Sa), .Sb(Sb),
    .Ra(Ra), .Ya(Ya), .Ga(Ga),
    .Rb(Rb), .Yb(Yb), .Gb(Gb)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Test 1: Reset functionality - verify initial state
    reset_n = 1; Sa = 0; Sb = 0; #10;
    reset_n = 0; #10;
    $display("Test 1: After reset - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    // Test 2: Normal operation - A green (S0-S5), B red
    #100;
    $display("Test 2: A green phase - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    // Test 3: Sb activated during A green - transition to A yellow
    Sb = 1; #50;
    $display("Test 3: A yellow phase (Sb=1) - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    Sb = 0; #50;
    $display("Test 3b: A red, B green - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    // Test 4: Sa activated during B green - transition to B yellow
    Sa = 1; #50;
    $display("Test 4: B yellow phase (Sa=1) - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    Sa = 0; #50;
    $display("Test 4b: Back to A green - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    // Test 5: Both signals inactive - verify cycling back to A green
    #150;
    $display("Test 5: Cycle complete - Ra=%b, Ya=%b, Ga=%b, Rb=%b, Yb=%b, Gb=%b", Ra, Ya, Ga, Rb, Yb, Gb);
    
    $stop;
end