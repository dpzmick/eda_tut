`include "ifc.v"

module test;

reg        clk;
reg [3:0]  op_code;
wire       write;
wire [1:0] source;

dut dut(
    .clk(clk),
    .op_code(op_code),
    .write(write),
    .source(source)
);

initial begin
    $dumpvars(0, test);
    clk = 0;

    #20 op_code = `WRITE_A;
    #20 op_code = `WRITE_B;
    #20 op_code = `READ_C;
    #20 op_code = 4'bzz1x;

    #20 $finish;
end

always #10 clk <= ~clk; // what happens if blocking?

endmodule
