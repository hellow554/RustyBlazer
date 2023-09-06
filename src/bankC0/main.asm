main:
    CLD                                  ;C08017|D8      |      ;
    REP #$30                             ;C08018|C230    |      ;
    LDA.W #$0000                         ;C0801A|A90000  |      ;
    TCD                                  ;C0801D|5B      |      ;
    LDA.W #$1FFF                         ;C0801E|A9FF1F  |      ;
    TCS                                  ;C08021|1B      |      ;
    SEP #$20                             ;C08022|E220    |      ;
    LDA.B #$81                           ;C08024|A981    |      ;
    PHA                                  ;C08026|48      |      ;
    PLB                                  ;C08027|AB      |      ;
    JSL.L init_system                    ;C08028|22D1B982|82B9D1;
    JSL.L init_window_system                    ;C0802C|2201BB82|82BB01;
    JSL.L init_game_variables                    ;C08030|22468883|838846;
    JSL.L ClearL3                    ;C08034|22228683|838622;
    LDX.W #$000C                         ;C08038|A20C00  |      ;
    STX.W $0318                          ;C0803B|8E1803  |810318;
    JSL.L enable_interrupts                    ;C0803E|22A2B182|82B1A2;
    JSL.L check_map_change                    ;C08042|22B58683|8386B5;

.game_loop:
    JSL.L wait_vblank                    ;C08046|22B7B182|82B1B7;
    JSL.L check_map_change                    ;C0804A|22B58683|8386B5;
    LDA.W current_map_number                          ;C0804E|AD6A1C  |811C6A;
    SEC                                  ;C08051|38      |      ;
    SBC.B #$10                           ;C08052|E910    |      ;
    CMP.B #$03                           ;C08054|C903    |      ;
    BCC .main_menu_scene                      ;C08056|904E    |C080A6;
    LDA.W lair_reveal_in_progress                          ;C08058|ADFD03  |8103FD;
    BNE .lair_reveal                      ;C0805B|D064    |C080C1;
    if defined("DEBUG")
        JSL.L enable_debug
    else
        JSL.L check_buttons                    ;C0805D|22019982|829901;
    endif
    JSL.L CODE_83849A                    ;C08061|229A8483|83849A;
    JSL.L disable_vblank_interrupt                    ;C08065|22AEB182|82B1AE;
    JSL.L CODE_8289D6                    ;C08069|22D68982|8289D6;
    JSL.L prepare_dma_bank0                    ;C0806D|22639882|829863;
    JSL.L CODE_8085D2                    ;C08071|22D28580|8085D2;
    JSL.L CODE_8085F0                    ;C08075|22F08580|8085F0;
    JSL.L check_entity_collision                    ;C08079|22608A80|808A60;
    JSL.L CODE_808E20                    ;C0807D|22208E80|808E20;
    JSL.L check_player_dead                    ;C08081|223DB080|80B03D;
    JSL.L CODE_828069                    ;C08085|22698082|828069;
    JSL.L CODE_82810B                    ;C08089|220B8182|82810B;
    JSL.L CODE_80871A                    ;C0808D|221A8780|80871A;
    JSL.L update_hud                    ;C08091|225EA682|82A65E;
    JSL.L CODE_829695                    ;C08095|22959682|829695;
    JSL.L CODE_83814B                    ;C08099|224B8183|83814B;
    JSL.L enable_interrupts                    ;C0809D|22A2B182|82B1A2;
    JSR.W CODE_C08344                    ;C080A1|204483  |C08344;
    BRA .game_loop                       ;C080A4|80A0    |C08046;

.main_menu_scene: ; TODO: I'm not sure if this is really the main menu
    JSL.L disable_vblank_interrupt                    ;C080A6|22AEB182|82B1AE;
    JSL.L prepare_dma_bank0                    ;C080AA|22639882|829863;
    JSL.L CODE_8085D2                    ;C080AE|22D28580|8085D2;
    JSL.L CODE_8085F0                    ;C080B2|22F08580|8085F0;
    JSL.L CODE_80871A                    ;C080B6|221A8780|80871A;
    JSL.L enable_interrupts                    ;C080BA|22A2B182|82B1A2;
    BRL .game_loop                       ;C080BE|8285FF  |C08046;

.lair_reveal:
    JSL.L disable_vblank_interrupt                    ;C080C1|22AEB182|82B1AE;
    JSL.L CODE_828EA9                    ;C080C5|22A98E82|828EA9;
    JSL.L prepare_dma_bank0                    ;C080C9|22639882|829863;
    STZ.W buttons_pressed+1                          ;C080CD|9C2303  |810323;
    JSL.L CODE_8085D2                    ;C080D0|22D28580|8085D2;
    JSL.L CODE_8085F0                    ;C080D4|22F08580|8085F0;
    JSL.L CODE_80871A                    ;C080D8|221A8780|80871A;
    JSL.L update_hud                    ;C080DC|225EA682|82A65E;
    JSL.L CODE_829695                    ;C080E0|22959682|829695;
    JSL.L CODE_83814B                    ;C080E4|224B8183|83814B;
    JSL.L enable_interrupts                    ;C080E8|22A2B182|82B1A2;
    JSL.L wait_vblank                    ;C080EC|22B7B182|82B1B7;
    JSL.L disable_vblank_interrupt                    ;C080F0|22AEB182|82B1AE;
    JSL.L CODE_8081E5                    ;C080F4|22E58180|8081E5;
    JSL.L CODE_8081E5                    ;C080F8|22E58180|8081E5;
    JSL.L CODE_8081E5                    ;C080FC|22E58180|8081E5;
    JSL.L CODE_8081E5                    ;C08100|22E58180|8081E5;

..lair_reveal_loop:
    JSL.L CODE_8081E5                    ;C08104|22E58180|8081E5;
    LDX.W lair_reveal_in_progress                          ;C08108|AEFD03  |8103FD;
    BMI ..lair_reveal_loop                      ;C0810B|30F7    |C08104;
    STZ.W lair_reveal_in_progress                          ;C0810D|9CFD03  |8103FD;
    STZ.W lair_reveal_in_progress+1                          ;C08110|9CFE03  |8103FE;
    LDA.W player_max_health                          ;C08113|AD8A1B  |811B8A;
    LSR A                                ;C08116|4A      |      ;
    LSR A                                ;C08117|4A      |      ;
    LSR A                                ;C08118|4A      |      ;
    CLC                                  ;C08119|18      |      ;
    ADC.W player_health_restore                          ;C0811A|6D4704  |810447;
    STA.W player_health_restore                          ;C0811D|8D4704  |810447;
    LDA.B #$78                           ;C08120|A978    |      ;
    JSL.L CODE_82B140                    ;C08122|2240B182|82B140;
    LDA.B #$80                           ;C08126|A980    |      ;
    STA.W $03E5                          ;C08128|8DE503  |8103E5;
    LDA.W $03FF                          ;C0812B|ADFF03  |8103FF;
    STA.W $0319                          ;C0812E|8D1903  |810319;
    LDA.W $0401                          ;C08131|AD0104  |810401;
    STA.W $0318                          ;C08134|8D1803  |810318;
    REP #$20                             ;C08137|C220    |      ;
    LDA.W $0403                          ;C08139|AD0304  |810403;
    STA.W TeleportPos.x                          ;C0813C|8D7C03  |81037C;
    LDA.W $0405                          ;C0813F|AD0504  |810405;
    STA.W TeleportPos.y                          ;C08142|8D7E03  |81037E;
    SEP #$20                             ;C08145|E220    |      ;
    JSL.L enable_interrupts                    ;C08147|22A2B182|82B1A2;
    BRL .game_loop                       ;C0814B|82F8FE  |C08046;
