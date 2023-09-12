UI_LevelStrengthDefense:
; @NEW_TEXT@
; SETPOS 8 4
; DRAWBOX $16 8
; SETPOS $AA 4
; "Lev:" SETPOS $A 5
; "Stärke  :\0" NO_NEWLINE
; SETPOS 8 4
; DRAWBOX $16 8
; SETPOS $A 5
; "Abwehr  :\0" NO_NEWLINE
; SETPOS 8 4
; DRAWBOX $16 8
db $01,$08,$04
db $07,$16,$08
db $01,$AA,$04
db $4C,$65,$76,$3A,$01,$0A,$05
db $53,$74,$7B,$72,$6B,$65,$20,$20,$3A,$00
db $01,$08,$04
db $07,$16,$08
db $01,$0A,$05
db $41,$62,$77,$65,$68,$72,$20,$20,$3A,$00
db $01,$08,$04
db $07,$16,$08
db $00
; @ENDSTRING@
