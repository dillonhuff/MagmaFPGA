#include "Vconfigurable_logic_block.h"
#include "verilated.h"

#include <iostream>

using namespace std;

#define POSEDGE(signal, val) (signal) = 0; (val)->eval(); (signal) = 1; (val)->eval(); cout << "POSEDGE DONE" << endl;
#define NEGEDGE(signal, val) (signal) = 1; (val)->eval(); (signal) = 0; (val)->eval();
#define RESET(signal, val) POSEDGE((signal), (val)); NEGEDGE((signal), (val)); POSEDGE((signal), (val));

#define POSEDGE_CLK(signal) POSEDGE((signal)->clk, (signal))
#define NEGEDGE_CLK(signal) NEGEDGE((signal)->clk, (signal))

int main() {
  Vconfigurable_logic_block* top = new Vconfigurable_logic_block();

  top->eval();
  RESET(top->rst, top);

  assert(top->result == (top->operand0 && top->operand1));

  top->config_en = 0;
  top->operand0 = 1;
  top->operand1 = 1;

  POSEDGE(top->clk, top);

  assert(top->result == 1);

  top->operand0 = 0;
  top->operand1 = 1;

  POSEDGE(top->clk, top);

  assert(top->result == 0);
  
  // Set new config
  top->config_en = 1;
  top->config_data = 1; // Op = OR

  POSEDGE(top->clk, top);

  top->config_en = 0;
  top->operand0 = 1;
  top->operand1 = 0;

  POSEDGE(top->clk, top);

  assert(top->result == 1);

  top->operand0 = 0;
  top->operand1 = 0;

  POSEDGE_CLK(top);

  assert(top->result == 0);

  top->config_en = 0;
  top->config_data = 3;

  POSEDGE_CLK(top);

  POSEDGE_CLK(top);

  assert(top->result == 0);

  // Test not
  top->config_en = 1;
  top->config_data = 3;

  POSEDGE_CLK(top);

  top->config_en = 0;
  top->operand0 = 0;
  POSEDGE_CLK(top);

  assert(top->result == 1);
  
  delete top;
}
