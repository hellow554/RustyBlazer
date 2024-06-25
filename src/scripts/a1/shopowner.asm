A1_script_ShopOwner:
    %CopJumpIfSealed(!Lair_A1_Shop_Owner, +) : RTL : +
    %CopAssignTalkCallback(.talk)

.move_loop
    %CopSetScriptAddrToNextInstruction()
    %Cop20(.inside)
    %CopJumpDependingOnPlayerXProximity(0, .too_left, .inside, .too_right)

.too_left:
    %Cop23(.left_jump)
    %CopResetSpriteVertically()
    %Cop9D($0B)
    %Cop9E(.left_jump)

.left_jump:
    %CopPlayAnimation(Animation.VillageWomanFacingDown)
    %Cop82()
    BRL .inside

.too_right:
    %Cop24(.right_jump)
    %CopFlipSpriteVertically()
    %Cop9D($0B)
    %Cop9E(.right_jump)
.right_jump:
    %CopPlayAnimation(Animation.VillageWomanFacingDown)
    %Cop82()

.inside:
    %Cop27(.move_loop)

.talk:
    %CopJumpIfItemNotObtained(Items.MedicalHerb, .no_herbs)
    %CopShowText(.text_has_herbs)
    RTL
.no_herbs:
    %CopShowText(.text_no_herbs)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(Items.MedicalHerb)
    RTL

.text_no_herbs:
; @DEFAULT_TEXTBOX@
; "Hallo, kann ich Dir "
; "weiterhelfen ?" WFE
; "Nimm was Du brauchst "
; "aus meinem Laden." WFE
; "Ich habe aber leider "
; "nur Heilkräuter." WFE
; PLAYER_NAME " erhielt "
; *"ein paar Heilkräuter."* -> Default_Text_End
db $10
db 'H','a','l','l','o',',',' ',$D7,$D1,$84,$0D
db 'w','e','i','t','e','r','h','e','l','f','e','n',' ','?',$11
db 'N','i','m','m',' ',$F9,$83,'b','r','a','u','c','h','s','t',' ',$0D
db $AD,$DD,'L','a','d','e','n','.',$11
db $8F,$CC,$AB,'l','e','i','d','e','r',' ',$0D
db $E1,'H','e','i','l','k','r','ä','u','t','e','r','.',$11
db $02,$02,' ',$C1,$0D
db $03,$24,$BE,$E4,'H','e','i','l','k','r','ä','u','t','e','r','.',$03,$20,$13 : dw Default_Text_End
; @END@

.text_has_herbs:
; @DEFAULT_TEXTBOX@
; "Hallo, kann ich Dir "
; "weiterhelfen ?" WFE
; "Oh, Du bist derjenige,"
; "der mich befreit hat." WFE
; "Wann immer Du diese "
; "Heilkräuter aufge-"
; "braucht hast, werde "
; "ich Dir neue geben." -> Default_Text_End
db $10
db 'H','a','l','l','o',',',' ',$D7,$D1,$84,$0D
db 'w','e','i','t','e','r','h','e','l','f','e','n',' ','?',$11
db 'O','h',',',' ',$83,$B4,'d','e','r','j','e','n','i','g','e',',',$0D
db $B6,$D9,'b','e','f','r','e','i','t',' ','h','a','t','.',$11
db 'W','a','n','n',' ',$D4,$83,$BC,$0D
db $8E,'a','u','f','g','e','-',$0D
db 'b','r','a','u','c','h','t',' ','h','a','s','t',',',' ',$F2,$0D
db $D1,$84,'n','e','u','e',' ','g','e','b','e','n','.',$13 : dw Default_Text_End
; @END@

ShopOwnerTurnRight:
    %CopFlipSpriteVertically()
    %CopPlayAnimation(Animation.VillageWomanFacingLeft)
    %Cop82()
    BRL ShopOwnerTurnRight
