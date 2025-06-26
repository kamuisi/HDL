module BT3(input A, B, C, clk, rst, output Q);
wire [7:0] w;
wire a0, a1, a2, a3;
decode3to8 (A, B, C, w);

or (a0, w[7], w[6]);
and (a1, w[4], ~w[3]);
and (a2, w[0], w[1]);

mux4 (a0, w[5], a1, w[2], a2, a2, a3);

t_ff (clk, rst, a3, Q);
endmodule