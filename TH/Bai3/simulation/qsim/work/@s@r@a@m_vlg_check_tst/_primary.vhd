library verilog;
use verilog.vl_types.all;
entity SRAM_vlg_check_tst is
    port(
        ReadData        : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end SRAM_vlg_check_tst;
