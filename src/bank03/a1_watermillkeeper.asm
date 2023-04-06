A1_watermillkeeper_script:
    %CopJumpIfSealed($0E, +)
    RTL

+:
    %CopJumpIfRevealing($0E, .revealTalk)
    %CopJumpIfEventFlagIsUnset(!EV_A1_WatermillwheelRotated|$8000, .teleportNpcWhenWheelHasTurned)
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talkWhenInFront)
    %CopWaitForEventFlagToBeSet(!EV_A1_TalkedToWmKeeper)
    ; --- wait ---
    %CopMakeNpcPassable()

    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TSB.W wButtonMask
    COP #$96
    COP #$9D
    db $05
    COP #$9E
    db $D1,$86
    COP #$9D
    db $04
    COP #$9E
    db $D8,$86
    COP #$80
    db $00
    COP #$82
    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TRB.W wButtonMask
    %CopMakeNpcUnpassable()

.showPromptWHenInfrontOfWheel:
    %CopSetScriptAddrToNextInstruction()
    %CopBranchIfNpcHasReachedXY($00, 38, 23, +)
    RTL

+:
    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TSB.W wButtonMask
    LDY.W $039C
    LDA.W #$0001
    STA.W $001E,Y
    
    %CopLoop(3)
    %CopLoopEnd()

    LDA.W #!Key16_A|!Key16_Right|!Key16_Left|!Key16_Down|!Key16_Up|!Key16_Select
    TRB.W wButtonMask

    %CopShowText(.askToTurn)
    %CopShowMenu(choiceYesNo, 2, .saidNoToTurn)
    
    LDA.L choiceNumber
    BNE .saidNoToTurn
    %CopShowText(.aTurned)
    BRK #!Sound_WheelStartSpinning
    %CopSetEventFlag(!EV_A1_WatermillwheelRotated)

.wheelAlreadyTurned:
    %CopAssignTalkCallback(.talkAfterTurnedWheel)
    %CopSetScriptAddrToNextInstruction()
    %CopBranchIfNpcHasReachedXY($00, 47, 50, .findEmbledA)
    RTL


.saidNoToTurn:
    COP #$01
    db $89,$B9
    %CopSetScriptAddrToNextInstruction()
    COP #$0D
    db $00,$26,$17,$41,$87
    BRA .showPromptWHenInfrontOfWheel

    RTL

.teleportNpcWhenWheelHasTurned:
    %CopTeleportNpcTo($08, $27, $17)
    %CopMakeNpcUnpassable()
    COP #$80
    db $00
    COP #$82
    BRA .wheelAlreadyTurned

.findEmbledA:
    %CopJumpIfEventFlagIsUnset(!EV_A1_PickedEmblemAUp|$8000, $8763)
    %CopShowText(.embledAFindText)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!itemEmblemA)
    %CopSetEventFlag(!EV_A1_PickedEmblemAUp)
    %CopSetScriptAddrToNextInstruction()
    RTL

.talkWhenInFront:
    %CopShowText(.aRotating)
    %CopSetEventFlag(!EV_A1_TalkedToWmKeeper)
    RTL

.talkAfterTurnedWheel:
    %CopShowText(.aOhNoWonder)
    RTL

.revealTalk:
    %CopShowText(.reavealText)
    COP #$86
    RTL


.aRotating:
    db $10,$52,$6F,$74,$61,$74,$69,$6E,$67,$20,$E4,$77,$68,$65,$65,$6C
    db $20,$0D,$F1,$6D,$6F,$76,$65,$20,$E1,$65,$6C,$65,$76,$61,$74,$6F
    db $72,$0D,$BB,$E1,$55,$6E,$64,$65,$72,$67,$72,$6F,$75,$6E,$64,$20
    db $0D,$43,$61,$73,$74,$6C,$65,$2E,$20,$11,$88,$9D,$74,$6F,$6F,$20
    db $77,$65,$61,$6B,$20,$E2,$74,$75,$72,$6E,$20,$0D,$E4,$77,$68,$65
    db $65,$6C,$2C,$20,$F1,$FE,$0D,$64,$6F,$20,$69,$74,$20,$AE,$6D,$65
    db $3F,$20,$13,$88,$B9

.aOhNoWonder:
    db $10,$4F,$68,$2C,$20,$6E,$6F,$20,$77,$6F,$6E,$64,$65,$72,$21,$20
    db $88,$F3,$0D,$74,$75,$72,$6E,$69,$6E,$67,$20,$69,$74,$20,$E1,$77
    db $72,$6F,$6E,$67,$20,$0D,$77,$61,$79,$21,$20,$11,$42,$79,$20,$E1
    db $77,$61,$79,$2C,$20,$64,$6F,$6E,$60,$E5,$FE,$0D,$E8,$E4,$77,$61
    db $74,$65,$72,$20,$6D,$69,$6C,$6C,$20,$0D,$BA,$67,$72,$65,$61,$74
    db $3F,$21,$20,$13,$88,$B9

.reavealText:
    db $10,$0E,$3C,$81,$6D,$61,$6E,$60,$D7,$F0
    db $A9,$0D,$AD,$69,$6E,$73,$69,$64,$65,$20,$E1,$77,$61,$74,$65,$72
    db $20,$0D,$6D,$69,$6C,$6C,$2E,$20,$11,$44,$41,$52,$4E,$20,$49,$54
    db $21,$20,$11,$92,$73,$74,$75,$70,$69,$64,$20,$77,$68,$65,$65,$6C
    db $21,$20,$0D,$49,$74,$60,$D7,$73,$6F,$20,$68,$61,$72,$64,$20,$E2
    db $74,$75,$72,$6E,$21,$20,$13,$88,$B9

.askToTurn:
    db $10,$92,$BA,$E1,$77,$68,$65
    db $65,$6C,$2C,$20,$0D,$F1,$FE,$74,$72,$79,$20,$E2,$74,$75,$72,$6E
    db $20,$0D,$69,$74,$3F,$20,$0C

.aTurned:
    db $02,$02,$20,$0D,$74,$75,$72,$6E,$65,$64,$20,$E1,$77,$68,$65,$65
    db $6C,$2E,$20,$11,$41,$73,$20,$E1,$77,$68,$65,$65,$6C,$20,$D9,$0D
    db $E2,$74,$75,$72,$6E,$2C,$20,$70,$6F,$77,$65,$72,$20,$F3,$0D,$74
    db $72,$61,$6E,$73,$6D,$69,$74,$74,$65,$64,$20,$E2,$E1,$0D,$55,$6E
    db $64,$65,$72,$67,$72,$6F,$75,$6E,$64,$20,$43,$61,$73,$74,$6C,$65
    db $2E,$20,$13,$88,$B9
    
.embledAFindText:
    db $10,$92,$BA,$03,$24,$E1,$4D,$61,$73,$74,$65
    db $72,$60,$D7,$0D,$45,$6D,$62,$6C,$65,$6D,$20,$41,$2E,$20,$03,$20
    db $13,$88,$B9
