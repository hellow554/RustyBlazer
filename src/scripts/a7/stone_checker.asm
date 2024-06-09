
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
db $87,$36,$20,$53,$74,$65,$69,$6E,$65,$20,$66,$69,$6E,$67,$65,$6E,$20,$0D
db $61,$6E,$20,$FD,$67,$6C,$69,$74,$7A,$65,$72,$6E,$2C,$20,$EB,$0D
db $76,$65,$72,$73,$63,$68,$77,$61,$6E,$64,$65,$6E,$20,$D3,$B6,$0D
db $4D,$6F,$72,$67,$65,$6E,$72,$2A,$74,$65,$2E,$13 : dw ACT7_CLEARBOX
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
db $02,$02,$20,$2C,$20,$B9,$54,$6F,$72,$20,$7A,$75,$72,$20,$0D
db $A9,$B8,$82,$CF,$0D
db $E5,$67,$65,$2A,$66,$66,$6E,$65,$74,$2E,$11
db $80,$83,$62,$65,$6E,$2A,$74,$69,$67,$73,$74,$20,$B5,$0D
db $48,$69,$6C,$66,$65,$20,$B8,$50,$68,$2A,$6E,$69,$78,$60,$73,$2C,$0D
db $EC,$86,$FD,$0D
db $62,$65,$73,$69,$65,$67,$65,$6E,$2E,$11
db $A8,$85,$B6,$50,$68,$2A,$6E,$69,$78,$20,$0D
db $62,$65,$67,$6C,$65,$69,$74,$65,$74,$2C,$20,$F7,$20,$11
db $44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$60,$73,$20,$50,$61,$6C,$61,$73,$74,$20,$D3,$0D
db $B6,$A9,$B8,$82,$0D
db $65,$72,$73,$63,$68,$65,$69,$6E,$65,$6E,$2E,$11
db $02,$02,$2C,$0D
db $76,$65,$72,$73,$75,$63,$68,$65,$20,$B5,$64,$72,$65,$69,$20,$0D
db $53,$79,$6D,$62,$6F,$6C,$65,$20,$FD,$66,$69,$6E,$64,$65,$6E,$2E,$13 : dw ACT7_CLEARBOX
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
db $02,$02,$2C,$0D
db $0E,$1E,$83,$CD,$C3,$67,$65,$73,$63,$68,$61,$66,$66,$74,$21,$0D
db $0E,$5A,$41,$6C,$6C,$65,$20,$4B,$72,$65,$61,$74,$75,$72,$65,$6E,$20,$77,$75,$72,$64,$65,$6E,$20,$0D
db $67,$65,$72,$65,$74,$74,$65,$74,$2E,$20,$4A,$65,$64,$65,$72,$20,$65,$69,$6E,$2D,$0D
db $7A,$65,$6C,$6E,$65,$20,$64,$61,$6E,$6B,$74,$20,$44,$69,$72,$21,$0D
db $0E,$5A,$57,$61,$72,$75,$6D,$20,$62,$65,$73,$75,$63,$68,$73,$74,$20,$83,$0D
db $DF,$B5,$A9,$EB,$0D
db $62,$65,$77,$75,$6E,$64,$65,$72,$73,$74,$20,$AE,$0D
db $4B,$72,$65,$61,$74,$75,$72,$65,$6E,$2E
db $0E,$78,$13 : dw ACT7_CLEARBOX_NO_WFAK
; @END@
