module mux4(input in3, in2, in1, in0, select0, select1, output out);
wire w0, w1;
mux2 m0(in0, in1, select0, w0);
mux2 m1(in2, in3, select0, w1);
mux2 m2(w0, w1, select1, out);
endmodule