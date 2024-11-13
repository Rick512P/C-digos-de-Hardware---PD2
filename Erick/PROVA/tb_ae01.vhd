-- Libraries definitions
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_ae01 is
end entity;

architecture behaviour of tb_ae01 is

-- componente a ser validado
component ae01 is
	port(
		reset		: in std_logic;	
		clock  		 : in std_logic;	
		Input0  		: in std_logic_vector(7 downto 0);	
		Input1  		: in std_logic_vector(7 downto 0);	
		op_0    		: in std_logic;	
		op_1    		: in std_logic;	
		Output0	: out std_logic_vector(7 downto 0)
		);
end component;
signal reset_sg 		: std_logic:= '1'; -- reset
signal clock_sg  	: std_logic:= '0'; -- clock
signal Input0_sg 	: std_logic_vector(7 downto 0):= "00000111";  -- primeira entrada
signal Input1_sg 	: std_logic_vector(7 downto 0):= "00000011"; -- segunda entrada
signal op_0_sg   	: std_logic:= '0'; -- controle do primeiro mux
signal op_1_sg		: std_logic:= '1';  -- controle do segundo mux
signal Output0		: std_logic_vector(7 downto 0); -- saída da arquitetura

begin
-- começo da instanciação
inst_ae01 : ae01 
	port map (
			reset   			=> reset_sg,  
			clock  			=> clock_sg, 
            Input0  			=> Input0_sg,
            Input1  			=> Input1_sg,
            op_0  		  	=> op_0_sg,  
            op_1   		 	=> op_1_sg,	 
            Output0 		=> Output0
           );
-- começo da lógica do TB

clock_sg <= not clock_sg after 5 ns;
process
begin
	wait for 2 ns;
		reset_sg <= '0'; -- reset ativo em '1', nesse instante se desliga o mesmo
	wait for 8 ns;
		-- trocar os valores para a entrada do pipeline
		Input0_sg  <= "00000101";	 
        Input1_sg  <= "00000010"; 
        op_0_sg    <= '1';
        op_1_sg    <= '0';
    wait for 10 ns;
    	-- trocar os valores para a entrada do pipeline
    	Input0_sg  <= "00000110";	 
        Input1_sg  <= "00000100"; 
        op_0_sg    <= '1';
        op_1_sg    <= '1';
    wait;
end process;

end behaviour;