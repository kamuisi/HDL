module BT6(R, Y, clk);
input [1:0] R;
reg [1:0] State;
output reg [2:0] Y;
input clk;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

parameter U1 = 3'b001;
parameter U2 = 3'b010;
parameter U3 = 3'b011;
parameter D1 = 3'b100;
parameter D2 = 3'b101;
parameter D3 = 3'b110;
parameter K = 3'b000;

initial 
	State <= S0;

always @(posedge clk)
case(State)
	0 : begin
			case(R)
				0 : begin	
					State <= S0;
					Y <= K;
					end
				1 : begin
					State <= S1;
					Y <= U1;
					end
				2 : begin
					State <= S2;
					Y <= U2;
					end
				3 : begin
					State <= S3;
					Y <= U3;
					end
			endcase
		end
	1 : begin
			case(R)
				0 : begin	
					State <= S0;
					Y <= D1;
					end
				1 : begin
					State <= S1;
					Y <= K;
					end
				2 : begin
					State <= S2;
					Y <= U1;
					end
				3 : begin
					State <= S3;
					Y <= U2;
					end
			endcase
		end
	2 : begin
			case(R)
				0 : begin	
					State <= S0;
					Y <= D2;
					end
				1 : begin
					State <= S1;
					Y <= D1;
					end
				2 : begin
					State <= S2;
					Y <= K;
					end
				3 : begin
					State <= S3;
					Y <= U1;
					end
			endcase
		end
	3 : begin
			case(R)
				0 : begin	
					State <= S0;
					Y <= D3;
					end
				1 : begin
					State <= S1;
					Y <= D2;
					end
				2 : begin
					State <= S2;
					Y <= D1;
					end
				3 : begin
					State <= S3;
					Y <= K;
					end
			endcase
		end
endcase
endmodule