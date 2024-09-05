library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ula_Process is
    port(

        in1 : in std_logic_vector(7 downto 0); 

        in2 : in std_logic_vector(7 downto 0); 

        Sel : in std_logic_vector(1 downto 0); 

        Out1 : out std_logic_vector(15 downto 0)
    );
end entity;

architecture classic of ula_Process is

signal soma : std_logic_vector(7 downto 0);
signal subt : std_logic_vector(7 downto 0);

begin

    soma <= in1 + in2;
    subt <= in1 - in2;

    process(Sel, soma, subt, in1, in2)
    begin
        if (Sel = "00") then
            out1 <= "00000000" & soma;
        
        elsif (Sel = "01") then
            out1 <= "00000000" & subt;

        elsif (Sel = "10") then
            out1 <= in1 * in2;

        else
            out1 <= "00000000" & in1;      

        end if;

    end process;

end classic;