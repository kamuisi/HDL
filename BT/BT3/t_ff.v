module t_ff(input clk, rst, t, output q);
wire w0, w1;
xor (w0, t, q);
d_ff (w0, clk, rst, q, w1);
endmodule