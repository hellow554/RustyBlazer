COP_TEMP = $7E0038 ; COP_TEMP contains the address of the COP arguments stored directly after the `COP xx` opcode

Native_mode_COP:
    SEP #$20
    TXY
    LDA.B $04,S
    STA.B $3A
    REP #$20
    LDA.B $02,S
    DEC A
    STA.B COP_TEMP
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    ASL A
    TAX
    JMP.W (.jump_table, X)


.jump_table:
    dw .cop_00, .cop_01, .cop_02, cop_03, cop_04, cop_05, cop_06, cop_07
    dw cop_08, cop_09, cop_0A, cop_0B, cop_0C, cop_0D, $000000, $000000
    dw cop_10, cop_11, cop_12, cop_13, cop_14, cop_15, cop_16, cop_17
    dw cop_18, cop_19, cop_1A, cop_1B, cop_1C, cop_1D, cop_1E, cop_1F
    dw cop_20, cop_21, cop_22, cop_23, cop_24, cop_25, cop_26, cop_27
    dw cop_28, cop_29, cop_2A, cop_2B, $000000, $000000, cop_2E, cop_2F
    dw cop_30, cop_31, cop_32, cop_33, cop_34, cop_35, cop_36, cop_37
    dw cop_38, cop_39, cop_3A, cop_3B, cop_3C, $000000, $000000, $00000
    dw $000000, $000000, $000000, $000000, $00FFFF, $00FFFF, $00FFFF, $0FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF, $00FFFF, $00FFFF, $00FFFF, $0FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF, $000000, $000000, $000000, $00000
    dw $000000, $000000, $000000, $000000, $000000, $000000, $000000, $00000
    dw $000000, $000000, $000000, $000020, $00FFFF, $00FFFF, $00FFFF, $0FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF, $00FFFF, $00FFFF, $00FFFF, $0FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF, $000000, $000000, $000000, $00000
    dw $000000, $000000, $000000, $000000, $000000, $000000, $000000, $00000
    dw cop_80, cop_81, cop_82, cop_83, cop_84, cop_85, cop_86, cop_87
    dw cop_88, cop_89, cop_8A, cop_8B, cop_8C, cop_8D, cop_8E, cop_8F
    dw cop_90, cop_91, cop_92, cop_93, cop_94, cop_95, cop_96, cop_97
    dw cop_98, cop_99, cop_9A, cop_9B, cop_9C, cop_9D, cop_9E, cop_9F
    dw cop_A0, cop_A1, cop_A2, cop_A3, cop_A4, cop_A5, cop_A6, cop_A7
    dw cop_A8, cop_A9, cop_AA, cop_AB, cop_AC, cop_AD, cop_AE, cop_AF
    dw cop_B0, cop_B1, cop_B2

.cop_00: ; NOP - not used afaict
    TYX
    BRL cop_ret_ret

.cop_01: ; print text pointed at by 2 byte argument
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    TAY
    SEP #$20
    PHX
    PHB
    %SwitchToBank(COP_TEMP+2)
    JSL.L printOsdStringFromBankX
    PLB
    PLX
    REP #$20
    BRL cop_skip0


.cop_02: ; yes/no choice, jump to second argument, if no was chosen
    TYX
    PHX
    LDY.W #$CF02
    JSL.L printOsdStringFromBank2
    SEP #$20
    LDA.B #$00
    XBA
    LDA.B #$02
    JSL.L printAndRunChoiceBox
    PHP
    LDX.W textboxTLC
    JSL.L clearTextbox
    LDA.B #$01
    STA.W $03B8
    PLP
    REP #$20
    PLX
    BCS +
    AND.W #$00FF
    BNE +
    BRL cop_skip2


+:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_03:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $002E,X
    LDA.B COP_TEMP
    STA.W $002C,X
    STA.W $0018,X
    BRL cop_ret_in_a


cop_04:
    TYX
    DEC.W $002E,X
    BNE CODE_00D814
    BRL cop_skip0


CODE_00D814:
    LDA.W $002C,X
    STA.W $0018,X
    BRL cop_ret_ret


cop_05:
    TYX
    LDA.B [COP_TEMP]
    BMI CODE_00D829
    JSR.W checkGameStateBit
    BCC CODE_00D82E
    BRA CODE_00D835


CODE_00D829:
    JSR.W checkGameStateBit
    BCC CODE_00D835

CODE_00D82E:
    DEC.B COP_TEMP
    DEC.B COP_TEMP
    BRL CODE_00E4C4


CODE_00D835:
    BRL cop_skip2


cop_06:
    TYX
    LDA.B [COP_TEMP]
    BRL cop_ret_in_a


cop_07:
    TYX
    LDA.B [COP_TEMP]
    BRA CODE_00D849


cop_08:
    TYX
    LDA.B [COP_TEMP]
    EOR.W #$8000

CODE_00D849:
    BMI CODE_00D852
    JSR.W checkGameStateBit
    BCS CODE_00D857
    BRA CODE_00D85A


CODE_00D852:
    JSR.W checkGameStateBit
    BCS CODE_00D85A

CODE_00D857:
    BRL cop_skip4


CODE_00D85A:
    INC.B COP_TEMP
    INC.B COP_TEMP
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_09:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    JSR.W setResetGameStateBit
    BRL cop_skip0


cop_0A:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W checkIfItemIsEquipped
    BCC CODE_00D885
    JSL.L giveItem

CODE_00D885:
    BRL cop_skip0


cop_0B:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W checkIfItemIsEquipped
    BCS CODE_00D8A6
    SEP #$20
    BPL CODE_00D89E
    AND.B #$7F
    STZ.W playerEquippedItem

CODE_00D89E:
    EOR.W inventoryWeapons,Y
    STA.W inventoryWeapons,Y
    REP #$20

CODE_00D8A6:
    BRL cop_skip0


cop_0C:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E617
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E628
    STA.B $00

CODE_00D8C0:
    LDA.W $0000,X
    SEC
    SBC.B $00
    STA.B $16
    LDA.B $00
    ASL A
    CLC
    ADC.W $0010,X
    SEC
    SBC.W #$000F
    STA.B $18
    LDA.W $0000,Y
    SEC
    SBC.B $16
    CMP.B $18
    BCC CODE_00D8E2
    BRL cop_skip2


CODE_00D8E2:
    LDA.W $0002,X
    CLC
    ADC.B $00
    STA.B $16
    LDA.B $00
    ASL A
    CLC
    ADC.W $0012,X
    SEC
    SBC.W #$000F
    STA.B $18
    LDA.B $16
    SEC
    SBC.W $0002,Y
    CMP.B $18
    BCC CODE_00D904
    BRL cop_skip2


CODE_00D904:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_0D:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E617
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E628
    CMP.W $0000,Y
    BEQ CODE_00D92A
    BRL cop_skip3


CODE_00D92A:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    INC A
    JSR.W CODE_00E628
    CMP.W $0002,Y
    BEQ CODE_00D93D
    BRL cop_skip2


CODE_00D93D:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_10:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    XBA
    STA.W zwSceneId
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $0380
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $037C
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $037E
    BRL cop_skip0


cop_11:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E617
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E628
    STA.W $0000,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E628
    STA.W $0002,Y
    PHX
    TYX
    JSR.W CODE_00E5A7
    PLX
    BRL cop_skip0


cop_12:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E617
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    BRL cop_skip0


cop_13:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E617
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0030,Y
    BRL cop_skip0


cop_14:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    JSR.W CODE_00E62D
    LDY.W #$1ADE
    JSL.L checkForSealedLair
    BCC CODE_00D9F1
    LDA.W $0016,X
    AND.W #$DFFF
    STA.W $0016,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


CODE_00D9F1:
    BRL cop_skip2


cop_15:
    TYX
    JSR.W CODE_00E537
    BRL cop_skip0


cop_16:
    TYX
    JSR.W CODE_00E5A7
    BRL cop_skip0


cop_17:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0030,X
    BRL cop_skip0


cop_18:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W checkIfItemIsEquipped
    BCS CODE_00DA1F
    BRL cop_skip2


CODE_00DA1F:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_19:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W checkIfItemIsEquipped
    BCS CODE_00DA3A
    BPL CODE_00DA3A
    BRL cop_skip2


CODE_00DA3A:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_1A:
    TYX
    PHX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    TAY
    JSL.L printOsdStringFromBank2
    SEP #$20
    LDA.B #$00
    XBA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    BNE CODE_00DA5D
    INC.B $39

CODE_00DA5D:
    JSL.L printAndRunChoiceBox
    PHA
    PHP
    LDX.W textboxTLC
    JSL.L clearTextbox
    LDA.B #$01
    STA.W $03B8
    PLP
    PLA
    REP #$20
    PLX
    BCS CODE_00DA7F
    AND.W #$00FF
    STA.W $03D0
    BRL cop_skip2


CODE_00DA7F:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_1B:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0014,X
    BRL cop_ret_ret


cop_1C:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    AND.W $0016,X
    BNE CODE_00DAAD
    BRL cop_skip2


CODE_00DAAD:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_1D:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    ORA.W $0016,X
    STA.W $0016,X
    BRL cop_skip0


cop_1E:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    AND.W $0016,X
    STA.W $0016,X
    BRL cop_skip0


cop_1F:
    PHY
    SEP #$20
    LDX.W #$000F
    LDA.B #$00
    XBA
    CLC

CODE_00DAE0:
    LDA.W $0302,X
    ADC.W $0301,X
    STA.W $0301,X
    DEX
    BNE CODE_00DAE0
    LDX.W #$0010

CODE_00DAEF:
    INC.W $0301,X
    BNE CODE_00DAF7
    DEX
    BNE CODE_00DAEF

CODE_00DAF7:
    REP #$20
    PLX
    BRL cop_skip0


cop_20:
    TYX
    LDA.W player_pos_x_real
    ORA.W player_pos_y_real
    AND.W #$000F
    BEQ CODE_00DB12
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


CODE_00DB12:
    BRL cop_skip2


cop_21:
    TYX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    SEC
    SBC.W $0012,X
    STA.B $18
    BRL CODE_00DBD0


cop_22:
    TYX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    STA.B $18
    BRL CODE_00DBD0


cop_23:
    TYX
    LDA.W $0000,X
    SEC
    SBC.W #$0010
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    BRL CODE_00DBD0


cop_24:
    TYX
    LDA.W $0000,X
    CLC
    ADC.W $0010,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    BRL CODE_00DBD0


cop_25:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    JSL.L addGold
    LDA.W #$0010
    TSB.W updateHudBitfield
    BRL cop_skip0


cop_26:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    LDY.W playerEquippedItem
    CPY.W #$0040
    BNE CODE_00DB8D
    LDA.W #$0000
    BRA CODE_00DB99


CODE_00DB8D:
    LDY.W playerEquippedArmor
    CPY.W #$000C
    BNE CODE_00DB99
    LSR A
    BNE CODE_00DB99
    INC A

CODE_00DB99:
    JSL.L subtractGold
    BCS CODE_00DBA8
    LDA.W #$0010
    TSB.W updateHudBitfield
    BRL cop_skip2


CODE_00DBA8:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_27:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,X
    STZ.W $0014,X
    BRL cop_ret_ret


cop_28:
    TYX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18

CODE_00DBD0:
    PHX
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    PLX
    AND.W #$00FF
    BNE CODE_00DBE2
    BRL cop_skip2


CODE_00DBE2:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_29:
    TYX
    LDA.W $0000,X
    STA.B $16
    LDA.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    PHX
    JSL.L zCalculateCurrentPositionAndActIdSomething
    SEP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    BNE CODE_00DC09
    INC.B $39

CODE_00DC09:
    CMP.L $7E8000,X
    REP #$20
    BNE CODE_00DC15
    PLX
    BRL cop_skip2


CODE_00DC15:
    PLX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_2A:
    TYX
    PHX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.B $16
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    ORA.W #$00F0
    STA.L $7F8000,X
    PLX
    BRL cop_skip0


cop_2B:
    TYX
    PHX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.B $16
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    AND.W #$FF00
    STA.L $7F8000,X
    PLX
    BRL cop_skip0


cop_2E:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    JSR.W CODE_00E617
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.B $00
    BRL CODE_00D8C0


cop_2F:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.B $16
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.B $18
    LDY.W $039C
    LDA.W $0000,Y
    CLC
    ADC.B $16
    STA.W $0000,Y
    LDA.W $0002,Y
    CLC
    ADC.B $18
    STA.W $0002,Y
    LDA.W $003E,Y
    TAY
    LDA.W $0000,Y
    CLC
    ADC.B $16
    STA.W $0000,Y
    LDA.W $0002,Y
    CLC
    ADC.B $18
    STA.W $0002,Y
    BRL cop_skip0


cop_30:
    TYX
    LDA.W lairRevealInProgress
    BNE CODE_00DCDF
    BRL cop_skip5


CODE_00DCDF:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CMP.W revealingLairId
    BEQ CODE_00DCED
    BRL cop_skip3


CODE_00DCED:
    BRL cop_85


cop_31:
    TYX
    JSR.W CODE_00E662
    LDA.W #$AC9B
    STA.W $0018,Y
    SEP #$20
    LDA.B #$00
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $0030,Y
    BRL cop_skip0


cop_32:
    TYX
    JSR.W CODE_00E662
    LDA.W #$ACCB
    STA.W $0018,Y
    SEP #$20
    LDA.B #$00
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $0030,Y
    BRL cop_skip0


cop_33:
    TYX
    LDY.W $039C
    JSR.W CODE_00DD49
    LDY.W $039E
    JSR.W CODE_00DD49
    LDY.W $03A0
    JSR.W CODE_00DD49
    STZ.W $0464
    BRL cop_skip0


CODE_00DD49:
    LDA.W $001A,Y
    AND.W #$FF7F
    STA.W $001A,Y
    RTS


cop_34:
    TYX
    LDY.W $039C
    JSR.W CODE_00DD6C
    LDY.W $039E
    JSR.W CODE_00DD6C
    LDY.W $03A0
    JSR.W CODE_00DD6C
    INC.W $0464
    BRL cop_skip0


CODE_00DD6C:
    LDA.W $001A,Y
    ORA.W #$0080
    STA.W $001A,Y
    RTS


cop_35:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.B $00
    LDA.W $0302
    AND.W #$00FF

CODE_00DD86:
    SEC
    SBC.B $00
    BPL CODE_00DD86
    CLC
    ADC.B $00
    STA.W $0437
    BRL cop_skip0


cop_36:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    SED
    CLC
    ADC.W playerExp
    STA.W playerExp
    LDA.W $1B7A
    ADC.W #$0000
    STA.W $1B7A
    CLD
    BRL cop_skip0


cop_37:
    TYX
    LDA.W playerMaxHealth
    SEC
    SBC.W playerCurrentHealth
    STA.W bPlayerHealthRestore
    BRL cop_skip0


cop_38:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $043D
    BRL cop_skip0


cop_39:
    TYX
    PHX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    PHA
    LDA.W playerCurrentHealth
    SEC
    SBC.B $01,S
    BPL CODE_00DDE1
    LDA.B #$00

CODE_00DDE1:
    STA.W playerCurrentHealth
    PLA
    REP #$20
    LDA.W #$0004
    TSB.W updateHudBitfield
    LDX.W $039C
    LDA.W #$FFE0
    STA.W $0026,X
    BRK #$04
    LDA.W $0016,X
    ORA.W #$0800
    STA.W $0016,X
    PLX
    BRL cop_skip0


cop_3A:
    TYX
    JSL.L enterPlayerNameMenu
    BRL cop_skip0


cop_3B:
    TYX
    LDA.B [COP_TEMP]
    JSR.W CODE_00E62D
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAY
    LDA.W UNREACH_01BA2B,Y
    BEQ CODE_00DE27
    LDY.W #$1ADE
    JSL.L checkForSealedLair
    BCC CODE_00DE4B

CODE_00DE27:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    LDY.W #$1ADE
    JSL.L checkForSealedLair
    BCC CODE_00DE48
    LDA.W $0016,X
    AND.W #$DFFF
    STA.W $0016,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


CODE_00DE48:
    BRL cop_ret_ret


CODE_00DE4B:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0034,X
    PHX
    TAX
    LDA.L $7F0203,X
    PLX
    BIT.W #$0040
    BEQ CODE_00DE48
    LDA.W $0016,X
    ORA.W #$0010
    STA.W $0016,X
    BRL cop_skip2


cop_3C:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $03E3
    BRL cop_skip0


cop_80:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $001E,X
    STZ.W $0020,X
    LDA.B COP_TEMP
    STA.W $0018,X
    BRL cop_skip0


cop_81:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $001E,X
    STZ.W $0020,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $002A,X
    LDA.B COP_TEMP
    STA.W $0018,X
    BRL cop_skip0


cop_82:
    TYX
    JSL.L CODE_0088F3
    BCC CODE_00DEBA
    BRL cop_skip0


CODE_00DEBA:
    BRL cop_ret_ret


cop_83:
    TYX

CODE_00DEBE:
    JSL.L CODE_0088F3
    BCC CODE_00DECC
    DEC.W $002A,X
    BNE CODE_00DEBE
    BRL cop_skip0


CODE_00DECC:
    BRL cop_ret_ret


cop_84:
    TYX
    JSR.W CODE_00E63A
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    BRL cop_skip0


cop_85:
    TYX
    JSR.W CODE_00E662
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    BRL cop_skip0


cop_86:
    TYX
    LDY.W $3C,X
    BNE +
    LDY.W $003E,X
    STY.W $06A6
    BEQ +++
    LDA.W #$0000
    STA.W $3C,Y
    BRA +++


+:
    LDA.W $003E,X
    STA.W $003E,Y
    BNE ++
    STY.W currentEntityPtr
    BRA +++


++:
    TAY
    LDA.W $3C,X
    STA.W $3C,Y

+++:
    SEP #$20
    DEC.B $4A
    DEC.B $4A
    REP #$20
    TXA
    STA.B ($4A)
    BRL cop_skip0


cop_87:
    TYX
    LDA.W $001C,X
    EOR.W #$4000
    STA.W $001C,X
    BRL cop_skip0


cop_88:
    TYX
    LDA.W $001C,X
    EOR.W #$8000
    STA.W $001C,X
    BRL cop_skip0


cop_89:
    TYX
    LDA.W player_pos_x_real
    SEC
    SBC.W $0000,X
    BPL CODE_00DF6D
    EOR.W #$FFFF
    INC A

CODE_00DF6D:
    STA.B $00
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CMP.B $00
    BCS CODE_00DF7C
    BRL cop_skip2


CODE_00DF7C:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_8A:
    TYX
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BPL CODE_00DF93
    EOR.W #$FFFF
    INC A

CODE_00DF93:
    STA.B $00
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CMP.B $00
    BCS CODE_00DFA2
    BRL cop_skip2


CODE_00DFA2:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_8B:
    TYX
    LDA.W player_pos_x_real
    SEC
    SBC.W $0000,X
    BPL CODE_00DFB9
    EOR.W #$FFFF
    INC A

CODE_00DFB9:
    STA.B $00
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CMP.B $00
    BCC CODE_00DFC8
    BRL cop_skip2


CODE_00DFC8:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_8C:
    TYX
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BPL CODE_00DFDF
    EOR.W #$FFFF
    INC A

CODE_00DFDF:
    STA.B $00
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CMP.B $00
    BCC CODE_00DFEE
    BRL cop_skip2


CODE_00DFEE:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_8D:
    TYX
    LDA.W $0016,X
    BIT.W #$8000
    BEQ CODE_00E003
    BRL cop_skip0


CODE_00E003:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_8E:
    TYX
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00E018
    BRL cop_skip0


CODE_00E018:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_8F:
    TYX
    LDA.W player_pos_x_real
    CMP.W $0000,X
    BCC CODE_00E036
    LDA.W $001C,X
    ORA.W #$4000
    STA.W $001C,X
    BRL cop_skip0


CODE_00E036:
    LDA.W $001C,X
    AND.W #$BFFF
    STA.W $001C,X
    BRL cop_skip0


cop_90:
    TYX
    LDA.W player_pos_y_real
    CMP.W $0002,X
    BCC CODE_00E057
    LDA.W $001C,X
    ORA.W #$8000
    STA.W $001C,X
    BRL cop_skip0


CODE_00E057:
    LDA.W $001C,X
    AND.W #$7FFF
    STA.W $001C,X
    BRL cop_skip0

cop_91:
    TYX
    SEP #$20
    LDA.B $3A
    STA.W $0036,X
    REP #$20
    LDA.B COP_TEMP
    STA.W $0018,X
    BRL cop_ret_in_a


cop_92:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $001E,X
    STZ.W $0020,X
    JSL.L CODE_02865B
    JSL.L CODE_0286CD
    BRL CODE_00E4C4


cop_93:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $001E,X
    STZ.W $0020,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $002A,X
    JSL.L CODE_02865B
    JSL.L CODE_0286CD
    BRL CODE_00E4C4


cop_94:
    TYX
    DEC.W $0026,X
    BPL CODE_00E0C0
    JSL.L CODE_02865B
    BCC CODE_00E0C6
    BRL cop_skip0


CODE_00E0C0:
    LDA.W $000E,X
    STA.W $0014,X

CODE_00E0C6:
    JSL.L CODE_0286CD
    BRL cop_ret_ret


cop_95:
    TYX
    DEC.W $0026,X
    BPL CODE_00E0E1

CODE_00E0D3:
    JSL.L CODE_02865B
    BCC CODE_00E0E7
    DEC.W $002A,X
    BNE CODE_00E0D3
    BRL cop_skip0


CODE_00E0E1:
    LDA.W $000E,X
    STA.W $0014,X

CODE_00E0E7:
    JSL.L CODE_0286CD
    BRL cop_ret_ret


cop_96:
    TYX
    LDA.W $001C,X
    BIT.W #$4000
    BNE CODE_00E0FD
    ORA.W #$4000
    STA.W $001C,X

CODE_00E0FD:
    BRL cop_skip0


cop_97:
    TYX
    LDA.W $001C,X
    BIT.W #$4000
    BEQ CODE_00E10F
    AND.W #$BFFF
    STA.W $001C,X

CODE_00E10F:
    BRL cop_skip0


cop_98:
    TYX
    LDA.W $001C,X
    BIT.W #$8000
    BNE CODE_00E121
    ORA.W #$8000
    STA.W $001C,X

CODE_00E121:
    BRL cop_skip0


cop_99:
    TYX
    LDA.W $001C,X
    BIT.W #$8000
    BEQ CODE_00E133
    AND.W #$7FFF
    STA.W $001C,X

CODE_00E133:
    BRL cop_skip0


cop_9A:
    TYX
    LDY.W #$0004
    LDA.W player_pos_x_real
    SEC
    SBC.W $0000,X
    BEQ CODE_00E158
    BPL CODE_00E151
    EOR.W #$FFFF
    CMP.B [COP_TEMP]
    BCC CODE_00E158
    LDY.W #$0002
    BRA CODE_00E158


CODE_00E151:
    CMP.B [COP_TEMP]
    BCC CODE_00E158
    LDY.W #$0006

CODE_00E158:
    LDA.B [COP_TEMP],Y
    BRL cop_ret_in_a


cop_9B:
    TYX
    LDY.W #$0004
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BEQ CODE_00E17F
    BPL CODE_00E178
    EOR.W #$FFFF
    CMP.B [COP_TEMP]
    BCC CODE_00E17F
    LDY.W #$0002
    BRA CODE_00E17F


CODE_00E178:
    CMP.B [COP_TEMP]
    BCC CODE_00E17F
    LDY.W #$0006

CODE_00E17F:
    LDA.B [COP_TEMP],Y
    BRL cop_ret_in_a


cop_9C:
    TYX
    LDY.W #$0000
    LDA.W player_pos_x_real
    SEC
    SBC.W $0000,X
    BPL CODE_00E195
    EOR.W #$FFFF
    INC A

CODE_00E195:
    PHA
    LDA.W player_pos_y_real
    SEC
    SBC.W $0002,X
    BPL CODE_00E1A3
    EOR.W #$FFFF
    INC A

CODE_00E1A3:
    CMP.B $01,S
    BCC CODE_00E1AC
    LDY.W #$0002
    BRA CODE_00E1AC


CODE_00E1AC:
    PLA
    LDA.B [COP_TEMP],Y
    BRL cop_ret_in_a


cop_9D:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $001E,X
    STZ.W $0020,X
    LDA.B COP_TEMP
    STA.W $0018,X
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X
    BRL cop_skip0


cop_9E:
    TYX
    LDA.W $0016,X
    BIT.W #$0004
    BNE CODE_00E1E6
    JSL.L CODE_0088F3
    BCC CODE_00E1E3
    BRL cop_skip2


CODE_00E1E3:
    BRL cop_ret_ret


CODE_00E1E6:
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


cop_9F:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    BRL cop_skip0


cop_A0:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    STA.W $0002,X
    BRL cop_skip0


cop_A1:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.W $0000,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    STA.W $0002,X
    BRL cop_skip0


cop_A2:
    TYX
    LDA.W $001C,X
    AND.W #$CFFF
    PHA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    XBA
    ORA.B $01,S
    STA.W $001C,X
    PLA
    BRL cop_skip0


cop_A3:
    TYX
    LDA.W $001A,X
    ORA.W #$4000
    STA.W $001A,X
    BRL cop_skip0


cop_A4:
    TYX
    LDA.W $001A,X
    ORA.W #$2000
    STA.W $001A,X
    BRL cop_skip0


cop_A5:
    TYX
    LDA.W $001C,X
    PHA
    AND.W #$3FFF
    STA.W $001C,X
    PLA
    LDY.W #$0000
    AND.W #$C000
    BEQ CODE_00E286
    INY
    INY
    CMP.W #$4000
    BEQ CODE_00E286
    INY
    INY
    CMP.W #$8000
    BEQ CODE_00E286
    INY
    INY

CODE_00E286:
    LDA.B [COP_TEMP],Y
    BRL cop_ret_in_a


cop_A6:
    TYX
    LDA.W $001A,X
    AND.W #$BFFF
    STA.W $001A,X
    BRL cop_skip0


cop_A7:
    TYX
    LDA.W $001A,X
    AND.W #$DFFF
    STA.W $001A,X
    BRL cop_skip0


cop_A8:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0022,X
    SEP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    BNE CODE_00E2B9
    INC.B $39

CODE_00E2B9:
    STA.W $0024,X
    REP #$20
    BRL cop_skip0


cop_A9:
    TYX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0034,X
    SEP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    BNE CODE_00E2D5
    INC.B $39

CODE_00E2D5:
    STA.W $002C,X
    REP #$20
    LDA.W $001A,X
    ORA.W #$8000
    STA.W $001A,X
    BRL cop_skip0


cop_AA:
    TYX
    LDA.W $001C,X
    AND.W #$F1FF
    PHA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    XBA
    ORA.B $01,S
    STA.W $001C,X
    PLA
    BRL cop_skip0


cop_AB:
    TYX
    JSR.W CODE_00E63A
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0000,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0002,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0016,Y
    BRL cop_skip0


cop_AC:
    TYX
    JSR.W CODE_00E662
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0000,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0002,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0016,Y
    BRL cop_skip0


cop_AD:
    TYX
    LDA.W $0016,X
    BIT.W #$8000
    BNE CODE_00E37F
    BRL cop_skip1


CODE_00E37F:
    LDA.W $0000,X
    CMP.W $0342
    BCC CODE_00E38A
    BRL cop_skip1


CODE_00E38A:
    LDA.W $0002,X
    CMP.W $0344
    BCC CODE_00E395
    BRL cop_skip1


CODE_00E395:
    LDA.B COP_TEMP
    DEC A
    DEC A
    STA.W $0018,X
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    STA.W $0014,X
    BRL cop_ret_ret


cop_AE:
    TYX
    PHX
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.B $16
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L zCalculateCurrentPositionAndActIdSomething
    LDA.L $7F8000,X
    PLX
    AND.W #$000F
    BEQ CODE_00E3DE
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    BRL cop_ret_in_a


CODE_00E3DE:
    BRL cop_skip2


cop_AF:
    TYX
    JSR.W CODE_00E63A
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0016,Y
    BRL cop_skip0


cop_B0:
    TYX
    JSR.W CODE_00E662
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0016,Y
    BRL cop_skip0


cop_B1:
    TYX
    JSR.W CODE_00E63A
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.W $0000,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    STA.W $0002,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0016,Y
    BRL cop_skip0


cop_B2:
    TYX
    JSR.W CODE_00E662
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0018,Y
    TXA
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    AND.W #$00FF
    SEP #$20
    STA.W $0036,Y
    REP #$20
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0000,X
    STA.W $0000,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    CLC
    ADC.W $0002,X
    STA.W $0002,Y
    LDA.B [COP_TEMP]
    INC.B COP_TEMP
    INC.B COP_TEMP
    STA.W $0016,Y
    BRL cop_skip0


cop_skip5: INC.B COP_TEMP
cop_skip4: INC.B COP_TEMP
cop_skip3: INC.B COP_TEMP
cop_skip2: INC.B COP_TEMP
cop_skip1: INC.B COP_TEMP
cop_skip0: LDA.B COP_TEMP

cop_ret_in_a:
    STA.B $02,S
    RTI

CODE_00E4C4:
    LDA.B COP_TEMP
    STA.W $0018,X

cop_ret_ret:
    PLA
    PLA
    RTL
