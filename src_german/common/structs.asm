macro LongPtr(name, ptr)
    <name> = <ptr>
    struct <name> <name>
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

struct LiveEntities $7E0800
    .pos_x: skip 2                      ; 00
    .pos_y: skip 2                      ; 02
    ._04 : skip 2                       ; 04
    ._06 : skip 2                       ; 06
    ._08 : skip 4                       ; 08
    ._0c : skip 4                       ; 0C
    ._10 : skip 2                       ; 10
    ._12 : skip 2                       ; 12
    .frame_wait_counter : skip 2        ; 14 - used in COP-1B,
    .entity_id : skip 2                 ; 16
    .script_ret_addr : skip 2           ; 18
    ._1a : skip 1                       ; 1A
    ._1b : skip 1                       ; 1B
    ._1c : skip 2                       ; 1C
    ._1e : skip 2                       ; 1E
    ._20 : skip 2                       ; 20
    ._22 : skip 2                       ; 22
    .some_bank : skip 1                 ; 24
    .hp : skip 1                        ; 25
    .zzz_counter : skip 2               ; 26 - used in COP-94
    ._28 : skip 2                       ; 28
    ._2a : skip 1                       ; 2A
    ._2b : skip 1                       ; 2B
    ._2c : skip 2                       ; 2C
    .loop_counter : skip 1              ; 2E - used in COP-03/04
    ._2f : skip 1                       ; 2F
    ._30 : skip 2                       ; 30
    ._32 : skip 1                       ; 32
    ._33 : skip 1                       ; 33
    ._34 : skip 1                       ; 34
    ._35 : skip 1                       ; 35
    .script_ret_addr_bank : skip 1      ; 36
    ._37 : skip 1                       ; 37
    .entities_table_entry_offset : skip 2 ; 38
    .entities_palcement_ptr : skip 2    ; 3A
    ._3c : skip 2                       ; 3C
    ._3e : skip 2                       ; 3E
endstruct

assert objectsize(LiveEntities) == $40
