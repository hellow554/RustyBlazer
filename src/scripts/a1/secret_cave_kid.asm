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
db $89,$D2,'u','n','s','e','r',' ',$0D
db 'G','e','h','e','i','m','g','a','n','g','.',' ','O','h','n','e',' ','P','a','ß',' ',$0D
db $D7,$D1,$85,$CE,$0D
db $DF,'d','u','r','c','h','l','a','s','s','e','n','.',$13 : dw Default_Text_End
; @END@

.text_show_pass:
; @DEFAULT_TEXTBOX@
; "Oh, der Paß! Wo hast "
; "Du ihn gefunden?"
; "Du kannst jetzt durch." -> Default_Text_End
db $10
db 'O','h',',',' ',$B6,'P','a','ß','!',' ','W','o',' ',$CD,$0D
db $83,'i','h','n',' ','g','e','f','u','n','d','e','n','?',$0D
db $83,'k','a','n','n','s','t',' ',$D6,'d','u','r','c','h','.',$13 : dw Default_Text_End
; @END@

.text_wait_clearance:
; @DEFAULT_TEXTBOX@
; "Würdest Du etwas zur "
; "Seite gehen, damit "
; "ich Dich durchlassen "
; "kann?" -> Default_Text_End
db $10
db 'W','ü','r','d','e','s','t',' ',$83,$C2,'z','u','r',' ',$0D
db 'S','e','i','t','e',' ','g','e','h','e','n',',',' ','d','a','m','i','t',' ',$0D
db $D1,$85,'d','u','r','c','h','l','a','s','s','e','n',' ',$0D
db 'k','a','n','n','?',$13 : dw Default_Text_End
; @END@

.text_bottle:
; @DEFAULT_TEXTBOX@
; "Da ist " *"eine seltsame "
; "Flasche"* "." -> Default_Text_End
db $10
db 'D','a',' ',$D2,$03,$24,$BF,'s','e','l','t','s','a','m','e',' ',$0D
db 'F','l','a','s','c','h','e',$03,$20,'.',$13 : dw Default_Text_End
; @END@

.text_entry_cleared:
; @DEFAULT_TEXTBOX@
; "Ich bin es leid, immer "
; "nur Versteck zu spie-"
; "len. Ich muß mal etwas "
; "anderes spielen." -> Default_Text_End
db $10
db $8F,$B1,$C3,'l','e','i','d',',',' ',$D4,$0D
db $E1,'V','e','r','s','t','e','c','k',' ',$FD,'s','p','i','e','-',$0D
db 'l','e','n','.',' ',$8F,'m','u','ß',' ','m','a','l',' ',$C2,$0D
db 'a','n','d','e','r','e','s',' ','s','p','i','e','l','e','n','.',$13 : dw Default_Text_End
; @END@
