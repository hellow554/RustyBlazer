CODE_C3BEDC:
    SEP #$20
    LDA.W current_map_number
    LDY.W #.data1
    CMP.B #$05
    BEQ .store_to_transfer
    LDY.W #.data2
    CMP.B #$06
    BEQ .store_to_transfer
    LDY.W #.data3
    CMP.B #$07
    BEQ .store_to_transfer
    LDY.W #.data4
    CMP.B #$08
    BEQ .store_to_transfer
    LDY.W #.data5
    CMP.B #$09
    BEQ .store_to_transfer
    LDY.W #.data6
    CMP.B #$0B
    BEQ .store_to_transfer
    LDY.W #.data7
    CMP.B #$0C
    BEQ .store_to_transfer
    BRA .ret

.store_to_transfer:
    STY.W _03DA_ptr.addr
    LDA.B #bank(pc())
    STA.W _03DA_ptr.bank
.ret:
    REP #$20
    COP #$86
    RTL

.data1:
db $27,$37,$08,$0A,$01,$00,$00,$00   ;C3BF21|        |000037;
db $49,$4B,$0C,$1C,$00,$00,$FF,$FF   ;C3BF29|        |      ;
db $3A,$3B,$1E,$2E,$00,$00,$01,$00   ;C3BF31|        |      ;
db $26,$36,$2E,$30,$01,$00,$00,$00   ;C3BF39|        |000036;
db $FF

.data2:
db $21,$31,$25,$27,$FF,$FF,$00   ;C3BF41|        |253121;
db $00,$28,$2A,$05,$25,$00,$00,$FF   ;C3BF49|        |      ;
db $FF,$2A,$3A,$13,$15,$FF,$FF,$00   ;C3BF51|        |133A2A;
db $00,$28,$38,$03,$05,$01,$00,$00   ;C3BF59|        |      ;
db $00,$38,$3A,$03,$13,$00,$00,$01   ;C3BF61|        |      ;
db $00,$3A,$3C,$13,$34,$00,$00,$01   ;C3BF69|        |      ;
db $00,$28,$38,$38,$3A,$FF,$FF,$00   ;C3BF71|        |      ;
db $00,$1E,$2E,$3A,$3C,$FF,$FF,$00   ;C3BF79|        |      ;
db $00,$FF

.data3:
db $03,$05,$12,$20,$00,$00   ;C3BF81|        |      ;
db $FF,$FF,$06,$08,$12,$20,$00,$00   ;C3BF89|        |0806FF;
db $01,$00,$FF

.data4:
db $1D,$1F,$04,$07,$00   ;C3BF91|        |000000;
db $00,$FF,$FF,$1D,$1F,$09,$0C,$00   ;C3BF99|        |      ;
db $00,$FF,$FF,$1F,$21,$03,$06,$00   ;C3BFA1|        |      ;
db $00,$01,$00,$1F,$21,$08,$0B,$00   ;C3BFA9|        |      ;
db $00,$01,$00,$21,$23,$04,$07,$00   ;C3BFB1|        |      ;
db $00,$FF,$FF,$21,$23,$09,$0C,$00   ;C3BFB9|        |      ;
db $00,$FF,$FF,$26,$28,$03,$0C,$00   ;C3BFC1|        |      ;
db $00,$01,$00,$28,$2A,$03,$0C,$00   ;C3BFC9|        |      ;
db $00,$FF,$FF,$2A,$2C,$03,$0C,$00   ;C3BFD1|        |      ;
db $00,$01,$00,$2C,$3B,$09,$0B,$01   ;C3BFD9|        |      ;
db $00,$00,$00,$FF

.data5:
db $05,$07,$11,$17   ;C3BFE1|        |      ;
db $00,$00,$01,$00,$07,$0D,$15,$17   ;C3BFE9|        |      ;
db $01,$00,$00,$00,$0D,$0F,$12,$17   ;C3BFF1|        |000000;
db $00,$00,$FF,$FF,$0D,$0F,$09,$0F   ;C3BFF9|        |      ;
db $00,$00,$01,$00,$0F,$15,$07,$09   ;C3C001|        |      ;
db $01,$00,$00,$00,$0F,$15,$11,$13   ;C3C009|        |000000;
db $01,$00,$00,$00,$0F,$15,$1A,$1C   ;C3C011|        |000000;
db $FF,$FF,$00,$00,$FF

.data6:
db $07,$09,$0E   ;C3C019|        |0000FF;
db $3E,$00,$00,$FF,$FF,$FF

.data7:
db $03,$05   ;C3C021|        |000000;
db $06,$0A,$00,$00,$FF,$FF,$0B,$0D   ;C3C029|        |00000A;
db $06,$0A,$00,$00,$FF,$FF,$07,$09   ;C3C031|        |00000A;
db $06,$0A,$00,$00,$01,$00,$FF       ;C3C039|        |00000A;