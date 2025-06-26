module register_we_0
(
	input clk,
	input rst_n,
	input we,
	input [7:0] d,
	output reg [7:0] q
);
always @ (posedge clk or negedge rst_n)
	if(~rst_n)
		q <= { 8 { 1'b0 } }; 
	else
		if(we) q <= d; 
endmodule
