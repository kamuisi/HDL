module mux2(input in0, in1, select, output out);
wire s0, w0, w1;
not(s0, select);
and (w0, s0, in0), (w1, select, in1);
or (out, w0, w1);
endmodule