A1_script_UndergroundLift:
    %CopAdjustNpcYPosition(2)

.lift_loop:
    %CopSetScriptAddrToNextInstruction()
    ;
    %CopJumpIfEventFlagIsSet(!EV_A1_WatermillwheelRotated, .wheel_rotated)
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $47, $38, .wheel_not_rated)
    RTL

;; it could be that I swapped up and downwards position, please bear with me :)
.wheel_rotated:
    ; check if the lift should be in upwards or downwards position
    LDY.W _039E
    LDA 0, Y
    CMP #$4B0
    BCC .lift_at_bottom_position
    ; move it up
    %CopAdjustNpcYPosition(-80)
    %Cop27(.lift_at_top_position)

.lift_at_bottom_position:
    %CopSetScriptAddrToNextInstruction()
    ;
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $47, $38, .start_moving_upwards)
    RTL

.start_moving_upwards:
    ; don't move the elevator if we want to get out of it after it has been moved
    LDA.W buttons_pressed
    AND.W #Key16.Up
    BNE + : RTL : +
    %Cop81($2A, $14)
    %Cop83()
    %Cop27(.lift_at_top_position)

.lift_at_top_position:
    %CopSetScriptAddrToNextInstruction()
    ;
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $47, $33, .start_moving_downwards)
    RTL

.start_moving_downwards:
    LDA.W buttons_pressed
    AND.W #Key16.Down
    BNE + : RTL : +

    %Cop81($2C, $14)
    %Cop83()
    %Cop27(.lift_at_bottom_position)

.wheel_not_rated:
    %CopShowText(.txt)
    %CopSetScriptAddrToNextInstruction()
    ;
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $47, $38, .ret)
    BRA .lift_loop
.ret:
    RTL

.txt:
; @DEFAULT_TEXTBOX@
; "Ich bin ein Fahrstuhl,"
; "welcher von Dr.Leo "
; "erfunden wurde." WFE
; "Um mich bewegen zu "
; "können, muß die "
; "Wassermühle laufen." -> Default_Text_End
db $10
db $8F,$B1,$BE,'F','a','h','r','s','t','u','h','l',',',$0D
db 'w','e','l','c','h','e','r',' ',$EE,'D','r','.',$93,$0D
db 'e','r','f','u','n','d','e','n',' ','w','u','r','d','e','.',$11
db 'U','m',' ',$D9,'b','e','w','e','g','e','n',' ',$FD,$0D
db 'k','ö','n','n','e','n',',',' ','m','u','ß',' ',$B5,$0D
db 'W','a','s','s','e','r','m','ü','h','l','e',' ','l','a','u','f','e','n','.',$13 : dw Default_Text_End
; @END@
