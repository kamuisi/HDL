module idft_core (
    input clk,
    input rst,
    input start,
	 input data_ok,
    output reg done,
    output reg ri_real, ri_imag,
    output reg wi_real, wi_imag,
    input [31:0] x_real_in, x_imag_in,
    output reg [31:0] X_real_out, X_imag_out,
    output reg [2:0] addr_out
);

    reg [3:0] count;
	 reg write_flag;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done <= 0;
            ri_real <= 0;
            ri_imag <= 0;
            wi_real <= 0;
            wi_imag <= 0;
            addr_out <= 0;
            count <= 0;
				write_flag <= 0;
        end else if (start) begin
            if (count < 8) begin
                // Yêu cầu đọc x_real/x_imag từ RAM (addr = count)
					 if(write_flag == 0) begin
						ri_real <= 1;
						ri_imag <= 1;
						write_flag <= 1;
					 end
					 else begin
						ri_real <= 0;
						ri_imag <= 0;
					end
					 addr_out <= count;
					 if(data_ok == 1) begin
                // Chỉ để mô phỏng, đảo giá trị như kết quả IDFT
						X_real_out <= x_real_in >> 1;
						X_imag_out <= x_imag_in >> 1;

						wi_real <= 1;
						wi_imag <= 1;
						write_flag <= 0;
						count <= count + 4'b0001;
					end
					else begin
						wi_real <= 0;
						wi_imag <= 0;
					end
            end else begin
                done <= 1;
					 ri_real <= 0;
                ri_imag <= 0;
					 wi_real <= 0;
					 wi_imag <= 0;
            end
        end else begin
            done <= 0;
			   ri_real <= 0;
            ri_imag <= 0;
				wi_real <= 0;
				wi_imag <= 0;
        end
    end
endmodule
