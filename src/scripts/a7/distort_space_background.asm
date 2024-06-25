Script_A7_DistortSpaceBackground:
; setup for the script
    PHX
    LDX.W #0
.copy_loop
    LDA.W #bankCx(DATA_C07900)
    STA.L DATA_7E7800, X
    LDA.W #DATA_C07900
    STA.L DATA_7E7800 + 1, X
    INX #3
    CPX.W #$C
    BNE .copy_loop

    LDA.W #0
    STA.L DATA_7E7800, X
    PLX
    %CopSetScriptAddrToNextInstruction()
; here starts the "real" script
    LDA.W bg1_hofs
    LSR
    STA.B $16
    LDA.W bg1_vofs
    LSR
    STA.B $18
    PHX
    LDA.W _0312
    LSR
    LSR
    CLC
    ADC.B $18
    AND.W #$3F
    ASL
    TAX
    LDY.W #0
    PHB
    %SwitchToBankWithSRep($7E)

.second_copy_loop:
    LDA.L .data, X
    CLC
    ADC.B $16
    STA.W DATA_7E7900, Y
    INX #2
    INY #2
    CPY.W #(datasize(Script_A7_DistortSpaceBackground_data) / 2)
    BNE .second_copy_loop

    PLB
    SEP #$20
    LDA #$F
    XBA
    LDA.B #<:(DATA_7E7800)
    LDY.W #DATA_7E7800
    JSL.L CODE_C29873
    REP #$20
    PLX
    RTL

; probably!
; For every screen line (256) there's one offset that is going to be used.
; not sure why it waves, but it does
.data
    dw +00, +03, +06, +09, +12, +15, +18, +20, +23, +25, +27, +28, +30, +31, +31, +32
    dw +32, +32, +31, +31, +30, +28, +27, +25, +23, +20, +18, +15, +12, +09, +06, +03
    dw -00, -03, -06, -09, -12, -15, -18, -20, -23, -25, -27, -28, -30, -31, -31, -32
    dw -32, -32, -31, -31, -30, -28, -27, -25, -23, -20, -18, -15, -12, -09, -06, -03
    dw +00, +03, +06, +09, +12, +15, +18, +20, +23, +25, +27, +28, +30, +31, +31, +32
    dw +32, +32, +31, +31, +30, +28, +27, +25, +23, +20, +18, +15, +12, +09, +06, +03
    dw -00, -03, -06, -09, -12, -15, -18, -20, -23, -25, -27, -28, -30, -31, -31, -32
    dw -32, -32, -31, -31, -30, -28, -27, -25, -23, -20, -18, -15, -12, -09, -06, -03
