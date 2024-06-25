DebugMenu:
    LDA JOY2H
    BIT.B #Key8.Select
    BEQ +
    JSR DEBUG_SELECT
    RTS ; early out

+
    LDA JOY2H
    BIT.B #Key8.B
    BEQ +
    LDA #$1E

-
    PHA
    JSL wait_vblank
    PLA
    DEC
    BNE -
    RTS

+
    BIT.B #Key8.Y
    BEQ +
    JSR CODE_C08298
+
    RTS

DEBUG_SELECT:
    LDA.B #$00
    JSR CODE_C08267
    LDA.B #$03
    JSR CODE_C08267
    LDA.B #$04
    JSR CODE_C08267
    LDA.B #$1F
    JSR CODE_C08267
    RTS

CODE_C08267:
    PHB
    PHA
    PLB
    LDX #$8000

.loop:
    LDA.W 0, X
    CMP.B #2
    BNE  .loop_inc
    LDA.W 1, X
    CMP.B #1
    BNE .loop_inc
    LDA.W 2, X
    CMP.B #$AA
    BNE .loop_inc
    LDY.W 3, X
    BPL .loop_inc
    PHX
    LDX #$0408
    STX $3F5
    JSL printOsdStringFromBankX
    PLX

.loop_inc:
    INX
    BNE .loop
    PLB
    RTS

CODE_C08298:
db $AD,$14,$03,$20   ;C08294|        |C0826D;
db $23,$83,$8D,$06,$1F,$AD,$14,$03   ;C0829C|        |000083;
db $20,$27,$83,$8D,$07,$1F,$AD,$16   ;C082A4|        |C08327;
db $03,$20,$23,$83,$8D,$09,$1F,$AD   ;C082AC|        |000020;
db $16,$03,$20,$27,$83,$8D,$0A,$1F   ;C082B4|        |000003;
db $AD,$6A,$1C,$20,$23,$83,$8D,$0C   ;C082BC|        |001C6A;
db $1F,$AD,$6A,$1C,$20,$27,$83,$8D   ;C082C4|        |1C6AAD;
db $0D,$1F,$AD,$78,$03,$20,$23,$83   ;C082CC|        |00AD1F;
db $8D,$0F,$1F,$AD,$78,$03,$20,$27   ;C082D4|        |001F0F;
db $83,$8D,$10,$1F,$AD,$74,$03,$20   ;C082DC|        |00008D;
db $27,$83,$8D,$12,$1F,$AD,$7A,$03   ;C082E4|        |000083;
db $20,$23,$83,$8D,$14,$1F,$AD,$7A   ;C082EC|        |C08323;
db $03,$20,$27,$83,$8D,$15,$1F,$AD   ;C082F4|        |000020;
db $76,$03,$20,$27,$83,$8D,$17,$1F   ;C082FC|        |000003;
db $AD,$00,$1F,$20,$23,$83,$8D,$19   ;C08304|        |001F00;
db $1F,$AD,$00,$1F,$20,$27,$83,$8D   ;C0830C|        |1F00AD;
db $1A,$1F,$A0,$02,$1F,$22,$54,$A7   ;C08314|        |      ;
db $82,$A9,$01,$8D,$BA,$03,$60

upper_nibble_to_ascii_hex:
    LSR
    LSR
    LSR
    LSR
    ; fallthrough
lower_nibble_to_ascii_hex:
    REP #$20
    AND.W #$F
    TAX
    LDA.L .hex_string, X
    SEP #$20
    RTS

.hex_string
    db "0123456789ABCDEF"
