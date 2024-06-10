A1_script_mill_keeper:
    %CopJumpIfSealed(!Lair_A1_Mill_Keeper, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Mill_Keeper, .revealing)
    %CopJumpIfEventFlagIsSet(!EV_A1_WatermillwheelRotated, .already_turned)
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk_confirm_turn)

    %CopWaitForEventFlagToBeSet(!EV_A1_WatermillKeeperFirstTalk)
; -- wait for him to be talked too
; -- this is the walking sequence --
    %CopMakeNpcPassable()
    LDA.W #!Key16_A|!Key16_Select|!Key16_All_Directions
    TSB.W button_mask
    %CopFlipSpriteVertically()
    %Cop9D($05)
    %Cop9E(+)

+
    %Cop9D($04)
    %Cop9E(+)
+
    %CopPlayAnimation(!Anim_Village_Man_Facing_Down)
    %Cop82()
    LDA.W #!Key16_A|!Key16_Select|!Key16_All_Directions
    TRB.W button_mask
    %CopMakeNpcUnpassable()

.wait_for_player_to_stand_in_front_of_wheel:
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $26, $17, .player_in_front_of_wheel)
    RTL

.player_in_front_of_wheel:
    LDA.W #!Key16_A|!Key16_Select|!Key16_All_Directions
    TSB.W button_mask
    LDY $039E
    LDA.W #$1
    STA.W $1E, Y
    %CopLoopStart(3) : %CopLoopEnd()
    LDA.W #!Key16_A|!Key16_Select|!Key16_All_Directions
    TRB.W button_mask
    %CopShowText(.text_ask_to_turn)
    %CopShowMenu(choice_yes_no, 2, .said_no)
    LDA.L choice_idx
    BNE .said_no
    %CopShowText(.text_said_yes)
    %PlaySound(!Sound_WheelStartSpinning)
    %CopSetEventFlag(!EV_A1_WatermillwheelRotated)

.after_turn:
    %CopAssignTalkCallback(.talk_after_turn)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $2F, $32, .spawn_emblem_a)
    RTL

.said_no:
    %CopShowText(Default_Text_End+1)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $26, $17, +)
    BRA .wait_for_player_to_stand_in_front_of_wheel
+
    RTL

.already_turned:
    %CopTeleportEntityTo(!Entity_MillKeeper, $27, $17)
    %CopMakeNpcUnpassable()
    %CopPlayAnimation(!Anim_Village_Man_Facing_Down)
    %Cop82()
    BRA .after_turn

.spawn_emblem_a:
    %CopJumpIfEventFlagIsSet(!EV_A1_PickedEmblemAUp, .already_picked_up)
    %CopShowText(.text_emblem_a)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!EmblemA)
    %CopSetEventFlag(!EV_A1_PickedEmblemAUp)

.already_picked_up:
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk_confirm_turn:
    %CopShowText(.text_confirm_turn)
    %CopSetEventFlag(!EV_A1_WatermillKeeperFirstTalk)
    RTL

.talk_after_turn:
    %CopShowText(.text_after_turn)
    RTL

.revealing:
    %CopShowText(.text_revealing)
    %Cop86()
    RTL

.text_confirm_turn:
; @DEFAULT_TEXTBOX@
; "Wenn Du dieses Rad "
; "drehst, wird sich der "
; "Aufzug im unterirdi-"
; "schen Schloß bewegen." WFE
; "Ich bin zu schwach,\xEC"
; "das Rad zu drehen."
; "Kannst Du es mal ver-"
; "suchen ?" -> Default_Text_End
db $10
db $A8,$83,'d','i','e','s','e','s',' ','R','a','d',' ',$0D
db 'd','r','e','h','s','t',',',' ',$F7,$E5,$B6,$0D
db 'A','u','f','z','u','g',' ',$D5,'u','n','t','e','r','i','r','d','i','-',$0D
db 's','c','h','e','n',' ',$9E,'b','e','w','e','g','e','n','.',$11
db $8F,$B1,$FD,'s','c','h','w','a','c','h',',',$EC,$0D
db $B9,'R','a','d',' ',$FD,'d','r','e','h','e','n','.',$0D
db 'K','a','n','n','s','t',' ',$83,$C3,'m','a','l',' ','v','e','r','-',$0D
db 's','u','c','h','e','n',' ','?',$13 : dw Default_Text_End
; @END@

.text_after_turn:
; @DEFAULT_TEXTBOX@
; "Oh, kein Wunder daß es "
; "nicht ging. Ich habe "
; "es in die falsche "
; "Richtung gedreht." WFE
; "Übrigens, findest Du "
; "diese Mühle nicht auch "
; "großartig ?" -> Default_Text_End
db $10
db 'O','h',',',' ','k','e','i','n',' ','W','u','n','d','e','r',' ',$BA,$C3,$0D
db $DF,'g','i','n','g','.',' ',$8F,$CC,$0D
db $C3,$D3,$B5,'f','a','l','s','c','h','e',' ',$0D
db 'R','i','c','h','t','u','n','g',' ','g','e','d','r','e','h','t','.',$11
db 'Ü','b','r','i','g','e','n','s',',',' ','f','i','n','d','e','s','t',' ',$83,$0D
db $BC,'M','ü','h','l','e',' ',$DF,$B0,$0D
db 'g','r','o','ß','a','r','t','i','g',' ','?',$13 : dw Default_Text_End
; @END@


.text_revealing:
; @DEFAULT_TEXTBOX@
; WAIT 60
; "Die Stimme eines "
; "Mannes kam aus "
; "dem Innern der "
; "Mühle heraus." WFE
; "MIST!" WFE
; "Dieses blöde Rad!"
; "Es ist so schwer es "
; "zu drehen!" -> Default_Text_End
db $10
db $0E,$3C
db $87,$A0,$C5,$0D
db 'M','a','n','n','e','s',' ','k','a','m',' ',$AD,$0D
db $BB,'I','n','n','e','r','n',' ',$B6,$0D
db 'M','ü','h','l','e',' ','h','e','r','a','u','s','.',$11
db 'M','I','S','T','!',$11
db 'D','i','e','s','e','s',' ','b','l','ö','d','e',' ','R','a','d','!',$0D
db $8C,$D2,$E9,'s','c','h','w','e','r',' ',$C3,$0D
db $FD,'d','r','e','h','e','n','!',$13 : dw Default_Text_End
; @END@

.text_ask_to_turn:
; @DEFAULT_TEXTBOX@
; "Dies ist das Rad."
; "Kannst Du einmal ver-"
; "suchen es zu drehen ?" CONT
db $10
db $89,$D2,$B9,'R','a','d','.',$0D
db 'K','a','n','n','s','t',' ',$83,$C4,'v','e','r','-',$0D
db 's','u','c','h','e','n',' ',$C3,$FD,'d','r','e','h','e','n',' ','?',$0C
; @END@

.text_said_yes:
; @NEW_TEXT@
; PLAYER_NAME " hat am "
; "Rad gedreht." WFE
; "Als sich das Rad ge-"
; "dreht hat, wurde das "
; "unterirdische Schloß "
; "mit Strom versorgt." -> Default_Text_End
db $02,$02,' ',$CF,'a','m',' ',$0D
db 'R','a','d',' ','g','e','d','r','e','h','t','.',$11
db 'A','l','s',' ',$E5,$B9,'R','a','d',' ','g','e','-',$0D
db 'd','r','e','h','t',' ','h','a','t',',',' ',$F8,$B9,$0D
db 'u','n','t','e','r','i','r','d','i','s','c','h','e',' ',$9E,$0D
db $DA,'S','t','r','o','m',' ','v','e','r','s','o','r','g','t','.',$13 : dw Default_Text_End
; @END@

.text_emblem_a:
; @DEFAULT_TEXTBOX@
; "Dies ist " *"das Emblem A "
; "des Meisters"* "." -> Default_Text_End
db $10
db $89,$D2,$03,$24,$B9,'E','m','b','l','e','m',' ','A',' ',$0D
db $B8,'M','e','i','s','t','e','r','s',$03,$20,'.',$13 : dw Default_Text_End
; @END@
