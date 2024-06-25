SH_new_game:
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
db 'E','i','n','e',' ',$A0,'k','a','m',' ',$AD,$0D
db $B7,'W','o','l','k','e','n','.',$11
db '«',$98,'S','c','h','ü','l','e','r',' ','!',' ',$83,$0D
db $B4,$D3,$B6,'L','a','g','e',' ',$DA,$0D
db 'a','l','l','e','n',' ','L','e','b','e','w','e','s','e','n',' ',$FD,$0D
db 's','p','r','e','c','h','e','n','.',$11
db 'A','u','s',' ','d','i','e','s','e','m',' ','G','r','u','n','d',' ',$0D
db 's','o','l','l','t','e','s','t',' ',$83,$C0,$0D
db 'N','a','m','e','n',' ','h','a','b','e','n','.',' ','S','a','g','`',' ',$0D
db $DB,'D','e','i','n','e','n',' ','N','a','m','e','n','.',$13 : dw $FB32
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
db $02,$02,',','.','.','.','.','.','.','.',$0D
db 'W','a','s',' ',$C9,$BE,'i','n','t','e','r','e','s','-',$0D
db 's','a','n','t','e','r',' ','N','a','m','e','.',$11
db 'N','u','n',' ','g','u','t','.',' ',$87,$A9,$0D
db 'z','ä','h','l','t',' ',$AC,'D','i','c','h','.',' ','Z','e','r','-',$0D
db 's','t','ö','r','e',' ',$B9,'B','ö','s','e',' ','!',$13 : dw txt_shrine_clear_box
; @END@
