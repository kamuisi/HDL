library verilog;
use verilog.vl_types.all;
entity lab_2_1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic_vector(2 downto 0);
        loadEn          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab_2_1_vlg_sample_tst;
