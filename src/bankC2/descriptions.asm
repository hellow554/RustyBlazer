
DescriptionTable:
    dw .drawBox
.weapons:
    dw .life_sword, .psycho_sword, .critical_sword, .lucky_blade
    dw .zantetsu_sword, .spirit_sword, .recovery_sword, .soul_blade

.armor:
    dw .iron_armor, .ice_armor, .bubble_armor, .magic_armor
    dw .mystic_armor, .light_armor, .elemental_armor, .soul_armor

.magic:
    dw .flame_ball, .light_arrow, .magic_flair, .rotator
    dw .spark_bomb, .flame_pillar, .tornado, .phoenix
; .items:
;     dw .goats_food, .harp_string, .pass, .dream_rod
;     dw .leos_brush, .greenwood_leaves, .moles_ribbon, .big_pearl
;     dw .mermaids_tears, .mushroom_shoes, .door_key, .thunder_ring
;     dw .delicious_seeds, .plant_leaves, .mobile_key, .platinum_card
;     dw .vip_card
;     dw .emblem_a, .emblem_b, .emblem_c, .emblem_d
;     dw .emblem_e, .emblem_f, .emblem_g, .emblem_h
;     dw .hot_mirror, .hot_ball, .hot_stick
;     dw .power_bracelet, .shield_bracelet, .super_bracelet
;     dw .medical_herb, .strange_bottle
;     dw .brown_stone, .green_stone, .blue_stone
;     dw .silver_stone, .purple_stone, .black_stone
;     dw .magic_bell

db $8A, $DD, $B4, $DD, $D9, $DD, $09, $DE, $51, $DE, $8B, $DE, $CF, $DE, $12, $DF, $5A, $DF, $7F, $DF, $C0, $DF, $F7, $DF, $29, $E0, $5D, $E0, $96, $E0, $C4, $E0, $FC, $E0, $30, $E1, $70, $E1, $7B, $E1, $86, $E1, $91, $E1, $9C, $E1, $A7, $E1, $B2, $E1, $BD, $E1, $FB, $E1, $06, $E2, $11, $E2, $5B, $E2, $8B, $E2, $C0, $E2, $08, $E3, $49, $E3, $82, $E3, $8D, $E3, $98, $E3, $A3, $E3, $AE, $E3, $B9, $E3

.drawBox:
; @NEW_TEXTBOX@
; SETPOS 8 4
; DRAWBOX $16 8
db $01,$08,$04
db $07,$16,$08
db $00
; @ENDSTRING@

.life_sword:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+0
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+0
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+0
; SETPOS $8A 5
; "Ein Schwert vom\n\n" NO_NEWLINE
; "Meister." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+0
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+0
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+0
db $01,$8A,$05
db $45,$69,$6E,$20,$A3,$76,$6F,$6D,$0D,$0D
db $4D,$65,$69,$73,$74,$65,$72,$2E
db $00
; @ENDSTRING@

.psycho_sword:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+2
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+2
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+1
; SETPOS $8A 5
; "Lähmung für\n\n" NO_NEWLINE
; "starke Monster." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+2
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+2
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+1
db $01,$8A,$05
db $4C,$7B,$68,$6D,$75,$6E,$67,$20,$66,$5B,$72,$0D,$0D
db $73,$74,$61,$72,$6B,$65,$20,$4D,$6F,$6E,$73,$74,$65,$72,$2E
db $00
; @ENDSTRING@

.critical_sword:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+4
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+4
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+2
; SETPOS $8A 5
; "Besiegt die Monster\n\n" NO_NEWLINE
; "mit einem Schlag." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+4
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+4
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+2
db $01,$8A,$05
db $42,$65,$73,$69,$65,$67,$74,$20,$B5,$4D,$6F,$6E,$73,$74,$65,$72,$0D,$0D
db $DA,$C7,$53,$63,$68,$6C,$61,$67,$2E
db $00
; @ENDSTRING@


.lucky_blade:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+6
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+6
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+3
; SETPOS $8A 5
; "Größere Chancen\n\n" NO_NEWLINE
; "JWL zu finden" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+6
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+6
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+3
db $01,$8A,$05
db $47,$72,$2A,$25,$65,$72,$65,$20,$43,$68,$61,$6E,$63,$65,$6E,$0D,$0D
db $4A,$57,$4C,$20,$FD,$66,$69,$6E,$64,$65,$6E
db $00
; @ENDSTRING@

.zantetsu_sword:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+8
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+8
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+4
; SETPOS $8A 5
; "Schlägt die Monster \n\n" NO_NEWLINE
; "mit spezieller Rüstung" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+8
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+8
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+4
db $01,$8A,$05
db $53,$63,$68,$6C,$7B,$67,$74,$20,$B5,$95,$0D,$0D
db $DA,$73,$70,$65,$7A,$69,$65,$6C,$6C,$65,$72,$20,$52,$5B,$73,$74,$75,$6E,$67
db $00
; @ENDSTRING@

.spirit_sword:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+10
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+10
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+5
; SETPOS $8A 5
; "Schlägt die <Geister>\n\n" NO_NEWLINE
; "Monster." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+10
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+10
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+5
db $01,$8A,$05
db $53,$63,$68,$6C,$7B,$67,$74,$20,$B5,$3C,$47,$65,$69,$73,$74,$65,$72,$3E,$0D,$0D
db $4D,$6F,$6E,$73,$74,$65,$72,$2E
db $00
; @ENDSTRING@

.recovery_sword:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+12
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+12
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+6
; SETPOS $8A 5
; "Die HP werden nach dem\n\n" NO_NEWLINE
; "Sieg wieder aufgefüllt" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+12
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+12
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+6
db $01,$8A,$05
db $87,$48,$50,$20,$F5,$E3,$64,$65,$6D,$0D,$0D
db $53,$69,$65,$67,$20,$F4,$61,$75,$66,$67,$65,$66,$5B,$6C,$6C,$74
db $00
; @ENDSTRING@

.soul_blade:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+14
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+14
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+7
; SETPOS $8A 5
; "Das stärkste Schwert,\n\n" NO_NEWLINE
; "das Du benutzen kannst" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+14
db $01,$B2,$04
db $06,$02 : dw WeaponLevelRequirement+14
db $01,$1E,$05
db $0B,$26 : dw ItemStrenghTable+7
db $01,$8A,$05
db $8A,$73,$74,$7B,$72,$6B,$73,$74,$65,$20,$53,$63,$68,$77,$65,$72,$74,$2C,$0D,$0D
db $B9,$83,$62,$65,$6E,$75,$74,$7A,$65,$6E,$20,$6B,$61,$6E,$6E,$73,$74
db $00
; @ENDSTRING@

.iron_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+16
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+0
; SETPOS $8A 5
; "Deine Abwehrkräfte\n\n" NO_NEWLINE
; "werden stärker." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+16
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+0
db $01,$8A,$05
db $44,$65,$69,$6E,$65,$20,$41,$62,$77,$65,$68,$72,$6B,$72,$7B,$66,$74,$65,$0D,$0D
db $F5,$73,$74,$7B,$72,$6B,$65,$72,$2E
db $00
; @ENDSTRING@

.ice_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+18
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+1
; SETPOS $8A 5
; "Du kannst ohne Gefahr\n\n" NO_NEWLINE
; "Feuer überqueren." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+18
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+1
db $01,$8A,$05
db $83,$6B,$61,$6E,$6E,$73,$74,$20,$6F,$68,$6E,$65,$20,$47,$65,$66,$61,$68,$72,$0D,$0D
db $46,$65,$75,$65,$72,$20,$5B,$62,$65,$72,$71,$75,$65,$72,$65,$6E,$2E
db $00
; @ENDSTRING@

.bubble_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+20
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+2
; SETPOS $8A 5
; "Ermöglicht es Dir,\n\n" NO_NEWLINE
; "unter Wasser zu laufen" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+20
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+2
db $01,$8A,$05
db $45,$72,$6D,$2A,$67,$6C,$69,$63,$68,$74,$20,$C3,$44,$69,$72,$2C,$0D,$0D
db $75,$6E,$74,$65,$72,$20,$57,$61,$73,$73,$65,$72,$20,$FD,$6C,$61,$75,$66,$65,$6E
db $00
; @ENDSTRING@

.magic_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+22
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+3
; SETPOS $8A 5
; "Verringert die notwen-\n\n" NO_NEWLINE
; "digen Juwelen um 1/2." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+22
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+3
db $01,$8A,$05
db $56,$65,$72,$72,$69,$6E,$67,$65,$72,$74,$20,$B5,$6E,$6F,$74,$77,$65,$6E,$2D,$0D,$0D
db $64,$69,$67,$65,$6E,$20,$90,$EC,$31,$2F,$32,$2E
db $00
; @ENDSTRING@

.mystic_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+24
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+4
; SETPOS $8A 5
; "Unbesiegbar für einen\n\n" NO_NEWLINE
; "längeren Zeitabstand." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+24
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+4
db $01,$8A,$05
db $55,$6E,$62,$65,$73,$69,$65,$67,$62,$61,$72,$20,$C9,$65,$69,$6E,$65,$6E,$0D,$0D
db $6C,$7B,$6E,$67,$65,$72,$65,$6E,$20,$5A,$65,$69,$74,$61,$62,$73,$74,$61,$6E,$64,$2E
db $00
; @ENDSTRING@

.light_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+26
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+5
; SETPOS $8A 5
; "Schwache Monster sind\n\n" NO_NEWLINE
; "keine Gefahr mehr." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+26
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+5
db $01,$8A,$05
db $53,$63,$68,$77,$61,$63,$68,$65,$20,$95,$73,$69,$6E,$64,$0D,$0D
db $D8,$47,$65,$66,$61,$68,$72,$20,$6D,$65,$68,$72,$2E
db $00
; @ENDSTRING@

.elemental_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+28
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+6
; SETPOS $8A 5
; "Beschützt Dich vor den\n\n" NO_NEWLINE
; "Gefahren zonen" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+28
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+6
db $01,$8A,$05
db $42,$65,$73,$63,$68,$5B,$74,$7A,$74,$20,$85,$76,$6F,$72,$20,$64,$65,$6E,$0D,$0D
db $47,$65,$66,$61,$68,$72,$65,$6E,$20,$7A,$6F,$6E,$65,$6E
db $00
; @ENDSTRING@

.soul_armor:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+30
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+7
; SETPOS $8A 5
; "Ermöglicht es Dir,Dich\n\n" NO_NEWLINE
; "im Weltall zu bewegen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+30
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+7
db $01,$8A,$05
db $45,$72,$6D,$2A,$67,$6C,$69,$63,$68,$74,$20,$C3,$44,$69,$72,$2C,$44,$69,$63,$68,$0D,$0D
db $D5,$57,$65,$6C,$74,$61,$6C,$6C,$20,$FD,$62,$65,$77,$65,$67,$65,$6E,$2E
db $00
; @ENDSTRING@

.flame_ball:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+32
; SETPOS $A 5
; "Notwendige JUWELEN : 4\n\n" NO_NEWLINE
; "Schießt einen Feuer-\n\n" NO_NEWLINE
; "ball in eine Richtung." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+32
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$34,$0D,$0D
db $53,$63,$68,$69,$65,$25,$74,$20,$C0,$46,$65,$75,$65,$72,$2D,$0D,$0D
db $62,$61,$6C,$6C,$20,$D3,$BF,$52,$69,$63,$68,$74,$75,$6E,$67,$2E
db $00
; @ENDSTRING@

.light_arrow:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+34
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Schießt einen Licht \n\n" NO_NEWLINE
; "Pfeil in eine Richtung" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+34
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $53,$63,$68,$69,$65,$25,$74,$20,$C0,$4C,$69,$63,$68,$74,$20,$0D,$0D
db $50,$66,$65,$69,$6C,$20,$D3,$BF,$52,$69,$63,$68,$74,$75,$6E,$67
db $00
; @ENDSTRING@

.magic_flair:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+36
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Die Kraft wird durch \n\n" NO_NEWLINE
; "Knopfdruck gesammelt." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+36
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $87,$4B,$72,$61,$66,$74,$20,$F7,$64,$75,$72,$63,$68,$20,$0D,$0D
db $4B,$6E,$6F,$70,$66,$64,$72,$75,$63,$6B,$20,$67,$65,$73,$61,$6D,$6D,$65,$6C,$74,$2E
db $00
; @ENDSTRING@

.rotator:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+38
; SETPOS $A 5
; "Notwendige JUWELEN : 1\n\n" NO_NEWLINE
; "Ein Ring aus Licht \n\n" NO_NEWLINE
; "wird Dich umkreisen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+38
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$31,$0D,$0D
db $45,$69,$6E,$20,$52,$69,$6E,$67,$20,$AD,$4C,$69,$63,$68,$74,$20,$0D,$0D
db $F7,$85,$75,$6D,$6B,$72,$65,$69,$73,$65,$6E,$2E
db $00
; @ENDSTRING@

.spark_bomb:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+40
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Abgelegte Minen werden\n\n" NO_NEWLINE
; "explodieren." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+40
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $41,$62,$67,$65,$6C,$65,$67,$74,$65,$20,$4D,$69,$6E,$65,$6E,$20,$77,$65,$72,$64,$65,$6E,$0D,$0D
db $65,$78,$70,$6C,$6F,$64,$69,$65,$72,$65,$6E,$2E
db $00
; @ENDSTRING@

.flame_pillar:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+42
; SETPOS $A 5
; "Notwendige JUWELEN :20\n\n" NO_NEWLINE
; "Säulen aus Feuer\n\n" NO_NEWLINE
; "erheben sich um Dich." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+42
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$32,$30,$0D,$0D
db $53,$7B,$75,$6C,$65,$6E,$20,$AD,$46,$65,$75,$65,$72,$0D,$0D
db $65,$72,$68,$65,$62,$65,$6E,$20,$E5,$EC,$44,$69,$63,$68,$2E
db $00
; @ENDSTRING@

.tornado:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+44
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Ein magischer Tornado \n\n" NO_NEWLINE
; "wird erscheinen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+44
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $45,$69,$6E,$20,$6D,$61,$67,$69,$73,$63,$68,$65,$72,$20,$54,$6F,$72,$6E,$61,$64,$6F,$20,$0D,$0D
db $F7,$65,$72,$73,$63,$68,$65,$69,$6E,$65,$6E,$2E
db $00
; @ENDSTRING@

.phoenix:
; @NEW_TEXTBOX@
; SETPOS $8A 4
; LOOKUP AllItemsTable SequenceTable+46
; SETPOS $A 5
; "Notwendige JUWELEN : 2\n\n" NO_NEWLINE
; "Der Phönix wird Dich \n\n" NO_NEWLINE
; "begleiten." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,SequenceTable+46
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$32,$0D,$0D
db $88,$50,$68,$2A,$6E,$69,$78,$20,$F7,$85,$0D,$0D
db $62,$65,$67,$6C,$65,$69,$74,$65,$6E,$2E
db $00
; @ENDSTRING@

db $01,$8A,$04,$05   ;C2DD86|        |00006E;
db $3B,$D1,$2D,$E4,$01,$0A,$05,$5A   ;C2DD8E|        |      ;
db $69,$65,$67,$65,$6E,$66,$75,$74   ;C2DD96|        |      ;
db $74,$65,$72,$20,$F1,$5A,$75,$62   ;C2DD9E|        |000065;
db $65,$2D,$0D,$0D,$68,$2A,$72,$6C   ;C2DDA6|        |00002D;
db $61,$64,$65,$6E,$2E,$00,$01,$8A   ;C2DDAE|        |000064;
db $04,$05,$3B,$D1,$2F,$E4,$01,$0A   ;C2DDB6|        |000005;
db $05,$53,$61,$69,$74,$65,$20,$C6   ;C2DDBE|        |000053;
db $48,$61,$72,$66,$65,$20,$76,$6F   ;C2DDC6|        |      ;
db $6D,$0D,$0D,$53,$7B,$6E,$67,$65   ;C2DDCE|        |000D0D;
db $72,$2E,$00,$01,$8A,$04,$05,$3B   ;C2DDD6|        |00002E;
db $D1,$31,$E4,$01,$0A,$05,$45,$69   ;C2DDDE|        |000031;
db $6E,$20,$50,$61,$73,$73,$20,$EE   ;C2DDE6|        |005020;
db $B7,$0D,$0D,$4B,$69,$6E,$64,$65   ;C2DDEE|        |00000D;
db $72,$6E,$20,$AD,$47,$72,$61,$73   ;C2DDF6|        |00006E;
db $73,$0D,$0D,$56,$61,$6C,$6C,$65   ;C2DDFE|        |00000D;
db $79,$2E,$00,$01,$8A,$04,$05,$3B   ;C2DE06|        |00002E;
db $D1,$33,$E4,$01,$0A,$05,$45,$69   ;C2DE0E|        |000033;
db $6E,$20,$73,$65,$6C,$74,$73,$61   ;C2DE16|        |007320;
db $6D,$20,$61,$75,$73,$73,$65,$68   ;C2DE1E|        |006120;
db $65,$6E,$64,$2D,$0D,$0D,$C8,$53   ;C2DE26|        |00006E;
db $74,$61,$62,$2C,$20,$DA,$BB,$83   ;C2DE2E|        |000061;
db $69,$6E,$0D,$0D,$54,$72,$7B,$75   ;C2DE36|        |      ;
db $6D,$65,$20,$73,$63,$68,$61,$75   ;C2DE3E|        |002065;
db $65,$6E,$20,$6B,$61,$6E,$6E,$73   ;C2DE46|        |00006E;
db $74,$2E,$00,$01,$8A,$04,$05,$3B   ;C2DE4E|        |00002E;
db $D1,$35,$E4,$01,$0A,$05,$88,$50   ;C2DE56|        |000035;
db $69,$6E,$73,$65,$6C,$20,$B6,$FE   ;C2DE5E|        |      ;
db $0D,$0D,$4D,$61,$6C,$65,$6E,$20   ;C2DE66|        |004D0D;
db $EE,$3C,$A9,$B8,$0D,$0D,$42,$2A   ;C2DE6E|        |00A93C;
db $73,$65,$6E,$3E,$20,$76,$65,$72   ;C2DE76|        |000065;
db $77,$65,$6E,$64,$65,$74,$20,$77   ;C2DE7E|        |000065;
db $75,$72,$64,$65,$00,$01,$8A,$04   ;C2DE86|        |000072;
db $05,$3B,$D1,$37,$E4,$01,$0A,$05   ;C2DE8E|        |00003B;
db $53,$79,$6D,$62,$6F,$6C,$20,$EE   ;C2DE96|        |000079;
db $54,$75,$72,$62,$6F,$2E,$4A,$65   ;C2DE9E|        |      ;
db $64,$65,$72,$0D,$0D,$DA,$64,$69   ;C2DEA6|        |000065;
db $65,$73,$65,$6D,$20,$53,$79,$6D   ;C2DEAE|        |000073;
db $62,$6F,$6C,$20,$67,$69,$6C,$74   ;C2DEB6|        |C24B28;
db $0D,$0D,$AF,$42,$6F,$74,$65,$20   ;C2DEBE|        |00AF0D;
db $54,$75,$72,$62,$6F,$60,$73,$2E   ;C2DEC6|        |      ;
db $00,$01,$8A,$04,$05,$3B,$D1,$39   ;C2DECE|        |      ;
db $E4,$01,$0A,$05,$45,$69,$6E,$20   ;C2DED6|        |000001;
db $42,$61,$6E,$64,$2C,$B9,$62,$65   ;C2DEDE|        |      ;
db $73,$6F,$6E,$64,$65,$72,$73,$0D   ;C2DEE6|        |00006F;
db $0D,$4D,$6F,$6E,$6D,$6F,$2C,$BB   ;C2DEEE|        |006F4D;
db $4D,$61,$75,$6C,$77,$75,$72,$66   ;C2DEF6|        |007561;
db $2C,$67,$65,$2D,$0D,$0D,$66,$69   ;C2DEFE|        |006567;
db $65,$6C,$2C,$AF,$E6,$6C,$65,$62   ;C2DF06|        |00006C;
db $74,$65,$2E,$00,$01,$8A,$04,$05   ;C2DF0E|        |000065;
db $3B,$D1,$3B,$E4,$01,$0A,$05,$45   ;C2DF16|        |      ;
db $69,$6E,$65,$20,$77,$75,$6E,$64   ;C2DF1E|        |      ;
db $65,$72,$73,$63,$68,$2A,$6E,$65   ;C2DF26|        |000072;
db $20,$0D,$0D,$50,$65,$72,$6C,$65   ;C2DF2E|        |C20D0D;
db $2C,$20,$B5,$61,$6D,$20,$4B,$6F   ;C2DF36|        |00B520;
db $72,$61,$6C,$6C,$65,$6E,$0D,$0D   ;C2DF3E|        |000061;
db $52,$69,$66,$66,$20,$67,$65,$66   ;C2DF46|        |000069;
db $75,$6E,$64,$65,$6E,$20,$77,$69   ;C2DF4E|        |00006E;
db $72,$64,$2E,$00,$01,$8A,$04,$05   ;C2DF56|        |000064;
db $3B,$D1,$3D,$E4,$01,$0A,$05,$56   ;C2DF5E|        |      ;
db $65,$72,$77,$61,$6E,$64,$65,$6C   ;C2DF66|        |000072;
db $74,$20,$4C,$61,$76,$61,$20,$D3   ;C2DF6E|        |000020;
db $0D,$0D,$53,$74,$65,$69,$6E,$2E   ;C2DF76|        |00530D;
db $00,$01,$8A,$04,$05,$3B,$D1,$3F   ;C2DF7E|        |      ;
db $E4,$01,$0A,$05,$88,$53,$63,$68   ;C2DF86|        |000001;
db $6E,$65,$63,$6B,$65,$6E,$73,$63   ;C2DF8E|        |006365;
db $68,$6C,$65,$69,$6D,$0D,$0D,$65   ;C2DF96|        |      ;
db $72,$6D,$2A,$67,$6C,$69,$63,$68   ;C2DF9E|        |00006D;
db $74,$20,$C3,$44,$69,$72,$2C,$20   ;C2DFA6|        |000020;
db $61,$75,$66,$0D,$0D,$45,$69,$73   ;C2DFAE|        |000075;
db $20,$FD,$6C,$61,$75,$66,$65,$6E   ;C2DFB6|        |C26CFD;
db $2E,$00,$01,$8A,$04,$05,$3B,$D1   ;C2DFBE|        |000100;
db $41,$E4,$01,$0A,$05,$A1,$FE,$4C   ;C2DFC6|        |0000E4;
db $75,$66,$74,$2D,$0D,$0D,$73,$63   ;C2DFCE|        |000066;
db $68,$69,$66,$66,$2E,$20,$8A,$5A   ;C2DFD6|        |      ;
db $5B,$6E,$64,$2D,$0D,$0D,$73,$63   ;C2DFDE|        |      ;
db $68,$6C,$6F,$25,$20,$D2,$61,$6D   ;C2DFE6|        |      ;
db $20,$53,$63,$68,$69,$66,$66,$2E   ;C2DFEE|        |C26353;
db $00,$01,$8A,$04,$05,$3B,$D1,$43   ;C2DFF6|        |      ;
db $E4,$01,$0A,$05,$A8,$83,$BF,$0D   ;C2DFFE|        |000001;
db $0D,$42,$6C,$69,$74,$7A,$73,$7B   ;C2E006|        |006C42;
db $75,$6C,$65,$20,$62,$65,$72,$5B   ;C2E00E|        |00006C;
db $68,$72,$73,$74,$2C,$20,$0D,$0D   ;C2E016|        |      ;
db $F7,$C3,$62,$6C,$69,$74,$7A,$65   ;C2E01E|        |0000C3;
db $6E,$2E,$00,$01,$8A,$04,$05,$3B   ;C2E026|        |00002E;
db $D1,$45,$E4,$01,$0A,$05,$4C,$65   ;C2E02E|        |000045;
db $63,$6B,$65,$72,$65,$20,$53,$61   ;C2E036|        |00006B;
db $6D,$65,$6E,$2E,$0D,$0D,$54,$61   ;C2E03E|        |006E65;
db $75,$73,$63,$68,$65,$20,$9F,$61   ;C2E046|        |000073;
db $6D,$0D,$0D,$42,$65,$73,$74,$65   ;C2E04E|        |000D0D;
db $6E,$20,$65,$69,$6E,$2E,$00,$01   ;C2E056|        |006520;
db $8A,$04,$05,$3B,$D1,$47,$E4,$01   ;C2E05E|        |      ;
db $0A,$05,$53,$65,$74,$7A,$74,$20   ;C2E066|        |      ;
db $C0,$47,$65,$72,$75,$63,$68,$0D   ;C2E06E|        |      ;
db $0D,$66,$72,$65,$69,$2C,$20,$77   ;C2E076|        |007266;
db $65,$6C,$63,$68,$65,$72,$20,$4B   ;C2E07E|        |00006C;
db $61,$74,$7A,$65,$6E,$0D,$0D,$61   ;C2E086|        |000074;
db $6E,$7A,$69,$65,$68,$74,$2E,$00   ;C2E08E|        |00697A;
db $01,$8A,$04,$05,$3B,$D1,$49,$E4   ;C2E096|        |00008A;
db $01,$0A,$05,$44,$69,$65,$73,$65   ;C2E09E|        |00000A;
db $72,$20,$A1,$77,$69,$72,$64,$0D   ;C2E0A6|        |000020;
db $0D,$B5,$54,$5B,$72,$20,$FE,$4C   ;C2E0AE|        |0054B5;
db $61,$62,$6F,$72,$0D,$0D,$2A,$66   ;C2E0B6|        |000062;
db $66,$6E,$65,$6E,$2E,$00,$01,$8A   ;C2E0BE|        |00006E;
db $04,$05,$3B,$D1,$4B,$E4,$01,$0A   ;C2E0C6|        |000005;
db $05,$83,$6B,$61,$6E,$6E,$73,$74   ;C2E0CE|        |000083;
db $20,$B7,$6C,$69,$6E,$6B,$65,$6E   ;C2E0D6|        |C26CB7;
db $0D,$0D,$54,$75,$72,$6D,$20,$B8   ;C2E0DE|        |00540D;
db $99,$0D,$0D,$53,$63,$68,$6C,$6F   ;C2E0E6|        |000D0D;
db $25,$65,$73,$20,$62,$65,$74,$72   ;C2E0EE|        |000065;
db $65,$74,$65,$6E,$2E,$00,$01,$8A   ;C2E0F6|        |000074;
db $04,$05,$3B,$D1,$4D,$E4,$01,$0A   ;C2E0FE|        |000005;
db $05,$83,$6B,$61,$6E,$6E,$73,$74   ;C2E106|        |000083;
db $20,$5B,$62,$65,$72,$61,$6C,$6C   ;C2E10E|        |C2625B;
db $20,$68,$69,$6E,$0D,$0D,$D5,$53   ;C2E116|        |C26968;
db $63,$68,$6C,$6F,$25,$65,$20,$4D   ;C2E11E|        |000068;
db $61,$67,$72,$69,$64,$64,$73,$60   ;C2E126|        |000067;
db $2E,$00,$01,$8A,$04,$05,$3B,$D1   ;C2E12E|        |000100;
db $4F,$E4,$01,$0A,$05,$A8,$83,$38   ;C2E136|        |0A01E4;
db $20,$68,$69,$65,$72,$76,$6F,$6E   ;C2E13E|        |C26968;
db $20,$67,$65,$2D,$0D,$0D,$73,$61   ;C2E146|        |C26567;
db $6D,$6D,$65,$6C,$74,$20,$68,$61   ;C2E14E|        |00656D;
db $73,$74,$2C,$20,$B4,$44,$75,$0D   ;C2E156|        |000074;
db $0D,$BE,$4D,$65,$69,$73,$74,$65   ;C2E15E|        |004DBE;
db $72,$20,$B6,$4D,$61,$67,$69,$65   ;C2E166|        |000020;
db $2E,$00,$01,$8A,$04,$05,$3B,$D1   ;C2E16E|        |000100;
db $51,$E4,$13,$38,$E1,$01,$8A,$04   ;C2E176|        |0000E4;
db $05,$3B,$D1,$53,$E4,$13,$38,$E1   ;C2E17E|        |00003B;
db $01,$8A,$04,$05,$3B,$D1,$55,$E4   ;C2E186|        |00008A;
db $13,$38,$E1,$01,$8A,$04,$05,$3B   ;C2E18E|        |000038;
db $D1,$57,$E4,$13,$38,$E1,$01,$8A   ;C2E196|        |000057;
db $04,$05,$3B,$D1,$59,$E4,$13,$38   ;C2E19E|        |000005;
db $E1,$01,$8A,$04,$05,$3B,$D1,$5B   ;C2E1A6|        |000001;
db $E4,$13,$38,$E1,$01,$8A,$04,$05   ;C2E1AE|        |000013;
db $3B,$D1,$5D,$E4,$13,$38,$E1,$01   ;C2E1B6|        |      ;
db $8A,$04,$05,$3B,$D1,$5F,$E4,$01   ;C2E1BE|        |      ;
db $0A,$05,$A8,$83,$AE,$33,$20,$53   ;C2E1C6|        |      ;
db $79,$6D,$62,$6F,$6C,$65,$0D,$0D   ;C2E1CE|        |00626D;
db $65,$72,$68,$61,$6C,$74,$65,$6E   ;C2E1D6|        |000072;
db $20,$68,$61,$73,$74,$2C,$20,$77   ;C2E1DE|        |C26168;
db $69,$72,$64,$0D,$0D,$B6,$50,$68   ;C2E1E6|        |      ;
db $2A,$6E,$69,$78,$20,$6B,$6F,$6D   ;C2E1EE|        |      ;
db $6D,$65,$6E,$2E,$00,$01,$8A,$04   ;C2E1F6|        |006E65;
db $05,$3B,$D1,$61,$E4,$13,$C5,$E1   ;C2E1FE|        |00003B;
db $01,$8A,$04,$05,$3B,$D1,$63,$E4   ;C2E206|        |00008A;
db $13,$C5,$E1,$01,$8A,$04,$05,$3B   ;C2E20E|        |0000C5;
db $D1,$65,$E4,$01,$0A,$05,$8A,$42   ;C2E216|        |000065;
db $65,$6E,$75,$74,$7A,$65,$6E,$20   ;C2E21E|        |00006E;
db $64,$69,$65,$73,$65,$73,$0D,$0D   ;C2E226|        |000069;
db $47,$65,$67,$65,$6E,$73,$74,$61   ;C2E22E|        |000065;
db $6E,$64,$73,$20,$76,$65,$72,$64   ;C2E236|        |007364;
db $6F,$70,$70,$65,$6C,$74,$0D,$0D   ;C2E23E|        |657070;
db $44,$65,$69,$6E,$65,$20,$41,$6E   ;C2E246|        |      ;
db $67,$72,$69,$66,$66,$73,$6B,$72   ;C2E24E|        |000072;
db $61,$66,$74,$2E,$00,$01,$8A,$04   ;C2E256|        |000066;
db $05,$3B,$D1,$67,$E4,$01,$0A,$05   ;C2E25E|        |00003B;
db $56,$65,$72,$72,$69,$6E,$67,$65   ;C2E266|        |000065;
db $72,$74,$20,$B7,$53,$63,$68,$61   ;C2E26E|        |000074;
db $64,$65,$6E,$0D,$0D,$B6,$95,$EC   ;C2E276|        |000065;
db $64,$69,$65,$0D,$0D,$48,$7B,$6C   ;C2E27E|        |000069;
db $66,$74,$65,$2E,$00,$01,$8A,$04   ;C2E286|        |000074;
db $05,$3B,$D1,$69,$E4,$01,$0A,$05   ;C2E28E|        |00003B;
db $44,$65,$69,$6E,$20,$A3,$EB,$44   ;C2E296|        |      ;
db $65,$69,$6E,$65,$0D,$0D,$9D,$68   ;C2E29E|        |000069;
db $61,$6C,$74,$65,$6E,$20,$64,$6F   ;C2E2A6|        |00006C;
db $70,$70,$65,$6C,$74,$0D,$0D,$E9   ;C2E2AE|        |C2E320;
db $76,$69,$65,$6C,$20,$61,$75,$73   ;C2E2B6|        |000069;
db $2E,$00,$01,$8A,$04,$05,$3B,$D1   ;C2E2BE|        |000100;
db $6B,$E4,$01,$0A,$05,$44,$65,$69   ;C2E2C6|        |      ;
db $6E,$65,$20,$48,$50,$20,$F5,$77   ;C2E2CE|        |002065;
db $69,$65,$64,$65,$72,$0D,$0D,$61   ;C2E2D6|        |      ;
db $75,$66,$67,$65,$66,$5B,$6C,$6C   ;C2E2DE|        |000066;
db $74,$2C,$20,$F3,$44,$65,$69,$6E   ;C2E2E6|        |00002C;
db $65,$0D,$0D,$4C,$65,$62,$65,$6E   ;C2E2EE|        |00000D;
db $73,$61,$6E,$7A,$65,$69,$67,$65   ;C2E2F6|        |000061;
db $20,$30,$20,$7A,$65,$69,$67,$74   ;C2E2FE|        |C22030;
db $2E,$00,$01,$8A,$04,$05,$3B,$D1   ;C2E306|        |000100;
db $6D,$E4,$01,$0A,$05,$83,$FA,$D8   ;C2E30E|        |0001E4;
db $4A,$75,$77,$65,$6C,$65,$6E,$0D   ;C2E316|        |      ;
db $0D,$76,$65,$72,$6C,$69,$65,$72   ;C2E31E|        |006576;
db $65,$6E,$2C,$20,$F3,$44,$65,$69   ;C2E326|        |00006E;
db $6E,$65,$0D,$0D,$4C,$65,$62,$65   ;C2E32E|        |000D65;
db $6E,$73,$61,$6E,$7A,$65,$69,$67   ;C2E336|        |006173;
db $65,$20,$30,$20,$7A,$65,$69,$67   ;C2E33E|        |000020;
db $74,$2E,$00,$01,$8A,$04,$05,$3B   ;C2E346|        |00002E;
db $D1,$6F,$E4,$01,$0A,$05,$87,$A9   ;C2E34E|        |00006F;
db $B8,$82,$0D,$0D,$F7,$65,$72,$73   ;C2E356|        |      ;
db $63,$68,$65,$69,$6E,$65,$6E,$2C   ;C2E35E|        |000068;
db $20,$77,$65,$6E,$6E,$0D,$0D,$83   ;C2E366|        |C26577;
db $36,$20,$68,$69,$65,$72,$76,$6F   ;C2E36E|        |000020;
db $6E,$20,$73,$61,$6D,$6D,$65,$6C   ;C2E376|        |007320;
db $73,$74,$2E,$00,$01,$8A,$04,$05   ;C2E37E|        |000074;
db $3B,$D1,$71,$E4,$13,$51,$E3,$01   ;C2E386|        |      ;
db $8A,$04,$05,$3B,$D1,$73,$E4,$13   ;C2E38E|        |      ;
db $51,$E3,$01,$8A,$04,$05,$3B,$D1   ;C2E396|        |0000E3;
db $75,$E4,$13,$51,$E3,$01,$8A,$04   ;C2E39E|        |0000E4;
db $05,$3B,$D1,$77,$E4,$13,$51,$E3   ;C2E3A6|        |00003B;
db $01,$8A,$04,$05,$3B,$D1,$79,$E4   ;C2E3AE|        |00008A;
db $13,$51,$E3,$01,$8A,$04,$05,$3B   ;C2E3B6|        |000051;
db $D1,$7B,$E4,$01,$0A,$05,$83,$6B   ;C2E3BE|        |00007B;
db $61,$6E,$6E,$73,$74,$20,$6E,$75   ;C2E3C6|        |00006E;
db $6E,$20,$4D,$61,$67,$69,$65,$0D   ;C2E3CE|        |004D20;
db $0D,$62,$65,$6E,$75,$74,$7A,$65   ;C2E3D6|        |006562;
db $6E,$2C,$20,$6F,$68,$6E,$65,$20   ;C2E3DE|        |00202C;
db $44,$65,$69,$6E,$65,$0D,$0D,$90   ;C2E3E6|        |      ;
db $61,$75,$66,$7A,$75,$62,$72,$61   ;C2E3EE|        |000075;
db $75,$63,$68,$65,$6E,$2E,$00
