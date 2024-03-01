
C_SRC    := $(abspath csrc/main.cpp)
V_SRC    := $(abspath vsrc/TOP.v)

TOP_NAME = TOP

BIN = $(TOP_NAME)

VERILATOR_FLAG +=  -O3 --build --cc --exe --trace-fst

all: clean sim wave

$(BIN):$(V_SRC)  $(C_SRC) 
	verilator $(VERILATOR_FLAG) \
		  --top-module $(TOP_NAME) \
		  $(V_SRC) $(C_SRC) \
		  --CFLAGS -g \
		  -o $(BIN) 

sim: $(BIN)
	obj_dir/$^

wave:
	gtkwave wave/wave.fst wave/base.gtkw 

clean:
	@rm -rf obj_dir
	@rm -rf wave/wave.fst


.PHONY: sim wave clean all
