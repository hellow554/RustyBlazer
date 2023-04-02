macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopGiveItem(itemId)
    COP #$0A
    db <itemId>
endmacro

macro CopJumpIfEventFlagIsUnset(eventid, addr)
    COP #$07
    dw <eventid>
    dw <addr>
endmacro

macro CopRemoveItem(itemId)
    COP #$0B
    db <itemId>
endmacro

macro CopJumpIfSealed(lairId, target)
    COP #$14
    dw <lairId>
    dw <target>
endmacro

macro CopMakeNpcUnpassable()
    COP #$15
endmacro

macro CopMakeNpcPassable()
    COP #$16
endmacro

macro CopAssignTalkCallback(ptr)
    COP #$17
    dw <ptr>
endmacro

macro CopJumpIfItemNotObtained(itemId, target)
    COP #$18
    db <itemId>
    dw <target>
endmacro

macro CopJumpIfItemIsNotEquipped(itemId, target)
    COP #$19
    db <itemId>
    dw <target>
endmacro

macro CopShowMenu(choices_txt_ptr, number_of_choices, abort_ptr)
    Cop #$1A
    dw <choices_txt_ptr>
    db <number_of_choices>
    dw <abort_ptr>
endmacro

macro CopAddBlockRelativeToNpc(x, y)
    Cop #$2A
    dw <x>
    dw <y>
endmacro

macro CopRemoveBlockRelativeToNpc(x, y)
    COP #$2B
    dw <x>
    dw <y>
endmacro

macro CopJumpIfRevealing(lairId, target)
    COP #$30
    dw <lairId>
    dl <target>
endmacro

macro Cop85(addr)
    COP #$85
    dl <addr>
endmacro

macro CopSetScriptAddrToNextInstruction()
    COP #$91
endmacro

macro CopAdjustNpcXPosition(pos)
    COP #$9F
    dw <pos>
endmacro

macro CopAdjustNpcYPosition(pos)
    COP #$A0
    dw <pos>
endmacro

macro create_entity(name, offsense, hp, exp, spriteId, facing, flags, zUknown, behaviour_ptr)
if not(stringsequal("<name>", "_"))
<name>:
endif
    dw <offsense>
    db <hp>
    dw <exp>
    db <spriteId>
    db <facing>
    db <flags>
    dl <zUknown>
    dl <behaviour_ptr>
endmacro

macro create_entities_placement(name, mapNumber, mapSubnumber, addr)
if not(stringsequal("<name>", "_"))
<name>:
endif
    db <mapNumber>
    db <mapSubnumber>
    dw <addr>
endmacro


macro PlaySound(id)
    BRK #<id>
endmacro

macro SwitchToBank(id)
    LDA.B <id>
    PHA
    PLB
endmacro
