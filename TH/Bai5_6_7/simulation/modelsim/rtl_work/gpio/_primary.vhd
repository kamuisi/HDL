library verilog;
use verilog.vl_types.all;
entity gpio is
    port(
        bWrite          : in     vl_logic;
        bSel            : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        gpioInput       : in     vl_logic_vector(15 downto 0);
        bAddr           : in     vl_logic_vector(31 downto 0);
        bWData          : in     vl_logic_vector(31 downto 0);
        bRData          : out    vl_logic_vector(31 downto 0);
        gpioOutput      : out    vl_logic_vector(15 downto 0)
    );
end gpio;
