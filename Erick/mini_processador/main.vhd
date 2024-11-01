library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ULA_3 is
    port(

        A, B            : in std_logic_vector(3 downto 0);
        Out1            : out std_logic_vector(3 downto 0);
        S               : in std_logic_vector(1 downto 0);
        Equal           : out std_logic);
end entity;

architecture behavior of ULA_3 is
    signal soma     : std_logic_vector(3 downto 0);
    signal subt     : std_logic_vector(3 downto 0);
    signal mult     : std_logic_vector(7 downto 0);

begin
    soma <= A + B;
    subt <= A - B;
    mult <= A * B;
    process(soma, subt, mult, S, A, B, Equal)
    begin
        if A = B then
            Equal <= '0';
        else
            Equal <= '1';
        end if;

        if S = "00" then
            Out1 <= "000" & Equal;
        elsif S = "01" then
            Out1 <= soma;
        elsif S = "10" then
            Out1 <= subt;
        else
            Out1 <= mult (3 downto 0);         
        end if;       
    end process;

end architecture behavior;