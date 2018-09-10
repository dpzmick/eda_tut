module test;

    reg  [3:0] a, b;
    reg        c_in;

    wire [3:0] s;
    wire       c_out;

    full_adder4 dut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );

    initial begin
        $dumpvars(0, test);

        #5;

        a = 0;
        b = 0;
        c_in = 0;

        #5

        a = 2;
        b = 3;

        #5;
    end

endmodule
