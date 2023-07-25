; for a toplevel explanation of all the cop functions, see `macros.asm` and the corresponding cop macros
COP_Func:
    SEP #$20
    TXY
    LDA.B $04, S        ; read bank from irq source
    STA.B CopTemp.bank  ; store it into CopTemp+2, so other direct address reads (`LDA [CopTemp]` would also give us the correct bank)
    REP #$20
    LDA.B $02, S        ; read addr from irq source
    DEC A               ; decrement, because else it would point to the location after the COP immediate
    STA.B CopTemp.addr
    LDA.B [CopTemp]     ; read COP Number (e.g. COP #01 would give us $xx01 in `A`) via direct read
    INC.B CopTemp.addr  ; increment CopTemp so it points to the first argument or return address, depends on the COP itself later
    AND.W #$00FF        ; because we are in A16, we need to zero out the upper part of `AB`
    ASL A               ; times two, because our index table is 2 bytes per id
    TAX                 ; use `X` as jumper
    JMP.W (.jump_table, X)

.jump_table:
    dw .cop_00, .cop_01, .cop_02, .cop_03
    dw .cop_04, .cop_05, .cop_06, .cop_07
    dw .cop_08, .cop_09, .cop_0A, .cop_0B
    dw .cop_0C, .cop_0D, 0, 0
    dw .cop_10, .cop_11, .cop_12, .cop_13
    dw .cop_14, .cop_15, .cop_16, .cop_17
    dw .cop_18, .cop_19, .cop_1A, .cop_1B
    dw .cop_1C, .cop_1D, .cop_1E, .cop_1F
    dw .cop_20, .cop_21, .cop_22, .cop_23



db $C7,$DB,$DD,$DB,$F1,$DB,$29,$DC   ;C0D6F3|        |0000DB;
db $39,$DC,$63,$DC,$97,$DC,$C8,$DC   ;C0D6FB|        |0063DC;
db $00,$00,$00,$00,$F9,$DC,$0F,$DD   ;C0D703|        |      ;
db $4E,$DD,$68,$DD,$88,$DD,$A8,$DD   ;C0D70B|        |0068DD;
db $CB,$DD,$EE,$DD,$0C,$DE,$28,$DE   ;C0D713|        |      ;
db $36,$DE,$43,$DE,$7D,$DE,$85,$DE   ;C0D71B|        |0000DE;
db $E4,$DE,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D723|        |0000DE;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D72B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D733|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D73B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D743|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D74B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D753|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D75B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D763|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D76B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D773|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D77B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D783|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D78B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D793|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D79B|        |FFFFFF;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C0D7A3|        |FFFFFF;
db $F2,$DE,$08,$DF,$28,$DF,$35,$DF   ;C0D7AB|        |0000DE;
db $47,$DF,$66,$DF,$85,$DF,$BD,$DF   ;C0D7B3|        |0000DF;
db $CA,$DF,$D7,$DF,$FD,$DF,$23,$E0   ;C0D7BB|        |      ;
db $49,$E0,$6F,$E0,$84,$E0,$99,$E0   ;C0D7C3|        |      ;
db $BA,$E0,$DB,$E0,$ED,$E0,$06,$E1   ;C0D7CB|        |      ;
db $29,$E1,$45,$E1,$66,$E1,$78,$E1   ;C0D7D3|        |      ;
db $8A,$E1,$9C,$E1,$AE,$E1,$D5,$E1   ;C0D7DB|        |      ;
db $FC,$E1,$2A,$E2,$49,$E2,$67,$E2   ;C0D7E3|        |C02AE1;
db $78,$E2,$89,$E2,$A7,$E2,$C0,$E2   ;C0D7EB|        |      ;
db $CD,$E2,$DA,$E2,$03,$E3,$10,$E3   ;C0D7F3|        |00DAE2;
db $1D,$E3,$39,$E3,$5E,$E3,$77,$E3   ;C0D7FB|        |0039E3;
db $B1,$E3,$EB,$E3,$21,$E4,$59,$E4   ;C0D803|        |0000E3;
db $81,$E4,$A9,$E4,$EB,$E4


.cop_00:
    TYX
    BRL .ret_out_of_script

.cop_01:
    TYX
    LDA.B [CopTemp] ; loads 24-bit textpointer
    INC.B CopTemp
    INC.B CopTemp
    TAY             ; print expects the textpointer in Y
    SEP #$20
    PHX
    PHB
    LDA.B CopTemp.bank
    PHA
    PLB
    JSL.L printOsdStringFromBankX
    PLB
    PLX
    REP #$20
    BRL .ret_in_tmp

.cop_02:
    TYX
    PHX
    LDY.W #choice_yes_no
    JSL.L printOsdStringFromBank2
    SEP #$20
    LDA.B #0
    XBA
    LDA.B #2 ; number of choices
    JSL.L printAndRunChoiceBox
    PHP
    LDX.W textbox_tlc
    JSL.L clearTextbox
    LDA.B #1
    STA.W $3BA
    PLP
    REP #$20
    PLX
    BCS ..aborted
    AND.W #$FF
    BNE ..aborted
    BRL .skip_2_args
..aborted:
    LDA [CopTemp]
    INC CopTemp
    INC CopTemp
    BRL .ret_in_a

.cop_03:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $2E, X ; store the loop counter in the entity struct
    LDA.B CopTemp
    STA.W $002C, X
    STA.W $0018, X ; store the script return address
    BRL .ret_in_a

.cop_04:
    TYX
    DEC.W $002E, X ; load the loop counter
    BNE ..not_elapsed ; and check it it is zero
    BRL .ret_in_tmp ; if 0, then return to the next address

..not_elapsed:
    LDA.W $002C, X
    STA.W $0018, X ; write the new loop value back to the entity
    BRL .ret_out_of_script

.cop_05:
    TYX
    LDA.B [CopTemp]
    BMI ..wait_for_unset
    JSR.W CheckGameStateBit
    BCC ..loop_again
    BRA ..loop_done

..wait_for_unset:
    JSR CheckGameStateBit
    BCC ..loop_done

..loop_again:
    DEC.B CopTemp
    DEC.B CopTemp
    BRL .set_script_ret_addr_and_get_out

..loop_done:
    BRL .skip_2_args

.cop_06:
    TYX
    LDA [CopTemp]
    BRL .ret_in_a

.cop_07:
    TYX
    LDA.B [CopTemp]
    BRA .check_jump

.cop_08:
    TYX
    LDA.B [CopTemp]
    EOR.W #$8000 ; do the same as cop07, but negate it

.check_jump:
    BMI ..check_set
    JSR.W CheckGameStateBit
    BCS ..dont_jump
    BRA ..do_jump

..check_set:
    JSR.W CheckGameStateBit
    BCS ..do_jump

..dont_jump:
    BRL .skip_4_args

..do_jump:
    INC.B CopTemp
    INC.B CopTemp
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_09:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    JSR.W SetResetGameStateBit
    BRL .ret_in_tmp

.cop_0A:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    CMP.W #!MedicalHerb
    BEQ ..give_item ; the reason for this, is that we heal the player fully, if it is already equipped, but that's not check here, but in `giveItem`
    JSR.W CheckIfItemIsObtained
    BCC ..ret

..give_item:
    JSL.L giveItem
..ret:
    BRL .ret_in_tmp

.cop_0B:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W CheckIfItemIsObtained
    BCS ..ret
    SEP #$20
    BPL ..not_equipped
    AND.B #$7F
    STZ.W Equipment.item

..not_equipped:
    EOR.W Inventory, Y
    STA.W Inventory, Y
    REP #$20

..ret:
    BRL .ret_in_tmp

.cop_0C:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W MakeLiveEntitiesIndex
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W A_times_16
    STA.B $00

.CODE_C0D938:
LDA.W $0000,X                        ;C0D938|BD0000  |810000;
SEC                                  ;C0D93B|38      |      ;
SBC.B $00                            ;C0D93C|E500    |000000;
STA.B $16                            ;C0D93E|8516    |000016;
LDA.B $00                            ;C0D940|A500    |000000;
ASL A                                ;C0D942|0A      |      ;
CLC                                  ;C0D943|18      |      ;
ADC.W $0010,X                        ;C0D944|7D1000  |810010;
SEC                                  ;C0D947|38      |      ;
SBC.W #$000F                         ;C0D948|E90F00  |      ;
STA.B $18                            ;C0D94B|8518    |000018;
LDA.W $0000,Y                        ;C0D94D|B90000  |810000;
SEC                                  ;C0D950|38      |      ;
SBC.B $16                            ;C0D951|E516    |000016;
CMP.B $18                            ;C0D953|C518    |000018;
BCC .CODE_C0D95A                      ;C0D955|9003    |C0D95A;
BRL .skip_2_args                      ;C0D957|82D90B  |C0E533;

.CODE_C0D95A:
LDA.W $0002,X                        ;C0D95A|BD0200  |810002;
CLC                                  ;C0D95D|18      |      ;
ADC.B $00                            ;C0D95E|6500    |000000;
STA.B $16                            ;C0D960|8516    |000016;
LDA.B $00                            ;C0D962|A500    |000000;
ASL A                                ;C0D964|0A      |      ;
CLC                                  ;C0D965|18      |      ;
ADC.W $0012,X                        ;C0D966|7D1200  |810012;
SEC                                  ;C0D969|38      |      ;
SBC.W #$000F                         ;C0D96A|E90F00  |      ;
STA.B $18                            ;C0D96D|8518    |000018;
LDA.B $16                            ;C0D96F|A516    |000016;
SEC                                  ;C0D971|38      |      ;
SBC.W $0002,Y                        ;C0D972|F90200  |810002;
CMP.B $18                            ;C0D975|C518    |000018;
BCC .CODE_C0D97C                      ;C0D977|9003    |C0D97C;
BRL .skip_2_args                      ;C0D979|82B70B  |C0E533;

.CODE_C0D97C:
LDA.B [CopTemp]                          ;C0D97C|A738    |000038;
INC.B CopTemp                            ;C0D97E|E638    |000038;
INC.B CopTemp                            ;C0D980|E638    |000038;
BRL .ret_in_a                      ;C0D982|82B40B  |C0E539;

.cop_0D:
    TYX
    LDA.B [CopTemp] ; entity id
    INC.B CopTemp
    AND.W #$00FF
    JSR.W MakeLiveEntitiesIndex
    LDA.B [CopTemp] ; x position
    INC.B CopTemp
    AND.W #$FF
    JSR.W A_times_16
    CMP.W 0, Y          ; compare it against the x position of the entity
    BEQ + : BRL .skip_3_args : +

    LDA.B [CopTemp] ; y position
    INC.B CopTemp
    AND.W #$FF
    INC A
    JSR.W A_times_16
    CMP.W $2, Y ; compare it against the y position of the entity
    BEQ + : BRL .skip_2_args : +

    LDA.B [CopTemp] ; condition is met, jump to target
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_10:
    TYX
    LDA.B [CopTemp] ; load the scene id
    INC.B CopTemp
    INC.B CopTemp
    XBA
    STA.W sceneId
    LDA.B [CopTemp] ; load facing
    INC.B CopTemp
    AND.W #$FF
    STA.W teleport_facing
    LDA.B [CopTemp] ; load X
    INC.B CopTemp
    INC.B CopTemp
    STA.W teleport_x
    LDA.B [CopTemp] ; load Y
    INC.B CopTemp
    INC.B CopTemp
    STA.W teleport_y
    BRL .ret_in_tmp

.cop_11:
    TYX
    LDA.B [CopTemp] ; load entity id
    INC.B CopTemp
    AND.W #$FF
    JSR.W MakeLiveEntitiesIndex
    LDA.B [CopTemp]  ; load x
    INC.B CopTemp
    AND.W #$FF
    JSR.W A_times_16
    STA.W $0000, Y   ; store x in entity table
    LDA.B [CopTemp]  ; load y
    INC.B CopTemp
    AND.W #$FF
    JSR.W A_times_16
    STA.W $0002, Y  ; store y in the entityt table
    PHX
    TYX
    JSR.W make_npc_passable
    PLX
    BRL .ret_in_tmp

.cop_12
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W MakeLiveEntitiesIndex
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $0018, Y ; store it as the script ret addr
    BRL .ret_in_tmp

.cop_13:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W MakeLiveEntitiesIndex
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $30, Y ; store xxx
    BRL .ret_in_tmp

.cop_14:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    JSR.W CODE_C0E6A5
    LDY.W #lair_sealed_table
    JSL.L checkIfBitIsSet
    BCC ..not_sealed
    LDA.W $0016, X ; that's the entity id?
    AND.W #$DFFF
    STA.W $0016, X
    LDA.B [CopTemp] ; load the addr to jump to
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

..not_sealed:
    BRL .skip_2_args

.cop_15:
    TYX
    JSR.W make_npc_unpassable
    BRL .ret_in_tmp

.cop_16:
    TYX
    JSR.W make_npc_passable
    BRL .ret_in_tmp

.cop_17:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $30, X ; assign the loaded pointer to the talkback pointer in the X entity
    BRL .ret_in_tmp

.cop_18:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W CheckIfItemIsObtained
    BCS ..is_obtained
    BRL .skip_2_args

..is_obtained:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_19:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W CheckIfItemIsObtained
    BCS ..not_obtained
    BPL ..not_obtained
    BRL .skip_2_args

..not_obtained:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_1A:
    TYX
    PHX
    LDA.B [CopTemp] ; load txt pointer
    INC.B CopTemp
    INC.B CopTemp
    TAY
    JSL.L printOsdStringFromBank2
    SEP #$20
    LDA.B #$00
    XBA
    LDA.B [CopTemp] ; load number of choices
    INC.B CopTemp
    ; failsafe for when it's zero make it one
    BNE + : INC.B CopTemp+1 : +

    JSL.L printAndRunChoiceBox
    PHA
    PHP
    LDX.W textbox_tlc
    JSL.L clearTextbox
    LDA.B #1
    STA.W $03BA
    PLP
    PLA
    REP #$20
    PLX
    BCS ..aborted_textbox
    AND.W #$FF
    STA.W choice_idx
    BRL .skip_2_args

..aborted_textbox:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_1B:
    TYX
    LDA.B [CopTemp] ; load target
    INC.B CopTemp
    INC.B CopTemp
    STA.W $0018, X ; set script ret addr
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $0014, X ; store amount of frames to wait for
    BRL .ret_out_of_script

.cop_1C:
TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    AND.W $0016, X ; compare it with the entity_id
    BNE ..correct_entity
    BRL .skip_2_args

..correct_entity:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_1D:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    ORA.W $16, X ; or it with entity id
    STA.W $16, X ; store it
    BRL .ret_in_tmp

.cop_1E:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    AND.W $16, X ; and it with entity id
    STA.W $16, X ; store it
    BRL .ret_in_tmp

.cop_1F:
    PHY
    SEP #$20
    LDX.W #$F
    LDA.B #0
    XBA
    CLC

..loop1:
    LDA.W $302, X
    ADC.W $301, X
    STA.W $301, X
    DEX
    BNE ..loop1
    LDX.W #$10

..loop2:
    INC.W $301, X
    BNE ..end
    DEX
    BNE ..loop2

..end:
    REP #$20
    PLX
    BRL .ret_in_tmp

.cop_20:
    TYX
    LDA.W PlayerPosReal.x
    ORA.W PlayerPosReal.y
    AND.W #$F
    BEQ ..ret
    LDA.B [CopTemp] ; load destination
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

..ret:
    BRL .skip_2_args

.cop_21:
    TYX
    LDA.W 0, X ; load X position of entity
    STA.B $16
    LDA.W 2, X ; load Y position of entity
    SEC
    SBC.W #$10
    SEC
    SBC.W $12, X
    STA.B $18
    BRL .CODE_C0DC48

.cop_22:
    TYX
    LDA.W 0, X ; load X position of entity
    STA.B $16
    LDA.W 2, X ; load Y position of entity
    STA.B $18
    BRL .CODE_C0DC48

.cop_23:
    TYX
    LDA.W 0, X ; load X position of entity
    SEC
    SBC.W #$10
    STA.B $16
    LDA.W 2, X ; load Y position of entity
    SEC
    SBC.W #$10
    STA.B $18
    BRL .CODE_C0DC48

.cop_24:
    TYX
    LDA.W 0, X
    CLC
    ADC.W $10, X
    STA.B $16
    LDA.W 2,X
    SEC
    SBC.W #$10
    STA.B $18
    BRL .CODE_C0DC48

.cop_25:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    JSL.L AddGold
    LDA.W #!UpdateHud_Gold
    TSB.W display_hud_bitfield
    BRL .ret_in_tmp

.cop_26
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    LDY.W Equipment.item
    CPY.W #!MagicBell ; if we have the magic bell, this doesn't cost anything
    BNE ..check_armor
    LDA.W #0 ; doesn't cost any gold
    BRA ..cast_it

..check_armor:
    LDY.W Equipment.armor
    CPY.W #!MagicArmor
    BNE ..cast_it
    LSR ; half the amount of gold if the magic armor is equipped
    BNE ..cast_it
    INC ; but at least 1 gold

..cast_it:
    JSL.L SubtractGold
    BCS ..not_enough_gold
    LDA.W #!UpdateHud_Gold
    TSB.W display_hud_bitfield
    BRL .skip_2_args

..not_enough_gold:
    LDA.B [CopTemp] ; load not enough gold callback
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_27:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, X
    STZ.W $14, X
    BRL .ret_out_of_script

.cop_28:
    TYX
    LDA.W 0, X ; load X position of entity
    STA.B $16
    LDA.W 2, X ; load Y position of entity
    SEC
    SBC.W #$10
    STA.B $18

.CODE_C0DC48:
    PHX
    JSL.L CalcPassablemapOffset
    LDA.L passable_map, X
    PLX
    AND.W #$FF
    BNE ..not_passable
    BRL .skip_2_args

..not_passable:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_29:
    TYX
    LDA.W 0, X ; load X position of entity
    STA.B $16
    LDA.W 2, X ; load Y position of entity
    SEC
    SBC.W #$10
    STA.B $18
    PHX
    JSL.L CalcPassablemapOffset
    SEP #$20

    LDA.B [CopTemp]
    INC.B CopTemp
    BNE + : INC.B CopTemp+1 : +

    CMP.L $7E8000, X
    REP #$20
    BNE ..dunno
    PLX
    BRL .skip_2_args

..dunno:
    PLX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_2A:
    TYX
    PHX
    LDA.B [CopTemp] ; load relative x position
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X      ; add to entity x position
    STA.B $16
    LDA.B [CopTemp] ; load relative y position
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X      ; add to entity y position
    SEC
    SBC.W #$10      ; subtract the usual 1 block
    STA.B $18
    JSL.L CalcPassablemapOffset
    LDA.L passable_map, X
    ORA.W #$F0
    STA.L passable_map, X
    PLX
    BRL .ret_in_tmp

.cop_2B:
    TYX
    PHX
    LDA.B [CopTemp] ; load relative x position
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X      ; add to entity x position
    STA.B $16
    LDA.B [CopTemp] ; load relative y position
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X      ; add to entity y position
    SEC
    SBC.W #$10      ; substract the usual 1 block
    STA.B $18
    JSL.L CalcPassablemapOffset
    LDA.L passable_map, X
    AND.W #$FF00 ; clear byte, $FF00 because we are doing a 16-bit access
    STA.L passable_map, X
    PLX
    BRL .ret_in_tmp

.cop_2E:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSR.W MakeLiveEntitiesIndex
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.B $00
    BRL .CODE_C0D938

.cop_2F:
    TYX
    LDA.B [CopTemp] ; load an x offset?
    INC.B CopTemp
    INC.B CopTemp
    STA.B $16
    LDA.B [CopTemp] ; load an y offset?
    INC.B CopTemp
    INC.B CopTemp
    STA.B $18

    LDY.W $039E ; what is here? Something entity related

    LDA.W 0, Y ; add x offset to entity x position
    CLC
    ADC.B $16
    STA.W 0, Y

    LDA.W 2, Y ; add y offset to entity y position
    CLC
    ADC.B $18
    STA.W 2, Y

    LDA.W $3E, Y
    TAY

    LDA.W 0, Y ; do the same thing here
    CLC
    ADC.B $16
    STA.W 0, Y

    LDA.W $2, Y
    CLC
    ADC.B $18
    STA.W 2, Y

    BRL .ret_in_tmp

.cop_30:
    TYX
    LDA.W lair_reveal_in_progress
    BNE + : BRL .skip_5_args : +

    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CMP.W revealing_lair_id
    BEQ + : BRL .skip_3_args : +
    BRL .do_the_jump ; I'm not really sure, why it isn't here, but so far away

.cop_31:
    TYX
    JSR.W CODE_C0E6DA
    LDA.W #CODE_C0ACC7
    STA.W $18, Y ; set script ret addr
    SEP #$20
    LDA.B #$80
    STA.W $36, Y ; set script ret addr bank
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $0030, Y
    BRL .ret_in_tmp

.cop_32:
    TYX
    JSR.W CODE_C0E6DA
    LDA.W #CODE_C0ACFA
    STA.W $18, Y
    SEP #$20
    LDA.B #$80
    STA.W $36,Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$00FF
    STA.W $0030,Y
    BRL .ret_in_tmp

.cop_33:
    TYX
    LDY.W $039E
    JSR.W ..clear_certain_bit
    LDY.W $03A0
    JSR.W ..clear_certain_bit
    LDY.W $03A2
    JSR.W ..clear_certain_bit
    STZ.W $0470
    BRL .ret_in_tmp

..clear_certain_bit:
    LDA.W $1A, Y
    AND.W #$FF7F
    STA.W $1A, Y
    RTS

.cop_34:
    TYX
    LDY.W $039E
    JSR.W ..set_certain_bit
    LDY.W $03A0
    JSR.W ..set_certain_bit
    LDY.W $03A2
    JSR.W ..set_certain_bit
    INC.W $0470
    BRL .ret_in_tmp

..set_certain_bit:
    LDA.W $1A, Y
    ORA.W #$80
    STA.W $1A, Y
    RTS

.cop_35:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$00FF
    STA.B $00
    LDA.W $0302
    AND.W #$00FF

..loop:
    SEC
    SBC.B $00
    BPL ..loop
    CLC
    ADC.B $00
    STA.W $0443
    BRL .ret_in_tmp

.cop_36:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    SED
    CLC
    ADC.W PlayerExp.lower10k
    STA.W PlayerExp.lower10k
    LDA.W PlayerExp.upper10k
    ADC.W #0
    STA.W PlayerExp.upper10k
    CLD
    BRL .ret_in_tmp


.cop_37:
    TYX
    LDA.W player_max_health
    SEC
    SBC.W player_current_health
    STA.W player_health_restore
    BRL .ret_in_tmp

.cop_38:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W exp_to_give
    BRL .ret_in_tmp

.cop_39:
    TYX
    PHX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20

    PHA
    LDA.W player_current_health
    SEC
    SBC.B 1, S
    BPL + : LDA.B #0 : + ; make sure to not heal the player
    STA.W player_current_health
    PLA
    REP #$20
    LDA.W #!UpdateHud_Health
    TSB.W display_hud_bitfield

    LDX.W $039E
    LDA.W #$FFE0
    STA.W $26, X
    %PlaySound(!Sound_PlayerHit)
    LDA.W $16, X
    ORA.W #$800
    STA.W $16, X
    PLX
    BRL .ret_in_tmp

.cop_3A:
    TYX
    JSL.L CODE_82A4F3
    BRL .ret_in_tmp

.cop_3B:
TYX
LDA.B [CopTemp]
JSR.W CODE_C0E6A5
ASL A
ASL A
ASL A
ASL A
ASL A
TAY
LDA.W UNREACH_81BA2B,Y
BEQ .CODE_C0DE9F
LDY.W #$1ADE
JSL.L checkIfBitIsSet
BCC .CODE_C0DEC3

.CODE_C0DE9F:
LDA.B [CopTemp]
INC.B CopTemp
INC.B CopTemp
LDY.W #$1ADE
JSL.L checkIfBitIsSet
BCC .CODE_C0DEC0
LDA.W $0016,X
AND.W #$DFFF
STA.W $0016,X
LDA.B [CopTemp]
INC.B CopTemp
INC.B CopTemp
BRL .ret_in_a

.CODE_C0DEC0:
BRL .ret_out_of_script

.CODE_C0DEC3:
LDA.B [CopTemp]
INC.B CopTemp
INC.B CopTemp
STA.W $0034,X
PHX
TAX
LDA.L $7F0203,X
PLX
BIT.W #$0040
BEQ .CODE_C0DEC0
db $BD,$16,$00,$09,$10,$00,$9D,$16   ;C0DED8|        |000016;
db $00,$82,$4F,$06                   ;C0DEE0|        |      ;
TYX                                  ;C0DEE4|BB      |      ;
LDA.B [CopTemp]                          ;C0DEE5|A738    |000038;
INC.B CopTemp                            ;C0DEE7|E638    |000038;
AND.W #$00FF                         ;C0DEE9|29FF00  |      ;
STA.W $03E5                          ;C0DEEC|8DE503  |8103E5;
BRL .ret_in_tmp                      ;C0DEEF|824506  |C0E537;
TYX                                  ;C0DEF2|BB      |      ;
LDA.B [CopTemp]                          ;C0DEF3|A738    |000038;
INC.B CopTemp                            ;C0DEF5|E638    |000038;
AND.W #$00FF                         ;C0DEF7|29FF00  |      ;
STA.W $001E,X                        ;C0DEFA|9D1E00  |81001E;
STZ.W $0020,X                        ;C0DEFD|9E2000  |810020;
LDA.B CopTemp                            ;C0DF00|A538    |000038;
STA.W $0018,X                        ;C0DF02|9D1800  |810018;
BRL .ret_in_tmp                      ;C0DF05|822F06  |C0E537;
TYX                                  ;C0DF08|BB      |      ;
LDA.B [CopTemp]                          ;C0DF09|A738    |000038;
INC.B CopTemp                            ;C0DF0B|E638    |000038;
AND.W #$00FF                         ;C0DF0D|29FF00  |      ;
STA.W $001E,X                        ;C0DF10|9D1E00  |81001E;
STZ.W $0020,X                        ;C0DF13|9E2000  |810020;
LDA.B [CopTemp]                          ;C0DF16|A738    |000038;
INC.B CopTemp                            ;C0DF18|E638    |000038;
AND.W #$00FF                         ;C0DF1A|29FF00  |      ;
STA.W $002A,X                        ;C0DF1D|9D2A00  |81002A;
LDA.B CopTemp                            ;C0DF20|A538    |000038;
STA.W $0018,X                        ;C0DF22|9D1800  |810018;
BRL .ret_in_tmp                      ;C0DF25|820F06  |C0E537;
TYX                                  ;C0DF28|BB      |      ;
JSL.L CODE_80891F                    ;C0DF29|221F8980|80891F;
BCC .CODE_C0DF32                      ;C0DF2D|9003    |C0DF32;
BRL .ret_in_tmp                      ;C0DF2F|820506  |C0E537;

.CODE_C0DF32:
BRL .ret_out_of_script                      ;C0DF32|820C06  |C0E541;
TYX                                  ;C0DF35|BB      |      ;

.CODE_C0DF36:
JSL.L CODE_80891F                    ;C0DF36|221F8980|80891F;
BCC .CODE_C0DF44                      ;C0DF3A|9008    |C0DF44;
DEC.W $002A,X                        ;C0DF3C|DE2A00  |81002A;
BNE .CODE_C0DF36                      ;C0DF3F|D0F5    |C0DF36;
BRL .ret_in_tmp                      ;C0DF41|82F305  |C0E537;

.CODE_C0DF44:
BRL .ret_out_of_script                      ;C0DF44|82FA05  |C0E541;
TYX                                  ;C0DF47|BB      |      ;
JSR.W CODE_C0E6B2                    ;C0DF48|20B2E6  |C0E6B2;
LDA.B [CopTemp]                          ;C0DF4B|A738    |000038;
INC.B CopTemp                            ;C0DF4D|E638    |000038;
INC.B CopTemp                            ;C0DF4F|E638    |000038;
STA.W $0018,Y                        ;C0DF51|991800  |810018;
TXA                                  ;C0DF54|8A      |      ;
LDA.B [CopTemp]                          ;C0DF55|A738    |000038;
INC.B CopTemp                            ;C0DF57|E638    |000038;
AND.W #$00FF                         ;C0DF59|29FF00  |      ;
SEP #$20                             ;C0DF5C|E220    |      ;
STA.W $0036,Y                        ;C0DF5E|993600  |810036;
REP #$20                             ;C0DF61|C220    |      ;
BRL .ret_in_tmp                      ;C0DF63|82D105  |C0E537;

.do_the_jump:
TYX                                  ;C0DF66|BB      |      ;
JSR.W CODE_C0E6DA                    ;C0DF67|20DAE6  |C0E6DA;
LDA.B [CopTemp]                          ;C0DF6A|A738    |000038;
INC.B CopTemp                            ;C0DF6C|E638    |000038;
INC.B CopTemp                            ;C0DF6E|E638    |000038;
STA.W $0018,Y                        ;C0DF70|991800  |810018;
TXA                                  ;C0DF73|8A      |      ;
LDA.B [CopTemp]                          ;C0DF74|A738    |000038;
INC.B CopTemp                            ;C0DF76|E638    |000038;
AND.W #$00FF                         ;C0DF78|29FF00  |      ;
SEP #$20                             ;C0DF7B|E220    |      ;
STA.W $0036,Y                        ;C0DF7D|993600  |810036;
REP #$20                             ;C0DF80|C220    |      ;
BRL .ret_in_tmp                      ;C0DF82|82B205  |C0E537;
TYX                                  ;C0DF85|BB      |      ;
LDY.W $003C,X                        ;C0DF86|BC3C00  |81003C;
BNE .CODE_C0DF9B                      ;C0DF89|D010    |C0DF9B;
db $BC,$3E,$00,$8C,$B2,$06,$F0,$1C   ;C0DF8B|        |00003E;
db $A9,$00,$00,$99,$3C,$00,$80,$14   ;C0DF93|        |      ;

.CODE_C0DF9B:
LDA.W $003E,X                        ;C0DF9B|BD3E00  |81003E;
STA.W $003E,Y                        ;C0DF9E|993E00  |81003E;
BNE .CODE_C0DFA8                      ;C0DFA1|D005    |C0DFA8;
STY.W $06B4                          ;C0DFA3|8CB406  |8106B4;
BRA .CODE_C0DFAF                      ;C0DFA6|8007    |C0DFAF;

.CODE_C0DFA8:
TAY                                  ;C0DFA8|A8      |      ;
LDA.W $003C,X                        ;C0DFA9|BD3C00  |81003C;
STA.W $003C,Y                        ;C0DFAC|993C00  |81003C;

.CODE_C0DFAF:
SEP #$20                             ;C0DFAF|E220    |      ;
DEC.B $4A                            ;C0DFB1|C64A    |00004A;
DEC.B $4A                            ;C0DFB3|C64A    |00004A;
REP #$20                             ;C0DFB5|C220    |      ;
TXA                                  ;C0DFB7|8A      |      ;
STA.B ($4A)                          ;C0DFB8|924A    |00004A;
BRL .ret_in_tmp                      ;C0DFBA|827A05  |C0E537;
TYX                                  ;C0DFBD|BB      |      ;
LDA.W $001C,X                        ;C0DFBE|BD1C00  |81001C;
EOR.W #$4000                         ;C0DFC1|490040  |      ;
STA.W $001C,X                        ;C0DFC4|9D1C00  |81001C;
BRL .ret_in_tmp                      ;C0DFC7|826D05  |C0E537;
db $BB,$BD,$1C,$00,$49,$00,$80,$9D   ;C0DFCA|        |      ;
db $1C,$00,$82,$60,$05,$BB,$AD,$74   ;C0DFD2|        |008200;
db $03,$38,$FD,$00,$00,$10,$04,$49   ;C0DFDA|        |000038;
db $FF,$FF,$1A,$85,$00,$A7,$38,$E6   ;C0DFE2|        |851AFF;
db $38,$E6,$38,$C5,$00,$B0,$03,$82   ;C0DFEA|        |      ;
db $3F,$05,$A7,$38,$E6,$38,$E6,$38   ;C0DFF2|        |38A705;
db $82,$3C,$05,$BB,$AD,$76,$03,$38   ;C0DFFA|        |C0E539;
db $FD,$02,$00,$10,$04,$49,$FF,$FF   ;C0E002|        |000002;
db $1A,$85,$00,$A7,$38,$E6,$38,$E6   ;C0E00A|        |      ;
db $38,$C5,$00,$B0,$03,$82,$19,$05   ;C0E012|        |      ;
db $A7,$38,$E6,$38,$E6,$38,$82,$16   ;C0E01A|        |000038;
db $05,$BB,$AD,$74,$03,$38,$FD,$00   ;C0E022|        |0000BB;
db $00,$10,$04,$49,$FF,$FF,$1A,$85   ;C0E02A|        |      ;
db $00,$A7,$38,$E6,$38,$E6,$38,$C5   ;C0E032|        |      ;
db $00,$90,$03,$82,$F3,$04,$A7,$38   ;C0E03A|        |      ;
db $E6,$38,$E6,$38,$82,$F0,$04,$BB   ;C0E042|        |000038;
db $AD,$76,$03,$38,$FD,$02,$00,$10   ;C0E04A|        |000376;
db $04,$49,$FF,$FF,$1A,$85,$00,$A7   ;C0E052|        |000049;
db $38,$E6,$38,$E6,$38,$C5,$00,$90   ;C0E05A|        |      ;
db $03,$82,$CD,$04,$A7,$38,$E6,$38   ;C0E062|        |000082;
db $E6,$38,$82,$CA,$04,$BB,$BD,$16   ;C0E06A|        |000038;
db $00,$89,$00,$80,$F0,$03,$82,$BC   ;C0E072|        |      ;
db $04,$A7,$38,$E6,$38,$E6,$38,$82   ;C0E07A|        |0000A7;
db $B5,$04,$BB,$BD,$16,$00,$89,$00   ;C0E082|        |000004;
db $80,$D0,$03,$82,$A7,$04,$A7,$38   ;C0E08A|        |C0E05C;
db $E6,$38,$E6,$38,$82,$A0,$04       ;C0E092|        |000038;
TYX                                  ;C0E099|BB      |      ;
LDA.W $0374                          ;C0E09A|AD7403  |810374;
CMP.W $0000,X                        ;C0E09D|DD0000  |810000;
BCC .UNREACH_C0E0AE                   ;C0E0A0|900C    |C0E0AE;
LDA.W $001C,X                        ;C0E0A2|BD1C00  |81001C;
ORA.W #$4000                         ;C0E0A5|090040  |      ;
STA.W $001C,X                        ;C0E0A8|9D1C00  |81001C;
BRL .ret_in_tmp                      ;C0E0AB|828904  |C0E537;

.UNREACH_C0E0AE:
db $BD,$1C,$00,$29,$FF,$BF,$9D,$1C   ;C0E0AE|        |00001C;
db $00,$82,$7D,$04,$BB,$AD,$76,$03   ;C0E0B6|        |      ;
db $DD,$02,$00,$90,$0C,$BD,$1C,$00   ;C0E0BE|        |000002;
db $09,$00,$80,$9D,$1C,$00,$82,$68   ;C0E0C6|        |      ;
db $04,$BD,$1C,$00,$29,$FF,$7F,$9D   ;C0E0CE|        |0000BD;
db $1C,$00,$82,$5C,$04               ;C0E0D6|        |008200;
TYX                                  ;C0E0DB|BB      |      ;
SEP #$20                             ;C0E0DC|E220    |      ;
LDA.B $3A                            ;C0E0DE|A53A    |00003A;
STA.W $0036,X                        ;C0E0E0|9D3600  |810036;
REP #$20                             ;C0E0E3|C220    |      ;
LDA.B CopTemp                            ;C0E0E5|A538    |000038;
STA.W $0018,X                        ;C0E0E7|9D1800  |810018;
BRL .ret_in_a                      ;C0E0EA|824C04  |C0E539;
TYX                                  ;C0E0ED|BB      |      ;
LDA.B [CopTemp]                          ;C0E0EE|A738    |000038;
INC.B CopTemp                            ;C0E0F0|E638    |000038;
AND.W #$00FF                         ;C0E0F2|29FF00  |      ;
STA.W $001E,X                        ;C0E0F5|9D1E00  |81001E;
STZ.W $0020,X                        ;C0E0F8|9E2000  |810020;
JSL.L CODE_82865B                    ;C0E0FB|225B8682|82865B;
JSL.L CODE_8286CD                    ;C0E0FF|22CD8682|8286CD;
BRL .set_script_ret_addr_and_get_out                      ;C0E103|823604  |C0E53C;
db $BB,$A7,$38,$E6,$38,$29,$FF,$00   ;C0E106|        |      ;
db $9D,$1E,$00,$9E,$20,$00,$A7,$38   ;C0E10E|        |00001E;
db $E6,$38,$29,$FF,$00,$9D,$2A,$00   ;C0E116|        |000038;
db $22,$5B,$86,$82,$22,$CD,$86,$82   ;C0E11E|        |82865B;
db $82,$13,$04                       ;C0E126|        |C0E53C;
TYX                                  ;C0E129|BB      |      ;
DEC.W $0026,X                        ;C0E12A|DE2600  |810026;
BPL .CODE_C0E138                      ;C0E12D|1009    |C0E138;
JSL.L CODE_82865B                    ;C0E12F|225B8682|82865B;
BCC .CODE_C0E13E                      ;C0E133|9009    |C0E13E;
BRL .ret_in_tmp                      ;C0E135|82FF03  |C0E537;

.CODE_C0E138:
LDA.W $000E,X                        ;C0E138|BD0E00  |81000E;
STA.W $0014,X                        ;C0E13B|9D1400  |810014;

.CODE_C0E13E:
JSL.L CODE_8286CD                    ;C0E13E|22CD8682|8286CD;
BRL .ret_out_of_script                      ;C0E142|82FC03  |C0E541;
db $BB,$DE,$26,$00,$10,$0E,$22,$5B   ;C0E145|        |      ;
db $86,$82,$90,$0E,$DE,$2A,$00,$D0   ;C0E14D|        |000082;
db $F5,$82,$DE,$03,$BD,$0E,$00,$9D   ;C0E155|        |000082;
db $14,$00,$22,$CD,$86,$82,$82,$DB   ;C0E15D|        |000000;
db $03                               ;C0E165|        |0000BB;
TYX                                  ;C0E166|BB      |      ;
LDA.W $001C,X                        ;C0E167|BD1C00  |81001C;
BIT.W #$4000                         ;C0E16A|890040  |      ;
BNE .CODE_C0E175                      ;C0E16D|D006    |C0E175;
ORA.W #$4000                         ;C0E16F|090040  |      ;
STA.W $001C,X                        ;C0E172|9D1C00  |81001C;

.CODE_C0E175:
BRL .ret_in_tmp                      ;C0E175|82BF03  |C0E537;
TYX                                  ;C0E178|BB      |      ;
LDA.W $001C,X                        ;C0E179|BD1C00  |81001C;
BIT.W #$4000                         ;C0E17C|890040  |      ;
BEQ .CODE_C0E187                      ;C0E17F|F006    |C0E187;
AND.W #$BFFF                         ;C0E181|29FFBF  |      ;
STA.W $001C,X                        ;C0E184|9D1C00  |81001C;

.CODE_C0E187:
BRL .ret_in_tmp                      ;C0E187|82AD03  |C0E537;
TYX                                  ;C0E18A|BB      |      ;
LDA.W $001C,X                        ;C0E18B|BD1C00  |81001C;
BIT.W #$8000                         ;C0E18E|890080  |      ;
BNE .CODE_C0E199                      ;C0E191|D006    |C0E199;
ORA.W #$8000                         ;C0E193|090080  |      ;
STA.W $001C,X                        ;C0E196|9D1C00  |81001C;

.CODE_C0E199:
BRL .ret_in_tmp                      ;C0E199|829B03  |C0E537;
db $BB,$BD,$1C,$00,$89,$00,$80,$F0   ;C0E19C|        |      ;
db $06,$29,$FF,$7F,$9D,$1C,$00,$82   ;C0E1A4|        |000029;
db $89,$03                           ;C0E1AC|        |      ;
TYX                                  ;C0E1AE|BB      |      ;
LDY.W #$0004                         ;C0E1AF|A00400  |      ;
LDA.W $0374                          ;C0E1B2|AD7403  |810374;
SEC                                  ;C0E1B5|38      |      ;
SBC.W $0000,X                        ;C0E1B6|FD0000  |810000;
BEQ .CODE_C0E1D0                      ;C0E1B9|F015    |C0E1D0;
BPL .CODE_C0E1C9                      ;C0E1BB|100C    |C0E1C9;
EOR.W #$FFFF                         ;C0E1BD|49FFFF  |      ;
CMP.B [CopTemp]                          ;C0E1C0|C738    |000038;
BCC .CODE_C0E1D0                      ;C0E1C2|900C    |C0E1D0;
LDY.W #$0002                         ;C0E1C4|A00200  |      ;
BRA .CODE_C0E1D0                      ;C0E1C7|8007    |C0E1D0;

.CODE_C0E1C9:
CMP.B [CopTemp]                          ;C0E1C9|C738    |000038;
BCC .CODE_C0E1D0                      ;C0E1CB|9003    |C0E1D0;
LDY.W #$0006                         ;C0E1CD|A00600  |      ;

.CODE_C0E1D0:
LDA.B [CopTemp],Y                        ;C0E1D0|B738    |000038;
BRL .ret_in_a                      ;C0E1D2|826403  |C0E539;
TYX                                  ;C0E1D5|BB      |      ;
LDY.W #$0004                         ;C0E1D6|A00400  |      ;
LDA.W $0376                          ;C0E1D9|AD7603  |810376;
SEC                                  ;C0E1DC|38      |      ;
SBC.W $0002,X                        ;C0E1DD|FD0200  |810002;
BEQ .CODE_C0E1F7                      ;C0E1E0|F015    |C0E1F7;
BPL .CODE_C0E1F0                      ;C0E1E2|100C    |C0E1F0;
EOR.W #$FFFF                         ;C0E1E4|49FFFF  |      ;
CMP.B [CopTemp]                          ;C0E1E7|C738    |000038;
BCC .CODE_C0E1F7                      ;C0E1E9|900C    |C0E1F7;
LDY.W #$0002                         ;C0E1EB|A00200  |      ;
BRA .CODE_C0E1F7                      ;C0E1EE|8007    |C0E1F7;

.CODE_C0E1F0:
CMP.B [CopTemp]                          ;C0E1F0|C738    |000038;
BCC .CODE_C0E1F7                      ;C0E1F2|9003    |C0E1F7;
LDY.W #$0006                         ;C0E1F4|A00600  |      ;

.CODE_C0E1F7:
LDA.B [CopTemp],Y                        ;C0E1F7|B738    |000038;
BRL .ret_in_a                      ;C0E1F9|823D03  |C0E539;
TYX                                  ;C0E1FC|BB      |      ;
LDY.W #$0000                         ;C0E1FD|A00000  |      ;
LDA.W $0374                          ;C0E200|AD7403  |810374;
SEC                                  ;C0E203|38      |      ;
SBC.W $0000,X                        ;C0E204|FD0000  |810000;
BPL .CODE_C0E20D                      ;C0E207|1004    |C0E20D;
EOR.W #$FFFF                         ;C0E209|49FFFF  |      ;
INC A                                ;C0E20C|1A      |      ;

.CODE_C0E20D:
PHA                                  ;C0E20D|48      |      ;
LDA.W $0376                          ;C0E20E|AD7603  |810376;
SEC                                  ;C0E211|38      |      ;
SBC.W $0002,X                        ;C0E212|FD0200  |810002;
BPL .CODE_C0E21B                      ;C0E215|1004    |C0E21B;
EOR.W #$FFFF                         ;C0E217|49FFFF  |      ;
INC A                                ;C0E21A|1A      |      ;

.CODE_C0E21B:
CMP.B $01,S                          ;C0E21B|C301    |000001;
BCC .CODE_C0E224                      ;C0E21D|9005    |C0E224;
LDY.W #$0002                         ;C0E21F|A00200  |      ;
BRA .CODE_C0E224                      ;C0E222|8000    |C0E224;

.CODE_C0E224:
PLA                                  ;C0E224|68      |      ;
LDA.B [CopTemp],Y                        ;C0E225|B738    |000038;
BRL .ret_in_a                      ;C0E227|820F03  |C0E539;
TYX                                  ;C0E22A|BB      |      ;
LDA.B [CopTemp]                          ;C0E22B|A738    |000038;
INC.B CopTemp                            ;C0E22D|E638    |000038;
AND.W #$00FF                         ;C0E22F|29FF00  |      ;
STA.W $001E,X                        ;C0E232|9D1E00  |81001E;
STZ.W $0020,X                        ;C0E235|9E2000  |810020;
LDA.B CopTemp                            ;C0E238|A538    |000038;
STA.W $0018,X                        ;C0E23A|9D1800  |810018;
LDA.W $0016,X                        ;C0E23D|BD1600  |810016;
AND.W #$FFFB                         ;C0E240|29FBFF  |      ;
STA.W $0016,X                        ;C0E243|9D1600  |810016;
BRL .ret_in_tmp                      ;C0E246|82EE02  |C0E537;
TYX                                  ;C0E249|BB      |      ;
LDA.W $0016,X                        ;C0E24A|BD1600  |810016;
BIT.W #$0004                         ;C0E24D|890400  |      ;
BNE .CODE_C0E25E                      ;C0E250|D00C    |C0E25E;
JSL.L CODE_80891F                    ;C0E252|221F8980|80891F;
BCC .CODE_C0E25B                      ;C0E256|9003    |C0E25B;
BRL .skip_2_args                      ;C0E258|82D802  |C0E533;

.CODE_C0E25B:
BRL .ret_out_of_script                      ;C0E25B|82E302  |C0E541;

.CODE_C0E25E:
LDA.B [CopTemp]                          ;C0E25E|A738    |000038;
INC.B CopTemp                            ;C0E260|E638    |000038;
INC.B CopTemp                            ;C0E262|E638    |000038;
BRL .ret_in_a                      ;C0E264|82D202  |C0E539;
TYX                                  ;C0E267|BB      |      ;
LDA.B [CopTemp]                          ;C0E268|A738    |000038;
INC.B CopTemp                            ;C0E26A|E638    |000038;
INC.B CopTemp                            ;C0E26C|E638    |000038;
CLC                                  ;C0E26E|18      |      ;
ADC.W $0000,X                        ;C0E26F|7D0000  |810000;
STA.W $0000,X                        ;C0E272|9D0000  |810000;
BRL .ret_in_tmp                      ;C0E275|82BF02  |C0E537;
TYX                                  ;C0E278|BB      |      ;
LDA.B [CopTemp]                          ;C0E279|A738    |000038;
INC.B CopTemp                            ;C0E27B|E638    |000038;
INC.B CopTemp                            ;C0E27D|E638    |000038;
CLC                                  ;C0E27F|18      |      ;
ADC.W $0002,X                        ;C0E280|7D0200  |810002;
STA.W $0002,X                        ;C0E283|9D0200  |810002;
BRL .ret_in_tmp                      ;C0E286|82AE02  |C0E537;
TYX                                  ;C0E289|BB      |      ;
LDA.B [CopTemp]                          ;C0E28A|A738    |000038;
INC.B CopTemp                            ;C0E28C|E638    |000038;
INC.B CopTemp                            ;C0E28E|E638    |000038;
CLC                                  ;C0E290|18      |      ;
ADC.W $0000,X                        ;C0E291|7D0000  |810000;
STA.W $0000,X                        ;C0E294|9D0000  |810000;
LDA.B [CopTemp]                          ;C0E297|A738    |000038;
INC.B CopTemp                            ;C0E299|E638    |000038;
INC.B CopTemp                            ;C0E29B|E638    |000038;
CLC                                  ;C0E29D|18      |      ;
ADC.W $0002,X                        ;C0E29E|7D0200  |810002;
STA.W $0002,X                        ;C0E2A1|9D0200  |810002;
BRL .ret_in_tmp                      ;C0E2A4|829002  |C0E537;
TYX                                  ;C0E2A7|BB      |      ;
LDA.W $001C,X                        ;C0E2A8|BD1C00  |81001C;
AND.W #$CFFF                         ;C0E2AB|29FFCF  |      ;
PHA                                  ;C0E2AE|48      |      ;
LDA.B [CopTemp]                          ;C0E2AF|A738    |000038;
INC.B CopTemp                            ;C0E2B1|E638    |000038;
AND.W #$00FF                         ;C0E2B3|29FF00  |      ;
XBA                                  ;C0E2B6|EB      |      ;
ORA.B $01,S                          ;C0E2B7|0301    |000001;
STA.W $001C,X                        ;C0E2B9|9D1C00  |81001C;
PLA                                  ;C0E2BC|68      |      ;
BRL .ret_in_tmp                      ;C0E2BD|827702  |C0E537;
TYX                                  ;C0E2C0|BB      |      ;
LDA.W $001A,X                        ;C0E2C1|BD1A00  |81001A;
ORA.W #$4000                         ;C0E2C4|090040  |      ;
STA.W $001A,X                        ;C0E2C7|9D1A00  |81001A;
BRL .ret_in_tmp                      ;C0E2CA|826A02  |C0E537;
TYX                                  ;C0E2CD|BB      |      ;
LDA.W $001A,X                        ;C0E2CE|BD1A00  |81001A;
ORA.W #$2000                         ;C0E2D1|090020  |      ;
STA.W $001A,X                        ;C0E2D4|9D1A00  |81001A;
BRL .ret_in_tmp                      ;C0E2D7|825D02  |C0E537;
TYX                                  ;C0E2DA|BB      |      ;
LDA.W $001C,X                        ;C0E2DB|BD1C00  |81001C;
PHA                                  ;C0E2DE|48      |      ;
AND.W #$3FFF                         ;C0E2DF|29FF3F  |      ;
STA.W $001C,X                        ;C0E2E2|9D1C00  |81001C;
PLA                                  ;C0E2E5|68      |      ;
LDY.W #$0000                         ;C0E2E6|A00000  |      ;
AND.W #$C000                         ;C0E2E9|2900C0  |      ;
BEQ .CODE_C0E2FE                      ;C0E2EC|F010    |C0E2FE;
INY                                  ;C0E2EE|C8      |      ;
INY                                  ;C0E2EF|C8      |      ;
CMP.W #$4000                         ;C0E2F0|C90040  |      ;
BEQ .CODE_C0E2FE                      ;C0E2F3|F009    |C0E2FE;
INY                                  ;C0E2F5|C8      |      ;
INY                                  ;C0E2F6|C8      |      ;
CMP.W #$8000                         ;C0E2F7|C90080  |      ;
BEQ .CODE_C0E2FE                      ;C0E2FA|F002    |C0E2FE;
INY                                  ;C0E2FC|C8      |      ;
INY                                  ;C0E2FD|C8      |      ;

.CODE_C0E2FE:
LDA.B [CopTemp],Y                        ;C0E2FE|B738    |000038;
BRL .ret_in_a                      ;C0E300|823602  |C0E539;
db $BB,$BD,$1A,$00,$29,$FF,$BF,$9D   ;C0E303|        |      ;
db $1A,$00,$82,$27,$02,$BB,$BD,$1A   ;C0E30B|        |      ;
db $00,$29,$FF,$DF,$9D,$1A,$00,$82   ;C0E313|        |      ;
db $1A,$02                           ;C0E31B|        |      ;
TYX                                  ;C0E31D|BB      |      ;
LDA.B [CopTemp]                          ;C0E31E|A738    |000038;
INC.B CopTemp                            ;C0E320|E638    |000038;
INC.B CopTemp                            ;C0E322|E638    |000038;
STA.W $0022,X                        ;C0E324|9D2200  |810022;
SEP #$20                             ;C0E327|E220    |      ;
LDA.B [CopTemp]                          ;C0E329|A738    |000038;
INC.B CopTemp                            ;C0E32B|E638    |000038;
BNE .CODE_C0E331                      ;C0E32D|D002    |C0E331;
db $E6,$39                           ;C0E32F|        |000039;

.CODE_C0E331:
STA.W $0024,X                        ;C0E331|9D2400  |810024;
REP #$20                             ;C0E334|C220    |      ;
BRL .ret_in_tmp                      ;C0E336|82FE01  |C0E537;
TYX                                  ;C0E339|BB      |      ;
LDA.B [CopTemp]                          ;C0E33A|A738    |000038;
INC.B CopTemp                            ;C0E33C|E638    |000038;
INC.B CopTemp                            ;C0E33E|E638    |000038;
STA.W $0034,X                        ;C0E340|9D3400  |810034;
SEP #$20                             ;C0E343|E220    |      ;
LDA.B [CopTemp]                          ;C0E345|A738    |000038;
INC.B CopTemp                            ;C0E347|E638    |000038;
BNE .CODE_C0E34D                      ;C0E349|D002    |C0E34D;
db $E6,$39                           ;C0E34B|        |000039;

.CODE_C0E34D:
STA.W $002C,X                        ;C0E34D|9D2C00  |81002C;
REP #$20                             ;C0E350|C220    |      ;
LDA.W $001A,X                        ;C0E352|BD1A00  |81001A;
ORA.W #$8000                         ;C0E355|090080  |      ;
STA.W $001A,X                        ;C0E358|9D1A00  |81001A;
BRL .ret_in_tmp                      ;C0E35B|82D901  |C0E537;
db $BB,$BD,$1C,$00,$29,$FF,$F1,$48   ;C0E35E|        |      ;
db $A7,$38,$E6,$38,$29,$FF,$00,$EB   ;C0E366|        |000038;
db $03,$01,$9D,$1C,$00,$68,$82,$C0   ;C0E36E|        |000001;
db $01,$BB,$20,$B2,$E6,$A7,$38,$E6   ;C0E376|        |0000BB;
db $38,$E6,$38,$99,$18,$00,$8A,$A7   ;C0E37E|        |      ;
db $38,$E6,$38,$29,$FF,$00,$E2,$20   ;C0E386|        |      ;
db $99,$36,$00,$C2,$20,$A7,$38,$E6   ;C0E38E|        |000036;
db $38,$E6,$38,$99,$00,$00,$A7,$38   ;C0E396|        |      ;
db $E6,$38,$E6,$38,$99,$02,$00,$A7   ;C0E39E|        |000038;
db $38,$E6,$38,$E6,$38,$99,$16,$00   ;C0E3A6|        |      ;
db $82,$86,$01                       ;C0E3AE|        |C0E537;
TYX                                  ;C0E3B1|BB      |      ;
JSR.W CODE_C0E6DA                    ;C0E3B2|20DAE6  |C0E6DA;
LDA.B [CopTemp]                          ;C0E3B5|A738    |000038;
INC.B CopTemp                            ;C0E3B7|E638    |000038;
INC.B CopTemp                            ;C0E3B9|E638    |000038;
STA.W $0018,Y                        ;C0E3BB|991800  |810018;
TXA                                  ;C0E3BE|8A      |      ;
LDA.B [CopTemp]                          ;C0E3BF|A738    |000038;
INC.B CopTemp                            ;C0E3C1|E638    |000038;
AND.W #$00FF                         ;C0E3C3|29FF00  |      ;
SEP #$20                             ;C0E3C6|E220    |      ;
STA.W $0036,Y                        ;C0E3C8|993600  |810036;
REP #$20                             ;C0E3CB|C220    |      ;
LDA.B [CopTemp]                          ;C0E3CD|A738    |000038;
INC.B CopTemp                            ;C0E3CF|E638    |000038;
INC.B CopTemp                            ;C0E3D1|E638    |000038;
STA.W $0000,Y                        ;C0E3D3|990000  |810000;
LDA.B [CopTemp]                          ;C0E3D6|A738    |000038;
INC.B CopTemp                            ;C0E3D8|E638    |000038;
INC.B CopTemp                            ;C0E3DA|E638    |000038;
STA.W $0002,Y                        ;C0E3DC|990200  |810002;
LDA.B [CopTemp]                          ;C0E3DF|A738    |000038;
INC.B CopTemp                            ;C0E3E1|E638    |000038;
INC.B CopTemp                            ;C0E3E3|E638    |000038;
STA.W $0016,Y                        ;C0E3E5|991600  |810016;
BRL .ret_in_tmp                      ;C0E3E8|824C01  |C0E537;
TYX                                  ;C0E3EB|BB      |      ;
LDA.W $0016,X                        ;C0E3EC|BD1600  |810016;
BIT.W #$8000                         ;C0E3EF|890080  |      ;
BNE .CODE_C0E3F7                      ;C0E3F2|D003    |C0E3F7;
db $82,$3E,$01                       ;C0E3F4|        |C0E535;

.CODE_C0E3F7:
LDA.W $0000,X                        ;C0E3F7|BD0000  |810000;
CMP.W $0342                          ;C0E3FA|CD4203  |810342;
BCC .CODE_C0E402                      ;C0E3FD|9003    |C0E402;
db $82,$33,$01                       ;C0E3FF|        |C0E535;

.CODE_C0E402:
LDA.W $0002,X                        ;C0E402|BD0200  |810002;
CMP.W $0344                          ;C0E405|CD4403  |810344;
BCC .CODE_C0E40D                      ;C0E408|9003    |C0E40D;
db $82,$28,$01                       ;C0E40A|        |C0E535;

.CODE_C0E40D:
LDA.B CopTemp                            ;C0E40D|A538    |000038;
DEC A                                ;C0E40F|3A      |      ;
DEC A                                ;C0E410|3A      |      ;
STA.W $0018,X                        ;C0E411|9D1800  |810018;
LDA.B [CopTemp]                          ;C0E414|A738    |000038;
INC.B CopTemp                            ;C0E416|E638    |000038;
AND.W #$00FF                         ;C0E418|29FF00  |      ;
STA.W $0014,X                        ;C0E41B|9D1400  |810014;
BRL .ret_out_of_script                      ;C0E41E|822001  |C0E541;
db $BB,$DA,$A7,$38,$E6,$38,$E6,$38   ;C0E421|        |      ;
db $18,$7D,$00,$00,$85,$16,$A7,$38   ;C0E429|        |      ;
db $E6,$38,$E6,$38,$18,$7D,$02,$00   ;C0E431|        |000038;
db $38,$E9,$10,$00,$85,$18,$22,$E0   ;C0E439|        |      ;
db $81,$83,$BF,$00,$80,$7F,$FA,$29   ;C0E441|        |000083;
db $0F,$00,$F0,$09,$A7,$38,$E6,$38   ;C0E449|        |09F000;
db $E6,$38,$82,$E3,$00,$82,$DA,$00   ;C0E451|        |000038;
db $BB,$20,$B2,$E6,$A7,$38,$E6,$38   ;C0E459|        |      ;
db $E6,$38,$99,$18,$00,$8A,$A7,$38   ;C0E461|        |000038;
db $E6,$38,$29,$FF,$00,$E2,$20,$99   ;C0E469|        |000038;
db $36,$00,$C2,$20,$A7,$38,$E6,$38   ;C0E471|        |000000;
db $E6,$38,$99,$16,$00,$82,$B6,$00   ;C0E479|        |000038;
TYX                                  ;C0E481|BB      |      ;
JSR.W CODE_C0E6DA                    ;C0E482|20DAE6  |C0E6DA;
LDA.B [CopTemp]                          ;C0E485|A738    |000038;
INC.B CopTemp                            ;C0E487|E638    |000038;
INC.B CopTemp                            ;C0E489|E638    |000038;
STA.W $0018,Y                        ;C0E48B|991800  |810018;
TXA                                  ;C0E48E|8A      |      ;
LDA.B [CopTemp]                          ;C0E48F|A738    |000038;
INC.B CopTemp                            ;C0E491|E638    |000038;
AND.W #$00FF                         ;C0E493|29FF00  |      ;
SEP #$20                             ;C0E496|E220    |      ;
STA.W $0036,Y                        ;C0E498|993600  |810036;
REP #$20                             ;C0E49B|C220    |      ;
LDA.B [CopTemp]                          ;C0E49D|A738    |000038;
INC.B CopTemp                            ;C0E49F|E638    |000038;
INC.B CopTemp                            ;C0E4A1|E638    |000038;
STA.W $0016,Y                        ;C0E4A3|991600  |810016;
BRL .ret_in_tmp                      ;C0E4A6|828E00  |C0E537;
db $BB,$20,$B2,$E6,$A7,$38,$E6,$38   ;C0E4A9|        |      ;
db $E6,$38,$99,$18,$00,$8A,$A7,$38   ;C0E4B1|        |000038;
db $E6,$38,$29,$FF,$00,$E2,$20,$99   ;C0E4B9|        |000038;
db $36,$00,$C2,$20,$A7,$38,$E6,$38   ;C0E4C1|        |000000;
db $E6,$38,$18,$7D,$00,$00,$99,$00   ;C0E4C9|        |000038;
db $00,$A7,$38,$E6,$38,$E6,$38,$18   ;C0E4D1|        |      ;
db $7D,$02,$00,$99,$02,$00,$A7,$38   ;C0E4D9|        |000002;
db $E6,$38,$E6,$38,$99,$16,$00,$82   ;C0E4E1|        |000038;
db $4C,$00                           ;C0E4E9|        |C0BB00;
TYX                                  ;C0E4EB|BB      |      ;
JSR.W CODE_C0E6DA                    ;C0E4EC|20DAE6  |C0E6DA;
LDA.B [CopTemp]                          ;C0E4EF|A738    |000038;
INC.B CopTemp                            ;C0E4F1|E638    |000038;
INC.B CopTemp                            ;C0E4F3|E638    |000038;
STA.W $0018,Y                        ;C0E4F5|991800  |810018;
TXA                                  ;C0E4F8|8A      |      ;
LDA.B [CopTemp]                          ;C0E4F9|A738    |000038;
INC.B CopTemp                            ;C0E4FB|E638    |000038;
AND.W #$00FF                         ;C0E4FD|29FF00  |      ;
SEP #$20                             ;C0E500|E220    |      ;
STA.W $0036,Y                        ;C0E502|993600  |810036;
REP #$20                             ;C0E505|C220    |      ;
LDA.B [CopTemp]                          ;C0E507|A738    |000038;
INC.B CopTemp                            ;C0E509|E638    |000038;
INC.B CopTemp                            ;C0E50B|E638    |000038;
CLC                                  ;C0E50D|18      |      ;
ADC.W $0000,X                        ;C0E50E|7D0000  |810000;
STA.W $0000,Y                        ;C0E511|990000  |810000;
LDA.B [CopTemp]                          ;C0E514|A738    |000038;
INC.B CopTemp                            ;C0E516|E638    |000038;
INC.B CopTemp                            ;C0E518|E638    |000038;
CLC                                  ;C0E51A|18      |      ;
ADC.W $0002,X                        ;C0E51B|7D0200  |810002;
STA.W $0002,Y                        ;C0E51E|990200  |810002;
LDA.B [CopTemp]                          ;C0E521|A738    |000038;
INC.B CopTemp                            ;C0E523|E638    |000038;
INC.B CopTemp                            ;C0E525|E638    |000038;
STA.W $0016,Y                        ;C0E527|991600  |810016;
BRL .ret_in_tmp                      ;C0E52A|820A00  |C0E537;

.skip_5_args:
INC.B CopTemp                            ;C0E52D|E638    |000038;

.skip_4_args:
INC.B CopTemp                            ;C0E52F|E638    |000038;

.skip_3_args:
INC.B CopTemp                            ;C0E531|E638    |000038;

.skip_2_args:
INC.B CopTemp                            ;C0E533|E638    |000038;
.skip_1_arg:
INC.B CopTemp                            ;C0E535|E638    |000038;

.ret_in_tmp:
LDA.B CopTemp

.ret_in_a:
STA.B $02,S                          ;C0E539|8302    |000002;
RTI                                  ;C0E53B|40      |      ;

.set_script_ret_addr_and_get_out:
    LDA.B CopTemp
    STA.W $0018, X

; returns out of the script back to the script handling function
.ret_out_of_script:
    PLA
    PLA
    RTL
