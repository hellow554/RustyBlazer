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
db $89,$F8,$EE,'D','r','.',$93,$0D
db 'g','e','m','a','l','t','.',' ','A','u','f',' ',$C4,'e','r','-',$0D
db 's','c','h','i','e','n',' ',$BE,'s','e','l','t','s','a','m','e','s',' ',$0D
db 'G','e','s','i','c','h','t','.',$11
db $8C,$D2,'s','c','h','r','e','c','k','l','i','c','h','!','!',$13 : dw Default_Text_End
; @END@

.txt_sucked_in:
; @DEFAULT_TEXTBOX@
; "\x0F" PLAYER_NAME " wird "
; "in das Bild hinein-"
; "gezogen!" -> Default_Text_End
db $10
db $0F,$02,$02,' ',$F7,$0D
db $D3,$B9,'B','i','l','d',' ','h','i','n','e','i','n','-',$0D
db 'g','e','z','o','g','e','n','!',$13 : dw Default_Text_End
; @END@

.txt_chief_not_released:
; @DEFAULT_TEXTBOX@
; "\x0F" "In dem Bild kann man "
; "den Bürgermeister er-"
; "kennen.\x8Cscheint, als "
; "wäre er traurig." -> Default_Text_End
db $10
db $0F,'I','n',' ',$BB,'B','i','l','d',' ',$D7,'m','a','n',' ',$0D
db $B7,'B','ü','r','g','e','r','m','e','i','s','t','e','r',' ','e','r','-',$0D
db 'k','e','n','n','e','n','.',$8C,'s','c','h','e','i','n','t',',',' ',$AF,$0D
db 'w','ä','r','e',' ',$C8,'t','r','a','u','r','i','g','.',$13 : dw Default_Text_End
; @END@

.txt_boss_defeated:
; @DEFAULT_TEXTBOX@
; "\x0F" "Das Bild ist wieder "
; "normal geworden." -> Default_Text_End
db $10
db $0F,$8A,'B','i','l','d',' ',$D2,$F4,$0D
db 'n','o','r','m','a','l',' ','g','e','w','o','r','d','e','n','.',$13 : dw Default_Text_End
; @END@

.txt_painter_talk_chief_released:
; @DEFAULT_TEXTBOX@
; "Das Gesicht des "
; "Bürgermeisters ist "
; "wieder verschwunden."
; "Was war das ?!" -> Default_Text_End
db $10
db $8A,'G','e','s','i','c','h','t',' ',$B8,$0D
db 'B','ü','r','g','e','r','m','e','i','s','t','e','r','s',' ',$D2,$0D
db $F4,'v','e','r','s','c','h','w','u','n','d','e','n','.',$0D
db 'W','a','s',' ',$FC,$B9,'?','!',$13 : dw Default_Text_End
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
db $0E,$3C
db $83,'h','ö','r','s','t',' ',$B7,'S','c','h','r','e','i',' ',$0D
db $C5,'M','a','n','n','e','s',' ',$AD,$BB,$0D
db 'H','a','u','s','.',$11
db 'A','A','A','A','A','H','H','H',' ','!','!',$0D
db 'E','I','N',' ','G','E','I','S','T',' ','!',' ','E','I','N',' ','G','E','I','S','T','!',$13 : dw Default_Text_End
; @END@