library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is 
	port(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		func : in std_logic_vector(5 downto 0);
		o : out std_logic;
		cOut : out std_logic;
		zero : out std_logic;
		n : out std_logic;
		ulaOut : out std_logic_vector (31 downto 0)
	);
end ULA;

architecture bhv_ULA of ULA is
 
	component subAdder32 is 
		port(
			a : in std_logic_vector(31 downto 0);
			b : in std_logic_vector(31 downto 0);
			cIN : in std_logic;
			cOUT : out std_logic;
			o : out std_logic;
			s : out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal sumSub : std_logic_vector(31 downto 0);
	signal tempOut : std_logic_vector(31 downto 0);
	signal cIN : std_logic;
begin
	addSub : subAdder32 port map(a => a, b => b, cIN => cIN, cOUT => cOuT, o => o, s => sumSub);
	cIN <= '1' when func = "000010" else '0';
	
	tempOut <= 	sumSub 						when func = "000001" else
					sumSub						when func = "000010" else
					(a and b) or (not b) 	when func = "000100" else
					a and b						when func = "001000" else
					a xor b						when func = "010000" else
					not a							when func = "100000" else
					x"00000000";
					
	
	zero <= '1' when tempOut = x"00000000" else '0';
	n <= tempOut(31);
	ulaOut <= tempOut;
end bhv_ULA;		