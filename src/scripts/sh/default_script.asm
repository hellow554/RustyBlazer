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
db 'E','i','n','e',' ',$A0,'k','a','m',' ',$AD,$0D
db $B7,'W','o','l','k','e','n','.',$11
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
db $02,$02,',',$0D
db $F6,$D7,$D1,$84,$0D
db 'h','e','l','f','e','n',' ','?',$0C
; @END@

.txt_ask_save:
; @NEW_TEXT@
; "Ich werde Deinen Fort-"
; "schritt aufzeichnen."
; "Ist das okay ?" CONT
db $8F,$F2,'D','e','i','n','e','n',' ','F','o','r','t','-',$0D
db 's','c','h','r','i','t','t',' ','a','u','f','z','e','i','c','h','n','e','n','.',$0D
db 'I','s','t',' ',$B9,'o','k','a','y',' ','?',$0C
; @END@

.txt_save_done:
; @NEW_TEXT@
; "Aufzeichnung beendet." WFE
; "Möchtest Du weiter-"
; "machen ?" CONT
db 'A','u','f','z','e','i','c','h','n','u','n','g',' ','b','e','e','n','d','e','t','.',$11
db $96,$83,'w','e','i','t','e','r','-',$0D
db 'm','a','c','h','e','n',' ','?',$0C
; @END@

.txt_end_game:
; @NEW_TEXT@
; "Erhole Dich gut. Es "
; "gibt noch viel zu tun." -> txt_shrine_clear_box
db 'E','r','h','o','l','e',' ',$85,'g','u','t','.',' ',$8C,$0D
db $CB,$E0,'v','i','e','l',' ',$FD,'t','u','n','.',$13 : dw txt_shrine_clear_box
; @END@

.txt_cont_game:
; @NEW_TEXT@
; PLAYER_NAME NEWLINE
; "Du hast Dich wacker "
; "geschlagen. Gib jetzt "
; "nicht auf." -> txt_shrine_clear_box
db $02,$02,$0D
db $83,$CD,$85,'w','a','c','k','e','r',' ',$0D
db 'g','e','s','c','h','l','a','g','e','n','.',' ','G','i','b',' ',$D6,$0D
db $DF,'a','u','f','.',$13 : dw txt_shrine_clear_box
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
db 'E','i','n','e',' ',$A0,'k','a','m',' ',$AD,$0D
db $B7,'W','o','l','k','e','n','.',$11
db '«','B','e','e','i','l','e',' ',$85,$DF,$FD,$0D
db 's','e','h','r','.',' ','Ü','b','e',' ',$85,$D3,$0D
db 'G','e','d','u','l','d',',',' ',$EB,'e','r','r','e','i','c','h','e',' ',$0D
db 's','i','c','h','e','r',' ','D','e','i','n',' ','Z','i','e','l','.','»',' ',$13 : dw txt_shrine_clear_box
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
db 'E','i','n','e',' ',$A0,'k','a','m',' ',$AD,$0D
db $B7,'W','o','l','k','e','n','.',$11
db '«',$88,'b','r','a','u','n','e',' ','S','t','e','i','n',',',' ',$B7,$0D
db $83,'e','r','h','a','l','t','e','n',' ','h','a','s','t',',',' ',$D2,$0D
db $C6,$EE,'6',' ','S','t','e','i','n','e','n',' ',$D3,$0D
db $BD,'W','e','l','t','.',$11
db $A8,$AE,'6',' ','S','t','e','i','n','e',' ',$0D
db 'b','e','i','s','a','m','m','e','n',' ','s','i','n','d',',',$11
db 'ö','f','f','n','e','t',' ',$E5,$B9,$0D
db 'T','o','r',',',' ','w','e','l','c','h','e','s',' ','z','u','r',' ',$A9,$0D
db $B8,$82,'f','ü','h','r','t','.',$11
db 'B','e','g','e','b','e',' ',$85,'n','u','n',' ',$E3,$0D
db 'G','r','e','e','n',' ','W','o','o','d',',',' ','w','o',' ',$85,$0D
db $B6,'n','ä','c','h','s','t','e',' ',$A2,'e','r','-',$0D
db 'w','a','r','t','e','t','.','»',' ',$13 : dw txt_shrine_clear_box
; @END@
