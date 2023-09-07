A1_script_Tulip_Before_Painter_House:
    %CopJumpIfSealed($18, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()


.dong:
    %CopPlayAnimation($1E)
    %Cop82()
    BRA .dong

.talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_TulipBeforeHouseSecondTalk, .second_talk)
    %CopShowText(.txt_first_talk)
    RTL
.second_talk:
    %CopShowText(.txt_second_talk)
    RTL

.txt_first_talk:
; @DEFAULT_TEXTBOX@
; "Ich frage mich, wer die "
; "Grenze zwischen Traum "
; "und Realität gezogen "
; "hat." WFE
; "Manchmal passiert es,"
; "daß Dinge die im Traum "
; "passieren auch die "
; "Wirklichkeit verändern " -> Default_Text_End
db $10
db $8F,$66,$72,$61,$67,$65,$20,$6D,$69,$63,$68,$2C,$20,$77,$65,$72,$20,$B5,$0D
db $47,$72,$65,$6E,$7A,$65,$20,$7A,$77,$69,$73,$63,$68,$65,$6E,$20,$A5,$0D
db $EB,$52,$65,$61,$6C,$69,$74,$7B,$74,$20,$67,$65,$7A,$6F,$67,$65,$6E,$20,$0D
db $68,$61,$74,$2E,$11
db $4D,$61,$6E,$63,$68,$6D,$61,$6C,$20,$70,$61,$73,$73,$69,$65,$72,$74,$20,$65,$73,$2C,$0D
db $BA,$44,$69,$6E,$67,$65,$20,$B5,$D5,$A5,$0D
db $70,$61,$73,$73,$69,$65,$72,$65,$6E,$20,$B0,$B5,$0D
db $57,$69,$72,$6B,$6C,$69,$63,$68,$6B,$65,$69,$74,$20,$76,$65,$72,$7B,$6E,$64,$65,$72,$6E,$20,$13 : dw Default_Text_End
; @END@

.txt_second_talk:
; @DEFAULT_TEXTBOX@
; "Du erinnerst Dich an "
; "Lisa`s Traum, oder?"
; "Bist Du schon an den "
; "Ort zurückgekehrt?" WFE
; "Dinge könnten sich "
; "verändert haben, und "
; "nun anders aussehen." -> Default_Text_End
db $10
db $83,$65,$72,$69,$6E,$6E,$65,$72,$73,$74,$20,$85,$61,$6E,$20,$0D
db $4C,$69,$73,$61,$60,$73,$20,$54,$72,$61,$75,$6D,$2C,$20,$6F,$64,$65,$72,$3F,$0D
db $42,$69,$73,$74,$20,$83,$EA,$61,$6E,$20,$B7,$0D
db $4F,$72,$74,$20,$7A,$75,$72,$5B,$63,$6B,$67,$65,$6B,$65,$68,$72,$74,$3F,$11
db $44,$69,$6E,$67,$65,$20,$6B,$2A,$6E,$6E,$74,$65,$6E,$20,$E5,$0D
db $76,$65,$72,$7B,$6E,$64,$65,$72,$74,$20,$68,$61,$62,$65,$6E,$2C,$20,$EB,$0D
db $6E,$75,$6E,$20,$61,$6E,$64,$65,$72,$73,$20,$61,$75,$73,$73,$65,$68,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@
