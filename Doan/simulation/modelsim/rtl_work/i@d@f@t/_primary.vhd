library verilog;
use verilog.vl_types.all;
entity iDFT is
    generic(
        sample          : integer := 8;
        n_bit_for_sample: integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        data_in_1       : in     vl_logic_vector(31 downto 0);
        data_in_2       : in     vl_logic_vector(31 downto 0);
        done            : out    vl_logic;
        wr_en           : out    vl_logic;
        sub_en          : out    vl_logic;
        ram_ctrl        : out    vl_logic;
        wr_sel_iDFT     : out    vl_logic_vector(1 downto 0);
        rd_sel_iDFT     : out    vl_logic_vector(1 downto 0);
        idft_addr       : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector(31 downto 0);
        data_out_2      : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sample : constant is 1;
    attribute mti_svvh_generic_type of n_bit_for_sample : constant is 1;
end iDFT;
