; A8 I16
MapChangePostHook:
; this is mostly a copy of $2957E

    LDX.w #0
    TXY
    STZ LairsCleared
    STZ LairsTotal

.loop:
    LDA $81BA0D, X
    CMP #$FF
    BEQ .out
    LDA $81BA0D+$B, X
    CMP $1C6A ; current map number
    BNE .next
    INC LairsTotal

    PHX
    TYX
    LDA $7F0203, X
    BPL + : INC LairsCleared : +
    PLX

.next:
    REP #$20
    TXA
    CLC
    ADC.w #$20
    TAX
    INY
    SEP #$20
    BRA .loop

.out:
    JSL.l $008127 ; privous overwritten call
    LDA.b #$20
    TSB $0332

    RTL

