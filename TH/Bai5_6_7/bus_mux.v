module bus_mux
(
	input [5:0] bSel,
	input [31:0] in0,
	input [31:0] in1,
	input [31:0] in2,
	input [31:0] in3,
	input [31:0] in4, 
	input [31:0] in5,
	output reg [31:0] out
);
always @*
	casez (bSel)
		default : out = in0;
		6'b?????1 : out = in0;
		6'b????10 : out = in1;
		6'b???100 : out = in2;
		6'b??1000 : out = in3;
		6'b?10000 : out = in4;
		6'b100000 : out = in5; 
	endcase
endmodule
