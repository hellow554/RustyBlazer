A1_script_son_shop_owner:
    %Cop3B($16, .next)
    %CopAssignTalkCallback(SomeTalk)
    SEP #$20
    LDA.B #$80
    PHA
    REP #$20
    LDA.W #CODE_C0B096
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
    %Cop97()
    %Cop9D($11)
    %Cop9E(..xxx)
..xxx:
    %Cop80($0C)
    %Cop82()
    BRL .stand_inside

.too_right:
    %Cop24(..xxx)
    %Cop96()
    %Cop9D($11)
    %Cop9E(..xxx)
..xxx:
    %Cop80($0C)
    %Cop82()

.stand_inside:
    %Cop27(.walk_loop)

.default_talk:
    %CopJumpIfItemNotObtained(!GoatsFood, .has_not_food)
    %CopShowText(.txt_has_food)
    RTL

.has_not_food:
    %CopShowText(.txt_no_food)
    %CopShowMenu(choice_yes_no, 2, +)
+
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
db $8F,$68,$65,$6C,$66,$65,$20,$DE,$0D
db $4D,$75,$74,$74,$65,$72,$2E,$20,$96,$83,$0D
db $F0,$C2,$0D
db $5A,$69,$65,$67,$65,$6E,$66,$75,$74,$74,$65,$72,$20,$6B,$61,$75,$66,$65,$6E,$3F,$11
db $96,$83,$77,$69,$73,$73,$65,$6E,$20,$0D
db $77,$69,$65,$76,$69,$65,$6C,$20,$C3,$6B,$6F,$73,$74,$65,$74,$20,$3F,$11
db $4E,$75,$6E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$0D
db $0E,30
db $57,$69,$65,$20,$77,$7B,$72,$65,$20,$C3,$DA,$C6,$0D
db $4D,$69,$6C,$6C,$69,$6F,$6E,$20,$4D,$61,$72,$6B,$2C,$20,$7A,$7A,$67,$6C,$2E,$0D
db $53,$74,$65,$75,$65,$72,$6E,$20,$3F,$21,$0C
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
db $54,$45,$44,$44,$59,$21,$21,$0D
db $8C,$74,$75,$74,$20,$DB,$6C,$65,$69,$64,$2E,$20,$8F,$0D
db $F2,$C3,$84,$75,$6D,$73,$6F,$6E,$73,$74,$20,$0D
db $67,$65,$62,$65,$6E,$2E,$11
db $02,$02,$20,$C1,$0D
db $03,$24,$BF,$54,$5B,$74,$65,$20,$5A,$69,$65,$67,$65,$6E,$66,$75,$74,$74,$65,$72,$20,$03,$20,$13 : dw Default_Text_End
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
db $4F,$68,$2C,$20,$83,$62,$72,$61,$75,$63,$68,$73,$74,$20,$DF,$0D
db $E9,$EF,$54,$5B,$74,$65,$6E,$20,$5A,$69,$65,$67,$65,$6E,$2D,$0D
db $66,$75,$74,$74,$65,$72,$2E,$11
db $4B,$6F,$6D,$6D,$60,$20,$77,$69,$65,$64,$65,$72,$2C,$20,$F3,$83,$0D
db $BC,$61,$75,$66,$67,$65,$62,$72,$61,$75,$63,$68,$74,$20,$0D
db $68,$61,$73,$74,$2C,$64,$61,$6E,$6E,$20,$67,$65,$62,$65,$20,$D1,$84,$0D
db $BF,$4E,$65,$75,$65,$2E,$13 : dw Default_Text_End
; @END@
