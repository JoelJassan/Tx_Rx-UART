# directorios
MAIN_DIR = ./main
SRC_DIR = ./source
CMP_DIR = ./components
TB_DIR  = ./testbench

# archivos
MAIN_FILE = tx_rx_uart
TB_FILE = $(MAIN_FILE)_tb
VCD_FILE = $(TB_FILE).vcd

# extensiones
EXT = .vhd


# ghdl config
TIME = 12ms
GHDL_SIM_TIME = --stop-time=$(TIME)
COMPILATION_VERSION = --std=08


.DEFAULT_GOAL := make



make: compile execute run

all: compile execute run view

compile:
	ghdl -a $(COMPILATION_VERSION) $(CMP_DIR)/*.vhd
	ghdl -a $(COMPILATION_VERSION) $(SRC_DIR)/*.vhd
	ghdl -a $(COMPILATION_VERSION) $(MAIN_DIR)/*.vhd
	ghdl -a $(COMPILATION_VERSION) $(TB_DIR)/*.vhd

execute:
	ghdl -e $(COMPILATION_VERSION) $(TB_FILE)

run:
	ghdl -r $(COMPILATION_VERSION) $(TB_FILE) $(GHDL_SIM_TIME) --vcd=$(MAIN_FILE)_tb.vcd

view:
	gtkwave $(VCD_FILE)

vcd:
	touch tmp.vcd

clean: 
	rm *.vcd
	rm work-obj08.cf