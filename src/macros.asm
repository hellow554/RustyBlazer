macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopRemoveItem(itemId)
    COP #$0B
    db <itemId>
endmacro

macro CopJumpIfItemIsNotEquipped(itemId, target)
    COP #$19
    db <itemId>
    dw <target>
endmacro
