-- Arquivo VHDL do circuito principal: main.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port (
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Op : in STD_LOGIC_VECTOR(2 downto 0);
        Resultado : out STD_LOGIC_VECTOR(3 downto 0);
        Zero : out STD_LOGIC
    );
end main;

architecture Behavioral of main is
    component ula3
        Port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Op : in STD_LOGIC_VECTOR(2 downto 0);
            Resultado : out STD_LOGIC_VECTOR(3 downto 0);
            Zero : out STD_LOGIC
        );
    end component;

    signal A_int, B_int : STD_LOGIC_VECTOR(3 downto 0);
    signal Op_int : STD_LOGIC_VECTOR(2 downto 0);
    signal Res_int : STD_LOGIC_VECTOR(3 downto 0);
    signal Zero_int : STD_LOGIC;

begin
    ULA_instance: ula3
        port map(
            A => A_int,
            B => B_int,
            Op => Op_int,
            Resultado => Res_int,
            Zero => Zero_int
        );

    process(CLK, Reset)
    begin
        if Reset = '1' then
            A_int <= (others => '0');
            B_int <= (others => '0');
            Op_int <= (others => '0');
            Resultado <= (others => '0');
            Zero <= '0';
        elsif rising_edge(CLK) then
            A_int <= A;
            B_int <= B;
            Op_int <= Op;
            Resultado <= Res_int;
            Zero <= Zero_int;
        end if;
    end process;
end Behavioral;
