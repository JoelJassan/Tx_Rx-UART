library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx_uart is
	port (
		clk   : in std_logic;
		reset : in std_logic;

		send : in std_logic;
		dato : in std_logic_vector (7 downto 0);

		tx : out std_logic
	);
end entity;

architecture a_tx_uart of tx_uart is

	-- Reloj
	signal clk_9600 : std_logic;

	-- Transmisor UART
	signal salida_tx : std_logic;
begin
	--------- COMPONENTES -------------------------------------------

	ut_9600 : entity work.contador_binario
		generic map(13, 5209) --(13, 5209)
		port map(clk, reset, clk_9600, open);

	ut_t_uart : entity work.tx_uart_mef
		port map(clk_9600, reset, send, dato, salida_tx);

	--------- CODIGO ------------------------------------------------

	-- Logica de Salida
	tx <= salida_tx;

end architecture;