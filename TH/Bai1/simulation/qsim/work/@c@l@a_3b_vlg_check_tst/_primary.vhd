library verilog;
use verilog.vl_types.all;
entity CLA_3b_vlg_check_tst is
    port(
        S               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end CLA_3b_vlg_check_tst;
