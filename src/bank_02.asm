
                       ORG $028000


CODE_028000:
    PHP
    REP #$30
    LDX.W #$0000
    TXY
    LDA.W $033A
    PHA
    LDA.W player_pos_x_real
    SEC
    SBC.W #$0070
    BPL CODE_028019
    LDA.W #$0000
    BRA CODE_02802F


CODE_028019:
    CLC
    ADC.W #$0100
    CMP.W $0342
    BCS CODE_028028
    SEC
    SBC.W #$0100
    BRA CODE_02802F


CODE_028028:
    LDA.W $0342
    SEC
    SBC.W #$0100

CODE_02802F:
    SEC
    SBC.B $01,S
    TAX
    PLA
    LDA.W $033C
    PHA
    LDA.W player_pos_y_real
    SEC
    SBC.W #$0080
    BPL CODE_028046
    LDA.W #$0000
    BRA CODE_02805C


CODE_028046:
    CLC
    ADC.W $03CA
    CMP.W $0344
    BCS CODE_028055
    SEC
    SBC.W $03CA
    BRA CODE_02805C


CODE_028055:
    LDA.W $0344
    SEC
    SBC.W $03CA

CODE_02805C:
    SEC
    SBC.B $01,S
    TAY
    PLA
    STX.W $0382
    STY.W $0384
    PLP
    RTL


CODE_028069:
    PHP
    REP #$20
    LDA.W $0382
    BEQ CODE_0280AE
    BPL CODE_028084
    LDA.W $033A
    BEQ CODE_0280AE
    PHA
    CLC
    ADC.W $0382
    BPL CODE_02809C
    db $A9,$00,$00,$80,$18

CODE_028084:
    LDA.W $033A
    PHA
    CLC
    ADC.W $0382
    CLC
    ADC.W #$0100
    CMP.W $0342
    BCC CODE_028098
    LDA.W $0342

CODE_028098:
    SEC
    SBC.W #$0100

CODE_02809C:
    STA.W $033A
    PLA
    EOR.W $033A
    AND.W #$0010
    BEQ CODE_0280AE
    LDA.W #$0080
    TSB.W $0396

CODE_0280AE:
    LDA.W $0384
    BEQ CODE_0280F0
    BPL CODE_0280C6
    LDA.W $033C
    BEQ CODE_0280F0
    PHA
    CLC
    ADC.W $0384
    BPL CODE_0280DE
    db $A9,$00,$00,$80,$18

CODE_0280C6:
    LDA.W $033C
    PHA
    CLC
    ADC.W $0384
    CLC
    ADC.W $03CA
    CMP.W $0344
    BCC CODE_0280DA
    LDA.W $0344

CODE_0280DA:
    SEC
    SBC.W $03CA

CODE_0280DE:
    STA.W $033C
    PLA
    EOR.W $033C
    AND.W #$0010
    BEQ CODE_0280F0
    LDA.W #$0040
    TSB.W $0396

CODE_0280F0:
    LDX.W #$0004
    LDA.W $034E
    BEQ CODE_0280FE
    LDA.W #$0020
    JSR.W CODE_0284E1

CODE_0280FE:
    LDA.W $0350
    BEQ CODE_028109
    LDA.W #$0010
    JSR.W CODE_02852F

CODE_028109:
    PLP
    RTL


CODE_02810B:
    LDA.B #$80
    TRB.W $0396
    BEQ CODE_028118
    LDX.W #$0000
    JSR.W CODE_028163

CODE_028118:
    LDA.B #$40
    TRB.W $0396
    BEQ CODE_028125
    LDX.W #$0000
    JSR.W CODE_0281C2

CODE_028125:
    LDX.W $038E
    STX.W $0382
    LDX.W $0390
    STX.W $0384
    LDA.B #$20
    TRB.W $0396
    BEQ CODE_028145
    LDX.W #$0004
    LDA.W $0343,X
    CMP.B #$03
    BCC CODE_028145
    JSR.W CODE_028163

CODE_028145:
    LDA.B #$10
    TRB.W $0396
    BEQ CODE_028159
    LDX.W #$0004
    LDA.W $0345,X
    CMP.B #$03
    BCC CODE_028159
    JSR.W CODE_0281C2

CODE_028159:
    LDX.W #$0000
    STX.W $0382
    STX.W $0384
    RTL


CODE_028163:
    REP #$20
    LDA.W #$0000
    LDY.W $0382
    BEQ CODE_0281BF
    BMI CODE_028172
    LDA.W #$0100

CODE_028172:
    CLC
    ADC.W $033A,X
    AND.W #$0FF0
    STA.B $16
    LDA.W $033C,X
    AND.W #$0F00
    STA.B $18
    SEP #$20
    LDY.W $0354,X
    STY.B $00
    LDY.W $0352,X
    STY.B $02
    LDY.W $0342,X
    STY.B $04
    LDA.W $036B,X
    STZ.B $06
    STA.B $07
    LDA.W $0343,X
    XBA
    LDA.W $0345,X
    JSL.L multiply
    CLC
    ADC.W $0353,X
    STZ.B $08
    STA.B $09
    LDY.W $035C,X
    STY.B $0A
    LDY.W $035A,X
    STY.B $29
    LDY.W $0362,X
    TYX
    JSR.W CODE_02832F

CODE_0281BF:
    SEP #$20
    RTS


CODE_0281C2:
    REP #$20
    LDA.W $033A,X
    AND.W #$0F00
    STA.B $16
    LDA.W #$0000
    LDY.W $0384
    BEQ CODE_02820B
    BMI CODE_0281D9
    LDA.W #$0100

CODE_0281D9:
    CLC
    ADC.W $033C,X
    AND.W #$0FF0
    STA.B $18
    SEP #$20
    LDY.W $0354,X
    STY.B $00
    LDY.W $0352,X
    STY.B $02
    LDY.W $0342,X
    STY.B $04
    LDA.W $036B,X
    STZ.B $06
    STA.B $07
    LDY.W $035C,X
    STY.B $0A
    LDY.W $035A,X
    STY.B $29
    LDY.W $0364,X
    TYX
    JSR.W CODE_0283AB

CODE_02820B:
    SEP #$20
    RTS


CODE_02820E:
    REP #$20
    LDA.W player_pos_x_real
    SEC
    SBC.W #$0070
    BPL CODE_02821E
    LDA.W #$0000
    BRA CODE_028234


CODE_02821E:
    CLC
    ADC.W #$0100
    CMP.W $0342
    BCS CODE_02822D
    SEC
    SBC.W #$0100
    BRA CODE_028234


CODE_02822D:
    LDA.W $0342
    SEC
    SBC.W #$0100

CODE_028234:
    STA.W $033A
    LDA.W player_pos_y_real
    SEC
    SBC.W #$0090
    BPL CODE_028245
    LDA.W #$0000
    BRA CODE_02825B


CODE_028245:
    CLC
    ADC.W $03CA
    CMP.W $0344
    BCS CODE_028254
    SEC
    SBC.W $03CA
    BRA CODE_02825B


CODE_028254:
    LDA.W $0344
    SEC
    SBC.W $03CA

CODE_02825B:
    STA.W $033C
    LDA.W $0342
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W $0392
    LDA.W $0344
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W $0394
    LDX.W #$0000

CODE_028275:
    REP #$20
    LDA.W #$0000
    JSR.W CODE_0284E1
    LDA.W $0342,X
    BEQ CODE_028290
    LDA.W $033A,X

CODE_028285:
    SEC
    SBC.W $0342,X
    BCC CODE_028290
    STA.W $033A,X
    BRA CODE_028285


CODE_028290:
    LDA.W #$0000
    JSR.W CODE_02852F
    LDA.W $0344,X
    BEQ CODE_0282A9
    LDA.W $033C,X

CODE_02829E:
    SEC
    SBC.W $0344,X
    BCC CODE_0282A9
    STA.W $033C,X
    BRA CODE_02829E


CODE_0282A9:
    SEP #$20
    REP #$20
    LDA.W $033A,X
    AND.W #$FF00
    STA.B $16
    LDA.W $033C,X
    AND.W #$FF00
    STA.B $18
    SEP #$20
    LDY.W $0354,X
    STY.B $00
    LDY.W $0352,X
    STY.B $02
    LDY.W $0342,X
    STY.B $04
    LDA.W $036B,X
    STZ.B $06
    STA.B $07
    LDA.W $0343,X
    XBA
    LDA.W $0345,X
    JSL.L multiply
    CLC
    ADC.W $0353,X
    STZ.B $08
    STA.B $09
    LDY.W $035C,X
    STY.B $0A
    LDY.W $035A,X
    STY.B $29
    LDY.W $0362,X
    STY.B $32
    LDY.W $0364,X
    STY.B $35
    LDA.B #$20

CODE_0282FE:
    PHA
    PHX
    LDX.B $32
    JSR.W CODE_02832F
    JSL.L CODE_02857D
    PLX
    REP #$20
    LDA.B $16
    CLC
    ADC.W #$0010
    CMP.W $0342,X
    BCC CODE_02831A
    AND.W #$0100

CODE_02831A:
    STA.B $16
    SEP #$20
    PLA
    DEC A
    BNE CODE_0282FE
    INX
    INX
    INX
    INX
    CPX.W #$0008
    BEQ CODE_02832E
    BRL CODE_028275


CODE_02832E:
    RTL


CODE_02832F:
    PHP
    PHB
    SEP #$20
    LDA.B $19
    XBA
    LDA.B $05
    JSL.L multiply
    CLC
    ADC.B $17
    CLC
    ADC.B $03
    XBA
    LDA.B $16
    LSR A
    LSR A
    LSR A
    LSR A
    TAY
    LDA.B #$7E
    PHA
    PLB
    LDA.B $17
    AND.B #$01
    ASL A
    ASL A
    XBA
    LDA.B $16
    LSR A
    LSR A
    LSR A
    AND.B #$1E
    REP #$20
    CLC
    ADC.B $00
    STA.W $0000,X
    INX
    INX
    LDA.B $18
    AND.W #$0100
    BNE CODE_02838B
    JSR.W CODE_028419
    TYA
    CLC
    ADC.B $04
    CMP.B $08
    BCC CODE_02837E
    SEC
    SBC.B $08
    CLC
    ADC.B $02

CODE_02837E:
    TAY
    TXA
    CLC
    ADC.W #$0080
    TAX
    JSR.W CODE_028419
    PLB
    PLP
    RTS


CODE_02838B:
    PHX
    TXA
    CLC
    ADC.W #$0080
    TAX
    JSR.W CODE_028419
    TYA
    CLC
    ADC.B $04
    CMP.B $08
    BCC CODE_0283A3
    SEC
    SBC.B $08
    CLC
    ADC.B $02

CODE_0283A3:
    TAY
    PLX
    JSR.W CODE_028419
    PLB
    PLP
    RTS


CODE_0283AB:
    PHP
    PHB
    SEP #$20
    LDA.B $19
    XBA
    LDA.B $05
    JSL.L multiply
    CLC
    ADC.B $17
    CLC
    ADC.B $03
    XBA
    LDA.B $18
    AND.B #$F0
    TAY
    LDA.B #$7E
    PHA
    PLB
    REP #$20
    LDA.B $18
    AND.W #$00F0
    ASL A
    ASL A
    PHA
    LDA.B $18
    AND.W #$0100
    ASL A
    ASL A
    ASL A
    CLC
    ADC.B $01,S
    CLC
    ADC.B $00
    STA.W $0000,X
    PLA
    INX
    INX
    LDA.B $16
    AND.W #$0100
    BNE CODE_028402
    JSR.W CODE_028466
    TYA
    CLC
    ADC.W #$0100
    TAY
    TXA
    CLC
    ADC.W #$0080
    TAX
    JSR.W CODE_028466
    PLB
    PLP
    RTS


CODE_028402:
    PHX
    TXA
    CLC
    ADC.W #$0080
    TAX
    JSR.W CODE_028466
    TYA
    CLC
    ADC.W #$0100
    TAY
    PLX
    JSR.W CODE_028466
    PLB
    PLP
    RTS


CODE_028419:
    PHX
    PHY
    LDA.W #$0010
    STA.B $0E

CODE_028420:
    LDA.W $0000,Y
    AND.W #$00FF
    PHY
    ASL A
    ASL A
    ASL A
    TAY
    LDA.B ($29),Y
    INY
    INY
    AND.B $0A
    ORA.B $06
    STA.W $0000,X
    LDA.B ($29),Y
    INY
    INY
    AND.B $0A
    ORA.B $06
    STA.W $0040,X
    LDA.B ($29),Y
    INY
    INY
    AND.B $0A
    ORA.B $06
    STA.W $0002,X
    LDA.B ($29),Y
    AND.B $0A
    ORA.B $06
    STA.W $0042,X
    INX
    INX
    INX
    INX
    PLA
    CLC
    ADC.W #$0010
    TAY
    DEC.B $0E
    BNE CODE_028420
    PLY
    PLX
    RTS


CODE_028466:
    PHX
    PHY
    LDA.W #$0010
    STA.B $0E

CODE_02846D:
    LDA.W $0000,Y
    AND.W #$00FF
    INY
    PHY
    ASL A
    ASL A
    ASL A
    TAY
    LDA.B ($29),Y
    INY
    INY
    AND.B $0A
    ORA.B $06
    STA.W $0000,X
    LDA.B ($29),Y
    INY
    INY
    AND.B $0A
    ORA.B $06
    STA.W $0002,X
    LDA.B ($29),Y
    INY
    INY
    AND.B $0A
    ORA.B $06
    STA.W $0040,X
    LDA.B ($29),Y
    AND.B $0A
    ORA.B $06
    STA.W $0042,X
    INX
    INX
    INX
    INX
    PLY
    DEC.B $0E
    BNE CODE_02846D
    PLY
    PLX
    RTS


CODE_0284AF:
    PHP
    PHY
    SEP #$20
    STA.W $211B
    XBA
    STA.W $211B
    REP #$20
    TYA
    SEP #$20
    STA.W $211C
    STA.W $211C
    LDY.W $2134
    STY.W $4204
    XBA
    STA.W $4206
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    LDA.W $4215
    XBA
    LDA.W $4214
    PLY
    PLP
    RTS


CODE_0284E1:
    PHP
    PHY
    REP #$20
    PHA
    LDA.W $033A,X
    PHA
    LDY.W $034A,X
    LDA.W $033A
    JSR.W CODE_0284AF
    TAY
    CLC
    ADC.W #$0100
    CMP.W $0342,X
    BCC CODE_02850A
    LDA.W $0342,X
    CMP.W #$0300
    BCC CODE_02850A
    SEC
    SBC.W #$0100
    TAY

CODE_02850A:
    TYA
    CLC
    ADC.W $038A
    STA.W $033A,X
    LDA.B $01,S
    EOR.W $033A,X
    AND.W #$0010
    BEQ CODE_028521
    LDA.B $03,S
    TSB.W $0396

CODE_028521:
    LDA.W $033A,X
    SEC
    SBC.B $01,S
    STA.W $038E
    PLA
    PLA
    PLY
    PLP
    RTS


CODE_02852F:
    PHP
    PHY
    REP #$20
    PHA
    LDA.W $033C,X
    PHA
    LDY.W $034C,X
    LDA.W $033C
    JSR.W CODE_0284AF
    TAY
    CLC
    ADC.W $03CA
    CMP.W $0344,X
    BCC CODE_028558
    LDA.W $0344,X
    CMP.W #$0300
    BCC CODE_028558
    SEC
    SBC.W $03CA
    TAY

CODE_028558:
    TYA
    CLC
    ADC.W $038C
    STA.W $033C,X
    LDA.B $01,S
    EOR.W $033C,X
    AND.W #$0010
    BEQ CODE_02856F
    LDA.B $03,S
    TSB.W $0396

CODE_02856F:
    LDA.W $033C,X
    SEC
    SBC.B $01,S
    STA.W $0390
    PLA
    PLA
    PLY
    PLP
    RTS


CODE_02857D:
    PHP
    REP #$20
    SEP #$10
    LDX.B #$81
    STX.W $2115
    LDA.B [$32]
    BEQ CODE_0285E0
    LDA.B [$32]
    STA.W $2116
    LDA.B $32
    CLC
    ADC.W #$0002
    STA.W $4322
    JSR.W CODE_028640
    LDA.B [$32]
    CLC
    ADC.W #$0001
    STA.W $2116
    LDA.B $32
    CLC
    ADC.W #$0042
    STA.W $4322
    JSR.W CODE_028640
    LDA.B [$32]
    CLC
    ADC.W #$0800
    STA.W $2116
    LDA.B $32
    CLC
    ADC.W #$0082
    STA.W $4322
    JSR.W CODE_028640
    LDA.B [$32]
    CLC
    ADC.W #$0801
    STA.W $2116
    LDA.B $32
    CLC
    ADC.W #$00C2
    STA.W $4322
    JSR.W CODE_028640
    LDA.W #$0000
    STA.B [$32]

CODE_0285E0:
    LDX.B #$80
    STX.W $2115
    LDA.B [$35]
    BEQ CODE_02863E
    LDA.B [$35]
    STA.W $2116
    LDA.B $35
    CLC
    ADC.W #$0002
    STA.W $4322
    JSR.W CODE_028640
    LDA.B [$35]
    CLC
    ADC.W #$0020
    STA.W $2116
    LDA.B $35
    CLC
    ADC.W #$0042
    STA.W $4322
    JSR.W CODE_028640
    LDA.B [$35]
    CLC
    ADC.W #$0400
    STA.W $2116
    LDA.B $35
    CLC
    ADC.W #$0082
    STA.W $4322
    JSR.W CODE_028640
    LDA.B [$35]
    CLC
    ADC.W #$0420
    STA.W $2116
    LDA.B $35
    CLC
    ADC.W #$00C2
    STA.W $4322
    JSR.W CODE_028640
    LDA.W #$0000
    STA.B [$35]

CODE_02863E:
    PLP
    RTL


CODE_028640:
    LDX.B #$01
    STX.W $4320
    LDX.B #$18
    STX.W $4321
    LDX.B #$7E
    STX.W $4324
    LDA.W #$0040
    STA.W $4325
    LDX.B #$04
    STX.W $420B
    RTS


CODE_02865B:
    PHP
    PHB
    SEP #$20
    LDA.W $0024,X
    PHA
    PLB
    REP #$20
    LDA.W $001E,X
    ASL A
    TAY
    LDA.W UNREACH_0D8000,Y
    PHA
    LDA.W $0020,X
    ASL A
    CLC
    ADC.W $0020,X
    ASL A
    CLC
    ADC.B $01,S
    PLY
    TAY
    LDA.W $0000,Y
    AND.W #$00FF
    BEQ CODE_0286C6
    DEC A
    STA.W $0026,X
    LDA.W $0001,Y
    STA.W $0008,X
    LDA.W $0003,Y
    AND.W #$00FF
    ASL A
    CLC
    ADC.W #$0000
    STA.W $000A,X
    LDA.W $0004,Y
    AND.W #$00FF
    STA.W $000C,X
    PHA
    LDA.W $0005,Y
    AND.W #$00FF
    STA.W $0014,X
    STA.W $000E,X
    INC.W $0020,X
    PLA
    CMP.W #$0002
    BNE CODE_0286C2
    INC.W $000B,X
    INC.W $000B,X

CODE_0286C2:
    PLB
    PLP
    CLC
    RTL


CODE_0286C6:
    STZ.W $0020,X
    PLB
    PLP
    SEC
    RTL


CODE_0286CD:
    PHB
    PHX
    LDA.W $0023,X
    AND.W #$FF00
    ORA.W #$007F
    STA.W $1C5E
    LDA.W $000C,X
    PHA
    LDY.W $000A,X
    LDA.W $0008,X
    TAX
    PLA
    JSR.W $1C5C
    TXA
    PLX
    STA.W $0008,X
    PLB
    RTL


CODE_0286F1:
    PHP
    PHX
    PHA
    REP #$20
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    PLA
    STA.L $7E8000,X
    PHX
    REP #$20
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    TAX
    LDA.L $7E2000,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C7D
    LDA.L $7E2002,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C81
    LDA.L $7E2004,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C85
    LDA.L $7E2006,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C89
    SEP #$20
    LDA.L $7E2001,X
    AND.B #$02
    PHA
    LDA.L $7E2003,X
    AND.B #$02
    PHA
    LDA.L $7E2005,X
    AND.B #$02
    PHA
    LDA.L $7E2007,X
    AND.B #$02
    ASL A
    ORA.B $01,S
    ASL A
    ORA.B $02,S
    ASL A
    ORA.B $03,S
    LSR A
    XBA
    PLA
    PLA
    PLA
    XBA
    PLX
    STA.L $7F8000,X
    REP #$20
    LDA.B $16
    CLC
    ADC.W #$0010
    SEC
    SBC.W $033A
    CMP.W #$0111
    BCS CODE_0287A9
    LDA.B $18
    CLC
    ADC.W #$0010
    SEC
    SBC.W $033C
    CMP.W #$0111
    BCS CODE_0287A9
    JSL.L CODE_04F2E6
    STA.W $1C7B
    INC A
    STA.W $1C7F
    CLC
    ADC.W #$001F
    STA.W $1C83
    INC A
    STA.W $1C87
    STZ.W $1C8B

CODE_0287A9:
    PLX
    PLP
    RTL


CODE_0287AC:
    PHP
    PHX
    PHA
    REP #$20
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    PLA
    STA.L $7E8000,X
    STA.L $7EC000,X
    PHX
    REP #$20
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    TAX
    LDA.L $7E2000,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C7D
    LDA.L $7E2002,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C81
    LDA.L $7E2004,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C85
    LDA.L $7E2006,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C89
    LDA.L $7E2800,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C8D
    LDA.L $7E2802,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C91
    LDA.L $7E2804,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C95
    LDA.L $7E2806,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C99
    SEP #$20
    LDA.L $7E2001,X
    AND.B #$02
    PHA
    LDA.L $7E2003,X
    AND.B #$02
    PHA
    LDA.L $7E2005,X
    AND.B #$02
    PHA
    LDA.L $7E2007,X
    AND.B #$02
    ASL A
    ORA.B $01,S
    ASL A
    ORA.B $02,S
    ASL A
    ORA.B $03,S
    LSR A
    XBA
    PLA
    PLA
    PLA
    XBA
    PLX
    STA.L $7F8000,X
    REP #$20
    LDA.B $16
    CLC
    ADC.W #$0010
    SEC
    SBC.W $033A
    CMP.W #$0111
    BCS CODE_0288B8
    LDA.B $18
    CLC
    ADC.W #$0010
    SEC
    SBC.W $033C
    CMP.W #$0111
    BCS CODE_0288B8
    JSL.L CODE_04F2E6
    PHA
    STA.W $1C7B
    INC A
    STA.W $1C7F
    CLC
    ADC.W #$001F
    STA.W $1C83
    INC A
    STA.W $1C87
    PLA
    SEC
    SBC.W #$6000
    CLC
    ADC.W #$7000
    STA.W $1C8B
    INC A
    STA.W $1C8F
    CLC
    ADC.W #$001F
    STA.W $1C93
    INC A
    STA.W $1C97
    STZ.W $1C9B

CODE_0288B8:
    PLX
    PLP
    RTL

CODE_0288BB:
    PHX
    ASL A
    ASL A
    ASL A
    TAX
    TXY
    LDA.L UNREACH_02F508,X
    STA.B $16
    LDA.L UNREACH_02F50A,X
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    PHX
    TYX
    LDA.L UNREACH_02F504,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $00
    LDA.L UNREACH_02F505,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    LDA.L UNREACH_02F506,X
    AND.W #$00FF
    STA.B $02
    LDA.L UNREACH_02F507,X
    AND.W #$00FF
    STA.B $0E
    LDY.W #$0000
    PLX

CODE_028903:
    PHX
    LDA.B $02
    STA.B $0C
    LDA.B $00
    STA.B $16

CODE_02890C:
    PHX
    SEP #$20
    LDA.L $7E8000,X
    PHA
    LDA.L $7F8000,X
    PHA
    REP #$20
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    PLA
    STA.L $7F8000,X
    PLA
    STA.L $7E8000,X
    REP #$20
    LDA.B $16
    CLC
    ADC.W #$0010
    SEC
    SBC.W $033A
    CMP.W #$0111
    BCS CODE_0289A6
    LDA.B $18
    CLC
    ADC.W #$0010
    SEC
    SBC.W $033C
    CMP.W #$0111
    BCS CODE_0289A6
    LDA.L $7E8000,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    TAX
    LDA.L $7E2000,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C7D,Y
    LDA.L $7E2002,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C81,Y
    LDA.L $7E2004,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C85,Y
    LDA.L $7E2006,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C89,Y
    JSL.L CODE_04F2E6
    STA.W $1C7B,Y
    INC A
    STA.W $1C7F,Y
    CLC
    ADC.W #$001F
    STA.W $1C83,Y
    INC A
    STA.W $1C87,Y
    TYA
    CLC
    ADC.W #$0010
    TAY

CODE_0289A6:
    PLX
    JSL.L CODE_04F31A
    LDA.B $16
    CLC
    ADC.W #$0010
    STA.B $16
    DEC.B $0C
    BEQ CODE_0289BA
    BRL CODE_02890C


CODE_0289BA:
    PLX
    JSL.L CODE_04F331
    LDA.B $18
    CLC
    ADC.W #$0010
    STA.B $18
    DEC.B $0E
    BEQ CODE_0289CE
    BRL CODE_028903


CODE_0289CE:
    LDA.W #$0000
    STA.W $1C7B,Y
    PLX
    RTL


CODE_0289D6:
    LDA.W player_pos_x_real
    ORA.W player_pos_y_real
    AND.B #$0F
    BNE CODE_028A15
    REP #$20
    LDA.W player_pos_x_real
    STA.B $16
    LDA.W player_pos_y_real
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.L $7E8000,X
    CMP.B #$FE
    BNE CODE_028A09
    LDA.W $0458
    BNE CODE_028A28
    JSL.L checkLairReveal
    BRA CODE_028A1B


CODE_028A09:
    JSL.L CODE_028B9B
    BCS CODE_028A1B
    JSL.L CODE_028A29
    BCS CODE_028A1B

CODE_028A15:
    JSL.L CODE_028AF2
    BCC CODE_028A28

CODE_028A1B:
    REP #$20
    LDX.W $039C
    STZ.W $0004,X
    STZ.W $0006,X
    SEP #$20

CODE_028A28:
    RTL


CODE_028A29:
    JSL.L CODE_04F3D4
    BCS CODE_028A5A
    CMP.B #$00
    BNE CODE_028A5A
    LDX.W $03AE

CODE_028A36:
    LDA.W UNREACH_01A9DE,X
    CMP.B #$FF
    BEQ CODE_028A5A
    LDA.W player_pos_x_int
    CMP.W UNREACH_01A9DE,X
    BNE CODE_028A4D
    LDA.W player_pos_y_int
    CMP.W UNREACH_01A9DF,X
    BEQ CODE_028A5C

CODE_028A4D:
    REP #$20
    TXA
    CLC
    ADC.W #$0006
    TAX
    SEP #$20
    BRL CODE_028A36


CODE_028A5A:
    CLC
    RTL


CODE_028A5C:
    TXY
    REP #$20
    LDA.W player_pos_x_real
    STA.B $16
    LDA.W player_pos_y_real
    SEC
    SBC.W #$0020
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.L $7E8000,X
    CMP.B #$FB
    BNE CODE_028A5A
    TYX
    LDA.B #$00
    XBA
    LDA.W UNREACH_01A9E0,X
    AND.B #$7F
    LDY.W #$1A7E
    JSL.L checkForSealedLair
    BCS CODE_028A5A
    JSL.L markChestOpened
    BRK #$15
    LDA.W UNREACH_01A9E0,X
    BMI CODE_028AA0
    LDA.B #$FC
    JSL.L CODE_0286F1
    BRA openChest


CODE_028AA0:
    LDA.B #$FC
    JSL.L CODE_0287AC

openChest:
    LDA.B #$1E
    JSL.L CODE_02B140
    LDA.W UNREACH_01A9E1,X
    STA.W textLutId
    STZ.W $03C9
    BEQ CODE_028ACA
    CMP.B #$FF
    BEQ CODE_028AD3
    JSL.L giveItem
    LDY.W #$E216
    JSL.L printOsdStringFromBankX
    BRK #$9E
    SEC
    RTL


CODE_028ACA:
    LDY.W #$E232
    JSL.L printOsdStringFromBankX
    SEC
    RTL

CODE_028AD3:
    REP #$20
    LDA.W UNREACH_01A9E2,X
    STA.W textLutId
    JSL.L addGold
    LDA.W #$0010
    TSB.W updateHudBitfield
    SEP #$20
    LDY.W #$E246
    JSL.L printOsdStringFromBankX
    BRK #$8D
    SEC
    RTL


CODE_028AF2:
    PHP
    LDX.W $03B2
    BEQ CODE_028B23

CODE_028AF8:
    LDA.W UNREACH_01AC96,X
    CMP.B #$FF
    BEQ CODE_028B23
    LDA.W player_pos_x_int
    SEC
    SBC.W UNREACH_01AC96,X
    CMP.W UNREACH_01AC98,X
    BCS CODE_028B17
    LDA.W player_pos_y_int
    SEC
    SBC.W UNREACH_01AC97,X
    CMP.W UNREACH_01AC99,X
    BCC CODE_028B26

CODE_028B17:
    REP #$20
    TXA
    CLC
    ADC.W #$000B
    TAX
    SEP #$20
    BRA CODE_028AF8


CODE_028B23:
    PLP
    CLC
    RTL


CODE_028B26:
    REP #$20
    LDA.W UNREACH_01AC96,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $00
    LDA.W UNREACH_01AC97,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W #$0010
    STA.B $02
    LDA.W UNREACH_01AC98,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    SEC
    SBC.W #$000F
    STA.B $04
    LDA.W UNREACH_01AC99,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    SEC
    SBC.W #$000F
    STA.B $06
    LDA.W player_pos_x_real
    SEC
    SBC.B $00
    CMP.B $04
    BCS CODE_028B23
    LDA.W player_pos_y_real
    SEC
    SBC.B $02
    CMP.B $06
    BCS CODE_028B23
    SEP #$20
    LDA.W UNREACH_01AC9A,X
    STA.W $0319
    LDA.W UNREACH_01AC9B,X
    STA.W zwSceneId
    LDA.W UNREACH_01AC9C,X
    STA.W $0380
    LDY.W UNREACH_01AC9D,X
    STY.W $037C
    LDY.W UNREACH_01AC9F,X
    STY.W $037E
    PLP
    SEC
    RTL


CODE_028B9B:
    LDX.W $03AC

CODE_028B9E:
    LDA.W UNREACH_01B69A,X
    CMP.B #$FF
    BEQ CODE_028C23
    CMP.W player_pos_x_int
    BNE CODE_028C1C
    LDA.W UNREACH_01B69B,X
    CMP.W player_pos_y_int
    BNE CODE_028C1C
    LDA.W UNREACH_01B69D,X
    XBA
    LDA.W UNREACH_01B69C,X
    LDY.W #$1A9E
    JSL.L checkForSealedLair
    BCC CODE_028C23
    REP #$20
    LDA.W UNREACH_01B69C,X
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W #$BA0D
    TAX
    LDY.W #$1C6D
    LDA.W #$0007
    MVN $01,$01
    SEP #$20
    LDA.W $03A8
    CLC
    ADC.B #$02
    STA.W $1C6E
    JSR.W CODE_02912A
    LDA.B #$01
    STA.W $1C75
    INC.W $1C6C
    LDA.B #$23

CODE_028BF2:
    JSL.L CODE_008173
    DEC A
    BNE CODE_028BF2
    STZ.W $1C6C
    REP #$20
    LDX.W $03AA
    LDA.W $03A8
    EOR.W #$0001
    STA.W $03A8
    BEQ CODE_028C0E
    INX
    INX

CODE_028C0E:
    LDA.W UNREACH_01B69A,X
    SEC
    SBC.W #$B69A
    STA.W $03AC
    SEP #$20
    SEC
    RTL


CODE_028C1C:
    INX
    INX
    INX
    INX
    BRL CODE_028B9E


CODE_028C23:
    CLC
    RTL


checkLairReveal:
    STX.B $00
    LDX.W #$0000
    TXY

CODE_028C2B:
    LDA.W LD_act1_trialRoom_1,X
    CMP.B #$FF
    BEQ CODE_028C57
    LDA.W UNREACH_01BA18,X
    CMP.W currentMapNumber
    BNE CODE_028C4A
    LDA.W UNREACH_01BA19,X
    CMP.W player_pos_x_int
    BNE CODE_028C4A
    LDA.W UNREACH_01BA1A,X
    CMP.W player_pos_y_int
    BEQ revealLair

CODE_028C4A:
    REP #$20
    TXA
    CLC
    ADC.W #$0020
    TAX
    SEP #$20
    INY
    BRA CODE_028C2B


CODE_028C57:
    RTL


revealLair:
    LDA.W $0456
    BEQ CODE_028C60
    DEC.W $0456

CODE_028C60:
    PHX
    LDA.W UNREACH_01BA15,X
    PHP
    LDX.B $00
    LDA.B #$FF
    STA.L $7E8000,X
    PLP
    BEQ CODE_028C74
    STA.L $7EC000,X

CODE_028C74:
    PLX
    LDA.W UNREACH_01BA1B,X
    ORA.W UNREACH_01BA1C,X
    BNE CODE_028C80
    BRL CODE_028D18


CODE_028C80:
    PHX
    LDA.W UNREACH_01BA17,X
    ORA.B #$80
    TYX
    STA.L $7F0203,X
    REP #$20
    TYA
    LDY.W #$1ADE
    JSL.L markChestOpened
    LDY.W #$1A9E
    JSL.L markChestOpened
    SEP #$20
    PLX
    LDA.W LD_act1_trialRoom_1,X
    CMP.W currentMapNumber
    BNE CODE_028CFD
    REP #$20
    LDA.W UNREACH_01BA1B,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W UNREACH_01BA1C,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    PHX
    TXA
    CLC
    ADC.W #$BA0D
    TAX
    LDY.W #$1C6D
    LDA.W #$0007
    MVN $01,$01
    PLX
    SEP #$20
    LDA.W UNREACH_01BA15,X
    BEQ CODE_028CFA
    LSR A
    BCC CODE_028CE1
    JSR.W CODE_02925E
    BRA CODE_028CE4

CODE_028CE1:
    JSR.W CODE_0291CB

CODE_028CE4:
    BRK #$94
    JSL.L CODE_008173
    LDA.B #$01
    STA.W $1C75
    LDA.B #$23

CODE_028CF1:
    JSL.L CODE_008173
    DEC A
    BNE CODE_028CF1
    BRA CODE_028D03

CODE_028CFA:
    JSR.W CODE_0291CB

CODE_028CFD:
    JSL.L CODE_008173
    BRK #$94

CODE_028D03:
    LDA.B #$01
    STA.W $1C75
    INC.W $1C6C
    LDA.B #$23

CODE_028D0D:
    JSL.L CODE_008173
    DEC A
    BNE CODE_028D0D
    STZ.W $1C6C
    RTL


CODE_028D18:
    PHX
    LDA.W UNREACH_01BA17,X
    ORA.B #$C0
    TYX
    STA.L $7F0203,X
    PLX
    LDA.W LD_act1_trialRoom_1,X
    CMP.W currentMapNumber
    BNE CODE_028D54
    db $C2,$20,$BD,$0F,$BA,$29,$FF,$00,$0A,$0A,$0A,$0A,$85,$16,$BD,$10
    db $BA,$29,$FF,$00,$0A,$0A,$0A,$0A,$85,$18,$22,$B8,$F2,$04,$E2,$20
    db $A9,$01,$9F,$00,$80,$7F,$80,$A9

CODE_028D54:
    BRK #$98
    LDA.W mapNumber
    STA.W $03FD
    LDA.W mapSubNumber
    STA.W $03FF
    LDA.W UNREACH_01BA2A,X
    STA.W $0380
    REP #$20
    LDA.W player_pos_x_real
    STA.W $0401
    LDA.W player_pos_y_real
    SEC
    SBC.W #$0010
    STA.W $0403
    LDA.W UNREACH_01BA0F,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.W $037C
    LDA.W UNREACH_01BA10,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.W $037E
    LDA.W LD_act1_trialRoom_1,X
    AND.W #$00FF
    ASL A
    TAX
    SEP #$20
    LDA.B #$80
    STA.W $03E3
    LDA.L UNREACH_02F62C,X
    STA.W $0319
    LDA.L UNREACH_02F62D,X
    STA.W zwSceneId
    LDA.B #$20
    STA.W $03B4
    STY.W revealingLairId
    INC.W lairRevealInProgress
    RTL


checkLairSeal:
    LDX.W #$0000
    TXY

CODE_028DC1:
    LDA.W LD_act1_trialRoom_1,X
    BMI CODE_028DE8
    CMP.W currentMapNumber
    BNE CODE_028DDB
    LDA.W UNREACH_01BA0F,X
    CMP.W player_pos_x_int
    BNE CODE_028DDB
    LDA.W UNREACH_01BA10,X
    CMP.W player_pos_y_int
    BEQ CODE_028DE9

CODE_028DDB:
    REP #$20
    TXA
    CLC
    ADC.W #$0020
    TAX
    INY
    SEP #$20
    BRA CODE_028DC1


CODE_028DE8:
    RTL


CODE_028DE9:
    LDA.W UNREACH_01BA16,X
    STA.W textLutId
    STZ.W $03C9
    PHX
    PHY
    LDY.W #$E203
    JSL.L printOsdStringFromBankX
    JSL.L CODE_008173
    PLY
    PLX
    PHX
    TYX
    LDA.L $7F0203,X
    AND.B #$BF
    STA.L $7F0203,X
    PLX
    REP #$20
    TYA
    PHA
    TXA
    CLC
    ADC.W #$BA0D
    TAX
    LDY.W #$1C6D
    LDA.W #$0007
    MVN $01,$01
    LDA.W $1C6F
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W $1C70
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    PHX
    SEP #$20
    LDA.W $0343
    XBA
    LDA.W $0345
    JSL.L multiply
    STA.B $01
    STZ.B $00
    LDY.W #$0004

CODE_028E52:
    REP #$20
    TXA
    CLC
    ADC.B $00
    TAX
    SEP #$20
    CPX.W #$4000
    BCS CODE_028E63
    DEY
    BNE CODE_028E52

CODE_028E63:
    PLX
    BRK #$9C
    LDA.W $1C73
    BNE CODE_028E74
    STZ.W $1C75
    JSL.L CODE_008173
    BRA CODE_028E95


CODE_028E74:
    JSR.W CODE_02912A
    LDA.B #$01
    STA.W $1C75
    INC.W $1C6C
    LDA.B #$23

CODE_028E81:
    JSL.L CODE_008173
    DEC A
    BNE CODE_028E81
    STZ.W $1C6C
    INC.W $1C6E
    LDA.W $1C6E
    CMP.B #$04
    BCC CODE_028E74

CODE_028E95:
    REP #$20
    PLA
    LDY.W #$1A9E
    JSL.L markChestOpened
    LDY.W #$1ADE
    JSL.L markChestOpened
    SEP #$20
    RTL


CODE_028EA9:
    REP #$20
    LDA.W player_pos_x_real
    STA.B $16
    LDA.W player_pos_y_real
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.L $7F8000,X
    CMP.B #$01
    BNE CODE_028ECC
    JSL.L checkLairSeal
    RTL


CODE_028ECC:
    REP #$20
    LDA.W revealingLairId
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX
    SEP #$20
    LDA.W UNREACH_01BA16,X
    STA.W textLutId
    STZ.W $03C9
    LDY.W #$E1DE
    JSL.L printOsdStringFromBankX
    RTL

CODE_028EEA:
    LDA.W $1C75
    BNE CODE_028EF0
    RTL


CODE_028EF0:
    LDA.W $1C6C
    BNE CODE_028EF8
    BRL CODE_028FAD

CODE_028EF8:
    PHP
    REP #$20
    LDY.W #$0000
    LDA.W $033A
    AND.W #$FFF0
    STA.W $1C77
    LDA.W $033C
    AND.W #$FFF0
    STA.W $1C79
    LDA.W $1C75
    DEC A
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX
    LDA.W #$0010
    STA.B $0C

CODE_028F1F:
    LDA.L UNREACH_02EE2D,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W $1C77
    STA.B $16
    LDA.L UNREACH_02EE3D,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W $1C79
    STA.B $18
    PHX
    JSR.W CODE_029062
    STA.W $1C7B,Y
    INC A
    STA.W $1C7F,Y
    CLC
    ADC.W #$001F
    STA.W $1C83,Y
    INC A
    STA.W $1C87,Y
    LDA.L $7E2000,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C7D,Y
    LDA.L $7E2002,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C81,Y
    LDA.L $7E2004,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C85,Y
    LDA.L $7E2006,X
    AND.W $035C
    ORA.W $036A
    STA.W $1C89,Y
    PLX
    TYA
    CLC
    ADC.W #$0010
    TAY
    INX
    DEC.B $0C
    BNE CODE_028F1F
    LDA.W #$0000
    STA.W $1C7B,Y
    INC.W $1C75
    LDA.W $1C75
    CMP.W #$0024
    BCC CODE_028FAB
    STZ.W $1C75

CODE_028FAB:
    PLP
    RTL


CODE_028FAD:
    PHP
    REP #$20
    LDY.W #$0000
    LDA.W $033A
    AND.W #$FFF0
    STA.W $1C77
    LDA.W $033C
    AND.W #$FFF0
    STA.W $1C79
    LDA.W $1C75
    DEC A
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX
    LDA.W #$0010
    STA.B $0C

CODE_028FD4:
    LDA.L UNREACH_02EE2D,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W $1C77
    STA.B $16
    LDA.L UNREACH_02EE3D,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W $1C79
    STA.B $18
    PHX
    JSR.W CODE_0290C6
    STA.W $1C7B,Y
    INC A
    STA.W $1C7F,Y
    CLC
    ADC.W #$001F
    STA.W $1C83,Y
    INC A
    STA.W $1C87,Y
    LDA.L $7E2800,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C7D,Y
    LDA.L $7E2802,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C81,Y
    LDA.L $7E2804,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C85,Y
    LDA.L $7E2806,X
    AND.W $0360
    ORA.W $036E
    STA.W $1C89,Y
    PLX
    TYA
    CLC
    ADC.W #$0010
    TAY
    INX
    DEC.B $0C
    BNE CODE_028FD4
    LDA.W #$0000
    STA.W $1C7B,Y
    INC.W $1C75
    LDA.W $1C75
    CMP.W #$0024
    BCC CODE_029060
    STZ.W $1C75

CODE_029060:
    PLP
    RTL

CODE_029062:
    LDA.B $18
    PHA
    SEP #$20
    LDA.W $0343
    JSL.L multiply
    STA.B $02,S
    LDA.B $16
    LSR A
    LSR A
    LSR A
    LSR A
    AND.B #$0F
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $17
    CLC
    ADC.B $02,S
    STA.B $02,S
    REP #$20
    PLX
    LDA.L $7E8000,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    TAX
    LDA.B $18
    AND.W #$00F8
    ASL A
    ASL A
    PHA
    LDA.B $16
    AND.W #$00F8
    LSR A
    LSR A
    LSR A
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $16
    AND.W #$0100
    ASL A
    ASL A
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $18
    AND.W #$0100
    ASL A
    ASL A
    ASL A
    CLC
    ADC.B $01,S
    STA.B $01,S
    PLA
    CLC
    ADC.W #$6000
    RTS


CODE_0290C6:
    LDA.B $18
    PHA
    SEP #$20
    LDA.W $0343
    JSL.L multiply
    STA.B $02,S
    LDA.B $16
    LSR A
    LSR A
    LSR A
    LSR A
    AND.B #$0F
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $17
    CLC
    ADC.B $02,S
    STA.B $02,S
    REP #$20
    PLX
    LDA.L $7EC000,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    TAX
    LDA.B $18
    AND.W #$00F8
    ASL A
    ASL A
    PHA
    LDA.B $16
    AND.W #$00F8
    LSR A
    LSR A
    LSR A
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $16
    AND.W #$0100
    ASL A
    ASL A
    CLC
    ADC.B $01,S
    STA.B $01,S
    LDA.B $18
    AND.W #$0100
    ASL A
    ASL A
    ASL A
    CLC
    ADC.B $01,S
    STA.B $01,S
    PLA
    CLC
    ADC.W #$7000
    RTS

CODE_02912A:
    PHP
    REP #$20
    LDA.W $1C71
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W $1C72
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    STX.W $1C66
    STX.W $1C68
    SEP #$20
    SEP #$20
    LDA.W $0343
    XBA
    LDA.W $0345
    JSL.L multiply
    XBA
    LDA.W $1C6E
    JSL.L multiply
    STA.W $1C65
    XBA
    STA.W $1C64
    LDA.W $1C74
    CMP.B #$80

CODE_029172:
    BCS CODE_029172
    STA.B $10

CODE_029176:
    LDA.W $1C73
    CMP.B #$80

CODE_02917B:
    BCS CODE_02917B
    STA.B $0E

CODE_02917F:
    REP #$20
    LDA.W $1C66
    CLC
    ADC.W $1C64
    TAX
    SEP #$20
    LDA.L $7E8000,X
    PHA
    LDA.L $7F8000,X
    PHA
    LDX.W $1C66
    LDA.L $7F8000,X
    AND.B #$F0
    ORA.B $01,S
    STA.L $7F8000,X
    PLA
    PLA
    STA.L $7E8000,X
    LDX.W $1C66
    JSL.L CODE_04F31A
    STX.W $1C66
    DEC.B $0E
    BNE CODE_02917F
    LDX.W $1C68
    JSL.L CODE_04F331
    STX.W $1C68
    STX.W $1C66
    DEC.B $10
    BNE CODE_029176
    PLP
    RTS


CODE_0291CB:
    PHP
    REP #$20
    JSL.L zCalculateCurrentPositionAndActIdSomething
    STX.W $1C62
    STX.W $1C64
    LDA.W $1C71
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W $1C72
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    STX.W $1C66
    STX.W $1C68
    SEP #$20
    LDA.W $1C74
    CMP.B #$80

CODE_029201:
    BCS CODE_029201
    STA.B $10

CODE_029205:
    LDA.W $1C73
    CMP.B #$80

CODE_02920A:
    BCS CODE_02920A
    STA.B $0E

CODE_02920E:
    LDX.W $1C62
    LDA.L $7E8000,X
    PHA
    LDA.L $7F8000,X
    LDX.W $1C66
    STA.L $7F8000,X
    PLA
    STA.L $7E8000,X
    LDX.W $1C62
    JSL.L CODE_04F31A
    STX.W $1C62
    LDX.W $1C66
    JSL.L CODE_04F31A
    STX.W $1C66
    DEC.B $0E
    BNE CODE_02920E
    LDX.W $1C64
    JSL.L CODE_04F331
    STX.W $1C64
    STX.W $1C62
    LDX.W $1C68
    JSL.L CODE_04F331
    STX.W $1C68
    STX.W $1C66
    DEC.B $10
    BNE CODE_029205
    PLP
    RTS


CODE_02925E:
    PHP
    REP #$20
    JSL.L zCalculateCurrentPositionAndActIdSomething
    STX.W $1C62
    STX.W $1C64
    LDA.W $1C71
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W $1C72
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    STX.W $1C66
    STX.W $1C68
    SEP #$20
    LDA.W $1C74
    CMP.B #$80

CODE_029294:
    BCS CODE_029294
    STA.B $10

CODE_029298:
    LDA.W $1C73
    CMP.B #$80

CODE_02929D:
    BCS CODE_02929D
    STA.B $0E

CODE_0292A1:
    LDX.W $1C62
    LDA.L $7E8000,X
    PHA
    LDA.L $7F8000,X
    LDX.W $1C66
    STA.L $7F8000,X
    PLA
    STA.L $7E8000,X
    STA.L $7EC000,X
    LDX.W $1C62
    JSL.L CODE_04F31A
    STX.W $1C62
    LDX.W $1C66
    JSL.L CODE_04F31A
    STX.W $1C66
    DEC.B $0E
    BNE CODE_0292A1
    LDX.W $1C64
    JSL.L CODE_04F331
    STX.W $1C64
    STX.W $1C62
    LDX.W $1C68
    JSL.L CODE_04F331
    STX.W $1C68
    STX.W $1C66
    DEC.B $10
    BNE CODE_029298
    PLP
    RTS

CODE_0292F5:
    LDX.W #$0000
    TXY

CODE_0292F9:
    LDA.W $1A9E,Y
    INY
    STA.B $04
    LDA.B #$08
    STA.B $0C

CODE_029303:
    LDA.W LD_act1_trialRoom_1,X
    BPL CODE_02930B
    BRL CODE_029394


CODE_02930B:
    LSR.B $04
    BCC CODE_029380
    CMP.W currentMapNumber
    BNE CODE_029380
    LDA.W UNREACH_01BA13,X
    ORA.W UNREACH_01BA14,X
    BEQ CODE_029380
    PHX
    PHY
    LDA.W UNREACH_01BA1B,X
    ORA.W UNREACH_01BA1C,X
    BEQ CODE_029363
    REP #$20
    LDA.W UNREACH_01BA1B,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W UNREACH_01BA1C,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    LDA.W UNREACH_01BA15,X
    LSR A
    PHP
    TXA
    CLC
    ADC.W #$BA0D
    TAX
    LDY.W #$1C6D
    LDA.W #$0007
    MVN $01,$01
    PLP
    SEP #$20
    BCS CODE_02935E
    JSR.W CODE_0291CB
    BRA CODE_02937E


CODE_02935E:
    JSR.W CODE_02925E
    BRA CODE_02937E

CODE_029363:
    REP #$20
    TXA
    CLC
    ADC.W #$BA0D
    TAX
    LDY.W #$1C6D
    LDA.W #$0007
    MVN $01,$01
    SEP #$20
    LDA.B #$03
    STA.W $1C6E
    JSR.W CODE_02912A

CODE_02937E:
    PLY
    PLX

CODE_029380:
    REP #$20
    TXA
    CLC
    ADC.W #$0020
    TAX
    SEP #$20
    DEC.B $0C
    BEQ CODE_029391
    BRL CODE_029303


CODE_029391:
    BRL CODE_0292F9


CODE_029394:
    RTL


CODE_029395:
    LDX.W #$01FF

CODE_029398:
    LDA.L $7F0203,X
    BPL CODE_0293A1
    ASL A
    BMI CODE_0293A5

CODE_0293A1:
    DEX
    BPL CODE_029398
    RTL


CODE_0293A5:
    REP #$20
    PHX
    TXA
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX
    TAY
    SEP #$20
    LDA.W LD_act1_trialRoom_1,X
    CMP.W currentMapNumber
    BEQ CODE_0293BD
    db $82,$84,$00

CODE_0293BD:
    LDY.W UNREACH_01BA2B,X
    BEQ CODE_0293D2
    LDA.W UNREACH_01BA2C,X
    XBA
    LDA.W UNREACH_01BA2B,X
    LDY.W #$1ADE
    JSL.L checkForSealedLair
    BCC CODE_029441

CODE_0293D2:
    TXY
    REP #$20
    LDA.W UNREACH_01BA0F,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W UNREACH_01BA10,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.W UNREACH_01BA13,Y
    ORA.W UNREACH_01BA14,Y
    BNE CODE_02943B
    LDA.W $0343
    XBA
    LDA.W $0345
    JSL.L multiply
    STA.B $01
    STZ.B $00
    XBA
    LDA.W UNREACH_01BA0E,Y
    BEQ CODE_029421
    JSL.L multiply
    REP #$20
    PHX
    XBA
    CLC
    ADC.B $01,S
    TAX
    PLA
    SEP #$20
    BRA CODE_02943B


CODE_029421:
    LDY.W #$0003

CODE_029424:
    LDA.B #$01
    STA.L $7F8000,X
    REP #$20
    TXA
    CLC
    ADC.B $00
    TAX
    SEP #$20
    CPX.W #$4000
    BCS CODE_029441
    DEY
    BNE CODE_029424

CODE_02943B:
    LDA.B #$01
    STA.L $7F8000,X

CODE_029441:
    PLX
    BRL CODE_0293A1


CODE_029445:
    LDX.W #$0000
    STZ.W $03A8
    REP #$20
    LDA.W currentMapNumber
    ASL A
    ASL A
    TAX
    STX.W $03AA
    LDA.W UNREACH_01B69A,X
    SEC
    SBC.W #$B69A
    STA.W $03AC
    TAX
    SEP #$20

CODE_029463:
    LDA.W UNREACH_01B69A,X
    CMP.B #$FF
    BEQ CODE_02948E
    CMP.W player_pos_x_int
    BNE CODE_029487
    LDA.W UNREACH_01B69B,X
    CMP.W player_pos_y_int
    BNE CODE_029487
    LDA.W UNREACH_01B69D,X
    XBA
    LDA.W UNREACH_01B69C,X
    LDY.W #$1A9E
    JSL.L checkForSealedLair
    BCS CODE_02948F

CODE_029487:
    INX
    INX
    INX
    INX
    BRL CODE_029463


CODE_02948E:
    RTL


CODE_02948F:
    REP #$20
    LDA.W UNREACH_01B69C,X
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    CLC
    ADC.W #$BA0D
    TAX
    LDY.W #$1C6D
    LDA.W #$0007
    MVN $01,$01
    SEP #$20
    LDA.B #$02
    STA.W $1C6E
    JSR.W CODE_02912A
    REP #$20
    LDX.W $03AA
    LDA.W $03A8
    EOR.W #$0001
    STA.W $03A8
    BEQ CODE_0294C3
    INX
    INX

CODE_0294C3:
    LDA.W UNREACH_01B69A,X
    SEC
    SBC.W #$B69A
    STA.W $03AC
    SEP #$20
    RTL


CODE_0294D0:
    REP #$20
    LDA.W currentMapNumber
    ASL A
    TAX
    LDA.W UNREACH_01AC96,X
    SEC
    SBC.W #$AC96
    STA.W $03B2
    SEP #$20
    RTL


CODE_0294E4:
    REP #$20
    LDA.W currentMapNumber
    ASL A
    TAX
    LDA.W UNREACH_01A9DE,X
    SEC
    SBC.W #$A9DE
    STA.W $03AE
    SEP #$20
    LDX.W $03AE

CODE_0294FA:
    LDA.W UNREACH_01A9DE,X
    CMP.B #$FF
    BEQ CODE_02957D
    LDA.B #$00
    XBA
    LDA.W UNREACH_01A9E0,X
    AND.B #$7F
    LDY.W #$1A7E
    JSL.L checkForSealedLair
    BCC CODE_029570
    PHX
    LDA.W UNREACH_01A9E0,X
    STA.B $02
    REP #$20
    LDA.W UNREACH_01A9DE,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W UNREACH_01A9DF,X
    AND.W #$00FF
    DEC A
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.W $0343
    XBA
    LDA.W $0345
    JSL.L multiply
    STA.B $01
    XBA
    STA.B $00

CODE_029549:
    LDA.L $7E8000,X
    CMP.B #$FB
    BNE CODE_029561
    LDA.B #$FC
    STA.L $7E8000,X
    LDA.B $02
    BPL CODE_029561
    LDA.B #$FC
    STA.L $7EC000,X

CODE_029561:
    REP #$20
    TXA
    CLC
    ADC.B $00
    TAX
    CPX.W #$4000
    SEP #$20
    BCC CODE_029549
    PLX

CODE_029570:
    REP #$20
    TXA
    CLC
    ADC.W #$0006
    TAX
    SEP #$20
    BRL CODE_0294FA


CODE_02957D:
    RTL


CODE_02957E:
    LDX.W #$0000
    TXY
    STZ.W $0456

CODE_029585:
    LDA.W LD_act1_trialRoom_1,Y
    CMP.B #$FF
    BEQ CODE_0295B0
    LDA.W UNREACH_01BA18,Y
    CMP.W currentMapNumber
    BNE CODE_0295A3
    INC.W $0456
    LDA.L $7F0203,X
    BMI CODE_0295B1
    BEQ CODE_0295B1
    JSL.L CODE_00944F

CODE_0295A3:
    REP #$20
    TYA
    CLC
    ADC.W #$0020
    TAY
    SEP #$20
    INX
    BRA CODE_029585


CODE_0295B0:
    RTL


CODE_0295B1:
    PHX
    PHY
    PHP
    REP #$20
    LDA.W UNREACH_01BA19,Y
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.W UNREACH_01BA1A,Y
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.B #$FE
    PLP
    BPL CODE_0295DE
    LDA.B #$FF
    DEC.W $0456

CODE_0295DE:
    STA.L $7E8000,X
    XBA
    LDA.W UNREACH_01BA15,Y
    BEQ CODE_0295ED
    XBA
    STA.L $7EC000,X

CODE_0295ED:
    PLY
    PLX
    BRA CODE_0295A3


CODE_0295F1:
    LDX.W #$0000
    TXY

CODE_0295F5:
    LDA.L UNREACH_02F28D,X
    CMP.B #$FF
    BEQ CODE_029620
    CMP.W currentMapNumber
    BNE CODE_029614
    LDA.L UNREACH_02F28F,X
    XBA
    LDA.L UNREACH_02F28E,X
    LDY.W #$1A5E
    JSL.L checkForSealedLair
    BCS CODE_029621

CODE_029614:
    REP #$20
    TXA
    CLC
    ADC.W #$0009
    TAX
    SEP #$20
    BRA CODE_0295F5


CODE_029620:
    RTL


CODE_029621:
    PHX
    LDA.L UNREACH_02F290,X
    STA.W $1C71
    LDA.L UNREACH_02F291,X
    STA.W $1C72
    LDA.L UNREACH_02F292,X
    STA.W $1C73
    LDA.L UNREACH_02F293,X
    STA.W $1C74
    REP #$20
    LDA.L UNREACH_02F294,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $16
    LDA.L UNREACH_02F295,X
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    ASL A
    STA.B $18
    JSR.W CODE_0291CB
    SEP #$20
    PLX
    BRA CODE_029614


CODE_029662:
    PHX
    PHY
    LDX.W #$0000

CODE_029667:
    LDA.W UNREACH_01F99A,X
    BMI CODE_029691
    CMP.W currentMapNumber
    BNE CODE_02968B
    LDA.W UNREACH_01F99C,X
    XBA
    LDA.W UNREACH_01F99B,X
    LDY.W #$1ADE
    JSL.L checkForSealedLair
    BCC CODE_02968B
    LDA.W UNREACH_01F99D,X
    STA.W $031E
    SEC
    PLY
    PLX
    RTL


CODE_02968B:
    INX
    INX
    INX
    INX
    BRA CODE_029667


CODE_029691:
    CLC
    PLY
    PLX
    RTL


CODE_029695:
    LDA.W currentMapNumber
    SEC
    SBC.B #$10
    CMP.B #$03
    BCS CODE_0296A0
    RTL


CODE_0296A0:
    LDA.B #$12
    XBA
    LDA.B #$02
    LDY.W #$96AD
    JSL.L CODE_02988A
    RTL

    db $14,$FC,$FF,$0C,$00,$00,$0C,$04,$00,$01,$03,$00,$01,$02,$00,$01
    db $01,$00,$01,$00,$00,$00
    LDA.W playerSouls
    AND.W #$0002
    BNE CODE_0296CC
    RTL

CODE_0296CC:
    SEP #$20
    STZ.W $2123
    STZ.W $2124
    LDA.B #$30
    STA.W $2125
    LDA.B #$12
    STA.W $2130
    REP #$20
    BRA CODE_02975D
    LDA.W playerSouls
    AND.W #$0010
    BNE CODE_0296EB
    RTL

CODE_0296EB:
    SEP #$20
    LDA.B #$20
    STA.W $2123
    STA.W $03C3
    STZ.W $2124
    STZ.W $2125
    LDA.B #$01
    STA.W $038A
    STA.W $038C
    REP #$20
    BRA CODE_02975D
    LDA.W playerSouls
    AND.W #$0008
    BNE CODE_029710
    RTL

CODE_029710:
    SEP #$20
    LDA.B #$20
    STA.W $2123
    STA.W $03C3
    STZ.W $2124
    LDA.B #$01
    STA.W $2125
    LDA.B #$01
    STA.W $038A
    STA.W $038C
    REP #$20
    BRA CODE_02975D
    LDA.W playerSouls
    AND.W #$0004
    BNE CODE_029737
    RTL

CODE_029737:
    SEP #$20
    LDA.B #$33
    STA.W $2123
    STA.W $03C3
    STZ.W $2124
    STZ.W $2125
    STZ.W $212E
    LDA.B #$03
    STA.W $212F
    LDA.B #$82
    STA.W $2130
    REP #$20
    COP #$B0
    db $0F,$B1,$00,$10,$20

CODE_02975D:
    COP #$91
    PHX
    LDY.W $03A0
    LDA.W $0000,Y
    SEC
    SBC.W $033A
    CLC
    ADC.W #$0008
    BMI CODE_02977A
    CMP.W #$0100
    BCC CODE_02977D
    LDA.W #$00FF
    BRA CODE_02977D

CODE_02977A:
    LDA.W #$0000

CODE_02977D:
    STA.B $16
    LDA.W $0002,Y
    SEC
    SBC.W $033C
    SEC
    SBC.W #$0008
    BMI CODE_029796
    CMP.W #$00E0
    BCC CODE_029799
    LDA.W #$00DF
    BRA CODE_029799

CODE_029796:
    LDA.W #$0000

CODE_029799:
    STA.B $18
    LDX.W #$0000
    TXY
    LDA.W #$00E0
    STA.B $0C
    LDA.B $18
    SEC
    SBC.W #$0040
    BEQ CODE_0297ED
    BPL CODE_0297BA
    EOR.W #$FFFF
    INC A
    CMP.W #$0080
    BCS CODE_029822
    TAY
    BRA CODE_0297ED

CODE_0297BA:
    TAY
    SEC
    SBC.B $0C
    EOR.W #$FFFF
    INC A
    STA.B $0C
    TYA
    CMP.W #$0080
    BCC CODE_0297DD
    SEC
    SBC.W #$007F
    TAY
    LDA.W #$FF7F
    STA.L $7E7000,X
    STA.L $7E7800,X
    INX
    INX
    TYA

CODE_0297DD:
    ORA.W #$FF00
    STA.L $7E7000,X
    STA.L $7E7800,X
    INX
    INX
    LDY.W #$0002

CODE_0297ED:
    SEP #$20

CODE_0297EF:
    LDA.B #$02
    STA.L $7E7000,X
    STA.L $7E7800,X
    LDA.B $16
    SEC
    SBC.W UNREACH_01FDC4,Y
    BCS CODE_029803
    LDA.B #$00

CODE_029803:
    STA.L $7E7001,X
    LDA.B $16
    CLC
    ADC.W UNREACH_01FDC4,Y
    BCC CODE_029811
    LDA.B #$FF

CODE_029811:
    STA.L $7E7801,X
    INX
    INX
    INY
    INY
    DEC.B $0C
    BEQ CODE_029822
    CPY.W #$0080
    BCC CODE_0297EF

CODE_029822:
    SEP #$20
    LDA.B #$01
    STA.L $7E7000,X
    STA.L $7E7800,X
    LDA.B #$FF
    STA.L $7E7001,X
    STA.L $7E7801,X
    LDA.B #$00
    STA.L $7E7002,X
    STA.L $7E7802,X
    LDA.B #$26
    XBA
    LDA.B #$7E
    LDY.W #$7000
    JSL.L CODE_02988A
    LDA.B #$27
    XBA
    LDA.B #$7E
    LDY.W #$7800
    JSL.L CODE_02988A
    PLX
    REP #$20
    RTL

zPrepareDmaBank0:
    STZ.B $42
    LDA.B #$10
    STA.B $44
    LDA.B #$40
    STA.B $46
    LDX.W #$6000
    STX.B $48
    RTL


CODE_02986E:
    PHP
    PHX
    SEP #$20
    PHA
    LDA.B #$00
    XBA
    PHA
    TAX
    LDA.L UNREACH_0298BC,X
    LDX.B $46
    ORA.B #$40
    STA.W $4300,X
    LDA.B $02,S
    STA.W $4307,X
    BRA CODE_02989D


CODE_02988A:
    PHP
    PHX
    SEP #$20
    PHA
    LDA.B #$00
    XBA
    PHA
    TAX
    LDA.L UNREACH_0298BC,X
    LDX.B $46
    STA.W $4300,X

CODE_02989D:
    PLA
    STA.W $4301,X
    REP #$20
    TYA
    STA.W $4302,X
    SEP #$20
    PLA
    STA.W $4304,X
    LDA.B $44
    TSB.B $42
    ASL.B $44
    LDA.B $46
    ADC.B #$10
    STA.B $46
    PLX
    PLP
    RTL


UNREACH_0298BC:
    db $00,$00,$01,$01,$02,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02
    db $02,$02,$02,$02,$02,$00,$01,$01,$01,$01,$00,$02,$02,$02,$02,$02
    db $02,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$80,$80,$80,$80,$82,$81,$81,$82,$82,$82,$80,$80

checkButtons:
    LDA.W $0323
    BIT.B #$20
    BEQ CODE_029906
    BRL openItemMenu


CODE_029906:
    BIT.B #$80
    BEQ CODE_02990D
    BRL CODE_0299D8


CODE_02990D:
    BIT.B #$0F
    BNE CODE_029918
    LDA.W wButtonsPressed
    BIT.B #$80
    BNE openInfoMenu

CODE_029918:
    RTL


openInfoMenu:
    LDA.W playerCurrentHealth
    LDX.W #$1B6C
    JSL.L convert_hex_to_dec
    LDA.W playerMaxHealth
    LDX.W #$1B6E
    JSL.L convert_hex_to_dec
    LDA.W strengthFromLevel
    PHA
    CMP.B #$0C
    BCC CODE_02993A
    LDA.B #$0C
    STA.W strengthFromLevel

CODE_02993A:
    LDA.W defenseFromLevel
    PHA
    CMP.B #$0C
    BCC CODE_029947
    db $A9,$0C,$8D,$76,$1B

CODE_029947:
    LDY.W #$C571
    JSL.L printOsdStringFromBank2
    PLA
    STA.W defenseFromLevel
    PLA
    STA.W strengthFromLevel
    BRK #$07
    JSL.L wait_vblank

wait_release1:
    JSR.W z_vblank_dec0312_readButtons
    BIT.B #$80
    BNE wait_release1
    REP #$20

wait_pressed1:
    JSR.W z_vblank_dec0312_readButtons
    BIT.W #$CF80
    BEQ wait_pressed1
    SEP #$20
    LDY.W #$C624
    JSL.L printOsdStringFromBank2
    JSR.W printSoulNames
    REP #$20

wait_release2:
    JSR.W z_vblank_dec0312_readButtons
    BIT.W #$CF80
    BNE wait_release2

wait_pressed2:
    JSR.W z_vblank_dec0312_readButtons
    BIT.W #$CF80
    BEQ wait_pressed2
    LDA.W #$C0C0
    TRB.W zwSomethingWithButtons
    STZ.W wButtonsPressed
    SEP #$20
    BRK #$07
    JSR.W clearOsd
    LDA.B #$1F
    STA.W updateHudBitfield
    JSL.L UpdateHud
    JSR.W z_vblank_dec0312_readButtons
    RTL


z_vblank_dec0312_readButtons:
    JSL.L wait_vblank
    LDX.W $0312
    DEX
    STX.W $0312
    LDA.W wButtonsPressed
    RTS


printSoulNames:
    LDA.W playerSouls
    LDY.W #$C636

CODE_0299BD:
    LSR A
    PHA
    BCC CODE_0299C7
    PHY
    JSL.L printOsdStringFromBank2
    PLY

CODE_0299C7:
    REP #$20
    TYA
    CLC
    ADC.W #$0015
    TAY
    SEP #$20
    PLA
    CPY.W #$C69F
    BNE CODE_0299BD
    RTS


CODE_0299D8:
    JSL.L disable_vblank_interrupt
    JSR.W CODE_0299E4
    JSL.L enable_interrupts
    RTL


CODE_0299E4:
    JSL.L CODE_04F3D4
    BCC CODE_0299EB
    RTS

CODE_0299EB:
    PHP
    REP #$20
    LDY.W $039C
    AND.W #$00FF
    BEQ CODE_029A43
    DEC A
    BNE CODE_0299FC
    BRL CODE_029AA7


CODE_0299FC:
    DEC A
    BNE CODE_029A02
    BRL CODE_029A05


CODE_029A02:
    BRL CODE_029A26


CODE_029A05:
    LDA.W #$0002
    STA.B $00
    LDA.W $0000,Y
    CLC
    ADC.W #$0010
    STA.B $16
    LDA.W $0002,Y
    SEC
    SBC.W #$0008
    STA.B $18
    JSR.W CODE_029AC4
    BCC CODE_029A24
    BRL CODE_029AF9


CODE_029A24:
    PLP
    RTS


CODE_029A26:
    LDA.W #$0003
    STA.B $00
    LDA.W $0000,Y
    STA.B $16
    LDA.W $0002,Y
    SEC
    SBC.W #$0008
    STA.B $18
    JSR.W CODE_029AC4
    BCC CODE_029A41
    BRL CODE_029AF9


CODE_029A41:
    PLP
    RTS


CODE_029A43:
    LDA.W #$0000
    STA.B $00
    LDA.W $0000,Y
    CLC
    ADC.W #$0008
    STA.B $16
    LDA.W $0002,Y
    SEC
    SBC.W #$0010
    STA.B $18
    JSR.W CODE_029AC4
    BCC CODE_029A62
    BRL CODE_029AF9


CODE_029A62:
    PHX
    LDX.W $039C
    LDA.W $0000,X
    AND.W #$FFF0
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0020
    AND.W #$FFF0
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    PLX
    AND.W #$000F
    CMP.W #$0006
    BNE CODE_029AA5
    LDA.W $0000,Y
    CLC
    ADC.W #$0008
    STA.B $16
    LDA.W $0002,Y
    SEC
    SBC.W #$0020
    STA.B $18
    JSR.W CODE_029AC4
    BCC CODE_029AA5
    BRL CODE_029AF9


CODE_029AA5:
    PLP
    RTS


CODE_029AA7:
    LDA.W #$0001
    STA.B $00
    LDA.W $0000,Y
    CLC
    ADC.W #$0008
    STA.B $16
    LDA.W $0002,Y
    STA.B $18
    JSR.W CODE_029AC4
    BCC CODE_029AC2
    BRL CODE_029AF9


CODE_029AC2:
    PLP
    RTS


CODE_029AC4:
    LDA.W $06A6

CODE_029AC7:
    TAX
    BEQ CODE_029AF5
    LDA.W $0016,X
    BIT.W #$0040
    BEQ CODE_029AF0
    LDA.B $16
    SEC
    SBC.W $0000,X
    CMP.W $0010,X
    BEQ CODE_029ADF
    BCS CODE_029AF0

CODE_029ADF:
    LDA.B $18
    SEC
    SBC.W $0002,X
    CLC
    ADC.W $0012,X
    CMP.W $0012,X
    BEQ CODE_029AF7
    BCC CODE_029AF7

CODE_029AF0:
    LDA.W $003E,X
    BRA CODE_029AC7


CODE_029AF5:
    CLC
    RTS


CODE_029AF7:
    SEC
    RTS


CODE_029AF9:
    LDA.W $0030,X
    BEQ CODE_029B5A
    LDA.W $0016,X
    BIT.W #$0008
    BNE CODE_029B1D
    SEP #$20
    LDA.B #$02
    PHA
    PEA.W UNREACH_019B59
    LDY.W $0038,X
    LDA.W PTR16_01800D,Y
    PHA
    LDY.W $0030,X
    DEY
    PHY
    REP #$20
    RTL


CODE_029B1D:
    PHX
    LDY.W #$1A1E
    LDA.W #$003F
    MVN $01,$01
    PLX
    PHX
    JSR.W CODE_029B5C
    AND.W #$00FF
    STA.W $001E,X
    STZ.W $0020,X
    JSL.L CODE_0088F3
    SEP #$20
    LDA.B #$02
    PHA
    PEA.W UNREACH_019B4F
    LDY.W $0038,X
    LDA.W PTR16_01800D,Y
    PHA
    LDY.W $0030,X
    DEY
    PHY
    REP #$20
    RTL

    LDX.W #$1A1E
    PLY
    LDA.W #$003F
    MVN $01,$01

CODE_029B5A:
    PLP
    RTS


CODE_029B5C:
    PHP
    SEP #$20
    LDY.W $001E,X
    LDA.B #$06
    JSL.L divide
    XBA
    LDA.B #$06
    JSL.L multiply
    STA.B $01
    LDA.B $00
    BEQ CODE_029B93
    DEC A
    BEQ CODE_029B91
    DEC A
    BEQ CODE_029B84
    LDA.W $001D,X
    BIT.B #$40
    BNE CODE_029B8F
    BRA CODE_029B8B


CODE_029B84:
    LDA.W $001D,X
    BIT.B #$40
    BEQ CODE_029B8F

CODE_029B8B:
    JSL.L CODE_04F3EB

CODE_029B8F:
    INC.B $01

CODE_029B91:
    INC.B $01

CODE_029B93:
    LDA.B $01
    PLP
    RTS


openItemMenu:
    STZ.B $42
    JSL.L wait_vblank
    LDA.B #$80
    STA.W $2100
    LDA.B #$5C
    STA.W $2108
    LDA.B #$20
    STA.W $210B
    LDA.B #$06
    STA.W $212C
    STZ.W $2131
    STZ.W $2123
    LDX.W $033A
    STX.W $045A
    LDX.W $033C
    STX.W $045C
    LDX.W $033E
    STX.W $045E
    LDX.W $0340
    STX.W $0460
    LDX.W #$0000
    STX.W $033A
    STX.W $033C
    STX.W $033E
    STX.W $0340
    STZ.W $042F
    LDA.W playerEquippedMagic
    STA.W $0435
    JSR.W CODE_02A3EA
    JSR.W CODE_02A416
    JSR.W CODE_02A43D
    JSR.W CODE_02A390
    JSL.L wait_vblank
    BRK #$07
    JSR.W printItemMenu
    LDA.B #$C0
    TRB.W $032B
    STZ.W $0323
    JSL.L wait_vblank
    LDX.W $045A
    STX.W $033A
    LDX.W $045C
    STX.W $033C
    LDX.W $045E
    STX.W $033E
    LDX.W $0460
    STX.W $0340
    LDA.B #$80
    STA.W $2100
    LDA.W $03C2
    STA.W $2108
    STZ.W $210B
    LDA.W $03C0
    STA.W $212C
    LDA.W $03C1
    STA.W $2131
    LDA.W $03C3
    STA.W $2123
    JSL.L CODE_02A463
    JSR.W CODE_02A400
    JSL.L transferMagicSprite
    LDA.W playerEquippedMagic
    CMP.W $0435
    BEQ CODE_029C5D
    JSL.L CODE_00AC7D
    STZ.W magicInUse
    STZ.W $0434

CODE_029C5D:
    JSL.L CODE_04F3F9
    JSR.W clearOsd
    LDA.B #$1F
    STA.W updateHudBitfield
    JSL.L wait_vblank
    JSL.L CODE_008127
    JSL.L wait_vblank
    LDA.B #$0F
    STA.W $2100
    RTL


printItemMenu:
    JSR.W clearOsd
    LDY.W #$C69F
    JSL.L printOsdStringFromBank2
    LDA.B #$01
    STA.W $03B8
    JSL.L enable_interrupts
    JSL.L enableNmiInterruptAndBlankScreen
    JSR.W DisplayItems
    LDA.B #$02
    STA.W $03B8
    JSL.L wait_vblank
    LDA.B #$01
    STA.W $03B8
    JSL.L wait_vblank
    LDX.W #$048A
    LDA.B #$00
    XBA
    LDA.B #$04

CODE_029CAF:
    JSR.W CODE_02A138
    BCC CODE_029CB7
    BRL CODE_029D44


CODE_029CB7:
    CMP.B #$00
    BEQ CODE_029CC3
    DEC A
    BEQ CODE_029CE4
    DEC A
    BEQ CODE_029D05
    BRA CODE_029D23


CODE_029CC3:
    LDA.B #$08
    LDY.W #$1B1E
    JSR.W CODE_029DA3
    BCS CODE_029CD3
    STA.W playerEquippedSword
    JSR.W UpdateStrengthAttribute

CODE_029CD3:
    LDY.W #$C6C1
    JSL.L printOsdStringFromBank2
    LDX.W #$048A
    LDA.B #$00
    XBA
    LDA.B #$04
    BRA CODE_029CAF


CODE_029CE4:
    LDA.B #$08
    LDY.W #$1B26
    JSR.W CODE_029DA3
    BCS CODE_029CF4
    STA.W playerEquippedArmor
    JSR.W UpdateStrengthAttribute

CODE_029CF4:
    LDY.W #$C6C1
    JSL.L printOsdStringFromBank2
    LDX.W #$050A
    LDA.B #$01
    XBA
    LDA.B #$04
    BRA CODE_029CAF


CODE_029D05:
    LDA.B #$08
    LDY.W #$1B2E
    JSR.W CODE_029DA3
    BCS CODE_029D12
    STA.W playerEquippedMagic

CODE_029D12:
    LDY.W #$C6C1
    JSL.L printOsdStringFromBank2
    LDX.W #$058A
    LDA.B #$02
    XBA
    LDA.B #$04
    BRA CODE_029CAF


CODE_029D23:
    LDA.B #$28
    LDY.W #$1B36
    JSR.W CODE_029FF2
    BCS CODE_029D30
    STA.W playerEquippedItem

CODE_029D30:
    LDY.W #$C6C1
    JSL.L printOsdStringFromBank2
    LDX.W #$060A
    LDA.B #$03
    XBA
    LDA.B #$04
    BRL CODE_029CAF

    db $18,$60

CODE_029D44:
    SEC
    RTS


CODE_029D46:
    PHX
    PHY
    JSR.W clearOsdUpper
    LDY.W #$C69F
    JSL.L printOsdStringFromBank2
    LDA.B #$01
    STA.W $03B8
    JSL.L wait_vblank
    JSR.W CODE_02A43D
    JSR.W DisplayItems
    LDA.B #$02
    STA.W $03B8
    JSL.L wait_vblank
    LDA.B #$01
    STA.W $03B8
    JSL.L wait_vblank
    PLY
    PLX
    RTS

CODE_029D76:
    PHX
    PHY
    LDY.W #$C701
    JSL.L printOsdStringFromBank2
    LDA.B #$01
    STA.W $03B8
    JSL.L wait_vblank
    JSR.W CODE_02A450
    JSR.W CODE_029FD3
    LDA.B #$02
    STA.W $03B8
    JSL.L wait_vblank
    LDA.B #$01
    STA.W $03B8
    JSL.L wait_vblank
    PLY
    PLX
    RTS


CODE_029DA3:
    STA.W MenuMaxItems
    STY.W $0056
    STZ.W $03C6
    JSR.W CODE_029EAB
    LDX.W #$0000
    TXY

CODE_029DB3:
    LDA.B ($56),Y
    BMI CODE_029DC6
    INY
    CPY.W MenuMaxItems
    BNE CODE_029DB3
    LDY.W #$0000
    LDA.B ($56),Y
    ORA.B #$80
    STA.B ($56),Y

CODE_029DC6:
    JSR.W DisplayItems
    JSL.L wait_vblank
    PHY
    REP #$20
    LDA.B ($56),Y
    AND.W #$007F
    PHA
    BEQ CODE_029DEF
    LDY.W #$D53E
    CMP.W #$0009
    BCC CODE_029DEB
    LDY.W #$D558
    CMP.W #$0011
    BCC CODE_029DEB
    LDY.W #$D56B

CODE_029DEB:
    JSL.L printOsdStringFromBank2

CODE_029DEF:
    PLA
    ASL A
    TAX
    LDA.L DescriptionTableStart,X
    TAY
    SEP #$20
    JSL.L printOsdStringFromBank2
    PLY

CODE_029DFE:
    JSR.W vblankAndReadButtonsPressedUpper
    BEQ CODE_029E0B
    JSR.W CODE_029ECF
    JSR.W DisplayItems
    BRA CODE_029DFE


CODE_029E0B:
    JSR.W vblankAndReadButtonsPressedUpper
    LSR A
    BCS CODE_029E57
    LSR A
    BCS CODE_029E6A
    LSR A
    BCS CODE_029E7A
    LSR A
    BCS CODE_029E88
    LSR A
    LSR A
    LSR A
    BCS CODE_029E2A
    LSR A
    BCS CODE_029E2A
    JSR.W CODE_029ECF
    JSR.W DisplayItems
    BRA CODE_029E0B


CODE_029E2A:
    BRK #$18
    LDA.B ($56),Y
    ORA.B #$80
    STA.B ($56),Y
    JSR.W DisplayItems
    LDA.B #$01
    TSB.W $03B8
    JSL.L wait_vblank
    LDA.B ($56),Y
    AND.B #$7F
    CLC
    RTS

    BRK #$07
    JSR.W CODE_029EBD
    JSR.W DisplayItems
    LDA.B #$01
    TSB.W $03B8
    JSL.L wait_vblank
    SEC
    RTS


CODE_029E57:
    TYA
    CLC
    ADC.B #$04
    CMP.W MenuMaxItems
    BCC CODE_029E63
    BRL CODE_029DC6


CODE_029E63:
    TYX
    INY
    INY
    INY
    INY
    BRA CODE_029E91

CODE_029E6A:
    TYA
    SEC
    SBC.B #$04
    BPL CODE_029E73
    BRL CODE_029DC6


CODE_029E73:
    TYX
    DEY
    DEY
    DEY
    DEY
    BRA CODE_029E91


CODE_029E7A:
    TYA
    INC A
    CMP.W MenuMaxItems
    BCC CODE_029E84
    BRL CODE_029DC6


CODE_029E84:
    TYX
    INY
    BRA CODE_029E91

CODE_029E88:
    TYA
    DEC A
    BPL CODE_029E8F
    BRL CODE_029DC6


CODE_029E8F:
    TYX
    DEY

CODE_029E91:
    BRK #$07
    PHY
    LDA.B ($56),Y
    ORA.B #$80
    STA.B ($56),Y
    TXY
    LDA.B ($56),Y
    AND.B #$7F
    STA.B ($56),Y
    STZ.W $03C6
    PLY
    JSR.W CODE_029ECF
    BRL CODE_029DC6

CODE_029EAB:
    LDX.W #$0000
    TXY

CODE_029EAF:
    LDA.B ($56),Y
    STA.L $7F0403,X
    INY
    INX
    CPX.W MenuMaxItems
    BNE CODE_029EAF
    RTS


CODE_029EBD:
    LDX.W #$0000
    TXY

CODE_029EC1:
    LDA.L $7F0403,X
    STA.B ($56),Y
    INY
    INX
    CPX.W MenuMaxItems
    BNE CODE_029EC1
    RTS


CODE_029ECF:
    LDA.W $03C6
    AND.B #$1F
    CMP.B #$18
    BCC CODE_029EDE
    LDA.B ($56),Y
    AND.B #$7F
    BRA CODE_029EE2


CODE_029EDE:
    LDA.B ($56),Y
    ORA.B #$80

CODE_029EE2:
    STA.B ($56),Y
    INC.W $03C6
    LDA.B #$01
    TSB.W $03B8
    RTS


UpdateStrengthAttribute:
    LDX.W playerEquippedSword
    LDA.L ItemStrengthTable,X
    STA.W strengthFromItem
    LDA.L ItemArmorTable,X
    STA.W defenseFromItem
    LDX.W playerEquippedArmor
    LDA.L ItemStrengthTable,X
    CLC
    ADC.W strengthFromItem
    STA.W strengthFromItem
    LDA.L ItemArmorTable,X
    CLC
    ADC.W defenseFromItem
    STA.W defenseFromItem
    RTS


DisplayItems:
    PHP
    PHY
    REP #$20
    LDX.W #$0000

displayWeapons:
    PHX

displayWeapons_1:
    TXA
    ASL A
    TAX
    LDA.W UNREACH_01F9F7,X
    TAY
    PLX
    LDA.W inventoryWeapons,X
    JSR.W CODE_029F67
    INX
    CPX.W #$0008
    BNE displayWeapons
    LDX.W #$0000

displayArmor:
    PHX
    TXA
    ASL A
    TAX
    LDA.W UNREACH_01FA07,X
    TAY
    PLX
    LDA.W inventoryArmor,X
    JSR.W CODE_029F67
    INX
    CPX.W #$0008
    BNE displayArmor
    LDX.W #$0000

displayMagic:
    PHX
    TXA
    ASL A
    TAX
    LDA.W UNREACH_01FA17,X
    TAY
    PLX
    LDA.W inventoryMagic,X
    JSR.W CODE_029F67
    INX
    CPX.W #$0008
    BNE displayMagic
    PLY
    PLP
    RTS


CODE_029F67:
    PHB
    PHX
    XBA
    TAX
    SEP #$20
    PHP
    LDA.B #$7F
    PHA
    PLB
    PLP
    BMI CODE_029F85
    LDA.B #$00
    STA.W $7000,Y
    STA.W $7002,Y
    STA.W $7040,Y
    STA.W $7042,Y
    BRA CODE_029FAA


CODE_029F85:
    LDA.B #$2A
    STA.W $7000,Y
    STA.W $7002,Y
    STA.W $7040,Y
    STA.W $7042,Y
    LDA.W $7001,Y
    ORA.B #$0C
    STA.W $7001,Y
    EOR.B #$40
    STA.W $7003,Y
    EOR.B #$C0
    STA.W $7041,Y
    EOR.B #$40
    STA.W $7043,Y

CODE_029FAA:
    REP #$20
    XBA
    AND.W #$007F
    ASL A
    ASL A
    ASL A
    TAX
    LDA.L UNREACH_098800,X
    STA.W $7800,Y
    LDA.L UNREACH_098802,X
    STA.W $7802,Y
    LDA.L UNREACH_098804,X
    STA.W $7840,Y
    LDA.L UNREACH_098806,X
    STA.W $7842,Y
    PLX
    PLB
    RTS


CODE_029FD3:
    PHP
    PHY
    REP #$20
    LDX.W #$0000

CODE_029FDA:
    PHX
    TXA
    ASL A
    TAX
    LDA.W UNREACH_01FA27,X
    TAY
    PLX
    LDA.W inventoryItems,X
    JSR.W CODE_029F67
    INX
    CPX.W #$0028
    BNE CODE_029FDA
    PLY
    PLP
    RTS


CODE_029FF2:
    STA.W MenuMaxItems
    STY.W $0056
    STZ.W $03C6
    JSR.W CODE_029EAB
    LDX.W #$0000
    TXY

CODE_02A002:
    LDA.B ($56),Y
    BMI CODE_02A015
    INY
    CPY.W MenuMaxItems
    BNE CODE_02A002
    LDY.W #$0000
    LDA.B ($56),Y
    ORA.B #$80
    STA.B ($56),Y

CODE_02A015:
    JSR.W CODE_029FD3
    JSL.L wait_vblank
    PHY
    REP #$20
    LDA.B ($56),Y
    AND.W #$007F
    BEQ CODE_02A02F
    PHA
    LDY.W #$D56B
    JSL.L printOsdStringFromBank2
    PLA

CODE_02A02F:
    ASL A
    TAX
    LDA.L DescriptionTableStart,X
    TAY
    SEP #$20
    JSL.L printOsdStringFromBank2
    PLY

CODE_02A03D:
    JSR.W vblankAndReadButtonsPressedUpper
    BEQ CODE_02A04A
    JSR.W CODE_029ECF
    JSR.W CODE_029FD3
    BRA CODE_02A03D


CODE_02A04A:
    JSR.W vblankAndReadButtonsPressedUpper
    LSR A
    BCS CODE_02A0C8
    LSR A
    BCC CODE_02A056
    BRL CODE_02A0D6


CODE_02A056:
    LSR A
    BCS CODE_02A099
    LSR A
    BCS CODE_02A0B2
    LSR A
    LSR A
    LSR A
    BCS CODE_02A06C
    LSR A
    BCS CODE_02A06C
    JSR.W CODE_029ECF
    JSR.W CODE_029FD3
    BRA CODE_02A04A


CODE_02A06C:
    BRK #$18
    LDA.B ($56),Y
    ORA.B #$80
    STA.B ($56),Y
    JSR.W CODE_029FD3
    LDA.B #$01
    TSB.W $03B8
    JSL.L wait_vblank
    LDA.B ($56),Y
    AND.B #$7F
    CLC
    RTS

    db $00,$07,$20,$BD,$9E,$20,$D3,$9F,$A9,$01,$0C,$B8,$03,$22,$B7,$B1
    db $02,$38,$60

CODE_02A099:
    TYA
    CLC
    ADC.B #$0A
    CMP.W MenuMaxItems
    BCC CODE_02A0A5
    db $82,$70,$FF

CODE_02A0A5:
    TYX
    INY
    INY
    INY
    INY
    INY
    INY
    INY
    INY
    INY
    INY
    BRA CODE_02A0DF


CODE_02A0B2:
    TYA
    SEC
    SBC.B #$0A
    BPL CODE_02A0BB
    BRL CODE_02A015

CODE_02A0BB:
    TYX
    DEY
    DEY
    DEY
    DEY
    DEY
    DEY
    DEY
    DEY
    DEY
    DEY
    BRA CODE_02A0DF


CODE_02A0C8:
    TYA
    INC A
    CMP.W MenuMaxItems
    BCC CODE_02A0D2
    BRL CODE_02A015

CODE_02A0D2:
    TYX
    INY
    BRA CODE_02A0DF


CODE_02A0D6:
    TYA
    DEC A
    BPL CODE_02A0DD
    db $82,$38,$FF

CODE_02A0DD:
    TYX
    DEY

CODE_02A0DF:
    BRK #$07
    PHY
    LDA.B ($56),Y
    ORA.B #$80
    STA.B ($56),Y
    TXY
    LDA.B ($56),Y
    AND.B #$7F
    STA.B ($56),Y
    STZ.W $03C6
    PLY
    JSR.W CODE_029ECF
    BRL CODE_02A015


giveItem:
    PHP
    SEP #$20
    CMP.B #$19
    BCS CODE_02A10B
    XBA
    LDA.B #$00
    XBA
    TAY
    DEY
    STA.W inventoryWeapons,Y
    PLP
    RTL


CODE_02A10B:
    XBA
    LDA.B #$00
    XBA
    TAY
    DEY
    PHA
    LDA.W inventoryWeapons,Y
    PHA
    AND.B #$80
    ORA.B $02,S
    STA.W inventoryWeapons,Y
    BPL CODE_02A124
    AND.B #$7F
    STA.W playerEquippedItem

CODE_02A124:
    PLA
    AND.B #$7F
    CMP.B #$38
    BNE CODE_02A135
    LDA.W playerMaxHealth
    SEC
    SBC.W playerCurrentHealth
    STA.W bPlayerHealthRestore

CODE_02A135:
    PLA
    PLP
    RTL


CODE_02A138:
    STA.W MenuMaxItems
    XBA
    PHA
    STZ.W $03C6

CODE_02A140:
    LDA.B #$2B
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    LDA.B #$01
    TSB.W $03B8

CODE_02A14F:
    JSR.W vblankAndReadButtonsPressedUpper
    BEQ CODE_02A159
    JSR.W CODE_02A30B
    BRA CODE_02A14F


CODE_02A159:
    JSR.W vblankAndReadButtonsPressedUpper
    BIT.B #$08
    BNE CODE_02A185
    BIT.B #$04
    BNE CODE_02A19A
    BIT.B #$40
    BNE CODE_02A176
    BIT.B #$80
    BNE CODE_02A171
    JSR.W CODE_02A30B
    BRA CODE_02A159


CODE_02A171:
    BRK #$07
    CLC
    BRA CODE_02A179


CODE_02A176:
    BRK #$07
    SEC

CODE_02A179:
    LDA.B #$2B
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    PLA
    RTS


CODE_02A185:
    LDA.B $01,S
    BEQ CODE_02A14F
    DEC A
    STA.B $01,S
    TXY
    REP #$20
    TYA
    SEC
    SEC
    SBC.W #$0080
    TAY
    SEP #$20
    BRA CODE_02A1AF


CODE_02A19A:
    LDA.B $01,S
    INC A
    CMP.W MenuMaxItems
    BCS CODE_02A14F
    STA.B $01,S
    TXY
    REP #$20
    TYA
    CLC
    ADC.W #$0080
    TAY
    SEP #$20

CODE_02A1AF:
    BRK #$07
    LDA.B #$20
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    STZ.W $03C6
    TYX
    LDA.W $042F
    BEQ CODE_02A1D6
    LDA.B $01,S
    CMP.B #$03
    BNE CODE_02A1CD
    db $82,$73,$FF

CODE_02A1CD:
    JSR.W CODE_029D46
    STZ.W $042F
    BRL CODE_02A140

CODE_02A1D6:
    LDA.B $01,S
    CMP.B #$03
    BEQ CODE_02A1DF
    BRL CODE_02A140


CODE_02A1DF:
    JSR.W CODE_029D76
    INC.W $042F
    BRL CODE_02A140


ChooseGameMenuLogic:
    PHX
    SEP #$20
    STA.W MenuMaxItems
    XBA
    PHA

game_menu_main_loop:
    LDA.B $01,S
    REP #$20
    AND.W #$00FF
    ASL A
    TAX
    LDA.L PTR16_02A277,X
    TAX
    SEP #$20
    STZ.W $03C6
    LDA.B #$2B
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    LDA.B #$01
    TSB.W $03B8

CODE_02A212:
    JSR.W vblankAndReadButtonsPressedUpper
    BEQ CODE_02A21C
    JSR.W CODE_02A30B
    BRA CODE_02A212


CODE_02A21C:
    JSR.W vblankAndReadButtonsPressedUpper
    BIT.B #$08
    BNE CODE_02A255
    BIT.B #$04
    BNE CODE_02A25E
    BIT.B #$40
    BNE CODE_02A243
    BIT.B #$80
    BNE CODE_02A234
    JSR.W CODE_02A30B
    BRA CODE_02A21C


CODE_02A234:
    BRK #$18
    CLC
    LDA.B #$2B
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    BRA CODE_02A250


CODE_02A243:
    BRK #$07
    SEC
    LDA.B #$20
    STA.L $7F6FC0,X
    STA.L $7F7000,X

CODE_02A250:
    PLA
    PLX
    REP #$20
    RTL


CODE_02A255:
    LDA.B $01,S
    BEQ CODE_02A212
    DEC A
    STA.B $01,S
    BRA CODE_02A268


CODE_02A25E:
    LDA.B $01,S
    INC A
    CMP.W MenuMaxItems
    BCS CODE_02A212
    STA.B $01,S

CODE_02A268:
    BRK #$07
    LDA.W #$9F20
    CPY.W #$7F6F
    STA.L $7F7000,X
    BRL game_menu_main_loop


PTR16_02A277:
    dw $02CA
    dw $038A
    dw $044A
    dw $050A
    dw $05CA

printAndRunChoiceBox:
    STA.W MenuMaxItems
    XBA
    PHA
    STZ.W $03C6

CODE_02A289:
    LDA.B #$2B
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    LDA.B #$01
    TSB.W $03B8

CODE_02A298:
    JSR.W vblankAndReadButtonsPressedUpper
    BEQ CODE_02A2A2
    JSR.W CODE_02A30B
    BRA CODE_02A298


CODE_02A2A2:
    JSR.W vblankAndReadButtonsPressedUpper
    BIT.B #$08
    BNE CODE_02A2CE
    BIT.B #$04
    BNE CODE_02A2E3
    BIT.B #$40
    BNE CODE_02A2BF
    BIT.B #$80
    BNE CODE_02A2BA
    JSR.W CODE_02A30B
    BRA CODE_02A2A2


CODE_02A2BA:
    BRK #$18
    CLC
    BRA CODE_02A2C2


CODE_02A2BF:
    BRK #$07
    SEC

CODE_02A2C2:
    LDA.B #$2B
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    PLA
    RTL


CODE_02A2CE:
    LDA.B $01,S
    BEQ CODE_02A298
    DEC A
    STA.B $01,S
    TXY
    REP #$20
    TYA
    SEC
    SEC
    SBC.W #$0080
    TAY
    SEP #$20
    BRA CODE_02A2F8


CODE_02A2E3:
    LDA.B $01,S
    INC A
    CMP.W MenuMaxItems
    BCS CODE_02A298
    STA.B $01,S
    TXY
    REP #$20
    TYA
    CLC
    ADC.W #$0080
    TAY
    SEP #$20

CODE_02A2F8:
    BRK #$07
    LDA.B #$20
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    STZ.W $03C6
    TYX
    BRL CODE_02A289


CODE_02A30B:
    LDA.W $03C6
    AND.B #$1F
    CMP.B #$18
    BCC CODE_02A318
    LDA.B #$20
    BRA CODE_02A31A


CODE_02A318:
    LDA.B #$2B

CODE_02A31A:
    STA.L $7F6FC0,X
    STA.L $7F7000,X
    INC.W $03C6
    LDA.B #$01
    TSB.W $03B8
    RTS


CODE_02A32B:
    PHP
    SEP #$20
    LDA.B #$5C
    STA.W $2108
    LDA.B #$20
    STA.W $210B
    LDA.B #$06
    STA.W $212C
    STZ.W $2131
    LDA.B #$09
    STA.W $2105
    JSR.W CODE_02A416
    JSR.W CODE_02A43D
    JSR.W CODE_02A390
    PLP
    RTL


clearOsd:
    PHP
    PHB
    SEP #$20
    LDA.B #$7F
    PHA
    PLB
    REP #$20
    LDA.W #$2000
    LDX.W #$07FE

CODE_02A360:
    STA.W $7000,X
    DEX
    DEX
    BPL CODE_02A360
    LDA.W #$0001
    TSB.W $03B8
    PLB
    PLP
    RTS


clearOsdUpper:
    PHP
    PHB
    SEP #$20
    LDA.B #$7F
    PHA
    PLB
    REP #$20
    LDA.W #$2000
    LDX.W #$03FE

CODE_02A380:
    STA.W $7000,X
    DEX
    DEX
    BPL CODE_02A380
    LDA.W #$0001
    TSB.W $03B8
    PLB
    PLP
    RTS

CODE_02A390:
    PHP
    PHB
    LDA.B #$7F
    PHA
    PLB
    REP #$20
    LDY.W #$F200
    STY.B $00
    LDA.W #$0009
    STA.B $02
    LDY.W #$0000

CODE_02A3A5:
    LDA.B [$00]
    INC.B $00
    AND.W #$00FF
    ASL A
    ASL A
    ASL A
    TAX
    LDA.L UNREACH_098800,X
    STA.W $7800,Y
    LDA.L UNREACH_098802,X
    STA.W $7802,Y
    LDA.L UNREACH_098804,X
    STA.W $7840,Y
    LDA.L UNREACH_098806,X
    STA.W $7842,Y
    INY
    INY
    INY
    INY
    TYA
    AND.W #$003F
    BNE CODE_02A3A5
    TYA
    CLC
    ADC.W #$0040
    TAY
    CPY.W #$0800
    BNE CODE_02A3A5
    PLB
    LDA.W #$0002
    TSB.W $03B8
    PLP
    RTS


CODE_02A3EA:
    PHP
    PHX
    REP #$20
    LDX.W #$01FE

CODE_02A3F1:
    LDA.L $7F0000,X
    STA.L $7E6000,X
    DEX
    DEX
    BPL CODE_02A3F1
    PLX
    PLP
    RTS


CODE_02A400:
    PHP
    PHX
    REP #$20
    LDX.W #$01FE

CODE_02A407:
    LDA.L $7E6000,X
    STA.L $7F0000,X
    DEX
    DEX
    BPL CODE_02A407
    PLX
    PLP
    RTS


CODE_02A416:
    LDX.W #$2000
    STX.W $2116
    LDA.B #$01
    STA.W $4300
    LDA.B #$18
    STA.W $4301
    LDX.W #$B000
    STX.W $4302
    LDA.B #$09
    STA.W $4304
    LDX.W #$2000
    STX.W $4305
    LDA.B #$01
    STA.W $420B
    RTS


CODE_02A43D:
    PHB
    REP #$20
    LDX.W #$F100
    LDY.W #$0000
    LDA.W #$00FF
    MVN $7F,$09
    SEP #$20
    PLB
    RTS


CODE_02A450:
    PHB
    REP #$20
    LDX.W #$F000
    LDY.W #$0000
    LDA.W #$00FF
    MVN $7F,$09
    SEP #$20
    PLB
    RTS


CODE_02A463:
    LDX.W #$2000
    STX.W $2116
    LDA.B #$01
    STA.W $4300
    LDA.B #$18
    STA.W $4301
    LDX.W #$C000
    STX.W $4302
    LDA.B #$7F
    STA.W $4304
    LDX.W #$2000
    STX.W $4305
    LDA.B #$01
    STA.W $420B
    PHB
    REP #$20
    LDX.W #$F300
    LDY.W #$0160
    LDA.W #$009F
    MVN $7F,$09
    SEP #$20
    PLB
    RTL


transferMagicSprite:
    PHP
    REP #$20
    LDA.W playerEquippedMagic
    SEC
    SBC.W #$0011
    CMP.W #$0008
    BCS CODE_02A4EC
    PHA
    ASL A
    CLC
    ADC.B $01,S
    PLX
    TAX
    SEP #$20
    LDY.W #$2600
    STY.W $2116
    LDA.B #$01
    STA.W $4300
    LDA.B #$18
    STA.W $4301
    LDY.W magicSpritePointer,X
    STY.W $4302
    LDA.W UNREACH_01FB8A,X
    STA.W $4304
    LDY.W #$0800
    STY.W $4305
    LDA.B #$01
    STA.W $420B
    REP #$20
    PHB
    LDA.W UNREACH_01FBA0,X
    TAX
    LDY.W #$0160
    LDA.W #$001F
    MVN $7F,$0F
    PLB

CODE_02A4EC:
    PLP
    RTL


enterPlayerNameMenu:
    PHP
    PHX
    PHY
    SEP #$20
    STZ.W playerSelectHorizontalPosition
    STZ.W playerSelectVerticalPosition
    LDX.W #$03C6
    LDY.W #$1B92

CODE_02A4FF:
    LDA.W $0000,Y
    BEQ playerSelectMainLoop
    INY
    BRA CODE_02A4FF


playerSelectMainLoop:
    BRK #$07

CODE_02A509:
    PHX
    PHY
    LDY.W #$C45D
    JSL.L printOsdStringFromBank2
    LDY.W #$C485
    JSL.L printOsdStringFromBank2
    PLY
    PLX
    LDA.B #$2B
    STA.L $7F7000,X
    STA.L $7F6FC0,X

waitForButtonRelease:
    JSR.W vblankAndReadButtonsPressedUpper
    CMP.B #$00
    BNE waitForButtonRelease

CODE_02A52C:
    JSR.W vblankAndReadButtonsPressedUpper
    LSR A
    BCC CODE_02A535
    BRL rightKeyPressed


CODE_02A535:
    LSR A
    BCC CODE_02A53B
    BRL leftKeyPressed


CODE_02A53B:
    LSR A
    BCC CODE_02A541
    BRL downKeyPressed


CODE_02A541:
    LSR A
    BCC CODE_02A547
    BRL upKeyPressed


CODE_02A547:
    LSR A
    BCC CODE_02A54D
    BRL startKeyPressed


CODE_02A54D:
    LSR A
    LSR A
    BCC CODE_02A554
    BRL yKeyPressed


CODE_02A554:
    LSR A
    BCC CODE_02A55A
    BRL bKeyPressed


CODE_02A55A:
    BRA CODE_02A52C


upKeyPressed:
    LDA.W playerSelectVerticalPosition
    BEQ CODE_02A581
    DEC.W playerSelectVerticalPosition
    CMP.B #$02
    BEQ CODE_02A56C
    CMP.B #$04
    BNE CODE_02A574

CODE_02A56C:
    REP #$20
    TXA
    SEC
    SBC.W #$0040
    TAX

CODE_02A574:
    REP #$20
    TXA
    SEC
    SBC.W #$0080
    TAX
    SEP #$20
    BRL playerSelectMainLoop


CODE_02A581:
    LDA.B #$04
    STA.W playerSelectVerticalPosition
    REP #$20
    TXA
    CLC
    ADC.W #$0280
    TAX
    SEP #$20
    BRL playerSelectMainLoop


downKeyPressed:
    LDA.W playerSelectVerticalPosition
    CMP.B #$04
    BCS CODE_02A5BA
    INC.W playerSelectVerticalPosition
    CMP.B #$01
    BEQ CODE_02A5A5
    CMP.B #$03
    BNE CODE_02A5AD

CODE_02A5A5:
    REP #$20
    TXA
    CLC
    ADC.W #$0040
    TAX

CODE_02A5AD:
    REP #$20
    TXA
    CLC
    ADC.W #$0080
    TAX
    SEP #$20
    BRL playerSelectMainLoop


CODE_02A5BA:
    STZ.W playerSelectVerticalPosition
    REP #$20
    TXA
    SEC
    SBC.W #$0280
    TAX
    SEP #$20
    BRL playerSelectMainLoop


leftKeyPressed:
    LDA.W playerSelectHorizontalPosition
    BEQ CODE_02A5D9
    DEC.W playerSelectHorizontalPosition
    DEX
    DEX
    DEX
    DEX
    BRL playerSelectMainLoop


CODE_02A5D9:
    LDA.B #$0C
    STA.W playerSelectHorizontalPosition
    REP #$20
    TXA
    CLC
    ADC.W #$0030
    TAX
    SEP #$20
    BRL playerSelectMainLoop


rightKeyPressed:
    LDA.W playerSelectHorizontalPosition
    CMP.B #$0C
    BCS CODE_02A5FC
    INC.W playerSelectHorizontalPosition
    INX
    INX
    INX
    INX
    BRL playerSelectMainLoop


CODE_02A5FC:
    STZ.W playerSelectHorizontalPosition
    REP #$20
    TXA
    SEC
    SBC.W #$0030
    TAX
    SEP #$20
    BRL playerSelectMainLoop


yKeyPressed:
    CPY.W #$1B92
    BNE CODE_02A614
    db $82,$18,$FF

CODE_02A614:
    DEY
    LDA.B #$00
    STA.W $0000,Y
    BRL playerSelectMainLoop


bKeyPressed:
    LDA.L $7F7002,X
    CMP.B #$23
    BEQ startKeyPressed
    CMP.B #$24
    BEQ yKeyPressed
    CPY.W #$1B9A
    BCC insertCharToName
    BRL CODE_02A52C


insertCharToName:
    LDA.L $7F7002,X
    STA.W $0000,Y
    INY
    BRK #$18
    BRL CODE_02A509


startKeyPressed:
    CPY.W #$1B92
    BNE CODE_02A646
    db $82,$E6,$FE

CODE_02A646:
    LDA.B #$00
    STA.W $0000,Y
    LDY.W #$C512
    JSL.L printOsdStringFromBank2
    JSR.W vblankAndReadButtonsPressedUpper
    PLY
    PLX
    PLP
    RTL


UpdateHud:
    LDA.W currentMapNumber
    SEC
    SBC.B #$0F
    CMP.B #$04
    BCS CODE_02A666
    BRL CODE_02A6CB


CODE_02A666:
    LDA.W $0330
    BEQ CODE_02A675
    BPL CODE_02A67C
    DEC A
    BMI CODE_02A682
    LDY.W #$C76F
    BRA CODE_02A678


CODE_02A675:
    LDY.W #$C766

CODE_02A678:
    JSL.L printOsdStringFromBank2

CODE_02A67C:
    DEC.W $0330
    DEC.W $0330

CODE_02A682:
    JSL.L healPlayerContinously
    JSL.L CODE_04F614
    LDA.W updateHudBitfield
    BEQ CODE_02A6CB
    LSR.W updateHudBitfield
    BCC updateExp
    LDY.W #$C70E
    JSL.L printOsdStringFromBank2

updateExp:
    LSR.W updateHudBitfield
    BCC updateHealth
    LDY.W #$C739
    JSL.L printOsdStringFromBank2

updateHealth:
    LSR.W updateHudBitfield
    BCC updateLevel
    LDY.W #$C744
    JSL.L printOsdStringFromBank2

updateLevel:
    LSR.W updateHudBitfield
    BCC updateGold
    LDY.W #$C750
    JSL.L printOsdStringFromBank2

updateGold:
    LSR.W updateHudBitfield
    BCC CODE_02A6CB
    LDY.W #$C75B
    JSL.L printOsdStringFromBank2

CODE_02A6CB:
    STZ.W updateHudBitfield
    RTL


CODE_02A6CF:
    PHP
    PHB
    SEP #$20
    LDA.B #$02
    PHA
    PLB
    LDX.W #$0702
    PHX

CODE_02A6DB:
    LDA.W $0000,Y
    BNE CODE_02A6E3
    BRL CODE_02A765

CODE_02A6E3:
    INY
    CMP.B #$0D
    BEQ CODE_02A715
    CMP.B #$14
    BEQ CODE_02A74F
    PHX
    PHA
    STA.L $7F7000,X
    LDA.B #$21
    STA.L $7F7001,X
    REP #$20
    TXA
    CLC
    ADC.W #$0040
    AND.W #$07FF
    TAX
    SEP #$20
    PLA
    STA.L $7F7000,X
    LDA.B #$20
    STA.L $7F7001,X
    PLX
    INX
    INX
    BRA CODE_02A6DB

CODE_02A715:
    LDA.B #$01
    TSB.W $03B8
    LDA.B #$20

CODE_02A71C:
    INC.W $0388
    JSL.L zAdvanceFrameDoThings
    DEC A
    BNE CODE_02A71C
    REP #$20
    PLA
    CLC
    ADC.W #$0100
    AND.W #$07FF
    TAX
    PHA
    SEP #$20
    PHX
    LDA.B #$80
    STA.B $0C

CODE_02A739:
    LDA.B #$00
    STA.L $7F7000,X
    LDA.B #$20
    STA.L $7F7001,X
    INX
    INX
    DEC.B $0C
    BNE CODE_02A739
    PLX
    BRL CODE_02A6DB

CODE_02A74F:
    LDA.W $0000,Y
    INY
    REP #$20
    AND.W #$00FF
    ASL A
    PHX
    CLC
    ADC.B $01,S
    STA.B $01,S
    PLX
    SEP #$20
    BRL CODE_02A6DB

CODE_02A765:
    PLX
    PLB
    PLP
    RTL

printOsdStringFromBank2:
    PHP
    PHB
    SEP #$20
    LDA.B #$02
    PHA
    PLB
    LDA.W $03F9
    PHA
    LDA.W $03E9
    PHA
    LDA.B #$20
    STA.W $03E9
    STZ.W $03F9
    PHX

printOsdMainLoop:
    JSR.W loadNextCharacterOrWord
    CMP.B #$14
    BNE CODE_02A78C
    BRL handle14


CODE_02A78C:
    CMP.B #$13
    BEQ handle13
    CMP.B #$0D
    BNE CODE_02A797
    BRL handleD


CODE_02A797:
    BCS CODE_02A7E4
    CMP.B #$00
    BNE CODE_02A7A0
    BRL handle0


CODE_02A7A0:
    DEC A
    BNE CODE_02A7A6
    BRL handle1


CODE_02A7A6:
    DEC A
    BNE CODE_02A7AC
    BRL handle2


CODE_02A7AC:
    DEC A
    BNE CODE_02A7B2
    BRL handle3


CODE_02A7B2:
    DEC A
    BNE CODE_02A7B8
    BRL handle4


CODE_02A7B8:
    DEC A
    BNE CODE_02A7BE
    BRL handle5


CODE_02A7BE:
    DEC A
    BNE CODE_02A7C4
    BRL handle6


CODE_02A7C4:
    DEC A
    BNE CODE_02A7CA
    BRL handle7


CODE_02A7CA:
    DEC A
    BNE CODE_02A7D0
    BRL handle8


CODE_02A7D0:
    DEC A
    BNE CODE_02A7D6
    BRL handle9


CODE_02A7D6:
    DEC A
    BNE CODE_02A7DC
    BRL handleA


CODE_02A7DC:
    DEC A
    BNE CODE_02A7E2
    BRL handleB


CODE_02A7E2:
    BRA printOsdMainLoop


CODE_02A7E4:
    ORA.W $03F9
    STA.L $7F7000,X
    XBA
    LDA.W $03E9
    STA.L $7F7001,X
    INX
    INX
    BIT.B #$02
    BEQ CODE_02A7FC
    BRL printOsdMainLoop


CODE_02A7FC:
    INC A
    STA.L $7F6FBF,X
    XBA
    STA.L $7F6FBE,X
    BRL printOsdMainLoop


handle13:
    LDA.W $0001,Y
    XBA
    LDA.W $0000,Y
    TAY
    BRL printOsdMainLoop

handle14:
    LDA.B #$20
    XBA
    LDA.W $0000,Y
    INY

CODE_02A81B:
    XBA
    STA.L $7F7000,X
    INX
    INX
    XBA
    DEC A
    BNE CODE_02A81B
    BRL printOsdMainLoop


handleB:
    LDA.W $0000,Y
    INY
    STA.B $00
    REP #$20
    LDA.W $0000,Y
    INY
    INY
    PHY
    TAY
    LDA.W $0000,Y
    AND.W #$00FF
    SEP #$20
    TAY
    BEQ CODE_02A856
    LDA.W $03E9
    XBA
    LDA.B $00
    REP #$20

CODE_02A84B:
    STA.L $7F7000,X
    INX
    INX
    DEY
    BNE CODE_02A84B
    SEP #$20

CODE_02A856:
    PLY
    BRL printOsdMainLoop


handleA:
    LDA.W $03F9
    EOR.B #$80
    STA.W $03F9
    BRL printOsdMainLoop


handle9:
    LDA.W $03E9
    EOR.B #$02
    STA.W $03E9
    BRL printOsdMainLoop


handle8:
    PHX
    REP #$20
    LDX.W $0000,Y
    INY
    INY
    SEP #$20
    JSL.L clearTextbox
    PLX
    BRL printOsdMainLoop


handle7:
    LDA.W $0000,Y
    INY
    STA.B $00
    LDA.W $0000,Y
    INY
    STA.B $02
    STX.W $03F7
    JSR.W drawBorder
    REP #$20
    PLA
    CLC
    ADC.W #$0082
    TAX
    PHX
    SEP #$20
    BRL printOsdMainLoop


handle6:
    LDA.W $0000,Y
    INY
    STA.B $00
    STA.B $02
    REP #$20
    DEC A
    AND.W #$00FF
    ASL A
    PHX
    CLC
    ADC.B $01,S
    STA.B $01,S
    TAX
    LDA.W $0000,Y
    INY
    INY
    PHY
    TAY
    SEP #$20
    LDA.W $03E9
    XBA

CODE_02A8C5:
    LDA.W $0000,Y
    AND.B #$0F
    ORA.B #$30
    REP #$20
    STA.L $7F7000,X
    DEX
    DEX
    SEP #$20
    DEC.B $00
    BEQ CODE_02A8F4
    LDA.W $0000,Y
    INY
    AND.B #$F0
    LSR A
    LSR A
    LSR A
    LSR A
    ORA.B #$30
    REP #$20
    STA.L $7F7000,X
    DEX
    DEX
    SEP #$20
    DEC.B $00
    BNE CODE_02A8C5

CODE_02A8F4:
    INX
    INX
    DEC.B $02
    BEQ CODE_02A90A
    LDA.L $7F7000,X
    CMP.B #$30
    BNE CODE_02A90A
    LDA.B #$20
    STA.L $7F7000,X
    BRA CODE_02A8F4


CODE_02A90A:
    XBA
    BIT.B #$02
    BNE CODE_02A92A
    XBA
    INC.B $02

CODE_02A912:
    LDA.L $7F7000,X
    REP #$20
    ORA.W #$0100
    STA.L $7F6FC0,X
    AND.W #$FEFF
    SEP #$20
    INX
    INX
    DEC.B $02
    BNE CODE_02A912

CODE_02A92A:
    PLY
    PLX
    INX
    INX
    BRL printOsdMainLoop


handle5:
    REP #$20
    LDA.W $0000,Y
    INY
    INY
    STA.B $00
    LDA.W $0000,Y
    INY
    INY
    PHY
    TAY
    LDA.W $0000,Y
    ASL A
    CLC
    ADC.B $00
    TAY
    LDA.W $0000,Y
    TAY
    SEP #$20
    LDA.W $03E9
    XBA
    JSR.W printStringWithSomeWeirdStuff
    PLY
    BRL printOsdMainLoop


handle4:
    REP #$20
    PHY
    LDA.W $0000,Y
    TAY
    LDA.W $0000,Y
    STA.B $00
    PLY
    PHY
    LDA.W $0002,Y
    TAY
    LDA.W $0000,Y
    STA.B $02
    SEP #$20
    JSR.W CODE_02AABF
    PLY
    INY
    INY
    INY
    INY
    BRL printOsdMainLoop


handle3:
    LDA.W $03E9
    AND.B #$E3
    ORA.W $0000,Y
    INY
    STA.W $03E9
    BRL printOsdMainLoop


handle2:
    LDA.W $0000,Y
    INY
    PHY
    REP #$20
    AND.W #$00FF
    ASL A
    TAY
    LDA.W osd2LUT,Y
    TAY
    SEP #$20
    LDA.W $03E9
    XBA
    JSR.W quickPrintString
    PLY
    BRL printOsdMainLoop


handle1:
    LDA.W $0001,Y
    STA.B $02,S
    XBA
    LDA.W $0000,Y
    STA.B $01,S
    INY
    INY
    TAX
    BRL printOsdMainLoop


handleD:
    REP #$20
    PLA
    CLC
    ADC.W #$0040
    TAX
    PHA
    SEP #$20
    BRL printOsdMainLoop


handle0:
    PLX
    PLA
    STA.W $03E9
    PLA
    STA.W $03F9
    LDA.B #$01
    TSB.W $03B8
    PLB
    PLP
    RTL


loadNextCharacterOrWord:
    LDA.W $0000,Y
    BMI loadWordFromLut
    INY
    RTS


loadWordFromLut:
    INY
    PHB
    PHY
    REP #$20
    AND.W #$007F
    PHA
    ASL A
    CLC
    ADC.B $01,S
    ASL A
    ASL A
    TAY
    PLA
    SEP #$20
    LDA.B #$10
    PHA
    PLB
    LDA.B #$0C
    STA.B $0C
    LDA.W $03E9
    XBA

CODE_02AA00:
    LDA.W WordsLUT,Y
    BEQ zero_byte
    INY
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02AA20
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02AA20:
    SEP #$20
    DEC.B $0C
    BNE CODE_02AA00

zero_byte:
    LDA.B #$20
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02AA42
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02AA42:
    SEP #$20
    PLY
    PLB
    BRA loadNextCharacterOrWord


printStringWithSomeWeirdStuff:
    LDA.W $0000,Y
    BMI CODE_02AA73
    BNE CODE_02AA50
    RTS


CODE_02AA50:
    CMP.B #$14
    BEQ CODE_02AA79
    INY
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02AA6F
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02AA6F:
    SEP #$20
    BRA printStringWithSomeWeirdStuff


CODE_02AA73:
    JSR.W loadNextCharacterOrWord
    DEY
    BRA printStringWithSomeWeirdStuff


CODE_02AA79:
    LDA.B #$20
    ORA.W $03F9
    XBA
    INY
    LDA.W $0000,Y
    INY

CODE_02AA84:
    XBA
    STA.L $7F7000,X
    INX
    INX
    XBA
    DEC A
    BNE CODE_02AA84
    BRL printStringWithSomeWeirdStuff


quickPrintString:
    LDA.W $0000,Y
    BMI CODE_02AAB9
    BNE CODE_02AA9A
    RTS


CODE_02AA9A:
    INY
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02AAB5
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02AAB5:
    SEP #$20
    BRA quickPrintString


CODE_02AAB9:
    JSR.W loadNextCharacterOrWord
    DEY
    BRA quickPrintString


CODE_02AABF:
    PHX
    LDX.W #$0000
    LDA.B $00

CODE_02AAC5:
    SEC
    SBC.B #$0A
    BMI CODE_02AACE
    INX
    INX
    BRA CODE_02AAC5


CODE_02AACE:
    LDA.B $01,S
    CMP.B #$CC
    BNE CODE_02AAE6
    LDA.L UNREACH_01FB2F,X
    STA.L $7F0014
    LDA.L UNREACH_01FB30,X
    STA.L $7F0015
    BRA CODE_02AAF6


CODE_02AAE6:
    LDA.L UNREACH_01FB2F,X
    STA.L $7F001C
    LDA.L UNREACH_01FB30,X
    STA.L $7F001D

CODE_02AAF6:
    LDA.B $00
    CMP.B #$33
    BCC CODE_02AAFE
    LDA.B #$32

CODE_02AAFE:
    STA.B $00
    LDA.B $02
    CMP.B #$33
    BCC CODE_02AB08
    LDA.B #$32

CODE_02AB08:
    STA.B $02
    PLX
    LDA.B $00
    LSR A
    BEQ CODE_02AB1F
    PHP

CODE_02AB11:
    XBA
    LDA.B #$1B
    STA.L $7F7000,X
    INX
    INX
    XBA
    DEC A
    BNE CODE_02AB11
    PLP

CODE_02AB1F:
    BCS CODE_02AB28
    LDA.B $02
    SEC
    SBC.B $00
    BRA CODE_02AB42


CODE_02AB28:
    LDA.B #$1C
    STA.L $7F7000,X
    LDA.B $02
    SEC
    SBC.B $00
    BEQ CODE_02AB5C
    XBA
    LDA.B #$1D
    STA.L $7F7000,X
    XBA
    INX
    INX
    DEC A
    BEQ CODE_02AB5C

CODE_02AB42:
    LSR A
    BEQ CODE_02AB54
    PHP

CODE_02AB46:
    XBA
    LDA.B #$1E
    STA.L $7F7000,X
    INX
    INX
    XBA
    DEC A
    BNE CODE_02AB46
    PLP

CODE_02AB54:
    BCC CODE_02AB5C
    LDA.B #$1F
    STA.L $7F7000,X

CODE_02AB5C:
    RTS


drawBorder:
    PHX
    LDA.B #$01
    STA.L $7F7000,X
    LDA.B $00
    STA.B $0C
    LDA.B #$03

top_border_loop:
    STA.L $7F7002,X
    INX
    INX
    DEC.B $0C
    BNE top_border_loop
    LDA.B #$02
    STA.L $7F7002,X
    REP #$20
    PLA
    CLC
    ADC.W #$0040
    TAX
    SEP #$20
    LDA.B $02
    STA.B $0C

row_loop:
    PHX
    LDA.B #$07
    STA.L $7F7000,X
    LDA.B $00
    STA.B $0E
    STZ.B $0F
    LDA.W $03E9
    XBA
    LDA.B #$20
    REP #$20

mid_loop:
    STA.L $7F7002,X
    INX
    INX
    DEC.B $0E
    BNE mid_loop
    SEP #$20
    LDA.B #$08
    STA.L $7F7002,X
    REP #$20
    PLA
    CLC
    ADC.W #$0040
    TAX
    SEP #$20
    DEC.B $0C
    BNE row_loop
    LDA.B #$05
    STA.L $7F7000,X
    LDA.B $00
    STA.B $0C
    LDA.B #$04

bottom_border_loop:
    STA.L $7F7002,X
    INX
    INX
    DEC.B $0C
    BNE bottom_border_loop
    LDA.B #$06
    STA.L $7F7002,X
    RTS


clearTextbox:
    PHY
    LDA.L $7F7000,X
    CMP.B #$01
    BNE CODE_02AC25
    STZ.B $00
    STZ.B $01
    PHX

searchForUpperRightCorner:
    LDA.L $7F7000,X
    CMP.B #$02
    BEQ CODE_02ABF6
    INX
    INX
    INC.B $00
    BRA searchForUpperRightCorner


CODE_02ABF6:
    PLX

CODE_02ABF7:
    REP #$20
    LDA.B $00
    STA.B $0C
    PHX
    LDA.W #$2000

CODE_02AC01:
    STA.L $7F7000,X
    INX
    INX
    DEC.B $0C
    BNE CODE_02AC01
    LDA.L $7F7000,X
    TAY
    LDA.W #$2000
    STA.L $7F7000,X
    PLX
    TXA
    CLC
    ADC.W #$0040
    TAX
    SEP #$20
    TYA
    CMP.B #$06
    BNE CODE_02ABF7

CODE_02AC25:
    PLY
    RTL


printOsdStringFromBankX:
    PHP
    PHB
    SEP #$20
    LDA.B $01,S
    CMP.B #$01
    BNE CODE_02AC35
    LDA.B #$02
    PHA
    PLB

CODE_02AC35:
    LDA.B #$20
    STA.W $03E9
    LDA.B #$01
    STA.W $03F5
    STZ.W $03F9
    LDA.W $0000,Y
    CMP.B #$01
    BEQ handle_first_01
    CMP.B #$10
    BEQ handle_first_10
    LDX.W $03F3
    PHX
    LDA.W $1B84
    BEQ CODE_02AC59
    BRL handle_0D


CODE_02AC59:
    BRL handle_10


handle_first_10:
    INY
    LDX.W #$0408
    PHX
    LDA.B #$16
    STA.B $00
    LDA.B #$09
    STA.B $02
    BRL draw_border


handle_first_01:
    PHX

next_loop:
    JSR.W loadNextCharAndPrintIntermediateWords
    CMP.B #$0D
    BNE CODE_02AC77
    BRL handle_0D


CODE_02AC77:
    CMP.B #$14
    BNE CODE_02AC7E
    BRL handle_14


CODE_02AC7E:
    BCS handle_ascii_digit
    CMP.B #$00
    BNE CODE_02AC87
    BRL handle_00


CODE_02AC87:
    DEC A
    BNE CODE_02AC8D
    BRL handle_01


CODE_02AC8D:
    DEC A
    BNE CODE_02AC93
    BRL handle_02


CODE_02AC93:
    DEC A
    BNE CODE_02AC99
    BRL handle_03


CODE_02AC99:
    DEC A
    BNE CODE_02AC9F
    BRL handle_04


CODE_02AC9F:
    DEC A
    BNE CODE_02ACA5
    BRL handle_05


CODE_02ACA5:
    DEC A
    BNE CODE_02ACAB
    BRL handle_06


CODE_02ACAB:
    DEC A
    BNE CODE_02ACB1
    BRL handle_07


CODE_02ACB1:
    DEC A
    BNE CODE_02ACB7
    BRL handle_08


CODE_02ACB7:
    DEC A
    BNE CODE_02ACBD
    BRL handle_09


CODE_02ACBD:
    DEC A
    BNE CODE_02ACC3
    BRL handle_0A

CODE_02ACC3:
    DEC A
    BNE CODE_02ACC9
    BRL handle_0B


CODE_02ACC9:
    DEC A
    BNE CODE_02ACCF
    BRL handle_0C


CODE_02ACCF:
    DEC A
    DEC A
    BNE CODE_02ACD6
    BRL handle_0E


CODE_02ACD6:
    DEC A
    BNE CODE_02ACDC
    BRL handle_0F


CODE_02ACDC:
    DEC A
    BNE CODE_02ACE2
    BRL handle_10

CODE_02ACE2:
    DEC A
    BNE CODE_02ACE8
    BRL handle_11


CODE_02ACE8:
    DEC A
    BNE CODE_02ACEE
    BRL handle_12


CODE_02ACEE:
    DEC A
    BNE CODE_02ACF4
    BRL handle_13


CODE_02ACF4:
    BRL next_loop


handle_ascii_digit:
    ORA.W $03F9
    STA.L $7F7000,X
    XBA
    LDA.W $03E9
    STA.L $7F7001,X
    INX
    INX
    BIT.B #$02
    BNE CODE_02AD18
    INC A
    STA.L $7F6FBF,X
    XBA
    STA.L $7F6FBE,X
    BRA CODE_02AD42


CODE_02AD18:
    LDA.L $7F6FBE,X
    CMP.B #$FE
    BCC CODE_02AD26
    LDA.B #$20
    STA.L $7F6FBE,X

CODE_02AD26:
    XBA
    CMP.B #$F4
    BCS CODE_02AD33
    CMP.B #$CC
    BCC CODE_02AD42
    LDA.B #$FE
    BRA CODE_02AD35


CODE_02AD33:
    LDA.B #$FF

CODE_02AD35:
    STA.L $7F6FBE,X
    XBA
    LDA.W $03E9
    STA.L $7F6FBF,X
    XBA

CODE_02AD42:
    JSR.W printStringWithDelay
    BRL next_loop


handle_13:
    LDA.W $0001,Y
    XBA
    LDA.W $0000,Y
    TAY
    BRL next_loop


handle_14:
    LDA.B #$20
    XBA
    LDA.W $0000,Y
    INY

CODE_02AD5A:
    XBA
    STA.L $7F7000,X
    INX
    INX
    XBA
    DEC A
    BNE CODE_02AD5A
    BRL next_loop


handle_12:
    JSR.W textboxWaitAnyKeyAtEnd
    BRL next_loop


handle_10:
    PLX
    JSR.W calculateHeightAndWidthOfTextbox
    JSR.W CODE_02B00F
    REP #$20
    LDA.W $03EB
    CLC
    ADC.W #$0040
    TAX
    PHX
    SEP #$20
    BRL next_loop


handle_0F:
    LDA.W $03F5
    EOR.B #$01
    STA.W $03F5
    BRL next_loop


handle_0E:
    LDA.W $1B84
    BEQ CODE_02AD9C
    LDA.W $0000,Y
    JSL.L CODE_02B140

CODE_02AD9C:
    INY
    BRL next_loop


handle_0B:
    INY
    INY
    INY
    BRL next_loop


handle_0A:
    LDA.W $03F9
    EOR.B #$80
    STA.W $03F9
    BRL next_loop

handle_09:
    LDA.W $03E9
    EOR.B #$02
    STA.W $03E9
    BRL next_loop


handle_08:
    PHX
    REP #$20
    LDX.W $0000,Y
    INY
    INY
    SEP #$20
    JSL.L clearTextbox
    PLX
    BRL next_loop


handle_07:
    LDA.W $0000,Y
    INY
    STA.B $00
    LDA.W $0000,Y
    INY
    STA.B $02

draw_border:
    JSR.W drawBorder
    REP #$20
    PLA
    CLC
    ADC.W #$0082
    TAX
    PHX
    SEP #$20
    BRL next_loop


handle_06:
    LDA.W $0000,Y
    INY
    STA.B $00
    STA.B $02
    REP #$20
    DEC A
    AND.W #$00FF
    ASL A
    PHX
    CLC
    ADC.B $01,S
    STA.B $01,S
    TAX
    LDA.W $0000,Y
    INY
    INY
    PHY
    TAY
    SEP #$20
    LDA.W $03E9
    XBA

CODE_02AE0E:
    LDA.W $0000,Y
    AND.B #$0F
    ORA.B #$30
    REP #$20
    STA.L $7F7000,X
    DEX
    DEX
    SEP #$20
    DEC.B $00
    BEQ CODE_02AE3D
    LDA.W $0000,Y
    INY
    AND.B #$F0
    LSR A
    LSR A
    LSR A
    LSR A
    ORA.B #$30
    REP #$20
    STA.L $7F7000,X
    DEX
    DEX
    SEP #$20
    DEC.B $00
    BNE CODE_02AE0E

CODE_02AE3D:
    INX
    INX
    DEC.B $02
    BEQ CODE_02AE53
    LDA.L $7F7000,X
    CMP.B #$30
    BNE CODE_02AE53
    LDA.B #$20
    STA.L $7F7000,X
    BRA CODE_02AE3D


CODE_02AE53:
    XBA
    BIT.B #$02
    BNE CODE_02AE73
    XBA
    INC.B $02

CODE_02AE5B:
    LDA.L $7F7000,X
    REP #$20
    ORA.W #$0100
    STA.L $7F6FC0,X
    AND.W #$FEFF
    SEP #$20
    INX
    INX
    DEC.B $02
    BNE CODE_02AE5B

CODE_02AE73:
    PLY
    PLX
    INX
    INX
    BRL next_loop


handle_05:
    REP #$20
    LDA.W $0000,Y
    INY
    INY
    STA.B $00
    LDA.W $0000,Y
    INY
    INY
    PHY
    TAY
    LDA.W $0000,Y
    ASL A
    CLC
    ADC.B $00
    TAY
    SEP #$20
    PHB
    LDA.B #$02
    PHA
    PLB
    REP #$20
    LDA.W $0000,Y
    TAY
    SEP #$20
    LDA.W $03E9
    XBA
    JSR.W print_simple_string
    PLB
    PLY
    BRL next_loop


handle_04:
    REP #$20
    PHY
    LDA.W $0000,Y
    TAY
    LDA.W $0000,Y
    STA.B $00
    PLY
    PHY
    LDA.W $0002,Y
    TAY
    LDA.W $0000,Y
    STA.B $02
    SEP #$20
    JSR.W CODE_02AABF
    db $7A,$C8,$C8,$C8,$C8,$82,$9C,$FD

handle_03:
    LDA.W $03E9
    AND.B #$E3
    ORA.W $0000,Y
    INY
    STA.W $03E9
    BRL next_loop


handle_02:
    LDA.W $0000,Y
    INY
    PHY
    REP #$20
    AND.W #$00FF
    ASL A
    TAY
    SEP #$20
    PHB
    LDA.B #$02
    PHA
    PLB
    REP #$20
    LDA.W osd2LUT,Y
    TAY
    SEP #$20
    LDA.W $03E9
    XBA
    JSR.W print_simple_string
    PLB
    PLY
    BRL next_loop


handle_01:
    LDA.W $0001,Y
    STA.B $02,S
    XBA
    LDA.W $0000,Y
    STA.B $01,S
    INY
    INY
    TAX
    BRL next_loop


handle_11:
    PLX

CODE_02AF19:
    PHX
    JSR.W calculateHeightAndWidthOfTextbox
    REP #$20
    LDA.W $03ED
    DEC A
    AND.W #$FFFE
    CLC
    ADC.B $01,S
    CLC
    ADC.W #$0040
    TAX
    SEP #$20
    JSR.W messageDialogWaitForKey
    LDA.W $1B84
    BNE handle_0D
    BRL handle_10


handle_0D:
    PLX
    LDA.L $7F7080,X
    CMP.B #$04
    BNE CODE_02AF51
    LDA.W $1B84
    BEQ CODE_02AF19
    JSR.W calculateHeightAndWidthOfTextbox
    JSR.W shiftTextOneLineUp
    BRA CODE_02AF5B


CODE_02AF51:
    REP #$20
    TXA
    CLC
    ADC.W #$0080
    TAX
    SEP #$20

CODE_02AF5B:
    PHX
    BRL next_loop


handle_00:
    JSR.W textboxWaitAnyKeyAtEnd

handle_0C:
    PLX
    STX.W $03F3
    LDA.B #$01
    TSB.W $03B8
    PLB
    PLP
    RTL


loadNextCharAndPrintIntermediateWords:
    LDA.W $0000,Y
    BMI CODE_02AF75
    INY
    RTS


CODE_02AF75:
    INY
    PHB
    PHY
    REP #$20
    AND.W #$007F
    PHA
    ASL A
    CLC
    ADC.B $01,S
    ASL A
    ASL A
    TAY
    PLA
    SEP #$20
    LDA.B #$10
    PHA
    PLB
    LDA.B #$0C
    STA.B $14
    LDA.W $03E9
    XBA

CODE_02AF94:
    LDA.W WordsLUT,Y
    BEQ CODE_02AFBD
    INY
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02AFB4
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02AFB4:
    SEP #$20
    JSR.W printStringWithDelay
    DEC.B $14
    BNE CODE_02AF94

CODE_02AFBD:
    LDA.B #$20
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02AFD9
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02AFD9:
    SEP #$20
    PLY
    PLB
    BRA loadNextCharAndPrintIntermediateWords


print_simple_string:
    LDA.W $0000,Y
    BMI CODE_02B009
    BNE CODE_02AFE7
    RTS


CODE_02AFE7:
    INY
    ORA.W $03F9
    REP #$20
    STA.L $7F7000,X
    INX
    INX
    BIT.W #$0200
    BNE CODE_02B002
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

CODE_02B002:
    SEP #$20
    JSR.W printStringWithDelay
    BRA print_simple_string


CODE_02B009:
    JSR.W loadNextCharAndPrintIntermediateWords
    DEY
    BRA print_simple_string


CODE_02B00F:
    REP #$20
    LDX.W $03EB
    LDA.W $03EF
    STA.B $0E

CODE_02B019:
    LDA.W $03ED
    STA.B $0C
    PHX
    LDA.W #$2020

CODE_02B022:
    STA.L $7F7000,X
    INX
    INX
    DEC.B $0C
    BNE CODE_02B022
    PLX
    TXA
    CLC
    ADC.W #$0040
    TAX
    DEC.B $0E
    BNE CODE_02B019
    SEP #$20
    RTS


messageDialogWaitForKey:
    LDA.B #$3D

waitForKeyRelease:
    STA.L $7F7000,X
    LDA.B #$01
    STA.W $03B8
    JSR.W zSomethingSomethingAdvanceFrameAndReadButtonsPressedUpper
    BIT.B #$C0
    BEQ CODE_02B069
    LDA.W $0312
    AND.B #$10
    BNE messageDialogWaitForKey
    LDA.B #$20
    BRA waitForKeyRelease


CODE_02B057:
    LDA.B #$3D

waitForKeyPressed:
    STA.L $7F7000,X
    LDA.B #$01
    STA.W $03B8
    JSR.W zSomethingSomethingAdvanceFrameAndReadButtonsPressedUpper
    BIT.B #$C0
    BNE CODE_02B074

CODE_02B069:
    LDA.W $0312
    AND.B #$10
    BNE CODE_02B057
    LDA.B #$20
    BRA waitForKeyPressed


CODE_02B074:
    LDA.B #$20
    STA.L $7F7000,X
    LDA.B #$01
    STA.W $03B8
    RTS


shiftTextOneLineUp:
    REP #$20
    PHX
    LDX.W $03EB
    LDA.W $03EF
    SEC
    SBC.W #$0003
    BEQ CODE_02B0B0
    STA.B $0E

CODE_02B091:
    LDA.W $03ED
    STA.B $0C
    PHX

CODE_02B097:
    LDA.L $7F7080,X
    STA.L $7F7000,X
    INX
    INX
    DEC.B $0C
    BNE CODE_02B097
    PLX
    TXA
    CLC
    ADC.W #$0040
    TAX
    DEC.B $0E
    BNE CODE_02B091

CODE_02B0B0:
    LDA.W $03ED
    STA.B $0C
    LDA.W #$2020

CODE_02B0B8:
    STA.L $7F7000,X
    STA.L $7F7040,X
    INX
    INX
    DEC.B $0C
    BNE CODE_02B0B8
    PLX
    SEP #$20
    RTS


calculateHeightAndWidthOfTextbox:
    PHX
    PHY

searchForLeftBorder:
    LDA.L $7F6FFE,X
    CMP.B #$07
    BEQ searchForTopBorder
    DEX
    DEX
    BRA searchForLeftBorder


searchForTopBorder:
    LDA.L $7F6FC0,X
    CMP.B #$03
    BEQ CODE_02B0EC
    REP #$20
    TXA
    SEC
    SBC.W #$0040
    TAX
    SEP #$20
    BRA searchForTopBorder


CODE_02B0EC:
    STX.W $03EB
    STZ.B $00

searchForRightBorder:
    LDA.L $7F7000,X
    CMP.B #$08
    BEQ CODE_02B0FF
    INX
    INX
    INC.B $00
    BRA searchForRightBorder


CODE_02B0FF:
    LDA.B $00
    STA.W $03ED
    STZ.B $00

searchForBottomBorder:
    LDA.L $7F7000,X
    CMP.B #$06
    BEQ CODE_02B11C
    REP #$20
    TXA
    CLC
    ADC.W #$0040
    TAX
    SEP #$20
    INC.B $00
    BRA searchForBottomBorder


CODE_02B11C:
    LDA.B $00
    STA.W $03EF
    PLY
    PLX
    RTS


printStringWithDelay:
    AND.B #$7F
    CMP.B #$20
    BNE CODE_02B12B
    RTS


CODE_02B12B:
    LDA.B #$01
    TSB.W $03B8
    LDA.W $1B84
    JSL.L CODE_02B140
    LDA.W $03F5
    BNE CODE_02B13D
    RTS


CODE_02B13D:
    BRK #$07
    RTS


CODE_02B140:
    BEQ CODE_02B149
    JSL.L zAdvanceFrameDoThings
    DEC A
    BRA CODE_02B140


CODE_02B149:
    RTL


textboxWaitAnyKeyAtEnd:
    JSR.W zSomethingSomethingAdvanceFrameAndReadButtonsPressedUpper
    BIT.B #$CF
    BNE textboxWaitAnyKeyAtEnd

CODE_02B151:
    JSR.W zSomethingSomethingAdvanceFrameAndReadButtonsPressedUpper
    BIT.B #$CF
    BEQ CODE_02B151
    LDA.B #$C0
    TRB.W $032B
    STZ.W $0323
    RTS


zSomethingSomethingAdvanceFrameAndReadButtonsPressedUpper:
    JSL.L zAdvanceFrameDoThings
    LDA.W $0323
    RTS


vblankAndReadButtonsPressedUpper:
    LDA.W $03D2
    BEQ zSomethingSomethingAdvanceFrameAndReadButtonsPressedUpper
    JSL.L wait_vblank
    LDA.W $0323
    RTS


enableNmiInterruptAndBlankScreen:
    PHP
    SEP #$20
    JSL.L wait_vblank
    LDA.B #$A1
    STA.W $4200
    LDA.B #$0F
    STA.W $2100
    INC.W $03D2
    PLP
    RTL


disableNmiInterruptAndBlankScreen:
    PHP
    SEP #$20
    JSL.L wait_vblank
    LDA.B #$01
    STA.W $4200
    LDA.B #$80
    STA.W $2100
    STZ.W $03D2
    PLP
    RTL


enable_interrupts:
    LDA.W $4210
    LDA.W #$8DA1
    BRK #$42
    INC.W $03D2
    RTL


disable_vblank_interrupt:
    LDA.B #$01
    STA.W $4200
    STZ.W $03D2
    RTL


wait_vblank:
    PHP
    SEP #$20
    PHA
    LDA.W $4210

loop:
    LDA.W $4210
    BPL loop
    LDA.W $4210
    PLA
    PLP
    RTL


wait_for_n_vblanks:
    JSL.L wait_vblank
    DEC A
    BNE wait_for_n_vblanks
    RTL


multiply:
    STA.L WRMPYA
    XBA
    STA.L WRMPYB
    NOP
    NOP
    NOP
    NOP
    LDA.L RDMPYH
    XBA
    LDA.L RDMPYL
    RTL


divide:
    STY.W $4204
    STA.W $4206
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    LDA.W $4216
    XBA
    LDA.W $4214
    RTL

    db $08,$E2,$20,$EB,$A9,$00,$EB,$C9,$80,$90,$03,$EB,$3A,$EB,$28,$6B
    db $30,$02,$4A,$6B,$38,$6A,$6B

convert_hex_to_dec:
    STZ.W $0000,X
    STZ.W $0001,X

hundrets:
    CMP.B #$64
    BCC tens
    SEC
    SBC.B #$64
    INC.W $0001,X
    BRA hundrets

tens:
    CMP.B #$0A
    BCC ones
    SEC
    SBC.B #$0A
    INC.W $0000,X
    BRA tens


ones:
    ASL.W $0000,X
    ASL.W $0000,X
    ASL.W $0000,X
    ASL.W $0000,X
    ORA.W $0000,X
    STA.W $0000,X
    RTL

    db $DA,$5A,$08,$E2,$20,$C2,$10,$A2,$0F,$00,$A9,$00,$EB,$18,$BD,$02
    db $03,$7D,$01,$03,$9D,$01,$03,$CA,$D0,$F4,$A2,$10,$00,$FE,$01,$03
    db $D0,$03,$CA,$D0,$F8,$AD,$02,$03,$28,$7A,$FA,$6B

CODE_02B272:
    PHP
    PHB
    PHX
    PHY
    REP #$10
    SEP #$20
    LDA.B #$7E
    PHA
    PLB
    LDX.W #$0100
    STX.B $1F
    STX.B $21
    LDA.B #$20

CODE_02B287:
    STA.B ($1F)
    INC.B $1F
    BNE CODE_02B287
    LDA.B #$EF
    STA.B $1F
    LDA.B #$80
    STA.B $1E
    LDX.B $25
    LDY.B $23

CODE_02B299:
    LDA.B [$29]
    AND.B $1E
    PHA
    LSR.B $1E
    BCC CODE_02B2AA
    ROR.B $1E
    INC.B $29
    BNE CODE_02B2AA
    INC.B $2A

CODE_02B2AA:
    PLA
    BEQ CODE_02B2BD
    JSR.W CODE_02B2E2
    STA.W $0000,X
    INX
    STA.B ($1F)
    INC.B $1F
    DEY
    BNE CODE_02B299
    BRA CODE_02B2DD


CODE_02B2BD:
    JSR.W CODE_02B2E2
    STA.B $21
    JSR.W CODE_02B33F
    INC A
    INC A

CODE_02B2C7:
    XBA
    LDA.B ($21)
    INC.B $21
    STA.B ($1F)
    INC.B $1F
    STA.W $0000,X
    INX
    DEY
    BEQ CODE_02B2DD
    XBA
    DEC A
    BNE CODE_02B2C7
    BRA CODE_02B299


CODE_02B2DD:
    PLY
    PLX
    PLB
    PLP
    RTL


CODE_02B2E2:
    LDA.B $1E
    BMI CODE_02B329
    ASL A
    BMI CODE_02B322
    ASL A
    BMI CODE_02B31B
    ASL A
    BMI CODE_02B314
    ASL A
    BMI CODE_02B30D
    ASL A
    BMI CODE_02B306
    ASL A
    BMI CODE_02B2FF
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B332


CODE_02B2FF:
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B333


CODE_02B306:
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B334


CODE_02B30D:
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B335


CODE_02B314:
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B336


CODE_02B31B:
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B337


CODE_02B322:
    REP #$20
    LDA.B [$29]
    XBA
    BRA CODE_02B338


CODE_02B329:
    LDA.B [$29]
    REP #$20
    INC.B $29
    SEP #$20
    RTS


CODE_02B332:
    ASL A

CODE_02B333:
    ASL A

CODE_02B334:
    ASL A

CODE_02B335:
    ASL A

CODE_02B336:
    ASL A

CODE_02B337:
    ASL A

CODE_02B338:
    ASL A
    INC.B $29
    XBA
    SEP #$20
    RTS


CODE_02B33F:
    LDA.B $1E
    CMP.B #$10
    BCC CODE_02B361
    LSR A
    LSR A
    LSR A
    LSR A
    STA.B $1E
    XBA
    LDA.B [$29]
    XBA
    REP #$20
    LSR A
    BCS CODE_02B35B
    LSR A
    BCS CODE_02B35B
    LSR A
    BCS CODE_02B35B
    LSR A

CODE_02B35B:
    SEP #$20
    XBA
    AND.B #$0F
    RTS


CODE_02B361:
    LSR A
    BCS CODE_02B392
    LSR A
    BCS CODE_02B385
    LSR A
    BCS CODE_02B379
    LDA.B #$80
    STA.B $1E
    LDA.B [$29]
    REP #$20
    INC.B $29
    SEP #$20
    AND.B #$0F
    RTS


CODE_02B379:
    LDA.B #$40
    STA.B $1E
    REP #$20
    LDA.B [$29]
    XBA
    ASL A
    BRA CODE_02B39E


CODE_02B385:
    LDA.B #$20
    STA.B $1E
    REP #$20
    LDA.B [$29]
    XBA
    ASL A
    ASL A
    BRA CODE_02B39E


CODE_02B392:
    LDA.B #$10
    STA.B $1E
    REP #$20
    LDA.B [$29]
    XBA
    ASL A
    ASL A
    ASL A

CODE_02B39E:
    INC.B $29
    SEP #$20
    XBA
    AND.B #$0F
    RTS


CODE_02B3A6:
    PHP
    SEP #$20
    REP #$10
    JSR.W CODE_02B3FF

CODE_02B3AE:
    JSR.W CODE_02B93F
    CMP.B #$00
    BEQ CODE_02B3FD
    BIT.B #$80
    BEQ CODE_02B3BE
    JSR.W CODE_02B43F
    BRA CODE_02B3AE


CODE_02B3BE:
    BIT.B #$40
    BEQ CODE_02B3C7
    JSR.W CODE_02B532
    BRA CODE_02B3AE


CODE_02B3C7:
    BIT.B #$20
    BEQ CODE_02B3D0
    JSR.W CODE_02B571
    BRA CODE_02B3AE


CODE_02B3D0:
    BIT.B #$10
    BEQ CODE_02B3D9
    JSR.W CODE_02B62B
    BRA CODE_02B3AE


CODE_02B3D9:
    BIT.B #$08
    BEQ CODE_02B3E2
    JSR.W CODE_02B759
    BRA CODE_02B3AE


CODE_02B3E2:
    BIT.B #$04
    BEQ CODE_02B3EB
    db $20,$94,$B8,$80,$C3

CODE_02B3EB:
    BIT.B #$02
    BEQ CODE_02B3F4
    JSR.W CODE_02B89E
    BRA CODE_02B3AE


CODE_02B3F4:
    BIT.B #$01
    BEQ CODE_02B3AE
    JSR.W CODE_02B8FB
    BRA CODE_02B3AE


CODE_02B3FD:
    PLP
    RTL


CODE_02B3FF:
    LDY.W #$0000

CODE_02B402:
    LDA.B [$2F],Y
    INY
    XBA
    LDA.B [$2F],Y
    INY
    CMP.W mapSubNumber
    BNE CODE_02B415
    XBA
    CMP.W mapNumber
    BNE CODE_02B415
    RTS


CODE_02B415:
    JSR.W CODE_02B93F
    CMP.B #$00
    BEQ CODE_02B402
    ASL A
    BCS CODE_02B437
    ASL A
    BCS CODE_02B437
    ASL A
    BCS CODE_02B436
    ASL A
    BCS CODE_02B439
    ASL A
    BCS CODE_02B43C
    ASL A
    BCS CODE_02B43A
    ASL A
    BCS CODE_02B438
    ASL A
    BCS CODE_02B437
    db $80,$74

CODE_02B436:
    INY

CODE_02B437:
    INY

CODE_02B438:
    INY

CODE_02B439:
    INY

CODE_02B43A:
    INY
    INY

CODE_02B43C:
    INY
    BRA CODE_02B415


CODE_02B43F:
    LDA.W $03B4
    BIT.B #$08
    BEQ CODE_02B44D
    db $C8,$C8,$C8,$C8,$C8,$C8,$60

CODE_02B44D:
    PHP
    REP #$20
    JSR.W CODE_02B93F
    XBA
    STA.B $00
    JSR.W CODE_02B93F
    XBA
    ASL A
    STA.B $02
    JSR.W CODE_02B93F
    PHA
    XBA
    CLC
    ADC.W #$0000
    STA.W $2116
    LDX.W #$0029
    JSR.W CODE_02B731
    LDA.B $01,S
    BEQ CODE_02B484
    CMP.W #$0010
    BEQ CODE_02B48E
    CMP.W #$0020
    BEQ CODE_02B498
    CMP.W #$0030
    BEQ CODE_02B4A2
    BRA CODE_02B4AD


CODE_02B484:
    LDX.W #$0407
    JSR.W CODE_02B983
    BCS CODE_02B4B9
    BRA CODE_02B4AA


CODE_02B48E:
    LDX.W #$040A
    JSR.W CODE_02B983
    BCS CODE_02B4B9
    BRA CODE_02B4AA


CODE_02B498:
    LDX.W #$040D
    JSR.W CODE_02B983
    BCS CODE_02B4B9
    BRA CODE_02B4AA


CODE_02B4A2:
    LDX.W #$0410
    JSR.W CODE_02B983
    BCS CODE_02B4B9

CODE_02B4AA:
    PLA
    PLP
    RTS


CODE_02B4AD:
    STZ.W $0407
    STZ.W $040A
    STZ.W $040D
    STZ.W $0410

CODE_02B4B9:
    ASL.B $00
    BCC CODE_02B4F0
    PLA
    CMP.W #$00FF
    BEQ CODE_02B4D4
    PHY
    LDY.B $00

CODE_02B4C6:
    LDA.B [$29],Y
    STA.W $2118
    INY
    INY
    CPY.B $02
    BNE CODE_02B4C6
    PLY
    PLP
    RTS


CODE_02B4D4:
    LDX.W #$0000
    STX.W $2116
    PHY
    SEP #$20
    LDY.W #$0000

CODE_02B4E0:
    LDA.B [$29],Y
    STA.W $2119
    INY
    CPY.W #$4000
    BNE CODE_02B4E0
    REP #$20
    PLY
    PLP
    RTS


CODE_02B4F0:
    LDA.B [$29]
    STA.B $23
    INC.B $29
    INC.B $29
    LDX.W #$6000
    STX.B $25
    JSL.L CODE_02B272
    PLA
    CMP.W #$00FF
    BEQ CODE_02B518
    LDX.B $00

CODE_02B509:
    LDA.L $7E6000,X
    STA.W $2118
    INX
    INX
    CPX.B $02
    BNE CODE_02B509
    PLP
    RTS


CODE_02B518:
    LDX.W #$0000
    STX.W $2116
    SEP #$20
    LDX.W #$0000

CODE_02B523:
    LDA.L $7E6000,X
    STA.W $2119
    INX
    CPX.W #$4000
    BNE CODE_02B523
    PLP
    RTS


CODE_02B532:
    LDA.W $03B4
    BIT.B #$04
    BEQ CODE_02B540
    INY
    INY
    INY
    INY
    INY
    INY
    RTS


CODE_02B540:
    PHP
    REP #$20
    JSR.W CODE_02B93F
    ASL A
    STA.B $00
    JSR.W CODE_02B93F
    ASL A
    STA.B $02
    JSR.W CODE_02B93F
    ASL A
    STA.B $04
    LDX.W #$0029
    JSR.W CODE_02B731
    PHY
    LDY.B $00
    LDX.B $04

CODE_02B560:
    LDA.B [$29],Y
    STA.L $7F0000,X
    INY
    INY
    INX
    INX
    CPY.B $02
    BNE CODE_02B560
    PLY
    PLP
    RTS


CODE_02B571:
    LDA.W $03B4
    BIT.B #$02
    BEQ CODE_02B580
    db $C8,$C8,$C8,$C8,$C8,$C8,$C8,$60

CODE_02B580:
    PHP
    REP #$20
    JSR.W CODE_02B93F
    XBA
    STA.B $06
    AND.W #$7FFF
    LSR A
    LSR A
    STA.B $00
    JSR.W CODE_02B93F
    XBA
    LSR A
    LSR A
    STA.B $02
    JSR.W CODE_02B93F
    XBA
    LSR A
    LSR A
    STA.B $04
    JSR.W CODE_02B93F
    PHA
    LDX.W #$0029
    JSR.W CODE_02B731
    LDA.B $01,S
    CMP.W #$0001
    BEQ CODE_02B5B8
    CMP.W #$0002
    BEQ CODE_02B5C2
    BRA CODE_02B5CD


CODE_02B5B8:
    LDX.W #$0413
    JSR.W CODE_02B983
    BCS CODE_02B5D3
    BRA CODE_02B5CA


CODE_02B5C2:
    LDX.W #$0416
    JSR.W CODE_02B983
    BCS CODE_02B5D3

CODE_02B5CA:
    PLA
    PLP
    RTS


CODE_02B5CD:
    STZ.W $0413
    STZ.W $0416

CODE_02B5D3:
    LDA.B $06
    BPL CODE_02B5EE
    db $A9,$00,$60,$85,$2C,$5A,$A0,$00,$00,$B7,$29,$97,$2C,$C8,$C8,$C0
    db $00,$08,$D0,$F5,$7A,$80,$11

CODE_02B5EE:
    LDA.B [$29]
    STA.B $23
    INC.B $29
    INC.B $29
    LDX.W #$6000
    STX.B $25
    JSL.L CODE_02B272
    PLA
    LDX.W #$2000
    JSR.W CODE_02B60E
    LDX.W #$2800
    JSR.W CODE_02B60E
    PLP
    RTS


CODE_02B60E:
    LSR A
    BCC CODE_02B62A
    PHA
    PHY
    STX.B $2C
    LDX.B $00
    LDY.B $04

CODE_02B619:
    LDA.L $7E6000,X
    XBA
    STA.B [$2C],Y
    INX
    INX
    INY
    INY
    CPX.B $02
    BNE CODE_02B619
    PLY
    PLA

CODE_02B62A:
    RTS


CODE_02B62B:
    LDA.W $03B4
    BIT.B #$01
    BEQ CODE_02B637
    db $C8,$C8,$C8,$C8,$60

CODE_02B637:
    PHP
    REP #$20
    JSR.W CODE_02B93F
    STA.B $04
    LDX.W #$0029
    JSR.W CODE_02B731
    LDA.B $04
    CMP.W #$0001
    BEQ CODE_02B65B
    CMP.W #$0002
    BNE CODE_02B665
    LDX.W #$041C
    JSR.W CODE_02B983
    BCS CODE_02B66B
    PLP
    RTS


CODE_02B65B:
    LDX.W #$0419
    JSR.W CODE_02B983
    BCS CODE_02B66B
    db $28,$60

CODE_02B665:
    STZ.W $0419
    STZ.W $041C

CODE_02B66B:
    LDA.B [$29]
    INC.B $29
    AND.W #$00FF
    XBA
    STA.B $00
    LDA.B [$29]
    INC.B $29
    AND.W #$00FF
    XBA
    STA.B $02
    SEP #$20
    LDA.B $01
    XBA
    LDA.B $03
    JSL.L multiply
    REP #$20
    XBA
    STA.B $23
    LDA.B $03
    BMI CODE_02B69B
    LDA.B [$29]
    STA.B $23
    INC.B $29
    INC.B $29

CODE_02B69B:
    LDA.B $04
    AND.W #$FF7F
    BNE CODE_02B6A7
    JSR.W CODE_02B6EA
    BRA CODE_02B6B7


CODE_02B6A7:
    LDX.W #$0000
    JSR.W CODE_02B6B9
    BCS CODE_02B6B7
    LDX.W #$0004
    JSR.W CODE_02B6B9
    BCS CODE_02B6B7

CODE_02B6B7:
    PLP
    RTS


CODE_02B6B9:
    LSR A
    BCC CODE_02B6E9
    PHA
    PHY
    LDA.B $00
    STA.W $0342,X
    LDA.B $02
    STA.W $0344,X
    LDY.W $0352,X
    LDA.B $03
    BPL CODE_02B6E0
    db $84,$2C,$A0,$00,$00,$B7,$29,$97,$2C,$C8,$C8,$C4,$23,$D0,$F6,$80
    db $06

CODE_02B6E0:
    STY.B $25
    JSL.L CODE_02B272
    PLY
    PLA
    SEC

CODE_02B6E9:
    RTS


CODE_02B6EA:
    PHP
    PHY
    LDA.B $03
    BPL CODE_02B705
    db $A0,$00,$C0,$84,$2C,$A0,$00,$00,$B7,$29,$97,$2C,$C8,$C8,$C0,$00
    db $40,$D0,$F5,$80,$09

CODE_02B705:
    LDX.W #$C000
    STX.B $25
    JSL.L CODE_02B272
    SEP #$20
    LDX.W #$0000
    STX.W $2116
    STZ.W $2115
    LDX.W #$0000

CODE_02B71C:
    LDA.L $7EC000,X
    STA.W $2118
    INX
    CPX.W #$4000
    BNE CODE_02B71C
    LDA.B #$80
    STA.W $2115
    PLY
    PLP
    RTS


CODE_02B731:
    PHP
    REP #$20
    LDA.B [$2F],Y
    INY
    INY
    STA.B $29
    SEP #$20
    LDA.B [$2F],Y
    INY
    STA.B $2B
    REP #$20
    LDA.W $0001,X
    AND.W #$007F
    PHA
    EOR.W $0001,X
    ASL A
    ORA.W #$0080
    ORA.B $01,S
    STA.W $0001,X
    PLA
    PLP
    RTS


CODE_02B759:
    JSR.W CODE_02B93F
    BIT.B #$80
    BEQ CODE_02B76B
    BIT.B #$40
    BEQ CODE_02B765
    RTS


CODE_02B765:
    ORA.B #$40
    JSR.W CODE_02B94A
    RTS


CODE_02B76B:
    STA.W currentMapNumber
    PHY
    REP #$20
    AND.W #$00FF
    ASL A
    TAX
    LDA.L aTestLookup,X
    SEC
    SBC.W #$E8A1
    TAX
    SEP #$20
    LDA.L aTestLookup,X
    STA.W $212C
    STA.W $212E
    STA.W $03C0
    LDA.L UNREACH_02E8A2,X
    STA.W $212D
    STA.W $212F
    LDA.L UNREACH_02E8A3,X
    STA.W $2130
    LDA.L UNREACH_02E8A4,X
    STA.W $2131
    STA.W $03C1
    LDA.L UNREACH_02E8A5,X
    AND.B #$30
    STA.W $0373
    LDA.L UNREACH_02E8A5,X
    STZ.W $036B
    STZ.W $036F
    LDY.W #$2000
    ROR A
    BCC CODE_02B7C5
    STY.W $036A

CODE_02B7C5:
    ROR A
    BCC CODE_02B7CB
    STY.W $036E

CODE_02B7CB:
    ROR A
    ROR A
    ROR A
    ROR A
    LDY.W #$00E0
    ROR A
    BCC CODE_02B7D8
    LDY.W #$0100

CODE_02B7D8:
    STY.W $03CA
    ROR A
    BCS CODE_02B7E3
    LDA.B #$01
    TSB.W $036F

CODE_02B7E3:
    LDY.W #$FDFF
    STY.W $035C
    STY.W $0360
    STZ.W $03DB
    LDA.L UNREACH_02E8A6,X
    BPL CODE_02B7F8
    INC.W $03DB

CODE_02B7F8:
    LDA.W $03DB
    BNE CODE_02B81A
    LDA.L UNREACH_02E8A6,X
    PHA
    AND.B #$03
    CLC
    ADC.B #$60
    STA.W $2107
    PLA
    LSR A
    LSR A
    AND.B #$03
    CLC
    ADC.B #$70
    STA.W $2108
    STA.W $03C2
    BRA CODE_02B835


CODE_02B81A:
    LDA.L UNREACH_02E8A6,X
    PHA
    AND.B #$03
    CLC
    ADC.B #$70
    STA.W $2107
    PLA
    LSR A
    LSR A
    AND.B #$03
    CLC
    ADC.B #$60
    STA.W $2108
    STA.W $03C2

CODE_02B835:
    LDA.L UNREACH_02E8A7,X
    STA.W $2105
    PHX
    LDY.W #$0000

CODE_02B840:
    LDA.L UNREACH_02E8A8,X
    AND.B #$0F
    STA.W $034B,Y
    LDA.L UNREACH_02E8A8,X
    AND.B #$F0
    LSR A
    LSR A
    LSR A
    LSR A
    STA.W $034A,Y
    INX
    INY
    INY
    CPY.W #$0008
    BNE CODE_02B840
    PLX
    LDA.W $031E
    BEQ CODE_02B866
    BRA CODE_02B86C


CODE_02B866:
    JSL.L CODE_029662
    BCC CODE_02B874

CODE_02B86C:
    LDA.L UNREACH_02E8AC,X
    AND.B #$3F
    BRA CODE_02B87D


CODE_02B874:
    LDA.L UNREACH_02E8AC,X
    BPL CODE_02B87D
    INC.W $031E

CODE_02B87D:
    ASL A
    BPL CODE_02B883
    INC.W $031E

CODE_02B883:
    ASL A
    BPL CODE_02B889
    INC.W $0439

CODE_02B889:
    LDA.L UNREACH_02E8AC,X
    AND.B #$0F
    STA.W actId
    PLY
    RTS

    db $20,$3F,$B9,$20,$3F,$B9,$20,$3F,$B9,$60

CODE_02B89E:
    LDA.W $03B4
    BIT.B #$20
    BEQ CODE_02B8AB
    INY
    INY
    INY
    INY
    INY
    RTS


CODE_02B8AB:
    JSR.W CODE_02B93F
    STA.W $031A
    JSR.W CODE_02B93F
    STA.W $031C
    LDX.W #$0029
    JSR.W CODE_02B731
    LDA.W $031E
    CMP.W $031C
    BEQ CODE_02B8C6
    RTS


CODE_02B8C6:
    LDX.W #$0422
    JSR.W CODE_02B983
    BCS CODE_02B8CF
    RTS


CODE_02B8CF:
    LDA.B #$F0
    STA.W $2140

CODE_02B8D4:
    LDA.W $2140
    BNE CODE_02B8D4
    LDA.B #$02
    JSL.L wait_for_n_vblanks
    LDA.B #$FF
    STA.W $2140
    LDA.B #$02
    JSL.L wait_for_n_vblanks
    JSL.L CODE_1FEFF5
    LDA.B #$03
    JSL.L wait_for_n_vblanks
    LDA.W $031A
    STA.W $2140
    RTS


CODE_02B8FB:
    LDA.W $03B4
    BIT.B #$10
    BEQ CODE_02B909
    db $C8,$C8,$C8,$C8,$C8,$C8,$60

CODE_02B909:
    JSR.W CODE_02B93F
    PHA
    JSR.W CODE_02B93F
    JSR.W CODE_02B93F
    LDX.W #$0029
    JSR.W CODE_02B731
    LDX.W #$041F
    JSR.W CODE_02B983
    BCS CODE_02B923
    PLA
    RTS


CODE_02B923:
    REP #$20
    LDA.B [$29]
    STA.B $23
    INC.B $29
    INC.B $29
    SEP #$20
    LDX.W #$3800
    PLA
    BEQ CODE_02B938
    LDX.W #$F000

CODE_02B938:
    STX.B $25
    JSL.L CODE_02B272
    RTS


CODE_02B93F:
    PHP
    REP #$20
    LDA.B [$2F],Y
    INY
    AND.W #$00FF
    PLP
    RTS


CODE_02B94A:
    STA.B $00
    LDY.W #$0000

CODE_02B94F:
    INY
    INY

CODE_02B951:
    LDA.B [$2F],Y
    INY
    CMP.B #$00
    BEQ CODE_02B94F
    ASL A
    BCS CODE_02B973
    ASL A
    BCS CODE_02B973
    ASL A
    BCS CODE_02B972
    ASL A
    BCS CODE_02B975
    ASL A
    BCS CODE_02B97B
    ASL A
    BCS CODE_02B976
    ASL A
    BCS CODE_02B974
    ASL A
    BCS CODE_02B973
    db $80,$74

CODE_02B972:
    INY

CODE_02B973:
    INY

CODE_02B974:
    INY

CODE_02B975:
    INY

CODE_02B976:
    INY
    INY
    INY
    BRA CODE_02B951


CODE_02B97B:
    LDA.B [$2F],Y
    INY
    CMP.B $00
    BNE CODE_02B951
    RTS


CODE_02B983:
    PHP
    REP #$20
    LDA.B $29
    CMP.W $0000,X
    BNE CODE_02B99B
    SEP #$20
    LDA.B $2B
    CMP.W $0002,X
    BNE CODE_02B99B
    REP #$20
    PLP
    CLC
    RTS


CODE_02B99B:
    SEP #$20
    LDA.B $2B
    STA.W $0002,X
    REP #$20
    LDA.B $29
    STA.W $0000,X
    PLP
    SEC
    RTS


init_system:
    PHP
    SEP #$20
    REP #$10
    LDA.B #$80
    STA.W $2100
    STZ.W $2101
    STZ.W $2102
    STZ.W $2103
    STZ.W $2105
    STZ.W $2106
    STZ.W $2107
    STZ.W $2108
    STZ.W $2109
    STZ.W $210A
    STZ.W $210B
    STZ.W $210C
    STZ.W $210D
    STZ.W $210D
    STZ.W $210E
    STZ.W $210E
    STZ.W $210F
    STZ.W $210F
    STZ.W $2110
    STZ.W $2110
    STZ.W $2111
    STZ.W $2111
    STZ.W $2112
    STZ.W $2112
    STZ.W $2113
    STZ.W $2113
    STZ.W $2114
    STZ.W $2114
    LDA.B #$80
    STA.W $2115
    STZ.W $2116
    STZ.W $2117
    LDA.B #$80
    STA.W $211A
    LDA.B #$01
    STZ.W $211B
    STA.W $211B
    STZ.W $211C
    STZ.W $211C
    STZ.W $211D
    STZ.W $211D
    STZ.W $211E
    STA.W $211E
    STZ.W $211F
    STZ.W $211F
    STZ.W $2120
    STZ.W $2120
    STZ.W $2121
    STZ.W $2123
    STZ.W $2124
    STZ.W $2125
    STZ.W $2126
    STZ.W $2127
    STZ.W $2128
    STZ.W $2129
    STZ.W $212A
    STZ.W $212B
    STZ.W $212C
    STZ.W $212D
    STZ.W $212E
    STZ.W $212F
    LDA.B #$02
    STA.W $2130
    STZ.W $2131
    LDA.B #$E0
    STA.W $2132
    STZ.W $2133
    STZ.W $4200
    LDA.B #$FF
    STA.W $4201
    LDA.B #$00
    STZ.W $4202
    STZ.W $4203
    STZ.W $4204
    STZ.W $4205
    STZ.W $4206
    STZ.W $4207
    STZ.W $4208
    STZ.W $4209
    STZ.W $420A
    STZ.W $420B
    STZ.W $420C
    STZ.W $420D
    REP #$20
    LDX.W #$0000
    LDA.W #$0000

zero_ram_8k:
    STA.W $0000,X
    INX
    INX
    CPX.W #$1F00
    BNE zero_ram_8k
    LDX.W #$2000

CODE_02BABA:
    STA.L $7E0000,X
    INX
    INX
    BNE CODE_02BABA
    LDX.W #$0000

CODE_02BAC5:
    STA.L $7F0000,X
    INX
    INX
    BNE CODE_02BAC5
    SEP #$20
    LDX.W #$8000
    STX.B $2F
    LDA.B #$05
    STA.B $31
    PLP
    RTL


init_window_system:
    SEP #$20
    LDA.B #$01
    STA.W $2101
    LDA.B #$09
    STA.W $2105
    LDA.B #$63
    STA.W $2107
    LDA.B #$73
    STA.W $2108
    LDA.B #$58
    STA.W $2109
    LDA.B #$00
    STA.W $210B
    LDA.B #$04
    STA.W $210C
    LDA.B #$33
    STA.W $2123
    STA.W $2124
    STA.W $2125
    LDA.B #$00
    STA.W $2126
    LDA.B #$FF
    STA.W $2127
    LDA.B #$00
    STA.W $2128
    STA.W $2129
    LDA.B #$82
    STA.W $2130
    LDA.B #$07
    STA.W $212C
    RTL


aPushStart:
    db $09,$01,$D6,$04,$50,$55,$53,$48,$20,$53,$54,$41,$52,$54,$00

aAllRightsReservedCopyright:
    db $09,$01,$C0,$05,$14,$06,$41,$4C,$4C,$20,$52,$49,$47,$48,$54,$53
    db $20,$52,$45,$53,$45,$52,$56,$45,$44,$0D,$20,$20,$43,$4F,$50,$59
    db $52,$49,$47,$48,$54,$20,$31,$39,$39,$32,$20,$51,$55,$49,$4E,$54
    db $45,$54,$2F,$45,$4E,$49,$58,$0D,$14,$09,$4C,$49,$43,$45,$4E,$53
    db $45,$44,$20,$42,$59,$20,$4E,$49,$4E,$54,$45,$4E,$44,$4F,$00

aIntroText1:
    db $01,$80,$02,$20,$20,$57,$69,$73,$65,$20,$6D,$65,$6E,$20,$E7,$97
    db $74,$61,$6C,$65,$20,$6C,$61,$74,$65,$20,$0D,$0D,$0D,$20,$20,$61
    db $74,$20,$6E,$69,$67,$68,$74,$20,$CB,$97,$67,$72,$65,$61,$74,$20
    db $8A,$0D,$0D,$0D,$20,$20,$64,$65,$73,$74,$72,$6F,$79,$65,$64,$20
    db $62,$79,$20,$E1,$74,$65,$6D,$70,$74,$61,$74,$69,$6F,$6E,$20,$0D
    db $0D,$0D,$20,$20,$CB,$65,$76,$69,$6C,$2E,$20,$00

aIntroText2:
    db $01,$80,$02,$20,$20,$91,$46,$72,$65,$69,$6C,$20,$45,$6D,$70,$69
    db $72,$65,$2C,$20,$61,$73,$20,$69,$74,$20,$F3,$0D,$0D,$0D,$20,$20
    db $A8,$BB,$74,$68,$6F,$73,$65,$20,$64,$61,$79,$73,$2C,$20,$0D,$0D
    db $0D,$20,$20,$F3,$72,$75,$6C,$65,$64,$20,$62,$79,$20,$97,$70,$6F
    db $77,$65,$72,$66,$75,$6C,$20,$6D,$61,$6E,$2C,$20,$0D,$0D,$0D,$20
    db $20,$8A,$4D,$61,$67,$72,$69,$64,$64,$2E,$20,$00

aIntroText3:
    db $01,$40,$02,$20,$20,$49,$74,$20,$73,$65,$65,$6D,$73,$20,$6D,$6F
    db $73,$74,$20,$CF,$74,$68,$6F,$75,$67,$68,$74,$20,$0D,$0D,$0D,$20
    db $20,$E1,$8A,$F3,$97,$66,$61,$69,$72,$20,$96,$6B,$69,$6E,$64,$20
    db $0D,$0D,$0D,$20,$20,$72,$75,$6C,$65,$72,$2E,$20,$93,$FD,$73,$6F
    db $6D,$65,$2C,$20,$0D,$0D,$0D,$20,$20,$68,$6F,$77,$65,$76,$65,$72
    db $2C,$20,$FB,$66,$65,$6C,$74,$20,$E1,$8A,$0D,$0D,$0D,$20,$20,$68
    db $69,$6D,$73,$65,$6C,$66,$20,$F3,$72,$75,$6C,$65,$64,$20,$62,$79
    db $20,$67,$72,$65,$65,$64,$2E,$20,$00

aIntroText4:
    db $01,$40,$02,$20,$20,$4F,$6E,$65,$20,$64,$61,$79,$20,$E1,$8A,$68
    db $61,$70,$70,$65,$6E,$65,$64,$20,$E2,$0D,$0D,$0D,$20,$20,$6F,$76
    db $65,$72,$68,$65,$61,$72,$20,$74,$77,$6F,$20,$67,$75,$61,$72,$64
    db $73,$20,$74,$61,$6C,$6B,$69,$6E,$67,$20,$0D,$0D,$0D,$20,$20,$99
    db $97,$6D,$61,$6E,$20,$6E,$61,$6D,$65,$64,$20,$44,$72,$2E,$4C,$65
    db $6F,$2E,$20,$0D,$0D,$0D,$20,$20,$4E,$6F,$77,$20,$44,$72,$2E,$8B
    db $F3,$63,$6F,$6E,$73,$69,$64,$65,$72,$65,$64,$20,$0D,$0D,$0D,$20
    db $20,$62,$79,$20,$9A,$E2,$A1,$97,$67,$72,$65,$61,$74,$20,$69,$6E
    db $76,$65,$6E,$74,$6F,$72,$20,$0D,$0D,$0D,$20,$20,$96,$97,$67,$65
    db $6E,$69,$75,$73,$2E,$20,$00

aIntroText5:
    db $01,$40,$02,$14,$03,$91,$8A,$73,$74,$61,$79,$65,$64,$20,$75,$70
    db $20,$C7,$0D,$0D,$0D,$14,$03,$6E,$69,$67,$68,$74,$73,$20,$77,$6F
    db $6E,$64,$65,$72,$69,$6E,$67,$20,$68,$6F,$77,$20,$68,$65,$20,$0D
    db $0D,$0D,$14,$03,$AB,$ED,$E4,$67,$72,$65,$61,$74,$20,$0D,$0D,$0D
    db $14,$03,$69,$6E,$76,$65,$6E,$74,$6F,$72,$20,$E2,$6D,$61,$6B,$65
    db $20,$68,$69,$6D,$20,$65,$76,$65,$6E,$20,$0D,$0D,$0D,$14,$03,$6D
    db $6F,$72,$65,$20,$77,$65,$61,$6C,$74,$68,$79,$2E,$00

aIntroText6:
    db $01,$40,$02,$20,$20,$80,$CB,$E1,$73,$75,$64,$64,$65,$6E,$20,$E1
    db $8A,$0D,$0D,$0D,$20,$20,$68,$61,$64,$20,$9C,$69,$64,$65,$61,$2E
    db $20,$0D,$0D,$0D,$20,$20,$48,$65,$20,$6F,$72,$64,$65,$72,$65,$64
    db $20,$68,$69,$73,$20,$67,$75,$61,$72,$64,$73,$20,$E2,$0D,$0D,$0D
    db $20,$20,$63,$61,$70,$74,$75,$72,$65,$20,$44,$72,$2E,$8B,$96,$62
    db $72,$69,$6E,$67,$20,$68,$69,$6D,$20,$0D,$0D,$0D,$20,$20,$E2,$E1
    db $63,$61,$73,$74,$6C,$65,$20,$61,$74,$20,$6F,$6E,$63,$65,$21,$00

aIntroText7:
    db $01,$00,$03,$20,$20,$53,$6F,$6F,$6E,$20,$44,$72,$2E,$8B,$F3,$62
    db $72,$6F,$75,$67,$68,$74,$20,$E2,$0D,$0D,$0D,$20,$20,$E1,$63,$61
    db $73,$74,$6C,$65,$2E,$20,$00

aIntroText8:
    db $01,$40,$02,$20,$20,$91,$8A,$63,$6F,$6E,$66,$69,$6E,$65,$64,$20
    db $68,$69,$6D,$20,$BB,$97,$0D,$0D,$0D,$20,$20,$73,$6D,$61,$6C,$6C
    db $20,$72,$6F,$6F,$6D,$20,$96,$6F,$72,$64,$65,$72,$65,$64,$20,$68
    db $69,$6D,$20,$0D,$0D,$0D,$20,$20,$E2,$69,$6E,$76,$65,$6E,$74,$20
    db $97,$C9,$E3,$0D,$0D,$0D,$20,$20,$77,$6F,$75,$6C,$64,$20,$73,$75
    db $6D,$6D,$6F,$6E,$20,$E1,$8A,$CB,$0D,$0D,$0D,$20,$20,$65,$76,$69
    db $6C,$2C,$20,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$2E,$00

aIntroText9:
    db $01,$40,$02,$20,$20,$44,$72,$2E,$8B,$66,$69,$6E,$61,$6C,$6C,$79
    db $20,$63,$6F,$6D,$70,$6C,$65,$74,$65,$64,$20,$0D,$0D,$0D,$20,$20
    db $E1,$6D,$61,$63,$68,$69,$6E,$65,$2E,$20,$0D,$0D,$0D,$20,$20,$91
    db $8A,$69,$6E,$73,$74,$61,$6E,$74,$6C,$79,$20,$A8,$0D,$0D,$0D,$20
    db $20,$75,$70,$6F,$6E,$20,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$2C
    db $20,$68,$6F,$70,$69,$6E,$67,$20,$74,$68,$65,$79,$20,$0D,$0D,$0D
    db $20,$20,$6D,$69,$67,$68,$74,$20,$73,$74,$72,$69,$6B,$65,$20,$97
    db $64,$65,$61,$6C,$2E,$00

aIntroText10:
    db $01,$40,$02,$20,$20,$41,$66,$74,$65,$72,$20,$C7,$64,$61,$79,$73
    db $20,$E1,$64,$65,$61,$6C,$20,$F3,$0D,$0D,$0D,$20,$20,$63,$6F,$6D
    db $70,$6C,$65,$74,$65,$2E,$20,$91,$8A,$77,$6F,$75,$6C,$64,$20,$0D
    db $0D,$0D,$20,$20,$62,$72,$69,$6E,$67,$20,$44,$65,$61,$74,$68,$74
    db $6F,$6C,$6C,$20,$9A,$6C,$69,$76,$69,$6E,$67,$20,$0D,$0D,$0D,$20
    db $20,$63,$72,$65,$61,$74,$75,$72,$65,$73,$2C,$20,$96,$BB,$72,$65
    db $74,$75,$72,$6E,$2C,$20,$0D,$0D,$0D,$20,$20,$44,$65,$61,$74,$68
    db $74,$6F,$6C,$6C,$20,$77,$6F,$75,$6C,$64,$20,$B0,$68,$69,$6D,$20
    db $97,$0D,$0D,$0D,$20,$20,$67,$6F,$6C,$64,$20,$70,$69,$65,$63,$65
    db $20,$AE,$65,$61,$63,$68,$2E,$00

aIntroText11:
    db $01,$80,$02,$20,$20,$4F,$6E,$65,$20,$62,$79,$20,$6F,$6E,$65,$2C
    db $20,$9A,$6C,$69,$76,$69,$6E,$67,$20,$0D,$0D,$0D,$20,$20,$AA,$62
    db $65,$67,$61,$6E,$20,$E2,$64,$69,$73,$61,$70,$70,$65,$61,$72,$2E
    db $20,$0D,$0D,$0D,$20,$20,$53,$6F,$6F,$6E,$20,$E1,$F6,$F3,$63,$6F
    db $6D,$70,$6C,$65,$74,$65,$6C,$79,$20,$0D,$0D,$0D,$20,$20,$65,$6D
    db $70,$74,$79,$2E,$20,$00

aIntroText12:
    db $01,$80,$02,$14,$03,$54,$77,$6F,$20,$CF,$FD,$F7,$0D,$0D,$0D,$14
    db $03,$E4,$63,$61,$74,$61,$73,$74,$72,$6F,$70,$68,$65,$2C,$20,$0D
    db $0D,$0D,$14,$03,$E1,$4D,$61,$73,$74,$65,$72,$2C,$20,$96,$79,$6F
    db $75,$2C,$20,$0D,$0D,$0D,$14,$03,$68,$69,$73,$20,$66,$6F,$6C,$6C
    db $6F,$77,$65,$72,$2E,$20,$00

aIntroText13:
    db $01,$40,$02,$20,$20,$3C,$91,$8A,$F3,$EE,$66,$6F,$6F,$6C,$69,$73
    db $68,$20,$0D,$0D,$0D,$20,$20,$E2,$A1,$74,$65,$6D,$70,$74,$65,$64
    db $20,$62,$79,$20,$65,$76,$69,$6C,$2C,$20,$0D,$0D,$0D,$20,$20,$68
    db $6F,$77,$65,$76,$65,$72,$20,$88,$F1,$B0,$68,$69,$6D,$20,$0D,$0D
    db $0D,$20,$20,$61,$6E,$6F,$74,$68,$65,$72,$20,$63,$68,$61,$6E,$63
    db $65,$2E,$20,$95,$6D,$75,$73,$74,$20,$B3,$0D,$0D,$0D,$20,$20,$64
    db $6F,$77,$6E,$20,$E2,$45,$61,$72,$74,$68,$20,$96,$72,$65,$76,$69
    db $76,$65,$20,$E1,$0D,$0D,$0D,$20,$20,$57,$6F,$72,$6C,$64,$21,$3E
    db $20,$E1,$4D,$61,$73,$74,$65,$72,$20,$73,$61,$69,$64,$2E,$20,$00

aIntroText14:
    db $01,$40,$02,$20,$20,$4F,$6E,$20,$97,$72,$61,$79,$20,$CB,$6C,$69
    db $67,$68,$74,$20,$FE,$0D,$0D,$0D,$20,$20,$64,$65,$73,$63,$65,$6E
    db $64,$65,$64,$20,$E2,$45,$61,$72,$74,$68,$2E,$2E,$2E,$2E,$2E,$20
    db $0D,$0D,$0D,$20,$20,$2E,$2E,$81,$77,$61,$72,$72,$69,$6F,$72,$20
    db $73,$65,$6E,$74,$20,$E2,$72,$65,$76,$69,$76,$65,$20,$0D,$0D,$0D
    db $20,$20,$E1,$6C,$69,$76,$69,$6E,$67,$20,$96,$70,$75,$6E,$69,$73
    db $68,$20,$65,$76,$69,$6C,$2E,$20,$0D,$0D,$0D,$20,$20,$81,$53,$4F
    db $55,$4C,$20,$42,$4C,$41,$5A,$45,$52,$21,$21,$00

aEnixLogo:
    db $09,$0A,$01,$DC,$02,$02,$04,$01,$1C,$03,$02,$05,$01,$5C,$03,$02
    db $06,$01,$9C,$03,$02,$07,$01,$DC,$03,$02,$08,$00,$01,$40,$02,$20
    db $20,$47,$72,$61,$73,$73,$20,$56,$61,$6C,$6C,$65,$79,$20,$61,$74
    db $20,$73,$75,$6E,$73,$65,$74,$3A,$3A,$3A,$20,$0D,$0D,$0D,$20,$20
    db $91,$67,$6C,$69,$73,$74,$65,$6E,$69,$6E,$67,$20,$6F,$63,$65,$61
    db $6E,$3A,$3A,$3A,$3A,$3A,$3A,$3A,$20,$0D,$0D,$0D,$20,$20,$91,$72
    db $65,$73,$74,$6F,$72,$65,$64,$20,$F6,$F3,$0D,$0D,$0D,$20,$20,$62
    db $65,$61,$75,$74,$69,$66,$75,$6C,$3A,$20,$00,$01,$C0,$02,$14,$03
    db $80,$E1,$AA,$73,$74,$6F,$70,$70,$65,$64,$20,$0D,$0D,$0D,$14,$03
    db $96,$6C,$6F,$6F,$6B,$65,$64,$20,$61,$74,$20,$E1,$62,$65,$61,$75
    db $74,$79,$20,$0D,$0D,$0D,$14,$03,$CB,$E1,$73,$75,$6E,$73,$65,$74
    db $3A,$00,$01,$40,$02,$20,$20,$4F,$6E,$65,$20,$F3,$F2,$68,$69,$73
    db $20,$63,$68,$69,$6C,$64,$7B,$20,$0D,$0D,$0D,$20,$20,$96,$CC,$F3
    db $F2,$68,$69,$73,$20,$66,$72,$69,$65,$6E,$64,$7B,$20,$0D,$0D,$0D
    db $20,$20,$AA,$FD,$BB,$61,$77,$65,$20,$CB,$0D,$0D,$0D,$20,$20,$E1
    db $73,$63,$65,$6E,$65,$72,$79,$3A,$00,$01,$C0,$02,$20,$20,$53,$75
    db $64,$64,$65,$6E,$6C,$79,$7B,$20,$97,$6C,$69,$67,$68,$74,$20,$72
    db $61,$79,$20,$73,$68,$6F,$74,$20,$0D,$0D,$0D,$20,$20,$69,$6E,$74
    db $6F,$20,$E1,$73,$6B,$79,$3A,$0D,$0D,$0D,$20,$20,$48,$6F,$77,$65
    db $76,$65,$72,$7B,$20,$6E,$6F,$20,$CC,$6E,$6F,$74,$69,$63,$65,$64
    db $20,$69,$74,$3A,$00,$01,$C0,$02,$14,$03,$4C,$69,$73,$61,$20,$F3
    db $73,$74,$61,$6E,$64,$69,$6E,$67,$20,$9A,$62,$79,$20,$0D,$0D,$0D
    db $14,$03,$68,$65,$72,$73,$65,$6C,$66,$3A,$00

aShe:
    db $01,$40,$02,$14,$03,$53,$68,$65,$20,$EC,$E2,$66,$65,$65,$6C,$20
    db $6C,$6F,$6E,$65,$6C,$79,$20,$0D,$0D,$0D,$14,$03,$F4,$73,$68,$65
    db $20,$73,$61,$77,$20,$E1,$73,$75,$6E,$73,$65,$74,$7B,$20,$0D,$0D
    db $0D,$14,$03,$A2,$6E,$6F,$77,$7B,$20,$73,$68,$65,$20,$74,$68,$69
    db $6E,$6B,$73,$20,$0D,$0D,$0D,$14,$03,$69,$74,$20,$BA,$62,$65,$61
    db $75,$74,$69,$66,$75,$6C,$3A,$00

aJust:
    db $01,$40,$02,$20,$20,$4A,$75,$73,$74,$20,$BE,$68,$65,$72,$20,$66
    db $61,$74,$68,$65,$72,$20,$63,$68,$61,$6E,$67,$65,$64,$20,$0D,$0D
    db $0D,$20,$20,$69,$6D,$70,$6F,$73,$73,$69,$62,$6C,$65,$20,$E2,$70
    db $6F,$73,$73,$69,$62,$6C,$65,$7B,$20,$0D,$0D,$0D,$20,$20,$4C,$69
    db $73,$61,$20,$66,$65,$65,$6C,$73,$20,$73,$68,$65,$20,$F1,$A1,$68
    db $61,$70,$70,$79,$20,$0D,$0D,$0D,$20,$20,$69,$66,$20,$73,$68,$65
    db $20,$62,$65,$6C,$69,$65,$76,$65,$73,$3A,$00

aXTheEnd:
    db $09,$01,$58,$03,$54,$48,$45,$20,$45,$4E,$44,$00

aChooseGameText:
    db $01,$88,$00,$07,$16,$16,$01,$4A,$01,$8F,$63,$68,$6F,$6F,$73,$65
    db $20,$97,$72,$65,$63,$6F,$72,$64,$01,$18,$02,$4E,$61,$6D,$65,$01
    db $26,$02,$4C,$65,$76,$01,$2E,$02,$41,$72,$65,$61,$01,$CA,$02,$20
    db $4E,$6F,$31,$3A,$0D,$0D,$0D,$20,$4E,$6F,$32,$3A,$0D,$0D,$0D,$20
    db $4E,$6F,$33,$3A,$0D,$0D,$0D,$20,$4E,$6F,$34,$3A,$0D,$0D,$0D,$20
    db $45,$72,$61,$73,$65,$20,$72,$65,$63,$6F,$72,$64,$00,$01,$D4,$02
    db $02,$03,$01,$E8,$02,$06,$02,$50,$04,$01,$F2,$02,$06,$01,$52,$04
    db $00,$01,$94,$03,$02,$03,$01,$A8,$03,$06,$02,$50,$04,$01,$B2,$03
    db $06,$01,$52,$04,$00,$01,$54,$04,$02,$03,$01,$68,$04,$06,$02,$50
    db $04,$01,$72,$04,$06,$01,$52,$04,$00,$01,$14,$05,$02,$03,$01,$28
    db $05,$06,$02,$50,$04,$01,$32,$05,$06,$01,$52,$04,$00

aPleaseEnterYourName:
    db $01,$84,$01,$07,$1A,$13,$01,$4A,$02,$8F,$65,$6E,$74,$65,$72,$20
    db $FF,$6E,$61,$6D,$65,$2E,$01,$18,$03,$02,$02,$09,$01,$58,$03,$2D
    db $2D,$2D,$2D,$2D,$2D,$2D,$2D,$00

aEnterNameTextSelector:
    db $01,$C6,$03,$20,$81,$42,$20,$43,$20,$44,$20,$45,$20,$46,$20,$47
    db $20,$48,$20,$88,$4A,$20,$4B,$20,$4C,$20,$4D,$0D,$0D,$20,$4E,$20
    db $4F,$20,$50,$20,$51,$20,$52,$20,$53,$20,$54,$20,$55,$20,$56,$20
    db $57,$20,$58,$20,$59,$20,$5A,$0D,$0D,$0D,$20,$97,$62,$20,$63,$20
    db $64,$20,$65,$20,$66,$20,$67,$20,$68,$20,$69,$20,$6A,$20,$6B,$20
    db $6C,$20,$6D,$0D,$0D,$20,$6E,$20,$6F,$20,$70,$20,$71,$20,$72,$20
    db $D7,$E5,$75,$20,$76,$20,$77,$20,$78,$20,$79,$20,$7A,$0D,$0D,$0D
    db $20,$30,$20,$31,$20,$32,$20,$33,$20,$34,$20,$35,$20,$36,$20,$37
    db $20,$38,$20,$39,$20,$2E,$20,$24,$20,$23,$0D,$0D,$00

aClearTextbox:
    db $08,$84,$01,$00

aLevelUp:
    db $09,$03,$24,$01,$16,$02,$4C,$45,$56,$45,$4C,$20,$55,$50,$20,$21
    db $00,$09,$01,$16,$02,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$00
    db $01,$16,$02,$14,$0A,$01,$86,$01,$07,$18,$02,$05,$C2,$C7,$6A,$1C
    db $00

OsdLairRemainingText:
    db $01,$1E,$05,$07,$0C,$04,$4D,$6F,$6E,$73,$74,$65,$72,$20,$4C,$61
    db $69,$72,$0D,$0D,$52,$65,$6D,$61,$69,$6E,$69,$6E,$67,$20,$06,$02
    db $80,$1B,$00,$08,$86,$01,$08,$1E,$05,$00

OsdStats:
    db $01,$16,$02,$14,$0A,$01,$86,$01,$07,$17,$13,$03,$20,$01,$0C,$02
    db $02,$02,$01,$22,$02,$48,$50,$01,$28,$02,$06,$03,$6C,$1B,$2F,$01
    db $30,$02,$06,$03,$6E,$1B,$01,$88,$02,$4E,$65,$78,$74,$20,$6C,$65
    db $76,$65,$6C,$20,$3A,$01,$A6,$02,$06,$08,$7C,$1B,$01,$1E,$03,$0B
    db $26,$72,$1B,$01,$5E,$03,$0B,$26,$70,$1B,$01,$48,$03,$53,$74,$72
    db $65,$6E,$67,$74,$68,$20,$3A,$01,$DE,$03,$0B,$27,$76,$1B,$01,$1E
    db $04,$0B,$27,$74,$1B,$01,$08,$04,$44,$65,$66,$65,$6E,$63,$65,$20
    db $20,$3A,$01,$C8,$04,$57,$65,$61,$70,$6F,$6E,$3A,$20,$05,$74,$CF
    db $5E,$1B,$01,$48,$05,$41,$72,$6D,$6F,$72,$20,$3A,$20,$05,$74,$CF
    db $60,$1B,$01,$C8,$05,$4D,$61,$67,$69,$63,$20,$3A,$20,$05,$74,$CF
    db $62,$1B,$01,$48,$06,$49,$74,$65,$6D,$20,$20,$3A,$20,$05,$74,$CF
    db $64,$1B,$00

OsdSouls:
    db $08,$86,$01,$01,$8A,$01,$07,$12,$13,$01,$58,$02,$53,$6F,$75,$6C
    db $73,$00

OsdSoulNames:
    db $01,$0E,$03,$53,$6F,$75,$6C,$40,$6F,$66,$40,$4D,$61,$67,$69,$63
    db $69,$61,$6E,$40,$00,$01,$CE,$03,$53,$6F,$75,$6C,$40,$6F,$66,$40
    db $4C,$69,$67,$68,$74,$40,$40,$40,$40,$00,$01,$8E,$04,$53,$6F,$75
    db $6C,$40,$6F,$66,$40,$53,$68,$69,$65,$6C,$64,$40,$40,$40,$00,$01
    db $4E,$05,$53,$6F,$75,$6C,$40,$6F,$66,$40,$44,$65,$74,$65,$63,$74
    db $69,$6F,$6E,$00,$01,$0E,$06,$53,$6F,$75,$6C,$40,$6F,$66,$40,$52
    db $65,$61,$6C,$69,$74,$79,$40,$40,$00

OsdItemMenu:
    db $01,$88,$00,$07,$06,$0C,$57,$65,$61,$70,$6F,$6E,$01,$98,$00,$07
    db $06,$0C,$41,$72,$6D,$6F,$72,$01,$A8,$00,$07,$06,$0C,$4D,$61,$67
    db $69,$63

WeaponArmorMagicItem:
    db $01,$08,$04,$07,$16,$08,$01,$8A,$04,$20,$57,$65,$70,$2E,$3A,$20
    db $05,$74,$CF,$5E,$1B,$0D,$0D,$20,$41,$72,$6D,$2E,$3A,$20,$05,$74
    db $CF,$60,$1B,$0D,$0D,$20,$4D,$61,$67,$2E,$3A,$20,$05,$74,$CF,$62
    db $1B,$0D,$0D,$20,$49,$74,$65,$6D,$3A,$20,$05,$74,$CF,$64,$1B,$00
    db $01,$88,$00,$07,$16,$0C,$49,$74,$65,$6D,$00,$20,$19

HUDLevExpGem:
    db $09,$03,$24,$01,$00,$07,$0B,$1A,$0C,$C7,$01,$42,$00,$4C,$45,$56
    db $01,$50,$00,$45,$58,$50,$01,$6A,$00,$47,$45,$4D,$01,$C0,$00,$02
    db $00,$01,$CC,$00,$03,$28,$0B,$20,$0D,$C7,$00

aXX:
    db $09,$01,$58,$00,$03,$20,$06,$08,$78,$1B,$00,$09,$01,$CC,$00,$03
    db $2C,$04,$88,$1B,$8A,$1B,$00

aJJ:
    db $09,$01,$4A,$00,$03,$20,$06,$02,$6A,$1B,$00

aRF:
    db $09,$01,$72,$00,$03,$20,$06,$06,$66,$1B,$00,$09,$01,$40,$01,$0B
    db $20,$0C,$C7,$00

aL:
     db $09,$01,$40,$01,$03,$24,$02,$01,$01,$4C,$01,$03,$2C,$0B,$20,$0D
    db $C7,$01,$4C,$01,$04,$36,$03,$38,$03,$00

osd2LUT:
    db $9B,$C7,$A2,$C7,$92,$1B,$47,$04,$A9,$C7,$AE,$C7,$B3,$C7,$B8,$C7
    db $BD,$C7

aPLAYER:
    db $0A,$0B,$0C,$0D,$0E,$0F,$00

aEnemy:
    db $10,$11,$12,$13,$14,$15,$00

aAYER:
    db $0C,$0D,$0E,$0F,$00

aGarbage:
    db $1C,$1D,$1E,$1F,$00

aPunctuation:
    db $2C,$2D,$2E,$2F,$00

aSym2:
    db $3C,$3D,$3E,$3F,$00

aLmno:
    db $4C,$4D,$4E,$4F,$00

SectionNamesTable:
    db $C2,$C8,$D9,$C8,$F1,$C8,$08,$C9,$18,$C9,$26,$C9,$3F,$C9,$58,$C9
    db $69,$C9,$7A,$C9,$8B,$C9,$9A,$C9,$AB,$C9,$BF,$C9,$CC,$C9,$DA,$C9
    db $DB,$C9,$DC,$C9,$DD,$C9,$DE,$C9,$DF,$C9,$F2,$C9,$05,$CA,$13,$CA
    db $26,$CA,$3C,$CA,$4F,$CA,$5E,$CA,$6D,$CA,$7C,$CA,$8A,$CA,$98,$CA
    db $A6,$CA,$B5,$CA,$C4,$CA,$D9,$CA,$E7,$CA,$F6,$CA,$F7,$CA,$F8,$CA
    db $F9,$CA,$0C,$CB,$20,$CB,$34,$CB,$43,$CB,$52,$CB,$64,$CB,$70,$CB
    db $86,$CB,$8F,$CB,$99,$CB,$A7,$CB,$B7,$CB,$CB,$CB,$CC,$CB,$CD,$CB
    db $CE,$CB,$CF,$CB,$D0,$CB,$D1,$CB,$D2,$CB,$E5,$CB,$FC,$CB,$14,$CC
    db $24,$CC,$38,$CC,$49,$CC,$61,$CC,$74,$CC,$7F,$CC,$93,$CC,$A1,$CC
    db $B6,$CC,$B7,$CC,$B8,$CC,$B9,$CC,$BA,$CC,$BB,$CC,$BC,$CC,$BD,$CC
    db $BE,$CC,$D3,$CC,$E5,$CC,$F7,$CC,$02,$CD,$0F,$CD,$1D,$CD,$33,$CD
    db $49,$CD,$57,$CD,$62,$CD,$6D,$CD,$7C,$CD,$8B,$CD,$8C,$CD,$8D,$CD
    db $8E,$CD,$8F,$CD,$90,$CD,$91,$CD,$92,$CD,$A3,$CD,$B5,$CD,$C8,$CD
    db $DB,$CD,$EE,$CD,$F9,$CD,$07,$CE,$15,$CE,$1F,$CE,$2E,$CE,$3D,$CE
    db $4C,$CE,$5E,$CE,$6F,$CE,$80,$CE,$92,$CE,$93,$CE,$94,$CE,$95,$CE
    db $96,$CE,$AB,$CE,$B9,$CE,$C7,$CE,$D8,$CE,$EC,$CE,$00,$CF,$01,$CF

aGrassValleyShr:
    db $20,$20,$47,$72,$61,$73,$73,$20,$56,$61,$6C,$6C,$65,$79,$20,$53
    db $68,$72,$69,$6E,$65,$20,$00

aGrassValleyHig:
    db $20,$47,$72,$61,$73,$73,$20,$56,$61,$6C,$6C,$65,$79,$20,$68,$69
    db $67,$68,$6C,$61,$6E,$64,$73,$00

aChild:
    db $20,$43,$68,$69,$6C,$64,$60,$D7,$73,$65,$63,$72,$65,$74,$20,$70
    db $61,$73,$73,$61,$67,$65,$00

aTreasureRoom:
    db $14,$06,$54,$72,$65,$61,$73,$75,$72,$65,$20,$72,$6F,$6F,$6D,$00
    db $91,$EF,$43,$68,$69,$65,$66,$60,$D7,$72,$6F,$6F,$6D,$00

aUndergroundCastleWest:
    db $55,$6E,$64,$65,$72,$67,$72,$6F,$75,$6E,$64,$20,$43,$61,$73,$74
    db $6C,$65,$2C,$20,$77,$65,$73,$74,$00

aUndergroundCastleEast:
    db $55,$6E,$64,$65,$72,$67,$72,$6F,$75,$6E,$64,$20,$43,$61,$73,$74
    db $6C,$65,$2C,$20,$65,$61,$73,$74,$00

aLeo_4:
    db $14,$05,$4C,$65,$6F,$60,$D7,$50,$61,$69,$6E,$74,$69,$6E,$67,$73
    db $00

aLeo_3:
    db $14,$05,$4C,$65,$6F,$60,$D7,$50,$61,$69,$6E,$74,$69,$6E,$67,$73
    db $00

aLeo_2:
    db $14,$05,$4C,$65,$6F,$60,$D7,$50,$61,$69,$6E,$74,$69,$6E,$67,$73
    db $00

aTulip_0:
    db $14,$06,$54,$75,$6C,$69,$70,$60,$D7,$44,$72,$65,$61,$6D,$00

aLeo_1:
    db $14,$05,$4C,$65,$6F,$60,$D7,$50,$61,$69,$6E,$74,$69,$6E,$67,$73
    db $00

aMonster:
    db $4D,$6F,$6E,$73,$74,$65,$72,$20,$BB,$E1,$70,$61,$69,$6E,$74,$69
    db $6E,$67,$73,$00

aTrialRoom:
    db $14,$07,$54,$72,$69,$61,$6C,$20,$72,$6F,$6F,$6D,$00

aLisa_0:
    db $14,$06,$4C,$69,$73,$61,$60,$D7,$64,$72,$65,$61,$6D,$00,$00,$00
    db $00,$00,$00

aGreenwoodShrin:
    db $14,$04,$47,$72,$65,$65,$6E,$57,$6F,$6F,$64,$20,$53,$68,$72,$69
    db $6E,$65,$00

aWoods:
    db $14,$03,$57,$6F,$6F,$64,$73,$20,$CB,$47,$72,$65,$65,$6E,$57,$6F
    db $6F,$64,$00,$14,$06,$81,$6D,$6F,$6C,$65,$60,$D7,$68,$6F,$6C,$65
    db $00,$14,$03,$81,$73,$71,$75,$69,$72,$72,$65,$6C,$60,$D7,$68,$6F
    db $75,$73,$65,$00

aSquirrel_0:
    db $20,$53,$71,$75,$69,$72,$72,$65,$6C,$2C,$20,$E1,$45,$78,$63,$68
    db $61,$6E,$67,$65,$72,$00

aLostside:
    db $14,$03,$4C,$6F,$73,$74,$73,$69,$64,$65,$2C,$20,$97,$6D,$61,$72
    db $73,$68,$00

aWaterShrine_1:
    db $14,$06,$57,$61,$74,$65,$72,$20,$53,$68,$72,$69,$6E,$65,$00

aWaterShrine_0:
    db $14,$06,$57,$61,$74,$65,$72,$20,$53,$68,$72,$69,$6E,$65,$00

aWaterShrine:
    db $14,$06,$57,$61,$74,$65,$72,$20,$53,$68,$72,$69,$6E,$65,$00

aFireShrine_1:
    db $14,$07,$46,$69,$72,$65,$20,$53,$68,$72,$69,$6E,$65,$00

aFireShrine_0:
    db $14,$07,$46,$69,$72,$65,$20,$53,$68,$72,$69,$6E,$65,$00

aFireShrine:
    db $14,$07,$46,$69,$72,$65,$20,$53,$68,$72,$69,$6E,$65,$00

aLightShrine_0:
    db $14,$06,$4C,$69,$67,$68,$74,$20,$53,$68,$72,$69,$6E,$65,$00

aLightShrine:
    db $14,$06,$4C,$69,$67,$68,$74,$20,$53,$68,$72,$69,$6E,$65,$00

aTombStoneStatu:
    db $20,$54,$6F,$6D,$62,$20,$CB,$97,$73,$74,$6F,$6E,$65,$20,$73,$74
    db $61,$74,$75,$65,$00

aBird_0:
    db $14,$06,$42,$69,$72,$64,$60,$D7,$44,$72,$65,$61,$6D,$00

aStump:
    db $14,$05,$53,$74,$75,$6D,$70,$60,$D7,$44,$72,$65,$61,$6D,$00,$00
    db $00,$00

aStEllesShrine:
    db $14,$04,$53,$74,$2E,$20,$45,$6C,$6C,$65,$73,$20,$53,$68,$72,$69
    db $6E,$65,$00,$20,$20,$91,$53,$65,$61,$62,$65,$64,$20,$53,$61,$6E
    db $63,$74,$75,$61,$72,$79,$00,$20,$91,$53,$65,$61,$62,$65,$64,$20
    db $CB,$53,$74,$2E,$20,$45,$6C,$6C,$65,$73,$00,$14,$04,$91,$53,$65
    db $63,$72,$65,$74,$20,$43,$61,$76,$65,$00,$14,$04,$91,$53,$65,$63
    db $72,$65,$74,$20,$43,$61,$76,$65,$00,$14,$03,$81,$64,$6F,$6C,$70
    db $68,$69,$6E,$60,$D7,$64,$72,$65,$61,$6D,$00

aSoutherta:
    db $14,$08,$53,$6F,$75,$74,$68,$65,$72,$74,$61,$00

aShoreReef:
    db $20,$53,$68,$6F,$72,$65,$20,$72,$65,$65,$66,$20,$CB,$52,$6F,$63
    db $6B,$62,$69,$72,$64,$00

aDurean:
    db $14,$08,$44,$75,$72,$65,$61,$6E,$00

aBlester:
    db $14,$08,$42,$6C,$65,$73,$74,$65,$72,$00,$14,$06,$81,$67,$68,$6F
    db $73,$74,$20,$73,$68,$69,$70,$00

aServasDream:
    db $14,$06,$53,$65,$72,$76,$61,$73,$60,$20,$64,$72,$65,$61,$6D,$00
    db $20,$91,$53,$65,$61,$62,$65,$64,$20,$CB,$53,$74,$2E,$20,$45,$6C
    db $6C,$65,$73,$00,$00,$00,$00,$00,$00,$00,$00,$20,$20,$91,$53,$6F
    db $75,$6C,$60,$D7,$53,$61,$6E,$63,$74,$75,$61,$72,$79,$00

aSoul:
    db $20,$20,$53,$6F,$75,$6C,$20,$CB,$4D,$6F,$75,$6E,$74,$61,$69,$6E
    db $20,$48,$6F,$75,$73,$65,$00

aMountainNorthS:
    db $20,$20,$4D,$6F,$75,$6E,$74,$61,$69,$6E,$2C,$20,$4E,$6F,$72,$74
    db $68,$2D,$73,$6C,$6F,$70,$65,$00

aAurora:
    db $14,$05,$41,$75,$72,$6F,$72,$61,$60,$D7,$52,$69,$64,$67,$65,$00

aAnOldMan_0:
    db $14,$03,$41,$6E,$20,$6F,$6C,$64,$20,$6D,$61,$6E,$60,$D7,$64,$72
    db $65,$61,$6D,$00,$14,$04,$81,$70,$61,$73,$73,$61,$67,$65,$20,$E2
    db $4C,$75,$6E,$65,$00

aUndergroundLak:
    db $20,$20,$55,$6E,$64,$65,$72,$67,$72,$6F,$75,$6E,$64,$20,$6C,$61
    db $6B,$65,$2C,$4C,$75,$6E,$65,$00,$14,$03,$81,$6D,$75,$73,$68,$72
    db $6F,$6F,$6D,$60,$D7,$64,$72,$65,$61,$6D,$00

aPoseidon:
    db $14,$08,$50,$6F,$73,$65,$69,$64,$6F,$6E,$00,$91,$74,$6F,$70,$20
    db $CB,$53,$6E,$6F,$77,$20,$4D,$6F,$75,$6E,$74,$61,$69,$6E,$00

aAnIceHill:
    db $14,$07,$41,$6E,$20,$69,$63,$65,$20,$68,$69,$6C,$6C,$00

aIceField:
    db $20,$20,$49,$63,$65,$20,$66,$69,$65,$6C,$64,$20,$CB,$4C,$61,$79
    db $6E,$6F,$6C,$65,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$20,$91
    db $4C,$61,$62,$6F,$72,$61,$74,$6F,$72,$79,$20,$53,$68,$72,$69,$6E
    db $65,$00

aLeo_0:
    db $14,$04,$4C,$65,$6F,$60,$D7,$4C,$61,$62,$6F,$72,$61,$74,$6F,$72
    db $79,$00

aLeo:
    db $14,$04,$4C,$65,$6F,$60,$D7,$4C,$61,$62,$6F,$72,$61,$74,$6F,$72
    db $79,$00

aAnAttic:
    db $14,$08,$41,$6E,$20,$61,$74,$74,$69,$63,$00,$14,$07,$81,$6D,$69
    db $63,$65,$20,$6E,$65,$73,$74,$00,$14,$06,$81,$63,$61,$74,$60,$D7
    db $64,$72,$65,$61,$6D,$00

aBasement_2:
    db $20,$42,$61,$73,$65,$6D,$65,$6E,$74,$20,$CB,$4C,$61,$62,$6F,$72
    db $61,$74,$6F,$72,$79,$00

aBasement_1:
    db $20,$42,$61,$73,$65,$6D,$65,$6E,$74,$20,$CB,$4C,$61,$62,$6F,$72
    db $61,$74,$6F,$72,$79,$00

aPowerPlant:
    db $14,$07,$70,$6F,$77,$65,$72,$20,$70,$6C,$61,$6E,$74,$00

aTinDoll:
    db $14,$08,$54,$69,$6E,$20,$44,$6F,$6C,$6C,$00,$14,$08,$81,$64,$72
    db $65,$61,$6D,$20,$31,$00

aModelTown_1:
    db $14,$05,$4D,$6F,$64,$65,$6C,$20,$CB,$97,$74,$6F,$77,$6E,$00

aModelTown_0:
    db $14,$05,$4D,$6F,$64,$65,$6C,$20,$CB,$97,$74,$6F,$77,$6E,$00,$00
    db $00,$00,$00,$00,$00,$00,$20,$20,$8D,$43,$61,$73,$74,$6C,$65,$20
    db $53,$68,$72,$69,$6E,$65,$00

aCastleMagridd:
    db $20,$43,$61,$73,$74,$6C,$65,$20,$CB,$8A,$4D,$61,$67,$72,$69,$64
    db $64,$00,$14,$03,$91,$74,$6F,$72,$74,$75,$72,$65,$20,$63,$68,$61
    db $6D,$62,$65,$72,$00

aBasement_0:
    db $20,$42,$61,$73,$65,$6D,$65,$6E,$74,$20,$CB,$E1,$63,$61,$73,$74
    db $6C,$65,$00

aBasement:
    db $20,$42,$61,$73,$65,$6D,$65,$6E,$74,$20,$CB,$E1,$63,$61,$73,$74
    db $6C,$65,$00,$14,$08,$81,$64,$72,$65,$61,$6D,$20,$31,$00,$14,$05
    db $91,$6C,$65,$66,$74,$20,$74,$6F,$77,$65,$72,$00,$14,$05,$91,$6C
    db $65,$66,$74,$20,$74,$6F,$77,$65,$72,$00,$14,$08,$81,$70,$72,$69
    db $73,$6F,$6E,$00,$14,$05,$91,$72,$69,$67,$68,$74,$20,$74,$6F,$77
    db $65,$72,$00,$14,$05,$91,$72,$69,$67,$68,$74,$20,$74,$6F,$77,$65
    db $72,$00,$14,$05,$91,$72,$69,$67,$68,$74,$20,$74,$6F,$77,$65,$72
    db $00,$20,$81,$63,$6F,$72,$72,$69,$64,$6F,$72,$20,$E2,$E1,$64,$6F
    db $63,$6B,$00,$20,$91,$64,$6F,$63,$6B,$20,$AE,$9C,$61,$69,$72,$73
    db $68,$69,$70,$00,$20,$91,$64,$65,$63,$6B,$20,$CB,$9C,$61,$69,$72
    db $73,$68,$69,$70,$00,$14,$04,$81,$73,$6F,$6C,$64,$69,$65,$72,$60
    db $D7,$64,$72,$65,$61,$6D,$00,$00,$00,$00,$00,$20,$20,$91,$45,$76
    db $69,$6C,$20,$57,$6F,$72,$6C,$64,$20,$53,$68,$72,$69,$6E,$65,$00

aWorld_0:
    db $14,$06,$57,$6F,$72,$6C,$64,$20,$CB,$45,$76,$69,$6C,$00

aWorld:
    db $14,$06,$57,$6F,$72,$6C,$64,$20,$CB,$45,$76,$69,$6C,$00

aDazzlingSpace:
    db $14,$05,$44,$61,$7A,$7A,$6C,$69,$6E,$67,$20,$53,$70,$61,$63,$65
    db $00

aDeathtoll:
    db $14,$03,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$60,$D7,$53,$68,$72
    db $69,$6E,$65,$00

aBattle:
    db $20,$20,$42,$61,$74,$74,$6C,$65,$20,$F2,$44,$65,$61,$74,$68,$74
    db $6F,$6C,$6C,$00,$00,$00

choiceYesNo:
    db $01,$88,$02,$07,$04,$04,$20,$59,$65,$73,$0D,$0D,$20,$4E,$6F,$01
    db $0A,$03,$00

choiceYes:
    db $01,$08,$03,$07,$04,$02,$20,$59,$65,$73,$01,$8A,$03,$00

choiceRecordMoveQuit:
    db $01,$08,$02,$07,$07,$06,$20,$52,$65,$63,$6F,$72,$64,$0D,$0D,$20
    db $4D,$6F,$76,$65,$20,$0D,$0D,$20,$51,$75,$69,$74,$01,$8A,$02,$00

choiceRecordQuit:
    db $01,$88,$02,$07,$07,$04,$20,$52,$65,$63,$6F,$72,$64,$0D,$0D,$20
    db $51,$75,$69,$74,$01,$0A,$03,$00

choiceStayGoBack:
    db $01,$88,$02,$07,$08,$04,$20,$53,$74,$61,$79,$0D,$0D,$20,$47,$6F
    db $20,$62,$61,$63,$6B,$01,$0A,$03,$00

AllItemsTable:
    db $F6,$CF

SwordNamesTable:
    db $00,$D0,$0C,$D0,$19,$D0,$28,$D0,$34,$D0,$43,$D0,$50,$D0,$5F,$D0

ArmorNamesTable:
    db $6B,$D0,$76,$D0,$80,$D0,$8D,$D0,$99,$D0,$A6,$D0,$B2,$D0,$C1,$D0

MagicNamesTable:
    db $CC,$D0,$D7,$D0,$E3,$D0,$EF,$D0,$F7,$D0,$02,$D1,$0F,$D1,$17,$D1

ItemNamesTable:
    db $1F,$D1,$2A,$D1,$36,$D1,$3C,$D1,$41,$D1,$4C,$D1,$53,$D1,$60,$D1
    db $6B,$D1,$7A,$D1,$89,$D1,$95,$D1,$A2,$D1,$B2,$D1,$B9,$D1,$C3,$D1
    db $D1,$D1,$DB,$D1,$E4,$D1,$ED,$D1,$F6,$D1,$FF,$D1,$08,$D2,$11,$D2
    db $1A,$D2,$23,$D2,$32,$D2,$3F,$D2,$4D,$D2,$5C,$D2,$6C,$D2,$7B,$D2
    db $88,$D2,$97,$D2,$A3,$D2,$AA,$D2,$B5,$D2,$C2,$D2,$CF,$D2,$DB,$D2

aNotEquipped:
    db $CA,$65,$71,$75,$69,$70,$70,$65,$64,$00

aSwordOfLife:
    db $53,$77,$6F,$72,$64,$20,$CB,$4C,$69,$66,$65,$00

aPsychoSword:
    db $50,$73,$79,$63,$68,$6F,$20,$53,$77,$6F,$72,$64,$00

aCriticalSword:
    db $43,$72,$69,$74,$69,$63,$61,$6C,$20,$53,$77,$6F,$72,$64,$00

aLuckyBlade:
    db $4C,$75,$63,$6B,$79,$20,$42,$6C,$61,$64,$65,$00

aZantetsuSword:
    db $5A,$61,$6E,$74,$65,$74,$73,$75,$20,$53,$77,$6F,$72,$64,$00

aSpiritSword:
    db $53,$70,$69,$72,$69,$74,$20,$53,$77,$6F,$72,$64,$00

aRecoverySword:
    db $52,$65,$63,$6F,$76,$65,$72,$79,$20,$53,$77,$6F,$72,$64,$00

aSoulBlade:
    db $91,$53,$6F,$75,$6C,$20,$42,$6C,$61,$64,$65,$00

aIronArmor:
    db $49,$72,$6F,$6E,$20,$41,$72,$6D,$6F,$72,$00

aIceArmor:
    db $49,$63,$65,$20,$41,$72,$6D,$6F,$72,$00

aBubbleArmor:
    db $42,$75,$62,$62,$6C,$65,$20,$41,$72,$6D,$6F,$72,$00

aMagicArmor:
    db $4D,$61,$67,$69,$63,$20,$41,$72,$6D,$6F,$72,$00

aMysticArmor:
    db $4D,$79,$73,$74,$69,$63,$20,$41,$72,$6D,$6F,$72,$00

aLightArmor:
    db $4C,$69,$67,$68,$74,$20,$41,$72,$6D,$6F,$72,$00

aElementalMail:
    db $45,$6C,$65,$6D,$65,$6E,$74,$61,$6C,$20,$4D,$61,$69,$6C,$00

aSoulArmor:
    db $53,$6F,$75,$6C,$20,$41,$72,$6D,$6F,$72,$00

aFlameBall:
    db $46,$6C,$61,$6D,$65,$20,$42,$61,$6C,$6C,$00

aLightArrow:
    db $4C,$69,$67,$68,$74,$20,$41,$72,$72,$6F,$77,$00

aMagicFlair:
    db $4D,$61,$67,$69,$63,$20,$46,$6C,$61,$69,$72,$00

aRotator:
    db $52,$6F,$74,$61,$74,$6F,$72,$00

aSparkBomb:
    db $53,$70,$61,$72,$6B,$20,$42,$6F,$6D,$62,$00

aFlamePillar:
    db $46,$6C,$61,$6D,$65,$20,$50,$69,$6C,$6C,$61,$72,$00

aTornado:
    db $54,$6F,$72,$6E,$61,$64,$6F,$00

aPhoenix:
    db $50,$68,$6F,$65,$6E,$69,$78,$00

aGoatFood:
    db $47,$6F,$61,$74,$60,$D7,$46,$6F,$6F,$64,$00

aHarpString:
    db $48,$61,$72,$70,$20,$73,$74,$72,$69,$6E,$67,$00

aPassKid:
    db $97,$70,$61,$73,$73,$00

aRod:
    db $85,$52,$6F,$64,$00

aLeosBrush:
    db $4C,$65,$6F,$60,$D7,$62,$72,$75,$73,$68,$00

aLeaves:
    db $4C,$65,$61,$76,$65,$73,$00

aMoleRibbon:
    db $4D,$6F,$6C,$65,$60,$D7,$52,$69,$62,$62,$6F,$6E,$00

aBigPearl:
    db $E1,$42,$69,$67,$20,$50,$65,$61,$72,$6C,$00

aMermaidsTears:
    db $4D,$65,$72,$6D,$61,$69,$64,$60,$D7,$54,$65,$61,$72,$73,$00

aMushroomShoes:
    db $4D,$75,$73,$68,$72,$6F,$6F,$6D,$20,$53,$68,$6F,$65,$73,$00

aAMobileKey:
    db $97,$6D,$6F,$62,$69,$6C,$65,$20,$6B,$65,$79,$00

aThunderRing:
    db $54,$68,$75,$6E,$64,$65,$72,$20,$52,$69,$6E,$67,$00

aDeliciousSeeds:
    db $44,$65,$6C,$69,$63,$69,$6F,$75,$73,$20,$53,$65,$65,$64,$73,$00

aLeaves_0:
    db $4C,$65,$61,$76,$65,$73,$00

aADoorKey:
    db $97,$64,$6F,$6F,$72,$20,$6B,$65,$79,$00

aPlatinumCard:
    db $50,$6C,$61,$74,$69,$6E,$75,$6D,$20,$43,$61,$72,$64,$00

aAVipCard:
    db $E1,$56,$49,$50,$20,$43,$61,$72,$64,$00

aEmblemA:
    db $45,$6D,$62,$6C,$65,$6D,$20,$41,$00

aEmblemB:
    db $45,$6D,$62,$6C,$65,$6D,$20,$42,$00

aEmblemC:
    db $45,$6D,$62,$6C,$65,$6D,$20,$43,$00

aEmblemD:
    db $45,$6D,$62,$6C,$65,$6D,$20,$44,$00

aEmblemE:
    db $45,$6D,$62,$6C,$65,$6D,$20,$45,$00

aEmblemF:
    db $45,$6D,$62,$6C,$65,$6D,$20,$46,$00

aEmblemG:
    db $45,$6D,$62,$6C,$65,$6D,$20,$47,$00

aEmblemH:
    db $45,$6D,$62,$6C,$65,$6D,$20,$48,$00

aRedHotMirror:
    db $52,$65,$64,$2D,$48,$6F,$74,$20,$4D,$69,$72,$72,$6F,$72,$00

aRedHotBall:
    db $52,$65,$64,$2D,$48,$6F,$74,$20,$42,$61,$6C,$6C,$00

aRedHotStick:
    db $52,$65,$64,$2D,$48,$6F,$74,$20,$53,$74,$69,$63,$6B,$00

aPowerBracelet:
    db $50,$6F,$77,$65,$72,$20,$42,$72,$61,$63,$65,$6C,$65,$74,$00

aShieldBracelet:
    db $53,$68,$69,$65,$6C,$64,$20,$42,$72,$61,$63,$65,$6C,$65,$74,$00

aSuperBracelet:
    db $53,$75,$70,$65,$72,$20,$42,$72,$61,$63,$65,$6C,$65,$74,$00

aMedicalHerb:
    db $4D,$65,$64,$69,$63,$61,$6C,$20,$48,$65,$72,$62,$00

aStrangeBottle:
    db $53,$74,$72,$61,$6E,$67,$65,$20,$42,$6F,$74,$74,$6C,$65,$00

aBrownStone:
    db $42,$72,$6F,$77,$6E,$20,$53,$74,$6F,$6E,$65,$00

aGreenStone:
    db $87,$53,$74,$6F,$6E,$65,$00

aBlueStone:
    db $42,$6C,$75,$65,$20,$53,$74,$6F,$6E,$65,$00

aSilverStone:
    db $53,$69,$6C,$76,$65,$72,$20,$53,$74,$6F,$6E,$65,$00

aPurpleStone:
    db $50,$75,$72,$70,$6C,$65,$20,$53,$74,$6F,$6E,$65,$00

aBlackStone:
    db $42,$6C,$61,$63,$6B,$20,$53,$74,$6F,$6E,$65,$00

aMagicBell:
    db $4D,$61,$67,$69,$63,$20,$42,$65,$6C,$6C,$00

charaterNamesTable:
    db $50,$D3,$59,$D3,$64,$D3,$69,$D3,$6E,$D3,$76,$D3,$84,$D3,$8F,$D3
    db $A4,$D3,$B4,$D3,$BA,$D3,$C7,$D3,$CD,$D3,$D1,$D3,$E4,$D3,$EE,$D3
    db $F4,$D3,$FF,$D3,$0D,$D4,$1C,$D4,$22,$D4,$27,$D4,$2F,$D4,$35,$D4
    db $3A,$D4,$43,$D4,$4C,$D4,$57,$D4,$5E,$D4,$6C,$D4,$7D,$D4,$82,$D4
    db $88,$D4,$90,$D4,$98,$D4,$9F,$D4,$A5,$D4,$AF,$D4,$BC,$D4,$C2,$D4
    db $CE,$D4,$D3,$D4,$DA,$D4,$E1,$D4,$F1,$D4,$F7,$D4,$04,$D5,$11,$D5
    db $1A,$D5,$20,$D5,$28,$D5,$31,$D5,$38,$D5

aAnOldMan:
    db $9C,$6F,$6C,$64,$20,$6D,$61,$6E,$00

aAnOldWoman:
    db $9C,$6F,$6C,$64,$20,$77,$6F,$6D,$61,$6E,$00

aABoy:
    db $97,$62,$6F,$79,$00

aLisa:
    db $4C,$69,$73,$61,$00

aVillageChief:
    db $91,$EF,$43,$68,$69,$65,$66,$00

aBridgeGuard:
    db $91,$62,$72,$69,$64,$67,$65,$20,$67,$75,$61,$72,$64,$00

aArchitect:
    db $9C,$61,$72,$63,$68,$69,$74,$65,$63,$74,$00

aToolShopOwnersSon:
    db $74,$6F,$6F,$6C,$20,$73,$68,$6F,$70,$20,$6F,$77,$6E,$65,$72,$60
    db $D7,$73,$6F,$6E,$00

aToolShopOwner:
    db $74,$6F,$6F,$6C,$20,$73,$68,$6F,$70,$20,$6F,$77,$6E,$65,$72,$00

aGoat:
    db $97,$67,$6F,$61,$74,$00

aLonelyGoat:
    db $97,$6C,$6F,$6E,$65,$6C,$79,$20,$67,$6F,$61,$74,$00

aTulip:
    db $74,$75,$6C,$69,$70,$00

aIvy:
    db $69,$76,$79,$00

aWaterMillKeeper:
    db $91,$77,$61,$74,$65,$72,$20,$6D,$69,$6C,$6C,$20,$6B,$65,$65,$70
    db $65,$72,$00

aSquirrel:
    db $97,$73,$71,$75,$69,$72,$72,$65,$6C,$00

aDeer:
    db $97,$64,$65,$65,$72,$00

aCrocodile:
    db $97,$63,$72,$6F,$63,$6F,$64,$69,$6C,$65,$00

aDogTurbo:
    db $97,$64,$6F,$67,$2C,$20,$3C,$54,$75,$72,$62,$6F,$3E,$00

aWoodGuardian:
    db $57,$6F,$6F,$64,$60,$D7,$67,$75,$61,$72,$64,$69,$61,$6E,$00

aMole:
    db $97,$6D,$6F,$6C,$65,$00

aNone:
    db $6E,$6F,$6E,$65,$00

aChief:
    db $91,$EF,$43,$68,$69,$65,$66,$00

aBird:
    db $97,$62,$69,$72,$64,$00

aDog:
    db $97,$64,$6F,$67,$00

aMermaid:
    db $97,$6D,$65,$72,$6D,$61,$69,$64,$00

aDolphin:
    db $97,$64,$6F,$6C,$70,$68,$69,$6E,$00

aAngelfish:
    db $9C,$61,$6E,$67,$65,$6C,$66,$69,$73,$68,$00

aQueen2:
    db $E1,$51,$75,$65,$65,$6E,$00

aDolphinLue:
    db $E1,$64,$6F,$6C,$70,$68,$69,$6E,$2C,$20,$4C,$75,$65,$00

aMermaidStatue:
    db $97,$6D,$65,$72,$6D,$61,$69,$64,$60,$D7,$73,$74,$61,$74,$75,$65
    db $00

aBoy:
    db $97,$62,$6F,$79,$00

aGirl:
    db $97,$67,$69,$72,$6C,$00

aGrandpa:
    db $47,$72,$61,$6E,$64,$70,$61,$00

aGrandma:
    db $47,$72,$61,$6E,$64,$6D,$61,$00

aSnail:
    db $97,$73,$6E,$61,$69,$6C,$00

aKing:
    db $E1,$4B,$69,$6E,$67,$00

aMushroom:
    db $97,$6D,$75,$73,$68,$72,$6F,$6F,$6D,$00

aSnailNome:
    db $E1,$73,$6E,$61,$69,$6C,$2C,$20,$4E,$6F,$6D,$65,$00

aSteps:
    db $73,$74,$65,$70,$73,$00

aGreatDoor:
    db $97,$67,$72,$65,$61,$74,$20,$64,$6F,$6F,$72,$00

aCat:
    db $97,$63,$61,$74,$00

aPlant:
    db $97,$70,$6C,$61,$6E,$74,$00

aMouse:
    db $97,$6D,$6F,$75,$73,$65,$00

aChestDrawers:
    db $97,$63,$68,$65,$73,$74,$20,$CB,$64,$72,$61,$77,$65,$72,$73,$00

aDoll:
    db $97,$64,$6F,$6C,$6C,$00

aDollMarie:
    db $E1,$64,$6F,$6C,$6C,$2C,$20,$4D,$61,$72,$69,$65,$00

aModelTown:
    db $97,$6D,$6F,$64,$65,$6C,$20,$CB,$74,$6F,$77,$6E,$00

aSoldier:
    db $97,$73,$6F,$6C,$64,$69,$65,$72,$00

aMaid:
    db $97,$6D,$61,$69,$64,$00

aSinger:
    db $97,$73,$69,$6E,$67,$65,$72,$00

aKingMagrid:
    db $8A,$4D,$61,$67,$72,$69,$64,$64,$00

aDrLeo:
    db $44,$72,$2E,$4C,$65,$6F,$00

aQueen:
    db $51,$75,$65,$65,$6E,$00

aLevStrengthDefence:
    db $01,$08,$04,$07,$16,$08,$01,$AA,$04,$4C,$65,$76,$3A,$01,$0A,$05
    db $53,$74,$72,$65,$6E,$67,$74,$68,$3A,$00,$01,$08,$04,$07,$16,$08
    db $01,$0A,$05,$44,$65,$66,$65,$6E,$63,$65,$20,$3A,$00,$01,$08,$04
    db $07,$16,$08,$00

DescriptionTableStart:
    db $F4,$D5

WeaponDescriptionTable:
    db $FB,$D5,$28,$D6,$66,$D6,$94,$D6,$D7,$D6,$0C,$D7,$49,$D7,$88,$D7

ArmorDescriptionTable:
    db $BF,$D7,$F9,$D7,$2B,$D8,$57,$D8,$88,$D8,$BD,$D8,$F9,$D8,$28,$D9

MagicDescriptionTable:
    db $51,$D9,$87,$D9,$C3,$D9,$02,$DA,$34,$DA,$6E,$DA,$A1,$DA,$D0,$DA

ItemDescriptionTable:
    db $F9,$DA,$1F,$DB,$3F,$DB,$72,$DB,$A7,$DB,$E6,$DB,$2B,$DC,$67,$DC
    db $99,$DC,$BF,$DC,$F7,$DC,$38,$DD,$76,$DD,$B2,$DD,$E5,$DD,$16,$DE
    db $47,$DE,$7D,$DE,$BB,$DE,$C6,$DE,$D1,$DE,$DC,$DE,$E7,$DE,$F2,$DE
    db $FD,$DE,$08,$DF,$44,$DF,$4F,$DF,$5A,$DF,$90,$DF,$CD,$DF,$09,$E0
    db $46,$E0,$7A,$E0,$B9,$E0,$C4,$E0,$CF,$E0,$DA,$E0,$E5,$E0,$F0,$E0
    db $01,$08,$04,$07,$16,$08,$00

WeaponDescription_Life:
    db $01,$8A,$04,$05,$74,$CF,$2C,$E1,$01,$B2,$04,$06,$02,$CE,$E1,$01
    db $1E,$05,$0B,$26,$AD,$E1,$01,$8A,$05,$81,$73,$77,$6F,$72,$64,$20
    db $AD,$E1,$0D,$0D,$4D,$61,$73,$74,$65,$72,$2E,$20,$00

WeaponDescription_Psycho:
    db $01,$8A,$04,$05,$74,$CF,$2E,$E1,$01,$B2,$04,$06,$02,$D0,$E1,$01
    db $1E,$05,$0B,$26,$AE,$E1,$01,$8A,$05,$49,$6E,$76,$69,$6E,$63,$69
    db $62,$6C,$65,$20,$C4,$0D,$0D,$74,$65,$6D,$70,$6F,$72,$61,$72,$69
    db $6C,$79,$20,$70,$61,$72,$61,$6C,$79,$7A,$65,$64,$2E,$00

WeaponDescription_Critial:
    db $01,$8A,$04,$05,$74,$CF,$30,$E1,$01,$B2,$04,$06,$02,$D2,$E1,$01
    db $1E,$05,$0B,$26,$AF,$E1,$01,$8A,$05,$44,$65,$66,$65,$61,$74,$73
    db $20,$C4,$0D,$0D,$61,$74,$20,$6F,$6E,$63,$65,$2E,$20,$00

WeaponDescription_Lucky:
    db $01,$8A,$04,$05,$74,$CF,$32,$E1,$01,$B2,$04,$06,$02,$D4,$E1,$01
    db $1E,$05,$0B,$26,$B0,$E1,$01,$8A,$05,$91,$63,$68,$61,$6E,$63,$65
    db $20,$CB,$67,$65,$74,$74,$69,$6E,$67,$20,$0D,$0D,$6C,$61,$72,$67
    db $65,$72,$20,$47,$45,$4D,$73,$20,$69,$6E,$63,$72,$65,$61,$73,$65
    db $73,$2E,$00

WeaponDescription_Zantetsu:
    db $01,$8A,$04,$05,$74,$CF,$34,$E1,$01,$B2,$04,$06,$02,$D6,$E1,$01
    db $1E,$05,$0B,$26,$B1,$E1,$01,$8A,$05,$44,$65,$66,$65,$61,$74,$73
    db $20,$C4,$F2,$0D,$0D,$73,$70,$65,$63,$69,$61,$6C,$20,$61,$72,$6D
    db $6F,$72,$2E,$20,$00

WeaponDescription_Spirit:
    db $01,$8A,$04,$05,$74,$CF,$36,$E1,$01,$B2,$04,$06,$02,$D8,$E1,$01
    db $1E,$05,$0B,$26,$B2,$E1,$01,$8A,$05,$44,$65,$66,$65,$61,$74,$73
    db $20,$E1,$3C,$73,$70,$69,$72,$69,$74,$3E,$20,$0D,$0D,$74,$79,$70
    db $65,$20,$6D,$6F,$6E,$73,$74,$65,$72,$73,$2E,$20,$00

WeaponDescription_Recovery:
    db $01,$8A,$04,$05,$74,$CF,$38,$E1,$01,$B2,$04,$06,$02,$DA,$E1,$01
    db $1E,$05,$0B,$26,$B3,$E1,$01,$8A,$05,$48,$50,$20,$F1,$A1,$66,$69
    db $6C,$6C,$65,$64,$20,$77,$68,$65,$6E,$0D,$0D,$6D,$6F,$6E,$73,$74
    db $65,$72,$20,$BA,$64,$65,$66,$65,$61,$74,$65,$64,$2E,$20,$00

WeaponDescription_Soul:
    db $01,$8A,$04,$05,$74,$CF,$3A,$E1,$01,$B2,$04,$06,$02,$DC,$E1,$01
    db $1E,$05,$0B,$26,$B4,$E1,$01,$8A,$05,$91,$73,$74,$72,$6F,$6E,$67
    db $65,$73,$74,$20,$73,$77,$6F,$72,$64,$20,$0D,$0D,$FE,$6D,$61,$79
    db $20,$75,$73,$65,$2E,$20,$00

ArmorDescription_Armor:
    db $01,$8A,$04,$05,$74,$CF,$3C,$E1,$01,$1E,$05,$0B,$27,$C6,$E1,$01
    db $8A,$05,$59,$6F,$75,$72,$20,$64,$65,$66,$65,$6E,$73,$65,$20,$70
    db $6F,$77,$65,$72,$20,$0D,$0D,$62,$65,$63,$6F,$6D,$65,$73,$20,$73
    db $74,$72,$6F,$6E,$67,$65,$72,$2E,$20,$00

ArmorDescription_Ice:
    db $01,$8A,$04,$05,$74,$CF,$3E,$E1,$01,$1E,$05,$0B,$27,$C7,$E1,$01
    db $8A,$05,$FE,$A7,$63,$72,$6F,$73,$73,$20,$0D,$0D,$66,$69,$72,$65
    db $20,$77,$69,$74,$68,$6F,$75,$74,$20,$64,$61,$6D,$61,$67,$65,$2E
    db $20,$00

ArmorDescription_Bubble:
    db $01,$8A,$04,$05,$74,$CF,$40,$E1,$01,$1E,$05,$0B,$27,$C8,$E1,$01
    db $8A,$05,$45,$6E,$61,$62,$6C,$65,$73,$20,$FE,$E2,$F9,$0D,$0D,$75
    db $6E,$64,$65,$72,$20,$E1,$73,$65,$61,$2E,$20,$00

ArmorDescription_Magic:
    db $01,$8A,$04,$05,$74,$CF,$42,$E1,$01,$1E,$05,$0B,$27,$C9,$E1,$01
    db $8A,$05,$43,$75,$74,$73,$20,$E1,$6E,$65,$63,$65,$73,$73,$61,$72
    db $79,$20,$0D,$0D,$47,$45,$4D,$73,$20,$BB,$68,$61,$6C,$66,$2E,$20
    db $00

ArmorDescription_Mystic:
    db $01,$8A,$04,$05,$74,$CF,$44,$E1,$01,$1E,$05,$0B,$27,$CA,$E1,$01
    db $8A,$05,$49,$6E,$76,$69,$6E,$63,$69,$62,$6C,$65,$20,$AE,$6C,$6F
    db $6E,$67,$65,$72,$0D,$0D,$70,$65,$72,$69,$6F,$64,$20,$CB,$74,$69
    db $6D,$65,$2E,$20,$00

ArmorDescription_Light:
    db $01,$8A,$04,$05,$74,$CF,$46,$E1,$01,$1E,$05,$0B,$27,$CB,$E1,$01
    db $8A,$05,$52,$65,$63,$65,$69,$76,$65,$20,$6E,$6F,$20,$64,$61,$6D
    db $61,$67,$65,$20,$66,$72,$6F,$6D,$0D,$0D,$77,$65,$61,$6B,$65,$72
    db $20,$6D,$6F,$6E,$73,$74,$65,$72,$73,$2E,$20,$00

ArmorDescription_Elemental:
    db $01,$8A,$04,$05,$74,$CF,$48,$E1,$01,$1E,$05,$0B,$27,$CC,$E1,$01
    db $8A,$05,$50,$72,$6F,$74,$65,$63,$74,$73,$20,$02,$02,$0D,$0D,$AD
    db $E1,$64,$61,$6D,$61,$67,$65,$20,$7A,$6F,$6E,$65,$73,$2E,$00

ArmorDescription_Soul:
    db $01,$8A,$04,$05,$74,$CF,$4A,$E1,$01,$1E,$05,$0B,$27,$CD,$E1,$01
    db $8A,$05,$45,$6E,$61,$62,$6C,$65,$73,$20,$FE,$E2,$F9,$69,$6E,$0D
    db $0D,$73,$70,$61,$63,$65,$2E,$20,$00

MagicDescription_Ball:
    db $01,$8A,$04,$05,$74,$CF,$4C,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$34,$0D,$0D,$53,$68,$6F,$6F,$74,$73,$20,$97,$66,$69,$72
    db $65,$62,$61,$6C,$6C,$20,$BB,$0D,$0D,$CC,$64,$69,$72,$65,$63,$74
    db $69,$6F,$6E,$2E,$20,$00

MagicDescription_Light:
    db $01,$8A,$04,$05,$74,$CF,$4E,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$38,$0D,$0D,$53,$68,$6F,$6F,$74,$73,$20,$3C,$6C,$69,$67
    db $68,$74,$3E,$20,$61,$72,$72,$6F,$77,$73,$20,$0D,$0D,$BB,$9A,$64
    db $69,$72,$65,$63,$74,$69,$6F,$6E,$73,$2E,$20,$00

MagicDescription_Flair:
    db $01,$8A,$04,$05,$74,$CF,$50,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$38,$0D,$0D,$50,$6F,$77,$65,$72,$20,$BA,$63,$6F,$6C,$6C
    db $65,$63,$74,$65,$64,$20,$0D,$0D,$77,$68,$69,$6C,$65,$20,$62,$75
    db $74,$74,$6F,$6E,$20,$70,$72,$65,$73,$73,$65,$64,$2E,$20,$00

MagicDescription_Rotator:
    db $01,$8A,$04,$05,$74,$CF,$52,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$31,$0D,$0D,$81,$6C,$69,$67,$68,$74,$20,$72,$69,$6E,$67
    db $20,$F1,$0D,$0D,$72,$6F,$74,$61,$74,$65,$20,$9B,$79,$6F,$75,$2E
    db $20,$00

MagicDescription_Spark:
    db $01,$8A,$04,$05,$74,$CF,$54,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$38,$0D,$0D,$4D,$69,$6E,$65,$73,$20,$98,$6C,$61,$69,$64
    db $2C,$20,$F1,$0D,$0D,$65,$78,$70,$6C,$6F,$64,$65,$20,$73,$6F,$6F
    db $6E,$20,$61,$66,$74,$65,$72,$2E,$20,$00

MagicDescription_Pillar:
    db $01,$8A,$04,$05,$74,$CF,$56,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$32,$30,$0D,$0D,$50,$69,$6C,$6C,$61,$72,$73,$20,$CB,$66
    db $69,$72,$65,$20,$F1,$0D,$0D,$72,$69,$73,$65,$20,$9B,$79,$6F,$75
    db $2E,$20,$00

MagicDescription_Tornado:
    db $01,$8A,$04,$05,$74,$CF,$58,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$38,$0D,$0D,$4D,$61,$67,$69,$63,$61,$6C,$20,$54,$6F,$72
    db $6E,$61,$64,$6F,$20,$F1,$0D,$0D,$63,$6F,$6D,$65,$2E,$20,$00

MagicDescription_Phoenix:
    db $01,$8A,$04,$05,$74,$CF,$5A,$E1,$01,$0A,$05,$8E,$47,$45,$4D,$20
    db $3A,$20,$32,$0D,$0D,$50,$68,$6F,$65,$6E,$69,$78,$20,$F1,$6A,$6F
    db $69,$6E,$20,$0D,$0D,$02,$02,$2E,$00

ItemDescription_GoatFood:
    db $01,$8A,$04,$05,$74,$CF,$5C,$E1,$01,$0A,$05,$47,$6F,$61,$74,$60
    db $D7,$66,$6F,$6F,$64,$20,$AD,$E1,$0D,$0D,$74,$6F,$6F,$6C,$20,$73
    db $68,$6F,$70,$2E,$20,$00

ItemDescription_HarpString:
    db $01,$8A,$04,$05,$74,$CF,$5E,$E1,$01,$0A,$05,$48,$61,$72,$70,$20
    db $53,$74,$72,$69,$6E,$67,$20,$CB,$73,$69,$6E,$67,$65,$72,$2E,$00

ItemDescription_Pass:
    db $01,$8A,$04,$05,$74,$CF,$60,$E1,$01,$0A,$05,$81,$70,$61,$73,$73
    db $20,$C8,$62,$79,$20,$E1,$0D,$0D,$63,$68,$69,$6C,$64,$72,$65,$6E
    db $20,$CB,$47,$72,$61,$73,$73,$20,$0D,$0D,$56,$61,$6C,$6C,$65,$79
    db $2E,$20,$00

ItemDescription_DreamRod:
    db $01,$8A,$04,$05,$74,$CF,$62,$E1,$01,$0A,$05,$81,$DA,$73,$74,$69
    db $63,$6B,$20,$E3,$0D,$0D,$65,$6E,$61,$62,$6C,$65,$73,$20,$FE,$E2
    db $6C,$6F,$6F,$6B,$20,$0D,$0D,$69,$6E,$74,$6F,$20,$97,$64,$72,$65
    db $61,$6D,$2E,$20,$00

ItemDescription_LeosBrush:
    db $01,$8A,$04,$05,$74,$CF,$64,$E1,$01,$0A,$05,$91,$70,$61,$69,$6E
    db $74,$62,$72,$75,$73,$68,$20,$EC,$74,$6F,$0D,$0D,$70,$61,$69,$6E
    db $74,$20,$E1,$70,$69,$63,$74,$75,$72,$65,$3A,$20,$0D,$0D,$3C,$91
    db $57,$6F,$72,$6C,$64,$20,$CB,$45,$76,$69,$6C,$3E,$2E,$20,$00

ItemDescription_TurboLeaves:
    db $01,$8A,$04,$05,$74,$CF,$66,$E1,$01,$0A,$05,$54,$75,$72,$62,$6F
    db $60,$D7,$73,$79,$6D,$62,$6F,$6C,$2E,$20,$41,$6E,$79,$6F,$6E,$65
    db $0D,$0D,$F2,$E4,$BA,$61,$63,$63,$65,$70,$74,$65,$64,$20,$0D,$0D
    db $61,$73,$20,$54,$75,$72,$62,$6F,$60,$D7,$6D,$65,$73,$73,$65,$6E
    db $67,$65,$72,$2E,$00

ItemDescription_MolesRibbon:
    db $01,$8A,$04,$05,$74,$CF,$68,$E1,$01,$0A,$05,$81,$72,$69,$62,$62
    db $6F,$6E,$20,$E3,$4D,$6F,$6E,$6D,$6F,$2C,$20,$61,$0D,$0D,$6D,$6F
    db $6C,$65,$2C,$20,$EC,$E2,$A1,$66,$6F,$6E,$64,$20,$0D,$0D,$CB,$F4
    db $73,$68,$65,$20,$F3,$61,$6C,$69,$76,$65,$2E,$00

ItemDescription_BigPearl:
    db $01,$8A,$04,$05,$74,$CF,$6A,$E1,$01,$0A,$05,$81,$62,$65,$61,$75
    db $74,$69,$66,$75,$6C,$20,$70,$65,$61,$72,$6C,$20,$0D,$0D,$E3,$A7
    db $A1,$AF,$BB,$0D,$0D,$63,$6F,$72,$61,$6C,$20,$72,$65,$65,$66,$2E
    db $20,$00

ItemDescription_MermaidTears:
    db $01,$8A,$04,$05,$74,$CF,$6C,$E1,$01,$0A,$05,$F1,$74,$75,$72,$6E
    db $20,$6D,$61,$67,$6D,$61,$20,$69,$6E,$74,$6F,$20,$0D,$0D,$73,$74
    db $6F,$6E,$65,$2E,$20,$00

ItemDescription_MushroomShoes:
    db $01,$8A,$04,$05,$74,$CF,$6E,$E1,$01,$0A,$05,$91,$DE,$67,$6F,$6F
    db $20,$65,$6E,$61,$62,$6C,$65,$73,$20,$0D,$0D,$FE,$E2,$F9,$CD,$69
    db $63,$65,$20,$0D,$0D,$77,$69,$74,$68,$6F,$75,$74,$20,$73,$6C,$69
    db $70,$70,$69,$6E,$67,$2E,$20,$00

ItemDescription_MobileKey:
    db $01,$8A,$04,$05,$74,$CF,$70,$E1,$01,$0A,$05,$4B,$65,$79,$20,$E2
    db $41,$69,$72,$73,$68,$69,$70,$2E,$20,$50,$6C,$75,$67,$20,$20,$0D
    db $0D,$69,$6E,$74,$6F,$20,$97,$6B,$65,$79,$68,$6F,$6C,$65,$20,$6C
    db $6F,$63,$61,$74,$65,$64,$0D,$0D,$E0,$CD,$E1,$73,$68,$69,$70,$2E
    db $00

ItemDescription_ThunderRing:
    db $01,$8A,$04,$05,$74,$CF,$72,$E1,$01,$0A,$05,$89,$FE,$74,$6F,$75
    db $63,$68,$20,$97,$0D,$0D,$6C,$69,$67,$68,$74,$6E,$69,$6E,$67,$20
    db $70,$79,$72,$61,$6D,$69,$64,$2C,$20,$0D,$0D,$6C,$69,$67,$68,$74
    db $6E,$69,$6E,$67,$20,$F1,$73,$74,$72,$69,$6B,$65,$2E,$00

ItemDescription_DeliciousSeeds:
    db $01,$8A,$04,$05,$74,$CF,$74,$E1,$01,$0A,$05,$46,$61,$76,$6F,$72
    db $69,$74,$65,$20,$53,$65,$65,$64,$73,$2C,$20,$0D,$0D,$65,$78,$63
    db $68,$61,$6E,$67,$65,$20,$AE,$69,$74,$65,$6D,$20,$0D,$0D,$F2,$E1
    db $65,$78,$63,$68,$61,$6E,$67,$65,$72,$2E,$20,$00

ItemDescription_CatLeaves:
    db $01,$8A,$04,$05,$74,$CF,$76,$E1,$01,$0A,$05,$45,$6D,$69,$74,$73
    db $20,$97,$70,$65,$63,$75,$6C,$69,$61,$72,$20,$73,$63,$65,$6E,$74
    db $0D,$0D,$E3,$61,$74,$74,$72,$61,$63,$74,$73,$20,$63,$61,$74,$73
    db $2E,$20,$00

ItemDescription_DoorKey:
    db $01,$8A,$04,$05,$74,$CF,$78,$E1,$01,$0A,$05,$92,$6B,$65,$79,$20
    db $F1,$6F,$70,$65,$6E,$20,$74,$68,$65,$0D,$0D,$64,$6F,$6F,$72,$20
    db $E2,$E1,$0D,$0D,$6C,$61,$62,$6F,$72,$61,$74,$6F,$72,$79,$2E,$20
    db $00

ItemDescription_PlatinumCard:
    db $01,$8A,$04,$05,$74,$CF,$7A,$E1,$01,$0A,$05,$95,$6D,$61,$79,$20
    db $65,$6E,$74,$65,$72,$20,$E1,$6C,$65,$66,$74,$0D,$0D,$74,$6F,$77
    db $65,$72,$20,$BB,$E1,$8D,$0D,$0D,$43,$61,$73,$74,$6C,$65,$2E,$20
    db $00

ItemDescription_VipCard:
    db $01,$8A,$04,$05,$74,$CF,$7C,$E1,$01,$0A,$05,$95,$6D,$61,$79,$20
    db $B3,$77,$68,$65,$72,$65,$76,$65,$72,$20,$0D,$0D,$FE,$77,$69,$73
    db $68,$20,$77,$69,$74,$68,$69,$6E,$20,$E1,$0D,$0D,$8D,$43,$61,$73
    db $74,$6C,$65,$2E,$20,$00

ItemDescription_EmblemA:
    db $01,$8A,$04,$05,$74,$CF,$7E,$E1,$01,$0A,$05,$89,$FE,$63,$6F,$6C
    db $6C,$65,$63,$74,$20,$38,$20,$CB,$0D,$0D,$74,$68,$65,$73,$65,$2C
    db $20,$FE,$F1,$62,$65,$63,$6F,$6D,$65,$0D,$0D,$9C,$65,$78,$70,$65
    db $72,$74,$20,$61,$74,$20,$6D,$61,$67,$69,$63,$2E,$20,$00

ItemDescription_EmblemB:
    db $01,$8A,$04,$05,$74,$CF,$80,$E1,$13,$85,$DE

ItemDescription_EmblemC:
    db $01,$8A,$04,$05,$74,$CF,$82,$E1,$13,$85,$DE

ItemDescription_EmblemD:
    db $01,$8A,$04,$05,$74,$CF,$84,$E1,$13,$85,$DE

ItemDescription_EmblemE:
    db $01,$8A,$04,$05,$74,$CF,$86,$E1,$13,$85,$DE

ItemDescription_EmblemF:
    db $01,$8A,$04,$05,$74,$CF,$88,$E1,$13,$85,$DE

ItemDescription_EmblemG:
    db $01,$8A,$04,$05,$74,$CF,$8A,$E1,$13,$85,$DE

ItemDescription_EmblemH:
    db $01,$8A,$04,$05,$74,$CF,$8C,$E1,$13,$85,$DE

ItemDescription_RedHotMirror:
    db $01,$8A,$04,$05,$74,$CF,$8E,$E1,$01,$0A,$05,$89,$FE,$6F,$62,$74
    db $61,$69,$6E,$20,$9A,$0D,$0D,$74,$68,$72,$65,$65,$20,$73,$79,$6D
    db $62,$6F,$6C,$73,$2C,$20,$E1,$0D,$0D,$50,$68,$6F,$65,$6E,$69,$78
    db $20,$F1,$6A,$6F,$69,$6E,$20,$79,$6F,$75,$2E,$00

ItemDescription_RedHotBall:
    db $01,$8A,$04,$05,$74,$CF,$90,$E1,$13,$10,$DF

ItemDescription_RedHotStick:
    db $01,$8A,$04,$05,$74,$CF,$92,$E1,$13,$10,$DF

ItemDescription_PowerBracelet:
    db $01,$8A,$04,$05,$74,$CF,$94,$E1,$01,$0A,$05,$89,$FE,$65,$71,$75
    db $69,$70,$20,$E4,$0D,$0D,$69,$74,$65,$6D,$2C,$20,$FF,$61,$74,$74
    db $61,$63,$6B,$20,$0D,$0D,$70,$6F,$77,$65,$72,$20,$F1,$64,$6F,$75
    db $62,$6C,$65,$2E,$20,$00

ItemDescription_ShieldBracelet:
    db $01,$8A,$04,$05,$74,$CF,$96,$E1,$01,$0A,$05,$57,$69,$6C,$6C,$20
    db $72,$65,$64,$75,$63,$65,$20,$E1,$61,$6D,$6F,$75,$6E,$74,$0D,$0D
    db $CB,$64,$61,$6D,$61,$67,$65,$20,$D4,$0D,$0D,$AD,$65,$6E,$65,$6D
    db $69,$65,$73,$20,$62,$79,$20,$31,$2F,$32,$2E,$20,$00

ItemDescription_SuperBracelet:
    db $01,$8A,$04,$05,$74,$CF,$98,$E1,$01,$0A,$05,$59,$6F,$75,$72,$20
    db $73,$77,$6F,$72,$64,$20,$96,$61,$72,$6D,$6F,$72,$20,$0D,$0D,$F1
    db $69,$6E,$63,$72,$65,$61,$73,$65,$20,$BB,$0D,$0D,$73,$74,$72,$65
    db $6E,$67,$74,$68,$20,$62,$79,$20,$32,$2E,$20,$00

ItemDescription_MedicalHerb:
    db $01,$8A,$04,$05,$74,$CF,$9A,$E1,$01,$0A,$05,$59,$6F,$75,$72,$20
    db $48,$50,$20,$F1,$A1,$0D,$0D,$72,$65,$66,$69,$6C,$6C,$65,$64,$20
    db $69,$66,$20,$FF,$6C,$69,$66,$65,$20,$0D,$0D,$6D,$65,$74,$65,$72
    db $20,$72,$65,$61,$63,$68,$65,$73,$20,$30,$2E,$20,$00

ItemDescription_StrangeBottle:
    db $01,$8A,$04,$05,$74,$CF,$9C,$E1,$01,$0A,$05,$95,$F1,$CA,$6C,$6F
    db $73,$65,$20,$61,$6E,$79,$20,$0D,$0D,$47,$45,$4D,$73,$20,$DC,$FF
    db $6C,$69,$66,$65,$20,$0D,$0D,$6D,$65,$74,$65,$72,$20,$72,$65,$61
    db $63,$68,$20,$00

ItemDescription_BrownStone:
    db $01,$8A,$04,$05,$74,$CF,$9E,$E1,$01,$0A,$05,$57,$6F,$72,$6C,$64
    db $20,$CB,$45,$76,$69,$6C,$20,$F1,$0D,$0D,$61,$70,$70,$65,$61,$72
    db $20,$6F,$6E,$63,$65,$20,$FE,$B5,$0D,$0D,$63,$6F,$6C,$6C,$65,$63
    db $74,$65,$64,$20,$36,$20,$CB,$74,$68,$65,$73,$65,$2E,$20,$00

ItemDescription_GreenStone:
    db $01,$8A,$04,$05,$74,$CF,$A0,$E1,$13,$82,$E0

ItemDescription_BlueStone:
    db $01,$8A,$04,$05,$74,$CF,$A2,$E1,$13,$82,$E0

ItemDescription_SilverStone:
    db $01,$8A,$04,$05,$74,$CF,$A4,$E1,$13,$82,$E0

ItemDescription_PurpleStone:
    db $01,$8A,$04,$05,$74,$CF,$A6,$E1,$13,$82,$E0

ItemDescription_BlackStone:
    db $01,$8A,$04,$05,$74,$CF,$A8,$E1,$13,$82,$E0

ItemDescription_MagicBell:
    db $01,$8A,$04,$05,$74,$CF,$AA,$E1,$01,$0A,$05,$95,$F1,$A1,$61,$62
    db $6C,$65,$20,$E2,$0D,$0D,$63,$61,$73,$74,$20,$6D,$61,$67,$69,$63
    db $20,$77,$69,$74,$68,$6F,$75,$74,$20,$0D,$0D,$75,$73,$69,$6E,$67
    db $20,$61,$6E,$79,$20,$47,$45,$4D,$73,$2E,$20,$00

SequenceTable:
    db $01,$00,$02,$00,$03,$00,$04,$00,$05,$00,$06,$00,$07,$00,$08,$00
    db $09,$00,$0A,$00,$0B,$00,$0C,$00,$0D,$00,$0E,$00,$0F,$00,$10,$00
    db $11,$00,$12,$00,$13,$00,$14,$00,$15,$00,$16,$00,$17,$00,$18,$00
    db $19,$00,$1A,$00,$1B,$00,$1C,$00,$1D,$00,$1E,$00,$1F,$00,$20,$00
    db $21,$00,$22,$00,$23,$00,$24,$00,$25,$00,$26,$00,$27,$00,$28,$00
    db $29,$00,$2A,$00,$2B,$00,$2C,$00,$2D,$00,$2E,$00,$2F,$00,$30,$00
    db $31,$00,$32,$00,$33,$00,$34,$00,$35,$00,$36,$00,$37,$00,$38,$00
    db $39,$00,$3A,$00,$3B,$00,$3C,$00,$3D,$00,$3E,$00,$3F,$00,$40,$00

ItemStrengthTable:
    db $00,$01,$02,$03,$04,$06,$08,$0A,$0C,$00,$00,$00,$00,$00,$00,$00
    db $00

ItemArmorTable:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$04,$06,$08,$0A
    db $0C

aCannotRecalledYet:
    db $01,$00,$05,$00,$11,$00,$15,$00,$16,$00,$19,$00,$22,$00,$24,$00
    db $10,$03,$24,$05,$E6,$D2,$C8,$03,$03,$20,$0D,$63,$61,$6E,$6E,$6F
    db $74,$20,$A1,$72,$65,$63,$61,$6C,$6C,$65,$64,$20,$0D,$79,$65,$74
    db $21,$20,$13,$5F,$E2

releaseMessage:
    db $10,$02,$02,$20,$D6,$0D,$03,$24,$05,$E6,$D2,$C8,$03,$03,$20,$2E
    db $13,$5F,$E2

receivedItemString:
    db $10,$20,$02,$02,$20,$72,$65,$63,$69,$65,$76,$65,$64,$0D,$20,$03
    db $24,$05,$74,$CF,$C8,$03,$03,$20,$2E,$13,$5F,$E2

receivedNothing:
    db $10,$20,$4E,$6F,$74,$68,$69,$6E,$67,$20,$69,$6E,$73,$69,$64,$65
    db $2E,$13,$5F,$E2

foundNGems:
    db $10,$20,$02,$02,$20,$66,$6F,$75,$6E,$64,$0D,$03,$24,$06,$03,$C8
    db $03,$20,$47,$45,$4D,$73,$2E,$03,$20

waitForInputAndClearTextboxAndEnd:
    db $12,$08,$08,$04,$0C

aTheStaffOfSoul:
    db $14,$03,$54,$68,$65,$20,$73,$74,$61,$66,$66,$20,$6F,$66,$20,$53
    db $6F,$75,$6C,$20,$42,$6C,$61,$7A,$65,$72,$0D,$0D,$0D,$0D,$0D,$0D
    db $0D,$14,$04,$53,$63,$65,$6E,$61,$72,$69,$6F,$20,$77,$72,$69,$74
    db $74,$65,$6E,$20,$62,$79,$0D,$14,$09,$54,$6F,$6D,$6F,$79,$6F,$73
    db $68,$69,$20,$4D,$69,$79,$61,$7A,$61,$6B,$69,$0D,$0D,$0D,$0D,$0D
    db $0D,$0D,$14,$04,$50,$72,$6F,$67,$72,$61,$6D,$6D,$65,$64,$20,$62
    db $79,$0D,$14,$09,$4D,$61,$73,$61,$79,$61,$20,$48,$61,$73,$68,$69
    db $6D,$6F,$74,$6F,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$47,$72,$61
    db $70,$68,$69,$63,$73,$20,$64,$65,$73,$69,$67,$6E,$65,$64,$20,$62
    db $79,$0D,$14,$09,$4B,$6F,$75,$6A,$69,$20,$59,$6F,$6B,$6F,$74,$61
    db $0D,$14,$09,$4D,$61,$73,$61,$68,$69,$6B,$6F,$20,$54,$61,$6B,$61
    db $69,$0D,$14,$09,$54,$61,$6B,$65,$73,$68,$69,$20,$4D,$61,$74,$73
    db $75,$6D,$75,$72,$6F,$0D,$14,$09,$53,$68,$69,$6E,$74,$61,$72,$6F
    db $20,$4D,$61,$6A,$69,$6D,$61,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04
    db $4D,$75,$73,$69,$63,$20,$63,$6F,$6D,$70,$6F,$73,$65,$64,$20,$62
    db $79,$0D,$14,$09,$59,$75,$6B,$69,$68,$69,$64,$65,$20,$54,$61,$6B
    db $65,$6B,$61,$77,$61,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$4D,$75
    db $73,$69,$63,$20,$61,$72,$72,$61,$6E,$67,$65,$64,$20,$62,$79,$0D
    db $14,$09,$4B,$41,$5A,$5A,$20,$54,$4F,$59,$41,$4D,$41,$0D,$0D,$0D
    db $0D,$0D,$0D,$0D,$14,$04,$53,$6F,$75,$6E,$64,$20,$63,$72,$65,$61
    db $74,$65,$64,$20,$62,$79,$0D,$14,$09,$59,$6F,$75,$20,$48,$69,$6D
    db $65,$6E,$6F,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$4D,$75,$73,$69
    db $63,$20,$63,$6F,$6F,$72,$64,$69,$6E,$61,$74,$65,$64,$20,$62,$79
    db $0D,$14,$09,$41,$4D,$45,$4E,$49,$54,$59,$20,$43,$6F,$3A,$0D,$0D
    db $0D,$0D,$0D,$0D,$0D,$14,$04,$53,$63,$65,$6E,$61,$72,$69,$6F,$20
    db $61,$73,$73,$69,$73,$74,$61,$6E,$74,$0D,$14,$09,$54,$61,$74,$73
    db $75,$6F,$20,$48,$61,$73,$68,$69,$6D,$6F,$74,$6F,$0D,$0D,$0D,$0D
    db $0D,$0D,$0D,$0D,$14,$04,$45,$6E,$67,$6C,$69,$73,$68,$20,$54,$65
    db $78,$74,$20,$62,$79,$0D,$14,$09,$52,$6F,$62,$65,$72,$74,$20,$4C
    db $3A,$4A,$65,$72,$61,$75,$6C,$64,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
    db $14,$04,$2A,$2B,$2C,$2D,$2E,$2F,$20,$73,$74,$61,$66,$66,$0D,$14
    db $09,$52,$65,$69,$6B,$6F,$20,$54,$61,$6B,$65,$62,$61,$79,$61,$73
    db $68,$69,$0D,$14,$09,$41,$6B,$69,$72,$61,$20,$4B,$69,$74,$61,$6E
    db $6F,$68,$61,$72,$61,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$3B,$3C
    db $3D,$3E,$3F,$20,$73,$74,$61,$66,$66,$0D,$14,$09,$54,$61,$6B,$61
    db $6F,$20,$4B,$61,$77,$61,$67,$75,$63,$68,$69,$0D,$14,$09,$4B,$65
    db $69,$7A,$6F,$20,$4D,$6F,$63,$68,$69,$7A,$75,$6B,$69,$0D,$14,$09
    db $54,$65,$72,$75,$68,$69,$6B,$6F,$20,$48,$61,$6E,$61,$77,$61,$0D
    db $14,$09,$54,$65,$74,$73,$75,$72,$6F,$20,$53,$68,$69,$6D,$6F,$64
    db $61,$0D,$14,$09,$4D,$61,$73,$61,$68,$69,$72,$6F,$20,$48,$69,$72
    db $61,$73,$61,$77,$61,$0D,$14,$09,$4B,$65,$6E,$6A,$69,$72,$6F,$20
    db $4B,$61,$6E,$6F,$0D,$14,$09,$59,$61,$73,$75,$6B,$6F,$20,$53,$65
    db $6B,$69,$67,$75,$63,$68,$69,$0D,$14,$09,$4D,$69,$77,$61,$6B,$6F
    db $20,$4D,$61,$74,$73,$75,$6D,$6F,$74,$6F,$0D,$14,$09,$4B,$65,$69
    db $6B,$6F,$20,$54,$61,$67,$61,$0D,$0D,$14,$09,$48,$61,$6A,$69,$6D
    db $65,$20,$4B,$61,$6E,$69,$65,$0D,$14,$09,$45,$69,$69,$63,$68,$69
    db $20,$48,$69,$72,$61,$73,$61,$77,$61,$0D,$14,$09,$53,$68,$69,$6E
    db $6A,$69,$20,$46,$75,$74,$61,$6D,$69,$0D,$0D,$0D,$0D,$0D,$0D,$0D
    db $14,$04,$3B,$3C,$3D,$3E,$3F,$20,$41,$6D,$65,$72,$69,$63,$61,$20
    db $73,$74,$61,$66,$66,$0D,$14,$09,$4B,$65,$69,$6A,$69,$20,$48,$6F
    db $6E,$64,$61,$0D,$14,$09,$54,$73,$75,$6E,$65,$6F,$20,$4D,$6F,$72
    db $69,$74,$61,$0D,$14,$09,$50,$61,$75,$6C,$20,$42,$6F,$77,$6C,$65
    db $72,$0D,$14,$09,$50,$61,$75,$6C,$20,$48,$61,$6E,$64,$65,$6C,$6D
    db $61,$6E,$0D,$14,$09,$43,$68,$65,$72,$69,$65,$20,$48,$61,$73,$73
    db $6F,$6E,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$53,$70,$65,$63
    db $69,$61,$6C,$20,$74,$68,$61,$6E,$6B,$73,$20,$74,$6F,$0D,$14,$09
    db $52,$79,$75,$69,$63,$68,$69,$20,$4D,$6F,$72,$69,$79,$61,$0D,$14
    db $09,$4E,$61,$6F,$6B,$69,$20,$59,$61,$73,$75,$64,$61,$0D,$14,$09
    db $59,$6F,$73,$68,$69,$61,$6B,$69,$20,$55,$6A,$69,$69,$65,$0D,$14
    db $09,$53,$68,$69,$6E,$69,$63,$68,$69,$20,$4B,$6F,$75,$64,$61,$0D
    db $14,$09,$54,$61,$69,$6B,$69,$20,$4D,$6F,$63,$68,$69,$64,$61,$0D
    db $14,$09,$4D,$61,$73,$61,$68,$69,$72,$6F,$20,$45,$6E,$64,$6F,$0D
    db $14,$09,$41,$7A,$75,$6D,$69,$20,$49,$7A,$75,$6D,$69,$0D,$14,$09
    db $44,$61,$69,$20,$59,$61,$6D,$61,$6D,$6F,$74,$6F,$0D,$14,$09,$4B
    db $65,$69,$6B,$6F,$20,$48,$61,$74,$74,$6F,$72,$69,$0D,$14,$09,$4E
    db $6F,$62,$75,$79,$6F,$73,$68,$69,$20,$59,$6F,$73,$68,$69,$69,$0D
    db $14,$09,$4D,$69,$6B,$69,$20,$57,$61,$74,$61,$6E,$61,$62,$65,$0D
    db $14,$09,$48,$69,$72,$6F,$74,$6F,$6D,$6F,$20,$4D,$6F,$72,$69,$73
    db $61,$64,$61,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$41,$73,$73,$69
    db $73,$74,$61,$6E,$74,$20,$70,$72,$6F,$64,$75,$63,$65,$72,$0D,$14
    db $09,$4B,$61,$7A,$75,$6E,$6F,$72,$69,$20,$54,$61,$6B,$61,$64,$6F
    db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04,$44,$69,$72,$65,$63,$74,$65
    db $64,$20,$62,$79,$0D,$14,$09,$4D,$61,$73,$61,$79,$61,$20,$48,$61
    db $73,$68,$69,$6D,$6F,$74,$6F,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$04
    db $50,$72,$6F,$64,$75,$63,$65,$64,$20,$62,$79,$0D,$14,$09,$59,$61
    db $73,$75,$79,$75,$6B,$69,$20,$53,$6F,$6E,$65,$0D,$0D,$0D,$0D,$0D
    db $0D,$0D,$14,$04,$50,$75,$62,$6C,$69,$73,$68,$65,$64,$20,$62,$79
    db $0D,$14,$09,$59,$61,$73,$75,$68,$69,$72,$6F,$20,$46,$75,$6B,$75
    db $73,$68,$69,$6D,$61,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$09,$53,$6F
    db $75,$6C,$20,$42,$6C,$61,$7A,$65,$72,$0D,$14,$06,$43,$6F,$70,$79
    db $72,$69,$67,$68,$74,$20,$5B,$5C,$20,$31,$39,$39,$32,$0D,$14,$03
    db $5B,$5C,$20,$31,$39,$39,$32,$20,$3B,$3C,$3D,$3E,$3F,$20,$43,$4F
    db $50,$4F,$52,$41,$54,$49,$4F,$4E,$0D,$14,$03,$5B,$5C,$20,$31,$39
    db $39,$32,$20,$2A,$2B,$2C,$2D,$2E,$2F,$0D,$0D,$0D,$0D,$0D,$0D,$0D
    db $14,$04,$42,$61,$73,$65,$64,$20,$55,$70,$6F,$6E,$20,$53,$6F,$75
    db $6C,$20,$42,$6C,$61,$64,$65,$72,$0D,$14,$06,$43,$6F,$70,$79,$72
    db $69,$67,$68,$74,$20,$5B,$5C,$20,$31,$39,$39,$32,$0D,$14,$03,$5B
    db $5C,$20,$31,$39,$39,$32,$20,$3B,$3C,$3D,$3E,$3F,$20,$43,$4F,$50
    db $4F,$52,$41,$54,$49,$4F,$4E,$0D,$14,$03,$5B,$5C,$20,$31,$39,$39
    db $32,$20,$2A,$2B,$2C,$2D,$2E,$2F,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$14
    db $04,$4D,$75,$73,$69,$63,$20,$43,$6F,$70,$79,$72,$69,$67,$68,$74
    db $20,$5B,$5C,$20,$31,$39,$39,$32,$0D,$14,$03,$5B,$5C,$20,$31,$39
    db $39,$32,$20,$59,$75,$6B,$69,$68,$69,$64,$65,$20,$54,$61,$6B,$65
    db $6B,$61,$77,$61,$0D,$14,$03,$5B,$5C,$20,$31,$39,$39,$32,$20,$4B
    db $41,$5A,$5A,$20,$54,$4F,$59,$41,$4D,$41,$0D,$14,$03,$5B,$5C,$20
    db $31,$39,$39,$32,$20,$41,$4D,$45,$4E,$49,$54,$59,$20,$43,$6F,$3A
    db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$14,$05,$4C,$69,$63,$65,$6E,$73,$65
    db $64,$20,$62,$79,$20,$4E,$49,$4E,$54,$45,$4E,$44,$4F,$0D,$0D,$0D
    db $0D,$0D,$0D,$0D,$14,$06,$50,$72,$65,$73,$65,$6E,$74,$65,$64,$20
    db $62,$79,$20,$3B,$3C,$3D,$3E,$3F,$0D,$0D,$0D,$0D,$00

aTestLookup:
    db $A1

UNREACH_02E8A2:
    db $E9

UNREACH_02E8A3:
    db $AD

UNREACH_02E8A4:
    db $E9

UNREACH_02E8A5:
    db $B9

UNREACH_02E8A6:
    db $E9

UNREACH_02E8A7:
    db $C5

UNREACH_02E8A8:
    db $E9,$D1,$E9,$DD

UNREACH_02E8AC:
    db $E9,$E9,$E9,$F5,$E9,$01,$EA,$0D,$EA,$19,$EA,$25,$EA,$31,$EA,$3D
    db $EA,$49,$EA,$55,$EA,$61,$EA,$6D,$EA,$79,$EA,$85,$EA,$91,$EA,$9D
    db $EA,$A9,$EA,$B5,$EA,$C1,$EA,$E5,$EA,$F1,$EA,$FD,$EA,$09,$EB,$15
    db $EB,$21,$EB,$2D,$EB,$39,$EB,$45,$EB,$51,$EB,$CD,$EA,$D9,$EA,$00
    db $00,$00,$00,$00,$00,$5D,$EB,$69,$EB,$75,$EB,$81,$EB,$8D,$EB,$99
    db $EB,$B1,$EB,$BD,$EB,$C9,$EB,$D5,$EB,$E1,$EB,$ED,$EB,$A5,$EB,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F9,$EB,$05
    db $EC,$11,$EC,$1D,$EC,$29,$EC,$35,$EC,$41,$EC,$4D,$EC,$59,$EC,$65
    db $EC,$71,$EC,$7D,$EC,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$89,$EC,$95,$EC,$A1,$EC,$AD,$EC,$B9,$EC,$C5
    db $EC,$D1,$EC,$DD,$EC,$E9,$EC,$F5,$EC,$01,$ED,$0D,$ED,$19,$ED,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$25,$ED,$31
    db $ED,$3D,$ED,$49,$ED,$55,$ED,$61,$ED,$6D,$ED,$79,$ED,$85,$ED,$91
    db $ED,$9D,$ED,$A9,$ED,$B5,$ED,$C1,$ED,$CD,$ED,$D9,$ED,$00,$00,$00
    db $00,$00,$00,$00,$00,$E5,$ED,$F1,$ED,$FD,$ED,$09,$EE,$15,$EE,$21
    db $EE,$00,$00,$00,$00,$17,$00,$80,$00,$E4,$0F,$09,$11,$11,$11,$11
    db $20,$17,$12,$82,$43,$24,$8F,$09,$11,$11,$00,$00,$20,$15,$00,$80
    db $00,$64,$0F,$09,$11,$11,$00,$00,$20,$15,$00,$80,$00,$64,$0F,$09
    db $11,$11,$00,$00,$20,$15,$00,$80,$81,$64,$0F,$09,$11,$11,$00,$00
    db $20,$17,$00,$80,$02,$24,$0F,$09,$11,$11,$12,$12,$00,$17,$00,$80
    db $02,$24,$0F,$09,$11,$11,$12,$12,$00,$17,$00,$80,$82,$24,$0F,$09
    db $11,$11,$00,$00,$00,$17,$00,$80,$82,$64,$0F,$09,$11,$11,$00,$00
    db $00,$17,$00,$80,$82,$24,$0F,$09,$11,$11,$00,$00,$00,$17,$00,$80
    db $82,$64,$0F,$09,$11,$11,$00,$00,$A0,$17,$00,$80,$82,$24,$0F,$09
    db $11,$11,$00,$00,$00,$17,$00,$80,$82,$64,$0F,$09,$11,$11,$00,$00
    db $C0,$15,$00,$80,$00,$64,$0F,$09,$11,$11,$00,$00,$00,$17,$00,$80
    db $00,$24,$0F,$09,$11,$11,$12,$12,$A0,$17,$00,$80,$00,$24,$0F,$09
    db $11,$11,$11,$11,$00,$15,$00,$80,$95,$24,$0F,$0F,$11,$11,$00,$00
    db $00,$17,$00,$80,$00,$E4,$0F,$09,$11,$11,$00,$00,$00,$04,$00,$80
    db $00,$04,$00,$09,$11,$11,$00,$00,$00,$16,$00,$80,$82,$24,$8F,$09
    db $11,$11,$00,$00,$20,$17,$00,$80,$00,$E4,$0F,$09,$11,$11,$11,$11
    db $21,$17,$12,$82,$01,$26,$8F,$09,$11,$11,$00,$00,$21,$15,$00,$80
    db $00,$24,$0F,$09,$11,$11,$11,$11,$21,$15,$00,$80,$00,$64,$0F,$09
    db $11,$11,$11,$11,$21,$15,$00,$80,$00,$64,$0F,$09,$11,$11,$11,$11
    db $21,$15,$00,$80,$00,$24,$0F,$09,$11,$11,$11,$11,$A1,$17,$12,$82
    db $01,$26,$8F,$09,$11,$11,$00,$00,$A1,$17,$00,$80,$00,$64,$03,$09
    db $11,$11,$00,$00,$01,$17,$00,$80,$00,$24,$03,$09,$11,$11,$00,$00
    db $01,$17,$00,$80,$00,$24,$03,$09,$11,$11,$00,$00,$01,$15,$02,$82
    db $83,$24,$03,$09,$11,$11,$11,$11,$01,$17,$00,$80,$00,$24,$03,$09
    db $11,$11,$11,$00,$01,$17,$00,$80,$00,$24,$03,$09,$11,$11,$11,$00
    db $01,$17,$00,$80,$00,$24,$03,$09,$11,$11,$11,$00,$01,$15,$00,$80
    db $00,$24,$03,$09,$11,$11,$11,$11,$01,$15,$02,$82,$83,$64,$0F,$09
    db $11,$11,$11,$11,$01,$15,$00,$80,$00,$64,$0F,$09,$11,$11,$11,$11
    db $C1,$17,$00,$80,$00,$E4,$0F,$09,$11,$11,$11,$11,$22,$17,$00,$80
    db $02,$24,$0F,$09,$11,$11,$00,$12,$22,$17,$12,$82,$03,$24,$8C,$09
    db $11,$11,$12,$12,$02,$17,$12,$82,$03,$24,$8C,$09,$11,$11,$12,$12
    db $02,$15,$00,$80,$00,$64,$0F,$09,$11,$11,$02,$02,$22,$17,$12,$82
    db $03,$24,$8C,$09,$11,$11,$12,$12,$A2,$17,$12,$82,$03,$24,$8C,$09
    db $11,$11,$12,$12,$02,$17,$00,$80,$02,$24,$03,$09,$11,$11,$11,$11
    db $02,$17,$00,$80,$02,$24,$03,$09,$11,$11,$11,$11,$02,$17,$03,$80
    db $03,$24,$03,$09,$11,$11,$11,$11,$02,$17,$12,$82,$43,$24,$8C,$09
    db $11,$11,$00,$00,$02,$17,$00,$80,$02,$24,$03,$09,$11,$11,$12,$12
    db $C2,$17,$00,$80,$02,$24,$03,$09,$11,$11,$12,$12,$A2,$17,$00,$80
    db $00,$E4,$0F,$09,$11,$11,$11,$11,$23,$15,$00,$80,$03,$24,$03,$09
    db $11,$11,$00,$12,$23,$17,$00,$80,$02,$24,$03,$09,$11,$11,$12,$01
    db $03,$17,$00,$80,$A2,$24,$0F,$09,$11,$11,$12,$02,$03,$17,$00,$80
    db $A2,$24,$0F,$09,$11,$11,$12,$02,$A3,$17,$00,$80,$02,$24,$03,$09
    db $11,$11,$14,$14,$03,$17,$00,$80,$02,$24,$03,$09,$11,$11,$11,$11
    db $03,$17,$00,$80,$02,$24,$03,$09,$11,$11,$11,$11,$A3,$17,$00,$80
    db $02,$64,$03,$09,$11,$11,$11,$11,$C3,$15,$00,$80,$02,$24,$03,$09
    db $11,$11,$12,$12,$03,$17,$00,$80,$02,$26,$8F,$09,$11,$11,$14,$14
    db $03,$17,$00,$80,$02,$24,$0F,$09,$11,$11,$12,$12,$03,$17,$00,$80
    db $00,$E4,$0F,$09,$11,$11,$11,$11,$24,$17,$00,$80,$02,$24,$03,$09
    db $11,$11,$12,$12,$24,$17,$00,$80,$02,$24,$03,$09,$11,$11,$12,$12
    db $24,$15,$00,$80,$02,$64,$03,$09,$11,$11,$12,$12,$24,$15,$00,$80
    db $02,$64,$03,$09,$11,$11,$12,$12,$24,$17,$00,$80,$02,$24,$03,$09
    db $11,$11,$12,$12,$A4,$17,$00,$80,$02,$35,$03,$09,$11,$11,$12,$12
    db $04,$17,$12,$82,$43,$26,$8F,$09,$11,$11,$11,$11,$04,$17,$00,$80
    db $02,$35,$0F,$09,$11,$11,$12,$12,$04,$15,$00,$80,$02,$24,$0F,$09
    db $11,$11,$12,$12,$C4,$17,$12,$82,$43,$26,$8F,$09,$11,$11,$11,$11
    db $A4,$17,$00,$80,$02,$B6,$0F,$09,$11,$11,$11,$11,$04,$17,$00,$80
    db $02,$B6,$0F,$09,$11,$11,$11,$11,$04,$17,$00,$80,$00,$E4,$0F,$09
    db $11,$11,$11,$11,$25,$17,$00,$80,$00,$24,$0F,$09,$11,$11,$11,$11
    db $25,$15,$00,$80,$02,$24,$03,$09,$11,$11,$01,$01,$05,$17,$00,$80
    db $00,$B6,$0F,$09,$11,$11,$11,$11,$05,$17,$00,$80,$00,$B6,$0F,$09
    db $11,$11,$11,$11,$05,$17,$00,$80,$00,$B6,$0F,$09,$11,$11,$11,$11
    db $A5,$15,$00,$80,$02,$24,$03,$09,$11,$11,$01,$01,$05,$17,$00,$82
    db $00,$B6,$0F,$09,$11,$11,$11,$11,$05,$15,$00,$80,$02,$24,$03,$09
    db $11,$11,$02,$02,$05,$17,$00,$80,$00,$B6,$0F,$09,$11,$11,$11,$11
    db $05,$17,$00,$80,$00,$B6,$0F,$09,$11,$11,$11,$11,$05,$15,$00,$80
    db $02,$24,$03,$09,$11,$11,$02,$02,$05,$17,$00,$80,$02,$24,$03,$09
    db $11,$11,$11,$01,$05,$17,$00,$80,$02,$24,$0F,$09,$11,$11,$11,$11
    db $25,$17,$12,$82,$43,$26,$8F,$09,$11,$11,$01,$11,$C5,$17,$12,$82
    db $43,$26,$8F,$09,$11,$11,$01,$11,$A5,$17,$00,$80,$03,$E4,$0F,$09
    db $11,$11,$11,$11,$26,$17,$02,$82,$43,$24,$0F,$09,$11,$11,$00,$12
    db $06,$17,$02,$82,$43,$24,$0F,$09,$11,$11,$00,$12,$06,$17,$02,$82
    db $43,$24,$0F,$09,$11,$11,$11,$11,$06,$15,$00,$80,$01,$64,$0F,$09
    db $11,$11,$00,$00,$06,$17,$00,$80,$82,$74,$03,$09,$11,$11,$11,$11
    db $06

UNREACH_02EE2D:
    db $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07

UNREACH_02EE3D:
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    db $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
    db $09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09
    db $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
    db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A
    db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
    db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
    db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10
    db $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10

UNREACH_02F28D:
    db $01

UNREACH_02F28E:
    db $0F

UNREACH_02F28F:
    db $00

UNREACH_02F290:
    db $00

UNREACH_02F291:
    db $10

UNREACH_02F292:
    db $01

UNREACH_02F293:
    db $1F

UNREACH_02F294:
    db $00

UNREACH_02F295:
    db $D0,$01,$0F,$00,$3F,$10,$01,$1F,$3F,$D0,$01,$0F,$00,$00,$2F,$40
    db $03,$00,$EF,$01,$0F,$00,$1D,$12,$06,$1D,$1D,$D2,$00,$FF,$00,$05
    db $06,$01,$01,$00,$0F,$00,$FF,$00,$07,$08,$01,$01,$03,$0F,$00,$00
    db $02,$07,$08,$01,$01,$00,$0F,$00,$24,$02,$09,$06,$01,$01,$00,$0F
    db $06,$32,$02,$0B,$30,$02,$04,$1C,$00,$06,$32,$02,$0F,$36,$01,$01
    db $1E,$00,$14,$3B,$02,$05,$06,$01,$01,$00,$0F,$14,$70,$02,$09,$06
    db $01,$01,$00,$0F,$18,$41,$02,$0D,$08,$01,$02,$00,$0E,$28,$2A,$00
    db $05,$06,$01,$01,$00,$0F,$28,$78,$02,$09,$06,$01,$01,$00,$0F,$3C
    db $F9,$02,$05,$06,$01,$01,$00,$0F,$3C,$E4,$02,$09,$06,$01,$01,$00
    db $0F,$50,$1C,$03,$05,$06,$01,$01,$00,$0F,$50,$2D,$03,$09,$06,$01
    db $01,$00,$0F,$64,$6A,$03,$05,$06,$01,$01,$00,$0F,$64,$93,$03,$09
    db $06,$01,$01,$00,$0F,$78,$97,$03,$05,$06,$01,$01,$00,$0F,$78,$A2
    db $03,$09,$06,$01,$01,$00,$0F,$16,$20,$00,$05,$0B,$05,$04,$11,$00
    db $16,$1F,$00,$08,$12,$01,$01,$19,$00,$16,$4F,$00,$08,$12,$01,$01
    db $19,$01,$16,$74,$02,$18,$15,$03,$04,$16,$00,$23,$61,$02,$19,$19
    db $01,$01,$19,$1A,$23,$61,$02,$19,$0C,$01,$02,$19,$12,$15,$75,$02
    db $1B,$06,$03,$03,$0D,$08,$24,$58,$02,$1D,$09,$01,$01,$1C,$5C,$24
    db $58,$02,$0F,$05,$02,$02,$0E,$09,$33,$7C,$02,$05,$43,$01,$08,$0A
    db $43,$33,$7C,$02,$05,$41,$01,$02,$06,$41,$33,$7C,$02,$05,$40,$01
    db $01,$0A,$40,$33,$7C,$02,$0E,$15,$01,$01,$0E,$14,$33,$7C,$02,$02
    db $34,$02,$01,$02,$33,$34,$79,$02,$07,$2A,$05,$04,$00,$3C,$72,$FF
    db $00,$1B,$17,$02,$04,$01,$2C,$71,$FF,$00,$17,$22,$01,$01,$17,$21
    db $0F,$50,$02,$00,$10,$10,$0B,$00,$20,$0F,$95,$03,$10,$06,$0E,$0A
    db $10,$26,$0F,$03,$03,$0D,$0A,$08,$06,$10,$20,$0F,$FC,$00,$0D,$00
    db $02,$09,$00,$00,$2C,$31,$00,$09,$07,$04,$02,$00,$0E,$2D,$BB,$02
    db $05,$1F,$01,$01,$02,$22,$3D,$3E,$00,$1F,$2E,$04,$02,$20,$2C,$3D
    db $3E,$00,$18,$2E,$06,$02,$18,$2C,$3D,$3E,$00,$11,$2E,$06,$02,$11
    db $2C,$55,$26,$03,$01,$08,$11,$05,$01,$68,$55,$26,$03,$03,$03,$12
    db $04,$03,$63,$73,$FF,$00,$1B,$17,$02,$04,$01,$2C,$73,$FF,$00,$17
    db $22,$01,$01,$17,$21,$65,$46,$00,$00,$12,$01,$2B,$00,$D2,$65,$46
    db $00,$3F,$12,$01,$2B,$3F,$D2,$65,$46,$00,$00,$3C,$40,$04,$00,$FC
    db $65,$8C,$03,$1D,$12,$05,$01,$1D,$92,$42,$E7,$02,$12,$2E,$0E,$08
    db $20,$40,$15,$5C,$02,$02,$20,$01,$02,$0D,$25,$0E,$FA,$00,$0F,$34
    db $04,$02,$0F,$2E,$0E,$FF,$00,$19,$2F,$01,$01,$19,$2E,$7B,$50,$00
    db $08,$00,$10,$0C,$08,$40,$7B,$50,$00,$06,$00,$02,$03,$06,$40,$7B
    db $50,$00,$18,$00,$02,$03,$18,$40,$13,$FF,$00,$23,$23,$13,$0B,$23
    db $E3,$13,$FF,$00,$34,$29,$02,$02,$2B,$E5,$13,$FF,$00,$35,$28,$01
    db $01,$35,$ED,$13,$FF,$00,$35,$2B,$01,$01,$35,$E6,$13,$FF,$00,$34
    db $2B,$01,$01,$33,$EA,$13,$FF,$00,$36,$1A,$08,$0C,$36,$9A,$FF

UNREACH_02F504:
    db $06

UNREACH_02F505:
    db $0B

UNREACH_02F506:
    db $04

UNREACH_02F507:
    db $03

UNREACH_02F508:
    db $20,$00

UNREACH_02F50A:
    db $B0,$00,$0D,$0B,$06,$03,$30,$01,$B0,$00,$0E,$0C,$04,$02,$70,$00
    db $C0,$00,$0E,$00,$01,$09,$20,$01,$00,$00,$06,$0B,$04,$03,$20,$00
    db $B0,$00

UNREACH_02F52C:
    db $01

UNREACH_02F52D:
    db $01,$04,$04,$01,$01,$01,$01,$01,$01,$05,$04,$04,$04,$01,$04,$04
    db $01,$02,$02,$01,$01,$01,$04,$01,$01,$01,$01,$04,$04,$02,$02,$01
    db $01,$02,$01,$01,$01,$04,$04,$01,$01,$03,$03,$02,$02,$01,$01,$01
    db $01,$02,$06,$02,$02,$03,$03,$04,$04,$02,$02,$03,$03,$04,$04,$03
    db $03,$04,$04,$02,$01,$02,$02,$03,$03,$00,$00,$00,$00,$00,$00,$01
    db $01,$04,$04,$08,$03,$01,$02,$02,$01,$08,$04,$04,$04,$03,$03,$04
    db $04,$04,$04,$01,$05,$01,$05,$08,$04,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$01,$01,$04,$04,$03,$04,$03,$03,$03
    db $03,$03,$04,$03,$04,$03,$04,$02,$01,$03,$03,$02,$06,$04,$04,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
    db $01,$02,$02,$02,$02,$01,$01,$02,$01,$02,$02,$04,$04,$02,$06,$04
    db $04,$02,$02,$02,$06,$04,$04,$04,$04,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$01,$01,$04,$04,$03,$03,$03,$03,$04
    db $04,$04,$04,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03
    db $02,$03,$03,$03,$03,$03,$03,$00,$00,$00,$00,$00,$00,$00,$00,$01
    db $01,$03,$06,$02,$04,$02,$04,$01,$03,$01,$01,$00,$00,$00,$00

UNREACH_02F62C:
    db $00

UNREACH_02F62D:
    db $01,$01,$01,$01,$02,$01,$03,$01,$04,$02,$01,$02,$02,$03,$01,$03
    db $02,$03,$03,$03,$04,$03,$05,$03,$06,$00,$08,$02,$03,$00,$09,$00
    db $0A,$00,$0B,$00,$0C,$00,$0D,$00,$02,$04,$01,$04,$02,$04,$03,$04
    db $04,$05,$01,$05,$02,$05,$03,$05,$04,$05,$05,$05,$06,$05,$07,$05
    db $08,$05,$09,$05,$0A,$04,$05,$04,$06,$00,$00,$00,$00,$00,$00,$00
    db $03,$06,$01,$07,$01,$07,$02,$07,$03,$07,$04,$08,$01,$08,$02,$08
    db $03,$08,$04,$09,$01,$09,$02,$07,$05,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$04,$0A,$01,$0B,$01,$0B,$02,$0B
    db $03,$0B,$04,$0B,$05,$0B,$06,$0B,$07,$0C,$01,$0C,$02,$0C,$03,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $05,$0D,$01,$0D,$02,$0D,$03,$0D,$04,$0D,$05,$0E,$01,$0E,$02,$0E
    db $03,$0E,$04,$0E,$05,$0F,$01,$0F,$02,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$06,$10,$01,$11,$01,$11,$02,$11
    db $03,$11,$04,$12,$01,$12,$02,$12,$03,$12,$04,$12,$05,$12,$06,$12
    db $07,$13,$01,$13,$02,$13,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $07,$14,$01,$14,$02,$14,$03,$15,$01,$15,$02,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$80,$00,$00,$00,$40,$80,$00,$00,$00,$20,$00,$00,$01
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$40,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$04
    db $20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80
    db $04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$81,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FB,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$02,$04,$00,$00,$01,$00,$00,$00,$00,$01,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$08,$01,$00,$00,$02,$00,$00,$00,$40,$00,$00,$00,$80
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$02,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $02,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$80,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00
    db $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$24,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$10
    db $08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$80,$04,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$86,$00,$00,$00,$01,$88,$00,$00,$00,$00,$00,$00,$10
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$05,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$02,$00,$00,$00,$40,$00,$00,$00,$40,$00,$00,$00,$80
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$80,$00,$00,$02,$00,$00,$00,$00
    db $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $08,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$40,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $02,$00,$80,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$02,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$02,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    db $FF,$FF,$FF,$00,$00,$08,$04,$00,$00,$20,$04,$00,$00,$10,$02,$00
    db $00,$D0,$11,$00,$00,$39,$5D,$00,$00,$90,$6A,$10,$00,$09,$07,$08
    db $00,$84,$EE
