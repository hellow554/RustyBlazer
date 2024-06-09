macro LongPtr(name, ptr)
    struct <name> <ptr>
        .addr: skip 2
        .bank: skip 1
    endstruct
endmacro

macro BigDecimal(name, ptr)
    struct <name> <ptr>
        .lower10k: skip 2
        .upper10k: skip 2
    endstruct
endmacro

macro Position(name, ptr)
    struct <name> <ptr>
        .x: skip 2
        .y: skip 2
    endstruct
endmacro

macro PositionFacing(name, ptr)
    struct <name> <ptr>
        .x: skip 2
        .y: skip 2
        .facing: skip 1
    endstruct
endmacro

struct LiveEntities $7E0800
    .pos_x: skip 2                      ; 00
    .pos_y: skip 2                      ; 02
    ._04 : skip 2                       ; 04
    ._06 : skip 2                       ; 06
    ._08 : skip 2                       ; 08
    ._0a : skip 2                       ; 0A
    ._0c : skip 2                       ; 0C
    ._0e : skip 2                       ; 0E
    ._10 : skip 2                       ; 10
    ._12 : skip 2                       ; 12
    .frame_wait_counter : skip 2        ; 14 - used in COP-1B,
    .entity_id : skip 2                 ; 16
    .script_ret_addr : skip 2           ; 18
    ._1a : skip 2                       ; 1A
    ._1c : skip 2                       ; 1C
    .facing : skip 2                    ; 1E
    ._20 : skip 2                       ; 20
    ._22 : skip 2                       ; 22
    .some_bank : skip 1                 ; 24
    .hp : skip 1                        ; 25
    .invincibility_counter : skip 2     ; 26 - used in COP-39, 94 and 95
    ._28 : skip 2                       ; 28
    ._2a : skip 1                       ; 2A
    ._2b : skip 1                       ; 2B
    ._2c : skip 2                       ; 2C
    .loop_counter : skip 1              ; 2E - used in COP-03/04
    ._2f : skip 1                       ; 2F
    ._30 : skip 2                       ; 30
    ._32 : skip 1                       ; 32
    ._33 : skip 1                       ; 33
    ._34 : skip 2                       ; 34
    .script_ret_addr_bank : skip 1      ; 36
    ._37 : skip 1                       ; 37
    .entities_table_entry_offset : skip 2 ; 38
    .entities_palcement_ptr : skip 2    ; 3A
    ._3c : skip 2                       ; 3C
    ._3e : skip 2                       ; 3E
endstruct                               ; 40
assert objectsize(LiveEntities) == $40

struct LairDataStructure $C1BA0D
    .resur_map_num : skip 1         ; 00
    .resur_facing : skip 1          ; 01
    .resur_pos_x : skip 1           ; 02
    .resur_pos_y : skip 1           ; 03
    .resur_zone_tlc_x : skip 1      ; 04
    .resur_zone_tlc_y : skip 1      ; 05
    .resur_zone_width : skip 1      ; 06
    .resur_zone_height : skip 1     ; 07

    .field_08 : skip 1              ; 08
    .npc_name : skip 1              ; 09
    .field_0A : skip 1              ; 0A
    
    .lair_map_number : skip 1       ; 0B
    .lair_pos_x : skip 1            ; 0C
    .lair_pos_y : skip 1            ; 0D

    .field_0E : skip 1              ; 0E
    .field_0F : skip 1              ; 0F
    .field_10 : skip 1              ; 10
    .field_11 : skip 1              ; 11
    .field_12 : skip 1              ; 12
    .enemies_to_spawn : skip 1      ; 13
    .spawn_delay : skip 1           ; 14
    .enemy_id : skip 1              ; 15
    .facing : skip 1                ; 16
    .field_17 : skip 1              ; 17
    .field_18 : skip 1              ; 18
    .field_19 : skip 1              ; 19
    .field_1A : skip 1              ; 1A
    .field_1B : skip 1              ; 1B
    .field_1C : skip 1              ; 1C
    .field_1D : skip 1              ; 1D
    .lair_dependency : skip 2       ; 1E
endstruct                           ; 20
assert objectsize(LairDataStructure) == $20
