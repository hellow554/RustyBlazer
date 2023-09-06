NMI_Func:
    PHP
    PHB
    REP #$30
    PHA
    PHX
    PHY
    SEP #$20
    REP #$10
    CLD
    LDA.B #$81
    PHA
    PLB
    STZ.W HDMAEN
    JSR.W TransferOAM
    JSR.W TransferCgdata
    JSR.W CODE_C0844D
    JSR.W SetScrollRegister
    JSR.W CODE_C084F4                    ;C08388|20F484  |C084F4;
    JSR.W CODE_C08511                    ;C0838B|201185  |C08511;
    JSR.W CODE_C0856F                    ;C0838E|206F85  |C0856F;
    JSR.W CODE_C085B7                    ;C08391|20B785  |C085B7;
    JSL.L CODE_80EC11                    ;C08394|2211EC80|80EC11;
    LDA.B HDMA_channel_enable_bits                            ;C08398|A542    |000042;
    STA.W HDMAEN

    ; wait for the readout of the joypad to be completed
    - : LDA.W HVBJOY : ROR A : BCS -


    REP #$30
    INC.W $0312
    LDA.W inhibit_buttons_readout
    BNE .skip_readout
    LDA.W JOY1L
    XBA
    LSR A
    AND.W #$2000
    ORA.W JOY1L
    PHA
    LDA.W button_mask
    EOR.W #$FFFF
    AND.B $01,S
    STA.W buttons_pressed
    PLA
    EOR.W #$FFFF
    ORA.W $032A
    STA.W $032A
    AND.W buttons_pressed

.skip_readout:
    STA.W buttons_pressed
    LDA.W $039A
    BNE CODE_C083EB
    LDA.W $0312
    LSR A
    LDA.W #$0000
    BCS CODE_C083E8
    LDA.W $0398
    STZ.W $0398

CODE_C083E8:
    STA.W APUI02

CODE_C083EB:
    PLY
    PLX
    PLA
    PLB
    PLP
    RTI

TransferOAM:
    LDX.W #0
    STX.W OAMADDL
    STZ.W DMAP0
    LDA.B #OAMDATA
    STA.W BBAD0
    LDX.W #oam_data
    STX.W A1T0L
    LDA.B #0
    STA.W A1B0
    LDX.W #datasize(oam_data)
    STX.W DAS0L
    LDA.B #$01
    STA.W MDMAEN
    RTS

TransferCgdata:
    STZ.W CGADD
    STZ.W DMAP1
    LDA.B #CGDATA
    STA.W BBAD1
    LDX.W #0
    STX.W A1T1L
    LDA.B #bank(cg_data)
    STA.W A1B1
    LDX.W #cg_data
    STX.W DAS1L
    LDA.B #2
    STA.W MDMAEN
    LDA.L coldata_1
    STA.W COLDATA
    LDA.L coldata_2
    STA.W COLDATA
    LDA.L coldata_3
    STA.W COLDATA
    RTS

CODE_C0844D:
    LDA.W $1C7C
    BEQ + : RTS : +

    LDA.W $03BA
    BNE + : RTS : +

    BIT.B #$02
    BNE .CODE_C0846E
    LDX.W #$5800
    STX.W VMADDL
    LDX.W #$7000
    STX.W A1T2L
    STZ.W $03BA
    BRA .CODE_C0847F

.CODE_C0846E:
    LDX.W #$5C00
    STX.W VMADDL
    LDX.W #$7800
    STX.W A1T2L
    LDA.B #$02
    TRB.W $03BA

.CODE_C0847F:
    LDA.B #$01
    STA.W DMAP2
    LDA.B #VMDATAL
    STA.W BBAD2
    LDA.B #$7F
    STA.W A1B2
    LDX.W #$0800
    STX.W DAS2L
    LDA.B #$04
    STA.W MDMAEN
    RTS

SetScrollRegister:
    LDA.W bg3_horizontal_scroll
    STA.W BG3HOFS
    STZ.W BG3HOFS
    LDA.W bg3_vertical_scroll
    STA.W BG3VOFS
    STZ.W BG3VOFS
    LDA.W $03DD
    BNE .CODE_C084C4
    LDX.W #0
    LDY.W #0
    JSR.W SetScrollRegister2
    LDX.W #4
    LDY.W #2
    JSR.W SetScrollRegister2
    RTS

.CODE_C084C4:
    LDX.W #4
    LDY.W #0
    JSR.W SetScrollRegister2
    LDX.W #0
    LDY.W #2
    JSR.W SetScrollRegister2
    RTS

SetScrollRegister2:
    LDA.W bg1_hofs, X
    STA.W BG1HOFS, Y
    LDA.W bg1_hofs+1, X
    AND.B #$03
    STA.W BG1HOFS, Y
    LDA.W bg1_vofs, X
    STA.W BG1VOFS, Y
    LDA.W bg1_vofs+1, X
    AND.B #$03
    STA.W BG1VOFS, Y
    RTS
