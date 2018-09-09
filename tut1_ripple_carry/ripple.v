// toggle flip flop
module tff (q, clk, reset);
    output reg q; // needs to be reg because why?
    input  clk, reset;

    always @(posedge reset or posedge clk) begin
        if (reset) begin
            q <= 1'b0; // non-blocking assignment
        end else begin
            q <= ~q;
        end
    end
endmodule

module ripple_carry_counter (q, clk, reset);
    output [3:0] q; // doesn't need to be reg because here we are just connecting wires
    input        clk, reset;

    tff tff0(q[0], clk,  reset);
    tff tff1(q[1], q[0], reset);
    tff tff2(q[2], q[1], reset);
    tff tff3(q[3], q[2], reset);

endmodule
