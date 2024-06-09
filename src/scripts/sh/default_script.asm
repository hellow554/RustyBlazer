SH_script_shrine:
    %CopRestoreToFullHealth()
.after_restore_health:
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, 7, 4, .altar_touch)
    %CopJumpIfEntityHasReachedXY(!Entity_Player, 7, 6, .central_touch)
    RTL

.altar_touch:
    %CopShowText(.txt_altar)
    %CopJumpIfEventFlagIsSet(!EV_A1_TalkedWithVillageChief, ..show_also_move)
    %CopShowMenu(choice_record_quit, 2, ..quit_talking)
    LDA.L choice_idx
    BNE + : BRL ..save : +
    BRL ..quit_talking

..show_also_move:
    %CopShowMenu(choice_record_move_quit, 3, ..quit_talking)
    LDA.L choice_idx
    BNE + : BRL ..save : +

    DEC A
    BEQ ..show_area_selection
    BRL ..quit_talking

..show_area_selection:
    %CopShowText(.txt_clear_all)
    PHX
    LDA.W #9
    STA.W sceneId
    LDA.W _03BC
    ASL #2
    TAX
    LDA.L ..map_cursor_positions, X
    STA.W TeleportPos.x
    LDA.L ..map_cursor_positions + 2, X
    STA.W TeleportPos.y
    PLX
    RTL

;; X and Y positions of the cursor on the act selection map
..map_cursor_positions:
    dw $0070, $00A0 ; Act1
    dw $0030, $0160 ; Act2
    dw $00F0, $0160 ; Act3
    dw $00F0, $0060 ; Act4
    dw $01B0, $0140 ; Act5
    dw $0170, $0060 ; Act6
    dw $00F0, $0020 ; Act7

..save:
    %CopShowText(.txt_ask_save)
    %CopShowMenu(choice_yes_no, 2, ..quit_talking)
    LDA.L choice_idx
    DEC
    BEQ ..quit_talking
    %PlaySound(!Sound_Saving)
    PHX
    JSL.L CODE_C38000
    PLX
    LDA.W #!Key16_All_ActionButtons
    TSB.W button_mask
    %CopLoopStart(61) : %CopLoopEnd()

    LDA.W #!Key16_All_ActionButtons
    TRB.W button_mask
    %CopShowText(.txt_save_done)
    %CopShowMenu(choice_yes_no, 2, ..quit_talking)
    LDA.L choice_idx
    BEQ ..quit_talking
    %CopShowText(.txt_end_game)
    LDA.W #!Key16_All_ActionButtons ^ !Key16_X ; Seems like a bug to me :)
    TSB.W button_mask
    %CopLoopStart(31) : %CopLoopEnd()

    %PlaySound(!Sound_PlayerVanish)
    %CopAC(.after_something, $70, $50, $50)
    %Cop34()
    %CopLoopStart(61) : %CopLoopEnd()
    %Cop31($13)
    %CopSetScriptAddrToNextInstruction()
    RTL

..quit_talking:
    %CopShowText(.txt_cont_game)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, 7, 4, ..end)
    BRL .after_restore_health
..end:
    RTL

.central_touch:
    LDA.W player_died
    BEQ ..not_dead
    ; player was dead, let's show the text
    STZ.W player_died                          
    %CopJumpAfterNoFramesPassed(+, 2) : +
    %CopShowText(.txt_revive)
    %Cop27(.after_restore_health)

..not_dead:
    %CopJumpIfEventFlagIsSet(!EV_SH_BrownStoneTalkWithGod, ..brown_stone_talk_done)
    %CopJumpIfEventFlagIsUnset(!EV_A1_TalkedWithVillageChief, ..brown_stone_talk_done)
    %CopLoopStart(3) : %CopLoopEnd()
    %CopSetEventFlag(!EV_SH_BrownStoneTalkWithGod)
    %CopShowText(.txt_first_stone)

..brown_stone_talk_done:
    %Cop27(.after_restore_health)

.after_something:
    %CopA8($8E8000)
    LDA.W _0372
    STA.W $1C, X
    %CopA3()
    %CopA2($30)
    %CopPlayAnimation(2)
    %Cop82()
    %Cop86()
    RTL

.txt_altar:
; @DEFAULT_TEXTBOX@
; "Eine Stimme kam aus "
; "den Wolken." WFE
; -> .txt_next_wo_border
db $10
db $45,$69,$6E,$65,$20,$A0,$6B,$61,$6D,$20,$AD,$0D
db $B7,$57,$6F,$6C,$6B,$65,$6E,$2E,$11
db $13 : dw .txt_next_wo_border
; @END@

.txt_next:
; @DEFAULT_TEXTBOX@
; LABEL .txt_next_wo_border
; PLAYER_NAME ","
; "wie kann ich Dir "
; "helfen ?" CONT
db $10
.txt_next_wo_border:
db $02,$02,$2C,$0D
db $F6,$D7,$D1,$84,$0D
db $68,$65,$6C,$66,$65,$6E,$20,$3F,$0C
; @END@

.txt_ask_save:
; @NEW_TEXT@
; "Ich werde Deinen Fort-"
; "schritt aufzeichnen."
; "Ist das okay ?" CONT
db $8F,$F2,$44,$65,$69,$6E,$65,$6E,$20,$46,$6F,$72,$74,$2D,$0D
db $73,$63,$68,$72,$69,$74,$74,$20,$61,$75,$66,$7A,$65,$69,$63,$68,$6E,$65,$6E,$2E,$0D
db $49,$73,$74,$20,$B9,$6F,$6B,$61,$79,$20,$3F,$0C
; @END@

.txt_save_done:
; @NEW_TEXT@
; "Aufzeichnung beendet." WFE
; "Möchtest Du weiter-"
; "machen ?" CONT
db $41,$75,$66,$7A,$65,$69,$63,$68,$6E,$75,$6E,$67,$20,$62,$65,$65,$6E,$64,$65,$74,$2E,$11
db $96,$83,$77,$65,$69,$74,$65,$72,$2D,$0D
db $6D,$61,$63,$68,$65,$6E,$20,$3F,$0C
; @END@

.txt_end_game:
; @NEW_TEXT@
; "Erhole Dich gut. Es "
; "gibt noch viel zu tun." -> txt_shrine_clear_box
db $45,$72,$68,$6F,$6C,$65,$20,$85,$67,$75,$74,$2E,$20,$8C,$0D
db $CB,$E0,$76,$69,$65,$6C,$20,$FD,$74,$75,$6E,$2E,$13 : dw txt_shrine_clear_box
; @END@

.txt_cont_game:
; @NEW_TEXT@
; PLAYER_NAME NEWLINE
; "Du hast Dich wacker "
; "geschlagen. Gib jetzt "
; "nicht auf." -> txt_shrine_clear_box
db $02,$02,$0D
db $83,$CD,$85,$77,$61,$63,$6B,$65,$72,$20,$0D
db $67,$65,$73,$63,$68,$6C,$61,$67,$65,$6E,$2E,$20,$47,$69,$62,$20,$D6,$0D
db $DF,$61,$75,$66,$2E,$13 : dw txt_shrine_clear_box
; @END@

.txt_clear_all:
; @NEW_TEXT@
; CLEARBOX 6 4 CONT
db $08,$06,$04,$0C
; @END@

.txt_revive:
; @DEFAULT_TEXTBOX@
; "Eine Stimme kam aus "
; "den Wolken." WFE
; "«Beeile Dich nicht zu "
; "sehr. Übe Dich in "
; "Geduld, und erreiche "
; "sicher Dein Ziel.» " -> txt_shrine_clear_box
db $10
db $45,$69,$6E,$65,$20,$A0,$6B,$61,$6D,$20,$AD,$0D
db $B7,$57,$6F,$6C,$6B,$65,$6E,$2E,$11
db $3C,$42,$65,$65,$69,$6C,$65,$20,$85,$DF,$FD,$0D
db $73,$65,$68,$72,$2E,$20,$28,$62,$65,$20,$85,$D3,$0D
db $47,$65,$64,$75,$6C,$64,$2C,$20,$EB,$65,$72,$72,$65,$69,$63,$68,$65,$20,$0D
db $73,$69,$63,$68,$65,$72,$20,$44,$65,$69,$6E,$20,$5A,$69,$65,$6C,$2E,$3E,$20,$13 : dw txt_shrine_clear_box
; @END@

.txt_first_stone:
; @DEFAULT_TEXTBOX@
; "Eine Stimme kam aus "
; "den Wolken." WFE
; "«Der braune Stein, den "
; "Du erhalten hast, ist "
; "einer von 6 Steinen in "
; "dieser Welt." WFE
; "Wenn alle 6 Steine "
; "beisammen sind," WFE
; "öffnet sich das "
; "Tor, welches zur Welt "
; "des Bösen führt." WFE
; "Begebe Dich nun nach "
; "Green Wood, wo Dich "
; "der nächste Stein er-"
; "wartet.» " -> txt_shrine_clear_box
db $10
db $45,$69,$6E,$65,$20,$A0,$6B,$61,$6D,$20,$AD,$0D
db $B7,$57,$6F,$6C,$6B,$65,$6E,$2E,$11
db $3C,$88,$62,$72,$61,$75,$6E,$65,$20,$53,$74,$65,$69,$6E,$2C,$20,$B7,$0D
db $83,$65,$72,$68,$61,$6C,$74,$65,$6E,$20,$68,$61,$73,$74,$2C,$20,$D2,$0D
db $C6,$EE,$36,$20,$53,$74,$65,$69,$6E,$65,$6E,$20,$D3,$0D
db $BD,$57,$65,$6C,$74,$2E,$11
db $A8,$AE,$36,$20,$53,$74,$65,$69,$6E,$65,$20,$0D
db $62,$65,$69,$73,$61,$6D,$6D,$65,$6E,$20,$73,$69,$6E,$64,$2C,$11
db $2A,$66,$66,$6E,$65,$74,$20,$E5,$B9,$0D
db $54,$6F,$72,$2C,$20,$77,$65,$6C,$63,$68,$65,$73,$20,$7A,$75,$72,$20,$A9,$0D
db $B8,$82,$66,$5B,$68,$72,$74,$2E,$11
db $42,$65,$67,$65,$62,$65,$20,$85,$6E,$75,$6E,$20,$E3,$0D
db $47,$72,$65,$65,$6E,$20,$57,$6F,$6F,$64,$2C,$20,$77,$6F,$20,$85,$0D
db $B6,$6E,$7B,$63,$68,$73,$74,$65,$20,$A2,$65,$72,$2D,$0D
db $77,$61,$72,$74,$65,$74,$2E,$3E,$20,$13 : dw txt_shrine_clear_box
; @END@
