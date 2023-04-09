A1_villagechief_script:
    %CopJumpIfSealed($09, +)
    RTL

+:
    %CopJumpIfRevealing($09, .revealTalk)
    %CopTeleportNpcTo($01, 4, 8)
    %Cop85(CODE_00A99D)
    %CopAssignTalkCallback(.defaultTalk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEventFlagIsUnset(!EV_A1_TalkedWithVillageChief|$8000, +)
    %CopJumpIfItemNotObtained(!itemBrownStone, +)
    BRA ++
+:
    RTL

++:
    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TSB.W wButtonMask
    %CopAssignTalkCallback(0)
    COP #$31
    db $00
    %Cop85(+)

    %CopLoop($F1)
    %CopLoopEnd()

    %CopShowText(.aSuddenly)
    %CopSetEventFlag(!EV_A1_TalkedWithVillageChief)
    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TSB.W wButtonMask

    %Cop85($03A112)
    COP #$32
    db $02

    %CopLoop($3D)
    %CopLoopEnd()

    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TRB.W wButtonMask

    %CopAssignTalkCallback(.defaultTalk)
    %CopSetScriptAddrToNextInstruction()
    RTL

+:
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $45
    COP #$94
    COP #$86
    RTL

    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $46
    COP #$94
    COP #$86
    RTL

.defaultTalk:
    %CopJumpIfEventFlagIsUnset(!EV_A1_TalkedWithVillageChief|$8000, +)
    %CopJumpIfItemNotObtained(!itemBrownStone, ++)
+:
    %CopShowText(.aDr)
    RTL

++:
    %CopShowText(.bla2)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!itemBrownStone)
    RTL

.revealTalk:
    %CopShowText(.aWelcome)
    %CopRestoreToFullHealth()
    COP #$86
    RTL


.aWelcome:
    db $10,$0E,$3C,$57,$65,$6C,$63,$6F,$6D,$65,$20,$E2,$C2,$72,$6F,$6F
    db $6D,$2E,$20,$0D,$88,$66,$69,$6E,$61,$6C,$6C,$79,$20,$66,$65,$65
    db $6C,$20,$BE,$0D,$6D,$79,$73,$65,$6C,$66,$20,$61,$67,$61,$69,$6E
    db $2E,$20,$11,$88,$B5,$D8,$E2,$0D,$E7,$79,$6F,$75,$2E,$20,$0D,$8F
    db $A6,$A0,$E2,$0D,$C2,$68,$6F,$75,$73,$65,$2E,$20,$13,$88,$B9

.bla2:
    db $10
    db $88,$66,$65,$65,$6C,$20,$61,$73,$20,$EB,$88,$0D,$B5,$62,$65,$65
    db $6E,$20,$73,$75,$72,$72,$6F,$75,$6E,$64,$65,$64,$20,$0D,$62,$79
    db $20,$64,$61,$72,$6B,$6E,$65,$73,$73,$2E,$20,$11,$49,$6E,$20,$E3
    db $64,$61,$72,$6B,$6E,$65,$73,$73,$20,$88,$0D,$68,$65,$61,$72,$64
    db $20,$C2,$62,$65,$73,$74,$20,$66,$72,$69,$65,$6E,$64,$20,$0D,$4C
    db $65,$6F,$2E,$20,$11,$48,$65,$20,$74,$6F,$6C,$64,$20,$C3,$E2,$B0
    db $0D,$E4,$42,$72,$6F,$77,$6E,$20,$90,$E2,$97,$0D,$D1,$6E,$61,$6D
    db $65,$64,$20,$02,$02,$2E,$11,$88,$64,$6F,$6E,$60,$E5,$BD,$F5,$E1
    db $0D,$42,$72,$6F,$77,$6E,$20,$90,$6C,$6F,$6F,$6B,$73,$20,$6C,$69
    db $6B,$65,$0D,$A2,$E4,$BA,$97,$73,$74,$6F,$6E,$65,$20,$11,$E3,$88
    db $D4,$AD,$0D,$68,$69,$6D,$20,$E1,$64,$61,$79,$20,$62,$65,$66,$6F
    db $72,$65,$20,$68,$65,$20,$0D,$64,$69,$73,$61,$70,$70,$65,$61,$72
    db $65,$64,$2E,$20,$11,$02,$02,$2C,$20,$D4,$0D,$03,$24,$E1,$42,$72
    db $6F,$77,$6E,$20,$53,$74,$6F,$6E,$65,$2E,$20,$03,$20,$13,$88,$B9

.aDr:
    db $10,$44,$72,$2E,$8B,$B6,$6F,$6E,$6C,$79,$20,$97,$0D,$64,$61,$75
    db $67,$68,$74,$65,$72,$20,$6E,$61,$6D,$65,$64,$20,$4C,$69,$73,$61
    db $2E,$20,$11,$88,$F1,$61,$73,$6B,$20,$C2,$77,$69,$66,$65,$20,$E2
    db $0D,$6C,$6F,$6F,$6B,$20,$9E,$68,$65,$72,$20,$75,$6E,$74,$69,$6C
    db $20,$0D,$44,$72,$2E,$8B,$72,$65,$74,$75,$72,$6E,$73,$2E,$20,$13
    db $88,$B9

.aSuddenly:
    db $10,$53,$75,$64,$64,$65,$6E,$6C,$79,$20,$E1,$4D,$61,$73,$74,$65
    db $72,$60,$D7,$0D,$F0,$A9,$74,$68,$75,$6E,$64,$65,$72,$69,$6E,$67
    db $20,$0D,$64,$6F,$77,$6E,$20,$AD,$E1,$68,$65,$61,$76,$65,$6E,$73
    db $2E,$11,$3C,$91,$42,$72,$6F,$77,$6E,$20,$90,$FE,$0D,$B5,$BA,$97
    db $6B,$65,$79,$20,$E2,$6F,$70,$65,$6E,$20,$0D,$E1,$57,$6F,$72,$6C
    db $64,$20,$CB,$45,$76,$69,$6C,$2E,$20,$11,$92,$BA,$77,$68,$65,$72
    db $65,$20,$0D,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$20,$6C,$69,$76
    db $65,$73,$21,$20,$11,$84,$A0,$E2,$C3,$F2,$0D,$E1,$73,$74,$6F,$6E
    db $65,$2E,$3E,$20,$13,$88,$B9
