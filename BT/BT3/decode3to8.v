module decode3to8(input A0, A1, A2, output [7:0] z);
and (z[0], ~A2, ~A1, ~A0);
and (z[1], ~A2, ~A1, A0);
and (z[2], ~A2, A1, ~A0);
and (z[3], ~A2, A1, A0);
and (z[4], A2, ~A1, ~A0);
and (z[5], A2, ~A1, A0);
and (z[6], A2, A1, ~A0);
and (z[7], A2, A1, A0);
endmodule