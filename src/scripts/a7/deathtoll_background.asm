Script_A7_DeathtollBackground:
    PHX
    LDX.W #$0
    LDA.W #$6
    STA.L DATA_7E7800 + $0, X
    LDA.W #$8
    STA.L DATA_7E7800 + $3, X
    LDA.W #$A
    STA.L DATA_7E7800 + $6, X
    LDA.W #$6
    STA.L DATA_7E7800 + $9, X
    LDA.W #$9
    STA.L DATA_7E7800 + $C, X
    LDA.W #$10
    STA.L DATA_7E7800 + $F, X
    LDA.W #$10
    STA.L DATA_7E7800 + $12, X
    LDA.W #$10
    STA.L DATA_7E7800 + $15, X
    LDA.W #$11
    STA.L DATA_7E7800 + $18, X
    LDA.W #$18
    STA.L DATA_7E7800 + $1B, X
    LDA.W #$20
    STA.L DATA_7E7800 + $1E, X
    LDA.W #$10
    STA.L DATA_7E7800 + $21, X
    LDA.W #$0
    STA.L DATA_7E7800 + $24, X
    PLX
    %CopSetScriptAddrToNextInstruction()

    PHX
    LDA.W _0312
    ASL #3
    STA.B 0
    TAY
    LDX.W #0

.copy_loop:
    XBA
    STA.L DATA_7E7800 + 1, X
    XBA
    PHA
    TYA
    SEP #$20
    STA.W M7A
    XBA
    STA.W M7A
    LDA.L DATA_7E7800, X
    STA.W M7B
    STA.W M7B
    REP #$20
    PLA
    CLC
    ADC.W MPYL
    INX #3
    CPX.W #$24
    BNE .copy_loop

    SEP #$20
    LDA.B #$F
    XBA
    LDA.B #<:(DATA_7E7800)
    LDY.W #DATA_7E7800
    JSL CODE_C2988F
    REP #$20
    PLX
    RTL