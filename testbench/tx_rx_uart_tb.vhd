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

entity tx_rx_uart_tb is
end entity;

architecture a_tx_rx_uart_tb of tx_rx_uart_tb is

    ----- Typedefs --------------------------------------------------------------------------------

    ----- Constants -------------------------------------------------------------------------------
    constant simulation_time : integer := 5000; --esto no funciona

    --Transmisor
    constant nbits_tx   : integer := 13;
    constant cnt_max_tx : integer := 5209;
    --Receptor
    constant nbits_rx   : integer := 9;
    constant cnt_max_rx : integer := 325;
    --Comun
    constant data_lenght : integer := 8; --NO CAMBIAR ESTO HASTA NO HACER LA LOGICA DE LOS MODULOS

    ----- Simulation ------------------------------------------------------------------------------

    ----- Signals (i: entrada, o:salida, s:señal intermedia) --------------------------------------
    signal clk_i, rst_i, enable_i : std_logic;
    signal rx_port, tx_port       : std_logic;

begin
    ----- Component to validate -------------------------------------------------------------------
    tx_rx : entity work.tx_rx_uart
        generic map(nbits_tx, cnt_max_tx, nbits_rx, cnt_max_tx, data_lenght)
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
    begin
        wait;
    end process;
    -------------------------------------------------------

    -- End of test
    stop : process
    begin
        wait;
        --wait for 5000 ns; --tiempo total de
        --std.env.stop;
    end process;

    -- Data Verify
    -- aqui irian los note, warning, etc.
end architecture;