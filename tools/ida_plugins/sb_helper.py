"""
summary: provide two helpers for the soulblazer game

description:
    This script implements two things:
        1. a helper to disassemble text pointer
        2. a handy plugin that inserts the COP data directly after a COP instruction has been decoded
"""

import ida_idaapi
import ida_auto
import ida_bytes
import ida_idp
import ida_struct
import ida_ua

ASM_COP = 0x02
U64_MAX = 18446744073709551615


class MyHook(ida_idp.IDP_Hooks):
    def __init__(self):
        ida_idp.IDP_Hooks.__init__(self)

    def ev_emu_insn(self, insn: ida_ua.insn_t):
        byte = ida_bytes.get_byte(insn.ea)
        if byte == ASM_COP:
            next_byte = ida_bytes.get_byte(insn.ea + 1)
            struc_name = f"Cop{next_byte:02X}"
            struc_tid = ida_struct.get_struc_id(struc_name)
            if struc_tid != 0 and struc_tid != U64_MAX:
                struc_len = ida_struct.get_struc_size(struc_tid)
                ida_bytes.create_struct(insn.ea + 2, struc_len, struc_tid, True)
                ida_auto.auto_mark(insn.ea + 2 + struc_len, ida_auto.AU_CODE)
            else:
                print(f"Can't find a struct with the name {struc_name}")

        return 0


sb_hook = MyHook()
sb_hook.hook()


def PLUGIN_ENTRY():
    class SbHelperPlugin(ida_idaapi.plugin_t):
        flags = 0
        comment = ""
        help = ""
        wanted_name = "SbHelper"
        wanted_hotkey = ""

        def init(self):
            pass

        def run(self, arg):
            pass

        def term(self):
            pass

    return SbHelperPlugin()
