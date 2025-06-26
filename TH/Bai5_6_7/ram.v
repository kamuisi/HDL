module ram
(
	input clk,
	input [31:0] A,
	input WE,
	input [31:0] WD,
	output [31:0] RD
);
	reg [31:0] ram [64 - 1:0];
	assign RD = ram [A[31:2]];
	always @(posedge clk)
		if (WE)
			ram[A[31:2]] <= WD; 
endmodule
