A1_script_painter:
    %CopJumpIfSealed(!Lair_A1_Painter, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Painter, .revealing)
    %CopAC(.player_touched_picture, 0, $10, $2000)
    %CopJumpIfSealed(!Lair_A1_Chief, .chief_is_sealed)
    %CopAssignTalkCallback(.talk)


.walking_loop:
    %CopPlayAnimation(!Anim_Village_Man_Walking_Down)
    %Cop82()
    %Cop87()
    %Cop81(5, 2)
    %Cop83()
    %CopPlayAnimation(!Anim_Village_Man_Walking_Up)
    %Cop82()
    %Cop87()
    %Cop81(5, 2)
    %Cop83()
    BRL .walking_loop

.chief_is_sealed:
    %CopAssignTalkCallback(.talk_chief_is_there)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.player_touched_picture:
    %Cop20(..pos_jump)
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $30, $04, ..reached_pos)
..pos_jump:
    %CopClearEventFlag(!EV_A1_Saw_Chief_In_Picture)
    RTL
..reached_pos:
    %CopJumpIfItemIsNotEquipped(!LeosBrush, ..no_brush)
    %CopShowText(.txt_sucked_in)
    %CopTeleportPlayerToMap($103, !Facing_Up, $78, $3E0)
    RTL
..no_brush:
    %CopJumpIfEventFlagIsSet(!EV_A1_Saw_Chief_In_Picture, ..ret)
    %CopSetEventFlag(!EV_A1_Saw_Chief_In_Picture)
    %CopJumpIfSealed(!Lair_A1_Chief, ..chief_sealed)
    %CopShowText(.txt_chief_not_released)

..ret:
    RTL

..chief_sealed:
    %CopShowText(.txt_boss_defeated)
    RTL

.talk:
    %CopShowText(.txt_painter_talk)
    RTL
.talk_chief_is_there:
    %CopShowText(.txt_painter_talk_chief_released)
    RTL

.revealing:
    %CopShowText(.txt_revealing)
    %Cop86()
    RTL

.txt_painter_talk:
; @DEFAULT_TEXTBOX@
; "Dies wurde von Dr.\x93"
; "gemalt. Auf einmal er-"
; "schien ein seltsames "
; "Gesicht." WFE
; "Es ist schrecklich!!" -> Default_Text_End
db $10
db $89,$F8,$EE,$44,$72,$2E,$93,$0D
db $67,$65,$6D,$61,$6C,$74,$2E,$20,$41,$75,$66,$20,$C4,$65,$72,$2D,$0D
db $73,$63,$68,$69,$65,$6E,$20,$BE,$73,$65,$6C,$74,$73,$61,$6D,$65,$73,$20,$0D
db $47,$65,$73,$69,$63,$68,$74,$2E,$11
db $8C,$D2,$73,$63,$68,$72,$65,$63,$6B,$6C,$69,$63,$68,$21,$21,$13 : dw Default_Text_End
; @END@

.txt_sucked_in:
; @DEFAULT_TEXTBOX@
; "\x0F" PLAYER_NAME " wird "
; "in das Bild hinein-"
; "gezogen!" -> Default_Text_End
db $10
db $0F,$02,$02,$20,$F7,$0D
db $D3,$B9,$42,$69,$6C,$64,$20,$68,$69,$6E,$65,$69,$6E,$2D,$0D
db $67,$65,$7A,$6F,$67,$65,$6E,$21,$13 : dw Default_Text_End
; @END@

.txt_chief_not_released:
; @DEFAULT_TEXTBOX@
; "\x0F" "In dem Bild kann man "
; "den Bürgermeister er-"
; "kennen.\x8Cscheint, als "
; "wäre er traurig." -> Default_Text_End
db $10
db $0F,$49,$6E,$20,$BB,$42,$69,$6C,$64,$20,$D7,$6D,$61,$6E,$20,$0D
db $B7,$42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$20,$65,$72,$2D,$0D
db $6B,$65,$6E,$6E,$65,$6E,$2E,$8C,$73,$63,$68,$65,$69,$6E,$74,$2C,$20,$AF,$0D
db $77,$7B,$72,$65,$20,$C8,$74,$72,$61,$75,$72,$69,$67,$2E,$13 : dw Default_Text_End
; @END@

.txt_boss_defeated:
; @DEFAULT_TEXTBOX@
; "\x0F" "Das Bild ist wieder "
; "normal geworden." -> Default_Text_End
db $10
db $0F,$8A,$42,$69,$6C,$64,$20,$D2,$F4,$0D
db $6E,$6F,$72,$6D,$61,$6C,$20,$67,$65,$77,$6F,$72,$64,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@

.txt_painter_talk_chief_released:
; @DEFAULT_TEXTBOX@
; "Das Gesicht des "
; "Bürgermeisters ist "
; "wieder verschwunden."
; "Was war das ?!" -> Default_Text_End
db $10
db $8A,$47,$65,$73,$69,$63,$68,$74,$20,$B8,$0D
db $42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$73,$20,$D2,$0D
db $F4,$76,$65,$72,$73,$63,$68,$77,$75,$6E,$64,$65,$6E,$2E,$0D
db $57,$61,$73,$20,$FC,$B9,$3F,$21,$13 : dw Default_Text_End
; @END@

.txt_revealing:
; @DEFAULT_TEXTBOX@
; WAIT 60
; "Du hörst den Schrei "
; "eines Mannes aus dem "
; "Haus." WFE
; "AAAAAHHH !!"
; "EIN GEIST ! EIN GEIST!" -> Default_Text_End
db $10
db $0E,60
db $83,$68,$2A,$72,$73,$74,$20,$B7,$53,$63,$68,$72,$65,$69,$20,$0D
db $C5,$4D,$61,$6E,$6E,$65,$73,$20,$AD,$BB,$0D
db $48,$61,$75,$73,$2E,$11
db $41,$41,$41,$41,$41,$48,$48,$48,$20,$21,$21,$0D
db $45,$49,$4E,$20,$47,$45,$49,$53,$54,$20,$21,$20,$45,$49,$4E,$20,$47,$45,$49,$53,$54,$21,$13 : dw Default_Text_End
; @END@
