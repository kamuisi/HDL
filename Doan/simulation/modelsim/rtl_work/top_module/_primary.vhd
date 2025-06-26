library verilog;
use verilog.vl_types.all;
entity top_module is
    generic(
        sample          : integer := 8;
        n_bit_for_sample: integer := 3
    );
    port(
        RST_I           : in     vl_logic;
        CLK_I           : in     vl_logic;
        WE_I            : in     vl_logic;
        STB_I           : in     vl_logic;
        CYC_I           : in     vl_logic;
        DAT_I           : in     vl_logic_vector(31 downto 0);
        ADR_I           : in     vl_logic_vector;
        DAT_O           : out    vl_logic_vector(31 downto 0);
        ACK_O           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sample : constant is 1;
    attribute mti_svvh_generic_type of n_bit_for_sample : constant is 1;
end top_module;
