module moore(input I, clk, output reg Y);
reg [1:0] current_state;
always @(posedge clk)
case(current_state)
	0 : begin
				case(I)
					0: current_state <= 1;
					1: current_state <= 0;
				endcase
				Y <= 0;
			end
	1 : begin
				case(I)
					0: current_state <= 1;
					1: current_state <= 2;
				endcase
				Y <= 0;
			end
	2 : begin
				case(I)
					0: current_state <= 3;
					1: current_state <= 0;
				endcase
				Y <= 0;
			end
	3 : begin
				case(I)
					0: current_state <= 1;
					1: current_state <= 0;
				endcase
				Y <= 1;
			end
endcase
endmodule
				