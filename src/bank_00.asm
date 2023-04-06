
ORG $008000

incsrc "bank00/start.asm"

main_loop:
    JSL.L wait_vblank
    JSL.L checkMapChange
    LDA.W currentMapNumber
    SEC
    SBC.B #$10
    CMP.B #$03
    BCC CODE_00808F
    LDA.W lairRevealInProgress
    BNE lairReveal
    JSL.L checkButtons
    JSL.L checkForStartPress
    JSL.L disable_vblank_interrupt
    JSL.L CODE_0289D6
    JSL.L zPrepareDmaBank0
    JSL.L CODE_0085A6
    JSL.L CODE_0085C4
    JSL.L CODE_008A34
    JSL.L CODE_008DF4
    JSL.L checkPlayerDead
    JSL.L CODE_028069
    JSL.L CODE_02810B
    JSL.L CODE_0086EE
    JSL.L UpdateHud
    JSL.L CODE_029695
    JSL.L CODE_04F223
    JSL.L enable_interrupts
    BRA main_loop


CODE_00808F:
    JSL.L disable_vblank_interrupt
    JSL.L zPrepareDmaBank0
    JSL.L CODE_0085A6
    JSL.L CODE_0085C4
    JSL.L CODE_0086EE
    JSL.L enable_interrupts
    BRL main_loop


lairReveal:
    JSL.L disable_vblank_interrupt
    JSL.L CODE_028EA9
    JSL.L zPrepareDmaBank0
    STZ.W $0323
    JSL.L CODE_0085A6
    JSL.L CODE_0085C4
    JSL.L CODE_0086EE
    JSL.L UpdateHud
    JSL.L CODE_029695
    JSL.L CODE_04F223
    JSL.L enable_interrupts
    JSL.L wait_vblank
    JSL.L disable_vblank_interrupt

CODE_0080DD:
    JSL.L zAdvanceFrameDoThings
    LDX.W lairRevealInProgress
    BMI CODE_0080DD
    STZ.W lairRevealInProgress
    STZ.W $03FC
    LDA.W playerMaxHealth
    LSR A
    LSR A
    LSR A
    CLC
    ADC.W bPlayerHealthRestore
    STA.W bPlayerHealthRestore
    LDA.B #$78
    JSL.L CODE_02B140
    LDA.B #$80
    STA.W $03E3
    LDA.W $03FD
    STA.W $0319
    LDA.W $03FF
    STA.W zwSceneId
    REP #$20
    LDA.W $0401
    STA.W $037C
    LDA.W $0403
    STA.W $037E
    SEP #$20
    JSL.L enable_interrupts
    BRL main_loop


CODE_008127:
    PHB
    PHA
    XBA
    PHA
    PHX
    PHY
    JSL.L disable_vblank_interrupt
    INC.W $03A6
    JSL.L zPrepareDmaBank0
    JSL.L CODE_0085A6
    JSL.L CODE_0085C4
    JSL.L CODE_028000
    JSL.L CODE_028069
    JSL.L CODE_02810B
    JSL.L CODE_0086EE
    LDA.W $0462
    BNE CODE_00815D
    JSL.L UpdateHud
    JSL.L CODE_029695

CODE_00815D:
    JSL.L CODE_04F223
    STZ.W $03A6
    JSL.L enable_interrupts
    JSL.L wait_vblank
    PLY
    PLX
    PLA
    XBA
    PLA
    PLB
    RTL


CODE_008173:
    PHB
    PHA
    XBA
    PHA
    PHX
    PHY
    LDA.B #$01
    PHA
    PLB
    INC.W $03A6
    JSL.L zPrepareDmaBank0
    JSL.L CODE_0085A6
    JSL.L CODE_0085C4
    JSL.L CODE_028069
    JSL.L CODE_02810B
    JSL.L CODE_0086EE
    JSL.L UpdateHud
    JSL.L CODE_029695
    JSL.L CODE_04F223
    JSL.L CODE_028EEA
    JSL.L enable_interrupts
    JSL.L wait_vblank
    JSL.L disable_vblank_interrupt
    STZ.W $03A6
    PLY
    PLX
    PLA
    XBA
    PLA
    PLB
    RTL


zAdvanceFrameDoThings:
    PHB
    PHA
    XBA
    PHA
    PHX
    PHY
    LDA.B #$01
    PHA
    PLB
    INC.W $03A6
    JSL.L zPrepareDmaBank0
    JSL.L CODE_0085A6
    JSL.L CODE_0085C4
    JSL.L CODE_028069
    JSL.L CODE_02810B
    JSL.L CODE_0086EE
    JSL.L UpdateHud
    JSL.L CODE_029695
    JSL.L CODE_04F223
    JSL.L enable_interrupts
    JSL.L wait_vblank
    JSL.L disable_vblank_interrupt
    STZ.W $03A6
    PLY
    PLX
    PLA
    XBA
    PLA
    PLB
    RTL

CODE_808205:
    LDA.W JOY2H
    BIT.B #$20
    BEQ .loc_808210
    JSR.W CODE_00822B
    RTS

.loc_808210:
    LDA.W JOY2H
    BIT.B #$80
    BEQ .loc_808223
    LDA.B #$1E

.loc_808219:
    PHA
    JSL.L wait_vblank
    PLA
    DEC
    BNE .loc_808219
    RTS

.loc_808223:
    BIT.B #$40
    BEQ .locret_80822A
    JSR.W CODE_808271

.locret_80822A:
    RTS

CODE_00822B:
    LDA.B #$0
    JSR CODE_808240
    LDA.B #$3
    JSR CODE_808240
    LDA.B #$4
    JSR CODE_808240
    LDA.B #$1F
    JSR CODE_808240
    RTS

CODE_808240:
    PHB
    PHA
    PLB
    LDX #$8000

.loop:
    LDA.W $0000, X
    CMP.B #$2
    BNE .loc_80826C
    LDA $0001, X
    CMP.B #$1
    BNE .loc_80826C
    LDA.W $0002, X
    CMP.B #$AA
    BNE .loc_80826C
    LDY.W $0003, X
    BPL .loc_80826C
    PHX
    LDX.W #$40A
    STX.W textPointerRestore
    JSL.L printOsdStringFromBankX
    PLX

.loc_80826C:
    INX
    BNE .loop
    PLB
    RTS

CODE_808271:
    LDA.W mapNumber
    JSR.W CODE_8082FC
    STA.W $1F06
    LDA.W mapNumber
    JSR.W CODE_808300
    STA.W $1F07
    LDA.W mapSubNumber
    JSR.W CODE_8082FC
    STA.W $1F09
    LDA.W mapSubNumber
    JSR.W CODE_808300
    STA.W $1F0A
    LDA.W currentMapNumber
    JSR.W CODE_8082FC
    STA.W $1F0C
    LDA.W currentMapNumber
    JSR.W CODE_808300
    STA.W $1F0D
    LDA.W player_pos_x_int
    JSR.W CODE_8082FC
    STA.W $1F0F
    LDA.W player_pos_x_int
    JSR.W CODE_808300
    STA.W $1F10
    LDA.W player_pos_x_real
    JSR.W CODE_808300
    STA.W $1F12
    LDA.W player_pos_y_int
    JSR.W CODE_8082FC
    STA.W $1F14
    LDA.W player_pos_y_int
    JSR.W CODE_808300
    STA.W $1F15
    LDA.W player_pos_y_real
    JSR.W CODE_808300
    STA.W $1F17
    LDA.W $1F00
    JSR.W CODE_8082FC
    STA.W $1F19
    LDA.W $1F00
    JSR.W CODE_808300
    STA.W $1F1A
    LDY.W #$1F02
    JSL.L printOsdStringFromBank2
    LDA.B #1
    STA.W $03B8
    RTS

CODE_8082FC:
    LSR
    LSR
    LSR
    LSR
;fallthrough
CODE_808300:
    REP #$20
    AND.W #$F
    TAX
    LDA.L .upper_hex_chars, X
    SEP #$20
    RTS

.upper_hex_chars:
    db "0123456789ABCDEF"

CODE_80831D:
    LDA.W $0484
    BNE .loc_808323
    RTS
.loc_808323:
    AND.B #$F0
    LSR
    LSR
    LSR
    LSR
    XBA
    LDA.B #$0A
    JSL.L multiply
    PHA
    LDA $0484
    AND #$0F
    CLC
    ADC 1, S
    JSL.L giveItem
    PLA
    STZ $0484
    RTS

Native_mode_NMI:
    PHP
    PHB
    REP #$30
    PHA
    PHX
    PHY
    SEP #$20
    REP #$10
    CLD
    LDA.B #$01
    PHA
    PLB
    STZ.W $420C
    JSR.W transferSprites
    JSR.W CODE_0083EA
    JSR.W CODE_008421
    JSR.W CODE_00846E
    JSR.W CODE_0084C8
    JSR.W CODE_0084E5
    JSR.W CODE_008543
    JSR.W CODE_00858B
    JSL.L CODE_00EB7F

wait_for_joypad_readout:
    LDA.W $4212
    ROR A
    BCS wait_for_joypad_readout
    LDA.B $42
    STA.W $420C
    REP #$30
    INC.W $0312
    LDA.W $0468
    BNE CODE_0083AA
    LDA.W $4218
    XBA
    LSR A
    AND.W #$2000
    ORA.W $4218
    PHA
    LDA.W wButtonMask
    EOR.W #$FFFF
    AND.B $01,S
    STA.W wButtonsPressed
    PLA
    EOR.W #$FFFF
    ORA.W zwSomethingWithButtons
    STA.W zwSomethingWithButtons
    AND.W wButtonsPressed

CODE_0083AA:
    STA.W wButtonsPressed
    LDA.W $0312
    LSR A
    LDA.W #$0000
    BCS CODE_0083BC
    LDA.W $0398
    STZ.W $0398

CODE_0083BC:
    STA.W $2142
    PLY
    PLX
    PLA
    PLB
    PLP
    RTI


transferSprites:
    LDX.W #$0000
    STX.W $2102
    STZ.W $4300
    LDA.B #$04
    STA.W $4301
    LDX.W #$0486
    STX.W $4302
    LDA.B #$00
    STA.W $4304
    LDX.W #$0220
    STX.W $4305
    LDA.B #$01
    STA.W $420B
    RTS


CODE_0083EA:
    STZ.W $2121
    STZ.W $4310
    LDA.B #$22
    STA.W $4311
    LDX.W #$0000
    STX.W $4312
    LDA.B #$7F
    STA.W $4314
    LDX.W #$0200
    STX.W $4315
    LDA.B #$02
    STA.W $420B
    LDA.L $7F0200
    STA.W $2132
    LDA.L $7F0201
    STA.W $2132
    LDA.L $7F0202
    STA.W $2132
    RTS


CODE_008421:
    LDA.W $1C7C
    BEQ CODE_008427
    RTS


CODE_008427:
    LDA.W $03B8
    BNE CODE_00842D
    RTS


CODE_00842D:
    BIT.B #$02
    BNE CODE_008442
    LDX.W #$5800
    STX.W $2116
    LDX.W #$7000
    STX.W $4322
    STZ.W $03B8
    BRA CODE_008453


CODE_008442:
    LDX.W #$5C00
    STX.W $2116
    LDX.W #$7800
    STX.W $4322
    LDA.B #$02
    TRB.W $03B8

CODE_008453:
    LDA.B #$01
    STA.W $4320
    LDA.B #$18
    STA.W $4321
    LDA.B #$7F
    STA.W $4324
    LDX.W #$0800
    STX.W $4325
    LDA.B #$04
    STA.W $420B
    RTS


CODE_00846E:
    LDA.W horizontalScroll
    STA.W $2111
    STZ.W $2111
    LDA.W verticalScroll
    STA.W $2112
    STZ.W $2112
    LDA.W $03DB
    BNE CODE_008498
    LDX.W #$0000
    LDY.W #$0000
    JSR.W CODE_0084AB
    LDX.W #$0004
    LDY.W #$0002
    JSR.W CODE_0084AB
    RTS


CODE_008498:
    LDX.W #$0004
    LDY.W #$0000
    JSR.W CODE_0084AB
    LDX.W #$0000
    LDY.W #$0002
    JSR.W CODE_0084AB
    RTS


CODE_0084AB:
    LDA.W $033A,X
    STA.W $210D,Y
    LDA.W $033B,X
    AND.B #$03
    STA.W $210D,Y
    LDA.W $033C,X
    STA.W $210E,Y
    LDA.W $033D,X
    AND.B #$03
    STA.W $210E,Y
    RTS


CODE_0084C8:
    LDX.W #$3000
    STX.B $32
    LDX.W #$3102
    STX.B $35
    JSL.L CODE_02857D
    LDX.W #$3204
    STX.B $32
    LDX.W #$3306
    STX.B $35
    JSL.L CODE_02857D
    RTS


CODE_0084E5:
    LDA.W $03B6
    BNE CODE_0084EB
    RTS


CODE_0084EB:
    LDA.B #$18
    STA.W $4321
    LDA.B #$01
    STA.W $4320
    LDY.W #$0000
    LDX.W #$2000
    STX.W $2116
    JSR.W CODE_008524
    LDX.W #$0000

CODE_008504:
    LDY.W $1A06,X
    BEQ CODE_008514
    INC.W $1A07,X
    INC.W $1A07,X
    INX
    INX
    INX
    BRA CODE_008504


CODE_008514:
    LDY.W #$0000
    LDX.W #$2100
    STX.W $2116
    JSR.W CODE_008524
    STZ.W $03B6
    RTS


CODE_008524:
    LDX.W $1A06,Y
    BEQ CODE_008542
    STX.W $4322
    LDA.W $1A08,Y
    STA.W $4324
    LDX.W #$0040
    STX.W $4325
    LDA.B #$04
    STA.W $420B
    INY
    INY
    INY

CODE_008540:
    BRA CODE_008524


CODE_008542:
    RTS


CODE_008543:
    LDA.W $03E1
    BNE CODE_008549
    RTS


CODE_008549:
    LDA.B #$01
    STA.W $4320
    LDA.B #$18
    STA.W $4321
    LDX.W $03DD
    STX.W $4322
    LDA.B #$7F
    STA.W $4324
    LDX.W #$0040
    STX.W $4325
    LDX.W $03DF
    STX.W $2116
    LDA.B #$04
    STA.W $420B
    LDX.W #$0040
    STX.W $4325
    LDA.W $03DF
    STA.W $2116
    LDA.W $03E0
    INC A
    STA.W $2117
    LDA.B #$04
    STA.W $420B
    STZ.W $03E1
    RTS


CODE_00858B:
    REP #$20
    TSX
    LDA.W #$1C7A
    TCS

CODE_008592:
    PLA
    BEQ CODE_00859E
    STA.W $2116
    PLA
    STA.W $2118
    BRA CODE_008592


CODE_00859E:
    TXS
    STZ.W $1C7B
    SEP #$20
    RTS


Native_mode_IRQ:
    db $40

CODE_0085A6:
    PHP
    PHB
    PEI.B ($38)
    PEI.B ($39)
    REP #$20
    STZ.W $1F00
    LDA.W $06A6
    PEA.W UNREACH_0185BA
    PEA.W UNREACH_0189BE
    RTS

    PLX
    STX.B $39
    PLX
    STX.B $38
    PLB
    PLP
    RTL


CODE_0085C4:
    PHP
    REP #$20
    LDA.W currentEntityPtr
    LDY.W #$0000

CODE_0085CD:
    TAX
    BNE CODE_0085D3
    BRL CODE_00867A


CODE_0085D3:
    LDA.W $0000,X
    SEC
    SBC.W $0008,X
    SEC
    SBC.W $033A
    CMP.W #$0100
    BCC CODE_0085F8
    BMI CODE_0085E8
    BRL CODE_00866B


CODE_0085E8:
    LDA.W $0000,X
    CLC
    ADC.W $000C,X
    SEC
    SBC.W $033A
    CMP.W #$0100
    BCS CODE_00866B

CODE_0085F8:
    LDA.W $0002,X
    SEC
    SBC.W $000A,X
    SEC
    SBC.W $033C
    CMP.W #$00E0
    BCC CODE_00861A
    BPL CODE_00866B
    LDA.W $0002,X
    CLC
    ADC.W $000E,X
    SEC
    SBC.W $033C
    CMP.W #$00E0
    BCS CODE_00866B

CODE_00861A:
    LDA.W $0016,X
    BIT.W #$2000
    BNE CODE_00865C
    LDA.W $001A,X
    BIT.W #$0080
    BNE CODE_00865C
    BIT.W #$6000
    BEQ CODE_008639
    BIT.W #$4000
    BNE CODE_008645
    LDA.W #$01FE
    BRA CODE_00864C


CODE_008639:
    LDA.W $0002,X
    SEC
    SBC.W $033C
    CMP.W #$0100
    BCC CODE_008648

CODE_008645:
    LDA.W #$00FF

CODE_008648:
    EOR.W #$00FF
    ASL A

CODE_00864C:
    CMP.W #$0200
    BCS CODE_00864C
    STA.W $1900,Y
    TXA
    STA.W $1902,Y
    INY
    INY
    INY
    INY

CODE_00865C:
    LDA.W $0016,X
    AND.W #$7FFF
    STA.W $0016,X
    LDA.W soundIdBank,X
    BRL CODE_0085CD


CODE_00866B:
    LDA.W $0016,X
    ORA.W #$8000
    STA.W $0016,X
    LDA.W soundIdBank,X
    BRL CODE_0085CD


CODE_00867A:
    LDA.W #$FFFF
    STA.W $1900,Y
    LDA.W #$0486
    STA.B $02
    TSC
    STA.B $00
    LDA.W #$18FF
    TCS

CODE_00868C:
    PLX
    BMI CODE_0086C6
    LDY.W $0100,X
    BNE CODE_0086AE
    LDA.B $02
    STA.W $0100,X
    TAY
    PLA
    STA.W $0000,Y
    LDA.W #$0000
    STA.W $0002,Y
    LDA.B $02
    CLC
    ADC.W #$0004
    STA.B $02
    BRA CODE_00868C


CODE_0086AE:
    LDA.B $02
    STA.W $0100,X
    TAX
    PLA
    STA.W $0000,X
    TYA
    STA.W $0002,X
    LDA.B $02
    CLC
    ADC.W #$0004
    STA.B $02
    BRA CODE_00868C


CODE_0086C6:
    LDA.W #$00FF
    TCS
    LDX.W #$0000
    BRA CODE_0086D1


CODE_0086CF:
    PHA
    PLA

CODE_0086D1:
    PLY
    BEQ CODE_0086D1
    BMI CODE_0086E6

CODE_0086D6:
    LDA.W $0000,Y
    STA.W $1900,X
    INX
    INX
    LDA.W $0002,Y
    BEQ CODE_0086CF
    TAY
    BRA CODE_0086D6


CODE_0086E6:
    STZ.W $1900,X
    LDA.B $00
    TCS
    PLP
    RTL


CODE_0086EE:
    PHB
    PHP
    SEP #$20
    REP #$30
    LDA.W #$1A06
    STA.B $04
    STZ.W $1A06
    STZ.B $02
    LDA.W $033A
    SEC
    SBC.W #$0010
    STA.B $52
    LDA.W $033C
    SEC
    SBC.W #$0010
    STA.B $54
    LDA.W #$0686
    STA.B $4C
    LDA.W #$0004
    STA.B $4E
    TSC
    STA.B $00
    LDA.W #$0685
    TCS
    LDX.W #$0010
    LDA.W #$E080

CODE_008727:
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    PHA
    DEX
    BNE CODE_008727
    LDA.B $00
    TCS
    LDX.W #$0000
    TXY

CODE_008741:
    LDA.W $1900,X
    BEQ CODE_008752
    INX
    INX
    PHX
    TAX
    JSR.W CODE_008761
    PLX
    BCS CODE_00875E
    BRA CODE_008741


CODE_008752:
    SEP #$20
    LDA.B $00

CODE_008756:
    LSR A
    LSR A
    DEC.B $4E
    BNE CODE_008756
    STA.B ($4C)

CODE_00875E:
    PLP
    PLB
    RTL


CODE_008761:
    PHB
    PHX
    SEP #$20
    LDA.W $0024,X
    PHA
    PLB
    REP #$20
    LDA.W $0000,X
    SEC
    SBC.W $0008,X
    SEC
    SBC.B $52
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $000A,X
    SEC
    SBC.B $54
    STA.B $18
    LDA.W $001C,X
    STA.B $50
    STZ.B $06
    LDA.W $0016,X
    BIT.W #$0800
    BEQ CODE_0087A6
    LDA.W $0026,X
    BMI CODE_00879E
    LSR A
    BCS CODE_0087A6
    BRL CODE_008827


CODE_00879E:
    LSR A
    BCS CODE_0087A6
    LDA.W #$0E00
    STA.B $06

CODE_0087A6:
    LDA.W $001A,X
    BPL CODE_0087AE
    BRL CODE_008832


CODE_0087AE:
    LDA.W $0028,X
    TAX
    LDA.W $0000,X
    INX
    INX
    STA.B $0C

CODE_0087B9:
    LDA.B $50
    ASL A
    LDA.W $0003,X
    BCC CODE_0087C2
    XBA

CODE_0087C2:
    AND.W #$00FF
    CLC
    ADC.B $18
    CMP.W #$00F0
    BCS CODE_00882A
    SBC.W #$0010
    STA.W $0487,Y
    LDA.W $0005,X
    EOR.B $50
    ORA.B $06
    STA.W $0488,Y
    LDA.B $50
    ASL A
    ASL A
    LDA.W $0001,X
    BCC CODE_0087E7
    XBA

CODE_0087E7:
    AND.W #$00FF
    CLC
    ADC.B $16
    CMP.W #$0110
    BCS CODE_00882A
    SBC.W #$000F
    SEP #$20
    STA.W $0486,Y
    XBA
    LSR A
    ROR.B $00
    LDA.W $0000,X
    LSR A
    ROR.B $00
    DEC.B $4E
    BNE CODE_008812
    LDA.B $00
    STA.B ($4C)
    INC.B $4C
    LDA.B #$04
    STA.B $4E

CODE_008812:
    REP #$20
    INY
    INY
    INY
    INY
    CPY.W #$0200
    BEQ CODE_008827

CODE_00881D:
    TXA
    CLC
    ADC.W #$0007
    TAX
    DEC.B $0C
    BNE CODE_0087B9

CODE_008827:
    PLX
    PLB
    RTS


CODE_00882A:
    LDA.W #$E080
    STA.W $0486,Y
    BRA CODE_00881D


CODE_008832:
    LDA.W $0034,X
    STA.W $1A02
    LDA.W $002C,X
    STA.W $1A04
    LDA.W $0028,X
    TAX
    LDA.W $0000,X
    INX
    INX
    STA.B $0C
    INC.W $03B6

CODE_00884C:
    LDA.B $50
    ASL A
    LDA.W $0003,X
    BCC CODE_008855
    XBA

CODE_008855:
    AND.W #$00FF
    CLC
    ADC.B $18
    CMP.W #$00F0
    BCC CODE_008863
    BRL CODE_0088EB


CODE_008863:
    SBC.W #$0010
    STA.W $0487,Y
    LDA.W $0005,X
    EOR.B $50
    ORA.B $06
    PHA
    AND.W #$01FF
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    ADC.W $1A02
    STA.B ($04)
    INC.B $04
    INC.B $04
    LDA.W $1A04
    STA.B ($04)
    INC.B $04
    PLA
    AND.W #$FE00
    ORA.B $02
    INC.B $02
    INC.B $02
    STA.W $0488,Y
    LDA.B $50
    ASL A
    ASL A
    LDA.W $0001,X
    BCC CODE_0088A0
    db $EB

CODE_0088A0:
    AND.W #$00FF
    CLC
    ADC.B $16
    CMP.W #$0110
    BCS CODE_0088EB
    SBC.W #$000F
    SEP #$20
    STA.W $0486,Y
    XBA
    LSR A
    ROR.B $00
    LDA.W $0000,X
    LSR A
    ROR.B $00
    DEC.B $4E
    BNE CODE_0088CB
    LDA.B $00
    STA.B ($4C)
    INC.B $4C
    LDA.B #$04
    STA.B $4E

CODE_0088CB:
    REP #$20
    INY
    INY
    INY
    INY
    CPY.W #$0200
    BEQ CODE_0088E3

CODE_0088D6:
    TXA
    CLC
    ADC.W #$0007
    TAX
    DEC.B $0C
    BEQ CODE_0088E3
    BRL CODE_00884C


CODE_0088E3:
    LDA.W #$0000
    STA.B ($04)
    PLX
    PLB
    RTS


CODE_0088EB:
    LDA.W #$E080
    STA.W $0486,Y
    BRA CODE_0088D6


CODE_0088F3:
    PHB
    SEP #$20
    LDA.W $0024,X
    PHA
    PLB
    REP #$20
    LDA.W $001E,X

CODE_008900:
    ASL A
    CLC
    ADC.W $0022,X
    TAY
    LDA.W $0020,X
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W $0000,Y
    TAY
    LDA.W $0000,Y
    BPL CODE_008919
    BRL CODE_0089B0


CODE_008919:
    STA.W $0014,X
    LDA.W $001C,X
    ROL A
    BPL CODE_00892B
    LDA.W #$0000
    SEC
    SBC.W $0002,Y
    BRA CODE_00892E


CODE_00892B:
    LDA.W $0002,Y

CODE_00892E:
    STA.W $0004,X
    LDA.W $001C,X
    BPL CODE_00893F
    LDA.W #$0000
    SEC
    SBC.W $0004,Y
    BRA CODE_008942


CODE_00893F:
    LDA.W $0004,Y

CODE_008942:
    STA.W $0006,X
    LDA.W $0006,Y
    TAY
    CLC
    ADC.W #$000C
    STA.W $0028,X
    LDA.W $001C,X
    ROL A
    PHP
    BPL CODE_00896D
    LDA.W $0002,Y
    SEC
    SBC.W $0008,Y
    STA.W $0008,X
    LDA.W $0000,Y
    CLC
    ADC.W $0008,Y
    STA.W $000C,X
    BRA CODE_008979


CODE_00896D:
    LDA.W $0000,Y
    STA.W $0008,X
    LDA.W $0002,Y
    STA.W $000C,X

CODE_008979:
    PLP
    BCC CODE_008992
    LDA.W $0006,Y
    CLC
    ADC.W $000A,Y
    STA.W $000A,X
    LDA.W $0004,Y
    SEC
    SBC.W $000A,Y
    STA.W $000E,X
    BRA CODE_00899E


CODE_008992:
    LDA.W $0004,Y
    STA.W $000A,X
    LDA.W $0006,Y
    STA.W $000E,X

CODE_00899E:
    LDA.W $0008,Y
    STA.W $0010,X
    LDA.W $000A,Y
    STA.W $0012,X
    INC.W $0020,X
    CLC

CODE_0089AE:
    PLB
    RTL


CODE_0089B0:
    STZ.W $0020,X
    STZ.W $0004,X
    STZ.W $0006,X
    SEC
    PLB
    RTL


CODE_0089BC:
    LDA.W $003E,X
    TAX
    BEQ CODE_008A33
    INC.W $1F00
    LDA.W $0016,X
    BIT.W #$0800
    BEQ CODE_0089F9
    LDA.W $0026,X
    BPL CODE_0089E1
    INC.W $0026,X
    BPL CODE_0089F0
    LDA.W $001A,X
    BIT.W #$0040
    BEQ CODE_0089F9
    BRA CODE_0089BC


CODE_0089E1:
    DEC.W $0026,X
    BEQ CODE_0089F0
    LDA.W $001A,X
    BIT.W #$0040
    BEQ CODE_0089F9
    BRA CODE_0089BC

CODE_0089F0:
    LDA.W $0016,X
    AND.W #$F7FF
    STA.W $0016,X

CODE_0089F9:
    LDA.W $03A6
    BEQ CODE_008A06
    LDA.W $0016,X
    BIT.W #$0010
    BEQ CODE_0089BC

CODE_008A06:
    DEC.W $0014,X
    BPL CODE_008A22
    STZ.W $0014,X
    SEP #$20
    LDA.B #$00
    PHA
    PEA.W UNREACH_018A21
    LDA.W $0036,X
    PHA
    REP #$20
    LDA.W $0018,X
    DEC A
    PHA
    RTL


CODE_008A22:
    LDA.W $0016,X
    BIT.W #$1000
    BEQ CODE_008A2E
    JSL.L CODE_008F28

CODE_008A2E:
    JSR.W AddTwoRamVars
    BRA CODE_0089BC


CODE_008A33:
    RTS


CODE_008A34:
    PHP
    PHB
    REP #$20
    LDX.W $039C
    LDA.W $0016,X
    BIT.W #$0400
    BEQ CODE_008A46
    BRL CODE_008AEF


CODE_008A46:
    LDX.W #$0000

CODE_008A49:
    LDY.W $1900,X
    BNE CODE_008A51
    BRL CODE_008AEF


CODE_008A51:
    INX
    INX
    LDA.W $0016,Y
    BIT.W #$0080
    BEQ CODE_008A49
    BIT.W #$0D00
    BNE CODE_008A49
    PHX
    SEP #$20
    LDA.W $0024,Y
    PHA
    PLB
    REP #$20
    LDX.W #$0000
    STY.B $3E

CODE_008A6F:
    LDY.B $3E
    LDA.W $0002,Y
    SEC
    SBC.W $000A,Y
    STA.B $00
    LDA.W $0002,Y
    CLC
    ADC.W $000E,Y
    STA.B $02
    LDA.W $0000,Y
    SEC
    SBC.W $0008,Y
    STA.B $04
    LDA.W $0000,Y
    CLC
    ADC.W $000C,Y
    STA.B $06

CODE_008A95:
    LDY.W $1900,X
    BEQ CODE_008AEB
    INX
    INX
    LDA.W $0016,Y
    BIT.W #$EEC0
    BNE CODE_008A95
    LDA.W $0000,Y
    SEC
    SBC.W $0008,Y
    CMP.B $06
    BCS CODE_008A95
    LDA.W $0000,Y
    CLC
    ADC.W $000C,Y
    CMP.B $04
    BCC CODE_008A95
    LDA.W $0002,Y
    SEC
    SBC.W $000A,Y
    CMP.B $02
    BCS CODE_008A95
    LDA.W $0002,Y
    CLC
    ADC.W $000E,Y
    CMP.B $00
    BCC CODE_008A95
    JSR.W CODE_008D55
    BCC CODE_008A6F
    PHX
    LDX.B $3E
    LDA.W $0016,X
    BIT.W #$0020
    BNE CODE_008AE5
    JSR.W swordHitsEnemy
    BRA CODE_008AE8


CODE_008AE5:
    JSR.W magicHitsEnemy

CODE_008AE8:
    PLX
    BRA CODE_008A6F


CODE_008AEB:
    PLX
    BRL CODE_008A49


CODE_008AEF:
    PLB
    PLP
    RTL


swordHitsEnemy:
    LDX.W $039C
    LDA.W $001E,X
    CMP.W #$0024
    BCC CODE_008AFE
    RTS


CODE_008AFE:
    LDA.W $0016,Y
    BIT.W #$0002
    BEQ CODE_008B09

CODE_008B06:
    BRK #$4C
    RTS


CODE_008B09:
    LDA.W $1B5E
    CMP.W #$0008
    BEQ CODE_008B62
    LDA.W $1B5E
    CMP.W #$0002
    BNE CODE_008B3E
    CPY.W $039A
    BEQ CODE_008B3E
    LDA.W $001A,Y
    BIT.W #$0E00
    BEQ CODE_008B62
    LDA.W $001A,Y
    ORA.W #$0040
    STA.W $001A,Y
    LDA.W $0016,Y
    ORA.W #$0800
    STA.W $0016,Y
    LDA.W #$00B4
    STA.W $0026,Y

CODE_008B3E:
    LDA.W $001A,Y
    BIT.W #$0800
    BNE CODE_008B51
    BIT.W #$0400
    BNE CODE_008B5A
    BIT.W #$0200
    BEQ CODE_008B62
    RTS


CODE_008B51:
    LDA.W $1B5E
    CMP.W #$0006
    BEQ CODE_008B62
    RTS


CODE_008B5A:
    LDA.W $1B5E
    CMP.W #$0005
    BNE CODE_008B06

CODE_008B62:
    LDA.W $1B5E
    CMP.W #$0003
    BNE CODE_008B77
    CPY.W $039A
    BEQ CODE_008B77
    LDA.W $0312
    AND.W #$000F
    BEQ killEnemy

CODE_008B77:
    SEP #$20
    LDX.W $0038,Y
    LDA.L PTR16_018001,X
    STA.B $00
    LDA.W $1B8C
    SEC
    SBC.B $00
    BEQ CODE_008B8C
    BCS CODE_008B8E

CODE_008B8C:
    LDA.B #$01

CODE_008B8E:
    STA.B $00
    LDA.W $1B64
    CMP.B #$37
    BEQ CODE_008B9B
    CMP.B #$35
    BNE CODE_008B9D

CODE_008B9B:
    ASL.B $00

CODE_008B9D:
    LDA.W $0025,Y
    SEC
    SBC.B $00
    BCC killEnemy
    BEQ killEnemy

CODE_008BA7:
    STA.W $0025,Y
    REP #$20
    CPY.W $039A
    BEQ CODE_008BC0
    LDX.W $039C
    LDA.W $001E,X
    SEC
    SBC.W #$0020
    CMP.W #$0004
    BCC CODE_008BCB

CODE_008BC0:
    LDA.W $001A,Y
    AND.W #$FFBF
    STA.W $001A,Y
    BRA CODE_008BD4


CODE_008BCB:
    LDA.W $001A,Y
    ORA.W #$0040
    STA.W $001A,Y

CODE_008BD4:
    LDA.W #$FFF8
    STA.W $0026,Y
    LDA.W $0016,Y
    ORA.W #$0800
    STA.W $0016,Y
    BRK #$42
    BRA CODE_008C44


killEnemy:
    REP #$20
    LDA.W $001A,Y
    BIT.W #$0100
    SEP #$20
    BEQ CODE_008BF7
    LDA.B #$01
    BRA CODE_008BA7


CODE_008BF7:
    LDA.B #$00
    STA.W $0036,Y
    LDA.B #$00
    STA.W $0025,Y
    REP #$20
    LDA.W #$AA10
    STA.W $0018,Y
    LDA.W #$0000
    STA.W $0014,Y
    LDA.W $0016,Y
    ORA.W #$0400
    STA.W $0016,Y
    LDX.W $0038,Y
    LDA.L PTR16_018003,X
    JSL.L addExp
    LDA.W #$0002
    TSB.W $0332
    LDA.W $1B5E
    CMP.W #$0007
    BNE CODE_008C42
    LDA.W $1B88
    CMP.W $1B8A
    BEQ CODE_008C42
    INC.W $1B88
    LDA.W #$0004
    TSB.W $0332

CODE_008C42:
    BRK #$43

CODE_008C44:
    LDA.W $0016,Y
    BIT.W #$0001
    BEQ CODE_008C4D
    RTS

CODE_008C4D:
    SEP #$20
    LDA.W $0025,Y
    STA.W $0336
    LDX.W $0038,Y
    LDA.L PTR16_018002,X
    STA.W $0338
    LDA.B #$80
    STA.W $0330
    REP #$20
    RTS


magicHitsEnemy:
    LDA.W $0016,Y
    BIT.W #$0002
    BEQ CODE_008C72

CODE_008C6F:
    BRK #$4C
    RTS


CODE_008C72:
    LDA.W $0030,X
    CMP.W #$00FF
    BEQ CODE_008C95
    LDA.W $1B62
    CMP.W #$0018
    BEQ phoenix_hits
    CPY.W $039A
    BEQ CODE_008C6F
    LDA.W $001A,Y
    BIT.W #$0A00
    BEQ CODE_008C90
    RTS


CODE_008C90:
    BIT.W #$0400
    BNE CODE_008C6F

CODE_008C95:
    SEP #$20
    LDA.W $0025,Y
    SEC
    SBC.W $0030,X
    BCC enemy_dead
    BEQ enemy_dead
    BRA CODE_008CCB


phoenix_hits:
    SEP #$20
    LDX.W $0038,Y
    LDA.L PTR16_018001,X
    STA.B $00
    LDA.W $1B70
    CLC
    ADC.W $1B72
    SEC
    SBC.B $00
    BEQ CODE_008CBD
    BCS CODE_008CBF

CODE_008CBD:
    LDA.B #$01

CODE_008CBF:
    STA.B $00
    LDA.W $0025,Y
    SEC
    SBC.B $00
    BCC enemy_dead
    BEQ enemy_dead

CODE_008CCB:
    STA.W $0025,Y
    REP #$20
    LDA.W #$FFF8
    STA.W $0026,Y
    LDA.W $0016,Y
    ORA.W #$0800
    STA.W $0016,Y
    LDA.W $001A,Y
    AND.W #$FFBF
    STA.W $001A,Y
    BRK #$42
    BRA CODE_008D32


enemy_dead:
    REP #$20
    LDA.W $001A,Y
    BIT.W #$0100
    SEP #$20
    BEQ CODE_008CFC
    LDA.B #$01
    BRA CODE_008CCB


CODE_008CFC:
    SEP #$20
    LDA.B #$00
    STA.W $0036,Y
    LDA.B #$00
    STA.W $0025,Y
    REP #$20
    LDA.W #$AA10
    STA.W $0018,Y
    LDA.W #$0000
    STA.W $0014,Y
    LDA.W $0016,Y
    ORA.W #$0400
    STA.W $0016,Y
    LDX.W $0038,Y
    LDA.L PTR16_018003,X
    JSL.L addExp
    LDA.W #$0002
    TSB.W $0332
    BRK #$43

CODE_008D32:
    LDA.W $0016,Y
    BIT.W #$0001
    BEQ CODE_008D3B
    RTS


CODE_008D3B:
    SEP #$20
    LDA.W $0025,Y
    STA.W $0336
    LDX.W $0038,Y
    LDA.L PTR16_018002,X
    STA.W $0338
    LDA.B #$80
    STA.W $0330
    REP #$20
    RTS


CODE_008D55:
    PHX
    PHY
    TYX
    LDY.B $3E
    LDA.W $0002,X
    SEC
    SBC.W $000A,X
    STA.B $00
    LDA.W $0002,X
    CLC
    ADC.W $000E,X
    STA.B $02
    LDA.W $0000,X
    SEC
    SBC.W $0008,X
    STA.B $04
    LDA.W $0000,X
    CLC
    ADC.W $000C,X
    STA.B $06
    LDA.W $0000,Y
    SEC
    SBC.W $0008,Y
    STA.B $08
    LDA.W $0002,Y
    SEC
    SBC.W $000A,Y
    STA.B $0A
    LDX.W $0028,Y
    LDA.W $0000,X
    STA.B $0C
    INX
    INX

CODE_008D9A:
    LDA.W $0000,X
    LSR A
    BCC CODE_008DA5
    LDA.W #$000F
    BRA CODE_008DA8


CODE_008DA5:
    LDA.W #$0007

CODE_008DA8:
    PHA
    LDA.W $001C,Y
    ASL A
    ASL A
    LDA.W $0001,X
    BCC CODE_008DB4
    XBA

CODE_008DB4:
    AND.W #$00FF
    CLC
    ADC.B $08
    CMP.B $06
    BCS CODE_008DE5
    CLC
    ADC.B $01,S
    CMP.B $04
    BCC CODE_008DE5
    LDA.W $001C,Y
    ASL A
    LDA.W $0003,X
    BCC CODE_008DCF
    XBA

CODE_008DCF:
    AND.W #$00FF
    CLC
    ADC.B $0A
    CMP.B $02
    BCS CODE_008DE5
    CLC
    ADC.B $01,S
    CMP.B $00
    BCC CODE_008DE5
    PLA
    PLY
    PLX
    SEC
    RTS


CODE_008DE5:
    PLA
    TXA
    CLC
    ADC.W #$0007
    TAX
    DEC.B $0C
    BNE CODE_008D9A
    PLY
    PLX
    CLC
    RTS


CODE_008DF4:
    PHP
    REP #$30
    LDA.W $042D
    BNE CODE_008E5F
    LDY.W $039C
    LDA.W $0000,Y
    CLC
    ADC.W #$0005
    STA.B $16
    CLC
    ADC.W #$0007
    STA.B $1A
    LDA.W $0002,Y
    SEC
    SBC.W #$0004
    STA.B $1C
    SEC
    SBC.W #$0008
    STA.B $18
    LDA.W $0016,Y
    BIT.W #$0400
    BNE CODE_008E5F
    BIT.W #$0800
    BNE CODE_008E61
    LDY.W #$0000

CODE_008E2D:
    LDX.W $1900,Y
    BEQ CODE_008E5F
    INY
    INY
    LDA.W $0016,X
    BIT.W #$25C0
    BNE CODE_008E2D
    LDA.W $0000,X
    CMP.B $1A
    BCS CODE_008E2D
    CLC
    ADC.W $0010,X
    CMP.B $16
    BCC CODE_008E2D
    LDA.W $0002,X
    CMP.B $18
    BCC CODE_008E2D
    SEC
    SBC.W $0012,X
    CMP.B $1C
    BCS CODE_008E2D
    JSR.W EnemyHitsPlayer
    BCS CODE_008E2D

CODE_008E5F:
    PLP
    RTL


CODE_008E61:
    LDY.W #$0000

CODE_008E64:
    LDX.W $1900,Y
    BEQ CODE_008E9B
    INY
    INY
    LDA.W $0016,X
    BIT.W #$25C0
    BNE CODE_008E64
    BIT.W #$4000
    BEQ CODE_008E64
    LDA.W $0000,X
    CMP.B $1A
    BCS CODE_008E64
    CLC
    ADC.W $0010,X
    CMP.B $16
    BCC CODE_008E64
    LDA.W $0002,X
    CMP.B $18
    BCC CODE_008E64
    SEC
    SBC.W $0012,X
    CMP.B $1C
    BCS CODE_008E64
    JSR.W EnemyHitsPlayer
    BCS CODE_008E64

CODE_008E9B:
    PLP
    RTL


EnemyHitsPlayer:
    LDA.W $0016,X
    BIT.W #$4000
    BNE CODE_008F22
    LDA.W playerEquippedArmor
    CMP.W #$000E
    BNE CODE_008EC3
    SEP #$20
    LDY.W $0038,X
    LDA.W entities_lut,Y
    LSR A
    CLC
    ADC.W entities_lut,Y
    CMP.W $1B8E
    BCS CODE_008EC3
    BRK #$0C
    BRA CODE_008F20


CODE_008EC3:
    SEP #$20
    LDY.W $0038,X
    LDA.W entities_lut,Y
    DEC A
    SEC
    SBC.W $1B8E
    BCS CODE_008ED4
    LDA.B #$00

CODE_008ED4:
    STA.B $00
    LDA.W playerEquippedItem
    CMP.B #$37
    BEQ CODE_008EE1
    CMP.B #$36
    BNE CODE_008EE3

CODE_008EE1:
    LSR.B $00

CODE_008EE3:
    LDA.B $00
    BNE CODE_008EE8
    INC A

CODE_008EE8:
    PHA
    LDA.W playerCurrentHealth
    SEC
    SBC.B $01,S
    BPL CODE_008EF3
    LDA.B #$00

CODE_008EF3:
    STA.W playerCurrentHealth
    PLA
    REP #$20
    LDA.W #$0004
    TSB.W updateHudBitfield
    LDX.W $039C
    LDA.W playerEquippedArmor
    CMP.W #$000D
    BNE CODE_008F0F
    LDA.W #$FFC0
    BRA CODE_008F12


CODE_008F0F:
    LDA.W #$FFE0

CODE_008F12:
    STA.W $0026,X
    BRK #$04
    LDA.W $0016,X
    ORA.W #$0800
    STA.W $0016,X

CODE_008F20:
    CLC
    RTS


CODE_008F22:
    JSL.L CODE_00AF0A
    SEC
    RTS


CODE_008F28:
    LDA.W $0010,X
    ORA.W $0012,X
    AND.W #$0008
    BNE CODE_008F52
    LDA.W $0004,X
    BEQ CODE_008F42
    BMI CODE_008F3F
    JSR.W CODE_008F56
    BRA CODE_008F42


CODE_008F3F:
    JSR.W CODE_008FFF

CODE_008F42:
    LDA.W $0006,X
    BEQ CODE_008F51
    BMI CODE_008F4E
    JSR.W CODE_0090AF
    BRA CODE_008F51


CODE_008F4E:
    JSR.W CODE_009154

CODE_008F51:
    RTL


CODE_008F52:
    JSR.W CODE_009208
    RTL


CODE_008F56:
    PHP
    LDA.W $0000,X
    CLC
    ADC.W $0010,X
    SEC
    SBC.W #$0010
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $0012,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $18
    STA.B $1C
    LDA.W $0002,X
    DEC A
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $00
    LDA.W $0012,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0C
    STA.B $0E
    SEP #$20

CODE_008F8E:
    JSR.W CODE_009256
    CMP.B #$0A
    BEQ CODE_008FE4
    INC.B $18
    DEC.B $0C
    BNE CODE_008F8E
    LDA.B $00
    STA.B $18
    JSR.W CODE_009256
    CMP.B #$0A
    BEQ CODE_008FE4
    LDA.B $1C
    STA.B $18
    INC.B $16

CODE_008FAC:
    JSR.W CODE_009256
    BCS CODE_008FFC
    CMP.B #$0F
    BEQ CODE_008FE4
    CMP.B #$05
    BEQ CODE_008FE4
    CMP.B #$06
    BEQ CODE_008FE4
    INC.B $18
    DEC.B $0E
    BNE CODE_008FAC
    LDA.B $00
    STA.B $18
    JSR.W CODE_009256
    BCS CODE_008FFC
    CMP.B #$0F
    BEQ CODE_008FE4
    CMP.B #$05
    BEQ CODE_008FE4
    CMP.B #$06
    BEQ CODE_008FE4
    PLP
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X
    CLC
    RTS


CODE_008FE4:
    PLP
    LDA.W $0016,X
    ORA.W #$0004
    STA.W $0016,X

CODE_008FEE:
    LDA.W $0000,X
    AND.W #$FFF0
    STA.W $0000,X
    STZ.W $0004,X
    SEC
    RTS


CODE_008FFC:
    PLP
    BRA CODE_008FEE


CODE_008FFF:
    PHP
    LDA.W $0004,X
    CLC
    ADC.W $0000,X
    EOR.W $0000,X
    AND.W #$FFF0
    BEQ CODE_009088
    LDA.W $0000,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $0012,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $18
    STA.B $1C
    LDA.W $0002,X
    DEC A
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $00
    LDA.W $0012,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0C
    STA.B $0E
    SEP #$20

CODE_00903E:
    JSR.W CODE_009256
    CMP.B #$05
    BEQ CODE_009094
    INC.B $18
    DEC.B $0C
    BNE CODE_00903E
    LDA.B $00
    STA.B $18
    JSR.W CODE_009256
    CMP.B #$05
    BEQ CODE_009094
    LDA.B $1C
    STA.B $18
    DEC.B $16

CODE_00905C:
    JSR.W CODE_009256
    BCS CODE_0090AC
    CMP.B #$0F
    BEQ CODE_009094
    CMP.B #$0A
    BEQ CODE_009094
    CMP.B #$06
    BEQ CODE_009094
    INC.B $18
    DEC.B $0E
    BNE CODE_00905C
    LDA.B $00
    STA.B $18
    JSR.W CODE_009256
    BCS CODE_0090AC
    CMP.B #$0F
    BEQ CODE_009094
    CMP.B #$0A
    BEQ CODE_009094
    CMP.B #$06
    BEQ CODE_009094

CODE_009088:
    PLP
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X
    CLC
    RTS


CODE_009094:
    PLP
    LDA.W $0016,X
    ORA.W #$0004
    STA.W $0016,X

CODE_00909E:
    LDA.W $0000,X
    AND.W #$FFF0
    STA.W $0000,X
    STZ.W $0004,X
    SEC
    RTS


CODE_0090AC:
    PLP
    BRA CODE_00909E


CODE_0090AF:
    PHP
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $18
    LDA.W $0000,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $16
    STA.B $1A
    LDA.W $0000,X
    CLC
    ADC.W $0010,X
    DEC A
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $00
    LDA.W $0010,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0C
    STA.B $0E
    SEP #$20

CODE_0090E3:
    JSR.W CODE_009256
    CMP.B #$0C
    BEQ CODE_009139
    INC.B $16
    DEC.B $0C
    BNE CODE_0090E3
    LDA.B $00
    STA.B $16
    JSR.W CODE_009256
    CMP.B #$0C
    BEQ CODE_009139
    LDA.B $1A
    STA.B $16
    INC.B $18

CODE_009101:
    JSR.W CODE_009256
    BCS CODE_009151
    CMP.B #$0F
    BEQ CODE_009139
    CMP.B #$03
    BEQ CODE_009139
    CMP.B #$06
    BEQ CODE_009139
    INC.B $16
    DEC.B $0E
    BNE CODE_009101
    LDA.B $00
    STA.B $16
    JSR.W CODE_009256
    BCS CODE_009151
    CMP.B #$0F
    BEQ CODE_009139
    CMP.B #$03
    BEQ CODE_009139
    CMP.B #$06
    BEQ CODE_009139
    PLP
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X
    CLC
    RTS


CODE_009139:
    PLP
    LDA.W $0016,X
    ORA.W #$0004
    STA.W $0016,X

CODE_009143:
    LDA.W $0002,X
    AND.W #$FFF0
    STA.W $0002,X
    STZ.W $0006,X
    SEC
    RTS


CODE_009151:
    PLP
    BRA CODE_009143


CODE_009154:
    PHP
    LDA.W $0006,X
    CLC
    ADC.W $0002,X
    EOR.W $0002,X
    AND.W #$FFF0
    BEQ CODE_0091E1
    LDA.W $0002,X
    SEC
    SBC.W $0012,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $18
    LDA.W $0000,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $16
    STA.B $1A
    LDA.W $0000,X
    CLC
    ADC.W $0010,X
    DEC A
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $00
    LDA.W $0010,X
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0C
    STA.B $0E
    SEP #$20

CODE_009197:
    JSR.W CODE_009256
    CMP.B #$03
    BEQ CODE_0091ED
    INC.B $16
    DEC.B $0C
    BNE CODE_009197
    LDA.B $00
    STA.B $16
    JSR.W CODE_009256
    CMP.B #$03
    BEQ CODE_0091ED
    LDA.B $1A
    STA.B $16
    DEC.B $18

CODE_0091B5:
    JSR.W CODE_009256
    BCS CODE_009205
    CMP.B #$0F
    BEQ CODE_0091ED
    CMP.B #$0C
    BEQ CODE_0091ED
    CMP.B #$06
    BEQ CODE_0091ED
    INC.B $16
    DEC.B $0E
    BNE CODE_0091B5
    LDA.B $00
    STA.B $16
    JSR.W CODE_009256
    BCS CODE_009205
    CMP.B #$0F
    BEQ CODE_0091ED
    CMP.B #$0C
    BEQ CODE_0091ED
    CMP.B #$06
    BEQ CODE_0091ED

CODE_0091E1:
    PLP
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X
    CLC
    RTS


CODE_0091ED:
    PLP
    LDA.W $0016,X
    ORA.W #$0004
    STA.W $0016,X

CODE_0091F7:
    LDA.W $0002,X
    AND.W #$FFF0
    STA.W $0002,X
    STZ.W $0006,X
    SEC
    RTS


CODE_009205:
    PLP
    BRA CODE_0091F7


CODE_009208:
    LDA.W $0004,X
    ORA.W $0004,X
    BEQ CODE_009243
    LDA.W $0000,X
    CLC
    ADC.W $0004,X
    SEC
    SBC.W #$0004
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $16
    LDA.W $0002,X
    CLC
    ADC.W $0006,X

CODE_009228:
    SEC
    SBC.W #$0004
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $18
    JSR.W CODE_009256
    CMP.W #$000F
    BEQ CODE_009245
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X

CODE_009243:
    CLC
    RTS


CODE_009245:
    STZ.W $0004,X
    STZ.W $0006,X
    LDA.W $0016,X
    ORA.W #$0004
    STA.W $0016,X
    SEC
    RTS


CODE_009256:
    PHP
    PHX
    REP #$20
    LDA.B $18
    ASL A
    ASL A
    ASL A
    ASL A
    PHA
    SEP #$20
    LDA.W $0343
    JSL.L multiply
    STA.B $02,S
    LDA.B $16
    AND.B #$0F
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $16
    LSR A
    LSR A
    LSR A
    LSR A
    CLC
    ADC.B $02,S
    STA.B $02,S
    PLX
    CPX.W #$4000
    BCS CODE_009294
    LDA.L $7F8000,X
    BIT.B #$F0
    BNE CODE_009294
    AND.B #$0F
    PLX
    PLP
    CLC
    RTS


CODE_009294:
    LDA.B #$0F
    PLX
    PLP
    SEC
    RTS


AddTwoRamVars:
    LDA.W $0000,X
    CLC
    ADC.W $0004,X
    STA.W $0000,X
    LDA.W $0002,X
    CLC
    ADC.W $0006,X
    STA.W $0002,X
    RTS


zeroOutMapList:
    PHP
    REP #$20
    LDX.W #$1800
    STX.B $4A
    LDA.W #$0800

CODE_0092BA:
    STA.W $0000,X
    INX
    INX
    CLC
    ADC.W #$0040
    CPX.W #$1880
    BNE CODE_0092BA
    LDX.W #$0800
    STX.W $06A6
    LDA.W #$0000
    TAX

CODE_0092D2:
    STA.W entities_data,X
    INX
    INX
    CPX.W #$1000
    BNE CODE_0092D2
    PLP
    RTL


loadEntities:
    PHP
    REP #$20
    LDA.W actId
    ASL A
    TAX
    LDA.W entities_lut,X
    SEC
    SBC.W #$8000
    STA.W entities_lut_base_offset
    SEP #$20
    LDX.W #$0000

CODE_0092F5:
    LDA.W entities_placement_pointer,X
    BMI CODE_009312
    CMP.W mapNumber
    BNE goToNextEntityPlacementPtr
    LDA.W entities_placement_pointer+1,X
    CMP.W mapSubNumber
    BNE goToNextEntityPlacementPtr
    JSR.W CODE_009314
    BRA CODE_009312


goToNextEntityPlacementPtr:
    INX
    INX
    INX
    INX
    BRA CODE_0092F5


CODE_009312:
    PLP
    RTL


CODE_009314:
    LDA.B #$01
    STA.B $2B
    REP #$20
    LDA.W entities_placement_pointer+2,X
    STA.B $29
    JSL.L loadEntityPtr
    BRA CODE_00933C


CODE_009325:
    LDA.B [$29]
    AND.W #$00FF
    CMP.W #$00FF
    BNE CODE_009330
    RTS


CODE_009330:
    JSL.L loadEntityPtr
    TYA
    STA.W $003E,X
    TXA
    STA.W soundIdBank,Y

CODE_00933C:
    STY.W currentEntityPtr
    TYX
    LDA.B $29
    STA.W $003A,X
    CLC
    ADC.W #$0004
    STA.B $29
    JSL.L CODE_0093AB
    LDA.W $0016,X
    BIT.W #$0080
    BEQ CODE_009325
    LDA.W $037C
    ORA.W $037E
    BEQ CODE_009399
    LDA.W $037C
    STA.W $0000,X
    LDA.W $037E
    CLC
    ADC.W #$0010
    STA.W $0002,X
    LDA.W $0380
    STA.W $001E,X
    STZ.W $0020,X
    JSL.L CODE_0088F3
    STZ.W $0014,X
    LDA.W $037C
    STZ.W $037C
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W player_pos_x_int
    LDA.W $037E
    STZ.W $037E
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W player_pos_y_int

CODE_009399:
    LDA.W $0000,X
    STA.W player_pos_x_real
    LDA.W $0002,X
    STA.W player_pos_y_real
    STX.W $039C
    BRL CODE_009325


CODE_0093AB:
    TXY
    LDX.W $003A,Y
    LDA.L $010000,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.W $0000,Y
    LDA.L $010001,X
    PHA
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W #$0010
    STA.W $0002,Y
    PLA
    AND.W #$C100
    ORA.W $0372
    STA.W $001C,Y
    SEP #$20
    LDA.L $010003,X
    XBA
    LDA.B #$0E
    JSL.L multiply
    REP #$20
    CLC
    ADC.W entities_lut_base_offset
    TAX
    STA.W $0038,Y
    SEP #$20
    LDA.W PTR16_018002,X
    STA.W $0025,Y
    LDA.W PTR16_018005,X
    STA.W $001E,Y
    LDA.W PTR16_01800A,X
    STA.W $0024,Y
    LDA.W PTR16_01800D,X
    STA.W $0036,Y
    REP #$20
    LDA.W PTR16_018006,X
    ORA.W #$8000
    STA.W $0016,Y
    LDA.W PTR16_018008,X
    STA.W $0022,Y
    LDA.W PTR16_01800B,X
    STA.W $0018,Y
    TYX
    LDA.W $0016,X
    BIT.W #$0040
    BNE CODE_009441
    BIT.W #$2000
    BEQ CODE_009441
    LDA.W #$0010
    STA.W $000C,X
    STA.W $000A,X
    STZ.W $0008,X
    STZ.W $000E,X
    BRA CODE_009445


CODE_009441:
    JSL.L CODE_0088F3

CODE_009445:
    STZ.W $0014,X
    STZ.W $0004,X
    STZ.W $0006,X
    RTL


CODE_00944F:
    PHP
    PHX
    PHY
    REP #$20
    PHX
    LDA.L $7F0203,X
    STA.B $00
    LDA.W UNREACH_01BA19,Y
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W UNREACH_01BA1A,Y
    AND.W #$00FF
    INC A
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    TYX
    PHX
    LDX.W currentEntityPtr
    JSR.W CODE_00E662
    PLX
    LDA.W #$A000
    STA.W $0016,Y
    PLA
    STA.W $0034,Y
    LDA.B $16
    STA.W $0000,Y
    LDA.B $18
    STA.W $0002,Y
    LDA.W UNREACH_01BA23,X
    ORA.W #$0100
    ORA.W $0372
    STA.W $001C,Y
    STA.W $0030,Y
    LDA.W UNREACH_01BA1D,X
    STA.W $0018,Y
    SEP #$20
    LDA.W UNREACH_01BA1F,X
    STA.W $0036,Y
    LDA.B $00
    STA.W $002E,Y
    STA.W $002F,Y
    REP #$20
    LDA.W UNREACH_01BA21,X
    AND.W #$00FF
    STA.W $0026,Y
    SEP #$20
    LDA.W UNREACH_01BA22,X
    XBA
    LDA.B #$0E
    JSL.L multiply
    REP #$20
    CLC
    ADC.W entities_lut_base_offset
    STA.W $0038,Y
    TAX
    SEP #$20
    LDA.W PTR16_018002,X
    STA.W $0025,Y
    LDA.W PTR16_018005,X
    STA.W $001E,Y
    LDA.W PTR16_01800A,X
    STA.W $0024,Y
    REP #$20
    LDA.W PTR16_018008,X
    STA.W $0022,Y
    LDA.W #$0010
    STA.W $0010,Y
    STA.W $0012,Y
    STA.W $000C,Y
    STA.W $000A,Y
    LDA.W #$0000
    STA.W $0008,Y
    STA.W $000E,Y
    STA.W $0032,Y
    PLY
    PLX
    PLP

nullsub_1:
    RTL

    LDA.W $0464
    BEQ CODE_00951A
    STZ.W wButtonsPressed

CODE_00951A:
    LDA.W $0439
    BNE CODE_009524
    LDA.W playerEquippedSword
    BNE CODE_00952F

CODE_009524:
    LDY.W $039C
    LDA.W #$C000

CODE_00952A:
    TRB.W wButtonsPressed
    BRA CODE_00955F


CODE_00952F:
    JSR.W CODE_0098A1
    PHX
    DEC A
    ASL A
    TAX
    LDA.L aCannotRecalledYet,X
    CMP.W playerLevel_ASCII
    BEQ CODE_009547
    BCC CODE_009547
    LDA.W #$8000
    TRB.W wButtonsPressed

CODE_009547:
    PLX
    LDY.W $039C
    LDA.W $001E,Y
    SEC
    SBC.W #$0014
    CMP.W #$0010
    BCC CODE_009577
    LDA.W wButtonsPressed
    AND.W #$8000
    BNE CODE_009578

CODE_00955F:
    LDA.W $0016,Y
    BIT.W #$0400
    BNE CODE_00957F
    PHX
    LDA.W $001E,Y
    ASL A
    TAX
    LDA.L UNREACH_009588,X
    PLX
    AND.W wButtonsPressed
    BEQ CODE_009578

CODE_009577:
    RTL


CODE_009578:
    LDA.W #$9A65
    STA.W $0018,Y
    RTL


CODE_00957F:
    LDA.W #$9A65
    STA.W $0018,Y
    %CopSetScriptAddrToNextInstruction()
    RTL


UNREACH_009588:
    db $00,$04,$00,$08,$00,$02,$00,$01,$00,$04,$00,$08,$00,$08,$00,$04
    db $00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01
    db $00,$04,$00,$08,$00,$08,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$01,$00,$02,$00,$02
    db $00,$04,$00,$04,$00,$08,$00,$08
    LDA.W $0016,X
    ORA.W #$0010
    STA.W $0016,X
    %CopSetScriptAddrToNextInstruction()
    PHX
    LDX.W $039C
    JSR.W CODE_00969C
    BCC CODE_009630
    LDA.W $0004,X
    PHA
    LDA.W $0006,X
    PHA
    LDA.W $03D4
    STA.W $0004,X
    LDA.W $03D6
    STA.W $0006,X
    JSL.L CODE_008F28
    LDA.W $0004,X
    STA.W $03D4
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    LDA.W $0006,X
    STA.W $03D6
    CLC
    ADC.W $0002,X
    STA.W $0002,X
    PLA
    STA.W $0006,X
    PLA
    STA.W $0004,X
    BRA CODE_009633


CODE_009630:
    JSR.W CODE_009733

CODE_009633:
    LDA.W wButtonMask
    BIT.W #$0F00
    BNE CODE_009657
    LDA.W $03D4
    BNE CODE_009649
    LDA.W $0000,X
    AND.W #$FFFE
    STA.W $0000,X

CODE_009649:
    LDA.W $03D6
    BNE CODE_009657
    LDA.W $0002,X
    AND.W #$FFFE
    STA.W $0002,X

CODE_009657:
    STZ.W $03D4
    STZ.W $03D6
    LDA.W $0000,X
    STA.W player_pos_x_real
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W player_pos_x_int
    LDA.W $0002,X
    STA.W player_pos_y_real
    LSR A
    LSR A
    LSR A
    LSR A
    DEC A
    STA.W player_pos_y_int
    LDY.W $039E
    LDA.W $0000,X
    STA.W $0000,Y
    LDA.W $0002,X
    STA.W $0002,Y
    LDA.W $001E,X
    ASL A
    TAX
    LDA.W UNREACH_01FAD7,X
    CLC
    ADC.W $0002,Y
    STA.W $0002,Y
    JSL.L CODE_028000
    PLX
    RTL


CODE_00969C:
    LDA.W $0000,X
    STA.W player_pos_x_real
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W player_pos_x_int
    LDA.W $0002,X
    STA.W player_pos_y_real
    LSR A
    LSR A
    LSR A
    LSR A
    DEC A
    STA.W player_pos_y_int
    CLC
    LDY.W $03D8
    BNE CODE_0096BE
    RTS


CODE_0096BE:
    LDA.W $03A6
    BEQ CODE_0096C4
    RTS


CODE_0096C4:
    LDA.W $0000,X
    CLC
    ADC.W #$000F
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $16
    LDA.W $0002,X
    DEC A
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $18
    SEP #$20
    PHB
    LDA.W $03DA
    PHA
    PLB

CODE_0096E3:
    LDA.W $0000,Y
    INC A
    BEQ CODE_009725
    LDA.B $16
    CMP.W $0000,Y
    BCC CODE_009719
    LDA.W $0378
    CMP.W $0001,Y
    BCS CODE_009719
    LDA.B $18
    CMP.W $0002,Y
    BCC CODE_009719
    LDA.W $037A
    CMP.W $0003,Y
    BCS CODE_009719
    REP #$20
    LDA.W $0004,Y
    BEQ CODE_009711
    STA.W $03D4

CODE_009711:
    LDA.W $0006,Y
    BEQ CODE_009719
    STA.W $03D6

CODE_009719:
    REP #$20
    TYA
    CLC
    ADC.W #$0008
    TAY
    SEP #$20
    BRA CODE_0096E3


CODE_009725:
    REP #$20
    PLB
    SEC
    LDA.W $03D4
    ORA.W $03D6
    BNE CODE_009732
    CLC

CODE_009732:
    RTS


CODE_009733:
    LDA.W $0016,X
    BIT.W #$0004
    BNE CODE_00973C
    RTS


CODE_00973C:
    JSR.W CODE_009892
    BCC CODE_009742
    db $60

CODE_009742:
    AND.W #$00FF
    BEQ CODE_009754
    DEC A
    BEQ CODE_0097A1
    DEC A
    BNE CODE_009750
    BRL CODE_0097EA


CODE_009750:
    BRL CODE_00983E

    db $60

CODE_009754:
    LDA.W wButtonsPressed
    BIT.W #$0800
    BNE CODE_00975D
    RTS


CODE_00975D:
    TXY
    LDA.W $0000,X
    AND.W #$000F
    BEQ CODE_00978E
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0020
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    AND.W #$00FC
    BEQ CODE_009790
    JSL.L CODE_04F31A
    LDA.L $7F8000,X
    AND.W #$00FC
    BEQ CODE_009795

CODE_00978E:
    TYX
    RTS


CODE_009790:
    LDA.W #$FFFE
    BRA CODE_009798


CODE_009795:
    LDA.W #$0002

CODE_009798:
    TYX
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    RTS


CODE_0097A1:
    LDA.W wButtonsPressed
    BIT.W #$0400
    BNE CODE_0097AA
    RTS


CODE_0097AA:
    TXY
    LDA.W $0000,X
    AND.W #$000F
    BEQ CODE_0097D7
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    AND.W #$00F3
    BEQ CODE_0097D9
    JSL.L CODE_04F31A
    LDA.L $7F8000,X
    AND.W #$00F3
    BEQ CODE_0097DE

CODE_0097D7:
    TYX
    RTS


CODE_0097D9:
    LDA.W #$FFFE
    BRA CODE_0097E1


CODE_0097DE:
    LDA.W #$0002

CODE_0097E1:
    TYX
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    RTS


CODE_0097EA:
    LDA.W wButtonsPressed
    BIT.W #$0100
    BNE CODE_0097F3
    RTS


CODE_0097F3:
    TXY
    LDA.W $0002,X
    AND.W #$000F
    BEQ CODE_00982B
    LDA.W $0000,X
    CLC
    ADC.W #$0010
    STA.B $16
    LDA.W $0002,X
    AND.W #$FFF0
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    AND.W #$00F5
    BEQ CODE_00982D
    JSL.L CODE_04F331
    LDA.L $7F8000,X
    AND.W #$00F5
    BEQ CODE_009832

CODE_00982B:
    TYX
    RTS


CODE_00982D:
    LDA.W #$FFFE
    BRA CODE_009835


CODE_009832:
    LDA.W #$0002

CODE_009835:
    TYX
    CLC
    ADC.W $0002,X
    STA.W $0002,X
    RTS


CODE_00983E:
    LDA.W wButtonsPressed
    BIT.W #$0200
    BNE CODE_009847
    RTS


CODE_009847:
    TXY
    LDA.W $0002,X
    AND.W #$000F
    BEQ CODE_00987F
    LDA.W $0000,X
    SEC
    SBC.W #$0010
    STA.B $16
    LDA.W $0002,X
    AND.W #$FFF0
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    AND.W #$00FA
    BEQ CODE_009881
    JSL.L CODE_04F331
    LDA.L $7F8000,X
    AND.W #$00FA
    BEQ CODE_009886

CODE_00987F:
    TYX
    RTS


CODE_009881:
    LDA.W #$FFFE
    BRA CODE_009889


CODE_009886:
    LDA.W #$0002

CODE_009889:
    TYX
    CLC
    ADC.W $0002,X

CODE_00988E:
    STA.W $0002,X
    RTS


CODE_009892:
    LDY.W $001E,X
    CPY.W #$002C
    BCS CODE_00989F
    LDA.W UNREACH_01FAAB,Y
    CLC
    RTS


CODE_00989F:
    SEC
    RTS


CODE_0098A1:
    PHX
    PHA
    LDY.W $039C
    LDA.W $001E,Y
    CMP.W #$0004
    BCS CODE_0098E8
    STA.B $00
    LDA.W $0000,Y
    CLC
    ADC.W #$0008
    STA.B $16
    LDA.W $0002,Y
    CLC
    ADC.W #$0008
    STA.B $18
    LDA.W $06A6
    BRA CODE_0098CA


CODE_0098C7:
    LDA.W $003E,X

CODE_0098CA:
    TAX
    BEQ CODE_0098E8
    LDA.W $0016,X
    BMI CODE_0098C7
    BIT.W #$4000
    BEQ CODE_0098C7
    LDA.W $001E,X
    SEC
    SBC.W #$0004
    CMP.W #$0003
    BCS CODE_0098C7
    JSR.W CODE_0098EB
    BRA CODE_0098C7


CODE_0098E8:
    PLA
    PLX
    RTS


CODE_0098EB:
    LDA.B $00
    BEQ CODE_009923
    DEC A
    BEQ CODE_0098F8
    DEC A
    BEQ CODE_00994E
    BRL CODE_009979


CODE_0098F8:
    LDA.W $0002,X
    CMP.B $18
    BCC CODE_009900
    RTS


CODE_009900:
    LDA.B $16
    SEC
    SBC.W $0000,X
    CMP.W #$0011
    BCC CODE_00990C
    RTS


CODE_00990C:
    LDA.W $001E,X
    CMP.W #$0006
    BEQ CODE_00991F
    CMP.W #$0005
    BEQ CODE_00991C
    INC.W $0002,X

CODE_00991C:
    INC.W $0002,X

CODE_00991F:
    INC.W $0002,X
    RTS


CODE_009923:
    LDA.W $0002,X
    CMP.B $18
    BCS CODE_00992B
    RTS


CODE_00992B:
    LDA.B $16
    SEC
    SBC.W $0000,X
    CMP.W #$0011
    BCC CODE_009937
    RTS


CODE_009937:
    LDA.W $001E,X
    CMP.W #$0006
    BEQ CODE_00994A
    CMP.W #$0005
    BEQ CODE_009947
    DEC.W $0002,X

CODE_009947:
    DEC.W $0002,X

CODE_00994A:
    DEC.W $0002,X
    RTS


CODE_00994E:
    LDA.W $0000,X
    CMP.B $16
    BCC CODE_009956
    RTS


CODE_009956:
    LDA.B $18
    SEC
    SBC.W $0002,X
    CMP.W #$0011
    BCC CODE_009962
    RTS


CODE_009962:
    LDA.W $001E,X
    CMP.W #$0006
    BEQ CODE_009975
    CMP.W #$0005
    BEQ CODE_009972
    INC.W $0000,X

CODE_009972:
    INC.W $0000,X

CODE_009975:
    INC.W $0000,X
    RTS


CODE_009979:
    LDA.W $0000,X
    CMP.B $16
    BCS CODE_009981
    RTS

CODE_009981:
    LDA.B $18
    SEC
    SBC.W $0002,X
    CMP.W #$0011
    BCC CODE_00998D
    RTS


CODE_00998D:
    LDA.W $001E,X
    CMP.W #$0006
    BEQ CODE_0099A0
    CMP.W #$0005
    BEQ CODE_00999D
    DEC.W $0000,X

CODE_00999D:
    DEC.W $0000,X

CODE_0099A0:
    DEC.W $0000,X
    RTS


CODE_0099A4:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0380
    BEQ CODE_0099AC
    RTL


CODE_0099AC:
    PHX
    LDA.W revealingLairId
    ASL A
    TAX
    LDA.L $7F0483,X
    PLX
    TAY
    BNE CODE_0099BB
    RTL


CODE_0099BB:
    LDA.W $0000,X
    SEC
    SBC.W $0000,Y
    BMI CODE_0099E3
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $0002,Y
    BMI CODE_0099D7
    STA.B $18
    CMP.B $16
    BCS CODE_009A10
    BRA CODE_009A0B


CODE_0099D7:
    EOR.W #$FFFF
    INC A
    STA.B $18
    CMP.B $16
    BCS CODE_009A06
    BRA CODE_009A0B


CODE_0099E3:
    EOR.W #$FFFF
    INC A
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $0002,Y
    BMI CODE_0099FA
    STA.B $18
    CMP.B $16
    BCS CODE_009A10
    BRA CODE_009A15


CODE_0099FA:
    EOR.W #$FFFF
    INC A
    STA.B $18
    CMP.B $16
    BCS CODE_009A06
    BRA CODE_009A15


CODE_009A06:
    LDA.W #$0000
    BRA CODE_009A18


CODE_009A0B:
    LDA.W #$0002
    BRA CODE_009A18


CODE_009A10:
    LDA.W #$0001
    BRA CODE_009A18


CODE_009A15:
    LDA.W #$0003

CODE_009A18:
    STA.W $001E,X
    STZ.W $0020,X
    JSL.L CODE_0088F3
    STZ.W $0014,X
    %CopSetScriptAddrToNextInstruction()
    RTL


CODE_009A28:
    STX.W $039C
    COP #$A9
    db $00,$30,$7F
    COP #$84
    db $56,$AF,$00
    LDA.W lairRevealInProgress
    BEQ CODE_009A3D
    BRL CODE_0099A4


CODE_009A3D:

    COP #$84
    db $E0,$9F,$00
    LDA.W $0016,Y
    AND.W #$CF7F
    ORA.W #$0310
    STA.W $0016,Y
    STY.W $03A0
    COP #$84
    db $12,$95,$00
    COP #$85
    db $E0,$95,$00
    COP #$85
    db $CF,$9F,$00
    STY.W $039E
    %CopSetScriptAddrToNextInstruction()

CODE_009A65:
    LDA.W $0016,X
    BIT.W #$0400
    BEQ CODE_009A70
    BRL CODE_009ED3


CODE_009A70:
    LDA.W $0439
    BNE CODE_009A7A
    LDA.W playerEquippedSword
    BNE CODE_009ACD

CODE_009A7A:
    LDA.W wButtonsPressed
    BIT.W #$0030
    BNE CODE_009A9E
    EOR.W #$FFFF
    XBA
    LSR A
    BCS CODE_009A8C
    BRL CODE_009E0D


CODE_009A8C:
    LSR A
    BCS CODE_009A92
    BRL CODE_009DEF


CODE_009A92:
    LSR A
    BCS CODE_009A98
    BRL CODE_009DD1


CODE_009A98:
    LSR A
    BCS CODE_009A9E
    BRL CODE_009DB3


CODE_009A9E:
    PHX
    LDA.W $001E,X
    ASL A
    CLC
    ADC.W $001E,X
    ASL A
    ASL A
    TAX
    LDA.W wButtonsPressed
    INX
    INX
    XBA
    LSR A
    BCS CODE_009AC4
    INX
    INX
    LSR A
    BCS CODE_009AC4
    INX
    INX
    LSR A
    BCS CODE_009AC4
    INX
    INX
    LSR A
    BCS CODE_009AC4
    INX
    INX

CODE_009AC4:
    LDA.L UNREACH_009B2B,X
    PLX
    DEC A
    PHA
    CLC
    RTS


CODE_009ACD:
    LDA.W wButtonsPressed
    BIT.W #$8030
    BNE CODE_009AEE
    XBA
    LSR A
    BCC CODE_009ADC
    BRL CODE_009E0D


CODE_009ADC:
    LSR A
    BCC CODE_009AE2
    BRL CODE_009DEF


CODE_009AE2:
    LSR A
    BCC CODE_009AE8
    BRL CODE_009DD1


CODE_009AE8:
    LSR A
    BCC CODE_009AEE
    BRL CODE_009DB3


CODE_009AEE:
    PHX
    LDA.W $001E,X
    ASL A
    CLC
    ADC.W $001E,X
    ASL A
    ASL A
    TAX
    LDA.W wButtonsPressed
    BIT.W #$8000
    BNE CODE_009B19
    INX
    INX
    XBA
    LSR A
    BCS CODE_009B19
    INX
    INX
    LSR A
    BCS CODE_009B19
    INX
    INX
    LSR A
    BCS CODE_009B19
    INX
    INX
    LSR A
    BCS CODE_009B19
    INX
    INX

CODE_009B19:
    CLC
    LDA.W wButtonsPressed
    BIT.W #$0030
    BNE CODE_009B23
    SEC

CODE_009B23:
    LDA.L UNREACH_009B2B,X
    PLX
    DEC A
    PHA
    RTS


UNREACH_009B2B:
    db $1B,$9F,$B7,$9E,$8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$FB,$9E,$A9,$9E
    db $7F,$9E,$55,$9E,$B3,$9D,$3B,$9D,$3B,$9F,$C5,$9E,$EF,$9D,$63,$9E
    db $39,$9E,$77,$9D,$5B,$9F,$0D,$9E,$9B,$9E,$71,$9E,$47,$9E,$95,$9D
    db $1B,$9F,$B7,$9E,$8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$1B,$9F,$B7,$9E
    db $8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$FB,$9E,$A9,$9E,$7F,$9E,$55,$9E
    db $B3,$9D,$3B,$9D,$FB,$9E,$A9,$9E,$7F,$9E,$55,$9E,$B3,$9D,$3B,$9D
    db $3B,$9F,$C5,$9E,$EF,$9D,$63,$9E,$39,$9E,$77,$9D,$3B,$9F,$C5,$9E
    db $EF,$9D,$63,$9E,$39,$9E,$77,$9D,$5B,$9F,$0D,$9E,$9B,$9E,$71,$9E
    db $47,$9E,$95,$9D,$5B,$9F,$0D,$9E,$9B,$9E,$71,$9E,$47,$9E,$95,$9D
    db $1B,$9F,$B7,$9E,$8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$1B,$9F,$B7,$9E
    db $8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$FB,$9E,$A9,$9E,$7F,$9E,$55,$9E
    db $B3,$9D,$3B,$9D,$FB,$9E,$A9,$9E,$7F,$9E,$55,$9E,$B3,$9D,$3B,$9D
    db $3B,$9F,$C5,$9E,$EF,$9D,$63,$9E,$39,$9E,$77,$9D,$3B,$9F,$C5,$9E
    db $EF,$9D,$63,$9E,$39,$9E,$77,$9D,$5B,$9F,$0D,$9E,$9B,$9E,$71,$9E
    db $47,$9E,$95,$9D,$5B,$9F,$0D,$9E,$9B,$9E,$71,$9E,$47,$9E,$95,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D,$3B,$9D
    db $1B,$9F,$B7,$9E,$8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$FB,$9E,$A9,$9E
    db $7F,$9E,$55,$9E,$B3,$9D,$3B,$9D,$3B,$9F,$C5,$9E,$EF,$9D,$63,$9E
    db $39,$9E,$77,$9D,$5B,$9F,$0D,$9E,$9B,$9E,$71,$9E,$47,$9E,$95,$9D
    db $5B,$9F,$0D,$9E,$9B,$9E,$71,$9E,$47,$9E,$95,$9D,$5B,$9F,$0D,$9E
    db $9B,$9E,$71,$9E,$47,$9E,$95,$9D,$3B,$9F,$C5,$9E,$EF,$9D,$63,$9E
    db $39,$9E,$77,$9D,$3B,$9F,$C5,$9E,$EF,$9D,$63,$9E,$39,$9E,$77,$9D
    db $1B,$9F,$B7,$9E,$8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$1B,$9F,$B7,$9E
    db $8D,$9E,$D1,$9D,$2B,$9E,$59,$9D,$FB,$9E,$A9,$9E,$7F,$9E,$55,$9E
    db $B3,$9D,$3B,$9D,$FB,$9E,$A9,$9E,$7F,$9E,$55,$9E,$B3,$9D,$3B,$9D
    BCS CODE_009D4B
    LDA.W #$0001
    JSR.W CODE_009F9D
    COP #$80
    db $01
    COP #$82
    BRL CODE_009A65


CODE_009D4B:
    LDA.W #$002B
    JSR.W CODE_009F9D
    COP #$80
    db $2B
    COP #$82
    BRL CODE_009A65

    BCS CODE_009D69
    LDA.W #$0000
    JSR.W CODE_009F9D
    COP #$80
    db $00
    COP #$82
    BRL CODE_009A65


CODE_009D69:
    LDA.W #$0029
    JSR.W CODE_009F9D
    COP #$80
    db $29
    COP #$82
    BRL CODE_009A65

    BCS CODE_009D87
    LDA.W #$0002
    JSR.W CODE_009F9D
    COP #$80
    db $02
    COP #$82
    BRL CODE_009A65


CODE_009D87:
    LDA.W #$0027
    JSR.W CODE_009F9D
    COP #$80
    db $27
    COP #$82
    BRL CODE_009A65

    BCS CODE_009DA5
    LDA.W #$0003
    JSR.W CODE_009F9D
    COP #$80
    db $03
    COP #$82
    BRL CODE_009A65


CODE_009DA5:
    LDA.W #$0024
    JSR.W CODE_009F9D
    COP #$80
    db $24
    COP #$82
    BRL CODE_009A65


CODE_009DB3:
    BCS CODE_009DC3
    LDA.W #$0006
    JSR.W CODE_009F9D
    COP #$80
    db $06
    COP #$82
    BRL CODE_009A65


CODE_009DC3:
    LDA.W #$002A
    JSR.W CODE_009F9D
    COP #$80
    db $2A
    COP #$82
    BRL CODE_009A65


CODE_009DD1:
    BCS CODE_009DE1
    LDA.W #$0004
    JSR.W CODE_009F9D
    COP #$80
    db $04
    COP #$82
    BRL CODE_009A65


CODE_009DE1:
    LDA.W #$0028
    JSR.W CODE_009F9D
    COP #$80
    db $28
    COP #$82
    BRL CODE_009A65


CODE_009DEF:
    BCS CODE_009DFF
    LDA.W #$0008
    JSR.W CODE_009F9D
    COP #$80
    db $08
    COP #$82
    BRL CODE_009A65


CODE_009DFF:
    LDA.W #$0026
    JSR.W CODE_009F9D
    COP #$80
    db $26
    COP #$82
    BRL CODE_009A65


CODE_009E0D:
    BCS CODE_009E1D
    LDA.W #$000A
    JSR.W CODE_009F9D
    COP #$80
    db $0A
    COP #$82
    BRL CODE_009A65


CODE_009E1D:
    LDA.W #$0025
    JSR.W CODE_009F9D
    COP #$80
    db $25
    COP #$82
    BRL CODE_009A65

    LDA.W #$0005
    JSR.W CODE_009F9D
    COP #$80
    db $05
    COP #$82
    BRL CODE_009A65

    LDA.W #$0011
    JSR.W CODE_009F9D
    COP #$80
    db $11
    COP #$82
    BRL CODE_009A65

    LDA.W #$0012
    JSR.W CODE_009F9D
    COP #$80
    db $12
    COP #$82
    BRL CODE_009A65

    LDA.W #$0007
    JSR.W CODE_009F9D
    COP #$80
    db $07
    COP #$82
    BRL CODE_009A65

    LDA.W #$0010
    JSR.W CODE_009F9D
    COP #$80
    db $10
    COP #$82
    BRL CODE_009A65

    LDA.W #$0013
    JSR.W CODE_009F9D
    COP #$80
    db $13
    COP #$82
    BRL CODE_009A65

    LDA.W #$000E
    JSR.W CODE_009F9D
    COP #$80
    db $0E
    COP #$82
    BRL CODE_009A65

    LDA.W #$000D
    JSR.W CODE_009F9D
    COP #$80
    db $0D
    COP #$82
    BRL CODE_009A65

    LDA.W #$000B
    JSR.W CODE_009F9D
    COP #$80
    db $0B
    COP #$82
    BRL CODE_009A65

    LDA.W #$000F
    JSR.W CODE_009F9D
    COP #$80
    db $0F
    COP #$82
    BRL CODE_009A65

    LDA.W #$000C
    JSR.W CODE_009F9D
    COP #$80
    db $0C
    COP #$82
    BRL CODE_009A65

    LDA.W #$0009
    JSR.W CODE_009F9D
    COP #$80
    db $09
    COP #$82
    BRL CODE_009A65


CODE_009ED3:
    SEP #$20
    LDA.B #$0B
    STA.W $0024,X
    LDY.W $039E
    LDA.B #$0C
    STA.W $0024,Y
    REP #$20
    BRK #$84
    LDA.W #$001C
    JSR.W CODE_009F9D
    COP #$80
    db $1C
    COP #$82
    LDA.W actId
    INC A
    STA.W zwSceneId
    %CopSetScriptAddrToNextInstruction()
    RTL

    BRK #$01
    JSR.W CastPhoenix
    BCS CODE_009F07
    COP #$84
    db $78,$A6,$00

CODE_009F07:
    LDA.W #$8000
    TRB.W zwSomethingWithButtons
    LDA.W #$0021
    JSR.W CODE_009F9D
    COP #$80
    db $21
    COP #$82
    BRL CODE_009A65

    BRK #$01
    JSR.W CastPhoenix
    BCS CODE_009F27
    COP #$84
    db $8D,$A6,$00

CODE_009F27:
    LDA.W #$8000
    TRB.W zwSomethingWithButtons
    LDA.W #$0020
    JSR.W CODE_009F9D
    COP #$80
    db $20
    COP #$82
    BRL CODE_009A65

    BRK #$01
    JSR.W CastPhoenix
    BCS CODE_009F47
    COP #$84
    db $A4,$A6,$00

CODE_009F47:
    LDA.W #$8000
    TRB.W zwSomethingWithButtons
    LDA.W #$0022
    JSR.W CODE_009F9D
    COP #$80
    db $22
    COP #$82
    BRL CODE_009A65

    BRK #$01
    JSR.W CastPhoenix
    BCS CODE_009F67
    COP #$84
    db $B9,$A6,$00

CODE_009F67:
    LDA.W #$8000
    TRB.W zwSomethingWithButtons
    LDA.W #$0023
    JSR.W CODE_009F9D
    COP #$80
    db $23
    COP #$82
    BRL CODE_009A65


CastPhoenix:
    LDA.W playerEquippedSword
    CMP.W #$0008
    BNE CODE_009F9B
    LDA.W playerEquippedArmor
    CMP.W #$0010
    BNE CODE_009F9B
    LDA.W playerEquippedMagic
    CMP.W #$0018
    BNE CODE_009F9B
    COP #$26
    db $02,$00,$9B,$9F
    CLC
    RTS

CODE_009F9B:
    SEC
    RTS


CODE_009F9D:
    LDY.W $003E,X
    STA.W $001E,Y
    SEC
    SBC.W #$0020
    CMP.W #$0004
    BCS CODE_009FB5
    LDA.W strengthFromItem
    CLC
    ADC.W strengthFromLevel
    BRA CODE_009FB8


CODE_009FB5:
    LDA.W strengthFromItem

CODE_009FB8:
    STA.W $1B8C
    LDA.W defenseFromItem
    CLC
    ADC.W defenseFromLevel
    STA.W $1B8E
    LDA.W #$0000
    STA.W $0020,Y
    STA.W $0014,Y
    RTS

    LDA.W $0016,X
    AND.W #$CEFF
    STA.W $0016,X
    INC.W $0024,X
    %CopSetScriptAddrToNextInstruction()
    COP #$82
    RTL

    LDA.W $0016,X
    ORA.W #$2000
    STA.W $0016,X
    LDA.W lairRevealInProgress
    BNE CODE_00A013
    LDA.W playerSouls
    BEQ CODE_00A016

CODE_009FF3:
    LDA.W $0016,X
    AND.W #$DFFF
    STA.W $0016,X
    COP #$85
    db $26,$A0,$00
    COP #$A8
    db $00,$80,$0E
    COP #$A3
    COP #$A2
    db $30

CODE_00A00B:
    COP #$81
    db $08,$10
    COP #$83
    BRA CODE_00A00B


CODE_00A013:
    %CopSetScriptAddrToNextInstruction()
    RTL


CODE_00A016:
    %CopSetScriptAddrToNextInstruction()
    LDA.W playerSouls
    BNE CODE_00A01E
    RTL


CODE_00A01E:
    STZ.W $0000,X
    STZ.W $0002,X
    BRA CODE_009FF3

    LDA.W $0016,X
    ORA.W #$0010
    STA.W $0016,X
    %CopSetScriptAddrToNextInstruction()
    PHX
    JSR.W checkWhichMagicToCast
    BCC CODE_00A03A
    BRL CODE_00A108


CODE_00A03A:
    LDA.W wButtonsPressed
    LDY.W #$0002
    BIT.W #$0100
    BNE CODE_00A050
    LDY.W #$FFFE
    BIT.W #$0200
    BNE CODE_00A050
    LDY.W #$0000

CODE_00A050:
    STY.B $16
    LDY.W #$0002
    BIT.W #$0400
    BNE CODE_00A065
    LDY.W #$FFFE
    BIT.W #$0800
    BNE CODE_00A065
    LDY.W #$0000

CODE_00A065:
    STY.B $18
    LDA.W player_pos_x_real
    SEC
    SBC.W $0000,X
    BEQ CODE_00A08A
    BPL CODE_00A081
    EOR.W #$FFFF
    INC A
    DEC.B $16
    CMP.W #$0060
    BCC CODE_00A08A
    DEC.B $16
    BRA CODE_00A08A


CODE_00A081:
    INC.B $16
    CMP.W #$0050
    BCC CODE_00A08A
    INC.B $16

CODE_00A08A:
    LDA.W $0000,X
    CLC
    ADC.B $16
    STA.W $0000,X
    STA.B $16
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BEQ CODE_00A0B8
    BPL CODE_00A0AF
    EOR.W #$FFFF
    INC A
    DEC.B $18
    CMP.W #$0040
    BCC CODE_00A0B8
    DEC.B $18
    BRA CODE_00A0B8


CODE_00A0AF:
    INC.B $18
    CMP.W #$0050
    BCC CODE_00A0B8
    INC.B $18

CODE_00A0B8:
    LDA.W $0002,X
    CLC
    ADC.B $18
    STA.W $0002,X
    STA.B $18
    LDY.W soundIdBank,X
    LDA.W orbPosition
    ASL A
    AND.W #$00FF
    TAX
    SEP #$20
    LDA.B #$00
    XBA
    LDA.W UNREACH_01FC84,X
    BPL CODE_00A0E1
    XBA
    DEC A
    XBA
    SEC
    ROR A
    SEC
    ROR A
    BRA CODE_00A0E3


CODE_00A0E1:
    LSR A
    LSR A

CODE_00A0E3:
    REP #$20
    CLC
    ADC.B $16
    STA.W $0000,Y
    SEP #$20
    LDA.B #$00
    XBA
    LDA.W UNREACH_01FCC4,X
    BPL CODE_00A0FE
    XBA
    DEC A
    XBA
    SEC
    ROR A
    SEC
    ROR A
    BRA CODE_00A100


CODE_00A0FE:
    LSR A
    LSR A

CODE_00A100:
    REP #$20
    CLC
    ADC.B $18
    STA.W $0002,Y

CODE_00A108:
    PLX
    RTL


checkWhichMagicToCast:
    LDA.W $0439
    BNE endCastMagic
    LDA.W $03A6
    BNE endCastMagic
    LDA.W playerEquippedMagic
    BEQ endCastMagic
    LDA.B ($4A)
    BEQ endCastMagic
    LDA.W magicInUse
    BEQ checkYKey
    LDA.W playerEquippedMagic
    SEC
    SBC.W #$0011
    BEQ CODE_00A176
    DEC A
    BEQ CODE_00A186
    db $3A,$F0,$32,$3A,$F0,$6C,$3A,$F0,$2C,$3A,$F0,$29,$3A,$F0,$26,$82
    db $23,$00

checkYKey:
    LDA.W wButtonsPressed
    BIT.W #$4000
    BEQ endCastMagic
    LDA.W playerEquippedMagic
    SEC
    SBC.W #$0011
    BEQ castFlameball
    DEC A
    BEQ castLightArrows
    DEC A
    BEQ castMagicFlair
    DEC A
    BEQ castRotator
    DEC A
    BEQ castSparkBomb
    DEC A
    BEQ castFlamePillar
    DEC A
    BEQ castTornado

endCastMagic:
    INC.W orbPosition
    CLC
    RTS


castFlameball:
    COP #$26
    db $04,$00,$63,$A1
    INC.W magicInUse
    COP #$85
    db $D5,$A1,$00

CODE_00A176:
    SEC
    RTS


castLightArrows:
    COP #$26
    db $08,$00,$63,$A1
    INC.W magicInUse
    COP #$85
    db $46,$A2,$00

CODE_00A186:
    SEC
    RTS

castMagicFlair:
    db $02,$26,$08,$00,$63,$A1,$EE,$33,$04,$02,$85,$F1,$A2,$00,$80,$CB

castRotator:
    db $EE,$33,$04,$02,$85,$DD,$A3,$00,$EE,$31,$04,$80,$BE

castSparkBomb:
    db $02,$26,$08,$00,$63,$A1,$EE,$33,$04,$02,$85,$39,$A4,$00,$80,$AE

castFlamePillar:
    db $02,$26,$20,$00,$63,$A1,$EE,$33,$04,$02,$85,$9D,$A4,$00,$80,$9E

castTornado:
    db $02,$26,$08,$00,$63,$A1,$EE,$33,$04,$02,$85,$F8,$A4,$00,$80,$8E
    LDA.W #$03A0
    STA.W $0016,X
    LDA.W #$0005
    STA.W $0030,X
    LDY.W $03A0
    LDA.W $0000,Y
    STA.W $0000,X
    LDA.W $0002,Y
    STA.W $0002,X
    COP #$A3
    COP #$A2
    db $30
    COP #$A8
    db $00,$80,$0F
    COP #$80
    db $00
    COP #$82
    BRK #$1B
    LDA.W #$02A0
    STA.W $0016,X
    LDY.W $039C
    LDA.W $001E,Y
    TAY
    LDA.W UNREACH_01FA7F,Y
    AND.W #$00FF
    BEQ CODE_00A21E
    DEC A
    BEQ CODE_00A220
    DEC A
    BEQ CODE_00A225
    BRA CODE_00A227


CODE_00A21E:
    COP #$98

CODE_00A220:
    LDA.W #$0002
    BRA CODE_00A22A


CODE_00A225:
    COP #$96

CODE_00A227:
    LDA.W #$0001

CODE_00A22A:
    STA.W $001E,X
    STZ.W $0020,X
    LDA.W #$0008
    STA.W $002A,X
    LDA.W #$4000
    TRB.W zwSomethingWithButtons
    STZ.W magicInUse
    %CopSetScriptAddrToNextInstruction()
    COP #$83
    COP #$86
    RTL

    LDA.W #$03A0
    STA.W $0016,X
    LDY.W $03A0
    LDA.W $0000,Y
    STA.W $0000,X
    LDA.W $0002,Y
    STA.W $0002,X
    COP #$A3
    COP #$A2
    db $30
    COP #$A8
    db $00,$80,$0F
    COP #$80
    db $03
    COP #$82
    BRK #$12
    COP #$B2
    db $A0,$A2,$00,$00,$00,$F8,$FF,$A0,$02
    COP #$B2
    db $B5,$A2,$00,$00,$00,$08,$00,$A0,$02
    COP #$B2
    db $C8,$A2,$00,$F8,$FF,$00,$00,$A0,$02
    COP #$B2
    db $DB,$A2,$00,$08,$00,$00,$00,$A0,$02
    COP #$80
    db $04
    COP #$82
    BRL CODE_00A6E7
    LDA.W #$000A
    STA.W $0030,X
    COP #$98
    COP #$80
    db $07
    COP #$82
    COP #$81
    db $08,$08
    COP #$83
    BRA CODE_00A2EE
    LDA.W #$000A
    STA.W $0030,X
    COP #$80
    db $07
    COP #$82
    COP #$81
    db $08,$08
    COP #$83
    BRA CODE_00A2EE
    LDA.W #$000A
    STA.W $0030,X
    COP #$80
    db $05
    COP #$82
    COP #$81
    db $06,$08
    COP #$83
    BRA CODE_00A2EE
    LDA.W #$000A
    STA.W $0030,X
    COP #$96
    COP #$80
    db $05
    COP #$82
    COP #$81
    db $06,$08
    COP #$83

CODE_00A2EE:
    COP #$86
    RTL
    db $A9,$A0,$03,$9D,$16,$00,$A9,$14,$00,$9D,$30,$00,$02,$85,$B1,$A3
    db $00,$02,$A3,$02,$A2,$30,$02,$A8,$00,$80,$0F,$02,$03,$05,$02,$80
    db $09,$02,$82,$AD,$22,$03,$89,$00,$40,$F0,$35,$02,$04,$02,$03,$05
    db $02,$80,$0A,$02,$82,$AD,$22,$03,$89,$00,$40,$F0,$3B,$02,$04,$02
    db $03,$05,$02,$80,$0B,$02,$82,$AD,$22,$03,$89,$00,$40,$F0,$41,$02
    db $04,$02,$80,$0C,$02,$82,$AD,$22,$03,$89,$00,$40,$F0,$4A,$80,$F1
    db $A9,$A0,$02,$9D,$16,$00,$02,$A3,$02,$81,$0D,$03,$02,$83,$00,$21
    db $02,$80,$10,$02,$82,$82,$7E,$03,$A9,$A0,$02,$9D,$16,$00,$02,$A3
    db $02,$81,$0E,$03,$02,$83,$00,$21,$02,$80,$11,$02,$82,$82,$66,$03
    db $A9,$A0,$02,$9D,$16,$00,$02,$A3,$02,$81,$0E,$03,$02,$83,$00,$21
    db $02,$80,$12,$02,$82,$82,$4E,$03,$A9,$A0,$02,$9D,$16,$00,$02,$A3
    db $02,$81,$0E,$03,$02,$83,$00,$21,$02,$80,$13,$02,$82,$82,$36,$03
    db $BD,$16,$00,$09,$10,$00,$9D,$16,$00,$02,$91,$AD,$22,$03,$89,$00
    db $40,$F0,$16,$DA,$AC,$A0,$03,$BD,$3C,$00,$AA,$B9,$00,$00,$9D,$00
    db $00,$B9,$02,$00,$9D,$02,$00,$FA,$6B,$02,$86,$6B,$A9,$20,$20,$9D
    db $16,$00,$AD,$22,$03,$89,$00,$40,$D0,$03,$82,$F9,$02,$02,$26,$01
    db $00,$E7,$A6,$02,$B0,$01,$A4,$00,$B0,$02,$02,$1B,$E3,$A3,$04,$00
    db $AC,$A0,$03,$B9,$00,$00,$9D,$00,$00,$B9,$02,$00,$9D,$02,$00,$A9
    db $05,$00,$9D,$30,$00,$02,$A3,$02,$A2,$30,$02,$A8,$00,$80,$0F,$00
    db $24,$02,$80,$14,$02,$82,$02,$80,$15,$02,$82,$02,$80,$16,$02,$82
    db $02,$80,$17,$02,$82,$02,$86,$6B,$A9,$20,$20,$9D,$16,$00,$9C,$33
    db $04,$02,$03,$04,$02,$B0,$57,$A4,$00,$A0,$03,$02,$1B,$52,$A4,$10
    db $00,$02,$04,$02,$86,$6B,$EE,$33,$04,$A9,$1E,$00,$9D,$30,$00,$AC
    db $A0,$03,$B9,$00,$00,$9D,$00,$00,$B9,$02,$00,$9D,$02,$00,$02,$A4
    db $02,$A8,$00,$80,$0F,$02,$81,$18,$04,$02,$83,$02,$81,$19,$04,$02
    db $83,$A9,$A0,$02,$9D,$16,$00,$00,$21,$02,$80,$1A,$02,$82,$CE,$33
    db $04,$D0,$06,$A9,$00,$40,$1C,$2A,$03,$02,$86,$6B,$A9,$20,$20,$9D
    db $16,$00,$9C,$33,$04,$02,$03,$04,$02,$B0,$BB,$A4,$00,$A0,$02,$02
    db $1B,$B6,$A4,$10,$00,$02,$04,$02,$86,$6B,$EE,$33,$04,$A9,$06,$00
    db $9D,$30,$00,$AC,$A0,$03,$B9,$00,$00,$9D,$00,$00,$B9,$02,$00,$9D
    db $02,$00,$02,$A8,$00,$80,$0F,$00,$0B,$02,$80,$1C,$02,$82,$02,$81
    db $1B,$14,$02,$83,$02,$80,$1D,$02,$82,$CE,$33,$04,$D0,$06,$A9,$00
    db $40,$1C,$2A,$03,$02,$86,$6B,$A9,$A0,$02,$9D,$16,$00,$02,$85,$66
    db $A6,$00,$AC,$A0,$03,$B9,$00,$00,$9D,$00,$00,$B9,$02,$00,$38,$E9
    db $10,$00,$9D,$02,$00,$02,$A8,$00,$80,$0F,$02,$A2,$30,$02,$81,$24
    db $04,$02,$83,$00,$16,$02,$80,$25,$02,$82,$A9,$0F,$00,$9D,$30,$00
    db $02,$03,$3C,$02,$80,$27,$02,$82,$02,$1F,$A9,$02,$03,$29,$03,$00
    db $D0,$03,$82,$67,$00,$3A,$D0,$03,$82,$8D,$00,$3A,$D0,$03,$82,$B0
    db $00,$82,$D6,$00,$02,$80,$28,$02,$82,$80,$51,$02,$80,$1F,$02,$82
    db $82,$C7,$00,$02,$80,$1E,$02,$82,$82,$96,$00,$02,$80,$29,$02,$82
    db $80,$66,$02,$80,$2B,$02,$82,$80,$33,$02,$80,$2D,$02,$82,$82,$A9
    db $00,$02,$80,$20,$02,$82,$80,$79,$02,$80,$22,$02,$82,$80,$49,$02
    db $80,$21,$02,$82,$82,$93,$00,$02,$80,$23,$02,$82,$80,$0E,$02,$80
    db $2A,$02,$82,$80,$33,$02,$80,$2C,$02,$82,$80,$55,$DE,$2E,$00,$D0
    db $03,$82,$9F,$00,$BD,$16,$00,$89,$00,$80,$F0,$03,$82,$94,$00,$02
    db $1F,$AD,$02,$03,$29,$03,$00,$F0,$8B,$3A,$D0,$03,$82,$AA,$FF,$3A
    db $D0,$03,$82,$C9,$FF,$82,$5B,$FF,$DE,$2E,$00,$F0,$76,$BD,$16,$00
    db $89,$00,$80,$D0,$6E,$02,$1F,$AD,$02,$03,$29,$03,$00,$D0,$03,$82
    db $79,$FF,$3A,$D0,$03,$82,$7A,$FF,$3A,$D0,$03,$82,$A7,$FF,$82,$32
    db $FF,$DE,$2E,$00,$F0,$4D,$BD,$16,$00,$89,$00,$80,$D0,$45,$02,$1F
    db $AD,$02,$03,$29,$03,$00,$D0,$03,$82,$48,$FF,$3A,$D0,$03,$82,$67
    db $FF,$3A,$D0,$03,$82,$68,$FF,$82,$09,$FF,$DE,$2E,$00,$F0,$24,$BD
    db $16,$00,$89,$00,$80,$D0,$1C,$02,$1F,$AD,$02,$03,$29,$03,$00,$D0
    db $03,$82,$17,$FF,$3A,$D0,$03,$82,$37,$FF,$3A,$D0,$03,$82,$47,$FF
    db $82,$E0,$FE,$02,$81,$26,$02,$02,$83,$A9,$00,$40,$1C,$2A,$03,$9C
    db $33,$04,$02,$86,$6B,$02,$A8,$00,$80,$0D,$02,$92,$42,$02,$94,$AD
    db $33,$04,$D0,$F6,$02,$86,$6B
    JSR.W CODE_00A6D0
    COP #$A0
    db $F0,$FF
    COP #$80
    db $30
    COP #$82
    COP #$81
    db $31,$08
    COP #$83
    COP #$86
    RTL
    JSR.W CODE_00A6D0
    COP #$A0
    db $10,$00
    COP #$98
    COP #$80
    db $30
    COP #$82
    COP #$81
    db $31,$08
    COP #$83
    COP #$86
    RTL
    JSR.W CODE_00A6D0
    COP #$A0
    db $F0,$FF
    COP #$80
    db $2E
    COP #$82
    COP #$81
    db $2F,$08
    COP #$83
    COP #$86
    RTL
    JSR.W CODE_00A6D0
    COP #$96
    COP #$A0
    db $F0,$FF
    COP #$80
    db $2E
    COP #$82
    COP #$81
    db $2F,$08
    COP #$83
    COP #$86
    RTL

CODE_00A6D0:
    LDA.W #$02A0
    STA.W $0016,X
    LDA.W #$0014
    STA.W $0030,X
    COP #$A3
    COP #$A2
    db $30
    COP #$A8
    db $00,$80,$0F
    RTS

CODE_00A6E7:
    LDA.W #$4000
    TRB.W zwSomethingWithButtons
    STZ.W magicInUse
    COP #$86
    RTL
    JSR.W CODE_00A842

CODE_00A6F6:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00A701
    RTL


CODE_00A701:
    LDA.B ($4A)
    BNE CODE_00A709
    db $02,$27,$F8,$A6

CODE_00A709:
    BRK #$53
    JSR.W CODE_00A8ED
    JSR.W CODE_00A913
    %CopSetScriptAddrToNextInstruction()
    JSR.W CODE_00A8C6
    BCC CODE_00A6F6
    JMP.W CODE_00A871

    JSR.W CODE_00A842
    LDA.W $002E,X
    AND.W #$00FF
    STA.W $002C,X

CODE_00A727:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00A732
    RTL


CODE_00A732:
    LDA.B ($4A)
    BNE CODE_00A73A
    db $02,$27,$29,$A7

CODE_00A73A:
    BRK #$53
    JSR.W CODE_00A8ED
    JSR.W CODE_00A913
    DEC.W $002C,X
    BNE CODE_00A727
    %CopSetScriptAddrToNextInstruction()
    JSR.W CODE_00A8C6
    BCS CODE_00A74F
    RTL


CODE_00A74F:
    JMP.W CODE_00A871

    JSR.W CODE_00A842
    LDA.W $002E,X
    AND.W #$00FF
    STA.B $0C
    LDA.W $0026,X
    ASL A
    TAY
    LDA.W UNREACH_01EE8E,Y
    STA.B $00

CODE_00A767:
    JSR.W CODE_00A8ED
    LDA.W #$A95E
    STA.W $0018,Y
    LDA.B ($00)
    INC.B $00
    INC.B $00
    STA.W $0000,Y
    LDA.B ($00)
    INC.B $00
    INC.B $00
    STA.W $0002,Y
    LDA.W $001C,Y
    AND.W #$3FFF
    ORA.B ($00)
    INC.B $00
    INC.B $00
    STA.W $001C,Y
    DEC.B $0C
    BNE CODE_00A767
    %CopSetScriptAddrToNextInstruction()
    JSR.W CODE_00A8C6
    BCS CODE_00A79D
    RTL


CODE_00A79D:
    JMP.W CODE_00A871

    db $20,$42,$A8,$02,$91,$BD,$16,$00,$89,$00,$80,$F0,$01,$6B,$B2,$4A
    db $D0,$04,$02,$27,$A5,$A7,$00,$53,$20,$ED,$A8,$BD,$1C,$00,$18,$69
    db $00,$40,$9D,$1C,$00,$20,$13,$A9,$02,$91,$20,$C6,$A8,$90,$D4,$4C
    db $71,$A8
    JSR.W CODE_00A842
    LDA.W $002E,X
    AND.W #$00FF
    STA.W $002C,X

CODE_00A7DE:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00A7E9
    RTL

CODE_00A7E9:
    LDA.B ($4A)
    BNE CODE_00A7F1
    db $02,$27,$E0,$A7

CODE_00A7F1:
    BRK #$53
    JSR.W CODE_00A8ED
    LDA.W $001C,X
    CLC
    ADC.W #$4000
    STA.W $001C,X
    JSR.W CODE_00A913
    DEC.W $002C,X
    BNE CODE_00A7DE
    %CopSetScriptAddrToNextInstruction()
    JSR.W CODE_00A8C6
    BCS CODE_00A810
    RTL

CODE_00A810:
    JMP.W CODE_00A871
    JSR.W CODE_00A842

CODE_00A816:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00A821
    RTL

CODE_00A821:
    COP #$0C
    db $00,$02,$28,$A8
    RTL
    LDA.B ($4A)
    BNE CODE_00A830
    db $02,$27,$18,$A8

CODE_00A830:
    BRK #$53
    JSR.W CODE_00A8ED
    JSR.W CODE_00A913
    %CopSetScriptAddrToNextInstruction()
    JSR.W CODE_00A8C6
    BCC CODE_00A816
    JMP.W CODE_00A871

CODE_00A842:
    TXY
    LDA.W $002C,X
    BNE CODE_00A85E
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    TXA
    STA.W $002C,Y

CODE_00A85E:
    LDX.W $002C,Y
    LDA.L $7E8000,X
    TYX
    AND.W #$00FF
    CMP.W #$00FD
    BEQ CODE_00A870
    PLA
    RTL


CODE_00A870:
    RTS


CODE_00A871:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $1C7B
    BEQ CODE_00A879
    RTL

CODE_00A879:
    PHX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    LDA.W $0034,X
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX
    SEP #$20
    LDA.W UNREACH_01BA15,X
    BEQ CODE_00A8A0
    LDA.B #$FE
    JSL.L CODE_0287AC
    BRA CODE_00A8A6

CODE_00A8A0:
    LDA.B #$FE
    JSL.L CODE_0286F1

CODE_00A8A6:
    PLX
    REP #$20
    COP #$A8
    db $00,$80,$0E
    LDA.W #$0310
    STA.W $0016,X
    STZ.W $001C,X
    COP #$A3
    COP #$A2
    db $30
    BRK #$83
    COP #$80
    db $01
    COP #$82
    COP #$86
    RTL


CODE_00A8C6:
    SEP #$20
    LDA.W $002E,X
    CMP.W $002F,X
    REP #$20
    BNE CODE_00A8D4
    PLA
    RTL


CODE_00A8D4:
    TXY
    LDA.W $0034,X
    TAX
    SEP #$20
    LDA.W $002E,Y
    STA.W $002F,Y
    CLC
    BNE CODE_00A8E9
    SEC
    STA.L $7F0203,X

CODE_00A8E9:
    REP #$20
    TYX
    RTS


CODE_00A8ED:
    PHX
    JSR.W CODE_00E662
    LDA.W $0038,X
    TAX
    LDA.W PTR16_018006,X
    ORA.W #$8000
    STA.W $0016,Y
    LDA.W #$A928
    STA.W $0018,Y
    SEP #$20
    LDA.B #$00
    STA.W $0036,Y
    REP #$20
    PLX
    TXA
    STA.W $0032,Y
    RTS


CODE_00A913:
    LDA.W $0026,X
    BEQ CODE_00A927
    ASL A
    CLC
    ADC.W $0026,X
    DEC A
    STA.W $0014,X
    PLA
    INC A
    STA.W $0018,X
    RTL


CODE_00A927:
    RTS

    COP #$A8
    db $00,$80,$0E
    LDA.W #$0300
    STA.W $0016,X
    LDA.W $001C,X
    STA.W $0030,X
    LDA.W $0372
    STA.W $001C,X
    COP #$80
    db $00
    COP #$82
    LDA.W $0030,X
    STA.W $001C,X
    LDA.W #$003C
    STA.W $0026,X
    LDY.W $0038,X
    LDA.W PTR16_018006,Y
    ORA.W #$8800
    STA.W $0016,X
    BRA CODE_00A96A

    LDY.W $0038,X
    LDA.W PTR16_018006,Y
    ORA.W #$8000
    STA.W $0016,X

CODE_00A96A:
    SEP #$20
    LDA.W PTR16_01800A,Y
    STA.W $0024,X
    LDA.W PTR16_01800D,Y
    STA.W $0036,X
    PHA
    REP #$20
    LDA.W PTR16_018005,Y
    STA.W $001E,X
    STZ.W $0020,X
    LDA.W PTR16_018008,Y
    STA.W $0022,X
    LDA.W PTR16_01800B,Y
    STA.W $0018,X
    DEC A
    PHA
    JSL.L CODE_0088F3
    STZ.W $0004,X
    STZ.W $0006,X
    RTL

CODE_00A99D:
    LDA.W $032E
    BEQ CODE_00A9E5
    COP #$A8
    db $00,$80,$0E
    LDA.W $0016,X
    AND.W #$DFFF
    ORA.W #$0010
    STA.W $0016,X
    LDA.W $0372
    STA.W $001C,X
    COP #$A3
    COP #$A2
    db $30
    LDA.W $0010,X
    SEC
    SBC.W #$0010
    LSR A
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    LDA.W $0012,X
    SEC
    SBC.W #$0010
    LSR A
    EOR.W #$FFFF
    INC A
    CLC
    ADC.W $0002,X
    STA.W $0002,X
    COP #$80
    db $02
    COP #$82

CODE_00A9E5:
    COP #$86
    RTL


CODE_00A9E8:
    COP #$94
    BRA CODE_00A9E8

    SEP #$20
    LDA.B #$00
    STA.W $0036,X
    REP #$20
    LDA.W #$0300
    STA.W $0016,X
    COP #$A3
    LDA.W $0372
    STA.W $001C,X
    COP #$A8
    db $00,$80,$0E
    COP #$80
    db $10
    COP #$82
    COP #$86
    RTL
    CPX.W $039A
    BNE CODE_00AA18
    BRL CODE_00AB96


CODE_00AA18:
    COP #$A8
    db $00,$80,$0E
    LDA.W #$0300
    STA.W $0016,X
    STZ.W $001A,X
    LDA.W $0372
    STA.W $001C,X
    LDA.W $0010,X
    SEC
    SBC.W #$0010
    LSR A
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    LDA.W $0012,X
    SEC
    SBC.W #$0010
    LSR A
    EOR.W #$FFFF
    INC A
    CLC
    ADC.W $0002,X
    STA.W $0002,X
    LDA.W actId
    CMP.W #$0006
    BNE CODE_00AA59
    LDA.W #$0019

CODE_00AA59:
    ASL A
    PHA
    INC A
    STA.B $16
    PLA
    ASL A
    CLC
    ADC.W #$0004
    STA.B $18
    LDA.W playerEquippedSword
    CMP.W #$0004
    BNE CODE_00AA72
    ASL.B $16
    ASL.B $18

CODE_00AA72:
    COP #$1F
    COP #$35
    db $64
    LDA.W $0437
    CMP.B $18
    BCS CODE_00AA94
    CMP.B $16
    BCS CODE_00AA8B
    COP #$B0
    db $FA,$AE,$00,$00,$40
    BRA CODE_00AA9B


CODE_00AA8B:
    COP #$B0
    db $EA,$AE,$00,$00,$40
    BRA CODE_00AA9B


CODE_00AA94:
    COP #$B0
    db $DA,$AE,$00,$00,$40

CODE_00AA9B:
    COP #$80
    db $03
    COP #$82
    COP #$A3
    COP #$A2
    db $30
    COP #$A8
    db $00,$F0,$7E
    COP #$A0
    db $F0,$FF
    PHX
    LDY.W $0038,X
    LDA.W PTR16_018003,Y
    STA.B $00
    TXY
    TXA
    SEC
    SBC.W #$0800
    LSR A
    LSR A
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W $001E,X
    STZ.W $0020,X
    ASL A
    TAX
    LDA.L $7EF000,X
    TAX
    LDA.L $7E0006,X
    CLC
    ADC.W #$000E
    SEC
    SBC.W #$F000
    TAX
    LDA.B $00
    CMP.W #$1000
    BCS CODE_00AB27
    CMP.W #$0100
    BCS CODE_00AB14
    CMP.W #$0010
    BCS CODE_00AB01
    LDA.W #$0001
    STA.L $7EEFFE,X
    LDA.W $0000,Y
    CLC
    ADC.W #$0005
    STA.W $0000,Y
    BRA CODE_00AB47


CODE_00AB01:
    LDA.W #$0002
    STA.L $7EEFFE,X
    LDA.W $0000,Y
    CLC
    ADC.W #$0003
    STA.W $0000,Y
    BRA CODE_00AB42


CODE_00AB14:
    LDA.W #$0003
    STA.L $7EEFFE,X
    LDA.W $0000,Y
    CLC
    ADC.W #$0001
    STA.W $0000,Y
    BRA CODE_00AB3D

CODE_00AB27:
    LDA.W #$0004
    STA.L $7EEFFE,X
    LDA.W $0000,Y
    CLC
    ADC.W #$FFFF
    STA.W $0000,Y
    LDA.B $01
    JSR.W CODE_00AB57

CODE_00AB3D:
    LDA.B $01
    JSR.W CODE_00AB5B

CODE_00AB42:
    LDA.B $00
    JSR.W CODE_00AB57

CODE_00AB47:
    LDA.B $00
    JSR.W CODE_00AB5B
    PLX
    %CopSetScriptAddrToNextInstruction()
    COP #$82
    COP #$1B
    db $7E,$AB,$10,$00

CODE_00AB57:
    LSR A
    LSR A
    LSR A
    LSR A

CODE_00AB5B:
    AND.W #$000F
    PHX
    TAX
    LDA.L UNREACH_00AB74,X
    PLX
    SEP #$20
    STA.L $7EF005,X
    REP #$20
    TXA
    CLC
    ADC.W #$0007
    TAX
    RTS


UNREACH_00AB74:
    db $B7,$C8,$C9,$D8,$D9,$CE,$CF,$DE,$DF,$A7

CODE_00AB7E:
    LDY.W $0032,X
    BNE CODE_00AB86
    BRL CODE_00AD40


CODE_00AB86:
    SEP #$20
    LDA.W $002E,Y
    BEQ CODE_00AB91
    DEC A
    STA.W $002E,Y

CODE_00AB91:
    REP #$20
    COP #$86
    RTL


CODE_00AB96:
    LDA.W #$0700
    STA.W $0016,X
    STZ.W $0004,X
    STZ.W $0006,X
    INC.W $042D
    LDA.W $0000,X
    SEC
    SBC.W $0008,X
    STA.W $0425
    LDA.W $0002,X
    SEC
    SBC.W $000A,X
    STA.W $0427
    LDA.W $0008,X
    CLC
    ADC.W $000C,X
    STA.W $0429
    LDA.W $000A,X
    CLC
    ADC.W $000E,X
    STA.W $042B
    COP #$03
    db $20
    COP #$84
    db $FE,$AB,$00
    LDA.W #$0003
    STA.W $0014,X
    COP #$04
    CPX.W $039A
    BNE CODE_00AB7E
    JSR.W CODE_00AC63
    LDA.W currentMapNumber
    CMP.W #$007D
    BNE CODE_00ABF9
    SEP #$20
    LDA.B #$00
    PHA
    REP #$20
    LDA.W #$D353
    PHA
    RTL

CODE_00ABF9:
    COP #$31
    db $02
    BRA CODE_00AB7E

    COP #$A8
    db $00,$80,$0E
    COP #$A3
    LDA.W $0372
    STA.W $001C,X
    LDA.W $0016,X
    AND.W #$DFFF
    STA.W $0016,X
    COP #$1F
    SEP #$20
    LDA.W $0302
    AND.B #$7F

CODE_00AC1D:
    SEC
    SBC.W $0429
    BPL CODE_00AC1D
    CLC
    ADC.W $0429
    REP #$20
    AND.W #$00FF
    CLC
    ADC.W $0425
    STA.W $0000,X
    COP #$1F
    SEP #$20
    LDA.W $0302
    AND.B #$7F

CODE_00AC3C:
    SEC
    SBC.W $042B
    BPL CODE_00AC3C
    CLC
    ADC.W $042B
    REP #$20
    PHA
    AND.W #$00FF
    CLC
    ADC.W $0427
    STA.W $0002,X
    PLA
    AND.W #$0001
    BNE CODE_00AC5B
    BRK #$85

CODE_00AC5B:
    COP #$80
    db $00
    COP #$82
    COP #$86
    RTL


CODE_00AC63:
    PHX
    LDA.W $06A6
    BRA CODE_00AC6C


CODE_00AC69:
    LDA.W $003E,X

CODE_00AC6C:
    TAX
    BEQ CODE_00AC7B
    LDA.W $0016,X
    BIT.W #$24D0
    BNE CODE_00AC69
    COP #$86
    BRA CODE_00AC69

CODE_00AC7B:
    PLX
    RTS


CODE_00AC7D:
    PHP
    PHX
    REP #$20
    LDA.W $06A6
    BRA CODE_00AC89


CODE_00AC86:
    LDA.W $003E,X

CODE_00AC89:
    TAX
    BEQ CODE_00AC98
    LDA.W $0016,X
    BIT.W #$0020
    BEQ CODE_00AC86
    db $02,$86,$80,$EE

CODE_00AC98:
    PLX
    PLP
    RTL

    SEP #$20
    LDA.B #$F1
    STA.W $2140
    REP #$20
    COP #$27
    db $A8,$AC
    LDA.W $2140
    AND.W #$00FF
    CMP.W #$00F1
    BEQ CODE_00ACB4
    RTL


CODE_00ACB4:
    SEP #$20
    LDA.B #$01
    STA.W $2140
    REP #$20
    COP #$27
    db $C1,$AC
    SEP #$20
    LDA.W $2140
    REP #$20
    BEQ CODE_00ACCB
    RTL


CODE_00ACCB:
    SEP #$20
    LDA.B #$F0
    STA.W $2140
    REP #$20
    COP #$27
    db $D8,$AC
    SEP #$20
    LDA.W $2140
    REP #$20
    BEQ CODE_00ACE2
    RTL


CODE_00ACE2:
    COP #$1B
    db $E8,$AC,$02,$00
    SEP #$20
    LDA.B #$FF
    STA.W $2140
    REP #$20
    LDA.W $0030,X
    ASL A
    CLC
    ADC.W $0030,X
    TAY
    STZ.W $0030,X
    LDA.W UNREACH_01FB49,Y
    STA.B $29
    STA.W $0422
    SEP #$20
    LDA.W UNREACH_01FB4B,Y
    STA.B $2B
    STA.W $0424
    REP #$20
    PHX
    SEP #$20
    JSL.L wait_vblank
    JSL.L disable_vblank_interrupt
    JSL.L CODE_1FEFF5
    JSL.L wait_vblank
    JSL.L enable_interrupts
    REP #$20
    PLX
    COP #$1B
    db $31,$AD,$02,$00
    SEP #$20
    LDA.B #$01
    STA.W $2140
    REP #$20
    STZ.W $0458
    COP #$86
    RTL


CODE_00AD40:
    LDA.W $001A,X
    BIT.W #$1000
    BEQ CODE_00AD64
    db $A9,$58,$02,$9D,$26,$00,$02,$91,$BD,$16,$00,$89,$00,$80,$D0,$01
    db $6B,$DE,$26,$00,$30,$01,$6B,$22,$AB,$93,$00,$6B

CODE_00AD64:
    COP #$86
    RTL

    TYA
    STA.W $001E,X
    STZ.W $0020,X
    COP #$85
    db $96,$AD,$00
    CPY.W #$06AA
    BEQ CODE_00AD93
    SEP #$20
    LDA.B #$00
    STA.W $0036,X
    REP #$20
    %CopSetScriptAddrToNextInstruction()

CODE_00AD83:
    COP #$82
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00AD83
    LDY.W $003E,X
    STA.W $0030,Y

CODE_00AD93:
    COP #$86
    RTL

    LDA.W soundIdBank,X
    STA.W $0030,X
    LDA.W player_pos_x_real
    SEC
    SBC.W $0000,X
    BMI CODE_00ADC4
    STA.B $16
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BMI CODE_00ADB8
    STA.B $18
    CMP.B $16
    BCS CODE_00AE23
    BRA CODE_00AE11


CODE_00ADB8:
    EOR.W #$FFFF
    INC A
    STA.B $18
    CMP.B $16
    BCS CODE_00ADEA
    BRA CODE_00ADFF


CODE_00ADC4:
    EOR.W #$FFFF
    INC A
    STA.B $16
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BMI CODE_00ADDB
    STA.B $18
    CMP.B $16
    BCS CODE_00AE35
    BRA CODE_00AE47


CODE_00ADDB:
    EOR.W #$FFFF
    INC A
    STA.B $18
    CMP.B $16
    BCC CODE_00ADE8
    BRL CODE_00AE6B


CODE_00ADE8:
    BRA CODE_00AE59


CODE_00ADEA:
    JSR.W CODE_00AE9C
    %CopSetScriptAddrToNextInstruction()
    DEC.W $0002,X
    DEC.W $0010,X
    BEQ CODE_00ADFA
    BRL CODE_00AE83

CODE_00ADFA:
    INC.W $0000,X
    BRA CODE_00AE7D


CODE_00ADFF:
    JSR.W CODE_00AEA4
    %CopSetScriptAddrToNextInstruction()
    INC.W $0000,X
    DEC.W $0010,X
    BNE CODE_00AE83
    DEC.W $0002,X
    BRA CODE_00AE7D


CODE_00AE11:
    JSR.W CODE_00AEA4
    %CopSetScriptAddrToNextInstruction()
    INC.W $0000,X
    DEC.W $0010,X
    BNE CODE_00AE83
    INC.W $0002,X
    BRA CODE_00AE7D


CODE_00AE23:
    JSR.W CODE_00AE9C
    %CopSetScriptAddrToNextInstruction()
    INC.W $0002,X
    DEC.W $0010,X
    BNE CODE_00AE83
    INC.W $0000,X
    BRA CODE_00AE7D


CODE_00AE35:
    JSR.W CODE_00AE9C
    %CopSetScriptAddrToNextInstruction()
    INC.W $0002,X
    DEC.W $0010,X
    BNE CODE_00AE83
    DEC.W $0000,X
    BRA CODE_00AE7D


CODE_00AE47:
    JSR.W CODE_00AEA4
    %CopSetScriptAddrToNextInstruction()
    DEC.W $0000,X
    DEC.W $0010,X
    BNE CODE_00AE83
    INC.W $0002,X
    BRA CODE_00AE7D


CODE_00AE59:
    JSR.W CODE_00AEA4
    %CopSetScriptAddrToNextInstruction()
    DEC.W $0000,X
    DEC.W $0010,X
    BNE CODE_00AE83
    DEC.W $0002,X
    BRA CODE_00AE7D


CODE_00AE6B:
    JSR.W CODE_00AE9C
    %CopSetScriptAddrToNextInstruction()
    DEC.W $0002,X
    DEC.W $0010,X
    BNE CODE_00AE83
    DEC.W $0000,X
    BRA CODE_00AE7D


CODE_00AE7D:
    LDA.W $0012,X
    STA.W $0010,X

CODE_00AE83:
    LDA.W soundIdBank,X
    CMP.W $0030,X
    BNE CODE_00AE99
    TAY
    LDA.W $0000,X
    STA.W $0000,Y
    LDA.W $0002,X
    STA.W $0002,Y
    RTL


CODE_00AE99:
    COP #$86
    RTL


CODE_00AE9C:
    SEP #$20
    LDY.B $18
    LDA.B $16
    BRA CODE_00AEAA


CODE_00AEA4:
    SEP #$20
    LDY.B $16
    LDA.B $18

CODE_00AEAA:
    BNE CODE_00AEAD
    INC A

CODE_00AEAD:
    JSL.L divide
    REP #$20
    AND.W #$00FF
    BNE CODE_00AEB9
    INC A

CODE_00AEB9:
    STA.W $0010,X
    STA.W $0012,X
    RTS

    db $02,$A8,$00,$80,$0E,$A9,$00,$40,$9D,$16,$00,$02,$A4,$AD,$72,$03
    db $9D,$1C,$00,$02,$80,$07,$02,$82,$80,$F9
    COP #$A4
    COP #$80
    db $04
    COP #$82
    COP #$81
    db $09,$04
    COP #$83
    COP #$86
    RTL

    COP #$A4
    COP #$80
    db $05
    COP #$82
    COP #$81
    db $0A,$04
    COP #$83
    COP #$86
    RTL

    COP #$A4
    COP #$80
    db $06
    COP #$82
    COP #$81
    db $0B,$04
    COP #$83
    COP #$86
    RTL


CODE_00AF0A:
    PHP
    PHY
    REP #$20
    BRK #$4D
    LDA.W $001E,X
    CMP.W #$0006
    BEQ CODE_00AF31
    CMP.W #$0005
    BEQ CODE_00AF36
    CMP.W #$0004
    BEQ CODE_00AF3B
    CMP.W #$000B
    BEQ CODE_00AF31
    CMP.W #$000A
    BEQ CODE_00AF36
    CMP.W #$0009
    BEQ CODE_00AF3B

CODE_00AF31:
    LDA.W #$0010
    BRA CODE_00AF3E


CODE_00AF36:
    LDA.W #$0005
    BRA CODE_00AF3E


CODE_00AF3B:
    LDA.W #$0001

CODE_00AF3E:
    JSL.L addGold
    LDA.W #$0010
    TSB.W updateHudBitfield
    LDA.W $0016,X
    ORA.W #$2000
    STA.W $0016,X
    COP #$86
    PLY
    PLP
    RTL


checkLevelUp:
    LDA.W playerLevel
    CMP.W #$0032
    BCC CODE_00AF61
    db $82,$A1,$00

CODE_00AF61:
    ASL A
    ASL A
    TAY
    LDA.W ExpTable,Y
    STA.W $1B7E
    LDA.W UNREACH_01FBBA,Y
    STA.W ExpNeededForNextLevel
    %CopSetScriptAddrToNextInstruction()
    LDA.W playerExp
    SEC
    SBC.W ExpNeededForNextLevel
    LDA.W $1B7A
    SBC.W $1B7E
    BCS levelUp
    RTL


levelUp:
    LDA.W playerMaxHealth
    CLC
    ADC.W #$0002
    CMP.W #$0065
    BCC CODE_00AF91
    LDA.W #$0064

CODE_00AF91:
    STA.W playerMaxHealth
    LDA.W playerCurrentHealth
    CLC
    ADC.W #$0002
    CMP.W #$0065
    BCC CODE_00AFA3
    LDA.W #$0064

CODE_00AFA3:
    STA.W playerCurrentHealth
    %CopRestoreToFullHealth()
    INC.W playerLevel
    SED
    LDA.W playerLevel_ASCII
    CLC
    ADC.W #$0001
    STA.W playerLevel_ASCII
    CLD
    LSR A
    BCS CODE_00AFBF
    INC.W strengthFromLevel
    BRA CODE_00AFC2


CODE_00AFBF:
    INC.W defenseFromLevel

CODE_00AFC2:
    LDA.W #$001F
    TSB.W updateHudBitfield
    LDA.W playerLevel
    ASL A
    ASL A
    TAY
    LDA.W ExpTable,Y
    STA.W $1B7E
    LDA.W UNREACH_01FBBA,Y
    STA.W ExpNeededForNextLevel
    BRK #$97
    COP #$03
    db $03
    PHX
    LDY.W #$C516
    JSL.L printOsdStringFromBank2
    PLX
    COP #$1B
    db $EE,$AF,$14,$00
    PHX
    LDY.W #$C527
    JSL.L printOsdStringFromBank2
    PLX
    COP #$1B
    db $FD,$AF,$0A,$00
    COP #$04
    BRL checkLevelUp

    db $02,$86,$6B

checkPlayerDead:
    PHP
    REP #$20
    LDX.W $039C
    LDA.W $0016,X
    BIT.W #$0400
    BNE .end
    LDA.W playerCurrentHealth
    ORA.W bPlayerHealthRestore
    BNE .end
    %CopJumpIfItemIsNotEquipped(!itemMedicalHerb, .noHerbEquipped)
    LDA.W playerMaxHealth
    STA.W bPlayerHealthRestore
    %CopRemoveItem(!itemMedicalHerb)
    BRA .end
.noHerbEquipped:
    %CopJumpIfItemIsNotEquipped(!itemStrangeBottle, .noBottleEquipped)
    %CopRemoveItem(!itemStrangeBottle)
    BRA .playerDead

.noBottleEquipped:

    %CopJumpIfItemIsNotEquipped(!itemMagicBell, .removeAllGold)
    BRA .playerDead

.removeAllGold
   STZ.W playerGold : STZ.W playerGold+2

.playerDead
    LDA.W $0016,X
    AND.W #$F7FF
    STA.W $0016,X
    LDA.W $0016,X
    ORA.W #$0400
    STA.W $0016,X
    LDA.W #$2080
    STA.W wButtonMask
    INC.W wPlayerDied

.end:
    PLP
    RTL

    db $E2,$20,$A9,$00,$9D,$36,$00,$C2,$20,$BD,$16,$00,$29,$F7,$DF,$9D
    db $16,$00,$02,$A8,$00,$80,$0E,$BD,$1C,$00,$9D,$32,$00,$29,$FF,$FE
    db $9D,$1C,$00,$02,$15,$02,$80,$0D,$02,$82,$BD,$34,$00,$0A,$0A,$0A
    db $0A,$0A,$A8,$B9,$2B,$BA,$A0,$DE,$1A,$22,$A2,$F3,$04,$90,$E6,$02
    db $16,$BD,$34,$00,$A0,$9E,$1A,$22,$48,$F3,$04,$A0,$DE,$1A,$22,$48
    db $F3,$04,$DA,$AA,$BF,$03,$02,$7F,$29,$BF,$FF,$9F,$03,$02,$7F,$FA
    db $02,$A8,$00,$38,$7E,$BD,$32,$00,$9D,$1C,$00,$BC,$38,$00,$E2,$20
    db $B9,$05,$80,$9D,$1E,$00,$B9,$0A,$80,$9D,$24,$00,$B9,$0D,$80,$9D
    db $36,$00,$C2,$20,$B9,$06,$80,$09,$00,$80,$29,$FF,$DF,$9D,$16,$00
    db $B9,$08,$80,$9D,$22,$00,$B9,$0B,$80,$9D,$18,$00,$9E,$30,$00,$9E
    db $20,$00,$22,$F3,$88,$00,$9E,$14,$00,$9E,$04,$00,$9E,$06,$00,$6B
    PHX
    LDX.W $03A0
    LDA.W $0000,X
    SEC
    SBC.W #$0030
    BPL CODE_00B11F
    LDA.W #$0000

CODE_00B11F:
    STA.B $16
    LDA.W $0000,X
    CLC
    ADC.W #$0030
    SEC
    SBC.B $16
    STA.B $1A
    BMI CODE_00B186
    LDA.W $0002,X
    SEC
    SBC.W #$0030
    BPL CODE_00B13B
    LDA.W #$0000

CODE_00B13B:
    STA.B $18
    LDA.W $0002,X
    CLC
    ADC.W #$0030
    SEC
    SBC.B $18
    STA.B $1C
    BMI CODE_00B186
    LDA.W $06A6
    BRA CODE_00B153

CODE_00B150:
    LDA.W $003E,X

CODE_00B153:
    TAX
    BEQ CODE_00B186
    LDA.W $0016,X
    CMP.W #$0301
    BNE CODE_00B150
    LDA.W $0000,X
    SEC
    SBC.B $16
    CMP.B $1A
    BCS CODE_00B150
    LDA.W $0002,X
    SEC
    SBC.B $18
    CMP.B $1C
    BCS CODE_00B150
    SEP #$20
    LDA.B #$00
    STA.W $0036,X
    REP #$20
    LDA.W #$A9EC
    STA.W $0018,X
    STZ.W $0014,X
    BRA CODE_00B150

CODE_00B186:
    PLX
    RTL
    LDA.W #$FFFF
    STA.W wButtonMask
    COP #$1B
    db $94,$B1,$01,$00
    LDA.W $1C7B
    BEQ CODE_00B19A
    RTL

CODE_00B19A:
    BRK #$83
    LDA.W $0030,X
    JSL.L CODE_0288BB
    COP #$27
    db $A7,$B1
    STZ.W wButtonMask
    COP #$86
    RTL

CODE_00B1AD:
    STZ.W $03B2
    INC.W $0458
    STX.W $039A
    COP #$85
    db $88,$B1,$00
    LDA.W #$0000
    STA.W $0030,Y

CODE_00B1C1:
    COP #$80
    db $00
    COP #$82
    LDA.W player_pos_y_real
    CMP.W #$0070
    BCS CODE_00B1D1
    db $82,$E1,$00

CODE_00B1D1:
    COP #$9F
    db $10,$00
    COP #$9A
    db $10,$00,$10,$B2,$DF,$B1,$10,$B2
    COP #$9F
    db $F0,$FF
    COP #$80
    db $0E
    COP #$82
    COP #$B2
    db $48,$B3,$00,$08,$00,$E8,$FF,$00,$02
    COP #$B2
    db $59,$B3,$00,$08,$00,$E8,$FF,$00,$02
    COP #$B2
    db $67,$B3,$00,$08,$00,$E8,$FF,$00,$02
    COP #$80
    db $16
    COP #$82
    BRA CODE_00B1C1

    db $02,$9A,$50,$00,$1A,$B2,$90,$B2,$1A,$B2,$02,$9A,$70,$00,$90,$B2
    db $24,$B2,$90,$B2,$02,$9A,$00,$00,$2E,$B2,$5F,$B2,$5F,$B2,$02,$9F
    db $F0,$FF,$02,$80,$0D,$02,$82,$02,$B2,$7F,$B3,$00,$FC,$FF,$E6,$FF
    db $00,$02,$02,$80,$17,$02,$82,$02,$80,$0D,$02,$82,$02,$B2,$7F,$B3
    db $00,$FC,$FF,$E6,$FF,$00,$02,$02,$80,$17,$02,$82,$82,$67,$FF,$02
    db $9F,$F0,$FF,$02,$80,$0F,$02,$82,$02,$B2,$94,$B3,$00,$14,$00,$E6
    db $FF,$00,$02,$02,$80,$18,$02,$82,$02,$80,$0F,$02,$82,$02,$B2,$94
    db $B3,$00,$14,$00,$E6,$FF,$00,$02,$02,$80,$18,$02,$82,$82,$36,$FF
    db $02,$9A,$00,$00,$9A,$B2,$A6,$B2,$A6,$B2,$02,$9F,$F0,$FF,$02,$80
    db $07,$02,$82,$82,$20,$FF,$02,$9F,$F0,$FF,$02,$80,$05,$02,$82,$82
    db $14,$FF,$02,$9F,$10,$00,$02,$9A,$40,$00,$30,$B3,$C0,$B2,$3C,$B3
    db $02,$9A,$00,$00,$CA,$B2,$FD,$B2,$FD,$B2,$02,$9F,$F0,$FF,$BD,$16
    db $00,$09,$02,$00,$9D,$16,$00,$02,$85,$B9,$B3,$00,$02,$80,$09,$02
    db $82,$02,$B2,$A9,$B3,$00,$D8,$FF,$E8,$FF,$00,$02,$02,$80,$0A,$02
    db $82,$BD,$16,$00,$29,$FD,$FF,$9D,$16,$00,$82,$C9,$FE,$02,$9F,$F0
    db $FF,$BD,$16,$00,$09,$02,$00,$9D,$16,$00,$02,$85,$B9,$B3,$00,$02
    db $80,$0B,$02,$82,$02,$B2,$B1,$B3,$00,$28,$00,$E8,$FF,$00,$02,$02
    db $80,$0C,$02,$82,$BD,$16,$00,$29,$FD,$FF,$9D,$16,$00,$82,$96,$FE
    db $02,$9F,$F0,$FF,$02,$80,$08,$02,$82,$82,$8A,$FE,$02,$9F,$F0,$FF
    db $02,$80,$06,$02,$82,$82,$7E,$FE
    COP #$A3
    COP #$A2
    db $30
    COP #$80
    db $10
    COP #$82
    COP #$80
    db $1B
    COP #$82
    BRA CODE_00B376

    COP #$A3
    COP #$A2
    db $30
    BRK #$61
    COP #$80
    db $10
    COP #$82
    BRA CODE_00B376

    COP #$A3
    COP #$A2
    db $30
    COP #$80
    db $10
    COP #$82
    COP #$80
    db $1C
    COP #$82

CODE_00B376:
    COP #$81
    db $13,$0C
    COP #$83
    COP #$86
    RTL

    db $02,$A3,$02,$A2,$30,$00,$61,$02,$80,$11,$02,$82,$02,$81,$14,$0C
    db $02,$83,$02,$86,$6B,$02,$A3,$02,$A2,$30,$00,$61,$02,$80,$12,$02
    db $82,$02,$81,$15,$0C,$02,$83,$02,$86,$6B,$02,$80,$19,$02,$82,$02
    db $86,$6B,$02,$80,$1A,$02,$82,$02,$86,$6B,$02,$A8,$00,$80,$0D,$02
    db $92,$4E,$02,$94,$02,$86,$6B
    STZ.W $03B2
    INC.W $0458
    LDA.W $0016,X
    ORA.W #$0200
    STA.W $0016,X
    COP #$85
    db $88,$B1,$00
    LDA.W #$0001
    STA.W $0030,Y
    COP #$A5
    db $EA,$B3,$32,$B7,$3D,$BA,$3D,$BA
    COP #$80
    db $21
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    TXA
    CLC
    ADC.W #$0080
    CMP.W $039A
    BEQ CODE_00B3FC
    RTL

CODE_00B3FC:
    %CopSetScriptAddrToNextInstruction()
    LDY.W $039A
    LDA.W $0016,Y
    BIT.W #$0400
    BNE CODE_00B40A
    RTL

CODE_00B40A:
    COP #$1B
    db $10,$B4,$08,$00
    STX.W $039A
    %CopSetScriptAddrToNextInstruction()
    COP #$0C
    db $00,$04,$1C,$B4
    RTL
    COP #$85
    db $1C,$BE,$00
    COP #$09
    db $05,$19
    SEP #$20
    STZ.W gameState
    REP #$20
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X
    STZ.W $042D
    COP #$1B
    db $7F,$B4,$3C,$00,$02,$9B,$60,$00,$48,$B4,$48,$B4,$F4,$B5,$02,$9A
    db $20,$00,$EA,$B5,$C0,$B4,$01,$B5,$02,$07,$05,$99,$6B,$B4,$02,$24
    db $6B,$B4,$02,$09,$05,$99,$02,$85,$61,$B6,$00,$02,$1B,$6B,$B4,$28
    db $00,$02,$9A,$60,$00,$21,$B6,$75,$B4,$75,$B4,$02,$9B,$10,$00,$0B
    db $B5,$15,$B5,$53,$B5

CODE_00B47F:
    COP #$9B
    db $60,$00,$03,$B6,$89,$B4,$89,$B4
    COP #$9A
    db $20,$00,$B2,$B5,$67,$B5,$5D,$B5

CODE_00B493:
    %CopJumpIfEventFlagIsUnset($9905, $B4AC)
    COP #$23
    db $AC,$B4
    COP #$09
    db $05,$99
    COP #$85
    db $BF,$B6,$00
    COP #$1B
    db $AC,$B4,$28,$00
    COP #$9A
    db $60,$00,$B6,$B4,$B6,$B4,$12,$B6
    COP #$9B
    db $10,$00,$E0,$B5,$BC,$B5,$A8,$B5

CODE_00B4C0:
    COP #$97
    COP #$80
    db $2C
    COP #$82
    db $02,$9B,$00,$00,$D1,$B4,$DA,$B4,$DA,$B4,$02,$9D,$1D,$02,$9E,$E4
    db $B4,$80,$ED,$02,$9D,$2D,$02,$9E,$E4,$B4,$82,$5A,$FF,$02,$9A,$00
    db $00,$EE,$B4,$EE,$B4,$F8,$B4,$02,$97,$02,$80,$0B,$02,$82,$82,$C4
    db $00,$02,$96,$02,$80,$0B,$02,$82,$80,$14,$02,$96,$02,$80,$0B,$02
    db $82,$82,$0A,$00,$02,$96,$02,$80,$09,$02,$82,$82,$AB,$FF,$02,$96
    db $02,$80,$2A,$02,$82,$02,$9A,$00,$00,$30,$B5,$30,$B5,$26,$B5,$02
    db $9D,$1C,$02,$9E,$3A,$B5,$82,$EC,$FF,$02,$9D,$2B,$02,$9E,$3A,$B5
    db $82,$18,$FF,$02,$9B,$00,$00,$44,$B5,$44,$B5,$4C,$B5,$02,$80,$09
    db $02,$82,$82,$74,$FF,$02,$80,$0A,$02,$82,$80,$14,$02,$96,$02,$80
    db $0A,$02,$82,$82,$0A,$00,$02,$96,$02,$80,$08,$02,$82,$82,$AE,$FF
    COP #$97
    COP #$80
    db $2E
    COP #$82
    COP #$9B
    db $00,$00,$81,$B5,$81,$B5,$78,$B5,$02,$9D,$1E,$02,$9E,$8B,$B5,$80
    db $ED
    COP #$9D
    db $2F
    COP #$9E
    db $8B,$B5
    BRL CODE_00B47F
    COP #$9A
    db $00,$00,$95,$B5,$95,$B5,$9E,$B5
    COP #$97
    COP #$80
    db $08
    COP #$82
    BRA CODE_00B5BC
    db $02,$96,$02,$80,$08,$02,$82,$82,$6D,$FF,$02,$97,$02,$80,$0A,$02
    db $82,$82,$B5,$FF,$02,$97,$02,$80,$08,$02,$82,$82,$00,$00

CODE_00B5BC:
    COP #$97
    COP #$80
    db $2A
    COP #$82
    COP #$9A
    db $00,$00,$CD,$B5,$D6,$B5,$D6,$B5,$02,$9D,$1C,$02,$9E,$3A,$B5,$80
    db $ED
    COP #$9D
    db $2B
    COP #$9E
    db $3A,$B5
    BRL CODE_00B493
    COP #$97
    COP #$80
    db $09
    COP #$82
    BRL CODE_00B4C0
    db $02,$97,$02,$80,$0B,$02,$82,$82,$C8,$FF,$02,$97,$02,$80,$0B,$02
    db $82,$02,$80,$0A,$02,$82,$82,$64,$FF,$02,$97,$02,$80,$08,$02,$82
    db $02,$80,$09,$02,$82,$82,$AE,$FE,$02,$80,$09,$02,$82,$02,$96,$02
    db $80,$0B,$02,$82,$82,$F4,$FE,$02,$80,$09,$02,$82,$02,$97,$02,$80
    db $0B,$02,$82,$82,$8C,$FF
    JSR.W CODE_00B72B
    COP #$A0
    db $F0,$FF
    COP #$80
    db $27
    COP #$82
    LDA.W gameState
    AND.W #$00FF
    CMP.W #$0004
    BCC CODE_00B64A
    db $82,$B5,$00

CODE_00B64A:
    COP #$9C
    db $50,$B6,$FF,$B6
    SEP #$20
    INC.W gameState
    REP #$20
    COP #$9A
    db $00,$00,$20,$B7,$20,$B7,$0A,$B7,$20,$2B,$B7,$02,$9F,$20,$00,$00
    db $5D,$02,$80,$29,$02,$82,$80,$07
    JSR.W CODE_00B72B
    COP #$9F
    db $10,$00
    COP #$80
    db $27
    COP #$82
    LDA.W gameState
    AND.W #$00FF
    CMP.W #$0004
    BCC CODE_00B68B
    db $82,$7F,$00

CODE_00B68B:
    COP #$9C
    db $0A,$B7,$91,$B6
    SEP #$20
    INC.W gameState
    REP #$20
    COP #$9B
    db $00,$00,$FF,$B6,$FF,$B6,$15,$B7,$20,$2B,$B7,$02,$A0,$10,$00,$02
    db $80,$27,$02,$82,$AD,$5E,$1A,$29,$FF,$00,$C9,$04,$00,$B0,$5C,$02
    db $9C,$50,$B6,$15,$B7
    JSR.W CODE_00B72B
    COP #$9F
    db $F0,$FF
    BRK #$5D
    COP #$80
    db $29
    COP #$82
    BRA CODE_00B6D6
    db $20,$2B,$B7,$02,$9F,$F0,$FF

CODE_00B6D6:
    COP #$80
    db $27
    COP #$82
    LDA.W gameState
    AND.W #$00FF
    CMP.W #$0004
    BCS UNREACH_00B720
    COP #$9C
    db $20,$B7,$91,$B6,$02,$09,$05,$19,$E2,$20,$9C,$5E,$1A,$C2,$20

CODE_00B6F7:
    COP #$80
    db $28
    COP #$82
    COP #$86
    RTL
    COP #$21
    db $EC,$B6
    COP #$85
    db $30,$B6,$00
    BRA CODE_00B6F7
    COP #$24
    db $EC,$B6
    COP #$85
    db $71,$B6,$00
    BRA CODE_00B6F7
    db $02,$22,$EC,$B6,$02,$85,$A2,$B6,$00,$80,$D7

UNREACH_00B720:
    db $02,$23,$EC,$B6,$02,$85,$CF,$B6,$00,$80,$CC

CODE_00B72B:
    LDA.W #$0200
    STA.W $0016,X
    RTS
    STX.W $039A
    COP #$80
    db $19
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    COP #$0C
    db $00,$04,$43,$B7
    RTL
    COP #$85
    db $29,$BE,$00
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X
    STZ.W $042D
    COP #$1B
    db $A3,$B7,$3C,$00,$02,$0C,$00,$04,$74,$B7,$02,$9B,$60,$00,$6A,$B7
    db $6A,$B7,$72,$B9,$02,$9A,$20,$00,$68,$B9,$36,$B8,$79,$B8,$02,$97
    db $02,$80,$06,$02,$82,$02,$80,$07,$02,$82,$80,$55,$02,$0C,$00,$04
    db $9C,$B7,$02,$9A,$60,$00,$9F,$B9,$92,$B7,$92,$B7,$02,$9B,$20,$00
    db $83,$B8,$8D,$B8,$CD,$B8,$02,$80,$07,$02,$82,$80,$34
    COP #$0C
    db $00,$04,$D7,$B7,$02,$9B,$60,$00,$81,$B9,$B3,$B7,$B3,$B7,$02,$9A
    db $20,$00,$2E,$B9,$E1,$B8,$D7,$B8,$02,$0C,$00,$04,$9C,$B7,$02,$9A
    db $60,$00,$CD,$B7,$CD,$B7,$90,$B9,$02,$9B,$20,$00,$5E,$B9,$38,$B9
    db $24,$B9
    COP #$81
    db $19,$02
    COP #$83
    COP #$85
    db $AE,$B9,$00
    COP #$85
    db $BD,$B9,$00
    COP #$80
    db $19
    COP #$82
    db $02,$97,$02,$80,$04,$02,$82,$02,$85,$CA,$B9,$00,$02,$85,$D9,$B9
    db $00,$02,$80,$1A,$02,$82,$02,$80,$05,$02,$82,$02,$85,$E6,$B9,$00
    db $02,$85,$F5,$B9,$00,$02,$80,$1B,$02,$82,$02,$96,$02,$80,$06,$02
    db $82,$02,$85,$04,$BA,$00,$02,$85,$15,$BA,$00,$02,$81,$1A,$05,$02
    db $83,$02,$80,$07,$02,$82,$02,$27,$A9,$B7,$02,$97,$02,$80,$32,$02
    db $82,$02,$9B,$00,$00,$47,$B8,$50,$B8,$50,$B8,$02,$9D,$18,$02,$9E
    db $5C,$B8,$80,$ED,$02,$21,$5C,$B8,$02,$80,$33,$02,$82,$82,$FE,$FE
    db $02,$9A,$00,$00,$66,$B8,$66,$B8,$70,$B8,$02,$97,$02,$80,$06,$02
    db $82,$82,$C8,$00,$02,$96,$02,$80,$06,$02,$82,$80,$14,$02,$96,$02
    db $80,$06,$02,$82,$82,$0A,$00,$02,$96,$02,$80,$05,$02,$82,$82,$A9
    db $FF,$02,$96,$02,$80,$30,$02,$82,$02,$9A,$00,$00,$A8,$B8,$A8,$B8
    db $9E,$B8,$02,$9D,$17,$02,$9E,$B4,$B8,$82,$EC,$FF,$02,$24,$B4,$B8
    db $02,$80,$31,$02,$82,$82,$CE,$FE,$02,$9B,$00,$00,$BE,$B8,$BE,$B8
    db $C6,$B8,$02,$80,$05,$02,$82,$82,$70,$FF,$02,$80,$07,$02,$82,$80
    db $14,$02,$96,$02,$80,$07,$02,$82,$82,$0A,$00,$02,$96,$02,$80,$04
    db $02,$82,$82,$AC,$FF,$02,$97,$02,$80,$34,$02,$82,$02,$9B,$00,$00
    db $FB,$B8,$FB,$B8,$F2,$B8,$02,$9D,$16,$02,$9E,$07,$B9,$80,$ED,$02
    db $22,$07,$B9,$02,$80,$35,$02,$82,$82,$9C,$FE,$02,$9A,$00,$00,$11
    db $B9,$11,$B9,$1A,$B9,$02,$97,$02,$80,$04,$02,$82,$80,$1E,$02,$96
    db $02,$80,$04,$02,$82,$82,$69,$FF,$02,$97,$02,$80,$07,$02,$82,$82
    db $B3,$FF,$02,$97,$02,$80,$04,$02,$82,$82,$00,$00,$02,$97,$02,$80
    db $30,$02,$82,$02,$9A,$00,$00,$49,$B9,$52,$B9,$52,$B9,$02,$9D,$17
    db $02,$9E,$B4,$B8,$80,$ED,$02,$23,$B4,$B8,$02,$80,$31,$02,$82,$82
    db $5F,$FE,$02,$97,$02,$80,$05,$02,$82,$82,$CE,$FE,$02,$97,$02,$80
    db $06,$02,$82,$82,$C6,$FF,$02,$97,$02,$80,$06,$02,$82,$02,$80,$07
    db $02,$82,$82,$60,$FF,$02,$97,$02,$80,$04,$02,$82,$02,$80,$05,$02
    db $82,$82,$A6,$FE,$02,$80,$05,$02,$82,$02,$96,$02,$80,$06,$02,$82
    db $82,$EE,$FE,$02,$80,$05,$02,$82,$02,$97,$02,$80,$06,$02,$82,$82
    db $8A,$FF
    BRK #$5A
    COP #$A3
    COP #$A1
    db $08,$00,$48,$00
    LDA.W #$0000
    BRA CODE_00BA24
    COP #$A3
    COP #$A1
    db $E8,$FF,$48,$00
    LDA.W #$0003
    BRA CODE_00BA24
    db $00,$5A,$02,$A3,$02,$A1,$C0,$FF,$F8,$FF,$A9,$02,$00,$80,$4B,$02
    db $A3,$02,$A1,$C8,$FF,$18,$00,$A9,$01,$00,$80,$3E,$00,$5A,$02,$A1
    db $08,$00,$E8,$FF,$02,$88,$A9,$00,$00,$80,$2F,$02,$A3,$02,$A1,$E8
    db $FF,$B0,$FF,$02,$88,$A9,$03,$00,$80,$20,$00,$5A,$02,$A3,$02,$A1
    db $20,$00,$F8,$FF,$02,$96,$A9,$02,$00,$80,$0F,$02,$A3,$02,$A1,$50
    db $00,$18,$00,$02,$96,$A9,$01,$00,$80,$00

CODE_00BA24:
    STA.W $001E,X
    STZ.W $0020,X
    LDA.W #$0200
    STA.W $0016,X
    LDA.W #$0004
    STA.W $002A,X
    %CopSetScriptAddrToNextInstruction()
    COP #$83
    COP #$86
    RTL
    COP #$80
    db $13
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDY.W $039A
    LDA.W $0016,Y
    BIT.W #$0400
    BNE CODE_00BA50
    RTL

CODE_00BA50:
    COP #$1B
    db $56,$BA,$08,$00
    STX.W $039A
    %CopSetScriptAddrToNextInstruction()
    COP #$0C
    db $00,$04,$62,$BA
    RTL
    COP #$85
    db $36,$BE,$00
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X
    STZ.W $042D
    COP #$1B
    db $0B,$BB,$3C,$00,$02,$0C,$00,$04,$93,$BA,$02,$9B,$60,$00,$89,$BA
    db $89,$BA,$D1,$BC,$02,$9A,$10,$00,$C7,$BC,$9D,$BB,$DE,$BB,$02,$21
    db $7F,$BA,$02,$AE,$00,$00,$C0,$FF,$7F,$BA,$02,$AE,$00,$00,$B0,$FF
    db $7F,$BA,$02,$AE,$10,$00,$C0,$FF,$7F,$BA,$02,$AE,$10,$00,$B0,$FF
    db $7F,$BA,$02,$85,$3C,$BD,$00,$02,$1B,$7F,$BA,$1E,$00,$02,$0C,$00
    db $04,$DC,$BA,$02,$9A,$60,$00,$FE,$BC,$D2,$BA,$D2,$BA,$02,$9B,$10
    db $00,$E8,$BB,$F2,$BB,$30,$BC,$02,$24,$C8,$BA,$02,$AE,$50,$00,$00
    db $00,$C8,$BA,$02,$AE,$50,$00,$F0,$FF,$C8,$BA,$02,$AE,$60,$00,$00
    db $00,$C8,$BA,$02,$AE,$60,$00,$F0,$FF,$C8,$BA,$02,$85,$A1,$BD,$00
    db $02,$1B,$C8,$BA,$1E,$00,$02,$0C,$00,$04,$25,$BB,$02,$9B,$60,$00
    db $E0,$BC,$1B,$BB,$1B,$BB,$02,$9A,$10,$00,$8F,$BC,$44,$BC,$3A,$BC
    db $02,$22,$11,$BB,$02,$AE,$00,$00,$30,$00,$11,$BB,$02,$AE,$00,$00
    db $40,$00,$11,$BB,$02,$AE,$10,$00,$30,$00,$11,$BB,$02,$AE,$10,$00
    db $40,$00,$11,$BB,$02,$85,$0D,$BD,$00,$02,$1B,$11,$BB,$1E,$00,$02
    db $0C,$00,$04,$6E,$BB,$02,$9A,$60,$00,$64,$BB,$64,$BB,$EF,$BC,$02
    db $9B,$10,$00,$BD,$BC,$99,$BC,$85,$BC,$02,$23,$5A,$BB,$02,$AE,$C0
    db $FF,$00,$00,$5A,$BB,$02,$AE,$C0,$FF,$F0,$FF,$5A,$BB,$02,$AE,$B0
    db $FF,$00,$00,$5A,$BB,$02,$AE,$B0,$FF,$F0,$FF,$5A,$BB,$02,$85,$6F
    db $BD,$00,$02,$1B,$5A,$BB,$1E,$00,$02,$97,$02,$80,$38,$02,$82,$02
    db $9B,$00,$00,$AE,$BB,$B7,$BB,$B7,$BB,$02,$9D,$11,$02,$9E,$C1,$BB
    db $80,$ED,$02,$9D,$39,$02,$9E,$C1,$BB,$82,$B8,$FE,$02,$9A,$00,$00
    db $CB,$BB,$CB,$BB,$D5,$BB,$02,$97,$02,$80,$0F,$02,$82,$82,$C4,$00
    db $02,$96,$02,$80,$0F,$02,$82,$80,$14,$02,$96,$02,$80,$0F,$02,$82
    db $82,$0A,$00,$02,$96,$02,$80,$0D,$02,$82,$82,$AB,$FF,$02,$96,$02
    db $80,$36,$02,$82,$02,$9A,$00,$00,$0D,$BC,$0D,$BC,$03,$BC,$02,$9D
    db $12,$02,$9E,$17,$BC,$82,$EC,$FF,$02,$9D,$37,$02,$9E,$17,$BC,$82
    db $AB,$FE,$02,$9B,$00,$00,$21,$BC,$21,$BC,$29,$BC,$02,$80,$0D,$02
    db $82,$82,$74,$FF,$02,$80,$0E,$02,$82,$80,$14,$02,$96,$02,$80,$0E
    db $02,$82,$82,$0A,$00,$02,$96,$02,$80,$0C,$02,$82,$82,$AE,$FF,$02
    db $97,$02,$80,$3A,$02,$82,$02,$9B,$00,$00,$5E,$BC,$5E,$BC,$55,$BC
    db $02,$9D,$10,$02,$9E,$68,$BC,$80,$ED,$02,$9D,$3B,$02,$9E,$68,$BC
    db $82,$A3,$FE,$02,$9A,$00,$00,$72,$BC,$72,$BC,$7B,$BC,$02,$97,$02
    db $80,$0C,$02,$82,$80,$1E,$02,$96,$02,$80,$0C,$02,$82,$82,$6D,$FF
    db $02,$97,$02,$80,$0E,$02,$82,$82,$B5,$FF,$02,$97,$02,$80,$0C,$02
    db $82,$82,$00,$00,$02,$97,$02,$80,$36,$02,$82,$02,$9A,$00,$00,$AA
    db $BC,$B3,$BC,$B3,$BC,$02,$9D,$12,$02,$9E,$17,$BC,$80,$ED,$02,$9D
    db $37,$02,$9E,$17,$BC,$82,$97,$FE,$02,$97,$02,$80,$0D,$02,$82,$82
    db $D6,$FE,$02,$97,$02,$80,$0F,$02,$82,$82,$C8,$FF,$02,$97,$02,$80
    db $0F,$02,$82,$02,$80,$0E,$02,$82,$82,$64,$FF,$02,$97,$02,$80,$0C
    db $02,$82,$02,$80,$0D,$02,$82,$82,$AE,$FE,$02,$80,$0D,$02,$82,$02
    db $96,$02,$80,$0F,$02,$82,$82,$F4,$FE,$02,$80,$0D,$02,$82,$02,$97
    db $02,$80,$0F,$02,$82,$82,$8C,$FF,$20,$02,$BE,$02,$9F,$08,$00,$02
    db $80,$3C,$02,$82,$02,$85,$2C,$BD,$00,$02,$80,$25,$02,$82,$02,$A1
    db $F8,$FF,$10,$00,$82,$E1,$00,$A9,$00,$02,$9D,$16,$00,$02,$A3,$02
    db $80,$3E,$02,$82,$02,$86,$6B,$A9,$00,$02,$9D,$16,$00,$02,$A1,$08
    db $00,$E8,$FF,$02,$98,$02,$80,$3C,$02,$82,$00,$5B,$02,$80,$25,$02
    db $82,$02,$A1,$F8,$FF,$F8,$FF,$02,$85,$E4,$BD,$00,$02,$A0,$E0,$FF
    db $02,$A4,$02,$80,$26,$02,$82,$02,$86,$6B,$20,$02,$BE,$02,$A1,$F8
    db $FF,$F4,$FF,$02,$80,$3C,$02,$82,$02,$85,$8F,$BD,$00,$02,$80,$24
    db $02,$82,$02,$A1,$F0,$FF,$08,$00,$80,$7E,$A9,$00,$02,$9D,$16,$00
    db $02,$A3,$02,$97,$02,$80,$3D,$02,$82,$02,$86,$6B,$20,$02,$BE,$02
    db $A1,$20,$00,$F4,$FF,$02,$80,$3C,$02,$82,$02,$85,$D2,$BD,$00,$02
    db $96,$02,$80,$24,$02,$82,$02,$A0,$08,$00,$02,$85,$E4,$BD,$00,$02
    db $9F,$18,$00,$02,$A4,$02,$80,$26,$02,$82,$02,$86,$6B,$A9,$00,$02
    db $9D,$16,$00,$02,$A3,$02,$96,$02,$80,$3D,$02,$82,$02,$86,$6B,$A9
    db $00,$02,$9D,$16,$00,$02,$A4,$02,$99,$02,$80,$22,$02,$82,$02,$81
    db $40,$14,$02,$83,$02,$81,$3F,$14,$02,$83,$02,$86,$6B,$A9,$00,$02
    db $9D,$16,$00,$02,$A3,$00,$5B,$60,$02,$85,$E4,$BD,$00,$02,$A4,$02
    db $80,$26,$02,$82,$02,$86,$6B
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $3A
    COP #$94
    COP #$86
    RTL
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $3C
    COP #$94
    COP #$86
    RTL
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $3E
    COP #$94
    COP #$86
    RTL
    INC.W $0458
    STX.W $039A
    COP #$A3
    COP #$AD
    db $08
    COP #$0C
    db $00,$04,$5A,$BE
    COP #$1B
    db $49,$BE,$08,$00
    COP #$80
    db $00
    COP #$82
    COP #$85
    db $9B,$C0,$00
    COP #$B0
    db $C0,$BE,$00,$00,$02
    COP #$AF
    db $3F,$BF,$00,$01,$02
    COP #$AF
    db $EC,$BF,$00,$01,$02
    COP #$03
    db $04
    COP #$97
    COP #$80
    db $01
    COP #$82
    COP #$96
    COP #$80
    db $01
    COP #$82
    COP #$04
    COP #$80
    db $20
    COP #$82
    COP #$80
    db $1E
    COP #$82
    COP #$09
    db $00,$80
    COP #$05
    db $00,$80,$02,$80,$1F,$02,$82,$AC,$9C,$03,$B9,$00,$00,$C9,$80,$00
    db $B0,$09,$02,$97,$02,$80,$21,$02,$82,$80,$C2,$02,$96,$02,$80,$21
    db $02,$82,$80,$B9
    COP #$A3
    COP #$80
    db $22
    COP #$82
    COP #$05
    db $00,$00
    COP #$80
    db $03
    COP #$82
    db $02,$AF,$E8,$BE,$00,$00,$02,$02,$1B,$DD,$BE,$18,$00,$02,$80,$04
    db $02,$82,$02,$09,$00,$00,$80,$DA,$02,$A3,$02,$A1,$08,$00,$FC,$FF
    db $02,$80,$18,$02,$82,$00,$51,$02,$B0,$14,$BF,$00,$00,$02,$02,$B0
    db $1D,$BF,$00,$00,$02,$02,$B0,$26,$BF,$00,$00,$02,$02,$80,$17,$02
    db $82,$02,$86,$6B,$02,$A3,$02,$80,$16,$02,$82,$80,$12,$02,$A3,$02
    db $80,$15,$02,$82,$80,$09,$02,$A3,$02,$96,$02,$80,$15,$02,$82,$02
    db $80,$14,$02,$82,$02,$1C,$00,$80,$3C,$BF,$80,$F3,$02,$86,$6B
    COP #$A3
    LDA.W $001A,X
    ORA.W #$0100
    STA.W $001A,X
    COP #$99
    COP #$97
    LDA.W #$0030
    STA.W $0000,X
    LDA.W #$0070
    STA.W $0002,X
    COP #$81
    db $25,$14
    COP #$83
    SEP #$20
    LDA.B #$63
    STA.W $0025,X
    REP #$20
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X

CODE_00BF72:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W #$005A
    BCC CODE_00BFD7
    COP #$9C
    db $83,$BF,$AD,$BF
    COP #$9A
    db $00,$00,$8D,$BF,$9D,$BF,$9D,$BF,$02,$97,$02,$99,$02,$80,$27,$02
    db $82,$02,$80,$29,$02,$82,$80,$D5
    COP #$96
    COP #$99
    COP #$80
    db $10
    COP #$82
    COP #$80
    db $12
    COP #$82
    BRA CODE_00BF72
    COP #$9B
    db $00,$00,$B7,$BF,$C7,$BF,$C7,$BF,$02,$97,$02,$98,$02,$80,$0F,$02
    db $82,$02,$80,$11,$02,$82,$80,$AB
    COP #$97
    COP #$99
    COP #$80
    db $26
    COP #$82
    COP #$80
    db $28
    COP #$82
    BRA CODE_00BF72

CODE_00BFD7:
    LDA.W $0016,X
    ORA.W #$0300
    STA.W $0016,X
    COP #$81
    db $25,$14
    COP #$83
    COP #$1B
    db $4A,$BF,$2C,$01
    COP #$A3
    COP #$96
    LDA.W $001A,X
    ORA.W #$0100
    STA.W $001A,X
    COP #$99
    COP #$97
    LDA.W #$00B0
    STA.W $0000,X
    LDA.W #$0070
    STA.W $0002,X
    COP #$81
    db $0E,$14
    COP #$83
    SEP #$20
    LDA.B #$63
    STA.W $0025,X
    REP #$20
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X

CODE_00C021:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W #$005A
    BCC CODE_00C086
    COP #$9C
    db $32,$C0,$5C,$C0
    COP #$9A
    db $00,$00,$3C,$C0,$4C,$C0,$4C,$C0
    COP #$97
    COP #$99
    COP #$80
    db $10
    COP #$82
    COP #$80
    db $12
    COP #$82
    BRA CODE_00C021
    db $02,$96,$02,$99,$02,$80,$27,$02,$82,$02,$80,$29,$02,$82,$80,$C5
    COP #$9B
    db $00,$00,$66,$C0,$76,$C0,$76,$C0,$02,$97,$02,$98,$02,$80,$26,$02
    db $82,$02,$80,$28,$02,$82,$80,$AB
    COP #$97
    COP #$99
    COP #$80
    db $0F
    COP #$82
    COP #$80
    db $11
    COP #$82
    BRA CODE_00C021

CODE_00C086:
    LDA.W $0016,X
    ORA.W #$0300
    STA.W $0016,X
    COP #$81
    db $0E,$14
    COP #$83
    COP #$1B
    db $F9,$BF,$2C,$01
    LDA.W soundIdBank,X
    STA.W $0002,X
    TAY
    LDA.W soundIdBank,Y
    STA.W $0000,X
    %CopSetScriptAddrToNextInstruction()
    PHX
    %CopJumpIfEventFlagIsUnset($8000, $C0C4)
    LDA.W $0000,X
    LDY.W $0002,X
    TAX
    LDA.W $0000,X
    STA.W $0000,Y
    LDA.W $0002,X
    STA.W $0002,Y
    PLX
    PHX
    LDA.W $0000,X
    LDY.W $0002,X
    TAX
    LDA.W $0026,X
    STA.W $0026,Y
    LDA.W $0016,X
    BIT.W #$0400
    BNE CODE_00C0ED
    AND.W #$0800
    PHA
    LDA.W $0016,Y
    AND.W #$F7FF
    ORA.B $01,S
    STA.W $0016,Y
    PLA
    PLX
    RTL

CODE_00C0ED:
    TYX
    LDA.W #$C0FB
    STA.W $0018,X
    STZ.W $0014,X
    PLX
    COP #$86
    RTL
    STZ.W $0004,X
    STZ.W $0006,X
    RTL
    COP #$14
    db $B6,$00,$9D,$C1

CODE_00C108:
    COP #$AD
    db $08
    COP #$0C
    db $00,$03,$18,$C1
    COP #$80
    db $1A
    COP #$82
    BRA CODE_00C108
    BRK #$A1
    COP #$B0
    db $81,$C2,$00,$00,$02
    COP #$B0
    db $89,$C2,$00,$00,$02
    COP #$B0
    db $91,$C2,$00,$00,$02
    STZ.W $0016,X
    COP #$80
    db $0B
    COP #$82

CODE_00C137:
    COP #$AD
    db $08
    COP #$0C
    db $00,$04,$47,$C1

CODE_00C140:
    COP #$80
    db $2A
    COP #$82
    BRA CODE_00C137
    COP #$9C
    db $4D,$C1,$75,$C1
    COP #$9A
    db $10,$00,$57,$C1,$66,$C1,$66,$C1
    COP #$23
    db $40,$C1
    COP #$97
    COP #$99
    COP #$80
    db $0D
    COP #$82
    BRA CODE_00C140
    COP #$24
    db $40,$C1
    COP #$96
    COP #$99
    COP #$80
    db $0D
    COP #$82
    BRA CODE_00C140
    COP #$9B
    db $10,$00,$7F,$C1,$8E,$C1,$8E,$C1
    COP #$21
    db $40,$C1,$02,$97,$02,$98,$02,$80,$0C,$02,$82,$80,$B2
    COP #$22
    db $40,$C1,$02,$97,$02,$99,$02,$80,$0C,$02,$82,$80,$A3
    COP #$86
    RTL
    COP #$14
    db $B6,$00,$45,$C2
    COP #$A0
    db $F8,$FF
    LDA.W $001A,X
    ORA.W #$0100
    STA.W $001A,X

CODE_00C1B3:
    COP #$AD
    db $08
    COP #$9B
    db $40,$00,$C0,$C1,$C7,$C1,$C0,$C1
    COP #$80
    db $23
    COP #$82
    BRA CODE_00C1B3
    COP #$AD
    db $08
    COP #$80
    db $05
    COP #$82
    SEP #$20
    LDA.B #$63
    STA.W $0025,X
    REP #$20
    LDA.W $0016,X
    AND.W #$FDFF
    STA.W $0016,X

CODE_00C1E1:
    COP #$03
    db $0F
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W #$0063
    BCC CODE_00C218
    COP #$9B
    db $10,$00,$F9,$C1,$00,$C2,$F9,$C1
    COP #$80
    db $06
    COP #$82
    COP #$04
    COP #$80
    db $07
    COP #$82
    COP #$B0
    db $31,$C2,$00,$00,$02
    COP #$80
    db $08
    COP #$82
    COP #$80
    db $06
    COP #$82
    BRA CODE_00C1E1

CODE_00C218:
    LDA.W $0016,X
    ORA.W #$0200
    STA.W $0016,X
    COP #$80
    db $09
    COP #$82
    COP #$80
    db $23
    COP #$82
    COP #$1B
    db $C7,$C1,$2C,$01
    COP #$8F
    BRK #$5B

CODE_00C235:
    COP #$80
    db $13
    COP #$82
    COP #$1C
    db $00,$80,$42,$C2
    BRA CODE_00C235
    COP #$86
    RTL
    COP #$86
    RTL
    COP #$A4
    COP #$16
    COP #$14
    db $B6,$00,$7E,$C2
    COP #$9B
    db $30,$00,$62,$C2,$5C,$C2,$5C,$C2
    COP #$1B
    db $52,$C2,$08,$00
    BRK #$A1
    COP #$B0
    db $81,$C2,$00,$00,$02
    COP #$B0
    db $89,$C2,$00,$00,$02
    COP #$B0
    db $91,$C2,$00,$00,$02
    %CopMakeNpcUnpassable()
    COP #$86
    RTL
    %CopSetScriptAddrToNextInstruction()
    RTL
    COP #$80
    db $1B
    COP #$82
    COP #$86
    RTL
    COP #$80
    db $1C
    COP #$82
    COP #$86
    RTL
    COP #$80
    db $1D
    COP #$82
    COP #$86
    RTL
    STZ.W $03B2
    INC.W $0458
    STX.W $039A
    COP #$9F
    db $08,$00
    COP #$85
    db $88,$B1,$00
    LDA.W #$0002
    STA.W $0030,Y
    LDA.W #$0002
    STA.W $0030,X

CODE_00C2B7:
    COP #$97
    LDA.W $0016,X
    ORA.W #$0300
    STA.W $0016,X
    COP #$B2
    db $28,$C5,$00,$10,$00,$F0,$FF,$00,$03
    COP #$03
    db $15
    COP #$04
    COP #$B2
    db $28,$C5,$00,$08,$00,$FA,$FF,$00,$03
    COP #$03
    db $15
    COP #$04
    COP #$B2
    db $28,$C5,$00,$14,$00,$F6,$FF,$00,$03
    COP #$03
    db $15
    COP #$04
    COP #$85
    db $F5,$C5,$00
    COP #$80
    db $0A
    COP #$82
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X
    COP #$1F
    LDA.W $0302
    BMI CODE_00C33D
    db $02,$80,$01,$02,$82,$02,$B2,$97,$C4,$00,$EA,$FF,$0D,$00,$00,$02
    db $02,$03,$1F,$02,$04,$02,$80,$0D,$02,$82,$02,$80,$05,$02,$82,$02
    db $B2,$87,$C4,$00,$ED,$FF,$10,$00,$00,$02,$02,$80,$06,$02,$82,$80
    db $2F

CODE_00C33D:
    COP #$80
    db $00
    COP #$82
    COP #$B2
    db $97,$C4,$00,$15,$00,$0F,$00,$00,$03
    COP #$03
    db $1F
    COP #$04
    COP #$80
    db $0B
    COP #$82
    COP #$80
    db $02
    COP #$82
    COP #$B2
    db $8F,$C4,$00,$12,$00,$10,$00,$00,$02
    COP #$80
    db $03
    COP #$82
    COP #$1F
    LDA.W $0302
    BMI CODE_00C3C6
    COP #$80
    db $05
    COP #$82
    db $02,$B2,$87,$C4,$00,$ED,$FF,$10,$00,$00,$02,$02,$80,$06,$02,$82
    db $02,$80,$0E,$02,$82,$BD,$16,$00,$09,$00,$02,$9D,$16,$00,$02,$B2
    db $32,$C5,$00,$E4,$FF,$CD,$FF,$00,$02,$02,$B2,$46,$C5,$00,$E4,$FF
    db $CD,$FF,$00,$02,$02,$03,$29,$02,$04,$BD,$16,$00,$09,$00,$03,$9D
    db $16,$00,$02,$85,$F5,$C5,$00,$02,$80,$08,$02,$82,$80,$51

CODE_00C3C6:
    COP #$80
    db $02
    COP #$82
    COP #$B2
    db $8F,$C4,$00,$12,$00,$10,$00,$00,$02
    COP #$80
    db $03
    COP #$82
    COP #$80
    db $0C
    COP #$82
    LDA.W $0016,X
    ORA.W #$0200
    STA.W $0016,X
    COP #$B2
    db $32,$C5,$00,$1B,$00,$CD,$FF,$00,$02
    COP #$B2
    db $46,$C5,$00,$1B,$00,$CD,$FF,$00,$02
    COP #$03
    db $29
    COP #$04
    LDA.W $0016,X
    ORA.W #$0300
    STA.W $0016,X
    COP #$85
    db $F5,$C5,$00
    COP #$80
    db $09
    COP #$82
    LDA.W $0030,X
    CMP.W #$0001
    BEQ UNREACH_00C455
    COP #$1F
    LDA.W $0302
    BMI UNREACH_00C42A
    COP #$97
    BRA CODE_00C42C

UNREACH_00C42A:
    db $02,$96

CODE_00C42C:
    COP #$AF
    db $D3,$C4,$00,$00,$03
    COP #$AF
    db $D3,$C4,$00,$00,$03
    COP #$AF
    db $D3,$C4,$00,$00,$03
    COP #$AF
    db $FF,$C4,$00,$00,$03
    COP #$80
    db $14
    COP #$82
    DEC.W $0030,X
    BEQ UNREACH_00C455
    BRL CODE_00C2B7

UNREACH_00C455:
    db $BD,$00,$00,$C9,$F0,$00,$B0,$04,$02,$97,$80,$02,$02,$96,$02,$AF
    db $D3,$C4,$00,$00,$03,$02,$AF,$D3,$C4,$00,$00,$03,$02,$AF,$D3,$C4
    db $00,$00,$03,$02,$AF,$FF,$C4,$00,$00,$03,$02,$80,$15,$02,$82,$82
    db $2A,$FE,$02,$80,$07,$02,$82,$02,$86,$6B
    COP #$80
    db $04
    COP #$82
    COP #$86
    RTL
    COP #$A3
    COP #$81
    db $16,$06
    COP #$83
    BRK #$4B
    COP #$B0
    db $BF,$C4,$00,$00,$02
    COP #$B0
    db $C1,$C4,$00,$00,$02

CODE_00C4AF:
    COP #$80
    db $12
    COP #$82
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00C4AF
    COP #$86
    RTL
    COP #$96
    COP #$A3

CODE_00C4C3:
    COP #$80
    db $13
    COP #$82
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00C4C3
    COP #$86
    RTL
    COP #$A4
    COP #$80
    db $1D
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDY.W $039A
    LDA.W $001E,Y
    CMP.W #$0014
    BEQ CODE_00C4EC
    CMP.W #$0015
    BNE CODE_00C4FC

CODE_00C4EC:
    LDY.W $003E,X
    LDA.W $0000,Y
    STA.W $0000,X
    LDA.W $0002,Y
    STA.W $0002,X
    RTL

CODE_00C4FC:
    COP #$86
    RTL
    COP #$A4
    COP #$80
    db $1D
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDY.W $039A
    LDA.W $001E,Y
    CMP.W #$0014
    BEQ CODE_00C518
    CMP.W #$0015
    BNE CODE_00C525

CODE_00C518:
    LDA.W $0000,Y
    STA.W $0000,X
    LDA.W $0002,Y
    STA.W $0002,X
    RTL

CODE_00C525:
    COP #$86
    RTL
    COP #$A3
    COP #$80
    db $0F
    COP #$82
    COP #$86
    RTL
    COP #$A3
    COP #$81
    db $16,$06
    COP #$83
    BRK #$4B
    COP #$97
    COP #$81
    db $19,$02
    COP #$83
    BRA CODE_00C55B
    COP #$A3
    COP #$81
    db $16,$06
    COP #$83
    BRK #$4B
    COP #$96
    COP #$81
    db $19,$02
    COP #$83
    BRL CODE_00C5A8

CODE_00C55B:
    COP #$97
    COP #$9B
    db $20,$00,$88,$C5,$67,$C5,$88,$C5,$02,$9A,$00,$00,$71,$C5,$78,$C5
    db $78,$C5,$02,$80,$1B,$02,$82,$80,$07,$02,$80,$1C,$02,$82,$02,$96
    db $02,$81,$17,$2A,$02,$83,$02,$86,$6B
    COP #$9A
    db $18,$00,$A0,$C5,$92,$C5,$A0,$C5
    COP #$80
    db $1A
    COP #$82
    COP #$81
    db $18,$0A
    COP #$83
    COP #$86
    RTL
    db $02,$80,$19,$02,$82,$82,$B5,$FF

CODE_00C5A8:
    COP #$96

CODE_00C5AA:
    COP #$9B
    db $20,$00,$D5,$C5,$B4,$C5,$D5,$C5
    COP #$9A
    db $00,$00,$BE,$C5,$C7,$C5,$C7,$C5
    COP #$80
    db $1C
    COP #$82
    COP #$97
    BRA CODE_00C5CC
    db $02,$80,$1B,$02,$82

CODE_00C5CC:
    COP #$81
    db $17,$2A
    COP #$83
    COP #$86
    RTL
    COP #$9A
    db $18,$00,$ED,$C5,$DF,$C5,$ED,$C5,$02,$80,$1A,$02,$82,$02,$81,$18
    db $0A,$02,$83,$02,$86,$6B
    COP #$80
    db $19
    COP #$82
    BRL CODE_00C5AA
    COP #$03
    db $10
    COP #$B0
    db $17,$C6,$00,$00,$03
    COP #$1B
    db $05,$C6,$02,$00
    COP #$B0
    db $22,$C6,$00,$00,$03
    COP #$1B
    db $12,$C6,$02,$00
    COP #$04
    COP #$86
    RTL
    JSR.W CODE_00C62D
    COP #$80
    db $10
    COP #$82
    COP #$86
    RTL
    JSR.W CODE_00C62D
    COP #$80
    db $11
    COP #$82
    COP #$86
    RTL

CODE_00C62D:
    LDY.W $039A
    COP #$1F
    COP #$35
    db $20
    LDA.W $0437
    SEC
    SBC.W #$0008
    CLC
    ADC.W $0000,Y
    STA.W $0000,X
    COP #$1F
    COP #$35
    db $10
    LDA.W $0437
    SEC
    SBC.W #$000C
    CLC
    ADC.W $0002,Y
    STA.W $0002,X
    COP #$A3
    RTS
    STZ.W $03B2
    INC.W $0458
    STX.W $039A
    LDA.W $001A,X
    ORA.W #$0400
    STA.W $001A,X
    COP #$85
    db $88,$B1,$00
    LDA.W #$0003
    STA.W $0030,Y
    BRL CODE_00C77D

CODE_00C679:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W $0030,X
    BEQ CODE_00C688
    COP #$09
    db $00,$80

CODE_00C688:
    COP #$0C
    db $00,$02,$A8,$C6
    COP #$9A
    db $28,$00,$98,$C6,$7D,$C7,$A0,$C6,$02,$80,$10,$02,$82,$82,$6B,$01
    db $02,$80,$0D,$02,$82,$82,$9A,$01
    %CopJumpIfEventFlagIsUnset($8001, $C879)
    COP #$80
    db $10
    COP #$82
    COP #$80
    db $11
    COP #$82
    COP #$09
    db $01,$80
    BRL CODE_00CA01

CODE_00C6BF:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W $0030,X
    BEQ CODE_00C6CE
    db $02,$09,$00,$80

CODE_00C6CE:
    COP #$0C
    db $00,$02,$EE,$C6
    COP #$9B
    db $28,$00,$DE,$C6,$0B,$C8,$E6,$C6,$02,$80,$0C,$02,$82,$82,$97,$00
    COP #$80
    db $11
    COP #$82
    BRL CODE_00C7C4
    db $02,$07,$01,$80,$DB,$C8,$02,$80,$11,$02,$82,$02,$09,$01,$80,$82
    db $01,$03

CODE_00C700:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W $0030,X
    BEQ CODE_00C70F
    COP #$09
    db $00,$80

CODE_00C70F:
    COP #$0C
    db $00,$02,$2F,$C7,$02,$9B,$28,$00,$1F,$C7,$42,$C8,$27,$C7,$02,$80
    db $0F,$02,$82,$82,$56,$00,$02,$80,$12,$02,$82,$82,$95,$00
    %CopJumpIfEventFlagIsUnset($8001, $C93D)

    db $02,$80,$12,$02,$82,$02,$09,$01,$80,$82,$C0,$02

CODE_00C741:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W $0030,X
    BEQ CODE_00C750
    COP #$09
    db $00,$80

CODE_00C750:
    COP #$0C
    db $00,$02,$70,$C7
    COP #$9A
    db $28,$00,$60,$C7,$C4,$C7,$68,$C7
    COP #$80
    db $13
    COP #$82
    BRL CODE_00C80B
    COP #$80
    db $0E
    COP #$82
    BRL CODE_00C842
    %CopJumpIfEventFlagIsUnset($8001, $C99F)
    COP #$09
    db $01,$80
    BRL CODE_00CA01

CODE_00C77D:
    LDA.W $0002,X
    CMP.W #$00A0
    BEQ UNREACH_00C79D
    %CopJumpIfEventFlagIsUnset($8000, $C794)
    COP #$81
    db $0A,$04
    COP #$83
    BRL CODE_00C679
    COP #$81
    db $0B,$04
    COP #$83
    BRL CODE_00C679

UNREACH_00C79D:
    db $02,$9A,$20,$00,$A7,$C7,$AF,$C7,$BC,$C7,$02,$80,$10,$02,$82,$82
    db $10,$FF,$02,$80,$10,$02,$82,$02,$80,$11,$02,$82,$82,$85,$FF,$02
    db $80,$0D,$02,$82,$82,$3C,$FF

CODE_00C7C4:
    LDA.W $0002,X
    CMP.W #$01A0
    BEQ UNREACH_00C7E4
    %CopJumpIfEventFlagIsUnset($8000, $C7DB)
    COP #$81
    db $08,$04
    COP #$83
    BRL CODE_00C741
    db $02,$81,$09,$04,$02,$83,$82,$5D,$FF

UNREACH_00C7E4:
    db $02,$9A,$20,$00,$EE,$C7,$F6,$C7,$03,$C8,$02,$80,$13,$02,$82,$82
    db $C9,$FE,$02,$80,$0E,$02,$82,$02,$80,$0F,$02,$82,$82,$76,$FE,$02
    db $80,$0E,$02,$82,$82,$F5,$FE

CODE_00C80B:
    %CopJumpIfEventFlagIsUnset($8000, $C821)
    LDA.W $0000,X
    CMP.W #$0070
    BEQ UNREACH_00C830
    COP #$80
    db $06
    COP #$82
    BRL CODE_00C6BF
    db $BD,$00,$00,$C9,$70,$00,$F0,$07,$02,$80,$07,$02,$82,$80,$F1

UNREACH_00C830:
    db $BD,$16,$00,$09,$00,$03,$9D,$16,$00,$02,$81,$07,$04,$02,$83,$82
    db $EF,$01

CODE_00C842:
    %CopJumpIfEventFlagIsUnset($8000, $C858)
    LDA.W $0000,X
    CMP.W #$0160
    BEQ CODE_00C867
    COP #$80
    db $04
    COP #$82
    BRL CODE_00C700

CODE_00C858:
    LDA.W $0000,X
    CMP.W #$0160
    BEQ CODE_00C867
    COP #$80
    db $05
    COP #$82
    BRA CODE_00C858

CODE_00C867:
    LDA.W $0016,X
    ORA.W #$0300
    STA.W $0016,X
    COP #$81
    db $05,$04
    COP #$83
    BRL CODE_00CA4C
    db $02,$80,$1A,$02,$82,$02,$B2,$AB,$CB,$00,$08,$00,$E0,$FF,$00,$02
    db $02,$03,$11,$02,$04,$02,$9A,$20,$00,$98,$C8,$B0,$C8,$C3,$C8,$02
    db $80,$10,$02,$82,$02,$80,$19,$02,$82,$02,$B2,$C1,$CB,$00,$FE,$FF
    db $E0,$FF,$00,$02,$82,$5B,$FF,$02,$80,$1A,$02,$82,$02,$B2,$AB,$CB
    db $00,$08,$00,$E0,$FF,$00,$02,$82,$BA,$FE,$02,$80,$0D,$02,$82,$02
    db $80,$18,$02,$82,$02,$B2,$B6,$CB,$00,$12,$00,$E0,$FF,$00,$02,$82
    db $67,$FF,$02,$80,$19,$02,$82,$02,$B2,$C1,$CB,$00,$FE,$FF,$E0,$FF
    db $00,$02,$02,$03,$11,$02,$04,$02,$9B,$20,$00,$FA,$C8,$12,$C9,$25
    db $C9,$02,$80,$0C,$02,$82,$02,$80,$1A,$02,$82,$02,$B2,$AB,$CB,$00
    db $08,$00,$E0,$FF,$00,$02,$82,$6B,$FE,$02,$80,$19,$02,$82,$02,$B2
    db $C1,$CB,$00,$FE,$FF,$E0,$FF,$00,$02,$82,$E6,$FE,$02,$80,$12,$02
    db $82,$02,$80,$1B,$02,$82,$02,$B2,$CC,$CB,$00,$08,$00,$E2,$FF,$00
    db $02,$82,$87,$FE
    COP #$80
    db $18
    COP #$82
    COP #$B2
    db $B6,$CB,$00,$12,$00,$E0,$FF,$00,$02
    COP #$03
    db $11
    COP #$04
    COP #$9B
    db $20,$00,$5C,$C9,$74,$C9,$87,$C9
    COP #$80
    db $0F
    COP #$82
    COP #$80
    db $1A
    COP #$82
    COP #$B2
    db $AB,$CB,$00,$08,$00,$E0,$FF,$00,$02
    BRL CODE_00C77D
    db $02,$80,$18,$02,$82,$02,$B2,$B6,$CB,$00,$12,$00,$E0,$FF,$00,$02
    db $82,$BB,$FE,$02,$80,$12,$02,$82,$02,$80,$1B,$02,$82,$02,$B2,$CC
    db $CB,$00,$08,$00,$E2,$FF,$00,$02,$82,$25,$FE,$02,$80,$1B,$02,$82
    db $02,$B2,$CC,$CB,$00,$08,$00,$E2,$FF,$00,$02,$02,$03,$11,$02,$04
    db $02,$9A,$20,$00,$BE,$C9,$D6,$C9,$E9,$C9,$02,$80,$13,$02,$82,$02
    db $80,$19,$02,$82,$02,$B2,$C1,$CB,$00,$FE,$FF,$E0,$FF,$00,$02,$82
    db $35,$FE,$02,$80,$1B,$02,$82,$02,$B2,$CC,$CB,$00,$08,$00,$E2,$FF
    db $00,$02,$82,$DB,$FD,$02,$80,$0E,$02,$82,$02,$80,$18,$02,$82,$02
    db $B2,$B6,$CB,$00,$12,$00,$E0,$FF,$00,$02,$82,$41,$FE

CODE_00CA01:
    LDA.W $0016,X
    ORA.W #$0200
    STA.W $0016,X
    COP #$80
    db $16
    COP #$82
    COP #$B2
    db $1C,$CB,$00,$00,$00,$F0,$FF,$00,$02
    COP #$80
    db $17
    COP #$82
    COP #$81
    db $14,$02
    COP #$83
    LDA.W $0016,X
    AND.W #$FDFF
    STA.W $0016,X
    BRL CODE_00C741
    db $02,$80,$11,$02,$82,$00,$5F,$02,$81,$22,$10,$02,$83,$02,$81,$23
    db $08,$02,$83,$02,$03,$3D,$02,$04,$82,$1B,$00

CODE_00CA4C:
    COP #$80
    db $12
    COP #$82
    BRK #$5F
    COP #$81
    db $22,$10
    COP #$83
    COP #$81
    db $23,$08
    COP #$83
    COP #$03
    db $3D
    COP #$04
    BRL CODE_00CAA9
    db $20,$EB,$CA,$9D,$02,$00,$A9,$30,$00,$9D,$00,$00,$00,$5F,$02,$81
    db $23,$08,$02,$83,$02,$81,$22,$10,$02,$83,$BD,$25,$00,$29,$FF,$00
    db $9D,$30,$00,$02,$09,$00,$00,$02,$09,$01,$00,$BD,$16,$00,$29,$FF
    db $FC,$9D,$16,$00,$02,$80,$0E,$02,$82,$02,$81,$04,$04,$02,$83,$82
    db $57,$FC

CODE_00CAA9:
    JSR.W CODE_00CAEB
    STA.W $0002,X
    LDA.W #$01A0
    STA.W $0000,X
    BRK #$5F
    COP #$81
    db $23,$08
    COP #$83
    COP #$81
    db $22,$10
    COP #$83
    LDA.W $0025,X
    AND.W #$00FF
    STA.W $0030,X
    COP #$09
    db $00,$00
    COP #$09
    db $01,$00
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X
    COP #$80
    db $13
    COP #$82
    COP #$81
    db $06,$04
    COP #$83
    BRL CODE_00C6BF

CODE_00CAEB:
    COP #$1F
    LDA.W $0302
    AND.W #$00FF
    LDY.W #$00A0
    SEC
    SBC.W #$0033
    BMI CODE_00CB1A
    db $A0,$E0,$00,$38,$E9,$33,$00,$30,$15,$A0,$20,$01,$38,$E9,$33,$00
    db $30,$0C,$A0,$60,$01,$38,$E9,$33,$00,$30,$03,$A0,$A0,$01

CODE_00CB1A:
    TYA
    RTS
    COP #$A3
    COP #$80
    db $20
    COP #$82
    COP #$B2
    db $36,$CB,$00,$08,$00,$F8,$FF,$00,$03
    COP #$80
    db $21
    COP #$82
    COP #$86
    RTL
    BRK #$61
    COP #$80
    db $1C
    COP #$82

CODE_00CB3D:
    COP #$80
    db $1D
    COP #$82
    LDA.W $0002,X
    BPL CODE_00CB3D
    COP #$80
    db $1D
    COP #$82
    COP #$03
    db $0C
    BRK #$52
    COP #$B0
    db $63,$CB,$00,$00,$03
    COP #$1B
    db $5E,$CB,$0C,$00
    COP #$04
    COP #$86
    RTL
    COP #$1F
    LDA.W $0302
    AND.W #$007F
    SEC
    SBC.W #$0040
    CLC
    ADC.W player_pos_x_real
    STA.W $0000,X
    COP #$1F
    LDA.W $0302
    AND.W #$007F
    SEC
    SBC.W #$0040
    CLC
    ADC.W player_pos_y_real
    SEC
    SBC.W #$00FF
    STA.W $0002,X
    COP #$81
    db $1E,$10
    COP #$83
    LDA.W #$0200
    STA.W $0016,X
    BRK #$5A
    COP #$A4
    COP #$A1
    db $F8,$FF,$F8,$FF
    COP #$80
    db $1F
    COP #$82
    COP #$86
    RTL
    BRK #$5D
    COP #$97
    COP #$80
    db $02
    COP #$82
    BRA CODE_00CBD7
    BRK #$5D
    COP #$96
    COP #$80
    db $00
    COP #$82
    BRA CODE_00CBD7
    db $00,$5D,$02,$97,$02,$80,$00,$02,$82,$80,$0B,$00,$5D,$02,$A3,$02
    db $97,$02,$80,$01,$02,$82

CODE_00CBD7:
    COP #$A3
    COP #$81
    db $03,$03
    COP #$83
    LDY.W #$0003
    SEP #$20
    LDA.B #$00
    PHA
    REP #$20
    LDA.W #$AD66
    PHA
    RTL
    INC.W $0458
    STX.W $039A
    COP #$85
    db $09,$CD,$00

CODE_00CBF9:
    COP #$80
    db $08
    COP #$82

CODE_00CBFE:
    COP #$9B
    db $70,$00,$08,$CC,$08,$CC,$0F,$CC
    COP #$80
    db $09
    COP #$82
    BRA CODE_00CBFE
    COP #$80
    db $0A
    COP #$82
    COP #$87
    COP #$80
    db $03
    COP #$82
    COP #$80
    db $04
    COP #$82

CODE_00CC20:
    COP #$81
    db $00,$02
    COP #$83
    COP #$1F
    LDA.W $0302
    AND.W #$0007
    CMP.W #$0005
    BCS CODE_00CC4D
    COP #$80
    db $0E
    COP #$82
    BRK #$56
    COP #$81
    db $0F,$0D
    COP #$83
    COP #$80
    db $10
    COP #$82
    COP #$80
    db $02
    COP #$82
    BRL CODE_00CBF9

CODE_00CC4D:
    COP #$80
    db $01
    COP #$82
    COP #$80
    db $1B
    COP #$82

CODE_00CC57:
    LDA.W $0000,X
    CMP.W #$00F0
    BEQ CODE_00CCA0
    CMP.W #$01E0
    BEQ CODE_00CCA0
    COP #$9A
    db $18,$00,$6E,$CC,$75,$CC,$6E,$CC

CODE_00CC6E:
    COP #$80
    db $1B
    COP #$82
    BRA CODE_00CC57
    COP #$80
    db $04
    COP #$82
    COP #$B2
    db $AA,$CC,$00,$08,$00,$08,$00,$00,$02
    COP #$80
    db $00
    COP #$82
    BRA CODE_00CC6E
    db $BD,$00,$00,$C9,$F0,$00,$F0,$0C,$C9,$E0,$01,$F0,$07,$02,$80,$1B
    db $02,$82,$80,$EC

CODE_00CCA0:
    COP #$80
    db $04
    COP #$82
    COP #$87
    BRL CODE_00CC20
    COP #$80
    db $18
    COP #$82
    COP #$80
    db $19
    COP #$82
    COP #$80
    db $1A
    COP #$82
    BRK #$65
    COP #$B0
    db $CF,$CC,$00,$00,$02
    COP #$80
    db $19
    COP #$82
    COP #$80
    db $18
    COP #$82
    COP #$86
    RTL
    COP #$81
    db $17,$02
    COP #$83
    COP #$B0
    db $DF,$CC,$00,$00,$02
    COP #$86
    RTL
    COP #$80
    db $16
    COP #$82
    COP #$9B
    db $00,$00,$EE,$CC,$F6,$CC,$F6,$CC
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00CD06
    COP #$B2
    db $DF,$CC,$00,$00,$00,$10,$00,$00,$02
    COP #$80
    db $1C
    COP #$82

CODE_00CD06:
    COP #$86
    RTL

CODE_00CD09:
    LDY.W $039A
    LDA.W $0025,Y
    AND.W #$00FF
    STA.W $0030,X
    %CopSetScriptAddrToNextInstruction()
    LDY.W $039A
    LDA.W $0016,Y
    BIT.W #$0400
    BNE CODE_00CD5C
    LDA.W $0025,Y
    AND.W #$00FF
    CMP.W $0030,X
    BNE CODE_00CD2E
    RTL

CODE_00CD2E:
    LDA.W $0000,Y
    STA.W $0000,X
    LDA.W $0002,Y
    SEC
    SBC.W #$0008
    STA.W $0002,X
    COP #$B0
    db $5F,$CD,$00,$00,$03
    COP #$B0
    db $5F,$CD,$00,$00,$03
    COP #$B0
    db $6B,$CD,$00,$00,$03
    COP #$B0
    db $6B,$CD,$00,$00,$03
    BRA CODE_00CD09

CODE_00CD5C:
    COP #$86
    RTL
    JSR.W CODE_00CD77
    COP #$81
    db $14,$04
    COP #$83
    COP #$86
    RTL
    JSR.W CODE_00CD77
    COP #$81
    db $15,$04
    COP #$83
    COP #$86
    RTL

CODE_00CD77:
    COP #$1F
    COP #$35
    db $30
    LDA.W $0437
    SEC
    SBC.W #$0010
    CLC
    ADC.W $0000
    STA.W $0000,X
    RTS
    STX.W $039A
    LDA.W $001A,X
    ORA.W #$0200
    STA.W $001A,X
    COP #$9F
    db $08,$00
    %CopSetScriptAddrToNextInstruction()
    LDY.W $039C
    LDA.W $0002,Y
    CMP.W #$0080
    BCC CODE_00CDA9
    RTL

CODE_00CDA9:
    COP #$85
    db $88,$B1,$00
    LDA.W #$0004
    STA.W $0030,Y
    COP #$1B
    db $BA,$CD,$04,$00
    LDA.W #$2FC0
    TSB.W wButtonMask
    BRK #$A0
    COP #$80
    db $01
    COP #$82
    LDA.W #$0100
    STA.W $0344
    COP #$01
    db $F8,$CE
    LDA.W #$2FC0
    TRB.W wButtonMask
    LDA.W $0016,X
    AND.W #$FDFF
    STA.W $0016,X
    COP #$32
    db $0D
    BRA CODE_00CE44

CODE_00CDE5:
    COP #$1F
    COP #$35
    db $A0
    LDA.W $0437
    CLC
    ADC.W #$0028
    STA.W $0000,X
    LDA.W #$0060
    STA.W $0002,X
    COP #$80
    db $01
    COP #$82
    LDA.W $0016,X
    AND.W #$FDFF
    STA.W $0016,X
    COP #$80
    db $02
    COP #$82
    BRK #$4B
    COP #$B2
    db $4B,$CE,$00,$00,$00,$EE,$FF,$00,$02
    COP #$B2
    db $8A,$CE,$00,$00,$00,$EE,$FF,$00,$02
    COP #$B2
    db $C9,$CE,$00,$00,$00,$EE,$FF,$00,$02
    COP #$80
    db $03
    COP #$82
    COP #$1B
    db $3B,$CE,$50,$00,$BD,$16,$00,$09,$00,$02,$9D,$16,$00

CODE_00CE44:
    COP #$80
    db $04
    COP #$82
    BRA CODE_00CDE5
    COP #$A3
    COP #$97
    COP #$90
    COP #$88
    COP #$9A
    db $20,$00,$5D,$CE,$64,$CE,$64,$CE,$02,$80,$0A,$02,$82,$80,$EF
    COP #$80
    db $05
    COP #$82
    COP #$9B
    db $20,$00,$73,$CE,$7A,$CE,$73,$CE,$02,$80,$09,$02,$82,$80,$EF
    COP #$96
    COP #$80
    db $06
    COP #$82
    COP #$81
    db $0A,$10
    COP #$83
    COP #$86
    RTL
    COP #$A3
    COP #$96
    COP #$90
    COP #$88

CODE_00CE92:
    COP #$9A
    db $20,$00,$A3,$CE,$A3,$CE,$9C,$CE
    COP #$80
    db $0A
    COP #$82
    BRA CODE_00CE92
    COP #$80
    db $05
    COP #$82
    COP #$9B
    db $20,$00,$B2,$CE,$B9,$CE,$B2,$CE,$02,$80,$09,$02,$82,$80,$EF
    COP #$97
    COP #$80
    db $06
    COP #$82
    COP #$81
    db $0A,$10
    COP #$83
    COP #$86
    RTL
    COP #$A3
    COP #$97

CODE_00CECD:
    COP #$9B
    db $20,$00,$DE,$CE,$DE,$CE,$D7,$CE
    COP #$80
    db $08
    COP #$82
    BRA CODE_00CECD
    COP #$9A
    db $00,$00,$EA,$CE,$EA,$CE,$E8,$CE
    COP #$96
    COP #$80
    db $07
    COP #$82
    COP #$81
    db $0B,$08
    COP #$83
    COP #$86
    RTL
    db $10,$91
    db "poor creature that",$0D
    db "repeats transmigration",$0D
    db $CB,$E1,$DD,$96
    db "cannot",$0D
    db "die. ",$11,$88,$F1,$D0
    db $FE,$BB,$0D,$97
    db "deep sleep. "
    db $12,$08,$08,$04,$0C
    db $AC,$9A,$03
    LDA.W $0016,Y
    BIT.W #$0400
    BNE CODE_00CF59
    RTL

CODE_00CF59:
    STX.W $039A
    LDA.W $0000,Y
    STA.W $0000,X
    LDA.W $0002,Y
    STA.W $0002,X
    COP #$1B
    db $6E,$CF,$B4,$00
    LDA.W $0016,X
    AND.W #$DFFF
    STA.W $0016,X
    COP #$85
    db $9E,$CF,$00
    COP #$80
    db $1F
    COP #$82
    COP #$08
    db $00,$80,$7C,$CF
    COP #$85
    db $A9,$CF,$00
    COP #$81
    db $1F,$03
    COP #$83
    COP #$10
    db $15,$02,$01,$78,$00,$C8,$00
    %CopSetScriptAddrToNextInstruction()
    RTL
    COP #$01
    db $B6,$CF
    COP #$09
    db $00,$80
    COP #$86
    RTL
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $48
    COP #$94
    COP #$86
    RTL
    db $10,$53,$6F,$6D,$65,$20,$CF,$A5,$0D,$62,$65,$69,$6E,$67,$20,$63
    db $6F,$6E,$73,$74,$61,$6E,$74,$6C,$79,$20,$0D,$72,$65,$69,$6E,$63
    db $61,$72,$6E,$61,$74,$65,$64,$20,$6D,$65,$61,$6E,$73,$20,$0D,$65
    db $76,$65,$72,$6C,$61,$73,$74,$69,$6E,$67,$20,$73,$75,$66,$66,$65
    db $72,$69,$6E,$67,$2E,$11,$42,$65,$69,$6E,$67,$20,$61,$6C,$69,$76
    db $65,$20,$BA,$0D,$73,$75,$66,$66,$65,$72,$69

UNREACH_00D011:
    db $6E,$67,$20,$AE,$73,$6F,$6D,$65,$20,$0D,$63,$72,$65,$61,$74,$75
    db $72,$65,$73,$2E,$20,$11,$95,$F1,$66,$69,$6E,$64,$20,$6F,$75,$74
    db $20,$77,$68,$61,$74,$0D,$88,$6D,$65,$61,$6E,$2E,$20,$12,$08,$08
    db $04,$0C
    STX.W $039A
    LDA.W $001A,X
    ORA.W #$0200
    STA.W $001A,X
    STZ.W $0466
    COP #$85
    db $C6,$D5,$00
    COP #$AC
    db $44,$D3,$00,$38,$00,$70,$00,$00,$02
    COP #$AC
    db $4C,$D3,$00,$B8,$00,$70,$00,$00,$02
    COP #$AC
    db $C4,$D1,$00,$38,$00,$40,$00,$00,$02
    COP #$AC
    db $F2,$D1,$00,$B8,$00,$40,$00,$00,$02
    COP #$03
    db $3D
    COP #$04
    BRA CODE_00D0ED

CODE_00D08A:
    %CopSetScriptAddrToNextInstruction()
    LDA.W gameState
    AND.W #$00FF
    CMP.W #$0004
    BEQ CODE_00D098
    RTL

CODE_00D098:
    SEP #$20
    STZ.W gameState
    REP #$20
    COP #$80
    db $14
    COP #$82
    LDA.W $0016,X
    AND.W #$FDFF
    STA.W $0016,X
    COP #$80
    db $12
    COP #$82
    COP #$B0
    db $B6,$D1,$00,$00,$03
    COP #$80
    db $13
    COP #$82
    COP #$B2
    db $94,$D1,$00,$08,$00,$10,$00,$00,$02
    COP #$B2
    db $A4,$D1,$00,$08,$00,$10,$00,$00,$02
    COP #$B2
    db $B2,$D1,$00,$08,$00,$10,$00,$00,$02
    LDA.W $0016,X
    ORA.W #$0200
    STA.W $0016,X
    COP #$80
    db $15
    COP #$82

CODE_00D0ED:
    COP #$03
    db $04
    COP #$B0
    db $01,$D1,$00,$01,$03
    COP #$1B
    db $FD,$D0,$28,$00
    COP #$04
    BRA CODE_00D08A
    LDA.W $001A,X
    ORA.W #$0100
    STA.W $001A,X
    COP #$1F
    COP #$35
    db $A0
    LDA.W $0437
    CLC
    ADC.W #$0020
    STA.W $0000,X
    COP #$1F
    COP #$35
    db $1E
    LDA.W $0437
    CLC
    ADC.W #$00B0
    STA.W $0002,X
    SEP #$20
    LDA.B #$FF
    STA.W $0025,X
    REP #$20
    COP #$80
    db $16
    COP #$82
    LDA.W $0016,X
    AND.W #$FCFF
    STA.W $0016,X

CODE_00D13F:
    LDA.W $0025,X
    AND.W #$00FF
    CMP.W #$00FC
    BCC CODE_00D151
    COP #$80
    db $17
    COP #$82
    BRA CODE_00D13F

CODE_00D151:
    LDA.W $0016,X
    ORA.W #$0300
    STA.W $0016,X
    COP #$80
    db $18
    COP #$82
    SEP #$20
    INC.W gameState
    REP #$20
    COP #$B0
    db $70,$D1,$00,$00,$40
    COP #$86
    RTL
    COP #$A8
    db $00,$80,$0E
    LDA.W $0005
    STA.W $001E,X
    STZ.W $0020,X
    LDA.W $0372
    STA.W $001C,X
    COP #$A4
    COP #$80
    db $05
    COP #$82
    COP #$81
    db $0A,$04
    COP #$83
    COP #$86
    RTL
    BRK #$51
    COP #$80
    db $1A
    COP #$82
    COP #$81
    db $1C,$08
    COP #$83
    COP #$86
    RTL

CODE_00D1A4:
    COP #$80
    db $1B
    COP #$82
    COP #$81
    db $1C,$08
    COP #$83
    COP #$86
    RTL
    COP #$96
    BRA CODE_00D1A4
    COP #$A3
    COP #$A0
    db $FE,$FF
    COP #$80
    db $19
    COP #$82
    COP #$86
    RTL

CODE_00D1C4:
    COP #$81
    db $0E,$0E
    COP #$83
    COP #$80
    db $0D
    COP #$82
    BRK #$4B
    COP #$B0
    db $20,$D2,$00,$00,$02
    COP #$1B
    db $DE,$D1,$02,$00
    COP #$03
    db $03
    COP #$B0
    db $6F,$D2,$00,$00,$02
    COP #$1B
    db $EE,$D1,$03,$00
    COP #$04
    BRA CODE_00D1C4

CODE_00D1F2:
    COP #$81
    db $0E,$0E
    COP #$83
    COP #$80
    db $0D
    COP #$82
    BRK #$4B
    COP #$B0
    db $B2,$D2,$00,$00,$02
    COP #$1B
    db $0C,$D2,$02,$00
    COP #$03
    db $03
    COP #$B0
    db $01,$D3,$00,$00,$02
    COP #$1B
    db $1C,$D2,$03,$00
    COP #$04
    BRA CODE_00D1F2

CODE_00D220:
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00D26C
    COP #$81
    db $0C,$02
    COP #$83
    COP #$9A
    db $00,$00,$38,$D2,$52,$D2,$52,$D2
    COP #$09
    db $06,$99
    COP #$A1
    db $F8,$FF,$08,$00
    COP #$97
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $F8,$FF,$08,$00
    BRA CODE_00D220
    COP #$09
    db $06,$19
    COP #$A1
    db $08,$00,$08,$00
    COP #$96
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $08,$00,$08,$00
    BRA CODE_00D220

CODE_00D26C:
    COP #$86
    RTL

CODE_00D26F:
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00D2AF
    COP #$81
    db $0C,$02
    COP #$83
    %CopJumpIfEventFlagIsUnset($1906, $D299)
    COP #$A1
    db $F8,$FF,$08,$00
    COP #$97
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $F8,$FF,$08,$00
    BRA CODE_00D26F
    COP #$A1
    db $08,$00,$08,$00
    COP #$96
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $08,$00,$08,$00
    BRA CODE_00D26F

CODE_00D2AF:
    COP #$86
    RTL

CODE_00D2B2:
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00D2FE
    COP #$81
    db $0C,$02
    COP #$83
    COP #$9A
    db $00,$00,$CA,$D2,$E4,$D2,$E4,$D2
    COP #$09
    db $07,$99
    COP #$A1
    db $F8,$FF,$08,$00
    COP #$97
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $F8,$FF,$08,$00
    BRA CODE_00D2B2
    COP #$09
    db $07,$19
    COP #$A1
    db $08,$00,$08,$00
    COP #$96
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $08,$00,$08,$00
    BRA CODE_00D2B2

CODE_00D2FE:
    COP #$86
    RTL

CODE_00D301:
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00D341
    COP #$81
    db $0C,$02
    COP #$83
    %CopJumpIfEventFlagIsUnset($1907, $D32B)
    COP #$A1
    db $F8,$FF,$08,$00
    COP #$97
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $F8,$FF,$08,$00
    BRA CODE_00D301
    COP #$A1
    db $08,$00,$08,$00
    COP #$96
    COP #$81
    db $1D,$02
    COP #$83
    COP #$A1
    db $08,$00,$08,$00
    BRA CODE_00D301

CODE_00D341:
    COP #$86
    RTL
    COP #$80
    db $11
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    RTL
    COP #$80
    db $10
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    RTL
    SEP #$20
    LDA.B #$00
    STA.W $0036,X
    REP #$20
    LDA.W #$2010
    STA.W $0016,X
    INC.W $0466
    %CopRestoreToFullHealth()
    COP #$31
    db $00
    COP #$03
    db $F1
    COP #$04
    LDA.W $0016,X
    AND.W #$FFEF
    STA.W $0016,X
    COP #$01
    db $C6,$D3
    LDA.W playerSouls
    AND.W #$001F
    DEC A
    BEQ UNREACH_00D38C
    COP #$01
    db $3B,$D4
    BRA CODE_00D390

UNREACH_00D38C:
    db $02,$01,$0B,$D4

CODE_00D390:
    SEP #$20
    STZ.W playerSouls
    REP #$20
    COP #$03
    db $3D
    COP #$04
    COP #$01
    db $93,$D5
    COP #$85
    db $B9,$D5,$00
    COP #$03
    db $F1
    COP #$04
    COP #$09
    db $02,$9F
    LDA.W #$0006
    STA.W textSpeed
    LDA.W #$0001
    STA.W $031E
    COP #$10
    db $00,$07,$01,$70,$00,$60,$00
    %CopSetScriptAddrToNextInstruction()
    RTL
    db $10,$46,$69,$6E,$61,$6C,$6C,$79,$2C,$20,$02,$02,$20,$0D,$64,$65
    db $66,$65,$61,$74,$65,$64,$20,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C
    db $21,$20,$11,$53,$75,$64,$64,$65,$6E,$6C,$79,$20,$02,$02,$0D,$68
    db $65,$61,$72,$64,$20,$97,$73,$6D,$61,$6C,$6C,$20,$76,$6F,$69,$63
    db $65,$2E,$20,$11,$0C,$10,$02,$02,$2C,$88,$64,$65,$63,$69,$64,$65
    db $64,$20,$E2,$0D,$73,$74,$61,$79,$20,$B9,$96,$73,$65,$61,$6C,$20
    db $74,$68,$65,$0D,$57,$6F,$72,$6C,$64,$20,$CB,$45,$76,$69,$6C,$2E
    db $20,$11,$13,$6C,$D4,$10,$02,$02,$2C,$20,$77,$65,$20,$64,$65,$63
    db $69,$64,$65,$64,$20,$0D,$E2,$73,$74,$61,$79,$20,$B9,$96,$73,$65
    db $61,$6C,$20,$0D,$E1,$57,$6F,$72,$6C,$64,$20,$CB,$45,$76,$69,$6C
    db $2E,$2E,$2E,$2E,$2E,$11,$91,$57,$6F,$72,$6C,$64,$20,$CB,$45,$76
    db $69,$6C,$20,$BA,$0D,$97,$64,$61,$72,$6B,$20,$F6,$E3,$0D,$65,$78
    db $69,$73,$74,$73,$20,$BB,$E1,$A0,$CB,$0D,$63,$72,$65,$61,$74,$75
    db $72,$65,$73,$60,$20,$6D,$69,$6E,$64,$73,$2E,$20,$11,$41,$73,$20
    db $6C,$6F,$6E,$67,$20,$61,$73,$20,$E9,$98,$0D,$69,$6E,$76,$65,$6E
    db $74,$69,$6F,$6E,$73,$20,$BB,$E4,$0D,$F6,$E1,$73,$61,$6D,$65,$20
    db $74,$68,$69,$6E,$67,$20,$0D,$F1,$68,$61,$70,$70,$65,$6E,$2E,$20
    db $11,$88,$F1,$73,$74,$61,$79,$20,$96,$74,$72,$79,$20,$74,$6F,$0D
    db $73,$74,$6F,$70,$20,$61,$73,$20,$6D,$75,$63,$68,$20,$61,$73,$20
    db $0D,$70,$6F,$73,$73,$69,$62,$6C,$65,$2E,$20,$11,$95,$98,$73,$74
    db $69,$6C,$6C,$20,$79,$6F,$75,$6E,$67,$2C,$20,$0D,$FE,$DC,$65,$78
    db $70,$65,$72,$69,$65,$6E,$63,$65,$20,$0D,$6D,$6F,$72,$65,$2E,$20
    db $11,$82,$69,$66,$20,$FE,$66,$69,$67,$75,$72,$65,$20,$6F,$75,$74
    db $20,$0D,$72,$65,$61,$73,$6F,$6E,$73,$20,$66,$6F,$72,$2C,$20,$0D
    db $9A,$66,$65,$65,$6C,$69,$6E,$67,$73,$2C,$20,$11,$9A,$63,$6F,$6E
    db $6E,$65,$63,$74,$69,$6F,$6E,$73,$20,$11,$96,$65,$78,$69,$73,$74
    db $65,$6E,$63,$65,$73,$2C,$20,$0D,$FE,$F1,$A1,$77,$69,$73,$65,$20
    db $BE,$0D,$E1,$4D,$61,$73,$74,$65,$72,$2E,$20,$11,$02,$02,$2C,$20
    db $B4,$67,$6F,$69,$6E,$67,$2E,$20,$12,$08,$08,$04,$0C,$10,$91,$57
    db $6F,$72,$6C,$64,$20,$CB,$45,$76,$69,$6C,$20,$0D,$62,$65,$67,$61
    db $6E,$20,$E2,$64,$69,$73,$61,$70,$70,$65,$61,$72,$2E,$20,$12,$08
    db $08,$04,$0C
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $4D
    COP #$94
    COP #$86
    RTL
    LDA.W $0016,X
    ORA.W #$0010
    STA.W $0016,X
    %CopSetScriptAddrToNextInstruction()
    SEP #$20
    LDA.W $0466
    BNE CODE_00D5E6
    LDA.B #$2C
    XBA
    LDA.B #$00
    LDY.W #$D5F9
    JSL.L CODE_02988A
    BRA CODE_00D5F2

CODE_00D5E6:
    LDA.B #$2C
    XBA
    LDA.B #$00
    LDY.W #$D5F5
    JSL.L CODE_02988A

CODE_00D5F2:
    REP #$20
    RTL
    db $7F,$16,$10,$16,$01,$17,$00

Native_mode_BRK:
    REP #$20
    PHA
    LDA.B $04,S
    DEC A
    STA.B $3B
    SEP #$20
    LDA.B $06,S
    STA.B $3D
    LDA.B [$3B]
    BIT.B #$40
    BNE CODE_00D615
    STA.W $0398
    BRA CODE_00D61A


CODE_00D615:
    AND.B #$BF
    STA.W $0399

CODE_00D61A:
    REP #$20
    PLA
    RTI

incsrc "bank00/handle_cop.asm"

setResetGameStateBit:
    PHX
    STA.B $00
    AND.W #$00FF
    TAX
    LDA.B $01
    AND.W #$007F
    TAY
    SEP #$20
    LDA.B $01
    BPL CODE_00E4E8
    LDA.L bitmask,X
    ORA.W gameState,Y
    BRA CODE_00E4F1


CODE_00E4E8:
    LDA.L bitmask,X
    EOR.B #$FF
    AND.W gameState,Y

CODE_00E4F1:
    STA.W gameState,Y
    PLX
    REP #$20
    RTS


checkGameStateBit:
    PHX
    STA.B $00
    AND.W #$00FF
    TAX
    LDA.B $01
    AND.W #$007F
    TAY
    SEP #$20
    LDA.L bitmask,X
    AND.W gameState,Y
    SEC
    BNE CODE_00E512
    CLC

CODE_00E512:
    PLX
    REP #$20
    RTS


bitmask:
    db $01,$02,$04,$08,$10,$20,$40,$80

checkIfItemIsEquipped:
    SEP #$20
    PHA
    TAY
    DEY
    LDA.W inventoryWeapons,Y
    AND.B #$7F
    BNE CODE_00E52F
    PLA
    REP #$20
    SEC
    RTS


CODE_00E52F:
    PLA
    LDA.W inventoryWeapons,Y
    REP #$20
    CLC
    RTS


CODE_00E537:
    LDA.W $0010,X
    CLC
    ADC.W $0012,X
    CMP.W #$0021
    BCS CODE_00E563
    PHX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    ORA.W #$00F0
    STA.L $7F8000,X
    PLX
    RTS


CODE_00E563:
    TXY
    LDA.W $0012,Y
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0C
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $0012,X

CODE_00E579:
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.W $0010,Y
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0E

CODE_00E588:
    LDA.L $7F8000,X
    ORA.W #$00F0
    STA.L $7F8000,X
    JSL.L CODE_04F31A
    DEC.B $0E
    BNE CODE_00E588
    LDA.B $18
    CLC
    ADC.W #$0010
    DEC.B $0C
    BNE CODE_00E579
    TYX
    RTS


CODE_00E5A7:
    LDA.W $0010,X
    CLC
    ADC.W $0012,X
    CMP.W #$0021
    BCS CODE_00E5D3
    PHX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    AND.W #$FF00
    STA.L $7F8000,X
    PLX
    RTS


CODE_00E5D3:
    TXY
    LDA.W $0012,Y
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0C
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W $0012,X

CODE_00E5E9:
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.W $0010,Y
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $0E

CODE_00E5F8:
    LDA.L $7F8000,X
    AND.W #$FF00
    STA.L $7F8000,X
    JSL.L CODE_04F31A
    DEC.B $0E
    BNE CODE_00E5F8
    LDA.B $18
    CLC
    ADC.W #$0010
    DEC.B $0C
    BNE CODE_00E5E9
    TYX
    RTS


CODE_00E617:
    SEP #$20
    XBA
    LDA.B #$40
    JSL.L multiply
    REP #$20
    CLC
    ADC.W #$0800
    TAY
    RTS


CODE_00E628:
    ASL A
    ASL A
    ASL A
    ASL A
    RTS


CODE_00E62D:
    PHA
    PHX
    ASL A
    TAX
    LDA.B $01,S
    STA.L $7F0483,X
    PLX
    PLA
    RTS


CODE_00E63A:
    JSL.L loadEntityPtr
    BCS CODE_00E661
    TXA
    STA.W $003E,Y
    LDA.W soundIdBank,X
    STA.W soundIdBank,Y
    TYA
    STA.W soundIdBank,X
    PHX
    LDX.W soundIdBank,Y
    BNE CODE_00E659
    STY.W $06A6
    BRA CODE_00E65D


CODE_00E659:
    TYA
    STA.W $003E,X

CODE_00E65D:
    PLX
    JSR.W IntroScene

CODE_00E661:
    RTS


CODE_00E662:
    JSL.L loadEntityPtr
    BCS CODE_00E689
    TXA
    STA.W soundIdBank,Y
    LDA.W $003E,X
    STA.W $003E,Y
    TYA
    STA.W $003E,X
    PHX
    LDX.W $003E,Y
    BEQ CODE_00E682
    TYA
    STA.W soundIdBank,X
    BRA CODE_00E685


CODE_00E682:
    STY.W currentEntityPtr

CODE_00E685:
    PLX
    JSR.W IntroScene

CODE_00E689:
    RTS


loadEntityPtr:
    LDA.B ($4A)
    BEQ CODE_00E69E
    TAY
    LDA.W #$0000
    STA.B ($4A)
    SEP #$20
    INC.B $4A
    INC.B $4A
    REP #$20
    CLC
    RTL


CODE_00E69E:
    SEC
    LDY.W #$06AA
    RTL


IntroScene:
    PHX
    PHY
    LDA.W #$003B
    MVN $01,$01
    PLY
    PLX
    LDA.W $0016,Y
    ORA.W #$2000
    AND.W #$FFEF
    STA.W $0016,Y
    LDA.W #$0000
    STA.W $001A,Y
    STA.W $0030,Y
    STA.W $0014,Y
    RTS

IntrosCene_Script:
    LDA.W #!Key16_A|!Key16_Start|!Key16_Select
    TSB.W wButtonMask
    STX.W $039C
    PHX
    LDY.W #$C176
    JSL.L printOsdStringFromBank2
    PLX
    COP #$1B
    db $DE,$E6,$01,$00
    SEP #$20
    PHX
    JSL.L CODE_1FEFBC
    JSL.L CODE_02A463
    JSL.L CODE_04F19F
    PLX
    REP #$20
    COP #$10
    db $00,$0A,$01,$00,$00,$00,$00
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00E6FC:
    LDA.W #$3000
    TSB.W wButtonMask
    STZ.W wButtonsPressed
    STX.W $039C
    LDA.W $0445
    BEQ CODE_00E710
    BRL CODE_00ECC1


CODE_00E710:
    COP #$85
    db $61,$EB,$00
    STZ.W $0482
    SEP #$20
    LDA.B #$E0
    STA.L $7F0200
    LDA.B #$0F
    STA.W $2105
    LDA.B #$11
    STA.W $212C
    REP #$20
    LDA.W #$FFC8
    STA.W m7xForNmi
    LDA.W #$003E
    STA.W m7yForNmi
    LDA.W #$0083
    STA.W $0480
    %CopSetScriptAddrToNextInstruction()
    INC.W m7xForNmi
    LDA.W m7xForNmi
    CMP.W #$013E
    BEQ CODE_00E74C
    RTL


CODE_00E74C:
    LDA.W #$0002
    STA.W $0480
    COP #$03
    db $1F
    COP #$04
    LDA.W #$0080
    STA.W m7xForNmi
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0480
    CLC
    ADC.W #$0004
    STA.W $0480
    CMP.W #$0206
    BEQ CODE_00E76F
    RTL


CODE_00E76F:
    COP #$03
    db $1F
    COP #$04
    PHX
    LDY.W #$BB36
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $5E,$EA,$00
    COP #$03
    db $1F
    COP #$04
    COP #$AC
    db $51,$EB,$00,$50,$FF,$80,$00,$00,$23
    COP #$AC
    db $29,$EB,$00,$98,$01,$78,$00,$00,$03
    COP #$AC
    db $01,$EB,$00,$98,$01,$78,$00,$00,$03
    COP #$85
    db $90,$EA,$00
    COP #$03
    db $F1
    COP #$04
    PHX
    LDY.W #$BB27
    JSL.L printOsdStringFromBank2
    PLX
    LDA.W #$3000
    TRB.W wButtonMask
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $79
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $3D
    COP #$04
    INC.W $0482
    COP #$03
    db $79
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BB85
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BBE1
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BC3D
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BCB6
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BD4D
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BDBA
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BE2A
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BE51
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BEBF
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BF35
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$BFCD
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$C023
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$C06A
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    PHX
    JSL.L clearL3
    LDY.W #$C0FA
    JSL.L printOsdStringFromBank2
    PLX
    COP #$85
    db $40,$EA,$00
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$03
    db $F1
    COP #$04
    COP #$85
    db $25,$EA,$00
    COP #$03
    db $21
    COP #$04
    JSL.L clearL3
    COP #$03
    db $1F
    COP #$04
    STZ.W $0482
    COP #$03
    db $81
    COP #$04
    LDA.W #$FFFF
    STA.W $0482
    LDA.W #$FFC8
    STA.W m7xForNmi
    LDA.W #$003E
    STA.W m7yForNmi
    LDA.W #$0083
    STA.W $0480
    COP #$1B
    db $15,$E7,$01,$00
    STZ.W $0030,X
    COP #$03
    db $20
    SEP #$20
    LDA.W $0030,X
    ORA.B #$E0
    STA.L $7F0200
    REP #$20
    INC.W $0030,X
    COP #$04
    COP #$86
    RTL

    LDA.W #$001F
    STA.W $0030,X
    COP #$03
    db $20
    SEP #$20
    LDA.W $0030,X
    ORA.B #$E0
    STA.L $7F0200
    REP #$20
    DEC.W $0030,X
    COP #$04
    COP #$86
    RTL

    SEP #$20
    LDA.B #$05
    XBA
    LDA.B #$00
    LDY.W #$EA86
    JSL.L CODE_02988A
    LDA.B #$2C
    XBA
    LDA.B #$00
    LDY.W #$EA8B
    JSL.L CODE_02988A
    REP #$20
    LDA.W $0482
    BNE CODE_00EA80
    RTL


CODE_00EA80:
    STZ.W DmaChannelEnableBits
    COP #$86
    RTL

    db $7F,$0F,$60,$09,$00,$7F,$11,$60,$14,$00
    COP #$03
    db $80
    LDY.W $003E,X
    LDA.W $0000,Y
    DEC A
    DEC A
    STA.W $0000,Y
    LDA.W $003E,Y
    TAY
    LDA.W $0000,Y
    DEC A
    DEC A
    STA.W $0000,Y
    LDA.W $003E,Y
    TAY
    LDA.W $0000,Y
    INC A
    INC A
    STA.W $0000,Y
    COP #$04
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    BNE CODE_00EAC0
    RTL


CODE_00EAC0:
    COP #$03
    db $40
    LDY.W $003E,X
    LDA.W $0002,Y
    DEC A
    STA.W $0002,Y
    LDA.W $003E,Y
    TAY
    LDA.W $0002,Y
    DEC A
    STA.W $0002,Y
    COP #$04
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    BEQ CODE_00EAE2
    RTL


CODE_00EAE2:
    COP #$03
    db $80
    LDY.W $003E,X
    LDA.W $0000,Y
    DEC A
    DEC A
    STA.W $0000,Y
    LDA.W $003E,Y
    TAY
    LDA.W $0000,Y
    DEC A
    DEC A
    STA.W $0000,Y
    COP #$04
    COP #$86
    RTL

    COP #$80
    db $00
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    BMI CODE_00EB26
    LDA.W $0000,X
    CMP.W #$0098
    BEQ CODE_00EB16
    RTL


CODE_00EB16:
    COP #$80
    db $03
    COP #$82
    COP #$80
    db $00
    COP #$82
    COP #$1B
    db $01,$EB,$2C,$01

CODE_00EB26:
    COP #$86
    db $6B
    COP #$80
    db $01
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    BMI CODE_00EB4E
    LDA.W $0000,X
    CMP.W #$0098
    BEQ CODE_00EB3E
    RTL


CODE_00EB3E:
    COP #$80
    db $04
    COP #$82
    COP #$80
    db $01
    COP #$82
    COP #$1B
    db $29,$EB,$2C,$01

CODE_00EB4E:
    COP #$86
    db $6B
    COP #$80
    db $02
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    BNE CODE_00EB5E
    RTL


CODE_00EB5E:
    COP #$86
    RTL

    LDA.W wButtonsPressed
    BIT.W #$1000
    BNE CODE_00EB6A
    RTL


CODE_00EB6A:
    COP #$10
    db $00,$0A,$01,$00,$00,$00,$00
    LDA.W #$0001
    STA.W $031E
    STA.W $0445
    COP #$86
    RTL


CODE_00EB7F:
    LDA.W currentMapNumber
    CMP.B #$10
    BNE CODE_00EBA4
    JSR.W CODE_00EBF1
    JSR.W applyScalingAndRotation
    LDX.W $0476
    STX.W m7aForNmi
    LDX.W $0478
    STX.W m7bForNmi
    LDX.W $047A
    STX.W m7cForNmi
    LDX.W $047C
    STX.W m7dForNmi

CODE_00EBA4:
    RTL

    db $20,$50,$EC

applyScalingAndRotation:
    LDA.W m7aForNmi
    STA.W $211B
    LDA.W $046F
    STA.W $211B
    LDA.W m7bForNmi
    STA.W $211C
    LDA.W $0471
    STA.W $211C
    LDA.W m7cForNmi
    STA.W $211D
    LDA.W $0473
    STA.W $211D
    LDA.W m7dForNmi
    STA.W $211E
    LDA.W $0475
    STA.W $211E
    LDA.W m7xForNmi
    STA.W $211F
    LDA.W $046B
    STA.W $211F
    LDA.W m7yForNmi
    STA.W $2120
    LDA.W $046D
    STA.W $2120
    RTS


CODE_00EBF1:
    SEP #$10
    LDX.W $047E
    REP #$10
    LDY.W $0480
    STY.B $00
    XBA
    LDA.L UNREACH_01FCC4,X
    STA.B $02
    JSR.W CODE_00ECA0
    LDY.W $2135
    STY.W $0476
    LDY.W $0480
    STY.B $00
    XBA
    LDA.L UNREACH_01FC84,X
    STA.B $02
    JSR.W CODE_00ECA0
    LDY.W $2135
    STY.W $0478
    LDY.W $0480
    STY.B $00
    XBA
    LDA.L UNREACH_01FC84,X
    EOR.B #$FF
    INC A
    STA.B $02
    JSR.W CODE_00ECA0
    LDY.W $2135
    STY.W $047A
    LDY.W $0480
    STY.B $00
    XBA
    LDA.L UNREACH_01FCC4,X
    STA.B $02
    JSR.W CODE_00ECA0
    LDY.W $2135
    STY.W $047C
    RTS

    db $C2,$20,$8A,$EB,$4A,$4A,$18,$69,$41,$00,$0A,$48,$E2,$20,$8D,$1B
    db $21,$EB,$8D,$1B,$21,$BF,$C4,$FC,$01,$8D,$1C,$21,$8D,$1C,$21,$C2
    db $20,$AD,$35,$21,$8D,$6E,$04,$8D,$74,$04,$68,$E2,$20,$8D,$1B,$21
    db $EB,$8D,$1B,$21,$BF,$84,$FC,$01,$8D,$1C,$21,$8D,$1C,$21,$C2,$20
    db $AD,$35,$21,$8D,$70,$04,$49,$FF,$FF,$1A,$8D,$72,$04,$E2,$20,$60

CODE_00ECA0:
    PHP
    SEP #$20
    LDA.B $00
    STA.W $211B
    LDA.B $01
    STA.W $211B
    LDA.B $02
    STA.W $211C
    STA.W $211C
    LDA.W $2134
    STA.B $00
    LDA.W $2135
    STA.B $01
    PLP
    RTS


CODE_00ECC1:
    PHX
    JSL.L CODE_02A32B
    JSR.W printChooseGame
    PLX
    COP #$1B
    db $D0,$EC,$01,$00
    PHX
    LDA.L $701FFE
    CMP.W #$0004
    BCC CODE_00ECDD
    db $A9,$00,$00

CODE_00ECDD:
    XBA
    CLC
    ADC.W #$0005
    BRA CODE_00ECE7


CODE_00ECE4:
    LDA.W #$0005

CODE_00ECE7:
    JSL.L ChooseGameMenuLogic
    BCS CODE_00ECE4
    AND.W #$00FF
    CMP.W #$0004
    BNE CODE_00ED20
    LDA.W #$03FF
    STA.L $7F0006
    LDA.W #$0004
    JSL.L ChooseGameMenuLogic
    BCS CODE_00ED14
    AND.W #$00FF
    XBA
    ASL A
    ASL A
    TAX
    STA.L save_entries,X
    STA.L $701000,X

CODE_00ED14:
    LDA.W #$7FFF
    STA.L $7F0006
    JSR.W printChooseGame
    BRA CODE_00ECE4


CODE_00ED20:
    STA.W saveGameEntry
    JSL.L CODE_04F132
    PLX
    LDA.W #$0001
    BCS CODE_00ED30
    LDA.W $1B90

CODE_00ED30:
    STA.W zwSceneId
    LDA.W #$0001
    STA.W $0380
    LDA.W #$0070
    STA.W $037C
    LDA.W #$0060
    STA.W $037E
    STZ.W $0445
    INC.W $0454
    %CopSetScriptAddrToNextInstruction()
    RTL


printChooseGame:
    LDY.W #$C3B0
    JSL.L printOsdStringFromBank2
    STZ.W saveGameEntry
    LDX.W #$0000
    LDY.W #$C40D
    LDA.W #$0000
    PHA

checkCrcOfSaveEntry:
    JSL.L calcCrcOfSaveGameEntry
    LDA.B $16
    CMP.L $7003FA,X
    BNE invalidCrc
    LDA.B $18
    CMP.L $7003FC,X
    BNE invalidCrc
    PHX
    PHY
    PHB
    TXY
    TYA
    CLC
    ADC.W #$1000
    TAY
    LDA.W #$03FD
    MVN $70,$70
    PLB
    PLY
    PLX
    BRA CODE_00EDB2


invalidCrc:
    PHX
    PHY
    PHB
    TXY
    TXA
    CLC
    ADC.W #$1000
    TAX
    LDA.W #$03FD
    MVN $70,$70
    PLB
    PLY
    PLX
    JSL.L calcCrcOfSaveGameEntry
    LDA.B $16
    CMP.L $7003FA,X
    BNE CODE_00EE06
    db $A5,$18,$DF,$FC,$03,$70,$D0,$54

CODE_00EDB2:
    PHY
    PHX
    TXA
    SEC
    SBC.W #$1A5E
    PHA
    CLC
    ADC.W #$1B92
    TAX
    LDA.L $700200,X
    STA.W PlayerName8
    LDA.L $700202,X
    STA.W $0449
    LDA.L $700204,X
    STA.W $044B
    LDA.L $700206,X
    STA.W $044D
    LDA.L $700207,X
    STA.W $044E
    LDA.B $01,S
    CLC
    ADC.W #$1B6A
    TAX
    LDA.L $700200,X
    STA.W $0450
    PLA
    CLC
    ADC.W #$1B90
    TAX
    LDA.L $700200,X
    STA.W $0452
    JSL.L printOsdStringFromBank2
    PLX
    PLY
    PLA
    INC A
    PHA

CODE_00EE06:
    INC.W saveGameEntry
    TXA
    CLC
    ADC.W #$0400
    TAX
    TYA
    CLC
    ADC.W #$0014
    TAY
    CPX.W #$1000
    BEQ CODE_00EE1D
    BRL checkCrcOfSaveEntry


CODE_00EE1D:
    STZ.W saveGameEntry
    PLA
    BNE CODE_00EE27
    STA.L $701FFE

CODE_00EE27:
    RTS

CODE_00EE28:
    %CopJumpIfEventFlagIsUnset($9F05, $EE34)
    %CopJumpIfEventFlagIsUnset($9F04, $F264)
    INC.W $0454
    COP #$85
    db $41,$F1,$00
    LDA.W #$3080
    TSB.W wButtonMask
    COP #$A3
    STX.W $039C
    STZ.W $040D
    STZ.W $0410
    COP #$85
    db $8E,$F0,$00
    LDA.W $0000,X
    CMP.W #$0070
    BEQ CODE_00EEA0
    CMP.W #$0030
    BNE CODE_00EE62
    BRL CODE_00EEDE

CODE_00EE62:
    CMP.W #$01B0
    BNE CODE_00EE6A
    BRL CODE_00EFD4

CODE_00EE6A:
    CMP.W #$0170
    BNE CODE_00EE72
    BRL CODE_00F026

CODE_00EE72:
    LDA.W $0002,X
    CMP.W #$0170
    BNE CODE_00EE7D
    BRL CODE_00EF30

CODE_00EE7D:
    CMP.W #$0070
    BNE CODE_00EE85
    BRL CODE_00EF82

CODE_00EE85:
    BRL CODE_00F073

CODE_00EE88:
    LDA.W wButtonsPressed
    BIT.W #$0400
    BNE CODE_00EEA7
    BIT.W #$8000
    BEQ CODE_00EEA0
    BRK #$98
    COP #$10
    db $00,$01,$00,$70,$00,$50,$00

CODE_00EEA0:
    COP #$80
    db $10
    COP #$82
    BRA CODE_00EE88


CODE_00EEA7:
    COP #$08
    db $00,$9B,$A0,$EE
    COP #$80
    db $01
    COP #$82
    BRK #$96
    COP #$80
    db $24
    COP #$82
    COP #$80
    db $2F
    COP #$82
    BRL CODE_00EEDE


CODE_00EEC1:
    LDA.W wButtonsPressed
    BIT.W #$0800
    BNE CODE_00EEE5
    BIT.W #$0100
    BNE CODE_00EEF9
    BIT.W #$8000
    BEQ CODE_00EEDE
    BRK #$98
    COP #$10
    db $00,$02,$00,$70,$00,$50,$00

CODE_00EEDE:
    COP #$80
    db $02
    COP #$82
    BRA CODE_00EEC1


CODE_00EEE5:
    COP #$80
    db $03
    COP #$82
    BRK #$96
    COP #$80
    db $25
    COP #$82
    COP #$80
    db $2E
    COP #$82
    BRL CODE_00EEA0

CODE_00EEF9:
    COP #$08
    db $01,$9B,$DE,$EE
    COP #$80
    db $03
    COP #$82
    BRK #$96
    COP #$80
    db $26
    COP #$82
    COP #$80
    db $2F
    COP #$82
    BRL CODE_00EF30

CODE_00EF13:
    LDA.W wButtonsPressed
    BIT.W #$0200
    BNE CODE_00EF37
    BIT.W #$0800
    BNE CODE_00EF4B
    BIT.W #$8000
    BEQ CODE_00EF30
    BRK #$98
    COP #$10
    db $00,$03,$00,$70,$00,$50,$00

CODE_00EF30:
    COP #$80
    db $02
    COP #$82
    BRA CODE_00EF13

CODE_00EF37:
    COP #$80
    db $03
    COP #$82
    BRK #$96
    COP #$80
    db $27
    COP #$82
    COP #$80
    db $2F
    COP #$82
    BRL CODE_00EEC1

CODE_00EF4B:
    COP #$08
    db $02,$9B,$30,$EF
    COP #$80
    db $03
    COP #$82
    BRK #$96
    COP #$80
    db $29
    COP #$82
    COP #$80
    db $2E
    COP #$82
    BRL CODE_00EF65

CODE_00EF65:
    LDA.W wButtonsPressed
    BIT.W #$0400
    BNE CODE_00EF89
    BIT.W #$0100
    BNE CODE_00EF9D
    BIT.W #$8000
    BEQ CODE_00EF82
    BRK #$98
    COP #$10
    db $00,$04,$00,$70,$00,$50,$00

CODE_00EF82:
    COP #$80
    db $10
    COP #$82
    BRA CODE_00EF65

CODE_00EF89:
    COP #$80
    db $01
    COP #$82
    BRK #$96
    COP #$80
    db $28
    COP #$82
    COP #$80
    db $2F
    COP #$82
    BRL CODE_00EF13

CODE_00EF9D:
    COP #$08
    db $03,$9B,$82,$EF
    COP #$80
    db $01
    COP #$82
    BRK #$96
    COP #$80
    db $2A
    COP #$82
    COP #$80
    db $2F
    COP #$82
    BRL CODE_00EFB7

CODE_00EFB7:
    LDA.W wButtonsPressed
    BIT.W #$0200
    BNE CODE_00EFDB
    BIT.W #$0800
    BNE CODE_00EFEF
    BIT.W #$8000
    BEQ CODE_00EFD4
    BRK #$98
    COP #$10
    db $00,$05,$00,$70,$00,$50,$00

CODE_00EFD4:
    COP #$80
    db $02
    COP #$82
    BRA CODE_00EFB7

CODE_00EFDB:
    COP #$80
    db $03
    COP #$82
    BRK #$96
    COP #$80
    db $2B
    COP #$82
    COP #$80
    db $2E
    COP #$82
    BRL CODE_00EF65

CODE_00EFEF:
    COP #$08
    db $04,$9B,$D4,$EF
    COP #$80
    db $03
    COP #$82
    BRK #$96
    COP #$80
    db $2C
    COP #$82
    COP #$80
    db $2E
    COP #$82
    BRL CODE_00F009

CODE_00F009:
    LDA.W wButtonsPressed
    BIT.W #$0400
    BNE CODE_00F02D
    BIT.W #$0800
    BNE CODE_00F041
    BIT.W #$8000
    BEQ CODE_00F026
    BRK #$98
    COP #$10
    db $00,$06,$00,$70,$00,$50,$00

CODE_00F026:
    COP #$80
    db $10
    COP #$82
    BRA CODE_00F009

CODE_00F02D:
    COP #$80
    db $01
    COP #$82
    BRK #$96
    COP #$80
    db $2D
    COP #$82
    COP #$80
    db $2F
    COP #$82
    BRL CODE_00EFB7

CODE_00F041:
    COP #$08
    db $05,$9B,$26,$F0
    COP #$80
    db $01
    COP #$82
    BRK #$96
    COP #$80
    db $1F
    COP #$82
    COP #$80
    db $2E
    COP #$82
    BRL CODE_00F05B

CODE_00F05B:
    LDA.W wButtonsPressed
    BIT.W #$0100
    BNE CODE_00F07A
    BIT.W #$8000
    BEQ CODE_00F073
    BRK #$98
    COP #$10
    db $00,$07,$00,$70,$00,$50,$00

CODE_00F073:
    COP #$80
    db $10
    COP #$82
    BRA CODE_00F05B

CODE_00F07A:
    COP #$80
    db $01
    COP #$82
    BRK #$96
    COP #$80
    db $1E
    COP #$82
    COP #$80
    db $2E
    COP #$82
    BRL CODE_00F009
    LDY.W $039C
    LDA.W $0000,Y
    STA.W player_pos_x_real
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W player_pos_x_int
    LDA.W $0002,Y
    STA.W player_pos_y_real
    LSR A
    LSR A
    LSR A
    LSR A
    DEC A
    STA.W player_pos_y_int
    PHX
    JSL.L CODE_028000
    PLX
    RTL


; some scripts

CODE_00F0B3:
    %CopJumpIfEventFlagIsUnset($9F05, CODE_00F0BF)
    %CopJumpIfEventFlagIsUnset($9F04, CODE_00F0C2)

CODE_00F0BF:
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F0C2:
    COP #$86
    RTL

CODE_00F0C5:
    RTL

CODE_00F0C6:
    COP #$A3
    RTL

CODE_00F0C9:
    BRA CODE_00F0B3
CODE_00F0CB:
    RTL

CODE_00F0CC:
    RTL

CODE_00F0CD:
    BRA CODE_00F0B3

CODE_00F0CF:
    COP #$80
    db $04
    COP #$82
    RTL

CODE_00F0D5:
    COP #$80
    db $05
    COP #$82
    RTL

CODE_00F0DB:
    COP #$80
    db $30
    COP #$82
    RTL
CODE_00F0E1:
    RTL
CODE_00F0E2:
    RTL

CODE_00F0E3:
    COP #$14
    db $B6,$00,$EC,$F0
    %CopSetScriptAddrToNextInstruction()
    RTL

    COP #$80
    db $18
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F0F4:
    COP #$14
    db $09,$00,$FB,$F0,$6B
    COP #$80
    db $14
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F103:
    RTL

CODE_00F104:
    COP #$14
    db $2F,$01,$0D,$F1
    %CopSetScriptAddrToNextInstruction()
    RTL

    COP #$80
    db $12
    COP #$82
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F115:
    COP #$80
    db $31
    COP #$82
    RTL

CODE_00F11B:
    COP #$80
    db $32
    COP #$82
    RTL

CODE_00F121:
    COP #$80
    db $33
    COP #$82
    RTL


CODE_00F127:
    %CopJumpIfEventFlagIsUnset($9F05, $F133)
    %CopJumpIfEventFlagIsUnset($9F04, $F13A)
CODE_00F133:
    COP #$92
    db $2D
    COP #$94
    BRA CODE_00F133


CODE_00F13A:
    COP #$92
    db $4B
    COP #$94
    BRA CODE_00F13A
    %CopJumpIfEventFlagIsUnset($9B00, $F149)
    db $80,$26
    COP #$AC
    db $61,$F1,$00,$70,$00,$D0,$00,$40,$00
    COP #$AC
    db $69,$F1,$00,$30,$00,$50,$01,$40,$00
    BRA CODE_00F16F

    COP #$96
    LDA.W #$000E
    BRL CODE_00F254

    LDA.W #$000B
    BRL CODE_00F254


CODE_00F16F:
    %CopJumpIfEventFlagIsUnset($9B01, $F177)
    BRA CODE_00F19D

    COP #$AC
    db $8F,$F1,$00,$40,$00,$60,$01,$40,$00
    COP #$AC
    db $95,$F1,$00,$E0,$00,$60,$01,$40,$00
    BRA CODE_00F19D
    LDA.W #$0008
    BRL CODE_00F254
    COP #$96
    LDA.W #$0008
    BRL CODE_00F254

CODE_00F19D:
    %CopJumpIfEventFlagIsUnset($9B02, $F1A5)
    BRA CODE_00F1CB

    COP #$AC
    db $BD,$F1,$00,$F0,$00,$50,$01,$40,$00
    COP #$AC
    db $C3,$F1,$00,$F0,$00,$80,$00,$40,$00
    BRA CODE_00F1CB
    LDA.W #$0007
    BRL CODE_00F254
    COP #$98
    LDA.W #$0007
    BRL CODE_00F254

CODE_00F1CB:
    %CopJumpIfEventFlagIsUnset($9B03, $F1D3)
    BRA CODE_00F1F7

    COP #$AC
    db $EB,$F1,$00,$00,$01,$70,$00,$40,$00
    COP #$AC
    db $F1,$F1,$00,$A0,$01,$40,$01,$40,$00
    BRA CODE_00F1F7
    LDA.W #$000C
    BRL CODE_00F254
    LDA.W #$000F
    BRL CODE_00F254

CODE_00F1F7:
    %CopJumpIfEventFlagIsUnset($9B04, $F1FF)
    BRA CODE_00F225

    COP #$AC
    db $17,$F2,$00,$B0,$01,$30,$01,$40,$00
    COP #$AC
    db $1F,$F2,$00,$70,$01,$90,$00,$40,$00
    BRA CODE_00F225
    COP #$96
    LDA.W #$000B
    BRL CODE_00F254
    LDA.W #$000E
    BRL CODE_00F254

CODE_00F225:
    %CopJumpIfEventFlagIsUnset($9B05, $F22D)
    BRA CODE_00F243

    COP #$AC
    db $46,$F2,$00,$70,$01,$50,$00,$40,$00
    COP #$AC
    db $4E,$F2,$00,$00,$01,$30,$00,$40,$00

CODE_00F243:
    COP #$86
    RTL

    COP #$96
    LDA.W #$000A
    BRL CODE_00F254
    LDA.W #$0009
    BRL CODE_00F254

CODE_00F254:
    STA.W $001E,X
    STZ.W $0020,X
    %CopSetScriptAddrToNextInstruction()
    COP #$82
    COP #$1B
    db $5E,$F2,$FF,$00
    LDA.W #$BF80
    TSB.W wButtonMask
    COP #$85
    db $90,$F2,$00
    COP #$34
    BRK #$86
    COP #$1B
    db $79,$F2,$A4,$01
    INC.W $0454
    STZ.W $040D
    STZ.W $0410
    COP #$09
    db $05,$9F
    COP #$10
    db $00,$07,$00,$70,$00,$60,$00
    RTL
    COP #$A8
    db $00,$80,$0D
    COP #$92
    db $44
    COP #$94
    COP #$86
    RTL

CODE_00F29D:
    LDA.W $0016,X
    ORA.W #$2010
    STA.W $0016,X
    STX.W $039C
    STZ.W horizontalScroll
    LDA.W #$00FF
    STA.W verticalScroll
    STZ.W m7xForNmi
    STZ.W $0466
    STZ.W $0482
    SEP #$20
    LDA.B #$93
    STA.W $2131
    LDA.B #$FF
    STA.L $7F0200
    REP #$20
    LDA.W #$FFFF
    TSB.W wButtonMask
    COP #$85
    db $8C,$F5,$00
    COP #$85
    db $E8,$F4,$00
    COP #$1B
    db $E0,$F2,$02,$00
    LDA.W #$001F
    STA.W $0030,X
    COP #$03
    db $20
    SEP #$20
    LDA.W $0030,X
    ORA.B #$E0
    STA.L $7F0200
    REP #$20
    DEC.W $0030,X
    COP #$1B
    db $FF,$F2,$04,$00
    COP #$04
    COP #$1B
    db $07,$F3,$78,$00
    PHX
    LDY.W #$C192
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $19,$F3,$D0,$02
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $26,$F3,$70,$00
    PHX
    LDY.W #$C1F1
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $38,$F3,$D0,$02
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $45,$F3,$70,$00
    PHX
    LDY.W #$C228
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $57,$F3,$D0,$02
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $64,$F3,$70,$00
    PHX
    LDY.W #$C26F
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $76,$F3,$D0,$02
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $83,$F3,$70,$00
    COP #$1B
    db $89,$F3,$78,$00
    COP #$B0
    db $D3,$F4,$00,$10,$20
    COP #$AC
    db $8F,$F4,$00,$90,$01,$80,$00,$50,$00
    COP #$AC
    db $60,$F4,$00,$90,$01,$70,$00,$50,$00
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    BNE CODE_00F3AE
    RTL

CODE_00F3AE:
    COP #$1B
    db $B4,$F3,$78,$00
    PHX
    LDY.W #$C2BB
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $C6,$F3,$38,$04
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $D3,$F3,$70,$00
    PHX
    LDY.W #$C2E1
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $E5,$F3,$38,$04
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $F2,$F3,$70,$00
    PHX
    LDY.W #$C339
    JSL.L printOsdStringFromBank2
    PLX
    INC.W $0466
    COP #$1B
    db $04,$F4,$38,$04
    STZ.W $0466
    JSL.L clearL3
    COP #$1B
    db $11,$F4,$70,$00
    LDA.W #$0001
    TSB.W $03B8
    COP #$1B
    db $1D,$F4,$78,$00
    INC.W $0482
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0482
    CMP.W #$0004
    BEQ CODE_00F42B
    RTL

CODE_00F42B:
    COP #$1B
    db $31,$F4,$78,$00
    DEC.W $0466
    COP #$85
    db $38,$F6,$00
    COP #$1B
    db $3F,$F4,$F0,$00
    STZ.W $0030,X
    COP #$03
    db $20
    SEP #$20
    LDA.W $0030,X
    ORA.B #$E0
    STA.L $7F0200
    REP #$20
    INC.W $0030,X
    COP #$1B
    db $5B,$F4,$10,$00
    COP #$04
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F460:
    COP #$80
    db $00
    COP #$82
    LDA.W $0482
    CMP.W #$0001
    BNE CODE_00F460
    COP #$80
    db $02
    COP #$82
    LDA.W $0482
    CMP.W #$0002
    BNE CODE_00F460
    COP #$80
    db $00
    COP #$82
    COP #$80
    db $03
    COP #$82
    COP #$80
    db $01
    COP #$82
    INC.W $0482
    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F48F:
    COP #$80
    db $04
    COP #$82
    LDA.W $0482
    CMP.W #$0003
    BNE CODE_00F48F
    COP #$80
    db $04
    COP #$82
    COP #$80
    db $06
    COP #$82
    COP #$80
    db $05
    COP #$82
    INC.W $0482
    %CopSetScriptAddrToNextInstruction()
    RTL
    db $02,$80,$07,$02,$82,$AD,$82,$04,$C9,$04,$00,$D0,$F3,$02,$80,$07
    db $02,$82,$02,$80,$08,$02,$82,$02,$80,$09,$02,$82,$EE,$82,$04,$02
    db $91,$6B
    INC.W m7xForNmi
    LDA.W m7xForNmi
    STA.W $033A
    CMP.W #$0100
    BEQ CODE_00F4E2
    RTL

CODE_00F4E2:
    INC.W $0482
    %CopSetScriptAddrToNextInstruction()
    RTL
    LDA.W $0016,X
    ORA.W #$0010
    STA.W $0016,X
    STZ.W $0030,X
    PHX
    LDX.W #$0000
    LDA.W #$0070
    STA.L $7E7800,X
    LDA.W #$0030
    STA.L $7E7803,X
    LDA.W #$0010
    STA.L $7E7806,X
    LDA.W #$0010
    STA.L $7E7809,X
    LDA.W #$0010
    STA.L $7E780C,X
    LDA.W #$0008
    STA.L $7E780F,X
    LDA.W #$0001
    STA.L $7E7812,X
    LDA.W #$0000
    STA.L $7E7815,X
    STA.L $7E7801,X
    PLX
    %CopSetScriptAddrToNextInstruction()
    PHX
    TXY
    LDX.W #$0000
    LDA.W m7xForNmi
    LSR A
    STA.B $16
    STA.L $7E780A,X
    LDA.W $0030,Y
    LSR A
    PHA
    LSR A
    CLC
    ADC.B $01,S
    LSR A
    CLC
    ADC.B $16
    STA.L $7E7810,X
    PLA
    LDA.W $0030,Y
    LSR A
    CLC
    ADC.B $16
    STA.L $7E7804,X
    STA.L $7E7813,X
    LDA.W $0030,Y
    LSR A
    LSR A
    CLC
    ADC.B $16
    STA.L $7E7807,X
    STA.L $7E780D,X
    SEP #$20
    LDA.B #$0F
    XBA
    LDA.B #$7E
    LDY.W #$7800
    JSL.L CODE_02988A
    REP #$20
    PLX
    INC.W $0030,X
    RTL
    LDA.W $0016,X
    ORA.W #$0010
    STA.W $0016,X

CODE_00F595:
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0466
    BMI CODE_00F5DE
    BNE CODE_00F5A2
    JSR.W CODE_00F5E7
    RTL

CODE_00F5A2:
    STZ.W $0030,X
    COP #$03
    db $E0
    LDA.W $0030,X
    JSR.W CODE_00F5E7
    COP #$27
    db $B2,$F5
    LDA.W $0030,X
    JSR.W CODE_00F5E7
    INC.W $0030,X
    COP #$04
    %CopSetScriptAddrToNextInstruction()
    LDA.W $0466
    BEQ CODE_00F5CB
    LDA.W #$00E0
    JSR.W CODE_00F5E7
    RTL

CODE_00F5CB:
    COP #$03
    db $70
    LDA.W $0030,X
    JSR.W CODE_00F5E7
    DEC.W $0030,X
    DEC.W $0030,X
    COP #$04
    BRA CODE_00F595

CODE_00F5DE:
    %CopSetScriptAddrToNextInstruction()
    LDA.W #$00E0
    JSR.W CODE_00F5E7
    RTL

CODE_00F5E7:
    PHX
    SEP #$20
    LDX.W #$0000
    CMP.B #$00
    BEQ CODE_00F614
    CMP.B #$80
    BCC CODE_00F608
    SEC
    SBC.B #$7F
    PHA
    LDA.B #$7F
    STA.L $7E7000,X
    LDA.B #$17
    STA.L $7E7001,X
    INX
    INX
    PLA

CODE_00F608:
    STA.L $7E7000,X
    LDA.B #$17
    STA.L $7E7001,X
    INX
    INX

CODE_00F614:
    LDA.B #$01
    STA.L $7E7000,X
    LDA.B #$13
    STA.L $7E7001,X
    INX
    INX
    LDA.B #$00
    STA.L $7E7000,X
    LDA.B #$2C
    XBA
    LDA.B #$7E
    LDY.W #$7000
    JSL.L CODE_02988A
    REP #$20
    PLX
    RTS
    PHX
    LDY.W #$E264
    JSL.L CODE_02A6CF
    PLX
    COP #$1B
    db $47,$F6,$F0,$00
    COP #$31
    db $00
    COP #$1B
    db $50,$F6,$F0,$00
    COP #$10
    db $00,$0D,$02,$00,$00,$00,$00
    SEP #$20
    STZ.W playerSouls
    REP #$20
    LDA.W #$0020
    STA.W $03B4
    INC.W $0454

    %CopSetScriptAddrToNextInstruction()
    RTL

CODE_00F66C:
    %CopRestoreToFullHealth()
CODE_00F66E:
    %CopSetScriptAddrToNextInstruction()
    COP #$0D
    db $00,$07,$04,$7F,$F6
    COP #$0D
    db $00,$07,$06,$65,$F7
    RTL

    COP #$01
    db $B0,$F7
    %CopJumpIfEventFlagIsUnset($9B00, $F69C)
    COP #$1A
    db $43,$CF,$02,$54,$F7
    LDA.L $0003D0
    BNE CODE_00F699
    BRL CODE_00F6EF


CODE_00F699:
    BRL CODE_00F754

    COP #$1A
    db $23,$CF,$03,$54,$F7
    LDA.L $0003D0
    BNE CODE_00F6AC
    BRL CODE_00F6EF


CODE_00F6AC:
    DEC A
    BEQ CODE_00F6B2
    BRL CODE_00F754


CODE_00F6B2:
    COP #$01
    db $66,$F8
    PHX
    LDA.W #$0009
    STA.W zwSceneId
    LDA.W actId
    ASL A
    ASL A
    TAX
    LDA.L UNREACH_00F6D3,X
    STA.W $037C
    LDA.L UNREACH_00F6D5,X
    STA.W $037E
    PLX
    RTL


UNREACH_00F6D3:
    db $70,$00

UNREACH_00F6D5:
    db $A0,$00,$30,$00,$60,$01,$F0,$00,$60,$01,$F0,$00,$60,$00,$B0,$01
    db $40,$01,$70,$01,$60,$00,$F0,$00,$20,$00

CODE_00F6EF:
    COP #$01
    db $D4,$F7
    COP #$1A
    db $02,$CF,$02,$54,$F7
    LDA.L $0003D0
    DEC A
    BEQ CODE_00F754
    BRK #$66
    PHX
    JSL.L CODE_04F0E4
    PLX
    LDA.W #$7FC0
    TSB.W wButtonMask
    COP #$03
    db $3D
    COP #$04
    LDA.W #$7FC0
    TRB.W wButtonMask
    COP #$01
    db $FA,$F7
    COP #$1A
    db $02,$CF,$02,$54,$F7
    LDA.L $0003D0
    BEQ CODE_00F754
    COP #$01
    db $25,$F8
    LDA.W #$7F80
    TSB.W wButtonMask
    COP #$03
    db $1F
    COP #$04
    BRK #$8E
    COP #$AC
    db $98,$F7,$00,$70,$00,$50,$00,$50,$00
    COP #$34
    COP #$03
    db $3D
    COP #$04
    COP #$31
    db $13
    %CopSetScriptAddrToNextInstruction()
    RTL


CODE_00F754:
    COP #$01
    db $48,$F8
    %CopSetScriptAddrToNextInstruction()
    COP #$0D
    db $00,$07,$04,$64,$F7
    BRL CODE_00F66E

    RTL

    LDA.W wPlayerDied
    BEQ CODE_00F77B
    STZ.W wPlayerDied
    COP #$1B
    db $73,$F7,$02,$00
    COP #$01
    db $6A,$F8
    COP #$27
    db $6E,$F6

CODE_00F77B:
    %CopJumpIfEventFlagIsUnset($8602, $F794)
    %CopJumpIfEventFlagIsUnset($1B00, $F794)
    COP #$03
    db $03
    COP #$04
    COP #$09
    db $02,$86
    COP #$01
    db $BB,$F8
    COP #$27
    db $6E,$F6
    COP #$A8
    db $00,$80,$0E
    LDA.W $0372
    STA.W $001C,X
    COP #$A3
    COP #$A2
    db $30
    COP #$80
    db $02
    COP #$82
    COP #$86
    RTL


aSaveBla:
    db $10,$81,$F0,$A9,$AD,$0D,$61,$62,$6F,$76,$65,$2E,$20,$11,$13,$C2
    db $F7,$10,$02,$02,$2C,$20,$0D,$68,$6F,$77,$20,$A7,$88,$B7,$79,$6F
    db $75,$3F,$20,$0C

aAccomplishedBla:
    db $88,$F1,$72,$65,$63,$6F,$72,$64,$20,$9A,$0D,$FE,$B5,$61,$63,$63
    db $6F,$6D,$70,$6C,$69,$73,$68,$65,$64,$2E,$0D,$49,$73,$20,$E4,$6F
    db $6B,$61,$79,$3F,$20,$0C

aFinishedRecordingBla:
    db $46,$69,$6E,$69,$73,$68,$65,$64,$20,$72,$65,$63,$6F,$72,$64,$69
    db $6E,$67,$2E,$20,$11,$44,$6F,$20,$FE,$77,$69,$73,$68,$20,$E2,$0D
    db $63,$6F,$6E,$74,$69,$6E,$75,$65,$3F,$20,$0C

aRestWellBla:
    db $52,$65,$73,$74,$20,$77,$65,$6C,$6C,$2C,$20,$E9,$BA,$0D,$73,$74
    db $69,$6C,$6C,$20,$6D,$75,$63,$68,$20,$E2,$A1,$64,$6F,$6E,$65,$2E
    db $13,$52,$FA

aYouAreDoingWellBla:
    db $02,$02,$0D,$FE,$98,$64,$6F,$69,$6E,$67,$20,$77,$65,$6C,$6C,$2E
    db $20,$0D,$44,$6F,$20,$CA,$B0,$75,$70,$2E,$20,$13,$52,$FA

aDoNotRushBla:
    db $08,$48,$04,$0C,$10,$81,$F0,$A9,$AD,$0D,$61,$62,$6F,$76,$65,$2E
    db $20,$11,$3C,$44,$6F,$20,$CA,$72,$75,$73,$68,$2C,$20,$A2,$A1,$0D
    db $70,$61,$74,$69,$65,$6E,$74,$2E,$20,$95,$6D,$75,$73,$74,$20,$0D
    db $63,$6F,$6E,$74,$69,$6E,$75,$65,$20,$6D,$61,$6B,$69,$6E,$67,$20
    db $73,$74,$65,$61,$64,$79,$0D,$70,$72,$6F,$67,$72,$65,$73,$73,$2E
    db $3E,$20,$13,$52,$FA,$10,$81,$F0,$A9,$AD,$0D,$61,$62,$6F,$76,$65
    db $2E,$20,$11,$3C,$91,$42,$72,$6F,$77,$6E,$20,$90,$FE,$0D,$D4,$BA
    db $CC,$CB,$36,$20,$0D,$73,$74,$6F,$6E,$65,$73,$20,$BB,$E4,$77,$6F
    db $72,$6C,$64,$2E,$20,$11,$57,$68,$65,$6E,$20,$9A,$73,$69,$78,$20
    db $CB,$74,$68,$65,$73,$65,$20,$0D,$73,$74,$6F,$6E,$65,$73,$20,$98
    db $67,$61,$74,$68,$65,$72,$65,$64,$2C,$20,$11,$E1,$67,$61,$74,$65
    db $20,$6C,$65,$61,$64,$69,$6E,$67,$20,$E2,$0D,$E1,$57,$6F,$72,$6C
    db $64,$20,$CB,$45,$76,$69,$6C,$20,$0D,$73,$68,$61,$6C,$6C,$20,$A1
    db $6F,$70,$65,$6E,$65,$64,$2E,$20,$11,$4E,$6F,$77,$2C,$20,$FE,$6D
    db $75,$73,$74,$20,$B3,$E2,$0D,$47,$72,$65,$65,$6E,$57,$6F,$6F,$64
    db $20,$77,$68,$65,$72,$65,$20,$E1,$0D,$6E,$65,$78,$74,$20,$73,$74
    db $6F,$6E,$65,$20,$61,$77,$61,$69,$74,$73,$20,$0D,$79,$6F,$75,$2E
    db $3E,$20,$13,$52,$FA

CODE_00F97B:
    %CopJumpIfEventFlagIsUnset($9F06, $F995)
    COP #$09
    db $06,$9F
    COP #$1B
    db $8B,$F9,$02,$00
    COP #$01
    db $98,$F9
    COP #$3A
    COP #$01
    db $06,$FA
    COP #$86
    RTL

    db $10,$81,$F0,$A9,$AD,$0D,$61,$62,$6F,$76,$65,$2E,$20,$11,$3C,$4D
    db $79,$20,$66,$6F,$6C,$6C,$6F,$77,$65,$72,$2C,$20,$73,$69,$6E,$63
    db $65,$20,$0D,$FE,$F1,$A1,$61,$62,$6C,$65,$20,$E2,$0D,$73,$70,$65
    db $61,$6B,$20,$F2,$9A,$6C,$69,$76,$69,$6E,$67,$20,$0D,$74,$68,$69
    db $6E,$67,$73,$2C,$20,$11,$FE,$DC,$B5,$97,$0D,$6E,$61,$6D,$65,$2E
    db $20,$8F,$63,$68,$6F,$6F,$73,$65,$20,$97,$0D,$6E,$61,$6D,$65,$20
    db $AE,$79,$6F,$75,$72,$73,$65,$6C,$66,$2E,$20,$13,$52,$FA

aWhat:
    db $10,$02,$02,$2C,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$20,$0D,$57,$68,$61
    db $74,$20,$9C,$69,$6E,$74,$65,$72,$65,$73,$74,$69,$6E,$67,$20,$0D
    db $6E,$61,$6D,$65,$2E,$20,$11,$41,$6C,$6C,$72,$69,$67,$68,$74,$2C
    db $20,$B3,$96,$73,$61,$76,$65,$20,$0D,$E1,$F6,$AE,$9A,$0D,$63,$72
    db $65,$61,$74,$75,$72,$65,$73,$2E,$20,$13,$52,$FA

aClearTextboxAndReturn:
    db $12,$08,$08,$04,$0C,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$80,$00
    db $00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$20
    db $00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
