A1_script_Tulip_Above_Entrance:
    %CopJumpIfSealed(!Lair_A1_Tulip_Above_Entrance, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
.loop:
    COP #$80
    db $1E
    COP #$82
    BRA .loop
.talk:
    %CopJumpIfItemNotObtained(!DreamRod, .talk_no_dreamrod)
    %CopShowText(.text_has_dreamrod)
    RTL
.talk_no_dreamrod:
    %CopShowText(.text_no_dreamrod)
    RTL

.text_has_dreamrod:
; @DEFAULT_TEXTBOX@
; "Der Traumstab, den Du "
; "besitzt, ist ein ma-"
; "gischer Stab, durch "
; "welchen Du in die " WFE
; "Träume andere Leute "
; "schauen kannst. Be-"
; "nutze diesen Stab,"
; "wenn Du mit jemandem " WFE
; "sprechen möchtest, der "
; "schläft." -> Default_Text_End
db $10
db $88,$54,$72,$61,$75,$6D,$73,$74,$61,$62,$2C,$20,$B7,$83,$0D
db $62,$65,$73,$69,$74,$7A,$74,$2C,$20,$D2,$BE,$6D,$61,$2D,$0D
db $67,$69,$73,$63,$68,$65,$72,$20,$53,$74,$61,$62,$2C,$20,$64,$75,$72,$63,$68,$20,$0D
db $77,$65,$6C,$63,$68,$65,$6E,$20,$83,$D3,$B5,$11
db $54,$72,$7B,$75,$6D,$65,$20,$61,$6E,$64,$65,$72,$65,$20,$4C,$65,$75,$74,$65,$20,$0D
db $73,$63,$68,$61,$75,$65,$6E,$20,$6B,$61,$6E,$6E,$73,$74,$2E,$20,$42,$65,$2D,$0D
db $6E,$75,$74,$7A,$65,$20,$64,$69,$65,$73,$65,$6E,$20,$53,$74,$61,$62,$2C,$0D
db $F3,$83,$DA,$6A,$65,$6D,$61,$6E,$64,$65,$6D,$20,$11
db $73,$70,$72,$65,$63,$68,$65,$6E,$20,$6D,$2A,$63,$68,$74,$65,$73,$74,$2C,$20,$B6,$0D
db $73,$63,$68,$6C,$7B,$66,$74,$2E,$13 : dw Default_Text_End
; @END@

.text_no_dreamrod:
; @DEFAULT_TEXTBOX@
; "Ich habe gehört, es "
; "gibt einen magischen "
; "Stab, der es dem Be-"
; "sitzer ermöglicht, mit " WFE
; "schlafenden Personen "
; "zu sprechen. Er soll "
; "im unterirdischen "
; "Schloß versteckt sein." -> Default_Text_End
db $10
db $8F,$CC,$67,$65,$68,$2A,$72,$74,$2C,$20,$C3,$0D
db $CB,$C0,$6D,$61,$67,$69,$73,$63,$68,$65,$6E,$20,$0D
db $53,$74,$61,$62,$2C,$20,$B6,$C3,$BB,$42,$65,$2D,$0D
db $73,$69,$74,$7A,$65,$72,$20,$65,$72,$6D,$2A,$67,$6C,$69,$63,$68,$74,$2C,$20,$DA,$11
db $73,$63,$68,$6C,$61,$66,$65,$6E,$64,$65,$6E,$20,$50,$65,$72,$73,$6F,$6E,$65,$6E,$20,$0D
db $FD,$73,$70,$72,$65,$63,$68,$65,$6E,$2E,$20,$45,$72,$20,$73,$6F,$6C,$6C,$20,$0D
db $D5,$75,$6E,$74,$65,$72,$69,$72,$64,$69,$73,$63,$68,$65,$6E,$20,$0D
db $9E,$76,$65,$72,$73,$74,$65,$63,$6B,$74,$20,$73,$65,$69,$6E,$2E,$13 : dw Default_Text_End
; @END@
