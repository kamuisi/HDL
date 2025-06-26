library verilog;
use verilog.vl_types.all;
entity full_adder_4bit_2_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        Cin             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end full_adder_4bit_2_vlg_sample_tst;
