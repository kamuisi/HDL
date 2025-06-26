library verilog;
use verilog.vl_types.all;
entity lab_2_2_vlg_sample_tst is
    port(
        ReadAddress1    : in     vl_logic_vector(4 downto 0);
        ReadAddress2    : in     vl_logic_vector(4 downto 0);
        ReadWriteEn     : in     vl_logic;
        WriteAddress    : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab_2_2_vlg_sample_tst;
