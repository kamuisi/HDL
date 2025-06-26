module pwm
(
	input bSel,
	input bWrite,
	input clk,
	input rst_n,
	input [31:0] bWData,
	output [31:0] bRData,
	output pwmOutput
);
wire [7:0] comp;
wire [7:0] count;
wire [7:0] countNext = count + 1;
assign bRData = { { 24 { 1'b0 }}, comp };
wire compWe = bSel & bWrite;
assign pwmOutput = (count > comp);
register_we_0 r_Compare(clk, rst_n, compWe, bWData[7:0], comp);
register_we_0 r_Counter (clk, rst_n, 1, countNext, count); 
endmodule
