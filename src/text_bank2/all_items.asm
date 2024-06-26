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
db $DF,'b','e','n','u','t','z','t',$00 ; @STRING@ "nicht benutzt"
.life_sword:
db 'L','e','b','e','n','s',' ','S','c','h','w','e','r','t',$00 ; @STRING@ "Lebens Schwert"
.psycho_sword:
db 'P','s','y','c','h','o',' ','S','c','h','w','e','r','t',$00 ; @STRING@ "Psycho Schwert"
.critical_sword:
db 'T','o','d','e','s',' ','S','c','h','w','e','r','t',$00 ; @STRING@ "Todes Schwert"
.lucky_blade:
db 'G','l','ü','c','k','s',' ','K','l','i','n','g','e',$00 ; @STRING@ "Glücks Klinge"
.zantetsu_sword:
db 'Z','a','n','t','e','t','s','u',' ','K','l','i','n','g','e',$00 ; @STRING@ "Zantetsu Klinge"
.spirit_sword:
db 'G','e','i','s','t','e','s',' ','S','c','h','w','e','r','t',$00 ; @STRING@ "Geistes Schwert"
.recovery_sword:
db 'H','e','i','l',' ','S','c','h','w','e','r','t',$00 ; @STRING@ "Heil Schwert"
.soul_blade:
db 'S','e','e','l','e','n',' ','K','l','i','n','g','e',$00 ; @STRING@ "Seelen Klinge"

.iron_armor:
db 'E','i','s','e','n',' ','R','ü','s','t','u','n','g',$00 ; @STRING@ "Eisen Rüstung"
.ice_armor:
db 'E','i','s',' ','R','ü','s','t','u','n','g',$00 ; @STRING@ "Eis Rüstung"
.bubble_armor:
db 'B','l','a','s','e','n',' ','R','ü','s','t','u','n','g',$00 ; @STRING@ "Blasen Rüstung"
.magic_armor:
db $9A,'R','ü','s','t','u','n','g',$00 ; @STRING@ "Magie Rüstung"
.mystic_armor:
db 'M','y','s','t','i','k',' ','R','ü','s','t','u','n','g',$00 ; @STRING@ "Mystik Rüstung"
.light_armor:
db 'L','i','c','h','t',' ','R','ü','s','t','u','n','g',$00 ; @STRING@ "Licht Rüstung"
.elemental_armor:
db 'E','l','e','m','e','n','t','a','r','R','ü','s','t','u','n','g',$00 ; @STRING@ "ElementarRüstung"
.soul_armor:
db 'S','e','e','l','e','n',' ','R','ü','s','t','u','n','g',$00 ; @STRING@ "Seelen Rüstung"

.flame_ball:
db 'F','l','a','m','m','e','n',' ','B','a','l','l',$00 ; @STRING@ "Flammen Ball"
.light_arrow:
db 'L','i','c','h','t',' ','P','f','e','i','l',$00 ; @STRING@ "Licht Pfeil"
.magic_flair:
db 'M','a','g','i','s','c','h','e','r',' ','F','l','a','i','r',$00 ; @STRING@ "Magischer Flair"
.rotator:
db 'R','o','t','a','t','i','o','n',$00 ; @STRING@ "Rotation"
.spark_bomb:
db 'F','u','n','k','e','n',' ','B','o','m','b','e',$00 ; @STRING@ "Funken Bombe"
.flame_pillar:
db 'F','l','a','m','m','e','n',' ','S','ä','u','l','e',$00 ; @STRING@ "Flammen Säule"
.tornado:
db 'T','o','r','n','a','d','o',$00 ; @STRING@ "Tornado"
.phoenix:
db 'F','e','u','e','r',' ','P','h','ö','n','i','x',$00 ; @STRING@ "Feuer Phönix"

.goats_food:
db 'Z','i','e','g','e','n','f','u','t','t','e','r',$00 ; @STRING@ "Ziegenfutter"
.harp_string:
db 'H','a','r','f','e','n',' ','S','a','i','t','e',$00 ; @STRING@ "Harfen Saite"
.pass:
db $C0,'P','a','ß',$00 ; @STRING@ "einen Paß"
.dream_rod:
db 'T','r','a','u','m','s','t','a','b',$00 ; @STRING@ "Traumstab"
.leos_brush:
db 'L','e','o','`','s',' ','P','i','n','s','e','l',$00 ; @STRING@ "Leo`s Pinsel"
.greenwood_leaves:
db 'B','l','ä','t','t','e','r',$00 ; @STRING@ "Blätter"
.moles_ribbon:
db 'M','a','u','l','w','u','r','f','s','b','a','n','d',$00 ; @STRING@ "Maulwurfsband"
.big_pearl:
db $B5,'g','r','o','ß','e',' ','P','e','r','l','e',$00 ; @STRING@ "die große Perle"
.mermaids_tears:
db 'J','u','n','g','f','r','a','u','t','r','ä','n','e',$00 ; @STRING@ "Jungfrauträne"
.mushroom_shoes:
db 'P','i','l','z','s','c','h','u','h','e',$00 ; @STRING@ "Pilzschuhe"
.door_key:
db $C0,'S','c','h','l','ü','s','s','e','l',$00 ; @STRING@ "einen Schlüssel"
.thunder_ring:
db 'D','o','n','n','e','r',' ','R','i','n','g',$00 ; @STRING@ "Donner Ring"
.delicious_seeds:
db 'L','e','c','k','e','r','e',' ','S','a','m','e','n',$00 ; @STRING@ "Leckere Samen"
.plant_leaves:
db 'B','l','ä','t','t','e','r',$00 ; @STRING@ "Blätter"
.mobile_key:
db 'e','i','n','e','n','T','ü','r','s','c','h','l','ü','ß','e','l',$00 ; @STRING@ "einenTürschlüßel"
.platinum_card:
db 'K','a','r','t','e',' ',$AD,'P','l','a','t','i','n',$00 ; @STRING@ "Karte aus Platin"
.vip_card:
db 'V','I','P',' ','K','a','r','t','e',$00 ; @STRING@ "VIP Karte"
.emblem_a:
db 'E','m','b','l','e','m',' ','A',$00 ; @STRING@ "Emblem A"
.emblem_b:
db 'E','m','b','l','e','m',' ','B',$00 ; @STRING@ "Emblem B"
.emblem_c:
db 'E','m','b','l','e','m',' ','C',$00 ; @STRING@ "Emblem C"
.emblem_d:
db 'E','m','b','l','e','m',' ','D',$00 ; @STRING@ "Emblem D"
.emblem_e:
db 'E','m','b','l','e','m',' ','E',$00 ; @STRING@ "Emblem E"
.emblem_f:
db 'E','m','b','l','e','m',' ','F',$00 ; @STRING@ "Emblem F"
.emblem_g:
db 'E','m','b','l','e','m',' ','G',$00 ; @STRING@ "Emblem G"
.emblem_h:
db 'E','m','b','l','e','m',' ','H',$00 ; @STRING@ "Emblem H"
.hot_mirror:
db 'h','e','i','ß','e','n',' ','S','p','i','e','g','e','l',$00 ; @STRING@ "heißen Spiegel"
.hot_ball:
db 'h','e','i','ß','e','n',' ','B','a','l','l',$00 ; @STRING@ "heißen Ball"
.hot_stick:
db 'h','e','i','ß','e','n',' ','S','t','o','c','k',$00 ; @STRING@ "heißen Stock"
.power_bracelet:
db 'K','r','a','f','t',' ','A','r','m','b','a','n','d',$00 ; @STRING@ "Kraft Armband"
.shield_bracelet:
db 'S','c','h','i','l','d',' ','A','r','m','b','a','n','d',$00 ; @STRING@ "Schild Armband"
.super_bracelet:
db 'S','u','p','e','r',' ','A','r','m','b','a','n','d',$00 ; @STRING@ "Super Armband"
.medical_herb:
db 'H','e','i','l','k','r','ä','u','t','e','r',$00 ; @STRING@ "Heilkräuter"
.strange_bottle:
db 's','e','l','t','s','a','m','e',' ','F','l','a','s','c','h','e',$00 ; @STRING@ "seltsame Flasche"
.brown_stone:
db 'b','r','a','u','n','e','n',' ','S','t','e','i','n',$00 ; @STRING@ "braunen Stein"
.green_stone:
db 'g','r','ü','n','e','n',' ','S','t','e','i','n',$00 ; @STRING@ "grünen Stein"
.blue_stone:
db 'b','l','a','u','e','n',' ','S','t','e','i','n',$00 ; @STRING@ "blauen Stein"
.silver_stone:
db 's','i','l','b','e','r','n','e','n',' ','S','t','e','i','n',$00 ; @STRING@ "silbernen Stein"
.purple_stone:
db 'l','i','l','a',' ','S','t','e','i','n',$00 ; @STRING@ "lila Stein"
.black_stone:
db 's','c','h','w','a','r','z','e','n',' ','S','t','e','i','n',$00 ; @STRING@ "schwarzen Stein"
.magic_bell:
db 'm','a','g','i','s','c','h','e',' ','G','l','o','c','k','e',$00 ; @STRING@ "magische Glocke"
