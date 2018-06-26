from generator_utils import os_cmd, build_module_from_magma, build_module

os_cmd("python3 magma_gen_top.py")
os_cmd("python3 magma_gen_io1out.py")
os_cmd("python3 magma_gen_io1in.py")
os_cmd("python3 magma_gen_pe.py")
os_cmd("python3 magma_gen_cb.py")
os_cmd("python3 magma_gen_clb.py")
os_cmd("python3 magma_gen_sb.py")
