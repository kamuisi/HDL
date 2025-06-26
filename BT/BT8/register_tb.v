`timescale 1ns / 1ps

module register_tb;

    reg clk;
    reg rst;
    reg wr_en;
	 reg r_en;
    reg [31:0] data_in;

    wire [31:0] out;

    register uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
		  .r_en(r_en),
        .data_in(data_in),
        .out(out)
    );


    always #5 clk = ~clk;  

    initial begin
        clk = 0;
        rst = 1;
        wr_en = 0;
		  r_en = 0;
        data_in = 0;

        #10;
        rst = 0;

        repeat (4) begin
            @(posedge clk);
            wr_en = 1;
            data_in = $random;
        end

        @(posedge clk);
        wr_en = 0;
        data_in = 0;

        #20;
			r_en = 1;
        #100;

        $finish;
    end

endmodule
