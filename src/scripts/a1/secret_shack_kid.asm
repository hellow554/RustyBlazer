A1_script_secret_shack_kid:
    %CopJumpIfSealed(!Lair_A1_SecretShackKid, +) : RTL : +
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk_in_entry)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $38, $3A, +) : RTL : +

    %CopJumpIfEventFlagIsSet(!EV_A1_Found_APass, .already_talked)
    %CopShowText(.text_default)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfSealed(!Lair_A1_Sleeping_Tulip, +) : RTL : +

    %CopJumpIfEntityHasReachedXY(!Entity_Player, $3C, $37, +) : RTL : +

    %CopRemoveTalkCallback()
    %CopMakeNpcPassable()
    %CopPlayAnimation(!Anim_Village_Kid_Walking_Down)
    %Cop82()
    %Cop9D($0F)
    %Cop9E(+) : +

    %CopPlayAnimation(!Anim_Village_Kid_Walking_Left)
    %Cop82()
    %Cop9D($11)
    %Cop9E(+) : +

    %Cop81($10, $02)
    %Cop83()
    %Cop9D($10)
    %Cop9E(+) : +

    %Cop81($11, $03)
    %Cop83()
    %Cop9D($10)
    %Cop9E(+) : +

    %CopResetSpriteVertically()
    %CopPlayAnimation(!Anim_Village_Kid_Facing_Left)
    %Cop82()
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk_out_of_way)
    %CopSetScriptAddrToNextInstruction()
    %Cop0C(!Entity_Player, $02, +) : RTL : +

    %CopFlipSpriteVertically()
    %CopPlayAnimation(!Anim_Village_Kid_Facing_Down)
    %Cop82()
    %CopShowText(.text_followed)
    %CopSetScriptAddrToNextInstruction()
    RTL

.already_talked:
    %CopAssignTalkCallback(.talk_need_pass)
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk_in_entry:
    %CopShowText(.text_hint)
    %CopSetEventFlag(!EV_A1_Hideout_Kid_Hint_Given)
    RTL

.talk_out_of_way:
    %CopShowText(.text_followed)
    RTL

.talk_need_pass:
    %CopJumpIfItemNotObtained(!APass, ..no_pass)
    %CopShowText(.text_found_pass)
    RTL
..no_pass:
    %CopShowText(.text_presented_pass)
    RTL

.text_default:
; @DEFAULT_TEXTBOX@
; "Oh, Du hast mich er-"
; "schreckt !" -> Default_Text_End
db $10
db 'O','h',',',' ',$83,$CD,$D9,'e','r','-',$0D
db 's','c','h','r','e','c','k','t',' ','!',$13 : dw Default_Text_End
; @END@

.text_hint:
; @DEFAULT_TEXTBOX@
; "Dies ist unsere ge-"
; "heime Hütte. Wir haben "
; "unseren Schatz hier "
; "in der Nähe versteckt." -> Default_Text_End
db $10
db $89,$D2,'u','n','s','e','r','e',' ','g','e','-',$0D
db 'h','e','i','m','e',' ','H','ü','t','t','e','.',' ',$AA,$D0,$0D
db 'u','n','s','e','r','e','n',' ','S','c','h','a','t','z',' ',$CE,$0D
db $D3,$B6,'N','ä','h','e',' ','v','e','r','s','t','e','c','k','t','.',$13 : dw Default_Text_End
; @END@

.text_followed:
; @DEFAULT_TEXTBOX@
; "Bist Du mir gefolgt ?"
; "Ich werde Dir nicht "
; "sagen wo unser Schatz "
; "ist." -> Default_Text_End
db $10
db 'B','i','s','t',' ',$83,$DB,'g','e','f','o','l','g','t',' ','?',$0D
db $8F,$F2,$84,$DF,$0D
db 's','a','g','e','n',' ','w','o',' ','u','n','s','e','r',' ','S','c','h','a','t','z',' ',$0D
db 'i','s','t','.',$13 : dw Default_Text_End
; @END@

.text_found_pass:
; @DEFAULT_TEXTBOX@
; "Oh! Das ist mein Paß!"
; "Nun gut, ich werde ihn "
; "Dir geben." -> Default_Text_End
db $10
db 'O','h','!',' ',$8A,$D2,'m','e','i','n',' ','P','a','ß','!',$0D
db 'N','u','n',' ','g','u','t',',',' ',$D1,$F2,'i','h','n',' ',$0D
db $84,'g','e','b','e','n','.',$13 : dw Default_Text_End
; @END@

.text_presented_pass:
; @DEFAULT_TEXTBOX@
; "Hat Dir der Pass ge-"
; "holfen ?" -> Default_Text_End
db $10
db 'H','a','t',' ',$84,$B6,'P','a','s','s',' ','g','e','-',$0D
db 'h','o','l','f','e','n',' ','?',$13 : dw Default_Text_End
; @END@
