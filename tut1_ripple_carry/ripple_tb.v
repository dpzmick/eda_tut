module test;
    reg        clk, reset;
    wire [3:0] q;

    ripple_carry_counter rcc(q, clk, reset);

    // actual test code here
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, test); // wtf is this

        clk = 1'b0;

        // reset the counter, let it run, the reset again
        reset = 1'b1;

        #10 reset = 1'b0;

        #200;

        #10 reset = 1'b0;

        #50;
        $finish;
    end

    // free-running clock
    always #5 clk = ~clk;
endmodule
