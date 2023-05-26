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

entity rx_tx_uart is
    generic (
        --Transmisor
        nbits_tx   : integer := 13;
        cnt_max_tx : integer := 5209;
        --Receptor
        nbits_rx   : integer := 9;
        cnt_max_rx : integer := 325;
        --Comun
        data_lenght : integer := 8
    )
    port (
        --input ports
        clk    : in std_logic;
        reset  : in std_logic;
        enable : in std_logic

        --output ports

    );

end entity;

architecture a_rx_tx_uart of rx_tx_uart is

    ----- Typedefs --------------------------------------------------------------------------------

    ----- Constants -------------------------------------------------------------------------------

    ----- Signals (i: entrada, o:salida, s:señal intermedia)---------------------------------------
begin
    ----- Components ------------------------------------------------------------------------------

    transmitter : entity work.tx_uart
        generic map()
        port map();

    receiver : entity work.rx_uart
        generic map()
        port map();

    ----- Codigo ----------------------------------------------------------------------------------

    -- Logica Estado Siguiente

    -- Logica Salida
end architecture;