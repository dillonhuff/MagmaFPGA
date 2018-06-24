#from magma import
import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

import os

def os_cmd(command_string):
    res = os.system(command_string)

    if (res != 0):
        print( 'FAILED COMMAND: ', command_string )
        assert(False)

# Module by module tests
def build_module_with_main(mod_name, main_name):
    v_command = "verilator -Wno-DECLFILENAME --cc " + mod_name + ".v --exe " + main_name + " --top-module " + mod_name + " -CFLAGS -std=c++14 -CFLAGS -march=native"
    verilate = os.system(v_command);

    if (verilate != 0):
        print( 'ERROR: ' + mod_name + ' verilation failure' )
        assert(False)

    m_command = "make -C obj_dir -j -f V" + mod_name + ".mk V" + mod_name

    make_cmd = os.system(m_command)

    if (make_cmd != 0):
        print( 'ERROR: ' + mod_name + ' could not make verilated code' )
        assert(False)

    run_cmd = os.system('./obj_dir/V' + mod_name)

    if (run_cmd != 0):
        print( 'ERROR: ' + mod_name + ' tests failed')
        assert(False)

def build_module(mod_name):
    build_module_with_main(mod_name, mod_name + '_main.cpp')

def add_verilator_warn_silencing(vfile):
    vf = open(vfile, 'r')
    vtext = vf.read()
    vf.close()

    vf = open(vfile, 'w')
    vf.write('/* verilator lint_off UNOPTFLAT */\n' + vtext)
    vf.close()

def build_modules_from_magma(modlist):
    dummy_top = m.DefineCircuit("dummy_top")
    for mod_info in modlist:
        mod_name = mod_info[0]
        mod = mod_info[1]

        mod()
    m.compile("dummy_top", dummy_top, output="coreir")
    os_cmd("coreir -i " + mod_name + ".json" + " -o " + mod_name + ".v")
        
def build_module_from_magma(mod_name, magma_circuit):
    m.compile(mod_name, magma_circuit, output="coreir")
    m.clear_cachedFunctions()
    os_cmd("coreir -i " + mod_name + ".json" + " -o " + mod_name + ".v")
    add_verilator_warn_silencing(mod_name + ".v")
    build_module(mod_name)

grid_len = 3
top_mod = build_top_mod(grid_len, grid_len, grid_len, grid_len)
name = 'top'
top_file = open(name + '.v', 'w')
top_file.write(build_verilog_string(top_mod))
top_file.close()


def create_connect_box():
    cb = m.DefineCircuit("connect_box",
                          "operand0", m.In(m.Bits(1)),
                          "operand1", m.In(m.Bits(1)),
                          "result", m.Out(m.Bits(1)),
                          "clk", m.In(m.Clock),
                          "rst", m.In(m.Reset),
                          "config_data", m.In(m.Bits(32)),
                          "config_en", m.In(m.Bit))

    # Configuration data
    config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)

    m.wire(cb.config_data, config_reg.I)
    m.wire(cb.clk, config_reg.CLK)
    m.wire(cb.config_en, config_reg.CE)

    rst_inv = mantle.Invert(1)
    m.wire(rst_inv.I[0], cb.rst)
    m.wire(rst_inv.O[0], config_reg.RESET)

    # Operations in CB
    and_op = mantle.And(2, 1)
    m.wire(cb.operand0, and_op.I0)
    m.wire(cb.operand1, and_op.I1)

    or_op = mantle.Or(2, 1)
    m.wire(cb.operand0, or_op.I0)
    m.wire(cb.operand1, or_op.I1)

    xor_op = mantle.XOr(2, 1)
    m.wire(cb.operand0, xor_op.I0)
    m.wire(cb.operand1, xor_op.I1)

    not_op = mantle.Invert(1)
    m.wire(cb.operand0, not_op.I)
    
    # Config mux
    config_mux = mantle.Mux(height=4, width=1)
    m.wire(config_mux.O, cb.result)
    m.wire(config_mux.S, config_reg.O[0:2])
    
    m.wire(and_op.O, config_mux.I0)
    m.wire(or_op.O, config_mux.I1)
    m.wire(xor_op.O, config_mux.I2)
    m.wire(not_op.O, config_mux.I3)


    return cb

#build_module("configurable_logic_block")
# build_modules_from_magma([("configurable_logic_block", create_clb()),
#                           ('connect_box', create_connect_box())])
#build_module_from_magma("configurable_logic_block", create_clb())
# build_module_from_magma('connect_box', create_connect_box())
# build_module('switch_box')
# build_module('top')
