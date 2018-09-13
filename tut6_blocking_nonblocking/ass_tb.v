// blocking:      =
// non-blocking: <=

module test;

// reg vs wire, still confused
reg        clk;
reg        reset;
wire [3:0] f, g, h;

dut dut(
    .clk(clk),
    .reset(reset),
    .f(f),
    .g(g),
    .h(h)
);

initial begin
    $dumpvars(0, test);

    clk = 0;
    reset <= 1;
    reset <= #5 0;

    #25 $finish;

end

// note, not in the initial block
always #2 clk = ~clk;

endmodule
