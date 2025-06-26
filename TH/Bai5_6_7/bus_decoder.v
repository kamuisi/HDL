module bus_decoder
(
	input [31:0] bAddr,
	output [5:0] bSel
);
	assign bSel[0] = ( bAddr [ 15:14 ] == 2'b00);
	assign bSel[1] = ( bAddr [ 15:4 ] == 12'h7f0);
	assign bSel[2] = ( bAddr [ 15:4 ] == 12'h7f1);
	assign bSel[3] = 1'b0;
	assign bSel[4] = 1'b0;
	assign bSel[5] = 1'b0; 
endmodule
