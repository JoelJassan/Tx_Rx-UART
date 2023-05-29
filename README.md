# Receptor UART en VHDL

-------------------------------------------------

**Table of Contents**
- [Proyecto](#proyecto)
- [Consideraciones](#consideraciones)
- [Forma de uso](#forma-de-uso)


## Proyecto

Modulo UART capaz de recibir y retransmitir tramas de datos. Fue testeada con lineas de hasta 80 bytes repetidas veces.
El repositorio solo aporta los archivos .vhd, por lo que toda la funcionalidad para Q2 y ModelSim debe ser generada por quien use el repositorio.

## Consideraciones

El archivo .gitignore incluye todas las extensiones que genera Quartus 2, ModelSim y GHDL en su ejecucion y compilacion.

* Para ejecutar en FPGA
Se necesita crear un proyecto en Quartus 2. 
Sobre ese proyecto agregar todos los archivos, considerando la entidad de mayor jerarquía.

* Para simulacion en GtkWave
Es necesario tener las herramientas GHDL y GtkWave instaladas. Para distribuciones debian de linux basta con ejecutar los siguientes comandos:
'sudo apt-get install GHDL'
'sudo apt-get install gtkwave'
Con esto bastaria para poder usar los comandos de @makefile

* Para simulacion en modelsim (en caso de no usar GtkWave)
Se debe generar el proyecto desde modelsim, e ir agregando los archivos .vhd

## Forma de Uso

Se estableceran las instrucciones para el uso del makefile con comandos make.



Previo a ejecutar un proyecto personal, se debe ingresar al makefile y configurar los siguientes parametros:
- 'SRC_FILE': Archivo a evaluar en test.
- 'TIME'    : Tiempo total de la simulacion.

Nota 1: puede que necesite cambiar el nombre de los directorios en la etiqueta #directorios del makefile (linea 1).
Nota 2: makefile espera que el archivo de testbench tenga el mismo nombre que su archivo fuente. En caso de que sea distinto, reemplazar SRC_FILE en las lineas de makefile correspondientes.



Para realizar un proyecto personal, desde su compilacion hasta la visualizacion en GtkView, ejecutar:

* 'make': ejecuta los comandos 1, 2 y 3 (leer make all).

* 'make all': ejecuta los comandos a continuacion, en una unica instruccion:
    1. 'make compile': compila los archivos de los directorios SRC_DIR y TB_DIR.
    2. 'make execute': ejecuta el testbench correspondiente a SRC_FILE.
    3. 'make run': corre el testbench correspondiente a TB_FILE, generando un archivo .vcd ejecutable.
    4. 'make view': ejecuta el archivo .vcd a traves de GtkWave, permitiendo visualizar las formas de onda.

Nota: si estos comandos se ejecutan en orden incorrecto, es probable que se obtenga un error. Para revertir esto, ejecutar 'make clean' y volver al paso '1.'.

* 'make clean': elimina los archivos .vcd y .cf generados. 
