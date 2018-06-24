import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

from generator_utils import build_module_from_magma
from magma_codegen import create_io1out_pad
import os

# def create_io1out_pad():
#     cb = m.DefineCircuit("io1out_pad",
#                          "clk", m.In(m.Clock),
#                          "rst", m.In(m.Reset),
#                          "config_data", m.In(m.Bits(32)),
#                          "config_addr", m.In(m.Bits(32)),
#                          "tile_id", m.In(m.Bits(16)),

#                          "pin_0", m.In(m.Bit),
#                          "pin_1", m.In(m.Bit),
#                          "pin_2", m.In(m.Bit),
#                          "pin_3", m.In(m.Bit),
                         
#                          "top_pin", m.Out(m.Bits(1)))

#     # Configuration data
#     config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)
#     addr_match = mantle.EQ(16)
#     m.wire(addr_match.I0, cb.config_addr[0:16])
#     m.wire(addr_match.I1, cb.tile_id)
#     m.wire(addr_match.O, config_reg.CE)

#     m.wire(cb.config_data, config_reg.I)
#     m.wire(cb.clk, config_reg.CLK)

#     rst_inv = mantle.Invert(1)
#     m.wire(rst_inv.I[0], cb.rst)
#     m.wire(rst_inv.O[0], config_reg.RESET)

#     # Config mux
#     config_mux = mantle.Mux(height=4, width=1)
#     m.wire(config_mux.O, cb.top_pin)
#     m.wire(config_mux.S, config_reg.O[0:2])
    
#     m.wire(cb.pin_0, config_mux.I0[0])
#     m.wire(cb.pin_1, config_mux.I1[0])
#     m.wire(cb.pin_2, config_mux.I2[0])
#     m.wire(cb.pin_3, config_mux.I3[0])

#     return cb

build_module_from_magma('io1out_pad', create_io1out_pad())
