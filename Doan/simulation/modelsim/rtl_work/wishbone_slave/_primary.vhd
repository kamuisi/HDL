library verilog;
use verilog.vl_types.all;
entity wishbone_slave is
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
        done            : in     vl_logic;
        ADR_I           : in     vl_logic_vector;
        data_in         : in     vl_logic_vector(31 downto 0);
        DAT_I           : in     vl_logic_vector(31 downto 0);
        start           : out    vl_logic;
        wr_en           : out    vl_logic;
        ACK_O           : out    vl_logic;
        wr_sel_wishbone : out    vl_logic_vector(1 downto 0);
        rd_sel_wishbone : out    vl_logic_vector(1 downto 0);
        wishbone_addr   : out    vl_logic_vector;
        data_out        : out    vl_logic_vector(31 downto 0);
        DAT_O           : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sample : constant is 1;
    attribute mti_svvh_generic_type of n_bit_for_sample : constant is 1;
end wishbone_slave;
