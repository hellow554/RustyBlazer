A1_script_snitch_tulip:
    %CopJumpIfSealed(!Lair_A1_SnitchTulip, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
.anim_loop:
    %CopPlayAnimation(!Anim_Village_Tulip_Left_Right)
    %Cop82()
    BRA .anim_loop

.talk:
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Vergewissere Dich,"
; "unter allen Tulpen "
; "nachzuschauen." WFE
; "Es könnte sein, daß "
; "einer der Jungen,"
; "etwas darunter ver-"
; "steckt hat." WFE
; "Er hat gedacht,daß ihn "
; "niemand gesehen hat,"
; "aber ich habe ihn be-"
; "obachtet!" -> Default_Text_End
db $10
db $56,$65,$72,$67,$65,$77,$69,$73,$73,$65,$72,$65,$20,$44,$69,$63,$68,$2C,$0D
db $75,$6E,$74,$65,$72,$20,$61,$6C,$6C,$65,$6E,$20,$54,$75,$6C,$70,$65,$6E,$20,$0D
db $6E,$61,$63,$68,$7A,$75,$73,$63,$68,$61,$75,$65,$6E,$2E,$11
db $8C,$6B,$2A,$6E,$6E,$74,$65,$20,$73,$65,$69,$6E,$2C,$20,$BA,$0D
db $C6,$B6,$4A,$75,$6E,$67,$65,$6E,$2C,$0D
db $C2,$64,$61,$72,$75,$6E,$74,$65,$72,$20,$76,$65,$72,$2D,$0D
db $73,$74,$65,$63,$6B,$74,$20,$68,$61,$74,$2E,$11
db $45,$72,$20,$CF,$67,$65,$64,$61,$63,$68,$74,$2C,$BA,$69,$68,$6E,$20,$0D
db $6E,$69,$65,$6D,$61,$6E,$64,$20,$67,$65,$73,$65,$68,$65,$6E,$20,$68,$61,$74,$2C,$0D
db $AB,$D1,$CC,$69,$68,$6E,$20,$62,$65,$2D,$0D
db $6F,$62,$61,$63,$68,$74,$65,$74,$21,$13 : dw Default_Text_End
; @END@
