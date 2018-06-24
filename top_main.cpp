#include "Vtop.h"
#include "verilated.h"

#include <iostream>
#include <vector>

using namespace std;

#define POSEDGE(signal, val) (signal) = 0; (val)->eval(); (signal) = 1; (val)->eval();
#define NEGEDGE(signal, val) (signal) = 1; (val)->eval(); (signal) = 0; (val)->eval();
#define RESET(signal, val) POSEDGE((signal), (val)); NEGEDGE((signal), (val)); POSEDGE((signal), (val));

// In0 In1 In2
// 1   2   3
// 4   5   6
// 7   8   9
// Ot0 Ot1 Ot2

// What should this format be?
// Map from tile components to configurations?

// tile_id_end = 15
// tile_id_begin = 0
// mod_id_end = 31
// mod_id_begin = 16

// clb_addr = 4
// cb1_addr = 5
// cb0_addr = 6
// sb_addr = 7

enum PE_component {
  PE_COMPONENT_CB0,
  PE_COMPONENT_CB1,
  PE_COMPONENT_SB,
  PE_COMPONENT_CLB,
  PE_COMPONENT_IO
};

enum CLB_op {
  CLB_OP_AND,
  CLB_OP_OR,
  CLB_OP_XOR,
  CLB_OP_NOT
};

enum CB_dir {
  CB_INPUT,
  CB_OUTPUT
};

enum PnR_cmd_type {
  PNR_CMD_CB,
  PNR_CMD_SB,
  PNR_CMD_CLB,
  PNR_CMD_IO,
  PNR_CMD_DUMMY
};

struct SB_cmd {
  uint32_t in_side;
  uint32_t out_side;
  uint32_t track;
};

struct PnR_cmd {
  uint32_t tile_id;
  PE_component comp;

  PnR_cmd_type tp;

  // SB command
  std::vector<SB_cmd> sb_cmds;

  // CB command
  uint32_t cb_num;
  bool take_from_input;
  uint32_t track_num;

  // CLB command
  CLB_op op;

  // IO command
  uint32_t input_track;
};

struct config_address_structure {
  const int width;
  const int mod_id_begin;
  const int mod_id_end;
  const int tile_id_begin;
  const int tile_id_end;

  config_address_structure(const int width_,
                           const int mod_id_begin_,
                           const int mod_id_end_,
                           const int tile_id_begin_,
                           const int tile_id_end_) :
    width(width_),
    mod_id_begin(mod_id_begin_),
    mod_id_end(mod_id_end_),
    tile_id_begin(tile_id_begin_),
    tile_id_end(tile_id_end_) {

    // Only support width 32 addresses for now
    assert(width == 32);
    assert((mod_id_end - mod_id_begin) == (tile_id_end - tile_id_begin));
  }

  uint32_t config_data_for(const PnR_cmd cmd) {
    if (cmd.tp == PNR_CMD_CLB) {
      return clb_op(cmd.op);
    }

    if (cmd.tp == PNR_CMD_IO) {
      return cmd.input_track;
    }

    if (cmd.tp == PNR_CMD_SB) {
      uint32_t val = 0;

      for (auto sb_cmd : cmd.sb_cmds) {
        val |= route_sb(sb_cmd.in_side, sb_cmd.out_side, sb_cmd.track);
      }
      return val;
    }

    if (cmd.tp == PNR_CMD_CB) {
      return route_sb_to_cb(cmd.track_num, cmd.take_from_input);
    }
    
    assert(false);
  }

  uint32_t clb_op(const CLB_op op) {
    switch (op) {
    case CLB_OP_AND:
      return 0;
    case CLB_OP_OR:
      return 1;
    case CLB_OP_XOR:
      return 2;
    case CLB_OP_NOT:
      return 3;
    default:
      assert(false);
    }
    
  }

  uint32_t route_sb_to_cb(const uint32_t track, bool is_input) {
    assert(track < 4);
    uint32_t val = track;

    if (!is_input) {
      val = val + 4;
    }

    return val;
  }
  
  uint32_t route_sb(const uint32_t src_side,
                    const uint32_t dest_side,
                    const uint32_t track) {
    // TODO: Handle CLB output!
    assert(src_side < 5);
    assert(dest_side < 4);

    assert(src_side != dest_side);

    uint32_t val = 0;
    uint32_t offset = dest_side*8 + track*2;
    // If the source is the CLB then use dest side
    uint32_t res = (src_side == 4) ? dest_side : src_side;

    val |= (res << offset);

    return val;
  }

  uint32_t component_address(const PE_component component) {
    if (component == PE_COMPONENT_IO) {
      return 0;
    }

    if (component == PE_COMPONENT_CB0) {
      return 4;
    }

    if (component == PE_COMPONENT_CB1) {
      return 5;
    }

    if (component == PE_COMPONENT_SB) {
      return 6;
    }

    if (component == PE_COMPONENT_CLB) {
      return 7;
    }
    
    assert(false);
  }

  uint32_t config_address(const uint32_t tile_id,
                          const PE_component component) {
    uint32_t addr = 0;
    addr |= (tile_id << tile_id_begin);
    addr |= (component_address(component) << mod_id_begin);
    return addr;
  }
};

config_address_structure default_addr_gen() {
  return config_address_structure(32, 16, 31, 0, 15);
}
// First test: passthrough routing In0 -> 1 -> 4 -> 7 -> Ot0 on track 0
// In0 In1 In2
// 4     5     6
// 7     8     9
// 10    11    12
// Ot1  Ot2  Ot3
void handwritten_routing_test() {
  Vtop* top = new Vtop();

  RESET(top->reset, top);

  config_address_structure addr_gen = default_addr_gen();
  // (32, 16, 31, 0, 15);
  auto addr0 = addr_gen.config_address(4, PE_COMPONENT_SB);
  uint32_t data0 = addr_gen.route_sb(3, 1, 0);

  top->config_addr = addr0;
  top->config_data = data0;
  
  POSEDGE(top->clk, top);

  addr0 = addr_gen.config_address(7, PE_COMPONENT_SB);

  top->config_addr = addr0;
  top->config_data = data0;
  
  POSEDGE(top->clk, top);

  addr0 = addr_gen.config_address(10, PE_COMPONENT_SB);

  top->config_addr = addr0;
  top->config_data = data0;
  
  POSEDGE(top->clk, top);
  
  top->in_wire_0 = 1;
  POSEDGE(top->clk, top);

  assert(top->out_wire_0 == top->in_wire_0);

  delete top;
}

void route_neg_test() {
  Vtop* top = new Vtop();

  RESET(top->reset, top);

  // Route from IO to tile 10 at bottom of design
  config_address_structure addr_gen = default_addr_gen();
  auto addr0 = addr_gen.config_address(4, PE_COMPONENT_SB);
  uint32_t data0 = addr_gen.route_sb(3, 1, 0);

  top->config_addr = addr0;
  top->config_data = data0;
  
  POSEDGE(top->clk, top);

  top->config_addr = addr_gen.config_address(7, PE_COMPONENT_SB);
  top->config_data = addr_gen.route_sb(3, 1, 0);
  
  POSEDGE(top->clk, top);

  // This is the tile where the operation is done

  // -- Route PE tile output to side 1 track 1
  // -- Route PE tile input side 3, track 0 to output side 0 track 0
  top->config_addr = addr_gen.config_address(10, PE_COMPONENT_SB);
  top->config_data = addr_gen.route_sb(4, 1, 1) | addr_gen.route_sb(3, 0, 0);
  
  POSEDGE(top->clk, top);

  // Route output side 0, track 0 to CLB operand 0
  top->config_addr = addr_gen.config_address(10, PE_COMPONENT_CB0);
  top->config_data = addr_gen.route_sb_to_cb(0, false);
  POSEDGE(top->clk, top);

  // Set CLB op to negate operand0
  top->config_addr = addr_gen.config_address(10, PE_COMPONENT_CLB);
  top->config_data = addr_gen.clb_op(CLB_OP_NOT);
  
  POSEDGE(top->clk, top);

  // CLB does not matter, this is an io tile. TODO: Create IO tile component
  top->config_addr = addr_gen.config_address(1, PE_COMPONENT_IO);
  top->config_data = 1;
  
  POSEDGE(top->clk, top);

  top->config_addr = 0;
  top->config_data = 0;
  
  top->in_wire_0 = 1;
  POSEDGE(top->clk, top);

  POSEDGE(top->clk, top);

  cout << "top->out_wire_0 = " << (int) top->out_wire_0 << endl;
  assert(top->out_wire_0 == (~(top->in_wire_0) & 0x01));

  top->in_wire_0 = 0;
  POSEDGE(top->clk, top);

  cout << "Final neg cycle" << endl;
  POSEDGE(top->clk, top);

  cout << "top->out_wire_0 = " << (int) top->out_wire_0 << endl;
  assert(top->out_wire_0 == (~(top->in_wire_0) & 0x01));

  delete top;
}

void load_pnr_commands(const std::vector<PnR_cmd>& commands,
                       Vtop* top) {

  RESET(top->reset, top);

  auto addr_gen = default_addr_gen();
  for (auto cmd : commands) {
    top->config_addr = addr_gen.config_address(cmd.tile_id, cmd.comp);
    top->config_data = addr_gen.config_data_for(cmd);
    POSEDGE(top->clk, top);
  }
  
  top->config_addr = 0;
  top->config_data = 0;
  POSEDGE(top->clk, top);
}

PnR_cmd make_io_cmd(const uint32_t tile_no,
                    const uint32_t input_track) {
  PnR_cmd cmd;
  cmd.comp = PE_COMPONENT_IO;
  cmd.tp = PNR_CMD_IO;
  cmd.tile_id = tile_no;
  cmd.input_track = input_track;

  return cmd;
}

PnR_cmd make_cb_cmd(const uint32_t tile_no,
                    const uint32_t cb_num,
                    const uint32_t track_num,
                    const CB_dir dir) {
  assert((cb_num == 0) || (cb_num == 1));

  PnR_cmd cmd;
  cmd.comp = cb_num == 0 ? PE_COMPONENT_CB0 : PE_COMPONENT_CB1;
  cmd.tp = PNR_CMD_CB;
  cmd.tile_id = tile_no;
  cmd.take_from_input = dir == CB_INPUT;
  cmd.track_num = track_num;

  return cmd;
}

PnR_cmd make_clb_cmd(const uint32_t tile_no,
                    const CLB_op op) {
  PnR_cmd cmd;
  cmd.comp = PE_COMPONENT_CLB;
  cmd.tp = PNR_CMD_CLB;
  cmd.tile_id = tile_no;
  cmd.op = op;

  return cmd;
}

PnR_cmd make_sb_cmd(const uint32_t tile_no,
                    const std::vector<SB_cmd>& sb_cmds) {
  PnR_cmd cmd;
  cmd.comp = PE_COMPONENT_SB;
  cmd.tp = PNR_CMD_SB;
  cmd.tile_id = tile_no;
  cmd.sb_cmds = sb_cmds;

  return cmd;
}

void generated_and_test() {
  cout << "Starting and test" << endl;

  Vtop* top = new Vtop();

  std::vector<PnR_cmd> and_cmds;
  and_cmds.push_back(make_sb_cmd(5, {{3, 1, 0}}));

  and_cmds.push_back(make_sb_cmd(6, {{3, 1, 0}}));
  and_cmds.push_back(make_sb_cmd(9, {{3, 2, 0}}));

  and_cmds.push_back(make_sb_cmd(8, {{3, 1, 0}, {4, 1, 1}}));

  // side 0 track 0 out -> operand0
  // side 1 track 1 out -> operand1
  and_cmds.push_back(make_cb_cmd(8, 0, 0, CB_INPUT));
  and_cmds.push_back(make_cb_cmd(8, 1, 0, CB_OUTPUT));
  and_cmds.push_back(make_clb_cmd(8, CLB_OP_AND));

  // Route result down on track 1
  and_cmds.push_back(make_sb_cmd(11, {{3, 1, 1}}));
  and_cmds.push_back(make_io_cmd(2, 1));

  load_pnr_commands(and_cmds, top);

  top->in_wire_1 = 1;
  top->in_wire_2 = 1;

  POSEDGE(top->clk, top);

  assert(top->out_wire_1 == (top->in_wire_1 && top->in_wire_2));

  top->in_wire_1 = 0;
  top->in_wire_2 = 1;

  POSEDGE(top->clk, top);

  assert(top->out_wire_1 == (top->in_wire_1 && top->in_wire_2));
  
  delete top;
}

int main() {


  handwritten_routing_test();
  cout << "Passed handwritten test" << endl;
  route_neg_test();
  cout << "Passed route neg and handwritten tests!" << endl;
  generated_and_test();  
  
  cout << "$$$ top tests passed" << endl;
}
