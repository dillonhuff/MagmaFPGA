import magma as m
import mantle as mantle
from magma.testing import check_files_equal
from collections import namedtuple

from generator_utils import build_module_from_magma

import os

@m.cache_definition
def create_io1in_pad():
    cb = m.DefineCircuit("io1in_pad",
                         "clk", m.In(m.Clock),
                         "rst", m.In(m.Reset),

                         "pin_0", m.Out(m.Bit),
                         "pin_1", m.Out(m.Bit),
                         "pin_2", m.Out(m.Bit),
                         "pin_3", m.Out(m.Bit),
                         
                         "top_pin", m.In(m.Bits(1)))

    m.wire(cb.pin_0, cb.top_pin[0])
    m.wire(cb.pin_1, cb.top_pin[0])
    m.wire(cb.pin_2, cb.top_pin[0])
    m.wire(cb.pin_3, cb.top_pin[0])

    m.EndDefine()

    return cb

@m.cache_definition
def create_io1out_pad():
    cb = m.DefineCircuit("io1out_pad",
                         "clk", m.In(m.Clock),
                         "rst", m.In(m.Reset),
                         "config_data", m.In(m.Bits(32)),
                         "config_addr", m.In(m.Bits(32)),
                         "tile_id", m.In(m.Bits(16)),

                         "pin_0", m.In(m.Bit),
                         "pin_1", m.In(m.Bit),
                         "pin_2", m.In(m.Bit),
                         "pin_3", m.In(m.Bit),
                         
                         "top_pin", m.Out(m.Bits(1)))

    # Configuration data
    config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)
    addr_match = mantle.EQ(16)
    m.wire(addr_match.I0, cb.config_addr[0:16])
    m.wire(addr_match.I1, cb.tile_id)
    m.wire(addr_match.O, config_reg.CE)

    m.wire(cb.config_data, config_reg.I)
    m.wire(cb.clk, config_reg.CLK)

    rst_inv = mantle.Invert(1)
    m.wire(rst_inv.I[0], cb.rst)
    m.wire(rst_inv.O[0], config_reg.RESET)

    # Config mux
    config_mux = mantle.Mux(height=4, width=1)
    m.wire(config_mux.O, cb.top_pin)
    m.wire(config_mux.S, config_reg.O[0:2])
    
    m.wire(cb.pin_0, config_mux.I0[0])
    m.wire(cb.pin_1, config_mux.I1[0])
    m.wire(cb.pin_2, config_mux.I2[0])
    m.wire(cb.pin_3, config_mux.I3[0])

    m.EndDefine()

    return cb

@m.cache_definition
def create_connect_box():
    
    cb = m.DefineCircuit("connect_box",
                         "clk", m.In(m.Clock),
                         "rst", m.In(m.Reset),
                         "config_data", m.In(m.Bits(32)),
                         "config_en", m.In(m.Bit),

                         "track_0_in", m.In(m.Bit),
                         "track_1_in", m.In(m.Bit),
                         "track_2_in", m.In(m.Bit),
                         "track_3_in", m.In(m.Bit),

                         "track_0_out", m.In(m.Bit),
                         "track_1_out", m.In(m.Bit),
                         "track_2_out", m.In(m.Bit),
                         "track_3_out", m.In(m.Bit),
                         
                         "out", m.Out(m.Bits(1)))

    # Configuration data
    config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)

    m.wire(cb.config_data, config_reg.I)
    m.wire(cb.clk, config_reg.CLK)
    m.wire(cb.config_en, config_reg.CE)

    rst_inv = mantle.Invert(1)
    m.wire(rst_inv.I[0], cb.rst)
    m.wire(rst_inv.O[0], config_reg.RESET)

    # Config mux
    config_mux = mantle.Mux(height=8, width=1)
    m.wire(config_mux.O, cb.out)
    m.wire(config_mux.S, config_reg.O[0:3])
    
    m.wire(cb.track_0_in, config_mux.I0[0])
    m.wire(cb.track_1_in, config_mux.I1[0])
    m.wire(cb.track_2_in, config_mux.I2[0])
    m.wire(cb.track_3_in, config_mux.I3[0])

    m.wire(cb.track_0_out, config_mux.I4[0])
    m.wire(cb.track_1_out, config_mux.I5[0])
    m.wire(cb.track_2_out, config_mux.I6[0])
    m.wire(cb.track_3_out, config_mux.I7[0])

    m.EndDefine()
    
    return cb

@m.cache_definition
def create_clb(WireWidth):
    W = m.UInt(WireWidth)

    class CLB(m.Circuit):
        name = 'configurable_logic_block'
        IO = ["operand0", m.In(m.Bits(1)),
              "operand1", m.In(m.Bits(1)),
              "result", m.Out(m.Bits(1)),
              "clk", m.In(m.Clock),
              "rst", m.In(m.Reset),
              "config_data", m.In(m.Bits(32)),
              "config_en", m.In(m.Bit)]

        @classmethod
        def definition(io):

            # clb = m.DefineCircuit("configurable_logic_block",
            #                       "operand0", m.In(m.Bits(1)),
            #                       "operand1", m.In(m.Bits(1)),
            #                       "result", m.Out(m.Bits(1)),
            #                       "clk", m.In(m.Clock),
            #                       "rst", m.In(m.Reset),
            #                       "config_data", m.In(m.Bits(32)),
            #                       "config_en", m.In(m.Bit))

            # Configuration data
            config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)
            #config_reg = mantle.Register(32, init=0, has_reset=True)

            m.wire(io.config_data, config_reg.I)
            m.wire(io.clk, config_reg.CLK)
            m.wire(io.config_en, config_reg.CE)

            rst_inv = mantle.Invert(1)
            m.wire(rst_inv.I[0], io.rst)
            m.wire(rst_inv.O[0], config_reg.RESET)

            # Operations in CLB
            and_op = mantle.And(2, 1)
            m.wire(io.operand0, and_op.I0)
            m.wire(io.operand1, and_op.I1)

            or_op = mantle.Or(2, 1)
            m.wire(io.operand0, or_op.I0)
            m.wire(io.operand1, or_op.I1)

            xor_op = mantle.XOr(2, 1)
            m.wire(io.operand0, xor_op.I0)
            m.wire(io.operand1, xor_op.I1)

            not_op = mantle.Invert(1)
            m.wire(io.operand0, not_op.I)
    
            # Config mux
            config_mux = mantle.Mux(height=4, width=1)
            m.wire(config_mux.O, io.result)
            m.wire(config_mux.S, config_reg.O[0:2])
    
            m.wire(and_op.O, config_mux.I0)
            m.wire(or_op.O, config_mux.I1)
            m.wire(xor_op.O, config_mux.I2)
            m.wire(not_op.O, config_mux.I3)

    return CLB
#    return clb

@m.cache_definition
def create_switch_box():
    sb = m.DefineCircuit("switch_box",
                         "clk", m.In(m.Clock),
                         "rst", m.In(m.Reset),
                         "config_data", m.In(m.Bits(32)),
                         "config_en", m.In(m.Bit),

                         "side_0_track_0_in", m.In(m.Bits(1)),
                         "side_0_track_1_in", m.In(m.Bits(1)),
                         "side_0_track_2_in", m.In(m.Bits(1)),
                         "side_0_track_3_in", m.In(m.Bits(1)),

                         "side_1_track_0_in", m.In(m.Bits(1)),
                         "side_1_track_1_in", m.In(m.Bits(1)),
                         "side_1_track_2_in", m.In(m.Bits(1)),
                         "side_1_track_3_in", m.In(m.Bits(1)),

                         "side_2_track_0_in", m.In(m.Bits(1)),
                         "side_2_track_1_in", m.In(m.Bits(1)),
                         "side_2_track_2_in", m.In(m.Bits(1)),
                         "side_2_track_3_in", m.In(m.Bits(1)),

                         "side_3_track_0_in", m.In(m.Bits(1)),
                         "side_3_track_1_in", m.In(m.Bits(1)),
                         "side_3_track_2_in", m.In(m.Bits(1)),
                         "side_3_track_3_in", m.In(m.Bits(1)),

                         "clb_result", m.In(m.Bits(1)),

                         "side_0_track_0_out", m.Out(m.Bits(1)),
                         "side_0_track_1_out", m.Out(m.Bits(1)),
                         "side_0_track_2_out", m.Out(m.Bits(1)),
                         "side_0_track_3_out", m.Out(m.Bits(1)),

                         "side_1_track_0_out", m.Out(m.Bits(1)),
                         "side_1_track_1_out", m.Out(m.Bits(1)),
                         "side_1_track_2_out", m.Out(m.Bits(1)),
                         "side_1_track_3_out", m.Out(m.Bits(1)),

                         "side_2_track_0_out", m.Out(m.Bits(1)),
                         "side_2_track_1_out", m.Out(m.Bits(1)),
                         "side_2_track_2_out", m.Out(m.Bits(1)),
                         "side_2_track_3_out", m.Out(m.Bits(1)),

                         "side_3_track_0_out", m.Out(m.Bits(1)),
                         "side_3_track_1_out", m.Out(m.Bits(1)),
                         "side_3_track_2_out", m.Out(m.Bits(1)),
                         "side_3_track_3_out", m.Out(m.Bits(1))
    )

    # Configuration data
    config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)

    m.wire(sb.config_data, config_reg.I)
    m.wire(sb.clk, config_reg.CLK)
    m.wire(sb.config_en, config_reg.CE)

    rst_inv = mantle.Invert(1)
    m.wire(rst_inv.I[0], sb.rst)
    m.wire(rst_inv.O[0], config_reg.RESET)

    # switch muxes

    # side 0
    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_0_track_0_out)
    m.wire(switch_mux.S, config_reg.O[0:2])
    m.wire(switch_mux.I0, sb.clb_result)
    m.wire(switch_mux.I1, sb.side_1_track_0_in)
    m.wire(switch_mux.I2, sb.side_2_track_0_in)
    m.wire(switch_mux.I3, sb.side_3_track_0_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_0_track_1_out)
    m.wire(switch_mux.S, config_reg.O[2:4])
    m.wire(switch_mux.I0, sb.clb_result)
    m.wire(switch_mux.I1, sb.side_1_track_1_in)
    m.wire(switch_mux.I2, sb.side_2_track_1_in)
    m.wire(switch_mux.I3, sb.side_3_track_1_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_0_track_2_out)
    m.wire(switch_mux.S, config_reg.O[4:6])
    m.wire(switch_mux.I0, sb.clb_result)
    m.wire(switch_mux.I1, sb.side_1_track_2_in)
    m.wire(switch_mux.I2, sb.side_2_track_2_in)
    m.wire(switch_mux.I3, sb.side_3_track_2_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_0_track_3_out)
    m.wire(switch_mux.S, config_reg.O[6:8])
    m.wire(switch_mux.I0, sb.clb_result)
    m.wire(switch_mux.I1, sb.side_1_track_3_in)
    m.wire(switch_mux.I2, sb.side_2_track_3_in)
    m.wire(switch_mux.I3, sb.side_3_track_3_in)

    # side 1
    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_1_track_0_out)
    m.wire(switch_mux.S, config_reg.O[8:10])
    m.wire(switch_mux.I0, sb.side_0_track_0_in)
    m.wire(switch_mux.I1, sb.clb_result)
    m.wire(switch_mux.I2, sb.side_2_track_0_in)
    m.wire(switch_mux.I3, sb.side_3_track_0_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_1_track_1_out)
    m.wire(switch_mux.S, config_reg.O[10:12])
    m.wire(switch_mux.I0, sb.side_0_track_1_in)
    m.wire(switch_mux.I1, sb.clb_result)
    m.wire(switch_mux.I2, sb.side_2_track_1_in)
    m.wire(switch_mux.I3, sb.side_3_track_1_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_1_track_2_out)
    m.wire(switch_mux.S, config_reg.O[12:14])
    m.wire(switch_mux.I0, sb.side_0_track_2_in)
    m.wire(switch_mux.I1, sb.clb_result)
    m.wire(switch_mux.I2, sb.side_2_track_2_in)
    m.wire(switch_mux.I3, sb.side_3_track_2_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_1_track_3_out)
    m.wire(switch_mux.S, config_reg.O[14:16])
    m.wire(switch_mux.I0, sb.side_0_track_3_in)
    m.wire(switch_mux.I1, sb.clb_result)
    m.wire(switch_mux.I2, sb.side_2_track_3_in)
    m.wire(switch_mux.I3, sb.side_3_track_3_in)

    # side 2
    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_2_track_0_out)
    m.wire(switch_mux.S, config_reg.O[16:18])
    m.wire(switch_mux.I0, sb.side_0_track_0_in)
    m.wire(switch_mux.I1, sb.side_1_track_0_in)
    m.wire(switch_mux.I2, sb.clb_result)
    m.wire(switch_mux.I3, sb.side_3_track_0_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_2_track_1_out)
    m.wire(switch_mux.S, config_reg.O[18:20])
    m.wire(switch_mux.I0, sb.side_0_track_1_in)
    m.wire(switch_mux.I1, sb.side_1_track_1_in)
    m.wire(switch_mux.I2, sb.clb_result)
    m.wire(switch_mux.I3, sb.side_3_track_1_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_2_track_2_out)
    m.wire(switch_mux.S, config_reg.O[20:22])
    m.wire(switch_mux.I0, sb.side_0_track_2_in)
    m.wire(switch_mux.I1, sb.side_1_track_2_in)
    m.wire(switch_mux.I2, sb.clb_result)
    m.wire(switch_mux.I3, sb.side_3_track_2_in)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_2_track_3_out)
    m.wire(switch_mux.S, config_reg.O[22:24])
    m.wire(switch_mux.I0, sb.side_0_track_3_in)
    m.wire(switch_mux.I1, sb.side_1_track_3_in)
    m.wire(switch_mux.I2, sb.clb_result)
    m.wire(switch_mux.I3, sb.side_3_track_3_in)

    # side 3
    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_3_track_0_out)
    m.wire(switch_mux.S, config_reg.O[24:26])
    m.wire(switch_mux.I0, sb.side_0_track_0_in)
    m.wire(switch_mux.I1, sb.side_1_track_0_in)
    m.wire(switch_mux.I2, sb.side_2_track_0_in)
    m.wire(switch_mux.I3, sb.clb_result)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_3_track_1_out)
    m.wire(switch_mux.S, config_reg.O[26:28])
    m.wire(switch_mux.I0, sb.side_0_track_1_in)
    m.wire(switch_mux.I1, sb.side_1_track_1_in)
    m.wire(switch_mux.I2, sb.side_2_track_1_in)
    m.wire(switch_mux.I3, sb.clb_result)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_3_track_2_out)
    m.wire(switch_mux.S, config_reg.O[28:30])
    m.wire(switch_mux.I0, sb.side_0_track_2_in)
    m.wire(switch_mux.I1, sb.side_1_track_2_in)
    m.wire(switch_mux.I2, sb.side_2_track_2_in)
    m.wire(switch_mux.I3, sb.clb_result)

    switch_mux = mantle.Mux(height=4, width=1)
    m.wire(switch_mux.O, sb.side_3_track_3_out)
    m.wire(switch_mux.S, config_reg.O[30:32])
    m.wire(switch_mux.I0, sb.side_0_track_3_in)
    m.wire(switch_mux.I1, sb.side_1_track_3_in)
    m.wire(switch_mux.I2, sb.side_2_track_3_in)
    m.wire(switch_mux.I3, sb.clb_result)

    m.EndDefine()
    
    return sb

@m.cache_definition
def create_pe_tile():
    pe = m.DefineCircuit("pe_tile",
                         "clk", m.In(m.Clock),
                         "rst", m.In(m.Reset),
                         "config_data", m.In(m.Bits(32)),
                         "config_addr", m.In(m.Bits(32)),

                         "tile_id", m.In(m.Bits(16)),

                         "side_0_track_0_in", m.In(m.Bits(1)),
                         "side_0_track_1_in", m.In(m.Bits(1)),
                         "side_0_track_2_in", m.In(m.Bits(1)),
                         "side_0_track_3_in", m.In(m.Bits(1)),

                         "side_1_track_0_in", m.In(m.Bits(1)),
                         "side_1_track_1_in", m.In(m.Bits(1)),
                         "side_1_track_2_in", m.In(m.Bits(1)),
                         "side_1_track_3_in", m.In(m.Bits(1)),

                         "side_2_track_0_in", m.In(m.Bits(1)),
                         "side_2_track_1_in", m.In(m.Bits(1)),
                         "side_2_track_2_in", m.In(m.Bits(1)),
                         "side_2_track_3_in", m.In(m.Bits(1)),

                         "side_3_track_0_in", m.In(m.Bits(1)),
                         "side_3_track_1_in", m.In(m.Bits(1)),
                         "side_3_track_2_in", m.In(m.Bits(1)),
                         "side_3_track_3_in", m.In(m.Bits(1)),

#                         "clb_result", m.In(m.Bits(1)),

                         "side_0_track_0_out", m.Out(m.Bits(1)),
                         "side_0_track_1_out", m.Out(m.Bits(1)),
                         "side_0_track_2_out", m.Out(m.Bits(1)),
                         "side_0_track_3_out", m.Out(m.Bits(1)),

                         "side_1_track_0_out", m.Out(m.Bits(1)),
                         "side_1_track_1_out", m.Out(m.Bits(1)),
                         "side_1_track_2_out", m.Out(m.Bits(1)),
                         "side_1_track_3_out", m.Out(m.Bits(1)),

                         "side_2_track_0_out", m.Out(m.Bits(1)),
                         "side_2_track_1_out", m.Out(m.Bits(1)),
                         "side_2_track_2_out", m.Out(m.Bits(1)),
                         "side_2_track_3_out", m.Out(m.Bits(1)),

                         "side_3_track_0_out", m.Out(m.Bits(1)),
                         "side_3_track_1_out", m.Out(m.Bits(1)),
                         "side_3_track_2_out", m.Out(m.Bits(1)),
                         "side_3_track_3_out", m.Out(m.Bits(1))
    )

    # Configuration data
    config_reg = mantle.Register(32, init=0, has_ce=True, has_reset=True)
    addr_match = mantle.EQ(16)
    m.wire(addr_match.I0, pe.config_addr[0:16])
    m.wire(addr_match.I1, pe.tile_id)
    m.wire(addr_match.O, config_reg.CE)

    m.wire(pe.config_data, config_reg.I)
    m.wire(pe.clk, config_reg.CLK)

    rst_inv = mantle.Invert(1)
    m.wire(rst_inv.I[0], pe.rst)
    m.wire(rst_inv.O[0], config_reg.RESET)

    # Configure sb = 6, cb0 = 4, cb1 = 5, clb = 7
    config_cb0_eq = mantle.EQ(16)
    m.wire(m.uint(4, 16), config_cb0_eq.I0)
    m.wire(pe.config_addr[16:32], config_cb0_eq.I1)

    config_cb1_eq = mantle.EQ(16)
    m.wire(m.uint(5, 16), config_cb1_eq.I0)
    m.wire(pe.config_addr[16:32], config_cb1_eq.I1)

    config_clb_eq = mantle.EQ(16)
    m.wire(m.uint(7, 16), config_clb_eq.I0)
    m.wire(pe.config_addr[16:32], config_clb_eq.I1)

    config_sb_eq = mantle.EQ(16)
    m.wire(m.uint(6, 16), config_sb_eq.I0)
    m.wire(pe.config_addr[16:32], config_sb_eq.I1)

    config_cb0 = mantle.And(2, 1)
    m.wire(config_cb0.I0[0], config_cb0_eq.O)
    m.wire(config_cb0.I1[0], addr_match.O)

    config_cb1 = mantle.And(2, 1)
    m.wire(config_cb1.I0[0], config_cb1_eq.O)
    m.wire(config_cb1.I1[0], addr_match.O)

    config_clb = mantle.And(2, 1)
    m.wire(config_clb.I0[0], config_clb_eq.O)
    m.wire(config_clb.I1[0], addr_match.O)

    config_sb = mantle.And(2, 1)
    m.wire(config_sb.I0[0], config_sb_eq.O)
    m.wire(config_sb.I1[0], addr_match.O)
    
    # Add ands!

    # # CB0
    cb0 = create_connect_box()()
    m.wire(pe.clk, cb0.clk)
    m.wire(pe.rst, cb0.rst)
    m.wire(pe.config_data, cb0.config_data)
    m.wire(config_cb0.O[0], cb0.config_en)

    # CB1
    cb1 = create_connect_box()()
    m.wire(pe.clk, cb1.clk)
    m.wire(pe.rst, cb1.rst)
    m.wire(pe.config_data, cb1.config_data)
    m.wire(config_cb1.O[0], cb1.config_en)

    # CLB
    clb = create_clb(1)()
    m.wire(pe.clk, clb.clk)
    m.wire(pe.rst, clb.rst)
    m.wire(pe.config_data, clb.config_data)
    m.wire(config_clb.O[0], clb.config_en)

    # Switch box
    sb = create_switch_box()()
    m.wire(pe.clk, sb.clk)
    m.wire(pe.rst, sb.rst)
    m.wire(pe.config_data, sb.config_data)
    m.wire(config_sb.O[0], sb.config_en)

    m.wire(clb.result, sb.clb_result)

    m.wire(pe.side_0_track_0_in, sb.side_0_track_0_in)
    m.wire(pe.side_0_track_1_in, sb.side_0_track_1_in)
    m.wire(pe.side_0_track_2_in, sb.side_0_track_2_in)
    m.wire(pe.side_0_track_3_in, sb.side_0_track_3_in)

    m.wire(pe.side_1_track_0_in, sb.side_1_track_0_in)
    m.wire(pe.side_1_track_1_in, sb.side_1_track_1_in)
    m.wire(pe.side_1_track_2_in, sb.side_1_track_2_in)
    m.wire(pe.side_1_track_3_in, sb.side_1_track_3_in)

    m.wire(pe.side_2_track_0_in, sb.side_2_track_0_in)
    m.wire(pe.side_2_track_1_in, sb.side_2_track_1_in)
    m.wire(pe.side_2_track_2_in, sb.side_2_track_2_in)
    m.wire(pe.side_2_track_3_in, sb.side_2_track_3_in)
    
    m.wire(pe.side_3_track_0_in, sb.side_3_track_0_in)
    m.wire(pe.side_3_track_1_in, sb.side_3_track_1_in)
    m.wire(pe.side_3_track_2_in, sb.side_3_track_2_in)
    m.wire(pe.side_3_track_3_in, sb.side_3_track_3_in)

    m.wire(pe.side_0_track_0_out, sb.side_0_track_0_out)
    m.wire(pe.side_0_track_1_out, sb.side_0_track_1_out)
    m.wire(pe.side_0_track_2_out, sb.side_0_track_2_out)
    m.wire(pe.side_0_track_3_out, sb.side_0_track_3_out)

    m.wire(pe.side_1_track_0_out, sb.side_1_track_0_out)
    m.wire(pe.side_1_track_1_out, sb.side_1_track_1_out)
    m.wire(pe.side_1_track_2_out, sb.side_1_track_2_out)
    m.wire(pe.side_1_track_3_out, sb.side_1_track_3_out)

    m.wire(pe.side_2_track_0_out, sb.side_2_track_0_out)
    m.wire(pe.side_2_track_1_out, sb.side_2_track_1_out)
    m.wire(pe.side_2_track_2_out, sb.side_2_track_2_out)
    m.wire(pe.side_2_track_3_out, sb.side_2_track_3_out)
    
    m.wire(pe.side_3_track_0_out, sb.side_3_track_0_out)
    m.wire(pe.side_3_track_1_out, sb.side_3_track_1_out)
    m.wire(pe.side_3_track_2_out, sb.side_3_track_2_out)
    m.wire(pe.side_3_track_3_out, sb.side_3_track_3_out)
    
    # Wiring up CLB, SB and CBs
    m.wire(pe.side_0_track_0_in[0], cb0.track_0_in)
    m.wire(pe.side_0_track_1_in[0], cb0.track_1_in)
    m.wire(pe.side_0_track_2_in[0], cb0.track_2_in)
    m.wire(pe.side_0_track_3_in[0], cb0.track_3_in)

    m.wire(sb.side_0_track_0_out[0], cb0.track_0_out)
    m.wire(sb.side_0_track_1_out[0], cb0.track_1_out)
    m.wire(sb.side_0_track_2_out[0], cb0.track_2_out)
    m.wire(sb.side_0_track_3_out[0], cb0.track_3_out)

    m.wire(cb0.out, clb.operand0)

    m.wire(pe.side_1_track_0_in[0], cb1.track_0_in)
    m.wire(pe.side_1_track_1_in[0], cb1.track_1_in)
    m.wire(pe.side_1_track_2_in[0], cb1.track_2_in)
    m.wire(pe.side_1_track_3_in[0], cb1.track_3_in)

    m.wire(sb.side_1_track_0_out[0], cb1.track_0_out)
    m.wire(sb.side_1_track_1_out[0], cb1.track_1_out)
    m.wire(sb.side_1_track_2_out[0], cb1.track_2_out)
    m.wire(sb.side_1_track_3_out[0], cb1.track_3_out)

    m.wire(cb1.out, clb.operand1)
    
    m.EndDefine()
    
    return pe
    
@m.cache_definition
def create_top(N):
    grid_len = m.UInt(N)

    class Top(m.Circuit):
        name = "top"
        IO = ["clk", m.In(m.Clock), "reset", m.In(m.Reset), "config_addr", m.In(m.Bits(32)), "config_data", m.In(m.Bits(32))]

        for i in range(0, N):
            IO.append("in_wire_" + str(i))
            IO.append(m.In(m.Bit))
            IO.append("out_wire_" + str(i))
            IO.append(m.Out(m.Bit))

        @classmethod
        def definition(io):

            tile_map = {}
            io_num = 0
            for i in range(0, N):
                io_tile = create_io1in_pad()()
                tile_map['io_in_pad_' + str(io_num)] = io_tile

                m.wire(io_tile.clk, io.clk)
                m.wire(io_tile.rst, io.reset)
                m.wire(io_tile.top_pin[0], getattr(io, 'in_wire_' + str(i)))

                io_num += 1


            tile_id = 1
            for i in range(0, N):
                out_tile = create_io1out_pad()()
                tile_map['io_out_pad_' + str(tile_id)] = out_tile
                m.wire(out_tile.clk, io.clk)
                m.wire(out_tile.rst, io.reset)
                m.wire(out_tile.tile_id, m.uint(tile_id, 16))
                m.wire(out_tile.config_addr, io.config_addr)
                m.wire(out_tile.config_data, io.config_data)
                m.wire(out_tile.top_pin[0], getattr(io, 'out_wire_' + str(i)))
                tile_id += 1

            for row in range(0, N):
                for col in range(0, N):
                    op_tile = create_pe_tile()()
                    tile_map['pe_tile_' + str(row) + '_' + str(col)] = op_tile
                    m.wire(op_tile.clk, io.clk)
                    m.wire(op_tile.rst, io.reset)
                    m.wire(op_tile.tile_id, m.uint(tile_id, 16))
                    m.wire(op_tile.config_addr, io.config_addr)
                    m.wire(op_tile.config_data, io.config_data)
                    
                    tile_id += 1

            # Connect top ios to first pe rows
            print ('Tile names')
            for tile in tile_map:
                print( '\t' + tile )

            print('# of tiles = ', str(tile_id - 1))

            # IO ins to top
            for col in range(0, N):
                in_pad = tile_map['io_in_pad_' + str(col)]
                top_pe = tile_map['pe_tile_0_' + str(col)]

                for track in range(0, 4):
                    m.wire(getattr(in_pad, 'pin_' + str(track)), getattr(top_pe, 'side_3_track_' + str(track) + '_in')[0])

            # bottom to IO outs
            for col in range(1, N + 1):
                out_pad = tile_map['io_out_pad_' + str(col)]
                top_pe = tile_map['pe_tile_' + str(N - 1) + '_' + str(col - 1)]

                for track in range(0, 4):
                    m.wire(getattr(out_pad, 'pin_' + str(track)), getattr(top_pe, 'side_1_track_' + str(track) + '_out')[0])


            # Wire up every side bottom to every side top
            for row in range(0, N - 1):
                for col in range(0, N):
                    top_pe = tile_map['pe_tile_' + str(row) + '_' + str(col)]
                    bot_pe = tile_map['pe_tile_' + str(row + 1) + '_' + str(col)]

                    for track in range(0, 4):
                        m.wire(getattr(bot_pe, 'side_3_track_' + str(track) + '_in'), getattr(top_pe, 'side_1_track_' + str(track) + '_out'))
                        m.wire(getattr(bot_pe, 'side_3_track_' + str(track) + '_out'), getattr(top_pe, 'side_1_track_' + str(track) + '_in'))

            for row in range(0, N):
                for col in range(0, N - 1):
                    lef_pe = tile_map['pe_tile_' + str(row) + '_' + str(col)]
                    rit_pe = tile_map['pe_tile_' + str(row) + '_' + str(col + 1)]

                    for track in range(0, 4):
                        m.wire(getattr(rit_pe, 'side_2_track_' + str(track) + '_in'), getattr(lef_pe, 'side_0_track_' + str(track) + '_out'))
                        m.wire(getattr(rit_pe, 'side_2_track_' + str(track) + '_out'), getattr(lef_pe, 'side_0_track_' + str(track) + '_in'))

            # Wire side 0 of far right to constants
            for row in range(0, N):
                col = N - 1
                rit_pe = tile_map['pe_tile_' + str(row) + '_' + str(col)]

                for track in range(0, 4):
                    m.wire(m.uint(1, 0), getattr(rit_pe, 'side_0_track_' + str(track) + '_in'))

            # Wire side 1 of bottom to constants
            for col in range(0, N):
                row = N - 1
                rit_pe = tile_map['pe_tile_' + str(row) + '_' + str(col)]

                for track in range(0, 4):
                    m.wire(m.uint(1, 0), getattr(rit_pe, 'side_1_track_' + str(track) + '_in'))
                    
            for row in range(0, N):
                lef_pe = tile_map['pe_tile_' + str(row) + '_' + str(0)]
                        
                for track in range(0, 4):
                    m.wire(getattr(lef_pe, 'side_2_track_' + str(track) + '_in'), m.uint(1, 1))

                rit_pe = tile_map['pe_tile_' + str(row) + '_' + str(N - 1)]
                        
                for track in range(0, 4):
                    m.wire(getattr(rit_pe, 'side_0_track_' + str(track) + '_in'), m.uint(1, 1))

    return Top
        
