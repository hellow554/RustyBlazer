A1_script_dreaming_tulip:
    %CopJumpIfSealed(!Lair_A1_Sleeping_Tulip, +) : RTL : +
    %CopAssignTalkCallback(.first_talk)
    %CopMakeNpcUnpassable()

.anim_loop:
    %CopPlayAnimation(!Anim_Village_Tulip_Left_Right)
    %Cop82()
    BRL .anim_loop

.release_jewel:
    %CopAC(CODE_C3BBB6, $70, $80, $50)
    %PlaySound(!Sound_ReleaseCreature)
    BRL .anim_loop

.first_talk:
    %CopShowText(.text_first)
    %CopAssignTalkCallback(.second_talk)
    %Cop27(.release_jewel)

.second_talk:
    %CopShowText(.text_second)
    RTL
.text_first:
; @DEFAULT_TEXTBOX@
; "In meinen Träumen kann "
; "ich alles tun was ich "
; "will...." WFE
; "HA!" -> Default_Text_End
db $10
db 'I','n',' ','m','e','i','n','e','n',' ','T','r','ä','u','m','e','n',' ',$D7,$0D
db $D1,'a','l','l','e','s',' ','t','u','n',' ',$F9,$D1,$0D
db 'w','i','l','l','.','.','.','.',$11
db 'H','A','!',$13 : dw Default_Text_End
; @END@

.text_second:
; @DEFAULT_TEXTBOX@
; "Warum versuchst Du"
; "nicht mal mit dem "
; "Juwel zu sprechen ?" -> Default_Text_End
db $10
db 'W','a','r','u','m',' ','v','e','r','s','u','c','h','s','t',' ','D','u',$0D
db $DF,'m','a','l',' ',$DA,$BB,$0D
db 'J','u','w','e','l',' ',$FD,'s','p','r','e','c','h','e','n',' ','?',$13 : dw Default_Text_End
; @END@