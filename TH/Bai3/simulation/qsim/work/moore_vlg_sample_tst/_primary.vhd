library verilog;
use verilog.vl_types.all;
entity moore_vlg_sample_tst is
    port(
        I               : in     vl_logic;
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end moore_vlg_sample_tst;
