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
    JSR.W CODE_C083F1                    ;C0837C|20F183  |C083F1;
    JSR.W CODE_C08416                    ;C0837F|201684  |C08416;
    JSR.W CODE_C0844D                    ;C08382|204D84  |C0844D;
    JSR.W CODE_C0849A                    ;C08385|209A84  |C0849A;
    JSR.W CODE_C084F4                    ;C08388|20F484  |C084F4;
    JSR.W CODE_C08511                    ;C0838B|201185  |C08511;
    JSR.W CODE_C0856F                    ;C0838E|206F85  |C0856F;
    JSR.W CODE_C085B7                    ;C08391|20B785  |C085B7;
    JSL.L CODE_80EC11                    ;C08394|2211EC80|80EC11;
    LDA.B DMA_channel_enable_bits                            ;C08398|A542    |000042;
    STA.W HDMAEN

; wait for the readout of the joypad to be completed
-
    LDA.W HVBJOY
    ROR A
    BCS -

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
    STA.W $0322                          ;C083D1|8D2203  |810322;
    LDA.W $039A                          ;C083D4|AD9A03  |81039A;
    BNE CODE_C083EB                      ;C083D7|D012    |C083EB;
    LDA.W $0312                          ;C083D9|AD1203  |810312;
    LSR A                                ;C083DC|4A      |      ;
    LDA.W #$0000                         ;C083DD|A90000  |      ;
    BCS CODE_C083E8                      ;C083E0|B006    |C083E8;
    LDA.W $0398                          ;C083E2|AD9803  |810398;
    STZ.W $0398                          ;C083E5|9C9803  |810398;

    CODE_C083E8:
    STA.W $2142                          ;C083E8|8D4221  |812142;

    CODE_C083EB:
    PLY                                  ;C083EB|7A      |      ;
    PLX                                  ;C083EC|FA      |      ;
    PLA                                  ;C083ED|68      |      ;
    PLB                                  ;C083EE|AB      |      ;
    PLP                                  ;C083EF|28      |      ;
    RTI                                  ;C083F0|40      |      ;
