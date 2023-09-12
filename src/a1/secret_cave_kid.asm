A1_script_secret_cave_kid:
    %CopJumpIfSealed(!Lair_A1_SecretCaveKid, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk_in_entry)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEventFlagIsUnset(!EV_A1_SecretCaveKidTalk, .kid_blocks_path)
    %CopTeleportEntityTo($14, $2C, $13)
    %CopMakeNpcUnpassable()
    BRL .kid_ouf_of_way

.kid_blocks_path:
    %CopMakeNpcUnpassable()
    %CopWaitForEventFlagToBeSet(!EV_A1_SecretCaveKid_ShowedPass)
    %CopAssignTalkCallback(.talk_wait_for_clearance)
    %CopSetScriptAddrToNextInstruction()
    %Cop0C(!Entity_Player, $02, +)
    BRL .moving_out_of_way
+
    RTL

.moving_out_of_way:
    %CopMakeNpcPassable()
    %CopPlayAnimation(!Anim_Village_Kid_Walking_Down)
    %Cop82()
    %CopPlayAnimation(!Anim_Village_Kid_Walking_Left)
    %Cop82()
    %Cop87()
    %CopPlayAnimation(!Anim_Village_Kid_Facing_Left)
    %Cop82()
    %CopMakeNpcUnpassable()
    %CopSetEventFlag(!EV_A1_SecretCaveKidTalk)

.kid_ouf_of_way:
    %CopAssignTalkCallback(.talk_out_of_way)
    %CopSetScriptAddrToNextInstruction()
    
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $28, $0B, +) : RTL : +
    %CopJumpIfEventFlagIsUnset(!EV_A1_SecretPassageBottlePickedUp, +) : RTL : +
    %CopShowText(.text_bottle)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!StrangeBottle)
    %CopSetEventFlag(!EV_A1_SecretPassageBottlePickedUp)
    RTL

.talk_in_entry:
    %CopJumpIfItemIsNotEquipped(!APass, ..no_pass)
    %CopSetEventFlag(!EV_A1_SecretCaveKid_ShowedPass)
    %CopShowText(.text_show_pass)
    %CopRemoveItem(!APass)
    RTL
..no_pass:
    %CopShowText(.text_no_pass)
    RTL

.talk_wait_for_clearance:
    %CopShowText(.text_wait_clearance)
    RTL

.talk_out_of_way:
    %CopShowText(.text_entry_cleared)
    RTL

.text_no_pass:
; @DEFAULT_TEXTBOX@
; "Dies ist unser "
; "Geheimgang. Ohne Paß "
; "kann ich Dich hier "
; "nicht durchlassen." -> Default_Text_End
db $10
db $89,$D2,$75,$6E,$73,$65,$72,$20,$0D
db $47,$65,$68,$65,$69,$6D,$67,$61,$6E,$67,$2E,$20,$4F,$68,$6E,$65,$20,$50,$61,$25,$20,$0D
db $D7,$D1,$85,$CE,$0D
db $DF,$64,$75,$72,$63,$68,$6C,$61,$73,$73,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@

.text_show_pass:
; @DEFAULT_TEXTBOX@
; "Oh, der Paß! Wo hast "
; "Du ihn gefunden?"
; "Du kannst jetzt durch." -> Default_Text_End
db $10
db $4F,$68,$2C,$20,$B6,$50,$61,$25,$21,$20,$57,$6F,$20,$CD,$0D
db $83,$69,$68,$6E,$20,$67,$65,$66,$75,$6E,$64,$65,$6E,$3F,$0D
db $83,$6B,$61,$6E,$6E,$73,$74,$20,$D6,$64,$75,$72,$63,$68,$2E,$13 : dw Default_Text_End
; @END@

.text_wait_clearance:
; @DEFAULT_TEXTBOX@
; "Würdest Du etwas zur "
; "Seite gehen, damit "
; "ich Dich durchlassen "
; "kann?" -> Default_Text_End
db $10
db $57,$5B,$72,$64,$65,$73,$74,$20,$83,$C2,$7A,$75,$72,$20,$0D
db $53,$65,$69,$74,$65,$20,$67,$65,$68,$65,$6E,$2C,$20,$64,$61,$6D,$69,$74,$20,$0D
db $D1,$85,$64,$75,$72,$63,$68,$6C,$61,$73,$73,$65,$6E,$20,$0D
db $6B,$61,$6E,$6E,$3F,$13 : dw Default_Text_End
; @END@

.text_bottle:
; @DEFAULT_TEXTBOX@
; "Da ist " *"eine seltsame "
; "Flasche"* "." -> Default_Text_End
db $10
db $44,$61,$20,$D2,$03,$24,$BF,$73,$65,$6C,$74,$73,$61,$6D,$65,$20,$0D
db $46,$6C,$61,$73,$63,$68,$65,$03,$20,$2E,$13 : dw Default_Text_End
; @END@

.text_entry_cleared:
; @DEFAULT_TEXTBOX@
; "Ich bin es leid, immer "
; "nur Versteck zu spie-"
; "len. Ich muß mal etwas "
; "anderes spielen." -> Default_Text_End
db $10
db $8F,$B1,$C3,$6C,$65,$69,$64,$2C,$20,$D4,$0D
db $E1,$56,$65,$72,$73,$74,$65,$63,$6B,$20,$FD,$73,$70,$69,$65,$2D,$0D
db $6C,$65,$6E,$2E,$20,$8F,$6D,$75,$25,$20,$6D,$61,$6C,$20,$C2,$0D
db $61,$6E,$64,$65,$72,$65,$73,$20,$73,$70,$69,$65,$6C,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@
