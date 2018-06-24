from generator_utils import os_cmd, build_module_from_magma, build_module
from gen_top import build_top_mod, build_verilog_string

from verilog_cleaner import remove_verilog_duplicates

grid_len = 3
top_mod = build_top_mod(grid_len, grid_len, grid_len, grid_len)
name = 'top'
top_file = open(name + '.v', 'w')
top_file.write(build_verilog_string(top_mod))
top_file.close()

#os_cmd("python3 magma_gen_top.py")
os_cmd("python3 magma_gen_io1out.py")
os_cmd("python3 magma_gen_io1in.py")
os_cmd("python3 magma_gen_pe.py")
os_cmd("python3 magma_gen_cb.py")
os_cmd("python3 magma_gen_clb.py")
os_cmd("python3 magma_gen_sb.py")


remove_verilog_duplicates(["io1in_pad.v", "io1out_pad.v", "pe_tile.v", "connect_box.v", "switch_box.v", "configurable_logic_block.v"])
build_module('top')
