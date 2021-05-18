library ieee;

use ieee.std_logic_1164.all;

entity register8 is 
	port(
		dados :	in std_logic_vector(7 downto 0);
		load	:	in std_logic;
		clear	:	in std_logic;
		clock	:	in std_logic;
		saida :	out std_logic_vector(7 downto 0)
	);
end register8;

architecture bhv_reg8 of register8 is
begin
		process (clock, clear) 
			begin
				if clear = '1' then
					saida <= (others => '0');
				elsif rising_edge(clock)then
					if load = '1' then 
						saida <= dados;
					end if;
				end if;
		end process;
end bhv_reg8;
	
