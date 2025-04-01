EnterPlayerName:
    PHP
    PHX
    PHY
    SEP #$20

    STZ.W $044D
    STZ.W $044F
    LDX.W #number_of_choies
    LDY.W #player_name

.find_null:
    LDA.W 0, Y      ; load first character of name
    BEQ .enter_loop ; and check if it's null (so an empty string)
    INY             ; if not, increment Y
    BRA .find_null  ; until we found a null byte

.enter_loop:
    %PlaySound(Sound.MenuBeep)

.loop_wo_beep:
    PHX
    PHY
    LDY.W #txt_enter_player_name
    JSL.L printOsdStringFromBank2
    LDY.W #txt_enter_player_name_alphabet
    JSL.L printOsdStringFromBank2
    PLY
    PLX
    LDA.B #'+'
    STA.L L3_Text, X
    STA.L L3_Text-!Row_Width, X

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
    LDA.W player_name_dialog_y
    ; is it zero? Wrap top to bottom
    BEQ ..wrap_around
    DEC.W player_name_dialog_y
    CMP.B #$02
    BEQ ..skip_first_gap
    CMP.B #$04
    BNE ..skip_second_gap

..skip_first_gap:
    REP #$20
    TXA
    SEC
    SBC.W #!Row_Width
    TAX

..skip_second_gap:
    REP #$20
    TXA
    SEC
    SBC.W #!Row_Width * 2
    TAX
    SEP #$20
    BRL .enter_loop

..wrap_around:
    LDA.B #$04
    STA.W player_name_dialog_y
    REP #$20
    TXA
    CLC
    ADC.W #!Row_Width * 10
    TAX
    SEP #$20
    BRL .enter_loop

.pressed_down:
    LDA.W player_name_dialog_y
    CMP.B #$04
    BCS   ..wrap_around
    INC.W player_name_dialog_y
    CMP.B #$01
    BEQ ..skip_first_gap
    CMP.B #$03
    BNE ..skip_second_gap

..skip_first_gap:
    REP #$20
    TXA
    CLC
    ADC.W #!Row_Width
    TAX

..skip_second_gap:
    REP #$20
    TXA
    CLC
    ADC.W #!Row_Width * 2
    TAX
    SEP #$20
    BRL .enter_loop

..wrap_around:
    STZ.W player_name_dialog_y
    REP #$20
    TXA
    SEC
    SBC.W #!Row_Width * 10
    TAX
    SEP #$20
    BRL .enter_loop

.pressed_left:
    LDA.W player_name_dialog_x
    BEQ ..wrap_around
    DEC.W player_name_dialog_x
    DEX #4
    BRL .enter_loop

..wrap_around:
    LDA.B #$0C
    STA player_name_dialog_x
    REP #$20
    TXA
    CLC
    ADC.W #$0C * 4
    TAX
    SEP #$20
    BRL .enter_loop

.pressed_right:
    LDA.W player_name_dialog_x
    ; did we exceed the line length of 12?
    CMP.B #$0C
    BCS ..wrap_around
    INC.W player_name_dialog_x
    INX #4
    BRL .enter_loop

..wrap_around:
    STZ.W player_name_dialog_x
    REP #$20
    TXA
    SEC
    SBC.W #$0C * 4
    TAX
    SEP #$20
    BRL .enter_loop

;; Y is for deleting the last char
.pressed_y:
    ; check if we have any chars to delete
    ; by comparing if Y is equal to the player_name pointer
    ; if yes, we can't delete any chars and return to the loop
    CPY.W #player_name
    BNE + : BRL .key_loop : +
    ; delete the last char
    ; just decrement y and add a terminating 0 byte
    DEY
    LDA.B #0
    STA.W 0, Y
    BRL .enter_loop

.pressed_b:
    LDA.L L3_Text+2, X
    ; enter key
    CMP.B #$23
    BEQ .pressed_start
    ; backspace key
    CMP.B #$24
    BEQ .pressed_y
    CPY.W #player_name+8
    BCC + : BRL .key_loop : +
    LDA.L L3_Text+2, X
    STA.W 0, Y
    INY
    %PlaySound(Sound.DialogConfirm)
    BRL .loop_wo_beep

.pressed_start:
    CPY.W #player_name
    ; check if we have entered at least one char
    BNE + : BRL .key_loop : +
    ; add terminating zero byte
    LDA.B #$00
    STA.W 0, Y
    LDY.W #txt_clear_enter_player_name_box
    JSL.L printOsdStringFromBank2
    JSR.W advance_frame_and_read_lower_buttons
    PLY
    PLX
    PLP
    RTL