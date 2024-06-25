Script_A7_DistortFacesBackground:
    PHX
    LDX.W #0

.copy_loop:
    LDA.W #$A0 ; no clue what this is
    STA.L DATA_7E7800, X
    LDA.W #DATA_CA7900
    STA.L DATA_7E7800 + 1, X
    INX #3
    CPX.W #$15
    BNE .copy_loop
    
    LDA.W #0
    STA.L DATA_7E7800, X
    PLX
    %CopSetScriptAddrToNextInstruction()
    PHX
    DEC.W _038A
    INC.W _038C
    LDA.W _0312
    LSR #2
    CLC
    ADC.W bg2_vofs
    AND.W #$1F
    ASL
    TAX
    LDY.W #0
    ; they can't agree on an order, can they? They mixed the SEP and PHB
    ; %SwitchToBankWithSRep($7E)
    SEP #$20
    PHB
    %SwitchToBank($7E)
    REP #$20
    
.second_copy_loop:
    LDA.L .data, X
    CLC
    ADC.W bg2_vofs
    STA.W DATA_7E7900, Y
    INX #2
    INY #2
    CPY.W #datasize(Script_A7_DistortFacesBackground_data) / 2
    BNE .second_copy_loop

    PLB
    SEP #$20
    LDA.B #$10
    XBA
    LDA.B #<:(DATA_7E7800)
    LDY.W #DATA_7E7800
    JSL CODE_C29873
    REP #$20
    PLX
    RTL

.data:
    dw +00, +01, +02, +02, +03, +03, +04, +04, +04, +04, +04, +03, +03, +02, +02, +01
    dw -00, -01, -02, -02, -03, -03, -04, -04, -04, -04, -04, -03, -03, -02, -02, -01
    dw +00, +01, +02, +02, +03, +03, +04, +04, +04, +04, +04, +03, +03, +02, +02, +01
    dw -00, -01, -02, -02, -03, -03, -04, -04, -04, -04, -04, -03, -03, -02, -02, -01
