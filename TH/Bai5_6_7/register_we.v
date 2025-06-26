module register_we
(
	input clk,
	input rst_n,
	input we,
	input [15:0] d,
	output reg [15:0] q
);
always @ (posedge clk or negedge rst_n)
	if(~rst_n)
		q <= { 16 { 1'b0 } }; 
	else
		if(we) q <= d; 
endmodule
