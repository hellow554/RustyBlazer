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
    dw .cop_0C, .cop_0D, $000000, $000000
    dw .cop_10, .cop_11, .cop_12, .cop_13
    dw .cop_14, .cop_15, .cop_16, .cop_17
    dw .cop_18, .cop_19, .cop_1A, .cop_1B
    dw .cop_1C, .cop_1D, .cop_1E, .cop_1F
    dw .cop_20, .cop_21, .cop_22, .cop_23
    dw .cop_24, .cop_25, .cop_26, .cop_27
    dw .cop_28, .cop_29, .cop_2A, .cop_2B
    dw $000000, $000000, .cop_2E, .cop_2F
    dw .cop_30, .cop_31, .cop_32, .cop_33
    dw .cop_34, .cop_35, .cop_36, .cop_37
    dw .cop_38, .cop_39, .cop_3A, .cop_3B
    dw .cop_3C, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw $00FFFF, $00FFFF, $00FFFF, $00FFFF
    dw .cop_80, .cop_81, .cop_82, .cop_83
    dw .cop_84, .cop_85, .cop_86, .cop_87
    dw .cop_88, .cop_89, .cop_8A, .cop_8B
    dw .cop_8C, .cop_8D, .cop_8E, .cop_8F
    dw .cop_90, .cop_91, .cop_92, .cop_93
    dw .cop_94, .cop_95, .cop_96, .cop_97
    dw .cop_98, .cop_99, .cop_9A, .cop_9B
    dw .cop_9C, .cop_9D, .cop_9E, .cop_9F
    dw .cop_A0, .cop_A1, .cop_A2, .cop_A3
    dw .cop_A4, .cop_A5, .cop_A6, .cop_A7
    dw .cop_A8, .cop_A9, .cop_AA, .cop_AB
    dw .cop_AC, .cop_AD, .cop_AE, .cop_AF
    dw .cop_B0, .cop_B1, .cop_B2

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
    STA.W TeleportPos.facing
    LDA.B [CopTemp] ; load X
    INC.B CopTemp
    INC.B CopTemp
    STA.W TeleportPos.x
    LDA.B [CopTemp] ; load Y
    INC.B CopTemp
    INC.B CopTemp
    STA.W TeleportPos.y
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
    BRL .cop_85 ; I'm not really sure, why it isn't here, but so far away

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
    JSL.L EnterPlayerName
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
    LDA.W LairDataStructure.lair_dependency, Y
    BEQ ..no_dependency ; branch if it has no dependency, e.g. it's zero
    LDY.W #lair_sealed_table
    JSL.L checkIfBitIsSet
    BCC ..not_sealed ; if the lair is not sealed, jump

..no_dependency:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    LDY.W #lair_sealed_table
    JSL.L checkIfBitIsSet
    BCC ..dont_jump ; if the lair is not sealed, jump

    LDA.W $0016, X ; load entity id
    AND.W #$DFFF
    STA.W $0016, X
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

..dont_jump:
    BRL .ret_out_of_script

..not_sealed:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp

    STA.W $0034, X
    PHX
    TAX
    LDA.L $7F0203,X

    PLX
    BIT.W #$0040
    BEQ ..dont_jump
    LDA.W $16, X ; entity id
    ORA.W #$10
    STA.W $16, X
    BRL .skip_2_args

.cop_3C:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $03E5
    BRL .ret_in_tmp

.cop_80:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $001E, X ; store facing direction
    STZ.W $0020, X
    LDA.B CopTemp
    STA.W $0018, X
    BRL .ret_in_tmp

.cop_81:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$00FF
    STA.W $001E, X ; store facing direction
    STZ.W $0020, X
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$00FF
    STA.W $002A,X
    LDA.B CopTemp
    STA.W $0018,X
    BRL .ret_in_tmp

.cop_82:
    TYX
    JSL.L CODE_C0891F
    BCC ..out
    BRL .ret_in_tmp

..out:
    BRL .ret_out_of_script


.cop_83:
    TYX
..loop:
    JSL.L CODE_C0891F
    BCC ..out
    DEC.W $002A,X
    BNE ..loop
    BRL .ret_in_tmp

..out:
    BRL .ret_out_of_script

.cop_84:
    TYX
    JSR.W CODE_C0E6B2
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y ; script ret addr
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y ; script ret bank
    REP #$20
    BRL .ret_in_tmp

.cop_85:
    TYX
    JSR.W CODE_C0E6DA
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y ; script ret addr
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y ; script ret bank
    REP #$20
    BRL .ret_in_tmp

.cop_86
    TYX
    LDY.W $3C, X
    BNE .CODE_C0DF9B
    LDY.W $3E, X
    STY.W $06B2
    BEQ .CODE_C0DFAF
    LDA.W #0
    STA.W $3C, Y
    BRA .CODE_C0DFAF

.CODE_C0DF9B:
    LDA.W $3E, X
    STA.W $3E, Y
    BNE .CODE_C0DFA8
    STY.W $06B4
    BRA .CODE_C0DFAF

.CODE_C0DFA8:
    TAY
    LDA.W $3C, X
    STA.W $3C, Y

.CODE_C0DFAF:
    SEP #$20
    DEC.B $4A
    DEC.B $4A
    REP #$20
    TXA
    STA.B ($4A)
    BRL .ret_in_tmp

.cop_87:
    TYX
    LDA.W $1C, X
    EOR.W #$4000
    STA.W $1C, X
    BRL .ret_in_tmp

.cop_88:
    TYX
    LDA.W $1C, X
    EOR.W #$8000
    STA.W $1C, X
    BRL .ret_in_tmp

.cop_89:
    TYX
    ; do an absolute comparision to the players x position
    ; | px - ex |, where px is the players x and ex is the entities x position
    LDA.W PlayerPosReal.x
    SEC
    SBC.W $0, X
    ; if that number is negative, do a twos complement
    BPL + : EOR.W #$FFFF : INC : +
    STA.B $0
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CMP.B $0
    ; jump to arg if player is inside
    BCS + : BRL .skip_2_args : +
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_8A:
    TYX
    ; do an absolute comparision to the players y position
    ; | py - ey |, where py is the players y and ey is the entities y position
    LDA.W PlayerPosReal.y
    SEC
    SBC.W $2, X
    ; if that number is negative, do a twos complement
    BPL + : EOR.W #$FFFF : INC : +
    STA.B $0
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CMP.B $0
    ; jump to arg if player is inside
    BCS + : BRL .skip_2_args : +
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_8B:
    TYX
    ; do an absolute comparision to the players x position
    ; | px - ex |, where px is the players x and ex is the entities x position
    LDA.W PlayerPosReal.x
    SEC
    SBC.W $0, X
    ; if that number is negative, do a twos complement
    BPL + : EOR.W #$FFFF : INC : +
    STA.B $0
    LDA [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CMP.B $0
    ; jump to arg if the player is outside
    BCC + : BRL .skip_2_args : +
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_8C:
    TYX
    ; do an absolute comparision to the players y position
    ; | py - ey |, where py is the players y and ey is the entities y position
    LDA.W PlayerPosReal.y
    SEC
    SBC.W $2, X
    ; if that number is negative, do a twos complement
    BPL + : EOR.W #$FFFF : INC : +
    STA.B $0
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CMP.B $0
    ; jump to arg if player is inside
    BCC + : BRL .skip_2_args : +
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_8D:
    TYX
    LDA.W $16, X
    BIT.W #$8000
    BEQ + : BRL .ret_in_tmp : +
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_8E:
    TYX
    LDA.W $16, X
    BIT.W #$8000
    BNE + : BRL .ret_in_tmp : +
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a


.cop_8F:
    TYX
    LDA.W PlayerPosReal.x
    CMP.W $0, X
    BCC +

    LDA.W $1C, X
    ORA.W #$4000
    STA.W $1C, X
    BRL .ret_in_tmp
+
    LDA.W $1C, X
    AND.W #$BFFF
    STA.W $1C, X
    BRL .ret_in_tmp

.cop_90:
    TYX
    LDA.W PlayerPosReal.y
    CMP.W $2, X
    BCC +

    LDA.W $1C, X
    ORA.W #$8000
    STA.W $1C, X
    BRL .ret_in_tmp

+
    LDA.W $1C, X
    AND.W #$7FFF
    STA.W $1C, X
    BRL .ret_in_tmp


.cop_91:
    TYX
    SEP #$20
    LDA.B CopTemp.bank
    STA.W $36, X ; store bank
    REP #$20
    LDA.B CopTemp
    STA.W $18, X ; store ret_addr
    BRL .ret_in_a

.cop_92:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $1E, X
    STZ.W $20, X
    JSL.L CODE_C2865B
    JSL.L CODE_C286CD
    BRL .set_script_ret_addr_and_get_out

.cop_93:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $1E, X
    STZ.W $20, X
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $2A, X
    JSL.L CODE_C2865B
    JSL.L CODE_C286CD
    BRL .set_script_ret_addr_and_get_out

.cop_94:
    TYX
    DEC.W $26, X
    BPL +
    JSL.L CODE_C2865B
    BCC ++
    BRL .ret_in_tmp

+:
    LDA.W $000E,X
    STA.W $0014,X

++:
    JSL.L CODE_C286CD
    BRL .ret_out_of_script

.cop_95:
    TYX
    DEC.W $26, X
    BPL +
..loop:
    JSL.L CODE_C2865B
    BCC ++
    DEC.W $2A, X
    BNE ..loop
    BRL .ret_in_tmp

+:
    LDA.W $000E,X
    STA.W $0014,X

++:
    JSL.L CODE_C286CD
    BRL .ret_out_of_script

.cop_96:
    TYX
    LDA.W $1C, X
    BIT.W #$4000
    BNE + : ORA.W #$4000 : STA.W $1C, X : +
    BRL .ret_in_tmp

.cop_97
    TYX
    LDA.W $1C, X
    BIT.W #$4000
    BEQ + : AND.W #$BFFF : STA.W $1C, X : +
    BRL .ret_in_tmp

.cop_98
    TYX
    LDA.W $1C, X
    BIT.W #$8000
    BNE + : ORA.W #$8000 : STA.W $1C, X : +
    BRL .ret_in_tmp

.cop_99:
    TYX
    LDA.W $1C, X
    BIT.W #$8000
    BEQ + : AND.W #$7FFF : STA.W $1C, X : +
    BRL .ret_in_tmp

.cop_9A:
    TYX
    ; Y contains the offset of the cop arguments
    ; 2 is too far left
    ; 4 is inside the proximity
    ; 6 is too far right
    LDY.W #4
    LDA.W PlayerPosReal.x
    SEC
    SBC.W 0, X
    BEQ ..do_jump ; same x position, so definitely in
    BPL ..check_right ; maybe too far right?
    EOR.W #$FFFF ; do ones complement, to check the left side
    CMP.B [CopTemp]
    BCC ..do_jump ; still inside proximity
    LDY.W #2
    BRA ..do_jump ; nope, too far left

..check_right:
    CMP.B [CopTemp]
    BCC ..do_jump ; if branch is taken, the player is still in proximity
    LDY.W #6 ; else he is too far right

..do_jump:
    LDA.B [CopTemp],Y
    BRL .ret_in_a

.cop_9B:
    TYX
    ; Comments of 9A can be applied here as well
    ; Y contains the offset of the cop arguments
    ; 2 is too far top
    ; 4 is inside the proximity
    ; 6 is too far bottom
    LDY.W #4
    LDA.W PlayerPosReal.y
    SEC
    SBC.W 2, X
    BEQ ..do_jump
    BPL ..check_bottom
    EOR.W #$FFFF
    CMP.B [CopTemp]
    BCC ..do_jump
    LDY.W #2
    BRA ..do_jump

..check_bottom:
    CMP.B [CopTemp]
    BCC ..do_jump
    LDY.W #6

..do_jump:
    LDA.B [CopTemp],Y
    BRL .ret_in_a

.cop_9C:
    TYX
    LDY.W #0

    ; calculate the absolute difference between entity and player X position
    LDA.W PlayerPosReal.x
    SEC
    SBC.W 0, X
    ; twos complement if negative
    BPL + : EOR.W #$FFFF : INC A : +
    PHA

    ; calculate the absolute difference between entity and player y position
    LDA.W PlayerPosReal.y
    SEC
    SBC.W 2, X
    ; twos complement if negative
    BPL + : EOR.W #$FFFF : INC A : +

    ; compare X and Y, jump if X is less than Y
    ; if Y is greater or equals to X, load the second cop argument and jump to it
    CMP.B 1, S
    BCC + : LDY.W #2 : BRA + : +

    PLA
    LDA.B [CopTemp], Y
    BRL .ret_in_a


.cop_9D:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $001E,X
    STZ.W $0020,X
    LDA.B CopTemp
    STA.W $0018,X
    LDA.W $0016,X
    AND.W #$FFFB
    STA.W $0016,X
    BRL .ret_in_tmp

.cop_9E:
    TYX
    LDA.W $16, X
    BIT.W #4
    BNE ..do_jump
    JSL.L CODE_C0891F
    BCC + : BRL .skip_2_args : +
    BRL .ret_out_of_script

..do_jump:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

.cop_9F:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X
    STA.W 0, X
    BRL .ret_in_tmp

.cop_A0
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X
    STA.W 2, X
    BRL .ret_in_tmp

.cop_A1:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X
    STA.W 0, X
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X
    STA.W 2, X
    BRL .ret_in_tmp

.cop_A2:
    TYX
    LDA.W $1C,X
    AND.W #$CFFF
    PHA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    XBA
    ORA.B 1, S ; or it with old $1C
    STA.W $1C, X
    PLA
    BRL .ret_in_tmp

.cop_A3:
    TYX
    LDA.W $1A, X
    ORA.W #$4000
    STA.W $1A, X
    BRL .ret_in_tmp

.cop_A4:
    TYX
    LDA.W $1A, X
    ORA.W #$2000
    STA.W $1A, X
    BRL .ret_in_tmp

.cop_A5:
    TYX
    LDA.W $1C, X
    PHA
    AND.W #$3FFF
    STA.W $1C, X
    PLA
    ; Y is an offset to the cop arguments, starting with 0
    LDY.W #0
    AND.W #$C000
    BEQ ..do_jump
    INY
    INY ; Y is now 2
    CMP.W #$4000
    BEQ ..do_jump
    INY
    INY ; Y is now 4
    CMP.W #$8000
    BEQ ..do_jump
    INY
    INY ; Y is now 6

..do_jump:
    LDA.B [CopTemp],Y
    BRL .ret_in_a

.cop_A6:
    TYX
    LDA.W $1A, X
    AND.W #$BFFF
    STA.W $1A, X
    BRL .ret_in_tmp

.cop_A7:
    TYX
    LDA.W $1A, X
    AND.W #$DFFF
    STA.W $1A, X
    BRL .ret_in_tmp

.cop_A8:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $22, X
    SEP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    BNE + : INC.B CopTemp.addr+1 : +
    STA.W $24, X
    REP #$20
    BRL .ret_in_tmp

.cop_A9:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $34, X
    SEP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    BNE + : INC.B CopTemp.addr+1 : +
    STA.W $2C, X
    REP #$20
    LDA.W $1A, X
    ORA.W #$8000
    STA.W $1A, X
    BRL .ret_in_tmp

.cop_AA:
    TYX
    LDA.W $1C, X
    AND.W #$F1FF
    PHA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    XBA
    ORA 1, S
    STA.W $1C, X
    PLA
    BRL .ret_in_tmp

.cop_AB:
    TYX
    JSR CODE_C0E6B2
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W 0, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W 2, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $16,Y
    BRL .ret_in_tmp

.cop_AC:
    TYX
    JSR.W CODE_C0E6DA
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W 0, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W 2, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $16, Y
    BRL .ret_in_tmp

.cop_AD:
    TYX
    LDA.W $16, X
    BIT.W #$8000
    BNE + : BRL .skip_1_arg : +
    LDA.W 0, X
    CMP.W $0342
    BCC + : BRL .skip_1_arg : +
    LDA.W 2, X
    CMP.W $0344
    BCC + : BRL .skip_1_arg : +
    LDA.B CopTemp
    DEC A
    DEC A
    STA.W $18, X
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    STA.W $14, X
    BRL .ret_out_of_script

.cop_AE:
    TYX
    PHX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X
    STA.B $16
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X
    SEC
    SBC.W #$10
    STA.B $18
    JSL CalcPassablemapOffset
    LDA passable_map, X
    PLX
    AND.W #$0F
    BEQ ..skip
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL .ret_in_a

..skip:
    BRL .skip_2_args

.cop_AF:
    TYX
    JSR CODE_C0E6B2
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $16, Y
    BRL .ret_in_tmp

.cop_B0:
    TYX
    JSR.W CODE_C0E6DA
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$00FF
    SEP #$20
    STA.W $36, Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $16, Y
    BRL .ret_in_tmp


.cop_B1:
    TYX
    JSR.W CODE_C0E6B2
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X
    STA.W 0, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X
    STA.W 2, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $16, Y
    BRL .ret_in_tmp

.cop_B2:
    TYX
    JSR.W CODE_C0E6DA
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $18, Y
    TXA
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    SEP #$20
    STA.W $36, Y
    REP #$20
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 0, X
    STA.W 0, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    CLC
    ADC.W 2, X
    STA.W 2, Y
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    STA.W $16, Y
    BRL .ret_in_tmp

.skip_5_args: INC.B CopTemp
.skip_4_args: INC.B CopTemp
.skip_3_args: INC.B CopTemp
.skip_2_args: INC.B CopTemp
.skip_1_arg:  INC.B CopTemp
.ret_in_tmp:  LDA.B CopTemp
.ret_in_a:
    STA.B $02, S ; place A onto stack, so that the `RTI` in the next line returns to that address
    RTI

.set_script_ret_addr_and_get_out:
    LDA.B CopTemp
    STA.W $18, X ; places the `CopTemp` variable onto `script_ret_addr` of the entity

; returns out of the script back to the script handling function
.ret_out_of_script:
    PLA
    PLA
    RTL
