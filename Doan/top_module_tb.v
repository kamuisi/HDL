`timescale 1ns/1ps

module top_module_tb;

    // Clock & Reset
    reg clk, rst;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Wishbone signals
    reg we_i, stb_i, cyc_i;
    reg [7:0] adr_i;
    reg [31:0] dat_i;
    wire [31:0] dat_o;
    wire ack_o;

    // Instantiate DUT
    top_module uut (
        .RST_I(rst),
        .CLK_I(clk),
        .WE_I(we_i),
        .STB_I(stb_i),
        .CYC_I(cyc_i),
        .ADR_I(adr_i),
        .DAT_I(dat_i),
        .DAT_O(dat_o),
        .ACK_O(ack_o)
    );

    // Parameters
    parameter NUM_SAMPLES = 20;
    parameter NUM_POINTS = 8;

    // Input and output data storage
    reg signed [31:0] real_in[0:NUM_SAMPLES-1][0:NUM_POINTS-1];
    reg signed [31:0] imag_in[0:NUM_SAMPLES-1][0:NUM_POINTS-1];
    reg signed [31:0] real_out[0:NUM_SAMPLES-1][0:NUM_POINTS-1];
    reg signed [31:0] imag_out[0:NUM_SAMPLES-1][0:NUM_POINTS-1];

    // Write task
    task wishbone_write(input [7:0] addr, input [31:0] data);
    begin
        @(posedge clk);
        adr_i <= addr;
        dat_i <= data;
        we_i <= 1;
        stb_i <= 1;
        cyc_i <= 1;
        @(posedge ack_o);
        stb_i <= 0;
        cyc_i <= 0;
        we_i <= 0;
    end
    endtask

    // Read task
    task wishbone_read(input [7:0] addr);
    begin
        @(posedge clk);
        adr_i <= addr;
        we_i <= 0;
        stb_i <= 1;
        cyc_i <= 1;
        @(posedge ack_o);
        stb_i <= 0;
        cyc_i <= 0;
    end
    endtask
	 

    integer i, j;
    integer timeout_counter;
    integer seed;

    initial begin
        // Reset
        rst = 1;
        we_i = 0;
        stb_i = 0;
        cyc_i = 0;
        adr_i = 0;
        dat_i = 0;
        seed = 32'h12345678;  // Đảm bảo seed được khai báo trước khi sử dụng
        

        rst = 0;

        for (j = 0; j < NUM_SAMPLES; j = j + 1) begin
            $display("\n--- GHI DU LIEU VAO MAU %0d ---", j);

			   rst = 1;
				#20;
			   rst = 0;
            // Ghi dữ liệu đầu vào
            for (i = 0; i < NUM_POINTS; i = i + 1) begin
                real_in[j][i] = $random(seed) % 1000;  // Giới hạn giá trị thực ngẫu nhiên
                imag_in[j][i] = $random(seed) % 1000;  // Giới hạn giá trị ảo ngẫu nhiên

                $display("[MAU %0d] Ghi X_real[%0d] = %0d", j, i, real_in[j][i]);
                wishbone_write({5'h02, i[2:0]}, real_in[j][i]);

                $display("[MAU %0d] Ghi X_imag[%0d] = %0d", j, i, imag_in[j][i]);
                wishbone_write({5'h04, i[2:0]}, imag_in[j][i]);
            end

            // Bắt đầu IDFT
            wishbone_write(8'h00, 32'h1); // start = 1

            // Đợi tín hiệu done
            timeout_counter = 0;
            repeat (2) @(posedge clk); // delay nhẹ
            wishbone_read(8'h08);
            while (dat_o[0] == 0 && timeout_counter < 1000) begin
                wishbone_read(8'h08);
                timeout_counter = timeout_counter + 1;
            end

            if (timeout_counter >= 1000) begin
                $display(">> Timeout: Khong nhan duoc done cho mau %0d", j);
            end else begin
                $display("\n--- KET QUA MAU %0d ---", j);
                $display("%-6s | %-12s | %-12s || %-12s | %-12s | %s", 
                    "Idx", "In_Real", "In_Imag", "Out_Real", "Out_Imag", "Complex");

                for (i = 0; i < NUM_POINTS; i = i + 1) begin
                    // Đọc output
                    wishbone_read({5'h06, i[2:0]}); // real
                    real_out[j][i] = dat_o;

                    wishbone_read({5'h08, i[2:0]}); // imag
                    imag_out[j][i] = dat_o;

                    // In kết quả
                    $display("%-6d | %-12d | %-12d || %-12d | %-12d | %0d + j%0d",
                        i, real_in[j][i], imag_in[j][i],
                        real_out[j][i], imag_out[j][i],
                        real_out[j][i], imag_out[j][i]);
                end
            end

            #10;
        end

        $display("\n>> TEST HOAN TAT <<");
        $stop;
    end

endmodule
