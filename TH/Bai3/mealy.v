module mealy(input I, clk, output reg Y);
reg [1:0] current_state;
always @(posedge clk)
case(current_state)
	0 : begin
				case(I)
					0: begin	current_state <= 1; Y <= 0; end
					1: begin Y <= 0; end
				endcase
	end
	1 : begin
				case(I)
					0: begin current_state <= 1; Y <= 0; end
					1: begin current_state <= 2; Y <= 0; end
				endcase
	end
	2 : begin
				case(I)
					0: begin current_state <= 1; Y <= 1; end
					1: begin current_state <= 0; Y <= 0; end
				endcase
	end
endcase
endmodule
				