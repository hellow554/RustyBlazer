macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
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

macro CopAssignTalkCallback(ptr)
    COP #$17
    dw <ptr>
endmacro

macro CopShowMenu(choices_txt_ptr, number_of_choices, abort_ptr)
    Cop #$1A
    dw <choices_txt_ptr>
    db <number_of_choices>
    dw <abort_ptr>
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

macro CopJumpIfRevealing(lairId, target)
    COP #$30
    dw <lairId>
    dl <target>
endmacro

macro CopSetNewScriptRetAddr(addr)
    COP #$85
    dl <addr>
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
