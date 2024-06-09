A4_script_unreleased_soul:
    %Cop1F()
    LDA.W _0302
    AND.W #3
    BEQ .two
    DEC
    BEQ .three
    .one:   %CopShowText(.txt_one) : RTL
    .two:   %CopShowText(.txt_two) : RTL
    .three: %CopShowText(.txt_three) : RTL

.txt_one:
; @DEFAULT_TEXTBOX@
; "Aua.... es tut weh!"
; "Hilft mir denn nie-"
; "mand!" -> ACT4_CLEARBOX
db $10
db $41,$75,$61,$2E,$2E,$2E,$2E,$20,$C3,$74,$75,$74,$20,$77,$65,$68,$21,$0D
db $48,$69,$6C,$66,$74,$20,$DB,$64,$65,$6E,$6E,$20,$6E,$69,$65,$2D,$0D
db $6D,$61,$6E,$64,$21,$13 : dw ACT4_CLEARBOX
; @END@

.txt_two:
; @DEFAULT_TEXTBOX@
; "Ich möchte wieder so "
; "wie früher aussehen !" -> ACT4_CLEARBOX
db $10
db $8F,$6D,$2A,$63,$68,$74,$65,$20,$F4,$E9,$0D
db $F6,$66,$72,$5B,$68,$65,$72,$20,$61,$75,$73,$73,$65,$68,$65,$6E,$20,$21,$13 : dw ACT4_CLEARBOX
; @END@

.txt_three:
; @DEFAULT_TEXTBOX@
; "Oh...." -> ACT4_CLEARBOX
db $10
db $4F,$68,$2E,$2E,$2E,$2E,$13 : dw ACT4_CLEARBOX
; @END@
