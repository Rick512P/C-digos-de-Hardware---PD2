-- ULA (Unidade Lógica Aritmética) VHDL file: ula3.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ula3 is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Op : in STD_LOGIC_VECTOR(2 downto 0);
        Resultado : out STD_LOGIC_VECTOR(3 downto 0);
        Zero : out STD_LOGIC
    );
end ula3;

architecture Behavioral of ula3 is
begin
    process(A, B, Op)
    begin
        case Op is
            when "000" => -- ADD
                Resultado <= A + B;
            when "001" => -- SUB
                Resultado <= A - B;
            when "010" => -- AND
                Resultado <= A and B;
            when "011" => -- OR
                Resultado <= A or B;
            when "100" => -- XOR
                Resultado <= A xor B;
            when others =>
                Resultado <= (others => '0'); -- Default case
        end case;

        if Resultado = "0000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end Behavioral;