library verilog;
use verilog.vl_types.all;
entity top_module_tb is
    generic(
        NUM_SAMPLES     : integer := 20;
        NUM_POINTS      : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUM_SAMPLES : constant is 1;
    attribute mti_svvh_generic_type of NUM_POINTS : constant is 1;
end top_module_tb;
