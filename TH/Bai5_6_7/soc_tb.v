module soc_tb();

	reg clk;
	reg rst_n;
	reg [15:0] gpioInput;
	wire [15:0] gpioOutput;
	wire pwmOutput;
	
	SOC blabla(clk, rst_n, gpioInput, gpioOutput, pwmOutput);
	
	initial begin
		clk = 0;
		rst_n = 1;
		gpioInput = 16'b0;
		forever #5 clk = ~clk;
	end
	
	initial begin
        rst_n = 0;
		  #10 rst_n = 1;
        gpioInput = 16'hAAAA;

        #50;

        gpioInput = 16'h5555;

        #200;

        $stop;
    end
endmodule
