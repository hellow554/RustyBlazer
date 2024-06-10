
A7_Script_stone_checker:
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, 7, 6, +) : RTL : +
    %CopJumpIfEventFlagIsSet(!EV_A1_SOMETHING_WITH_LISA_AND_CHIEFS_WIFE, .name_todo)
    %CopJumpIfEventFlagIsSet(!EV_SH_SOMETHING_with_stone, .name_todo2)

    LDA.W #!Key16_All_ActionButtons
    TSB.W button_mask
    %CopLoopStart(3) : %CopLoopEnd()
    %CopShowText(.txt_stones_glow)

    %CopRemoveItem(!BrownStone)
    %CopRemoveItem(!GreenStone)
    %CopRemoveItem(!BlueStone)
    %CopRemoveItem(!SilverStone)
    %CopRemoveItem(!PurpleStone)
    %CopRemoveItem(!BlackStone)

    LDA.W #$20
    STA.W _03B6
    %CopSetEventFlag(!EV_SH_Stones_Removed)
    %CopSetScriptAddr(.name_todo3)
    %CopSetScriptAddr(.name_todo4)
    %Cop31(0)
    %CopLoopStart(241) : %CopLoopEnd()
    %CopTeleportPlayerToMap($900, !Facing_Down, $D0, $50)
    RTL

.name_todo2:
    %CopJumpIfEventFlagIsUnset(!EV_SH_CanEnterAct7, +)
    %Cop86() : RTL : +

    LDA.W #!Key16_All_ActionButtons
    TSB.W button_mask
    %CopLoopStart(31) : %CopLoopEnd()
    %CopShowText(.txt_can_enter_a7)
    %CopSetEventFlag(!EV_SH_CanEnterAct7)
    LDA.W #!Key16_All_ActionButtons
    TRB.W button_mask
    %Cop86()
    RTL

.name_todo3:
    %CopA8(DATA_CD8000)
    %Cop92($48)
    %Cop94()
    %Cop86()
    RTL

.name_todo4:
    %CopA8(DATA_CD8000)
    %Cop92($4A)
    %Cop94()
    %Cop86()
    RTL

.name_todo:
    LDA.W #!Key16_All_ActionButtons|!Key16_B&~!Key16_Y
    TSB.W button_mask
    %CopLoopStart(41) : %CopLoopEnd()
    %CopShowText(.txt_game_done)
    %CopLoopStart(61) : %CopLoopEnd()
    LDA.W #$20
    STA.W _03B6
    %CopTeleportPlayerToMap($110, !Facing_Up, $1F0, $50)
    LDA.W #!Key16_All_ActionButtons|!Key16_B&~!Key16_Y
    TRB.W button_mask
    %CopSetScriptAddrToNextInstruction()
    RTL

.txt_stones_glow;
; @DEFAULT_TEXTBOX@
; "Die 6 Steine fingen "
; "an zu glitzern, und "
; "verschwanden in der "
; "Morgenröte." -> ACT7_CLEARBOX
db $10
db $87,'6',' ','S','t','e','i','n','e',' ','f','i','n','g','e','n',' ',$0D
db 'a','n',' ',$FD,'g','l','i','t','z','e','r','n',',',' ',$EB,$0D
db 'v','e','r','s','c','h','w','a','n','d','e','n',' ',$D3,$B6,$0D
db 'M','o','r','g','e','n','r','ö','t','e','.',$13 : dw ACT7_CLEARBOX
; @END@

.txt_can_enter_a7:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME " , das Tor zur "
; "Welt des Bösen hat "
; "sich geöffnet." WFE
; "Aber Du benötigst die "
; "Hilfe des Phönix`s,"
; "um Deathtoll zu "
; "besiegen." WFE
; "Wenn Dich der Phönix "
; "begleitet, wird  " WFE
; "Deathtoll`s Palast in "
; "der Welt des Bösen "
; "erscheinen." WFE
; PLAYER_NAME ","
; "versuche die drei "
; "Symbole zu finden." -> ACT7_CLEARBOX
db $10
db $02,$02,' ',',',' ',$B9,'T','o','r',' ','z','u','r',' ',$0D
db $A9,$B8,$82,$CF,$0D
db $E5,'g','e','ö','f','f','n','e','t','.',$11
db $80,$83,'b','e','n','ö','t','i','g','s','t',' ',$B5,$0D
db 'H','i','l','f','e',' ',$B8,'P','h','ö','n','i','x','`','s',',',$0D
db $EC,$86,$FD,$0D
db 'b','e','s','i','e','g','e','n','.',$11
db $A8,$85,$B6,'P','h','ö','n','i','x',' ',$0D
db 'b','e','g','l','e','i','t','e','t',',',' ',$F7,' ',$11
db 'D','e','a','t','h','t','o','l','l','`','s',' ','P','a','l','a','s','t',' ',$D3,$0D
db $B6,$A9,$B8,$82,$0D
db 'e','r','s','c','h','e','i','n','e','n','.',$11
db $02,$02,',',$0D
db 'v','e','r','s','u','c','h','e',' ',$B5,'d','r','e','i',' ',$0D
db 'S','y','m','b','o','l','e',' ',$FD,'f','i','n','d','e','n','.',$13 : dw ACT7_CLEARBOX
; @END@

.txt_game_done:
; @DEFAULT_TEXTBOX@
;; TODO: what does 0x0f do?!
; "\x0f" NO_NEWLINE
; PLAYER_NAME ","
; WAIT $1E "Du hast es geschafft!"
; WAIT $5A "Alle Kreaturen wurden "
; "gerettet. Jeder ein-"
; "zelne dankt Dir!"
; WAIT $5A "Warum besuchst Du "
; "nicht die Welt und "
; "bewunderst alle "
; "Kreaturen." NO_NEWLINE
; WAIT $78 -> ACT7_CLEARBOX_NO_WFAK
db $10
db $0F
db $02,$02,',',$0D
db $0E,$1E,$83,$CD,$C3,'g','e','s','c','h','a','f','f','t','!',$0D
db $0E,$5A,'A','l','l','e',' ','K','r','e','a','t','u','r','e','n',' ','w','u','r','d','e','n',' ',$0D
db 'g','e','r','e','t','t','e','t','.',' ','J','e','d','e','r',' ','e','i','n','-',$0D
db 'z','e','l','n','e',' ','d','a','n','k','t',' ','D','i','r','!',$0D
db $0E,$5A,'W','a','r','u','m',' ','b','e','s','u','c','h','s','t',' ',$83,$0D
db $DF,$B5,$A9,$EB,$0D
db 'b','e','w','u','n','d','e','r','s','t',' ',$AE,$0D
db 'K','r','e','a','t','u','r','e','n','.'
db $0E,$78,$13 : dw ACT7_CLEARBOX_NO_WFAK
; @END@