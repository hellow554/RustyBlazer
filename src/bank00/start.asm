
Start:
    SEI
    CLD
    CLC
    XCE
    REP #$30
    LDA.W #$0000
    TCD
    LDA.W #$1FFF
    TCS

    SEP #$20
    LDA.B #$01
    PHA
    PLB
    JSL.L init_system
    JSL.L init_window_system
    JSL.L CODE_04F912
    JSL.L clearL3
    LDX.W #$000C
    STX.W zwSceneId
    JSL.L enable_interrupts
    JSL.L checkMapChange
