BRK_Func:
    REP #$20
    PHA
    LDA.B $04, S
    DEC A
    STA.B SoundId.addr
    SEP #$20
    LDA.B $06, S
    STA.B SoundId.bank
    LDA.B [SoundId.addr]
    BIT.B #$40
    BNE +
    STA.W $0398
    BRA .end

+
    AND.B #$BF
    STA.W $0399

.end:
    REP #$20
    PLA
    RTI
