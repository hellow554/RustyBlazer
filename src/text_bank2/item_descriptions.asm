
ItemDescriptionTable:
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
.items:
    dw .goat_food, .harp_string, .pass, .dream_rod
    dw .leos_brush, .greenwood_leaves, .moles_ribbon, .big_pearl
    dw .mermaids_tears, .mushroom_shoes, .mobile_key, .thunder_ring
    dw .delicious_seeds, .plant_leaves, .door_key, .platinum_card
    dw .vip_card
    dw .emblem_a, .emblem_b, .emblem_c, .emblem_d
    dw .emblem_e, .emblem_f, .emblem_g, .emblem_h
    dw .hot_mirror, .hot_ball, .hot_stick
    dw .power_bracelet, .shield_bracelet, .super_bracelet
    dw .medical_herb, .strange_bottle
    dw .brown_stone, .green_stone, .blue_stone
    dw .silver_stone, .purple_stone, .black_stone
    dw .magic_bell

.drawBox:
; @NEW_TEXT@
; SETPOS 8 4
; DRAWBOX $16 8
db $01,$08,$04
db $07,$16,$08
db $00
; @ENDSTRING@

.life_sword:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+0
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+0
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+0
; SETPOS $8A 5
; "Ein Schwert vom\n\n" NO_NEWLINE
; "Meister." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+0
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+2
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+2
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+1
; SETPOS $8A 5
; "Lähmung für\n\n" NO_NEWLINE
; "starke Monster." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+2
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+4
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+4
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+2
; SETPOS $8A 5
; "Besiegt die Monster\n\n" NO_NEWLINE
; "mit einem Schlag." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+4
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+6
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+6
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+3
; SETPOS $8A 5
; "Größere Chancen\n\n" NO_NEWLINE
; "JWL zu finden" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+6
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+8
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+8
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+4
; SETPOS $8A 5
; "Schlägt die Monster \n\n" NO_NEWLINE
; "mit spezieller Rüstung" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+8
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+10
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+10
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+5
; SETPOS $8A 5
; "Schlägt die <Geister>\n\n" NO_NEWLINE
; "Monster." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+10
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+12
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+12
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+6
; SETPOS $8A 5
; "Die HP werden nach dem\n\n" NO_NEWLINE
; "Sieg wieder aufgefüllt" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+12
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+14
; SETPOS $B2 4
; DECVAL 2 WeaponLevelRequirement+14
; SETPOS $1E 5
; REPEAT $26 ItemStrenghTable+7
; SETPOS $8A 5
; "Das stärkste Schwert,\n\n" NO_NEWLINE
; "das Du benutzen kannst" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+14
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
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+16
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+0
; SETPOS $8A 5
; "Deine Abwehrkräfte\n\n" NO_NEWLINE
; "werden stärker." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+16
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+0
db $01,$8A,$05
db $44,$65,$69,$6E,$65,$20,$41,$62,$77,$65,$68,$72,$6B,$72,$7B,$66,$74,$65,$0D,$0D
db $F5,$73,$74,$7B,$72,$6B,$65,$72,$2E
db $00
; @ENDSTRING@

.ice_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+18
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+1
; SETPOS $8A 5
; "Du kannst ohne Gefahr\n\n" NO_NEWLINE
; "Feuer überqueren." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+18
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+1
db $01,$8A,$05
db $83,$6B,$61,$6E,$6E,$73,$74,$20,$6F,$68,$6E,$65,$20,$47,$65,$66,$61,$68,$72,$0D,$0D
db $46,$65,$75,$65,$72,$20,$5B,$62,$65,$72,$71,$75,$65,$72,$65,$6E,$2E
db $00
; @ENDSTRING@

.bubble_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+20
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+2
; SETPOS $8A 5
; "Ermöglicht es Dir,\n\n" NO_NEWLINE
; "unter Wasser zu laufen" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+20
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+2
db $01,$8A,$05
db $45,$72,$6D,$2A,$67,$6C,$69,$63,$68,$74,$20,$C3,$44,$69,$72,$2C,$0D,$0D
db $75,$6E,$74,$65,$72,$20,$57,$61,$73,$73,$65,$72,$20,$FD,$6C,$61,$75,$66,$65,$6E
db $00
; @ENDSTRING@

.magic_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+22
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+3
; SETPOS $8A 5
; "Verringert die notwen-\n\n" NO_NEWLINE
; "digen Juwelen um 1/2." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+22
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+3
db $01,$8A,$05
db $56,$65,$72,$72,$69,$6E,$67,$65,$72,$74,$20,$B5,$6E,$6F,$74,$77,$65,$6E,$2D,$0D,$0D
db $64,$69,$67,$65,$6E,$20,$90,$EC,$31,$2F,$32,$2E
db $00
; @ENDSTRING@

.mystic_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+24
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+4
; SETPOS $8A 5
; "Unbesiegbar für einen\n\n" NO_NEWLINE
; "längeren Zeitabstand." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+24
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+4
db $01,$8A,$05
db $55,$6E,$62,$65,$73,$69,$65,$67,$62,$61,$72,$20,$C9,$65,$69,$6E,$65,$6E,$0D,$0D
db $6C,$7B,$6E,$67,$65,$72,$65,$6E,$20,$5A,$65,$69,$74,$61,$62,$73,$74,$61,$6E,$64,$2E
db $00
; @ENDSTRING@

.light_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+26
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+5
; SETPOS $8A 5
; "Schwache Monster sind\n\n" NO_NEWLINE
; "keine Gefahr mehr." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+26
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+5
db $01,$8A,$05
db $53,$63,$68,$77,$61,$63,$68,$65,$20,$95,$73,$69,$6E,$64,$0D,$0D
db $D8,$47,$65,$66,$61,$68,$72,$20,$6D,$65,$68,$72,$2E
db $00
; @ENDSTRING@

.elemental_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+28
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+6
; SETPOS $8A 5
; "Beschützt Dich vor den\n\n" NO_NEWLINE
; "Gefahren zonen" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+28
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+6
db $01,$8A,$05
db $42,$65,$73,$63,$68,$5B,$74,$7A,$74,$20,$85,$76,$6F,$72,$20,$64,$65,$6E,$0D,$0D
db $47,$65,$66,$61,$68,$72,$65,$6E,$20,$7A,$6F,$6E,$65,$6E
db $00
; @ENDSTRING@

.soul_armor:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+30
; SETPOS $1E 5
; REPEAT $27 ItemDefenseTable+7
; SETPOS $8A 5
; "Ermöglicht es Dir,Dich\n\n" NO_NEWLINE
; "im Weltall zu bewegen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+30
db $01,$1E,$05
db $0B,$27 : dw ItemDefenseTable+7
db $01,$8A,$05
db $45,$72,$6D,$2A,$67,$6C,$69,$63,$68,$74,$20,$C3,$44,$69,$72,$2C,$44,$69,$63,$68,$0D,$0D
db $D5,$57,$65,$6C,$74,$61,$6C,$6C,$20,$FD,$62,$65,$77,$65,$67,$65,$6E,$2E
db $00
; @ENDSTRING@

.flame_ball:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+32
; SETPOS $A 5
; "Notwendige JUWELEN : 4\n\n" NO_NEWLINE
; "Schießt einen Feuer-\n\n" NO_NEWLINE
; "ball in eine Richtung." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+32
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$34,$0D,$0D
db $53,$63,$68,$69,$65,$25,$74,$20,$C0,$46,$65,$75,$65,$72,$2D,$0D,$0D
db $62,$61,$6C,$6C,$20,$D3,$BF,$52,$69,$63,$68,$74,$75,$6E,$67,$2E
db $00
; @ENDSTRING@

.light_arrow:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+34
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Schießt einen Licht \n\n" NO_NEWLINE
; "Pfeil in eine Richtung" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+34
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $53,$63,$68,$69,$65,$25,$74,$20,$C0,$4C,$69,$63,$68,$74,$20,$0D,$0D
db $50,$66,$65,$69,$6C,$20,$D3,$BF,$52,$69,$63,$68,$74,$75,$6E,$67
db $00
; @ENDSTRING@

.magic_flair:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+36
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Die Kraft wird durch \n\n" NO_NEWLINE
; "Knopfdruck gesammelt." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+36
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $87,$4B,$72,$61,$66,$74,$20,$F7,$64,$75,$72,$63,$68,$20,$0D,$0D
db $4B,$6E,$6F,$70,$66,$64,$72,$75,$63,$6B,$20,$67,$65,$73,$61,$6D,$6D,$65,$6C,$74,$2E
db $00
; @ENDSTRING@

.rotator:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+38
; SETPOS $A 5
; "Notwendige JUWELEN : 1\n\n" NO_NEWLINE
; "Ein Ring aus Licht \n\n" NO_NEWLINE
; "wird Dich umkreisen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+38
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$31,$0D,$0D
db $45,$69,$6E,$20,$52,$69,$6E,$67,$20,$AD,$4C,$69,$63,$68,$74,$20,$0D,$0D
db $F7,$85,$75,$6D,$6B,$72,$65,$69,$73,$65,$6E,$2E
db $00
; @ENDSTRING@

.spark_bomb:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+40
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Abgelegte Minen werden\n\n" NO_NEWLINE
; "explodieren." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+40
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $41,$62,$67,$65,$6C,$65,$67,$74,$65,$20,$4D,$69,$6E,$65,$6E,$20,$77,$65,$72,$64,$65,$6E,$0D,$0D
db $65,$78,$70,$6C,$6F,$64,$69,$65,$72,$65,$6E,$2E
db $00
; @ENDSTRING@

.flame_pillar:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+42
; SETPOS $A 5
; "Notwendige JUWELEN :20\n\n" NO_NEWLINE
; "Säulen aus Feuer\n\n" NO_NEWLINE
; "erheben sich um Dich." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+42
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$32,$30,$0D,$0D
db $53,$7B,$75,$6C,$65,$6E,$20,$AD,$46,$65,$75,$65,$72,$0D,$0D
db $65,$72,$68,$65,$62,$65,$6E,$20,$E5,$EC,$44,$69,$63,$68,$2E
db $00
; @ENDSTRING@

.tornado:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+44
; SETPOS $A 5
; "Notwendige JUWELEN : 8\n\n" NO_NEWLINE
; "Ein magischer Tornado \n\n" NO_NEWLINE
; "wird erscheinen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+44
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$38,$0D,$0D
db $45,$69,$6E,$20,$6D,$61,$67,$69,$73,$63,$68,$65,$72,$20,$54,$6F,$72,$6E,$61,$64,$6F,$20,$0D,$0D
db $F7,$65,$72,$73,$63,$68,$65,$69,$6E,$65,$6E,$2E
db $00
; @ENDSTRING@

.phoenix:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+46
; SETPOS $A 5
; "Notwendige JUWELEN : 2\n\n" NO_NEWLINE
; "Der Phönix wird Dich \n\n" NO_NEWLINE
; "begleiten." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+46
db $01,$0A,$05
db $9B,$4A,$55,$57,$45,$4C,$45,$4E,$20,$3A,$20,$32,$0D,$0D
db $88,$50,$68,$2A,$6E,$69,$78,$20,$F7,$85,$0D,$0D
db $62,$65,$67,$6C,$65,$69,$74,$65,$6E,$2E
db $00
; @ENDSTRING@

.goat_food:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+48
; SETPOS $A 5
; "Ziegenfutter vom Zube-\n\n" NO_NEWLINE
; "hörladen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+48
db $01,$0A,$05
db $5A,$69,$65,$67,$65,$6E,$66,$75,$74,$74,$65,$72,$20,$F1,$5A,$75,$62,$65,$2D,$0D,$0D
db $68,$2A,$72,$6C,$61,$64,$65,$6E,$2E
db $00
; @ENDSTRING@

.harp_string:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+50
; SETPOS $A 5
; "Saite einer Harfe vom\n\n" NO_NEWLINE
; "Sänger." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+50
db $01,$0A,$05
db $53,$61,$69,$74,$65,$20,$C6,$48,$61,$72,$66,$65,$20,$76,$6F,$6D,$0D,$0D
db $53,$7B,$6E,$67,$65,$72,$2E
db $00
; @ENDSTRING@

.pass:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+52
; SETPOS $A 5
; "Ein Pass von den \n\n" NO_NEWLINE
; "Kindern aus Grass\n\n" NO_NEWLINE
; "Valley." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+52
db $01,$0A,$05
db $45,$69,$6E,$20,$50,$61,$73,$73,$20,$EE,$B7,$0D,$0D
db $4B,$69,$6E,$64,$65,$72,$6E,$20,$AD,$47,$72,$61,$73,$73,$0D,$0D
db $56,$61,$6C,$6C,$65,$79,$2E
db $00
; @ENDSTRING@

.dream_rod:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+54
; SETPOS $A 5
; "Ein seltsam aussehend-\n\n" NO_NEWLINE
; "er Stab, mit dem Du in\n\n" NO_NEWLINE
; "Träume schauen kannst." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+54
db $01,$0A,$05
db $45,$69,$6E,$20,$73,$65,$6C,$74,$73,$61,$6D,$20,$61,$75,$73,$73,$65,$68,$65,$6E,$64,$2D,$0D,$0D
db $C8,$53,$74,$61,$62,$2C,$20,$DA,$BB,$83,$69,$6E,$0D,$0D
db $54,$72,$7B,$75,$6D,$65,$20,$73,$63,$68,$61,$75,$65,$6E,$20,$6B,$61,$6E,$6E,$73,$74,$2E
db $00
; @ENDSTRING@

.leos_brush:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+56
; SETPOS $A 5
; "Der Pinsel der zum \n\n" NO_NEWLINE
; "Malen von \x3c\xa9\xb8\n\n" NO_NEWLINE
; "Bösen\x3e verwendet wurde" NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+56
db $01,$0A,$05
db $88,$50,$69,$6E,$73,$65,$6C,$20,$B6,$FE,$0D,$0D
db $4D,$61,$6C,$65,$6E,$20,$EE,$3C,$A9,$B8,$0D,$0D
db $42,$2A,$73,$65,$6E,$3E,$20,$76,$65,$72,$77,$65,$6E,$64,$65,$74,$20,$77,$75,$72,$64,$65
db $00
; @ENDSTRING@

.greenwood_leaves:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+58
; SETPOS $A 5
; "Symbol von Turbo.Jeder\n\n" NO_NEWLINE
; "mit diesem Symbol gilt\n\n" NO_NEWLINE
; "als Bote Turbo`s." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+58
db $01,$0A,$05
db $53,$79,$6D,$62,$6F,$6C,$20,$EE,$54,$75,$72,$62,$6F,$2E,$4A,$65,$64,$65,$72,$0D,$0D
db $DA,$64,$69,$65,$73,$65,$6D,$20,$53,$79,$6D,$62,$6F,$6C,$20,$67,$69,$6C,$74,$0D,$0D
db $AF,$42,$6F,$74,$65,$20,$54,$75,$72,$62,$6F,$60,$73,$2E
db $00
; @ENDSTRING@

.moles_ribbon:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+60
; SETPOS $A 5
; "Ein Band,das besonders\n\n" NO_NEWLINE
; "Monmo,dem Maulwurf,ge-\n\n" NO_NEWLINE
; "fiel,als sie lebte." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+60
db $01,$0A,$05
db $45,$69,$6E,$20,$42,$61,$6E,$64,$2C,$B9,$62,$65,$73,$6F,$6E,$64,$65,$72,$73,$0D,$0D
db $4D,$6F,$6E,$6D,$6F,$2C,$BB,$4D,$61,$75,$6C,$77,$75,$72,$66,$2C,$67,$65,$2D,$0D,$0D
db $66,$69,$65,$6C,$2C,$AF,$E6,$6C,$65,$62,$74,$65,$2E
db $00
; @ENDSTRING@

.big_pearl:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+62
; SETPOS $A 5
; "Eine wunderschöne \n\n" NO_NEWLINE
; "Perle, die am Korallen\n\n" NO_NEWLINE
; "Riff gefunden wird." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+62
db $01,$0A,$05
db $45,$69,$6E,$65,$20,$77,$75,$6E,$64,$65,$72,$73,$63,$68,$2A,$6E,$65,$20,$0D,$0D
db $50,$65,$72,$6C,$65,$2C,$20,$B5,$61,$6D,$20,$4B,$6F,$72,$61,$6C,$6C,$65,$6E,$0D,$0D
db $52,$69,$66,$66,$20,$67,$65,$66,$75,$6E,$64,$65,$6E,$20,$77,$69,$72,$64,$2E
db $00
; @ENDSTRING@

.mermaids_tears:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+64
; SETPOS $A 5
; "Verwandelt Lava in \n\n" NO_NEWLINE
; "Stein." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+64
db $01,$0A,$05
db $56,$65,$72,$77,$61,$6E,$64,$65,$6C,$74,$20,$4C,$61,$76,$61,$20,$D3,$0D,$0D
db $53,$74,$65,$69,$6E,$2E
db $00
; @ENDSTRING@

.mushroom_shoes:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+66
; SETPOS $A 5
; "Der Schneckenschleim\n\n" NO_NEWLINE
; "ermöglicht es Dir, auf\n\n" NO_NEWLINE
; "Eis zu laufen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+66
db $01,$0A,$05
db $88,$53,$63,$68,$6E,$65,$63,$6B,$65,$6E,$73,$63,$68,$6C,$65,$69,$6D,$0D,$0D
db $65,$72,$6D,$2A,$67,$6C,$69,$63,$68,$74,$20,$C3,$44,$69,$72,$2C,$20,$61,$75,$66,$0D,$0D
db $45,$69,$73,$20,$FD,$6C,$61,$75,$66,$65,$6E,$2E
db $00
; @ENDSTRING@

.mobile_key:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+68
; SETPOS $A 5
; "Schlüssel zum Luft-\n\n" NO_NEWLINE
; "schiff. Das Zünd-\n\n" NO_NEWLINE
; "schloß ist am Schiff." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+68
db $01,$0A,$05
db $A1,$FE,$4C,$75,$66,$74,$2D,$0D,$0D
db $73,$63,$68,$69,$66,$66,$2E,$20,$8A,$5A,$5B,$6E,$64,$2D,$0D,$0D
db $73,$63,$68,$6C,$6F,$25,$20,$D2,$61,$6D,$20,$53,$63,$68,$69,$66,$66,$2E
db $00
; @ENDSTRING@

.thunder_ring:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+70
; SETPOS $A 5
; "Wenn Du eine \n\n" NO_NEWLINE
; "Blitzsäule berührst, \n\n" NO_NEWLINE
; "wird es blitzen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+70
db $01,$0A,$05
db $A8,$83,$BF,$0D,$0D
db $42,$6C,$69,$74,$7A,$73,$7B,$75,$6C,$65,$20,$62,$65,$72,$5B,$68,$72,$73,$74,$2C,$20,$0D,$0D
db $F7,$C3,$62,$6C,$69,$74,$7A,$65,$6E,$2E
db $00
; @ENDSTRING@

.delicious_seeds:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+72
; SETPOS $A 5
; "Leckere Samen.\n\n" NO_NEWLINE
; "Tausche Sie am\n\n" NO_NEWLINE
; "Besten ein." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+72
db $01,$0A,$05
db $4C,$65,$63,$6B,$65,$72,$65,$20,$53,$61,$6D,$65,$6E,$2E,$0D,$0D
db $54,$61,$75,$73,$63,$68,$65,$20,$9F,$61,$6D,$0D,$0D
db $42,$65,$73,$74,$65,$6E,$20,$65,$69,$6E,$2E
db $00
; @ENDSTRING@

.plant_leaves:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+74
; SETPOS $A 5
; "Setzt einen Geruch\n\n" NO_NEWLINE
; "frei, welcher Katzen\n\n" NO_NEWLINE
; "anzieht." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+74
db $01,$0A,$05
db $53,$65,$74,$7A,$74,$20,$C0,$47,$65,$72,$75,$63,$68,$0D,$0D
db $66,$72,$65,$69,$2C,$20,$77,$65,$6C,$63,$68,$65,$72,$20,$4B,$61,$74,$7A,$65,$6E,$0D,$0D
db $61,$6E,$7A,$69,$65,$68,$74,$2E
db $00
; @ENDSTRING@

.door_key:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+76
; SETPOS $A 5
; "Dieser Schlüssel wird\n\n" NO_NEWLINE
; "die Tür zum Labor\n\n" NO_NEWLINE
; "öffnen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+76
db $01,$0A,$05
db $44,$69,$65,$73,$65,$72,$20,$A1,$77,$69,$72,$64,$0D,$0D
db $B5,$54,$5B,$72,$20,$FE,$4C,$61,$62,$6F,$72,$0D,$0D
db $2A,$66,$66,$6E,$65,$6E,$2E
db $00
; @ENDSTRING@

.platinum_card:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+78
; SETPOS $A 5
; "Du kannst den linken\n\n" NO_NEWLINE
; "Turm des Magridd \n\n" NO_NEWLINE
; "Schloßes betreten." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+78
db $01,$0A,$05
db $83,$6B,$61,$6E,$6E,$73,$74,$20,$B7,$6C,$69,$6E,$6B,$65,$6E,$0D,$0D
db $54,$75,$72,$6D,$20,$B8,$99,$0D,$0D
db $53,$63,$68,$6C,$6F,$25,$65,$73,$20,$62,$65,$74,$72,$65,$74,$65,$6E,$2E
db $00
; @ENDSTRING@

.vip_card:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+80
; SETPOS $A 5
; "Du kannst überall hin\n\n" NO_NEWLINE
; "im Schloße Magridds`." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+80
db $01,$0A,$05
db $83,$6B,$61,$6E,$6E,$73,$74,$20,$5B,$62,$65,$72,$61,$6C,$6C,$20,$68,$69,$6E,$0D,$0D
db $D5,$53,$63,$68,$6C,$6F,$25,$65,$20,$4D,$61,$67,$72,$69,$64,$64,$73,$60,$2E
db $00
; @ENDSTRING@

.emblem_a:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+82
; LABEL .emblem_txt
; SETPOS $A 5
; "Wenn Du 8 hiervon ge-\n\n" NO_NEWLINE
; "sammelt hast, bist Du\n\n" NO_NEWLINE
; "ein Meister der Magie." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+82
.emblem_txt:
db $01,$0A,$05
db $A8,$83,$38,$20,$68,$69,$65,$72,$76,$6F,$6E,$20,$67,$65,$2D,$0D,$0D
db $73,$61,$6D,$6D,$65,$6C,$74,$20,$68,$61,$73,$74,$2C,$20,$B4,$44,$75,$0D,$0D
db $BE,$4D,$65,$69,$73,$74,$65,$72,$20,$B6,$4D,$61,$67,$69,$65,$2E
db $00
; @ENDSTRING@

.emblem_b:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+84
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+84
db $13 : dw .emblem_txt
; @END@

.emblem_c:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+86
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+86
db $13 : dw .emblem_txt
; @END@

.emblem_d:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+88
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+88
db $13 : dw .emblem_txt
; @END@

.emblem_e:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+90
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+90
db $13 : dw .emblem_txt
; @END@

.emblem_f:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+92
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+92
db $13 : dw .emblem_txt
; @END@

.emblem_g:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+94
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+94
db $13 : dw .emblem_txt
; @END@

.emblem_h:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+96
; -> .emblem_txt
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+96
db $13 : dw .emblem_txt
; @END@

.hot_mirror:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+98
; LABEL .hot_text
; SETPOS $A 5
; "Wenn Du alle 3 Symbole\n\n" NO_NEWLINE
; "erhalten hast, wird\n\n" NO_NEWLINE
; "der Phönix kommen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+98
.hot_text:
db $01,$0A,$05
db $A8,$83,$AE,$33,$20,$53,$79,$6D,$62,$6F,$6C,$65,$0D,$0D
db $65,$72,$68,$61,$6C,$74,$65,$6E,$20,$68,$61,$73,$74,$2C,$20,$77,$69,$72,$64,$0D,$0D
db $B6,$50,$68,$2A,$6E,$69,$78,$20,$6B,$6F,$6D,$6D,$65,$6E,$2E
db $00
; @ENDSTRING@

.hot_ball:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+100
; -> .hot_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+100
db $13 : dw .hot_text
; @END@

.hot_stick:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+102
; -> .hot_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+102
db $13 : dw .hot_text
; @END@

.power_bracelet:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+104
; SETPOS $A 5
; "Das Benutzen dieses\n\n" NO_NEWLINE
; "Gegenstands verdoppelt\n\n" NO_NEWLINE
; "Deine Angriffskraft." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+104
db $01,$0A,$05
db $8A,$42,$65,$6E,$75,$74,$7A,$65,$6E,$20,$64,$69,$65,$73,$65,$73,$0D,$0D
db $47,$65,$67,$65,$6E,$73,$74,$61,$6E,$64,$73,$20,$76,$65,$72,$64,$6F,$70,$70,$65,$6C,$74,$0D,$0D
db $44,$65,$69,$6E,$65,$20,$41,$6E,$67,$72,$69,$66,$66,$73,$6B,$72,$61,$66,$74,$2E
db $00
; @ENDSTRING@

.shield_bracelet:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+106
; SETPOS $A 5
; "Verringert den Schaden\n\n" NO_NEWLINE
; "der Monster um die\n\n" NO_NEWLINE
; "Hälfte." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+106
db $01,$0A,$05
db $56,$65,$72,$72,$69,$6E,$67,$65,$72,$74,$20,$B7,$53,$63,$68,$61,$64,$65,$6E,$0D,$0D
db $B6,$95,$EC,$64,$69,$65,$0D,$0D
db $48,$7B,$6C,$66,$74,$65,$2E
db $00
; @ENDSTRING@

.super_bracelet:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+108
; SETPOS $A 5
; "Dein Schwert und Deine\n\n" NO_NEWLINE
; "Rüstung halten doppelt\n\n" NO_NEWLINE
; "so viel aus." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+108
db $01,$0A,$05
db $44,$65,$69,$6E,$20,$A3,$EB,$44,$65,$69,$6E,$65,$0D,$0D
db $9D,$68,$61,$6C,$74,$65,$6E,$20,$64,$6F,$70,$70,$65,$6C,$74,$0D,$0D
db $E9,$76,$69,$65,$6C,$20,$61,$75,$73,$2E
db $00
; @ENDSTRING@

.medical_herb:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+110
; SETPOS $A 5
; "Deine HP werden wieder\n\n" NO_NEWLINE
; "aufgefüllt, wenn Deine\n\n" NO_NEWLINE
; "Lebensanzeige 0 zeigt." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+110
db $01,$0A,$05
db $44,$65,$69,$6E,$65,$20,$48,$50,$20,$F5,$77,$69,$65,$64,$65,$72,$0D,$0D
db $61,$75,$66,$67,$65,$66,$5B,$6C,$6C,$74,$2C,$20,$F3,$44,$65,$69,$6E,$65,$0D,$0D
db $4C,$65,$62,$65,$6E,$73,$61,$6E,$7A,$65,$69,$67,$65,$20,$30,$20,$7A,$65,$69,$67,$74,$2E
db $00
; @ENDSTRING@

.strange_bottle:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+112
; SETPOS $A 5
; "Du wirst keine Juwelen\n\n" NO_NEWLINE
; "verlieren, wenn Deine\n\n" NO_NEWLINE
; "Lebensanzeige 0 zeigt." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+112
db $01,$0A,$05
db $83,$FA,$D8,$4A,$75,$77,$65,$6C,$65,$6E,$0D,$0D
db $76,$65,$72,$6C,$69,$65,$72,$65,$6E,$2C,$20,$F3,$44,$65,$69,$6E,$65,$0D,$0D
db $4C,$65,$62,$65,$6E,$73,$61,$6E,$7A,$65,$69,$67,$65,$20,$30,$20,$7A,$65,$69,$67,$74,$2E
db $00
; @ENDSTRING@

.brown_stone:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+114
; LABEL .stone_text
; SETPOS $A 5
; "Die Welt des Bösen \n\n" NO_NEWLINE
; "wird erscheinen, wenn\n\n" NO_NEWLINE
; "Du 6 hiervon sammelst." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+114
.stone_text:
db $01,$0A,$05
db $87,$A9,$B8,$82,$0D,$0D
db $F7,$65,$72,$73,$63,$68,$65,$69,$6E,$65,$6E,$2C,$20,$77,$65,$6E,$6E,$0D,$0D
db $83,$36,$20,$68,$69,$65,$72,$76,$6F,$6E,$20,$73,$61,$6D,$6D,$65,$6C,$73,$74,$2E
db $00
; @ENDSTRING@

.green_stone:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+116
; -> .stone_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+116
db $13 : dw .stone_text
; @END@

.blue_stone:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+118
; -> .stone_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+118
db $13 : dw .stone_text
; @END@

.silver_stone:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+120
; -> .stone_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+120
db $13 : dw .stone_text
; @END@

.purple_stone:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+122
; -> .stone_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+122
db $13 : dw .stone_text
; @END@

.black_stone:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+124
; -> .stone_text
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+124
db $13 : dw .stone_text
; @END@

.magic_bell:
; @NEW_TEXT@
; SETPOS $8A 4
; LOOKUP AllItemsTable .SequenceTable+126
; SETPOS $A 5
; "Du kannst nun Magie\n\n" NO_NEWLINE
; "benutzen, ohne Deine\n\n" NO_NEWLINE
; "Juwelen aufzubrauchen." NO_NEWLINE
db $01,$8A,$04
db $05 : dw AllItemsTable,.SequenceTable+126
db $01,$0A,$05
db $83,$6B,$61,$6E,$6E,$73,$74,$20,$6E,$75,$6E,$20,$4D,$61,$67,$69,$65,$0D,$0D
db $62,$65,$6E,$75,$74,$7A,$65,$6E,$2C,$20,$6F,$68,$6E,$65,$20,$44,$65,$69,$6E,$65,$0D,$0D
db $90,$61,$75,$66,$7A,$75,$62,$72,$61,$75,$63,$68,$65,$6E,$2E
db $00
; @ENDSTRING@

.SequenceTable:
    dw 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16
    dw 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
    dw 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48
    dw 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64
