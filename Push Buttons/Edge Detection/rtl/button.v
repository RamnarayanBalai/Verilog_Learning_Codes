module button (
    input clk,
    input rst_n,
    input noise_in,
    output debounced_out,
    output rising_edge,
    output falling_edge,
    output _edge
);

// adding synchronizer
synchronizer #(.STAGES(2)) synchronizer_inst (
    .clk(clk),
    .reset_n(rst_n),
    .D(noise_in),
    .Q(noise_sync)
);

debouncer_delayed debouncer_inst (
    .clk(clk),
    .rst_n(rst_n),
    .noise_in(noise_sync),
    .debounced_out(debounced_out)
);

edge_detector edge_detector_inst (
    .clk(clk),
    .rst_n(rst_n),
    .input_signal(debounced_out),
    .rising_edge(rising_edge),
    .falling_edge(falling_edge),
    ._edge(_edge)
);

endmodule