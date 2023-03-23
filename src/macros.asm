macro COP(number, ...)
    COP #<number>
    !a #= 0
    while !a < sizeof(...)
        ; if greater(<...[!a]>, 255)
        ; ;     db (<...[!a]> / 256)
        ; ;     db <...[!a]>
        ; endif
        dw <...[!a]>
        !a #= !a+1
    endwhile
endmacro

macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopRemoveItem(itemId)
    COP #$0B
    db <itemId>
endmacro

macro CopCheckIfItemIsEquipped(itemId, locationIfNotEquipped)
    COP #$19
    db <itemId>
    dw <locationIfNotEquipped>
endmacro
