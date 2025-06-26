library verilog;
use verilog.vl_types.all;
entity lab_2_1_vlg_check_tst is
    port(
        count           : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab_2_1_vlg_check_tst;
