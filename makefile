# directorios
SRC_DIR = ./source
CMP_DIR = ./components
TB_DIR = ./testbench

# archivos
SRC_FILE = rx_uart
TB_FILE = $(SRC_FILE)_tb
VCD_FILE = $(TB_FILE).vcd

# extensiones
EXT = .vhd


# ghdl config
TIME = 8000ns
GHDL_SIM_TIME = --stop-time=$(TIME)
COMPILATION_VERSION = --std=08


.DEFAULT_GOAL := make



make: compile execute run

all: compile execute run view

compile:
	ghdl -a $(COMPILATION_VERSION) $(SRC_DIR)/*.vhd
	ghdl -a $(COMPILATION_VERSION) $(CMP_DIR)/*.vhd
	ghdl -a $(COMPILATION_VERSION) $(TB_DIR)/*.vhd

execute:
	ghdl -e $(COMPILATION_VERSION) $(SRC_FILE)_tb

run:
	ghdl -r $(COMPILATION_VERSION) $(TB_FILE) $(GHDL_SIM_TIME) --vcd=$(SRC_FILE)_tb.vcd

view:
	gtkwave $(VCD_FILE)

clean: 
	rm *.vcd
	rm work-obj08.cf