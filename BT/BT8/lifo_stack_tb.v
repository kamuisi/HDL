`timescale 1ns / 1ps

module lifo_stack_tb;


    reg clk;
    reg rst;
    reg push;
    reg pop;
    reg [31:0] data_in;


    wire [31:0] out;

    lifo_stack uut (
        .clk(clk),
        .rst(rst),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        push = 0;
        pop = 0;
        data_in = 0;


        #10;
        rst = 0;


        repeat (4) begin
            @(posedge clk);
            push = 1;
            data_in = $random;
        end


        @(posedge clk);
        push = 0;
        data_in = 0;


        #20;


        repeat (4) begin
            @(posedge clk);
            pop = 1;
        end


        @(posedge clk);
        pop = 0;


        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | push=%b, pop=%b, data_in=%h, out=%h", $time, push, pop, data_in, out);
    end

endmodule
