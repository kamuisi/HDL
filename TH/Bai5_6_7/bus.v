module bus
(
	input [31:0] bAddr,
	input [31:0] bRData0,
	input [31:0] bRData1,
	input [31:0] bRData2,
	output [31:0] bRData,
	output [5:0] bSel
);
bus_decoder decoder
(
	.bAddr ( bAddr ),
	.bSel ( bSel )
);
bus_mux mux
(
	.bSel ( bSel ),
	.out ( bRData ),
	.in0 ( bRData0 ),
	.in1 ( bRData1 ),
	.in2 ( bRData2 ),
	.in3 ( 32'b0 ),
	.in4 ( 32'b0 ),
	.in5 ( 32'b0 )
); 
endmodule
