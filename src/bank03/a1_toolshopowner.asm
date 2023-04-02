A1_toolshopowner_script:
    %CopJumpIfSealed($06, +)
    RTL

+:
    %CopAssignTalkCallback(.defaultTalk)

.loop:
    %CopSetScriptAddrToNextInstruction()
    COP #$20
    db $95,$83
    %CopJumpDependingOnPlayerX(0, .walkToLeft, .CODE_038395, .walkToRight)

.walkToLeft:
    COP #$23
    dw .CODE_03837B
    COP #$97
    COP #$9D
    db $0B
    COP #$9E
    dw .CODE_03837B

.CODE_03837B:
    COP #$80
    db $06
    COP #$82
    BRL .CODE_038395

.walkToRight:
    COP #$24
    dw .CODE_038390
    COP #$96
    COP #$9D
    db $0B
    COP #$9E
    dw .CODE_038390

.CODE_038390:
    COP #$80
    db $06
    COP #$82

.CODE_038395:
    COP #$27
    dw .loop

.defaultTalk:
    %CopJumpIfItemNotObtained(!itemMedicalHerb, +)
    %CopShowText(.aHaveOneHerb)
    RTL

+:
    %CopShowText(.aHaveNotHerb)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!itemMedicalHerb)
    RTL

.aHaveNotHerb
    db $10, "Hello, may ", $88, $B7, "you?", $11

    db "Oh, ", $FE, $98, $E1, $CC, $0D
    db $FB, $D6, "me! ", $0D
    db "Take whatever ", $Fe, "need", $0D
    db $AD, $C2, "store. ", $11

    db $88, "only ", $B5, "Medical ", $0D
    db "Herbs though. ", $11

    db $02, 02, " ", $D4, $0D
    db $03, $24
    db $97, "Medical Herb. "
    db $03, $20
    db $13
    dw aClearTextboxAndEnd

.aHaveOneHerb
    db $10, "Hello, may ", $88, $B7, "you?", $11
    db "Oh, ", $FE, $98, $E1, $CC, $0D
    db $FB, $D6, "me! ", $11
    db "Whenever ", $FE, $ED, $FF, $0D
    db "Medical Herb ", $D2, $0D
    db $A6, "back, ", $96, $88, $F1, $0D
    db $B0, $FE, "another. "
    db $13
    dw aClearTextboxAndEnd

CODE_038480:
    COP #$96
    COP #$80
    db $08
    COP #$82
    BRL CODE_038480
