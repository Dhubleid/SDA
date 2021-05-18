library ieee;
use ieee.std_logic_1164.all;
use work.matrix.all;

entity hadaTB is
end hadaTB;

architecture bhv of hadaTB is

component hadamard is
	port(
		w : in mat(15 downto 0);
		clk : in std_logic; 
		s : out mat(15 downto 0)
	);
end component;

signal tw : mat (15 downto 0); 
signal ts : mat (15 downto 0);
signal tclk : std_logic;

begin
  
  tbH: hadamard port map(w => tw, clk => tclk, s => ts);
  
  clkP : process
  begin
  		tclk <= '1', '0' after 5 ns;
  		wait for 10 ns;
  end process;
  
  tbP : process
	   begin
		  tw(0) <= x"01";
		  tw(1) <= x"02";
		  tw(2) <= x"03";
		  tw(3) <= x"04";
		  tw(4) <= x"05";
		  tw(5) <= x"06";
		  tw(6) <= x"07";
		  tw(7) <= x"08";
		  tw(8) <= x"09";
		  tw(09) <= x"0A";
		  tw(10) <= x"0B";
		  tw(11) <= x"0C";
		  tw(12) <= x"0D";
		  tw(13) <= x"0E";
		  tw(14) <= x"0F";
		  tw(15) <= x"10";
		  wait for 10 ns;
		  wait; -- will wait forever
  END PROCESS;

end bhv;