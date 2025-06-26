module gpio
(
	input bWrite,
	input bSel,
	input clk,
	input rst_n,
	input [15:0] gpioInput,
	input [31:0] bAddr,
	input [31:0] bWData,
	output reg [31:0] bRData,
	output [15:0] gpioOutput
);
	wire [16 - 1:0] gpioIn;
	wire gpioOutWe;
	wire [16 - 1:0] gpioOut;
	assign gpioOut = bWData [16 - 1:0];
	assign gpioOutWe = bSel & bWrite & (bAddr[3:0] == 4'h4);
	register_we reg_in (clk, rst_n, 1, gpioInput, gpioIn);
	register_we reg_out (clk, rst_n, gpioOutWe, gpioOut, gpioOutput);
	always @ (*)
		case(bAddr[3:0])
			default : bRData = { { 16{1'b0}}, gpioIn };
			4'h0 : bRData = { { 16{1'b0}}, gpioIn };
			4'h1 : bRData = { { 16{1'b0}}, gpioOutput }; 
		endcase
endmodule
