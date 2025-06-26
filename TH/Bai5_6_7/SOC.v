module SOC
(
	input clk,
	input rst_n,
	input [15:0] gpioInput,
	output [15:0] gpioOutput,
	output pwmOutput
);
	wire [31:0] bAddress;
	wire [31:0] bRData0;
	wire [31:0] bRData1;
	wire [31:0] bRData2;
	wire [31:0] bRData;
	wire [31:0] bWData;
	wire [5:0] bSel;
	wire bWrite;
	
	mips cpu_0(clk, rst_n, bRData, bWData, bAddress, bWrite);
	bus bus_0(bAddress, bRData0, bRData1, bRData2, bRData, bSel);
	IO_Mem mem_0(clk, bAddress, bSel[0], bWrite, bWData, bRData0);
	gpio gpio_0(bWrite, bSel[1], clk, rst_n, gpioInput, bAddress, bWData, bRData1, gpioOutput);
	pwm pwm_0(bSel[2], bWrite, clk, rst_n, bWData, bRData2, pwmOutput);
	
endmodule //2 chu kỳ xong 1 lệnh
