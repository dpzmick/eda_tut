`define MY_NUMBER 5
`define MY_STRING "Hello world"
`define ADD2PLUS2 2 + 2

module test;
    initial begin
        $display("My number is %d", `MY_NUMBER);
        $display("My string is %s", `MY_STRING);
        $display("My number is %d", `ADD2PLUS2);
    end
endmodule
