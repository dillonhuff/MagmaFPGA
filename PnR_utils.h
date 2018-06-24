#pragma once

#include <vector>
#include <iostream>

using namespace std;

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

static inline config_address_structure default_addr_gen() {
  return config_address_structure(32, 16, 31, 0, 15);
}

static inline PnR_cmd make_io_cmd(const uint32_t tile_no,
                                  const uint32_t input_track) {
  PnR_cmd cmd;
  cmd.comp = PE_COMPONENT_IO;
  cmd.tp = PNR_CMD_IO;
  cmd.tile_id = tile_no;
  cmd.input_track = input_track;

  return cmd;
}

static inline PnR_cmd make_cb_cmd(const uint32_t tile_no,
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

static inline PnR_cmd make_clb_cmd(const uint32_t tile_no,
                    const CLB_op op) {
  PnR_cmd cmd;
  cmd.comp = PE_COMPONENT_CLB;
  cmd.tp = PNR_CMD_CLB;
  cmd.tile_id = tile_no;
  cmd.op = op;

  return cmd;
}

static inline PnR_cmd make_sb_cmd(const uint32_t tile_no,
                    const std::vector<SB_cmd>& sb_cmds) {
  PnR_cmd cmd;
  cmd.comp = PE_COMPONENT_SB;
  cmd.tp = PNR_CMD_SB;
  cmd.tile_id = tile_no;
  cmd.sb_cmds = sb_cmds;

  return cmd;
}
