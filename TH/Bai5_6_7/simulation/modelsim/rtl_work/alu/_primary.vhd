library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        srcA            : in     vl_logic_vector(31 downto 0);
        srcB            : in     vl_logic_vector(31 downto 0);
        oper            : in     vl_logic_vector(3 downto 0);
        shift           : in     vl_logic_vector(4 downto 0);
        zero            : out    vl_logic;
        result          : out    vl_logic_vector(31 downto 0)
    );
end alu;
