library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity reg_pipe is
end entity;


architecture behavior of tb_reg_pipe_h is
    signal in1_sg : std_logic_vector(7 downto 0):=8D"19";
    signal in2_sg : std_logic_vector(7 downto 0):="00000001";
    signal in3_sg : std_logic_vector(7 downto 0):="00001100";
    signal clock_sg : std_logic:='0';
    signal reset_sg : std_logic:='0';
    signal out1_sg : std_logic_vector(7 downto 0);

    component reg_pipe_h is
        port(
            in1 : in std_logic_vector(7 downto 0);
            in2 : in std_logic_vector(7 downto 0);
            in3 : in std_logic_vector(7 downto 0);
            clock : in std_logic;
            reset : in std_logic;
            out1 : out std_logic_vector(7 downto 0)
        );
    end component;

    begin
       inst_arch_reg_pipe_h : reg_pipe_h
        port map(
            in1 => in1_sg;
            in2 => in2_sg;
            in3 => in3_sg;
            clock => clock_sg;
            reset => reset_sg;
            out1 => out1_sg
        );
    clock_sg <= not clock_sg after 5 ns;
    process
        begin
            wait for 2 ns;
                reset_sg <= '1';
            wait;
        end process;
    end behavior;


