library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ULA_3 is
    port(

        Subt, LDA, SOMA, Mul, BEQ, BNE, JMP : in std_logic_vector(2 downto 0);
        clock  : in std_logic );
end entity;

architecture behavior of ULA_3 is
    
    signal FF_R0, FF_R1
begin
    --Pode? Não sei, mas fiz
    LDA     <= "000";
    SOMA    <= "001";
    Subt    <= "010";
    Mul     <= "011";
    BEQ     <= "100";
    BNE     <= "101";
    JMP     <= "110";

    



end architecture behavior;