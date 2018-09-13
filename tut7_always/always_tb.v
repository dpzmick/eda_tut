module test;

reg changes, clk;

always @(posedge clk) begin
    $display("@clock at %t", $time);
end

always begin
    $display("in always");
    #1;
end

always @(changes) begin
    // only triggers when changes changes
    $display("changes at %t, changes: %d", $time, changes);
end

initial begin

    // need to figure out when to do the delays and stuff
    #5;
    changes = 0;
    clk     = 0;

    #5 changes = 1;
    #5 changes = 0;

    #5 clk = 1;
    #5 clk = 0;

    #10 $finish;
end

endmodule
