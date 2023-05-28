-- VHDL file
--
-- Autor: Jassan, Joel
-- Date: (May/2023)
-- 
-- Proyect Explanation: Testbench del receptor UART con ROM.
--
--
-- Copyright 2023, Joel Jassan <joeljassan@hotmail.com>
-- All rights reserved.
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx_rx_uart_tb is
end entity;

architecture a_tx_rx_uart_tb of tx_rx_uart_tb is

    ----- Typedefs --------------------------------------------------------------------------------

    ----- Constants -------------------------------------------------------------------------------
    --Transmisor
    constant nbits_tx   : integer := 13;
    constant cnt_max_tx : integer := 5209;
    --Receptor
    constant nbits_rx   : integer := 9;
    constant cnt_max_rx : integer := 325;
    --Comun
    constant data_lenght : integer := 8; --NO CAMBIAR ESTO HASTA NO HACER LA LOGICA DE LOS MODULOS

    ----- Simulation ------------------------------------------------------------------------------
    constant simulation_time : time := 5000 ns; --esto no funciona
    constant tiempo_de_pulso : time := 103.958 us;

    ----- Signals (i: entrada, o:salida, s:señal intermedia) --------------------------------------
    signal clk_i, rst_i, enable_i : std_logic;
    signal rx_port, tx_port       : std_logic;

begin
    ----- Component to validate -------------------------------------------------------------------
    tx_rx : entity work.tx_rx_uart
        generic map(nbits_tx, cnt_max_tx, nbits_rx, cnt_max_rx, data_lenght)
        port map(clk_i, rst_i, enable_i, rx_port, tx_port);

    ----- Code ------------------------------------------------------------------------------------
    -- clock stimulus
    reloj : process
    begin
        clk_i <= '0';
        wait for 10 ns;
        clk_i <= '1';
        wait for 10 ns;
    end process;

    -- reset stimulus
    reset : process
    begin
        rst_i <= '0';
        wait for 80 ns;
        rst_i <= '1';
        wait;
    end process;

    -- enable stimulus
    enable : process
    begin
        enable_i <= '0';
        wait for 100 ns; --espera habilitacion del reset
        enable_i <= '1';
        wait;
    end process;

    -- component to validate stimulus ---------------------
    ejecucion : process
        variable data : std_logic_vector (7 downto 0);
    begin
        wait for 2 * tiempo_de_pulso;

        -- dato 1
        data := x"01";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;

        -- dato 2
        data := x"23";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;

        -- dato 3
        data := x"45";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for 11 * tiempo_de_pulso;

        -- dato 4
        data := x"67";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;

        -- dato 5
        data := x"89";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;
        wait for tiempo_de_pulso;

        -- dato 6
        data := x"AB";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;

        -- dato 7
        data := x"CD";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;

        -- dato 8
        data := x"EF";
        rx_port <= '0'; --start
        wait for tiempo_de_pulso;
        for i in 0 to 7 loop
            rx_port <= data(i);
            wait for tiempo_de_pulso;
        end loop;
        rx_port <= '1'; --start
        wait for tiempo_de_pulso;

        wait;

    end process;
    -------------------------------------------------------

    -- End of test
    stop : process
    begin
        wait;
        --wait for simulation_time; --tiempo total de
        --std.env.stop;
    end process;

    -- Data Verify
    -- aqui irian los note, warning, etc.
end architecture;