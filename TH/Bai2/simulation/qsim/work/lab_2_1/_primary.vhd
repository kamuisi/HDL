library verilog;
use verilog.vl_types.all;
entity lab_2_1 is
    port(
        loadEn          : in     vl_logic;
        clk             : in     vl_logic;
        load            : in     vl_logic_vector(2 downto 0);
        count           : out    vl_logic_vector(2 downto 0)
    );
end lab_2_1;
