!ADDR = $7EBCE0
!VALUE = !ADDR+1

TEXT_XXX:
; @NEW_TEXT@
; SETPOS $84 $01
; DRAWBOX $1A $13
; SETPOS $08 $03
; "  COP : "
; SETPOS $18 $03
; PLAYER_NAME
; CURSIVE
; SETPOS $58 $03
; "--"
db $01,$84,$01
db $07,$1A,$13
db $01,$08,$03
db ' ',' ','C','O','P',' ',':',' ',$0D
db $01,$18,$03
db $02,$02
db $09
db $01,$58,$03
db '-','-',$0D
db $00
; @ENDSTRING@

unta:
    LSR #4
    ; fallthrough
lnta:
    PHP
    REP #$20
    AND.W #$F
    TAX
    SEP #$20
    LDA.L .hex_string, X
    PLP
    RTS
.hex_string:
    db "0123456789ABCDEF"

EnterPlayerName:
    PHP
    PHX
    PHY
    SEP #$20
    LDA.B #0
    STA.L !ADDR     ; BRK
    STA.L !VALUE ; #00
    LDA.B #$6B      ; RTL
    STA.L !ADDR + 2

.enter_loop:
    LDA.L !VALUE
    JSR.W unta
    STA.W player_name
    LDA.L !VALUE
    JSR.W lnta
    STA.W player_name + 1

    LDY.W #TEXT_XXX
    JSL.L printOsdStringFromBank2


.wait_key_release:
    JSR.W advance_frame_and_read_lower_buttons
    CMP.B #$00
    BNE .wait_key_release

.key_loop:
    JSR.W advance_frame_and_read_lower_buttons
    LSR A
    BCC + : BRL .pressed_right : +
    LSR A
    BCC + : BRL .pressed_left : +
    LSR A
    BCC + : BRL .pressed_down : +
    LSR A
    BCC + : BRL .pressed_up : +
    LSR A
    BCC + : BRL .pressed_start : +
    LSR A
    LSR A
    BCC + : BRL .pressed_y : +
    LSR A
    BCC + : BRL .pressed_b : +
    BRA .key_loop

.pressed_up:
    LDA.L !VALUE
    CLC
    ADC.B #1
    STA.L !VALUE
    BRL .enter_loop

.pressed_down:
    LDA.L !VALUE
    SEC
    SBC.B #1
    STA.L !VALUE
    BRL .enter_loop

.pressed_left:
.pressed_right:
    BRL .enter_loop

.pressed_y:
    BRL .enter_loop

.pressed_b:
    BRL .enter_loop


.pressed_start:
    JSL.L !ADDR
    BRL .enter_loop

padbyte $EA
pad $C2A65D
RTL
assert pc() == $82A65E, hex(pc())
