A1_script_snitch_tulip:
    %CopJumpIfSealed(!Lair_A1_SnitchTulip, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
.anim_loop:
    %CopPlayAnimation(Animation.VillageTulipLeftRight)
    %Cop82()
    BRA .anim_loop

.talk:
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Vergewissere Dich,"
; "unter allen Tulpen "
; "nachzuschauen." WFE
; "Es könnte sein, daß "
; "einer der Jungen,"
; "etwas darunter ver-"
; "steckt hat." WFE
; "Er hat gedacht,daß ihn "
; "niemand gesehen hat,"
; "aber ich habe ihn be-"
; "obachtet!" -> Default_Text_End
db $10
db 'V','e','r','g','e','w','i','s','s','e','r','e',' ','D','i','c','h',',',$0D
db 'u','n','t','e','r',' ','a','l','l','e','n',' ','T','u','l','p','e','n',' ',$0D
db 'n','a','c','h','z','u','s','c','h','a','u','e','n','.',$11
db $8C,'k','ö','n','n','t','e',' ','s','e','i','n',',',' ',$BA,$0D
db $C6,$B6,'J','u','n','g','e','n',',',$0D
db $C2,'d','a','r','u','n','t','e','r',' ','v','e','r','-',$0D
db 's','t','e','c','k','t',' ','h','a','t','.',$11
db 'E','r',' ',$CF,'g','e','d','a','c','h','t',',',$BA,'i','h','n',' ',$0D
db 'n','i','e','m','a','n','d',' ','g','e','s','e','h','e','n',' ','h','a','t',',',$0D
db $AB,$D1,$CC,'i','h','n',' ','b','e','-',$0D
db 'o','b','a','c','h','t','e','t','!',$13 : dw Default_Text_End
; @END@
