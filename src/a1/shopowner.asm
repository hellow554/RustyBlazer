A1_script_ShopOwner:
    %CopJumpIfSealed(!Lair_A1_Shop_Owner, +) : RTL : +
    %CopAssignTalkCallback(.talk)

.move_loop
    %CopSetScriptAddrToNextInstruction()
    %Cop20(.inside)
    %CopJumpDependingOnPlayerXProximity(0, .too_left, .inside, .too_right)

.too_left:
    %Cop23(.left_jump)
    %Cop97()
    %Cop9D($0B)
    %Cop9E(.left_jump)

.left_jump:
    %CopPlayAnimation($06)
    %Cop82()
    BRL .inside

.too_right:
    %Cop24(.right_jump)
    %Cop96()
    %Cop9D($0B)
    %Cop9E(.right_jump)
.right_jump:
    %CopPlayAnimation($06)
    %Cop82()

.inside:
    %Cop27(.move_loop)

.talk:
    %CopJumpIfItemNotObtained(!MedicalHerb, .no_herbs)
    %CopShowText(.text_has_herbs)
    RTL
.no_herbs:
    %CopShowText(.text_no_herbs)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!MedicalHerb)
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
db $48,$61,$6C,$6C,$6F,$2C,$20,$D7,$D1,$84,$0D
db $77,$65,$69,$74,$65,$72,$68,$65,$6C,$66,$65,$6E,$20,$3F,$11
db $4E,$69,$6D,$6D,$20,$F9,$83,$62,$72,$61,$75,$63,$68,$73,$74,$20,$0D
db $AD,$DD,$4C,$61,$64,$65,$6E,$2E,$11
db $8F,$CC,$AB,$6C,$65,$69,$64,$65,$72,$20,$0D
db $E1,$48,$65,$69,$6C,$6B,$72,$7B,$75,$74,$65,$72,$2E,$11
db $02,$02,$20,$C1,$0D
db $03,$24,$BE,$E4,$48,$65,$69,$6C,$6B,$72,$7B,$75,$74,$65,$72,$2E,$03,$20,$13 : dw Default_Text_End
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
db $48,$61,$6C,$6C,$6F,$2C,$20,$D7,$D1,$84,$0D
db $77,$65,$69,$74,$65,$72,$68,$65,$6C,$66,$65,$6E,$20,$3F,$11
db $4F,$68,$2C,$20,$83,$B4,$64,$65,$72,$6A,$65,$6E,$69,$67,$65,$2C,$0D
db $B6,$D9,$62,$65,$66,$72,$65,$69,$74,$20,$68,$61,$74,$2E,$11
db $57,$61,$6E,$6E,$20,$D4,$83,$BC,$0D
db $8E,$61,$75,$66,$67,$65,$2D,$0D
db $62,$72,$61,$75,$63,$68,$74,$20,$68,$61,$73,$74,$2C,$20,$F2,$0D
db $D1,$84,$6E,$65,$75,$65,$20,$67,$65,$62,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@

ShopOwnerTurnRight:
    %Cop96()
    %CopPlayAnimation($08)
    %Cop82()
    BRL ShopOwnerTurnRight
