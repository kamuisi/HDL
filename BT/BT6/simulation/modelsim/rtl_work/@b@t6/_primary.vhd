library verilog;
use verilog.vl_types.all;
entity BT6 is
    generic(
        S0              : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        S1              : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        S2              : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        S3              : vl_logic_vector(0 to 1) := (Hi1, Hi1);
        U1              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        U2              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        U3              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        D1              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        D2              : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        D3              : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        K               : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0)
    );
    port(
        R               : in     vl_logic_vector(1 downto 0);
        Y               : out    vl_logic_vector(2 downto 0);
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
    attribute mti_svvh_generic_type of U1 : constant is 1;
    attribute mti_svvh_generic_type of U2 : constant is 1;
    attribute mti_svvh_generic_type of U3 : constant is 1;
    attribute mti_svvh_generic_type of D1 : constant is 1;
    attribute mti_svvh_generic_type of D2 : constant is 1;
    attribute mti_svvh_generic_type of D3 : constant is 1;
    attribute mti_svvh_generic_type of K : constant is 1;
end BT6;
