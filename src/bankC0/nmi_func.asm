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
    JSR.W TransferL3ToVram
    JSR.W SetScrollRegister
    JSR.W CODE_C084F4
    JSR.W CODE_C08511
    JSR.W CODE_C0856F
    JSR.W CODE_C085B7
    JSL.L CODE_C0EC11
    LDA.B HDMA_channel_enable_bits
    STA.W HDMAEN

    ; wait for the readout of the joypad to be completed
    - : LDA.W HVBJOY : ROR A : BCS -


    REP #$30
    INC.W _0312
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
    ORA.W _032A
    STA.W _032A
    AND.W buttons_pressed

.skip_readout:
    STA.W buttons_pressed
    LDA.W $039A
    BNE CODE_C083EB
    LDA.W _0312
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
    ; DMA0 is used to transfer the data to OAMDATA

    LDX.W #0 ; one register, write once
    STX.W OAMADDL
    STZ.W DMAP0 
    LDA.B #OAMDATA ; set destination to OAMDATA register
    STA.W BBAD0 
    LDX.W #oam_data ; set source address
    STX.W A1T0L
    ; for whatever reason they used 0 here, instead of 7F
    ; let's make the intention clear, but use 0 as value
    LDA.B #bank(oam_data) & 0
    STA.W A1B0
    LDX.W #datasize(oam_data) ; set size to transfer
    STX.W DAS0L
    LDA.B #%1 ; enable dma0
    STA.W MDMAEN
    RTS

TransferCgdata:
    ; we use DMA1 to transfer the data to the ColorPalette (CGRAM)
    
    STZ.W CGADD ; select the first index, so DMA transfer can be used
    STZ.W DMAP1 ; one register, write once
    LDA.B #CGDATA ; load destination `CGDATA` into DMA destination register
    STA.W BBAD1
    LDX.W #CgData.data ; load source addr to dma
    STX.W A1T1L
    LDA.B #bank(CgData.data) ; load source bank to dma
    STA.W A1B1
    LDX.W #datasize(CgData.data) ; load size to transfer to dma
    STX.W DAS1L
    LDA.B #%10 ; enable DMA1
    STA.W MDMAEN
    LDA.L CgData.blue
    STA.W COLDATA
    LDA.L CgData.green
    STA.W COLDATA
    LDA.L CgData.red
    STA.W COLDATA
    RTS

TransferL3ToVram:
    LDA.W $1C7C
    BEQ + : RTS : +

    LDA.W $03BA
    BNE + : RTS : +

    BIT.B #$02
    BNE .CODE_C0846E
    LDX.W #$5800
    STX.W VMADDL
    LDX.W #L3_Text
    STX.W A1T2L
    STZ.W $03BA
    BRA .beginTransfer

.CODE_C0846E:
    LDX.W #$5C00
    STX.W VMADDL
    LDX.W #SomeOtherTypeToTransferToVram
    STX.W A1T2L
    LDA.B #$02
    TRB.W $03BA

.beginTransfer:
    LDA.B #$01
    STA.W DMAP2
    LDA.B #VMDATAL
    STA.W BBAD2
    LDA.B #<:L3_Text
    STA.W A1B2
    LDX.W #datasize(L3_Text)
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

CODE_C084F4:
    LDX.W #$3000
    STX.B $32
    LDX.W #$3102
    STX.B $35
    JSL.L CODE_C2857D
    LDX.W #$3204
    STX.B $32
    LDX.W #$3306
    STX.B $35
    JSL.L CODE_C2857D
    RTS
