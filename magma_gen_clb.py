import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

from generator_utils import build_module_from_magma
from magma_codegen import create_clb

import os

# def create_clb():
#     clb = m.DefineCircuit("configurable_logic_block",
#                           "operand0", m.In(m.Bits(1)),
#                           "operand1", m.In(m.Bits(1)),
#                           "result", m.Out(m.Bits(1)),
#                           "clk", m.In(m.Clock),
#                           "rst", m.In(m.Reset),
#                           "config_data", m.In(m.Bits(32)),
#                           "config_en", m.In(m.Bit))

#     # Configuration data
#     config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)
#     #config_reg = mantle.Register(32, init=0, has_reset=True)

#     m.wire(clb.config_data, config_reg.I)
#     m.wire(clb.clk, config_reg.CLK)
#     m.wire(clb.config_en, config_reg.CE)

#     rst_inv = mantle.Invert(1)
#     m.wire(rst_inv.I[0], clb.rst)
#     m.wire(rst_inv.O[0], config_reg.RESET)

#     # Operations in CLB
#     and_op = mantle.And(2, 1)
#     m.wire(clb.operand0, and_op.I0)
#     m.wire(clb.operand1, and_op.I1)

#     or_op = mantle.Or(2, 1)
#     m.wire(clb.operand0, or_op.I0)
#     m.wire(clb.operand1, or_op.I1)

#     xor_op = mantle.XOr(2, 1)
#     m.wire(clb.operand0, xor_op.I0)
#     m.wire(clb.operand1, xor_op.I1)

#     not_op = mantle.Invert(1)
#     m.wire(clb.operand0, not_op.I)
    
#     # Config mux
#     config_mux = mantle.Mux(height=4, width=1)
#     m.wire(config_mux.O, clb.result)
#     m.wire(config_mux.S, config_reg.O[0:2])
    
#     m.wire(and_op.O, config_mux.I0)
#     m.wire(or_op.O, config_mux.I1)
#     m.wire(xor_op.O, config_mux.I2)
#     m.wire(not_op.O, config_mux.I3)


#     return clb

build_module_from_magma('configurable_logic_block', create_clb())
