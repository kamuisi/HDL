module register
(
	input clk,
	input rst,
	input [31:0] pc_next,
	output reg [31:0] pc
);

always @(posedge clk or negedge rst)
	if(~rst)
		pc <= {32{1'b0}};
	else
		pc <= pc_next;
endmodule
