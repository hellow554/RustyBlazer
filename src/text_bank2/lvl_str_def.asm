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
db 'L','e','v',':',$01,$0A,$05
db 'S','t','ä','r','k','e',' ',' ',':',$00
db $01,$08,$04
db $07,$16,$08
db $01,$0A,$05
db 'A','b','w','e','h','r',' ',' ',':',$00
db $01,$08,$04
db $07,$16,$08
db $00
; @ENDSTRING@