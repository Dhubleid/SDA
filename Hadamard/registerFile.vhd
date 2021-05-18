
library ieee;

use ieee.std_logic_1164.all;
use work.matrix.all;

entity registerFile is 
	port(
	   dataIn : in mat(15 downto 0); -- valor para carregar em um registrador
	   clk : in std_logic; -- clock
		--	clear : in std_logic_vector (31 downto 0);
		 regFileOut : out mat(15 downto 0)
	);
end registerFile;
	
architecture bhv_br of registerFile is

component register8 is 
	port(
		dados :	in std_logic_vector(7 downto 0);
		load	:	in std_logic;
		clear	:	in std_logic;
		clock	:	in std_logic;
		saida :	out std_logic_vector(7 downto 0)
	);
end component;



begin
	gen: for i in 0 to 15 generate
		regs: register8 port map (dados => dataIn(i), load => '1' , clear => '0', clock => clk, saida => regFileOut(i));
	end generate;

	
end bhv_br;