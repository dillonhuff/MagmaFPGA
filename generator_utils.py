import os

import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

def module_string(includes, name, ports, body):
    mod_str = ""
    for include_name in includes:
        mod_str += '`ifndef ' + include_name.replace(".", "_") + '_included\n'
        mod_str += '`define ' + include_name.replace(".", "_") + '_included 1\n'
        mod_str += '`include \"' + include_name + '\"\n'
        mod_str += '`endif\n\n'

    mod_str += '\n\n'

    mod_str += 'module ' + name + '(\n'

    for i in range(0, len(ports)):
        mod_str += '\t' + ports[i]
        if (i != (len(ports) - 1)):
            mod_str += ',\n'

    mod_str += '\n\t);\n\n'

    mod_str += body

    mod_str += '\n\n'
    mod_str += 'endmodule'

    return mod_str

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

