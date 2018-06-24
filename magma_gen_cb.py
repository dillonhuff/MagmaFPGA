import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

from generator_utils import build_module_from_magma
from magma_codegen import create_connect_box

import os

# def create_connect_box():
#     cb = m.DefineCircuit("connect_box",
#                          "clk", m.In(m.Clock),
#                          "rst", m.In(m.Reset),
#                          "config_data", m.In(m.Bits(32)),
#                          "config_en", m.In(m.Bit),

#                          "track_0_in", m.In(m.Bit),
#                          "track_1_in", m.In(m.Bit),
#                          "track_2_in", m.In(m.Bit),
#                          "track_3_in", m.In(m.Bit),

#                          "track_0_out", m.In(m.Bit),
#                          "track_1_out", m.In(m.Bit),
#                          "track_2_out", m.In(m.Bit),
#                          "track_3_out", m.In(m.Bit),
                         
#                          "out", m.Out(m.Bits(1)))

#     # Configuration data
#     config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)

#     m.wire(cb.config_data, config_reg.I)
#     m.wire(cb.clk, config_reg.CLK)
#     m.wire(cb.config_en, config_reg.CE)

#     rst_inv = mantle.Invert(1)
#     m.wire(rst_inv.I[0], cb.rst)
#     m.wire(rst_inv.O[0], config_reg.RESET)

#     # Config mux
#     config_mux = mantle.Mux(height=8, width=1)
#     m.wire(config_mux.O, cb.out)
#     m.wire(config_mux.S, config_reg.O[0:3])
    
#     m.wire(cb.track_0_in, config_mux.I0[0])
#     m.wire(cb.track_1_in, config_mux.I1[0])
#     m.wire(cb.track_2_in, config_mux.I2[0])
#     m.wire(cb.track_3_in, config_mux.I3[0])

#     m.wire(cb.track_0_out, config_mux.I4[0])
#     m.wire(cb.track_1_out, config_mux.I5[0])
#     m.wire(cb.track_2_out, config_mux.I6[0])
#     m.wire(cb.track_3_out, config_mux.I7[0])

#     return cb

build_module_from_magma('connect_box', create_connect_box())
