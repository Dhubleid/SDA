-- Banco de Registradores e ULA 
-- SDA - Thiago Reis Porto 
library ieee;

use ieee.std_logic_1164.all;

entity bancoRegULA is 
	port (
		inst : in std_logic_vector (31 downto 0);
		valorLoad : in std_logic_vector (31 downto 0);
		clk : in std_logic;
		clear : in std_logic_vector (31 downto 0);
		o : out std_logic;
		cOut : out std_logic;
		zero : out std_logic;
		n : out std_logic;
		ulaOutDebug : out std_logic_vector (31 downto 0)
	);
end bancoRegULA;
	
architecture bhv_regUla of bancoRegULA is
	signal reg1, reg2 : std_logic_vector (31 downto 0);
	signal tempUlaOut : std_logic_vector (31 downto 0);
	signal regBankInput : std_logic_vector (31 downto 0);
	signal tempLoad : std_logic_vector (31 downto 0);
	component ULA is 
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
	end component;
	component bancoReg is 
		port( inst : in std_logic_vector (31 downto 0); -- Codigo com a instrução pode ser operação na ula ou um load
				valorLoad : in std_logic_vector (31 downto 0); -- valor para carregar em um registrador
				clk : in std_logic; -- clock
				clear : in std_logic_vector (31 downto 0);
				reg1, reg2 : out std_logic_vector (31 downto 0) -- saida dos valores de dois registradores
		);
	end component;
begin
	regB: bancoReg port map(inst => regBankInput, valorLoad => tempLoad, clk => clk, clear => clear, reg1 => reg1, reg2 => reg2);
	ulaC: ULA port map(a => reg1, b=> reg2, func => inst(5 downto 0), o => o, cOut => cOut, zero => zero, n => n, ulaOut => tempUlaOut);
	
	ulaOutDebug <= tempUlaOut;
	tempLoad <= valorLoad when inst(31 downto 26) = "100011" else
					tempUlaOut;	
	regBankInput <= inst;
						
	
end bhv_regUla;
