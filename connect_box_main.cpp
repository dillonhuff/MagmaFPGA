#include "Vconnect_box.h"
#include "verilated.h"

#include <iostream>
#include <vector>

using namespace std;

#define POSEDGE(signal, val) (signal) = 0; (val)->eval(); (signal) = 1; (val)->eval();
#define NEGEDGE(signal, val) (signal) = 1; (val)->eval(); (signal) = 0; (val)->eval();
#define RESET(signal, val) POSEDGE((signal), (val)); NEGEDGE((signal), (val)); POSEDGE((signal), (val));


int main() {
  Vconnect_box* top = new Vconnect_box();
  RESET(top->rst, top);

  top->track_0_in = 1;

  POSEDGE(top->clk, top);

  top->config_en = 1;
  top->config_data = 2 + 4;

  POSEDGE(top->clk, top);

  top->config_en = 0;

  top->track_0_in = 0;
  top->track_2_out = 1;

  POSEDGE(top->clk, top);

  assert(top->out == 1);

  top->track_2_out = 0;

  POSEDGE(top->clk, top);

  assert(top->out == 0);
  
  delete top;
  cout << "$$$ Connect box tests passed" << endl;
}
