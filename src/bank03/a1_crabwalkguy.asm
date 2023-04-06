A1_crabwalkguy_script:
    %CopJumpIfSealed($29, +)
    RTL

+:
    %Cop85(CODE_00A99D)
    %CopAssignTalkCallback(.talk)

    %CopMakeNpcUnpassable()
    COP #$05
        db $00,$00
    COP #$8F
    COP #$80
        db $02
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDA.W wButtonsPressed
    AND.W #!Key16_R|!Key16_L
    BNE .CODE_038028
    RTL


.CODE_038028:
    LDA.W wButtonsPressed
    AND.W #!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up
    BNE .CODE_038031
    RTL


.CODE_038031:
    %CopAssignTalkCallback(.talk2)
    RTL

.talk:
    %CopShowText(.first)
    COP #$09
    db $00,$80
    RTL

.talk2
    %CopShowText(.afterCrabWalk)
    RTL


.first:
    db $10, "Hey, ", $FE, "look ", $BE, "you", $0D
    db "would ", $A1, $B2, "at crab-", $0D, "walking."
    db " ", $0D, "Try it. ", $11

    db $95, "don`", $E5, $BD, "how? ", $0D
    db "Just ", $F9, "while ", $0D
    db "pressing either ", $0D
    db $E1, "L or R button. ", $13, $88, $B9

.afterCrabWalk:
    db $10, "See, ", $88, "knew ", $FE, "could", $0D
    db "do it! ", $11
    db $92, $F1, $B7, $FE, $0D
    db $F4, $FE, $98, "fighting ", $0D
    db "or using magic. ", $13, $88, $B9
