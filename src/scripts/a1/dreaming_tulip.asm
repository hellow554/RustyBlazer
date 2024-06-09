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
db $49,$6E,$20,$6D,$65,$69,$6E,$65,$6E,$20,$54,$72,$7B,$75,$6D,$65,$6E,$20,$D7,$0D
db $D1,$61,$6C,$6C,$65,$73,$20,$74,$75,$6E,$20,$F9,$D1,$0D
db $77,$69,$6C,$6C,$2E,$2E,$2E,$2E,$11
db $48,$41,$21,$13 : dw Default_Text_End
; @END@

.text_second:
; @DEFAULT_TEXTBOX@
; "Warum versuchst Du"
; "nicht mal mit dem "
; "Juwel zu sprechen ?" -> Default_Text_End
db $10
db $57,$61,$72,$75,$6D,$20,$76,$65,$72,$73,$75,$63,$68,$73,$74,$20,$44,$75,$0D
db $DF,$6D,$61,$6C,$20,$DA,$BB,$0D
db $4A,$75,$77,$65,$6C,$20,$FD,$73,$70,$72,$65,$63,$68,$65,$6E,$20,$3F,$13 : dw Default_Text_End
; @END@
