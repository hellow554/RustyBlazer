A1_script_old_man_with_goat:
    %CopJumpIfSealed(!Lair_A1_OldManWithGoat, +) : RTL : +
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk:  
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Nachdem ich meine "
; "Frau an den Folgen "
; "einer Krankheit ver-"
; "loren habe, fiel " WFE
; "mir eine Ziege auf,"
; "die sich am Haus "
; "aufhielt. Ich war so "
; "einsam, daß ich mich " WFE
; "dazu entschloß sie "
; "zu behalten." -> Default_Text_End
db $10
db $4E,$61,$63,$68,$64,$65,$6D,$20,$D1,$DC,$0D
db $46,$72,$61,$75,$20,$61,$6E,$20,$B7,$46,$6F,$6C,$67,$65,$6E,$20,$0D
db $C6,$4B,$72,$61,$6E,$6B,$68,$65,$69,$74,$20,$76,$65,$72,$2D,$0D
db $6C,$6F,$72,$65,$6E,$20,$68,$61,$62,$65,$2C,$20,$66,$69,$65,$6C,$20,$11
db $DB,$BF,$5A,$69,$65,$67,$65,$20,$61,$75,$66,$2C,$0D
db $B5,$E5,$61,$6D,$20,$48,$61,$75,$73,$20,$0D
db $61,$75,$66,$68,$69,$65,$6C,$74,$2E,$20,$8F,$FC,$E9,$0D
db $65,$69,$6E,$73,$61,$6D,$2C,$20,$BA,$D1,$D9,$11
db $64,$61,$7A,$75,$20,$65,$6E,$74,$73,$63,$68,$6C,$6F,$25,$20,$E6,$0D
db $FD,$62,$65,$68,$61,$6C,$74,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@
