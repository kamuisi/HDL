library verilog;
use verilog.vl_types.all;
entity SRAM_vlg_sample_tst is
    port(
        ADDRESS         : in     vl_logic_vector(5 downto 0);
        ReadEn          : in     vl_logic;
        WriteData       : in     vl_logic_vector(31 downto 0);
        WriteEn         : in     vl_logic;
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SRAM_vlg_sample_tst;
