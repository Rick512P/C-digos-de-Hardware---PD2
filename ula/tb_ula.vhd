library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_ula is
end entity;

architecture classic of tb_ula is

signal sg_in1 : std_logic_vector(7 downto 0):= 8D"3"; 

signal sg_in2 : std_logic_vector(7 downto 0):= 8D"2"; 

signal sg_Sel : std_logic_vector(1 downto 0):= "00"; 

signal sg_Out_Process : std_logic_vector(15 downto 0);

signal sg_Out_Facil : std_logic_vector(15 downto 0);


component ula_facil is
    port(

        in1 : in std_logic_vector(7 downto 0); 

        in2 : in std_logic_vector(7 downto 0); 

        Sel : in std_logic_vector(1 downto 0); 

        Out1 : out std_logic_vector(15 downto 0)

    );

end component;

component ula_Process is
    port(

        in1 : in std_logic_vector(7 downto 0); 

        in2 : in std_logic_vector(7 downto 0); 

        Sel : in std_logic_vector(1 downto 0); 

        Out1 : out std_logic_vector(15 downto 0)
    );
end component;

begin
    
    inst_ula_Process: ula_Process

        port map(
            in1 => sg_in1,
            in2 => sg_in2,
            Sel => sg_Sel,
            Out1 => sg_Out_Process
        );

    inst_ula_facil: ula_facil

        port map(
            in1 => sg_in1, 
            in2 => sg_in2,
            Sel => sg_Sel,
            Out1 => sg_Out_Facil
        );

    sg_Sel <= sg_Sel + 1 after 10ns;

end classic;