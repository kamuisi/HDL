library verilog;
use verilog.vl_types.all;
entity local_ram is
    generic(
        sample          : integer := 8;
        n_bit_for_sample: integer := 3
    );
    port(
        clk             : in     vl_logic;
        wr_sel          : in     vl_logic_vector(1 downto 0);
        rd_sel          : in     vl_logic_vector(1 downto 0);
        wr_en           : in     vl_logic;
        sub_en          : in     vl_logic;
        addr            : in     vl_logic_vector;
        data_in_1       : in     vl_logic_vector(31 downto 0);
        data_in_2       : in     vl_logic_vector(31 downto 0);
        data_out_1      : out    vl_logic_vector(31 downto 0);
        data_out_2      : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sample : constant is 1;
    attribute mti_svvh_generic_type of n_bit_for_sample : constant is 1;
end local_ram;
