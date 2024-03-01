
C_SRC    := $(abspath csrc/main.cpp)
V_SRC    := $(abspath vsrc/TOP.v)

TOP_NAME = TOP

BIN = $(TOP_NAME)

VERILATOR_FLAG += --build --cc --exe --trace-fst $(ARGS)

all: clean sim wave

$(BIN):$(V_SRC)  $(C_SRC) 
	verilator $(VERILATOR_FLAG) \
		  --top-module $(TOP_NAME) \
		  $(V_SRC) $(C_SRC) \
		  --CFLAGS -g \
		  -o $(BIN) 

bin: clean $(BIN)
sim: $(BIN)
	obj_dir/$^

wave:
	gtkwave wave/wave.fst wave/base.gtkw 

clean:
	@rm -rf obj_dir
	@rm -rf wave/wave.fst


.PHONY: bin sim wave clean all
