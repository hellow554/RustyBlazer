AllItemsTable:
    dw .not_equipped
.sword_names_table:
    dw .life_sword, .psycho_sword, .critical_sword, .lucky_blade
    dw .zantetsu_sword, .spirit_sword, .recovery_sword, .soul_blade
.armor_names_table:
    dw .iron_armor, .ice_armor, .bubble_armor, .magic_armor
    dw .mystic_armor, .light_armor, .elemental_armor, .soul_armor
.magic_names_table:
    dw .flame_ball, .light_arrow, .magic_flair, .rotator
    dw .spark_bomb, .flame_pillar, .tornado, .phoenix
.item_names_table:
    dw .goats_food, .harp_string, .pass, .dream_rod
    dw .leos_brush, .greenwood_leaves, .moles_ribbon, .big_pearl
    dw .mermaids_tears, .mushroom_shoes, .door_key, .thunder_ring
    dw .delicious_seeds, .plant_leaves, .mobile_key, .platinum_card
    dw .vip_card
    dw .emblem_a, .emblem_b, .emblem_c, .emblem_d
    dw .emblem_e, .emblem_f, .emblem_g, .emblem_h
    dw .hot_mirror, .hot_ball, .hot_stick
    dw .power_bracelet, .shield_bracelet, .super_bracelet
    dw .medical_herb, .strange_bottle
    dw .brown_stone, .green_stone, .blue_stone
    dw .silver_stone, .purple_stone, .black_stone
    dw .magic_bell

.not_equipped:
db $DF,$62,$65,$6E,$75,$74,$7A,$74,$00 ; @STRING@ "nicht benutzt"
.life_sword:
db $4C,$65,$62,$65,$6E,$73,$20,$53,$63,$68,$77,$65,$72,$74,$00 ; @STRING@ "Lebens Schwert"
.psycho_sword:
db $50,$73,$79,$63,$68,$6F,$20,$53,$63,$68,$77,$65,$72,$74,$00 ; @STRING@ "Psycho Schwert"
.critical_sword:
db $54,$6F,$64,$65,$73,$20,$53,$63,$68,$77,$65,$72,$74,$00 ; @STRING@ "Todes Schwert"
.lucky_blade:
db $47,$6C,$5B,$63,$6B,$73,$20,$4B,$6C,$69,$6E,$67,$65,$00 ; @STRING@ "Glücks Klinge"
.zantetsu_sword:
db $5A,$61,$6E,$74,$65,$74,$73,$75,$20,$4B,$6C,$69,$6E,$67,$65,$00 ; @STRING@ "Zantetsu Klinge"
.spirit_sword:
db $47,$65,$69,$73,$74,$65,$73,$20,$53,$63,$68,$77,$65,$72,$74,$00 ; @STRING@ "Geistes Schwert"
.recovery_sword:
db $48,$65,$69,$6C,$20,$53,$63,$68,$77,$65,$72,$74,$00 ; @STRING@ "Heil Schwert"
.soul_blade:
db $53,$65,$65,$6C,$65,$6E,$20,$4B,$6C,$69,$6E,$67,$65,$00 ; @STRING@ "Seelen Klinge"

.iron_armor:
db $45,$69,$73,$65,$6E,$20,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Eisen Rüstung"
.ice_armor:
db $45,$69,$73,$20,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Eis Rüstung"
.bubble_armor:
db $42,$6C,$61,$73,$65,$6E,$20,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Blasen Rüstung"
.magic_armor:
db $9A,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Magie Rüstung"
.mystic_armor:
db $4D,$79,$73,$74,$69,$6B,$20,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Mystik Rüstung"
.light_armor:
db $4C,$69,$63,$68,$74,$20,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Licht Rüstung"
.elemental_armor:
db $45,$6C,$65,$6D,$65,$6E,$74,$61,$72,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "ElementarRüstung"
.soul_armor:
db $53,$65,$65,$6C,$65,$6E,$20,$52,$5B,$73,$74,$75,$6E,$67,$00 ; @STRING@ "Seelen Rüstung"

.flame_ball:
db $46,$6C,$61,$6D,$6D,$65,$6E,$20,$42,$61,$6C,$6C,$00 ; @STRING@ "Flammen Ball"
.light_arrow:
db $4C,$69,$63,$68,$74,$20,$50,$66,$65,$69,$6C,$00 ; @STRING@ "Licht Pfeil"
.magic_flair:
db $4D,$61,$67,$69,$73,$63,$68,$65,$72,$20,$46,$6C,$61,$69,$72,$00 ; @STRING@ "Magischer Flair"
.rotator:
db $52,$6F,$74,$61,$74,$69,$6F,$6E,$00 ; @STRING@ "Rotation"
.spark_bomb:
db $46,$75,$6E,$6B,$65,$6E,$20,$42,$6F,$6D,$62,$65,$00 ; @STRING@ "Funken Bombe"
.flame_pillar:
db $46,$6C,$61,$6D,$6D,$65,$6E,$20,$53,$7B,$75,$6C,$65,$00 ; @STRING@ "Flammen Säule"
.tornado:
db $54,$6F,$72,$6E,$61,$64,$6F,$00 ; @STRING@ "Tornado"
.phoenix:
db $46,$65,$75,$65,$72,$20,$50,$68,$2A,$6E,$69,$78,$00 ; @STRING@ "Feuer Phönix"

.goats_food:
db $5A,$69,$65,$67,$65,$6E,$66,$75,$74,$74,$65,$72,$00 ; @STRING@ "Ziegenfutter"
.harp_string:
db $48,$61,$72,$66,$65,$6E,$20,$53,$61,$69,$74,$65,$00 ; @STRING@ "Harfen Saite"
.pass:
db $C0,$50,$61,$25,$00 ; @STRING@ "einen Paß"
.dream_rod:
db $54,$72,$61,$75,$6D,$73,$74,$61,$62,$00 ; @STRING@ "Traumstab"
.leos_brush:
db $4C,$65,$6F,$60,$73,$20,$50,$69,$6E,$73,$65,$6C,$00 ; @STRING@ "Leo`s Pinsel"
.greenwood_leaves:
db $42,$6C,$7B,$74,$74,$65,$72,$00 ; @STRING@ "Blätter"
.moles_ribbon:
db $4D,$61,$75,$6C,$77,$75,$72,$66,$73,$62,$61,$6E,$64,$00 ; @STRING@ "Maulwurfsband"
.big_pearl:
db $B5,$67,$72,$6F,$25,$65,$20,$50,$65,$72,$6C,$65,$00 ; @STRING@ "die große Perle"
.mermaids_tears:
db $4A,$75,$6E,$67,$66,$72,$61,$75,$74,$72,$7B,$6E,$65,$00 ; @STRING@ "Jungfrauträne"
.mushroom_shoes:
db $50,$69,$6C,$7A,$73,$63,$68,$75,$68,$65,$00 ; @STRING@ "Pilzschuhe"
.door_key:
db $C0,$53,$63,$68,$6C,$5B,$73,$73,$65,$6C,$00 ; @STRING@ "einen Schlüssel"
.thunder_ring:
db $44,$6F,$6E,$6E,$65,$72,$20,$52,$69,$6E,$67,$00 ; @STRING@ "Donner Ring"
.delicious_seeds:
db $4C,$65,$63,$6B,$65,$72,$65,$20,$53,$61,$6D,$65,$6E,$00 ; @STRING@ "Leckere Samen"
.plant_leaves:
db $42,$6C,$7B,$74,$74,$65,$72,$00 ; @STRING@ "Blätter"
.mobile_key:
db $65,$69,$6E,$65,$6E,$54,$5B,$72,$73,$63,$68,$6C,$5B,$25,$65,$6C,$00 ; @STRING@ "einenTürschlüßel"
.platinum_card:
db $4B,$61,$72,$74,$65,$20,$AD,$50,$6C,$61,$74,$69,$6E,$00 ; @STRING@ "Karte aus Platin"
.vip_card:
db $56,$49,$50,$20,$4B,$61,$72,$74,$65,$00 ; @STRING@ "VIP Karte"
.emblem_a:
db $45,$6D,$62,$6C,$65,$6D,$20,$41,$00 ; @STRING@ "Emblem A"
.emblem_b:
db $45,$6D,$62,$6C,$65,$6D,$20,$42,$00 ; @STRING@ "Emblem B"
.emblem_c:
db $45,$6D,$62,$6C,$65,$6D,$20,$43,$00 ; @STRING@ "Emblem C"
.emblem_d:
db $45,$6D,$62,$6C,$65,$6D,$20,$44,$00 ; @STRING@ "Emblem D"
.emblem_e:
db $45,$6D,$62,$6C,$65,$6D,$20,$45,$00 ; @STRING@ "Emblem E"
.emblem_f:
db $45,$6D,$62,$6C,$65,$6D,$20,$46,$00 ; @STRING@ "Emblem F"
.emblem_g:
db $45,$6D,$62,$6C,$65,$6D,$20,$47,$00 ; @STRING@ "Emblem G"
.emblem_h:
db $45,$6D,$62,$6C,$65,$6D,$20,$48,$00 ; @STRING@ "Emblem H"
.hot_mirror:
db $68,$65,$69,$25,$65,$6E,$20,$53,$70,$69,$65,$67,$65,$6C,$00 ; @STRING@ "heißen Spiegel"
.hot_ball:
db $68,$65,$69,$25,$65,$6E,$20,$42,$61,$6C,$6C,$00 ; @STRING@ "heißen Ball"
.hot_stick:
db $68,$65,$69,$25,$65,$6E,$20,$53,$74,$6F,$63,$6B,$00 ; @STRING@ "heißen Stock"
.power_bracelet:
db $4B,$72,$61,$66,$74,$20,$41,$72,$6D,$62,$61,$6E,$64,$00 ; @STRING@ "Kraft Armband"
.shield_bracelet:
db $53,$63,$68,$69,$6C,$64,$20,$41,$72,$6D,$62,$61,$6E,$64,$00 ; @STRING@ "Schild Armband"
.super_bracelet:
db $53,$75,$70,$65,$72,$20,$41,$72,$6D,$62,$61,$6E,$64,$00 ; @STRING@ "Super Armband"
.medical_herb:
db $48,$65,$69,$6C,$6B,$72,$7B,$75,$74,$65,$72,$00 ; @STRING@ "Heilkräuter"
.strange_bottle:
db $73,$65,$6C,$74,$73,$61,$6D,$65,$20,$46,$6C,$61,$73,$63,$68,$65,$00 ; @STRING@ "seltsame Flasche"
.brown_stone:
db $62,$72,$61,$75,$6E,$65,$6E,$20,$53,$74,$65,$69,$6E,$00 ; @STRING@ "braunen Stein"
.green_stone:
db $67,$72,$5B,$6E,$65,$6E,$20,$53,$74,$65,$69,$6E,$00 ; @STRING@ "grünen Stein"
.blue_stone:
db $62,$6C,$61,$75,$65,$6E,$20,$53,$74,$65,$69,$6E,$00 ; @STRING@ "blauen Stein"
.silver_stone:
db $73,$69,$6C,$62,$65,$72,$6E,$65,$6E,$20,$53,$74,$65,$69,$6E,$00 ; @STRING@ "silbernen Stein"
.purple_stone:
db $6C,$69,$6C,$61,$20,$53,$74,$65,$69,$6E,$00 ; @STRING@ "lila Stein"
.black_stone:
db $73,$63,$68,$77,$61,$72,$7A,$65,$6E,$20,$53,$74,$65,$69,$6E,$00 ; @STRING@ "schwarzen Stein"
.magic_bell:
db $6D,$61,$67,$69,$73,$63,$68,$65,$20,$47,$6C,$6F,$63,$6B,$65,$00 ; @STRING@ "magische Glocke"
