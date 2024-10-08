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
    %SwitchToBank($81)
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
    AND.W #Key16.Select
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
    BNE .end
    LDA.W _0312
    LSR A
    LDA.W #$0000
    BCS + : LDA.W $0398 : STZ.W $0398 : +
    STA.W APUIO2

.end:
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
    STZ.W DMA_Regs[0].control
    LDA.B #OAMDATA ; set destination to OAMDATA register
    STA.W DMA_Regs[0].destination
    LDX.W #oam_data ; set source address
    STX.W DMA_Regs[0].source_address_word
    ; for whatever reason they used 0 here, instead of 7F
    ; let's make the intention clear, but use 0 as value
    LDA.B #bank(oam_data) & 0
    STA.W DMA_Regs[0].source_address_bank
    LDX.W #datasize(oam_data) ; set size to transfer
    STX.W DMA_Regs[0].size_word
    LDA.B #%1 ; enable dma0
    STA.W MDMAEN
    RTS

TransferCgdata:
    ; we use DMA1 to transfer the data to the ColorPalette (CGRAM)
    
    STZ.W CGADD ; select the first index, so DMA transfer can be used
    STZ.W DMA_Regs[1].control ; one register, write once
    LDA.B #CGDATA ; load destination `CGDATA` into DMA destination register
    STA.W DMA_Regs[1].destination
    LDX.W #CgData8bpp.data ; load source addr to dma
    STX.W DMA_Regs[1].source_address_word
    LDA.B #bank(CgData8bpp.data) ; load source bank to dma
    STA.W DMA_Regs[1].source_address_bank
    LDX.W #datasize(CgData8bpp.data) ; load size to transfer to dma
    STX.W DMA_Regs[1].size_word
    LDA.B #%10 ; enable DMA1
    STA.W MDMAEN
    LDA.L CgData8bpp.CgData.blue
    STA.W COLDATA
    LDA.L CgData8bpp.CgData.green
    STA.W COLDATA
    LDA.L CgData8bpp.CgData.red
    STA.W COLDATA
    RTS

TransferL3ToVram:
    LDA.W $1C7C
    BEQ + : RTS : +

    LDA.W _03BA
    BNE + : RTS : +

    BIT.B #$02
    BNE .CODE_C0846E
    LDX.W #$5800
    STX.W VMADDL
    LDX.W #L3_Text
    STX.W DMA_Regs[2].source_address_word
    STZ.W _03BA
    BRA .beginTransfer

.CODE_C0846E:
    LDX.W #$5C00
    STX.W VMADDL
    LDX.W #SomeOtherTypeToTransferToVram
    STX.W DMA_Regs[2].source_address_word
    LDA.B #$02
    TRB.W _03BA

.beginTransfer:
    LDA.B #$01
    STA.W DMA_Regs[2].control
    LDA.B #VMDATAL
    STA.W DMA_Regs[2].destination
    LDA.B #<:L3_Text
    STA.W DMA_Regs[2].source_address_bank
    LDX.W #datasize(L3_Text)
    STX.W DMA_Regs[2].size_word
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
