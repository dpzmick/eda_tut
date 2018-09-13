module dut(
    input clk,
    input reset,
    output reg [3:0] f, g, h
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        f <= 5;
        g <= 8;
        h <= 4'hc;
    end else begin
        g <= f;
        h <= g;
        f <= h;
    end
end

endmodule
