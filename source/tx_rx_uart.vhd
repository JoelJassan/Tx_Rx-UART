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
--
-- Copyright 2023, Joel Jassan <joeljassan@hotmail.com>
-- All rights reserved.
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity rx_tx_uart is

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

    ----- Codigo ----------------------------------------------------------------------------------

    -- Logica Estado Siguiente

    -- Logica Salida
end architecture;