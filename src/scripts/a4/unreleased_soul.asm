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
db 'A','u','a','.','.','.','.',' ',$C3,'t','u','t',' ','w','e','h','!',$0D
db 'H','i','l','f','t',' ',$DB,'d','e','n','n',' ','n','i','e','-',$0D
db 'm','a','n','d','!',$13 : dw ACT4_CLEARBOX
; @END@

.txt_two:
; @DEFAULT_TEXTBOX@
; "Ich möchte wieder so "
; "wie früher aussehen !" -> ACT4_CLEARBOX
db $10
db $8F,'m','ö','c','h','t','e',' ',$F4,$E9,$0D
db $F6,'f','r','ü','h','e','r',' ','a','u','s','s','e','h','e','n',' ','!',$13 : dw ACT4_CLEARBOX
; @END@

.txt_three:
; @DEFAULT_TEXTBOX@
; "Oh...." -> ACT4_CLEARBOX
db $10
db 'O','h','.','.','.','.',$13 : dw ACT4_CLEARBOX
; @END@