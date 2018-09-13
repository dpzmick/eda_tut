module shift(
    input  clk,
    input  reset,
    input  data_in,
    output data_out
);
    parameter DEPTH = 3; /* how many clocks to delay the data_in */

    wire [DEPTH:0] connect_wire;

    /* these are just wire connections? */
    assign data_out        = connect_wire[DEPTH];
    assign connect_wire[0] = data_in;

    /* This is easier in systemverilog I think */
    genvar i;
    generate
        for (i=1; i <= DEPTH; i=i+1) begin
            dff DFF(clk, reset, connect_wire[i-1], connect_wire[i]);
        end
    endgenerate

endmodule

module dff(
    input      clk,
    input      reset,
    input      d,
    output reg q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q = 1'b0;
        end else begin
            q = d; /* creates a flip flop */
        end
    end

endmodule

module test;

reg clk;
reg reset;
reg data_in;
wire data_out;

shift shifty(
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out));

initial begin
    $dumpvars(0, test);
    reset = 1;
    clk   = 0;

    #1 reset = 0;
    data_in = 0;

    #20 data_in = 1;

    #20 data_in = 0;

    #100 $finish;
end

always #10 clk <= ~clk;

endmodule
