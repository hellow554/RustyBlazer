; A8 I16
LairRevealHook:
    LDA $0456 ; lair_remaining
    BEQ .end
    DEC $0456
    INC LairsCleared
    LDA.b #$20
    TSB $0332

.end
    JML.l LairRevealHookReturn
