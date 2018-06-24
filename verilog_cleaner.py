import re

import os

class ModString:
    def __init__(self, name, text):
        self.name = name
        self.lines = text

def extract_module_strings(mod_file):
    print( 'Extracting strings from', mod_file )
    mod_f = open(mod_file, 'r')
    mod_strs = mod_f.readlines()
    mod_f.close()

    i = 0
    in_mod = False
    mods = []
    while i < len(mod_strs):
        l = mod_strs[i]

        if (l[:6] == 'module'):
            in_mod = True
            rest = l[6:]
            #print( 'Rest of line = ', rest )
            mod_name = re.search("(?<!\S)\w+(?!\S)", rest).group(0)
            print( 'Found module!', mod_name)

            cur_line = l
            mod_lines = [] #[cur_line]

            #print( 'cur_line =', cur_line )
            left_mod = False
            while (cur_line[:9] != 'endmodule'):
                left_mod = True
                mod_lines.append(cur_line)
                i += 1
                cur_line = mod_strs[i]
                #print( 'cur_line =', cur_line )
                

            if (cur_line[:9] == 'endmodule') and left_mod and in_mod:
                mod_lines.append(cur_line)

            print( 'Adding module with name', mod_name )
            mods.append(ModString(mod_name, mod_lines))

        in_mod = False
        i += 1

    return mods

def rebuild_verilog(mod_str_objs):
    
    st = '/* verilator lint_off UNOPTFLAT */\n'

#    for mod_str_obj in mod_str_objs:
        # print( 'Unique mod name =', mod_str_obj.name )
        # print('Lines are')
        # for l in mod_str_obj.lines:
        #     print('\t' + l)
    for mod_str_obj in mod_str_objs:
        for ln in mod_str_obj.lines:
            st += ln + '\n'

        st += '// End of module\n\n'

    return st

def remove_verilog_duplicates(mod_files):
    existing_mods = set([])
    for mod_file in mod_files:
        module_strings = extract_module_strings(mod_file)

        fresh_mods = []
        for mod in module_strings:
            
            mod_name = mod.name
            print( 'Processing mod, ', mod_name )
            
            if not mod_name in existing_mods:
                existing_mods.add(mod_name)
                fresh_mods.append(mod)
                print( mod_name, ' is unique' )


        print( 'Unique modules in ', mod_file)
        for mod in fresh_mods:
            print( '\t', mod.name )

        f = open(mod_file, 'w')
        f.write(rebuild_verilog(fresh_mods))
        f.close()
        
        

    print( 'Done' )




