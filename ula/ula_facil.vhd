library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ula_facil is
    port(

        in1 : in std_logic_vector(7 downto 0); 

        in2 : in std_logic_vector(7 downto 0); 

        Sel : in std_logic_vector(1 downto 0); 

        Out1 : out std_logic_vector(15 downto 0)

    );
end entity;

architecture classic of ula_facil is

signal soma : std_logic_vector(7 downto 0);
signal subt : std_logic_vector(7 downto 0);
constant zero : std_logic_vector(7 downto 0):= 8D"0";



begin

    soma <= in1 + in2;
    subt <= in1 - in2;

    out1 <= zero & soma when Sel = "00" else

            zero & soma when Sel = "01" else

            in1 * in2 when Sel = "10" else

            zero & in1;
end classic;