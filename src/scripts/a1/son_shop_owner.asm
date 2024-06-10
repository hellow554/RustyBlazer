A1_script_son_shop_owner:
    %Cop3B($16, .next)
    %CopAssignTalkCallback(SomeTalk)
    SEP #$20
    LDA.B #$80
    PHA
    REP #$20
    LDA.W #CODE_C0B097-1 ; -1 because we use it in RTL and it increases that by one again
    PHA
    RTL
.next:
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.default_talk)

.walk_loop:
    %CopSetScriptAddrToNextInstruction()
    %Cop20(.stand_inside)
    %CopJumpDependingOnPlayerXProximity(0, .too_left, .stand_inside, .too_right)

.too_left:
    %Cop23(..xxx)
    %CopResetSpriteVertically()
    %Cop9D($11)
    %Cop9E(..xxx)
..xxx:
    %CopPlayAnimation(!Anim_Village_Kid_Facing_Down)
    %Cop82()
    BRL .stand_inside

.too_right:
    %Cop24(..xxx)
    %CopFlipSpriteVertically()
    %Cop9D($11)
    %Cop9E(..xxx)
..xxx:
    %CopPlayAnimation(!Anim_Village_Kid_Facing_Down)
    %Cop82()

.stand_inside:
    %Cop27(.walk_loop)

.default_talk:
    %CopJumpIfItemNotObtained(!GoatsFood, .has_not_food)
    %CopShowText(.txt_has_food)
    RTL

.has_not_food:
    %CopShowText(.txt_no_food)
    %CopShowMenu(choice_yes_no, 2, +) : +
    %CopSetEntityScriptAddr(!Entity_ShopOwner, ShopOwnerTurnRight)
    %CopShowText(.txt_scream)
    %CopSetEntityScriptAddr(!Entity_ShopOwner, A1_script_ShopOwner)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!GoatsFood)
    RTL

.txt_no_food:
; @DEFAULT_TEXTBOX@
; "Ich helfe meiner "
; "Mutter. Möchtest Du "
; "vielleicht etwas "
; "Ziegenfutter kaufen?" WFE
; "Möchtest Du wissen "
; "wieviel es kostet ?" WFE
; "Nun........"
; WAIT 30
; "Wie wäre es mit einer "
; "Million Mark, zzgl."
; "Steuern ?!" CONT
db $10
db $8F,'h','e','l','f','e',' ',$DE,$0D
db 'M','u','t','t','e','r','.',' ',$96,$83,$0D
db $F0,$C2,$0D
db 'Z','i','e','g','e','n','f','u','t','t','e','r',' ','k','a','u','f','e','n','?',$11
db $96,$83,'w','i','s','s','e','n',' ',$0D
db 'w','i','e','v','i','e','l',' ',$C3,'k','o','s','t','e','t',' ','?',$11
db 'N','u','n','.','.','.','.','.','.','.','.',$0D
db $0E,$1E
db 'W','i','e',' ','w','ä','r','e',' ',$C3,$DA,$C6,$0D
db 'M','i','l','l','i','o','n',' ','M','a','r','k',',',' ','z','z','g','l','.',$0D
db 'S','t','e','u','e','r','n',' ','?','!',$0C
; @END@


.txt_scream:
; @DEFAULT_TEXTBOX@
; "TEDDY!!"
; "Es tut mir leid. Ich "
; "werde es Dir umsonst "
; "geben." WFE
; PLAYER_NAME " erhielt "
; *"eine Tüte Ziegenfutter "* -> Default_Text_End
db $10
db 'T','E','D','D','Y','!','!',$0D
db $8C,'t','u','t',' ',$DB,'l','e','i','d','.',' ',$8F,$0D
db $F2,$C3,$84,'u','m','s','o','n','s','t',' ',$0D
db 'g','e','b','e','n','.',$11
db $02,$02,' ',$C1,$0D
db $03,$24,$BF,'T','ü','t','e',' ','Z','i','e','g','e','n','f','u','t','t','e','r',' ',$03,$20,$13 : dw Default_Text_End
; @END@

.txt_has_food:
; @DEFAULT_TEXTBOX@
; "Oh, Du brauchst nicht "
; "so viele Tüten Ziegen-"
; "futter." WFE
; "Komm` wieder, wenn Du "
; "diese aufgebraucht "
; "hast,dann gebe ich Dir "
; "eine Neue." -> Default_Text_End
db $10
db 'O','h',',',' ',$83,'b','r','a','u','c','h','s','t',' ',$DF,$0D
db $E9,$EF,'T','ü','t','e','n',' ','Z','i','e','g','e','n','-',$0D
db 'f','u','t','t','e','r','.',$11
db 'K','o','m','m','`',' ','w','i','e','d','e','r',',',' ',$F3,$83,$0D
db $BC,'a','u','f','g','e','b','r','a','u','c','h','t',' ',$0D
db 'h','a','s','t',',','d','a','n','n',' ','g','e','b','e',' ',$D1,$84,$0D
db $BF,'N','e','u','e','.',$13 : dw Default_Text_End
; @END@
