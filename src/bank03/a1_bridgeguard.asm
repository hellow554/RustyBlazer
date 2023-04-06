A1_bridgeguard_script:
    %CopJumpIfSealed($08, +)
    RTL

+:
    %Cop85(CODE_00A99D)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEventFlagIsUnset(!EV_A1_BridgeGuardTalk|$8000, .CODE_0385D4)

    %CopAssignTalkCallback(.firstTalk)
    RTL

.CODE_0385D4:
    %CopAssignTalkCallback(.passTalk)
    COP #$0C
    db $00,$04,$0F,$86
    %CopJumpIfEventFlagIsUnset($8004, $85FD)
    %CopJumpDependingOnPlayerXProximity(0, .CODE_0385EE, .CODE_03860F, .CODE_0385F3)

.CODE_0385EE:
    COP #$97
    BRL .CODE_0385F5

.CODE_0385F3:
    COP #$96

.CODE_0385F5:
    COP #$80
    db $02
    COP #$82
    BRL .CODE_038631

    COP #$16
    COP #$9D
    db $04
    COP #$9E
    dw .CODE_038606
.CODE_038606:
    %CopMakeNpcUnpassable()
    %CopClearEventFlag($04)
    BRL .CODE_038631

.CODE_03860F:
    %CopJumpIfEventFlagIsUnset($8004, $862C)
    COP #$16
    COP #$9D
    db $03
    COP #$9E
    db $1E,$86
    COP #$80
    db $01
    COP #$82
    %CopMakeNpcUnpassable()
    COP #$09
    db $04,$80
    BRL .CODE_038631

    COP #$80
    db $01
    COP #$82

.CODE_038631:
    COP #$27
    db $D8,$85
.firstTalk:
    %CopShowText(.atxt)
    %CopSetEventFlag(!EV_A1_BridgeGuardTalk)
    RTL

.passTalk:
    %CopShowText(.aPass)
    RTL

.atxt:
    db $10
    db $88,$9D,$E1,$67,$75,$61,$72,$64,$20,$CB,$0D,$E1,$62,$72,$69
    db $64,$67,$65,$2E,$20,$11,$88,$67,$75,$65,$73,$73,$20,$69,$74,$20
    db $BA,$CA,$0D,$D5,$6E,$65,$63,$65,$73,$73,$61,$72,$79,$20,$E2,$0D
    db $67,$75,$61,$72,$64,$20,$73,$75,$63,$68,$20,$97,$73,$6D,$61,$6C
    db $6C,$20,$0D,$62,$72,$69,$64,$67,$65,$2C,$20,$D2,$70,$61,$73,$73
    db $2E,$20,$13,$88,$B9

.aPass:
    db $10, $8F, "pass."
    db $13
    dw aClearTextboxAndEnd
