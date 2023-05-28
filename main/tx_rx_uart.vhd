-- VHDL file
--
-- Autor: Jassan, Joel
-- Date: (may/YYYY)
-- 
-- Proyect Explanation: Codigo para recibir por UART y transmitir por UART.
-- Condiciones de prueba: 
--      Ubuntu 22.04 (Debian)
--      Software CuteCom (para abrir el puerto serial)
--      Hardware CP2102
--
-- ---------------------
-- Consideraciones: el transmisor esta implementado de manera distinta al receptor, por eso es que
-- hay tantos parametros genericos. 
-- No entiendo muy bien como esta implementada la "rx_uart_mef". Es el codigo de la ingeniera, 
-- porque tiene contadores en el medio, en vez de manejar directamente los estados. 
--
--
--
-- Copyright 2023, Joel Jassan <joeljassan@hotmail.com>
-- All rights reserved.
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tx_rx_uart is
    generic (
        --Transmisor
        nbits_tx   : integer := 13;
        cnt_max_tx : integer := 5200; --5209
        --Receptor
        nbits_rx   : integer := 9;
        cnt_max_rx : integer := 325;
        --Comun
        data_lenght : integer := 8 --NO CAMBIAR ESTO HASTA NO HACER LA LOGICA DE LOS MODULOS
    );

    port (
        --input ports
        clk    : in std_logic;
        reset  : in std_logic;
        enable : in std_logic;

        rx_port : in std_logic;

        --output ports
        tx_analyzer   : out std_logic;
        rx_analyzer   : out std_logic;
        send_analyzer : out std_logic;

        tx_port : out std_logic
    );

end entity;

architecture a_tx_rx_uart of tx_rx_uart is

    ----- Typedefs --------------------------------------------------------------------------------

    ----- Constants -------------------------------------------------------------------------------

    ----- Signals (i: entrada, o:salida, s:señal intermedia)---------------------------------------
    signal dato_s : std_logic_vector (data_lenght - 1 downto 0);

    -- transmiter
    signal tx_s   : std_logic;
    signal send_s : std_logic;

    -- receiver 
    signal rx_s    : std_logic;
    signal rx_done : std_logic;

begin
    ----- Components ------------------------------------------------------------------------------

    transmitter : entity work.tx_uart
        generic map(nbits_tx, cnt_max_tx, data_lenght)
        port map(clk, reset, send_s, dato_s, tx_s);

    receiver : entity work.rx_uart
        generic map(nbits_rx, cnt_max_rx, data_lenght)
        port map(clk, reset, rx_s, rx_done, dato_s);

    ----- Codigo ----------------------------------------------------------------------------------

    -- Logica Estado Siguiente

    -- Conexion de señales
    send_s <= rx_done;

    -- Logica Salida
    tx_port <= tx_s;
    rx_s    <= rx_port;

    -- Señales del analizador logico
    rx_analyzer   <= rx_s;
    tx_analyzer   <= tx_s;
    send_analyzer <= send_s;

end architecture;