#include "Vswitch_box.h"
#include "verilated.h"

#include <iostream>
#include <vector>
#include "PnR_utils.h"

#define POSEDGE(signal, val) (signal) = 0; (val)->eval(); (signal) = 1; (val)->eval();
#define NEGEDGE(signal, val) (signal) = 1; (val)->eval(); (signal) = 0; (val)->eval();
#define RESET(signal, val) POSEDGE((signal), (val)); NEGEDGE((signal), (val)); POSEDGE((signal), (val));

// static inline void load_pnr_commands(const std::vector<PnR_cmd>& commands,
//                                      Vswitch_box* top) {

//   RESET(top->rst, top);

//   auto addr_gen = default_addr_gen();
//   for (auto cmd : commands) {
//     top->config_addr = addr_gen.config_address(cmd.tile_id, cmd.comp);
//     top->config_data = addr_gen.config_data_for(cmd);
//     POSEDGE(top->clk, top);
//   }
  
//   top->config_addr = 0;
//   top->config_data = 0;
//   POSEDGE(top->clk, top);
// }

void handwritten_passthrough_test() {
  Vswitch_box* top = new Vswitch_box();

  RESET(top->rst, top);

  uint32_t data0 = 3 << 8;
  top->config_en = 1;
  top->config_data = data0;
  
  POSEDGE(top->clk, top);

  top->side_3_track_0_in = 1;
  POSEDGE(top->clk, top);

  assert(top->side_1_track_0_out == top->side_3_track_0_in);

  top->side_3_track_0_in = 0;
  POSEDGE(top->clk, top);

  assert(top->side_1_track_0_out == top->side_3_track_0_in);

  delete top;
}

void route_1_to_3() {
  Vswitch_box* top = new Vswitch_box();

  RESET(top->rst, top);

  auto addr_gen = default_addr_gen();
  
  PnR_cmd cmd = make_sb_cmd(6, {{1, 3, 2}});
  top->config_en = 1;
  top->config_data = addr_gen.config_data_for(cmd);

  POSEDGE(top->clk, top);

  top->config_en = 0;
  top->side_1_track_2_in = 1;

  POSEDGE(top->clk, top);

  assert(top->side_1_track_2_in == top->side_3_track_2_out);

  delete top;

}

void route_0_to_2() {
  Vswitch_box* top = new Vswitch_box();

  RESET(top->rst, top);

  auto addr_gen = default_addr_gen();
  
  PnR_cmd cmd = make_sb_cmd(6, {{0, 2, 3}});
  top->config_en = 1;
  top->config_data = addr_gen.config_data_for(cmd);

  POSEDGE(top->clk, top);

  top->config_en = 0;
  top->side_0_track_3_in = 1;

  POSEDGE(top->clk, top);

  assert(top->side_0_track_3_in == top->side_2_track_3_out);

  top->config_en = 0;
  top->side_0_track_3_in = 0;

  POSEDGE(top->clk, top);

  assert(top->side_0_track_3_in == top->side_2_track_3_out);
  
  delete top;

}

void route_clb_to_1() {
  Vswitch_box* top = new Vswitch_box();

  RESET(top->rst, top);

  auto addr_gen = default_addr_gen();
  
  PnR_cmd cmd = make_sb_cmd(6, {{4, 1, 1}});
  top->config_en = 1;
  top->config_data = addr_gen.config_data_for(cmd);

  POSEDGE(top->clk, top);

  top->config_en = 0;
  top->clb_result = 1;

  POSEDGE(top->clk, top);

  assert(top->clb_result == top->side_1_track_1_out);

  delete top;

}

int main() {
  handwritten_passthrough_test();
  route_1_to_3();
  route_0_to_2();
  route_clb_to_1();
  cout << "$$$ Switch box tests passed" << endl;
}
