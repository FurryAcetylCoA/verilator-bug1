#include "verilated.h"
#include "VTOP.h"
#include "verilated_fst_c.h"
VTOP dut;
VerilatedContext *contextp;
VerilatedFstC *tfp;

static void initVerilator(int argc, char **argv);

void single_cycle();
void release_reset_single_cycle();

int main(int argc, char **argv) {
  initVerilator(argc, argv);

  // Release soc reset after 3 cycle
  for(int i = 0;i < 10; i ++){
    dut.reset = (i < 3);
    single_cycle();
  }

  dut.final();
  tfp->close();
  return 0; 
}

void single_cycle() {
  contextp->timeInc(1);
  dut.clock = 1;
  dut.eval();
  tfp->dump(contextp->time());

  contextp->timeInc(1);
  dut.clock = 0;
  dut.eval();
  tfp->dump(contextp->time());
}

void initVerilator(int argc, char **argv) {
  Verilated::traceEverOn(true);
  Verilated::mkdir("wave");
  contextp = new VerilatedContext;
  contextp->commandArgs(argc, argv);
  tfp = new VerilatedFstC;
  dut.trace(tfp, 8);
  tfp->open("wave/wave.fst");
}
