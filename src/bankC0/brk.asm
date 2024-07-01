BRK_Func:
    REP #$20
    PHA
    LDA.B $04, S                ; load address form interrupt return address
    DEC A
    STA.B SoundId.address_word
    SEP #$20
    LDA.B $06, S                ; load bank from interrupt return address
    STA.B SoundId.address_bank
    LDA.B [SoundId.address]     ; do a 24-bit read, so we get the brk operator
    BIT.B #$40                  ; ? maybe left and right channel ?
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
