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
    %CopLoop(3)
    %CopLoopEnd()
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
db $A8,$83,$64,$69,$65,$73,$65,$73,$20,$52,$61,$64,$20,$0D
db $64,$72,$65,$68,$73,$74,$2C,$20,$F7,$E5,$B6,$0D
db $41,$75,$66,$7A,$75,$67,$20,$D5,$75,$6E,$74,$65,$72,$69,$72,$64,$69,$2D,$0D
db $73,$63,$68,$65,$6E,$20,$9E,$62,$65,$77,$65,$67,$65,$6E,$2E,$11
db $8F,$B1,$FD,$73,$63,$68,$77,$61,$63,$68,$2C,$EC,$0D
db $B9,$52,$61,$64,$20,$FD,$64,$72,$65,$68,$65,$6E,$2E,$0D
db $4B,$61,$6E,$6E,$73,$74,$20,$83,$C3,$6D,$61,$6C,$20,$76,$65,$72,$2D,$0D
db $73,$75,$63,$68,$65,$6E,$20,$3F,$13 : dw Default_Text_End
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
db $4F,$68,$2C,$20,$6B,$65,$69,$6E,$20,$57,$75,$6E,$64,$65,$72,$20,$BA,$C3,$0D
db $DF,$67,$69,$6E,$67,$2E,$20,$8F,$CC,$0D
db $C3,$D3,$B5,$66,$61,$6C,$73,$63,$68,$65,$20,$0D
db $52,$69,$63,$68,$74,$75,$6E,$67,$20,$67,$65,$64,$72,$65,$68,$74,$2E,$11
db $28,$62,$72,$69,$67,$65,$6E,$73,$2C,$20,$66,$69,$6E,$64,$65,$73,$74,$20,$83,$0D
db $BC,$4D,$5B,$68,$6C,$65,$20,$DF,$B0,$0D
db $67,$72,$6F,$25,$61,$72,$74,$69,$67,$20,$3F,$13 : dw Default_Text_End
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
db $0E,60
db $87,$A0,$C5,$0D
db $4D,$61,$6E,$6E,$65,$73,$20,$6B,$61,$6D,$20,$AD,$0D
db $BB,$49,$6E,$6E,$65,$72,$6E,$20,$B6,$0D
db $4D,$5B,$68,$6C,$65,$20,$68,$65,$72,$61,$75,$73,$2E,$11
db $4D,$49,$53,$54,$21,$11
db $44,$69,$65,$73,$65,$73,$20,$62,$6C,$2A,$64,$65,$20,$52,$61,$64,$21,$0D
db $8C,$D2,$E9,$73,$63,$68,$77,$65,$72,$20,$C3,$0D
db $FD,$64,$72,$65,$68,$65,$6E,$21,$13 : dw Default_Text_End
; @END@

.text_ask_to_turn:
; @DEFAULT_TEXTBOX@
; "Dies ist das Rad."
; "Kannst Du einmal ver-"
; "suchen es zu drehen ?" CONT
db $10
db $89,$D2,$B9,$52,$61,$64,$2E,$0D
db $4B,$61,$6E,$6E,$73,$74,$20,$83,$C4,$76,$65,$72,$2D,$0D
db $73,$75,$63,$68,$65,$6E,$20,$C3,$FD,$64,$72,$65,$68,$65,$6E,$20,$3F,$0C
; @END@

.text_said_yes:
; @NEW_TEXT@
; PLAYER_NAME " hat am "
; "Rad gedreht." WFE
; "Als sich das Rad ge-"
; "dreht hat, wurde das "
; "unterirdische Schloß "
; "mit Strom versorgt." -> Default_Text_End
db $02,$02,$20,$CF,$61,$6D,$20,$0D
db $52,$61,$64,$20,$67,$65,$64,$72,$65,$68,$74,$2E,$11
db $41,$6C,$73,$20,$E5,$B9,$52,$61,$64,$20,$67,$65,$2D,$0D
db $64,$72,$65,$68,$74,$20,$68,$61,$74,$2C,$20,$F8,$B9,$0D
db $75,$6E,$74,$65,$72,$69,$72,$64,$69,$73,$63,$68,$65,$20,$9E,$0D
db $DA,$53,$74,$72,$6F,$6D,$20,$76,$65,$72,$73,$6F,$72,$67,$74,$2E,$13 : dw Default_Text_End
; @END@

.text_emblem_a:
; @DEFAULT_TEXTBOX@
; "Dies ist " *"das Emblem A "
; "des Meisters"* "." -> Default_Text_End
db $10
db $89,$D2,$03,$24,$B9,$45,$6D,$62,$6C,$65,$6D,$20,$41,$20,$0D
db $B8,$4D,$65,$69,$73,$74,$65,$72,$73,$03,$20,$2E,$13 : dw Default_Text_End
; @END@
