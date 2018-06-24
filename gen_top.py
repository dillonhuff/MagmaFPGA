import sys
from generator_utils import module_string
from verilog import VerilogModule, VerilogModuleInstance

#from sets import Set

def build_top_mod(num_in_ios,
                  num_out_ios,
                  grid_height,
                  grid_width):

    assert(num_in_ios <= grid_width)
    assert(num_out_ios <= grid_width)

    ports = ['input clk', 'input reset', 'input [31:0] config_addr', 'input [31:0] config_data']

    top_mod = VerilogModule('top')
    
    for pad_no in range(0, num_in_ios):
        top_mod.add_wire('in_wire_' + str(pad_no), False, True, 'input', 1)

    for pad_no in range(0, num_out_ios):
        top_mod.add_wire('out_wire_' + str(pad_no), False, True, 'output', 1)

    top_mod.add_wire('clk', False, True, 'input', 1);
    top_mod.add_wire('reset', False, True, 'input', 1);
    top_mod.add_wire('config_addr', False, True, 'input', 32);
    top_mod.add_wire('config_data', False, True, 'input', 32);

    for pad_no in range(0, num_in_ios):
        pad_name = 'in_pad_' + str(pad_no)

        top_mod.add_instance('io1in_pad', pad_name)
        top_mod.add_port_connection('clk', pad_name, 'clk')
        top_mod.add_port_connection('in_wire_' + str(pad_no), pad_name, 'top_pin')

    tile_id = 1;
    
    for pad_no in range(0, num_out_ios):
        pad_name = 'out_pad_' + str(pad_no)

        top_mod.add_instance('io1out_pad', pad_name)
        top_mod.add_port_connection('out_wire_' + str(pad_no), pad_name, 'top_pin')
        top_mod.add_port_connection('clk', pad_name, 'clk')
        top_mod.add_port_connection('reset', pad_name, 'rst')
        top_mod.add_port_connection('config_addr', pad_name, 'config_addr')
        top_mod.add_port_connection('config_data', pad_name, 'config_data')

        tile_id_wire = pad_name + '_id_wire'
        top_mod.add_wire(tile_id_wire, False, False, '', 16)
        top_mod.add_assign(tile_id_wire, str(tile_id))

        top_mod.add_port_connection(tile_id_wire, pad_name, 'tile_id')
        
        tile_id += 1




    #           3
    #
    #    2             0
    #          
    #           1
    #

    top_side = 3
    left_side = 2
    bottom_side = 1
    right_side = 0

    # Q: How to name the wires that connect different tiles?
    # Each tile-direction group needs 4 wires, and there are 2 groups
    # tile00 -> tile01, tile00 <- tile01

    for grid_row in range(0, grid_height - 1):
        next_row = grid_row + 1

        for grid_col in range(0, grid_width):

            cur_tile = 'tile_' + str(grid_row) + '_' + str(grid_col)
            next_tile = 'tile_' + str(next_row) + '_' + str(grid_col)

            for i in range(0, 4):
                top_mod.add_wire('vertical_' + cur_tile + '_to_' + next_tile + '_' + str(i))
            for i in range(0, 4):
                top_mod.add_wire('vertical_' + next_tile + '_to_' + cur_tile + '_' + str(i))

    for grid_col in range(0, grid_width - 1):

        next_col = grid_col + 1

        for grid_row in range(0, grid_height):

            cur_tile = 'tile_' + str(grid_row) + '_' + str(grid_col)
            next_tile = 'tile_' + str(grid_row) + '_' + str(next_col)

            for i in range(0, 4):
                top_mod.add_wire('horizontal_' + cur_tile + '_to_' + next_tile + '_' + str(i))

            for i in range(0, 4):
                top_mod.add_wire('horizontal_' + next_tile + '_to_' + cur_tile + '_' + str(i))

    #tiles_to_ids = {}
    tile_map = {}
    for grid_row in range(0, grid_height):

        prev_row = grid_row - 1
        next_row = grid_row + 1

        for grid_col in range(0, grid_width):

            prev_col = grid_col - 1
            next_col = grid_col + 1

            this_tile = 'tile_' + str(grid_row) + '_' + str(grid_col)

            tile_above = 'tile_' + str(prev_row) + '_' + str(grid_col)
            tile_below = 'tile_' + str(next_row) + '_' + str(grid_col)

            tile_left = 'tile_' + str(grid_row) + '_' + str(prev_col)
            tile_right = 'tile_' + str(grid_row) + '_' + str(next_col)

            pe_tile_mod = 'pe_tile'

            # Declaration of pe
            tile_name = 'pe_tile_' + str(grid_row) + '_' + str(grid_col)
            # TODO: Re-introduce this value
            top_mod.add_instance(pe_tile_mod, tile_name)
            tile_map[tile_name] = pe_tile_mod

            print( 'pe_tile_mod =', pe_tile_mod )
            # Wiring up vertical wires

            ## Wiring up tiles to inputs above them: row 0 connects to IOs,
            ## all other rows connect to the row above them
            if ((grid_row == 0) and (grid_col <= (num_in_ios - 1))):
                for track_no in range(0, 4):
                    top_mod.add_instance_connection('in_pad_' + str(grid_col),
                                                    'pin_' + str(track_no),
                                                    tile_name,
                                                    'side_3_track_'+ str(track_no) + '_in')

                # # # Q: How do we replace these connections?
                # for i in range(1, 4):
                #     in_wire = tile_name + '_in_wire_3_' + str(i) + '_const'
                #     top_mod.add_wire(in_wire)
                #     top_mod.add_wire_connection(in_wire, tile_name, 'side_3_track_' + str(i) + '_in')
                #     top_mod.add_assign(in_wire, '1\'b0')

            elif (grid_row != 0):
                # All other rows connect to the row above them

                for i in range(0, 4):
                    # Connect this tiles side 3 to the previous rows tile
                    # side
                    out_wire = 'side_3_track_' + str(i) + '_out'
                    connector = 'vertical_' + this_tile + '_to_' + tile_above + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)

                for i in range(0, 4):
                    # Connect this tiles side 3 to the previous rows tile
                    # side
                    out_wire = 'side_3_track_' + str(i) + '_in'
                    connector = 'vertical_' + tile_above + '_to_' + this_tile + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)
                    
            ## Wiring up tiles to inputs below them: row (N - 1) connects to output
            ## IO pads, all other rows connect to row N + 1
            if ((grid_row == (grid_height - 1)) and (grid_col <= (num_out_ios - 1))):
                for track_no in range(0, 4):
                    top_mod.add_instance_connection('out_pad_' + str(grid_col),
                                                    'pin_' + str(track_no),
                                                    tile_name,
                                                    'side_1_track_' + str(track_no) + '_out')

                for i in range(0, 4):
                    in_wire = 'side_1_track_' + str(i) + '_in'
                    in_wire_c = tile_name + '_' + in_wire + '_const'
                    top_mod.add_wire(in_wire_c)
                    top_mod.add_wire_connection(in_wire_c, tile_name, in_wire)
                    top_mod.add_assign(in_wire_c, '1\'b0')

            elif (grid_row != (grid_height - 1)):
                for i in range(0, 4):
                    # Connect this tiles side 1 to the next rows tile
                    # side
                    out_wire = 'side_1_track_' + str(i) + '_out'
                    connector = 'vertical_' + this_tile + '_to_' + tile_below + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)

                for i in range(0, 4):
                    # Connect this tiles side 1 to the next rows tile
                    # side
                    out_wire = 'side_1_track_' + str(i) + '_in'
                    connector = 'vertical_' + tile_below + '_to_' + this_tile + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)

            # Wiring up horizontal grid
            # If this is not column 0 connects to tiles to the left
            if (grid_col != 0):
                for i in range(0, 4):
                    # Connect this tiles side 2 to the tile to the left
                    #out_wire = 'out_wire_2_' + str(i)
                    out_wire = 'side_2_track_' + str(i) + '_out'
                    connector = 'horizontal_' + this_tile + '_to_' + tile_left + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)

                for i in range(0, 4):
                    # Connect this tiles side 3 to the previous rows tile
                    # side
                    #out_wire = 'in_wire_2_' + str(i)
                    out_wire = 'side_2_track_' + str(i) + '_in'
                    connector = 'horizontal_' + tile_left + '_to_' + this_tile + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)

            else:
                for i in range(0, 4):
                    #out_wire = 'in_wire_2_' + str(i)
                    out_wire = 'side_2_track_' + str(i) + '_in'
                    out_wire_c = tile_name + out_wire + '_const'

                    top_mod.add_wire(out_wire_c)
                    top_mod.add_wire_connection(out_wire_c, tile_name, out_wire)
                    top_mod.add_assign(out_wire_c, '1\'b0')
                

            if (grid_col != (grid_width - 1)):
                for i in range(0, 4):
                    # Connect this tiles side 0 to the column to the right
                    #out_wire = 'out_wire_0_' + str(i)
                    out_wire = 'side_0_track_' + str(i) + '_out'
                    connector = 'horizontal_' + this_tile + '_to_' + tile_right + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)

                for i in range(0, 4):
                    #out_wire = 'in_wire_0_' + str(i)
                    out_wire = 'side_0_track_' + str(i) + '_in'
                    connector = 'horizontal_' + tile_right + '_to_' + this_tile + '_' + str(i)
                    top_mod.add_wire_connection(connector, tile_name, out_wire)
            else:
                for i in range(0, 4):
                    #out_wire = 'in_wire_0_' + str(i)
                    out_wire = 'side_0_track_' + str(i) + '_in'
                    out_wire_c = tile_name + '_in_wire_0_' + str(i) + '_const'
                    res = '1\'b0'
                    top_mod.add_wire(out_wire_c)
                    top_mod.add_wire_connection(out_wire_c, tile_name, out_wire)
                    top_mod.add_assign(out_wire_c, '1\'b0')

            top_mod.add_port_connection('clk', tile_name, 'clk')
            top_mod.add_port_connection('reset', tile_name, 'rst')
            top_mod.add_port_connection('config_addr', tile_name, 'config_addr')
            top_mod.add_port_connection('config_data', tile_name, 'config_data')

            tile_id_wire = tile_name + '_id_wire'
            top_mod.add_wire(tile_id_wire, False, False, '', 16)
            top_mod.add_assign(tile_id_wire, '16\'d' + str(tile_id))
            top_mod.add_port_connection(tile_id_wire, tile_name, 'tile_id')

            #tiles_to_ids[tile_name] = tile_id
            tile_id += 1

    return top_mod

def build_verilog_string(top_mod):
    includes = []
    return module_string(includes, top_mod.mod_name, top_mod.get_port_strings(), top_mod.body_string())


