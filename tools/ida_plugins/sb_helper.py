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
import ida_hexrays
import idc
import ida_idp
import ida_kernwin
import ida_struct
import ida_ua
import ida_segment
import ida_segregs
import ida_typeinf
import ida_xref
import idautils
import ida_nalt

from typing import TypeVar

R = TypeVar("R")


def dbg(x: R) -> R:
    print(x)
    return x


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


class Xref24(ida_kernwin.action_handler_t):
    def __init__(self):
        ida_kernwin.action_handler_t.__init__(self)

    def update(self, _: ida_kernwin.action_ctx_base_t):
        return ida_kernwin.AST_ENABLE

    def activate(self, ctx: ida_kernwin.action_ctx_base_t):
        cs = self._get_ptr_struct()
        self._recurse(cs)

    def _get_ptr_struct(self) -> ida_struct.struc_t | None:
        cs_id = ida_struct.get_struc_id("ptr24_t")
        if cs_id == -1 or cs_id == U64_MAX:
            print("Can't find `ptr24_t`")
            return None

        cs: ida_struct.struc_t = ida_struct.get_struc(cs_id)
        if (
            cs.memqty == 2
            and ida_struct.get_member_size(cs.get_member(0)) == 2
            and ida_struct.get_member_size(cs.get_member(1)) == 1
        ):
            return cs

        print("Error: struct `ptr24_t` is not valid!")
        return None

    def _recurse(self, struct, struct_offset=0):
        """
        either it's a xref to a struct (another struct containing this struct)
        or it's a ref to some data
        if struct, we call ourself recursivly
        if data, we create an xref
        """

        struct_size = ida_struct.get_struc_size(struct.id)
        for x_to in idautils.XrefsTo(struct.id):
            ea = x_to.frm
            flags = ida_bytes.get_full_flags(ea)
            elem = ida_bytes.get_item_size(x_to.frm) // struct_size

            if ida_bytes.is_data(flags):
                # we are in data section
                for x in range(elem):
                    frm = ea + x * struct_size  # + struct_offset
                    real_from = ea + x * struct_size + struct_offset
                    bank = ida_bytes.get_byte(real_from + 2)
                    if bank <= 0x20:
                        bank += 0x80
                    to = (bank << 16) + ida_bytes.get_word(real_from)

                    ida_xref.add_dref(frm, to, ida_xref.dr_R)

            elif flags == 0:
                (member, _name, struct) = ida_struct.get_member_by_id(ea)
                self._recurse(struct, member.get_soff())

            else:
                print("NOT SURE WHAT HAPPENS!", hex(flags))

class PrintSegmentRegister(ida_kernwin.action_handler_t):
    def __init__(self):
        ida_kernwin.action_handler_t.__init__(self)

    def update(self, ctx: ida_kernwin.action_ctx_base_t):
        return ida_kernwin.AST_ENABLE_FOR_WIDGET \
            if ctx.widget_type == ida_kernwin.BWN_DISASM \
                else ida_kernwin.AST_DISABLE_FOR_WIDGET

    def activate(self, ctx: ida_kernwin.action_ctx_base_t):
        # 8 = M
        # 9 = X
        m = ida_segregs.get_sreg(ctx.cur_ea, 8)
        x = ida_segregs.get_sreg(ctx.cur_ea, 9)
        print(".A{:<2} .I{:<2}".format(8 if m == 1 else 16, 8 if x == 1 else 16))

class SbHelperPlugin(ida_idaapi.plugin_t):
    flags = ida_idaapi.PLUGIN_HIDE
    wanted_name = "SbHelper"
    wanted_hotkey = ""
    comment = "Soulblazer Analyzer (IDAPython)"
    help = ""

    def init(self):
        self.sb_hook = MyHook()
        self.sb_hook.hook()

        ida_kernwin.register_action(
            ida_kernwin.action_desc_t(
                "xref24:addXref",
                "Xref24 Add X-References",
                Xref24(),
                "Shift+Ctrl+Z",
            )
        )

        ida_kernwin.register_action(
            ida_kernwin.action_desc_t(
                "printseg:printSegmentRegister",
                "Print current Segment Register",
                PrintSegmentRegister(),
                "Shift+Ctrl+A",
            )
        )

        return ida_idaapi.PLUGIN_KEEP  # keep us in memory

    def run(self, arg):
        pass

    def term(self):
        self.sb_hook.unhook()


def PLUGIN_ENTRY():
    return SbHelperPlugin()
