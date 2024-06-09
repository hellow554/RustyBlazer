SH_script_starting:
    %CopJumpIfEventFlagIsSet(!EV_SH_NameChoosen, .end)
    %CopSetEventFlag(!EV_SH_NameChoosen)
    %CopJumpAfterNoFramesPassed(+, 2) : +
    %CopShowText(.txt_starting)
    %CopChooseName()
    %CopShowText(.txt_after_name_select)
.end:
    %Cop86()
    RTL

.txt_starting:
; @DEFAULT_TEXTBOX@
; "Eine Stimme kam aus "
; "den Wolken." WFE
; "«Mein Schüler ! Du "
; "bist in der Lage mit "
; "allen Lebewesen zu "
; "sprechen." WFE
; "Aus diesem Grund "
; "solltest Du einen "
; "Namen haben. Sag` "
; "mir Deinen Namen." -> $FB32
db $10
db $45,$69,$6E,$65,$20,$A0,$6B,$61,$6D,$20,$AD,$0D
db $B7,$57,$6F,$6C,$6B,$65,$6E,$2E,$11
db $3C,$98,$53,$63,$68,$5B,$6C,$65,$72,$20,$21,$20,$83,$0D
db $B4,$D3,$B6,$4C,$61,$67,$65,$20,$DA,$0D
db $61,$6C,$6C,$65,$6E,$20,$4C,$65,$62,$65,$77,$65,$73,$65,$6E,$20,$FD,$0D
db $73,$70,$72,$65,$63,$68,$65,$6E,$2E,$11
db $41,$75,$73,$20,$64,$69,$65,$73,$65,$6D,$20,$47,$72,$75,$6E,$64,$20,$0D
db $73,$6F,$6C,$6C,$74,$65,$73,$74,$20,$83,$C0,$0D
db $4E,$61,$6D,$65,$6E,$20,$68,$61,$62,$65,$6E,$2E,$20,$53,$61,$67,$60,$20,$0D
db $DB,$44,$65,$69,$6E,$65,$6E,$20,$4E,$61,$6D,$65,$6E,$2E,$13 : dw $FB32
; @END@

.txt_after_name_select:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME ",......."
; "Was für ein interes-"
; "santer Name." WFE
; "Nun gut. Die Welt "
; "zählt auf Dich. Zer-"
; "störe das Böse !" -> txt_shrine_clear_box
db $10
db $02,$02,$2C,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$0D
db $57,$61,$73,$20,$C9,$BE,$69,$6E,$74,$65,$72,$65,$73,$2D,$0D
db $73,$61,$6E,$74,$65,$72,$20,$4E,$61,$6D,$65,$2E,$11
db $4E,$75,$6E,$20,$67,$75,$74,$2E,$20,$87,$A9,$0D
db $7A,$7B,$68,$6C,$74,$20,$AC,$44,$69,$63,$68,$2E,$20,$5A,$65,$72,$2D,$0D
db $73,$74,$2A,$72,$65,$20,$B9,$42,$2A,$73,$65,$20,$21,$13 : dw txt_shrine_clear_box
; @END@
