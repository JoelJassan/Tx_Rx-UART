library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx_uart_mef is
	port (
		clk   : in std_logic;
		reset : in std_logic;
		send  : in std_logic;
		dato  : in std_logic_vector (7 downto 0);--  := x"00";
		tx    : out std_logic
	);
end entity;

architecture a_tx_uart_mef of tx_uart_mef is

	type mef is (idle, start, d0, d1, d2, d3, d4, d5, d6, d7, stop);
	signal estado : mef;

begin

	process (clk, reset)
	begin
		if reset = '0' then
			estado <= idle;
		elsif rising_edge (clk) then
			case estado is
				when idle =>
					if (send = '1') then
						estado <= start;
					else
						estado <= idle;
					end if;
				when start => estado <= d0;
				when d0    => estado    <= d1;
				when d1    => estado    <= d2;
				when d2    => estado    <= d3;
				when d3    => estado    <= d4;
				when d4    => estado    <= d5;
				when d5    => estado    <= d6;
				when d6    => estado    <= d7;
				when d7    => estado    <= stop;
				when stop  => estado  <= idle;
			end case;
		end if;

	end process;
	process (estado, dato)
	begin

		case estado is
			when idle  => tx  <= '1';
			when start => tx <= '0';
			when d0    => tx    <= dato(0);
			when d1    => tx    <= dato(1);
			when d2    => tx    <= dato(2);
			when d3    => tx    <= dato(3);
			when d4    => tx    <= dato(4);
			when d5    => tx    <= dato(5);
			when d6    => tx    <= dato(6);
			when d7    => tx    <= dato(7);
			when stop  => tx  <= '0';
		end case;

	end process;

end architecture;