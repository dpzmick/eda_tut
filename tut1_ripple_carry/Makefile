all: dump.vcd

dump.vcd: ripple
	vvp ripple

ripple: ripple.v ripple_tb.v
	iverilog ripple.v ripple_tb.v -Wall -o ripple
