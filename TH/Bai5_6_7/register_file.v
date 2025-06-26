module register_file
(
	input clk,
	input [4:0] A1,
	input [4:0] A2,
	input [4:0] A3,
	input [31:0] WD3,
	input WE3,
	output [31:0] RD1,
	output [31:0] RD2
);
	reg [31:0] RF [31:0];
	assign RD1 = (A1 != 0) ? RF[A1] : 32'b0;
	assign RD2 = (A2 != 0) ? RF[A2] : 32'b0;
	always @ (posedge clk)
		if(WE3) RF[A3] <= WD3; 
endmodule
