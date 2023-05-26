library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx_uart is
	port (
		clk   : in std_logic;
		reset : in std_logic;

		tx : out std_logic
	);
end entity;

architecture a_t_uart_rom of t_uart_rom is

	-- Memoria
	signal dato : std_logic_vector (7 downto 0);

	-- Reloj
	signal clk_9600 : std_logic;

	-- Transmisor UART
	signal salida_tx : std_logic;
begin
	--------- COMPONENTES -------------------------------------------

	ut_9600 : entity work.contador_binario
		generic map(13, 5209)
		port map(clk, reset, clk_9600, open);

	ut_t_uart : entity work.tx_uart_mef
		port map(clk_9600, reset, dato, salida_tx);

	--------- CODIGO ------------------------------------------------

	-- Logica de Salida
	tx <= salida_tx;

end architecture;