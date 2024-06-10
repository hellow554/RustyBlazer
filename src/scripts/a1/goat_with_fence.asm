A1_script_GoatWithFence:
    %CopJumpIfSealed(!Lair_A1_Goat_With_Fence, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAC(.herbs_on_the_ground, 0, $10, $2000)
    %CopAssignTalkCallback(.talk)

.loop:
    %Cop81($1B, $02)
    %Cop83()
    %CopMakeNpcUnpassable()
    %Cop81($24, $04)
    %Cop83()
    %CopMakeNpcPassable()
    %Cop87()
    BRL .loop

.herbs_on_the_ground:
    %CopJumpIfEventFlagIsSet(!EV_A1_FoundHerbsOnTheGround, .herbs_found)
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $34, $2C, .find_herbs)
    RTL
.find_herbs:
    %CopShowText(.text_hk)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!MedicalHerb)
    %CopSetEventFlag(!EV_A1_FoundHerbsOnTheGround)
.herbs_found:
    COP #$86
    RTL

.talk:
    %CopJumpIfSealed(!Lair_A1_Chief, +)
    %CopShowText(.text_default)
    RTL
+
    %CopShowText(.text_after_lisa)
    RTL

.text_default:
; @DEFAULT_TEXTBOX@
; "Ich frage mich, warum "
; "die Menschen in so "
; "kleinen Häusern "
; "wohnen." WFE
; "Hälst Du es für "
; "möglich, daß der "
; "Bürgermeister in eines " WFE
; "der Gemälde in dem "
; "Haus oben auf "
; "dem Hügel "
; "hineingezogen wurde ?" -> Default_Text_End
db $10
db $8F,'f','r','a','g','e',' ','m','i','c','h',',',' ','w','a','r','u','m',' ',$0D
db $B5,$97,$D3,$E9,$0D
db 'k','l','e','i','n','e','n',' ','H','ä','u','s','e','r','n',' ',$0D
db 'w','o','h','n','e','n','.',$11
db 'H','ä','l','s','t',' ',$83,$C3,$C9,$0D
db 'm','ö','g','l','i','c','h',',',' ',$BA,$B6,$0D
db 'B','ü','r','g','e','r','m','e','i','s','t','e','r',' ',$D3,$C5,$11
db $B6,'G','e','m','ä','l','d','e',' ',$D3,$BB,$0D
db 'H','a','u','s',' ','o','b','e','n',' ',$AC,$0D
db $BB,'H','ü','g','e','l',' ',$0D
db 'h','i','n','e','i','n','g','e','z','o','g','e','n',' ',$F8,'?',$13 : dw Default_Text_End
; @END@

.text_after_lisa:
; @DEFAULT_TEXTBOX@
; "Ich frage mich, warum "
; "die Menschen in so "
; "kleinen Häusern "
; "wohnen." WFE
; "Hälst Du es für mög-"
; "lich, daß der Bürger-"
; "meister von den Toten "
; "zurückgekehrt ist ?" -> Default_Text_End
db $10
db $8F,'f','r','a','g','e',' ','m','i','c','h',',',' ','w','a','r','u','m',' ',$0D
db $B5,$97,$D3,$E9,$0D
db 'k','l','e','i','n','e','n',' ','H','ä','u','s','e','r','n',' ',$0D
db 'w','o','h','n','e','n','.',$11
db 'H','ä','l','s','t',' ',$83,$C3,$C9,'m','ö','g','-',$0D
db 'l','i','c','h',',',' ',$BA,$B6,'B','ü','r','g','e','r','-',$0D
db 'm','e','i','s','t','e','r',' ',$EE,$B7,'T','o','t','e','n',' ',$0D
db 'z','u','r','ü','c','k','g','e','k','e','h','r','t',' ',$D2,'?',$13 : dw Default_Text_End
; @END@

.text_hk:
; @DEFAULT_TEXTBOX@
; "Da sind " *"Heilkräuter \n"*
; "am Rande des Zaunes." -> Default_Text_End
db $10
db 'D','a',' ',$E7,$03,$24,$8E,$0D,$03,$20
db 'a','m',' ','R','a','n','d','e',' ',$B8,'Z','a','u','n','e','s','.',$13 : dw Default_Text_End
; @END@
