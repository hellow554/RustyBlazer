A4_script_old_man_talking:
    %CopJumpIfSealed(!Lair_A4_OldManTalking, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk_callback)
    %CopMakeNpcUnpassable()
    ; TODO: the event flag is wrong, but it must be 0?!
    %CopWaitForEventFlagToBeSet(!EV_A1_CrabwalkGuyNoticedUs)
    %CopMakeNpcPassable()
    %CopRemoveTalkCallback()
    %CopResetSpriteVertically()
    %Cop81(17, 2)
    %Cop83()
    %Cop81(16, 2)
    %Cop83()
    %Cop81(17, 6)
    %Cop83()
    %Cop81(16, 3)
    %Cop83()
    %CopFlipSpriteVertically()
    %CopPlayAnimation($E)
    %Cop82()
    %CopAssignTalkCallback(.talk_wrong_place)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, 10, 7, .talk_table)
    RTL

.talk_table:
    %CopShowText(.txt_table)
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk_callback:
    %CopShowText(.txt_first_talk)
    %CopSetEventFlag(0)
    RTL

.talk_wrong_place:
    %CopShowText(.txt_wrong_place)
    RTL

.txt_first_talk:
; @DEFAULT_TEXTBOX@
; "So, so, es ist selten "
; "hier jemand neues zu "
; "sehen. Komm` doch in "
; "mein Zimmer." -> ACT4_CLEARBOX
db $10
db $53,$6F,$2C,$20,$73,$6F,$2C,$20,$C3,$D2,$73,$65,$6C,$74,$65,$6E,$20,$0D
db $CE,$6A,$65,$6D,$61,$6E,$64,$20,$6E,$65,$75,$65,$73,$20,$FD,$0D
db $73,$65,$68,$65,$6E,$2E,$20,$4B,$6F,$6D,$6D,$60,$20,$64,$6F,$63,$68,$20,$D3,$0D
db $6D,$65,$69,$6E,$20,$5A,$69,$6D,$6D,$65,$72,$2E,$13 : dw ACT4_CLEARBOX
; @END@
.txt_wrong_place:
; @DEFAULT_TEXTBOX@
; "Setz` Dich hier vor "
; "mich." -> ACT4_CLEARBOX
db $10
db $53,$65,$74,$7A,$60,$20,$85,$CE,$76,$6F,$72,$20,$0D
db $6D,$69,$63,$68,$2E,$13 : dw ACT4_CLEARBOX
; @END@
.txt_table:
; @DEFAULT_TEXTBOX@
; "Ich habe so viele "
; "Fragen über mensch-"
; "liche Lebewesen." WFE
; "Wollen wir das aus-"
; "diskutieren?" -> ACT4_CLEARBOX
db $10
db $8F,$CC,$E9,$EF,$0D
db $46,$72,$61,$67,$65,$6E,$20,$5B,$62,$65,$72,$20,$6D,$65,$6E,$73,$63,$68,$2D,$0D
db $6C,$69,$63,$68,$65,$20,$4C,$65,$62,$65,$77,$65,$73,$65,$6E,$2E,$11
db $57,$6F,$6C,$6C,$65,$6E,$20,$77,$69,$72,$20,$B9,$61,$75,$73,$2D,$0D
db $64,$69,$73,$6B,$75,$74,$69,$65,$72,$65,$6E,$3F,$13 : dw ACT4_CLEARBOX
; @END@
