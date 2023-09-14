
choice_yes_no:
; @NEW_TEXT@
; SETPOS $88 2
; DRAWBOX 5 4
; " Ja\n\n" NO_NEWLINE
; " Nein" NO_NEWLINE
; SETPOS $0A 3
db $01,$88,$02
db $07,$05,$04
db $20,$4A,$61,$0D,$0D
db $20,$4E,$65,$69,$6E
db $01,$0A,$03
db $00
; @ENDSTRING@

choice_yes:
; @NEW_TEXT@
; SETPOS 8 3
; DRAWBOX 3 2
; " Ja" NO_NEWLINE
; SETPOS $8A 3
db $01,$08,$03
db $07,$03,$02
db $20,$4A,$61
db $01,$8A,$03
db $00
; @ENDSTRING@

choice_record_move_quit:
; @NEW_TEXT@
; SETPOS 8 2
; DRAWBOX 9 6
; " Sichern\n\n" NO_NEWLINE
; " Bewegen\n\n" NO_NEWLINE
; " Aufgeben" NO_NEWLINE
; SETPOS $8A 2
db $01,$08,$02
db $07,$09,$06
db $20,$53,$69,$63,$68,$65,$72,$6E,$0D,$0D
db $20,$42,$65,$77,$65,$67,$65,$6E,$0D,$0D
db $20,$41,$75,$66,$67,$65,$62,$65,$6E
db $01,$8A,$02
db $00
; @ENDSTRING@

choice_record_quit:
; @NEW_TEXT@
; SETPOS $88 2
; DRAWBOX 9 4
; " Sichern\n\n" NO_NEWLINE
; " Aufgeben" NO_NEWLINE
; SETPOS $0A 3
db $01,$88,$02
db $07,$09,$04
db $20,$53,$69,$63,$68,$65,$72,$6E,$0D,$0D
db $20,$41,$75,$66,$67,$65,$62,$65,$6E
db $01,$0A,$03
db $00
; @ENDSTRING@

choice_stay_go_back:
; @NEW_TEXT@
; SETPOS $88 2
; DRAWBOX 8 4
; " Bleiben\n\n" NO_NEWLINE
; " Zurück" NO_NEWLINE
; SETPOS $0A 3
db $01,$88,$02
db $07,$08,$04
db $20,$42,$6C,$65,$69,$62,$65,$6E,$0D,$0D
db $20,$5A,$75,$72,$5B,$63,$6B
db $01,$0A,$03
db $00
; @ENDSTRING@
