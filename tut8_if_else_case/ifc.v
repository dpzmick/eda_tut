`define WRITE_A 4'b0001
`define WRITE_B 4'b0010
`define READ_C  4'b1011

module dut(
    input       clk,
    input [3:0] op_code,

    output reg       write,
    output reg [1:0] source
);

always @(posedge clk) begin
    case (op_code)
        `WRITE_A: begin
            write  <= 1'b1;
            source <= 2'b00;
        end

        // as an example, the 'z' or a '?' is a 'don't care'
        // basic pattern matching? neat, might only be true in a 'casez'?
        // 4'b000z: begin
        //     // ....
        // end

        `WRITE_B: begin
            write  <= 1'b1;
            source <= 2'b10;
        end

        `READ_C: begin
            write  <= 1'b0;
            source <= 2'b11;
        end

        default: begin
            /* set to invalid */
            write  <= 1'bx;
            source <= 2'bxx;
        end
    endcase

    // casex treats 'x' as a don't care as well, so uninitialized values are
    // treated as a don't care, try to avoid that probably, that seems like
    // a mess

    // alternative construction, functionally equiv.
    // case (1)
    //     (op_code == `WRITE_A): begin
    //     end
    // endcase
end

endmodule
