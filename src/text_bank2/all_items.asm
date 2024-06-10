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
db $DF,'b','e','n','u','t','z','t',$00 ;"nicht benutzt"
.life_sword:
db 'L','e','b','e','n','s',' ','S','c','h','w','e','r','t',$00 ;"Lebens Schwert"
.psycho_sword:
db 'P','s','y','c','h','o',' ','S','c','h','w','e','r','t',$00 ;"Psycho Schwert"
.critical_sword:
db 'T','o','d','e','s',' ','S','c','h','w','e','r','t',$00 ;"Todes Schwert"
.lucky_blade:
db 'G','l','ü','c','k','s',' ','K','l','i','n','g','e',$00 ;"Glücks Klinge"
.zantetsu_sword:
db 'Z','a','n','t','e','t','s','u',' ','K','l','i','n','g','e',$00 ;"Zantetsu Klinge"
.spirit_sword:
db 'G','e','i','s','t','e','s',' ','S','c','h','w','e','r','t',$00 ;"Geistes Schwert"
.recovery_sword:
db 'H','e','i','l',' ','S','c','h','w','e','r','t',$00 ;"Heil Schwert"
.soul_blade:
db 'S','e','e','l','e','n',' ','K','l','i','n','g','e',$00 ;"Seelen Klinge"

.iron_armor:
db 'E','i','s','e','n',' ','R','ü','s','t','u','n','g',$00 ;"Eisen Rüstung"
.ice_armor:
db 'E','i','s',' ','R','ü','s','t','u','n','g',$00 ;"Eis Rüstung"
.bubble_armor:
db 'B','l','a','s','e','n',' ','R','ü','s','t','u','n','g',$00 ;"Blasen Rüstung"
.magic_armor:
db $9A,'R','ü','s','t','u','n','g',$00 ;"Magie Rüstung"
.mystic_armor:
db 'M','y','s','t','i','k',' ','R','ü','s','t','u','n','g',$00 ;"Mystik Rüstung"
.light_armor:
db 'L','i','c','h','t',' ','R','ü','s','t','u','n','g',$00 ;"Licht Rüstung"
.elemental_armor:
db 'E','l','e','m','e','n','t','a','r','R','ü','s','t','u','n','g',$00 ;"ElementarRüstung"
.soul_armor:
db 'S','e','e','l','e','n',' ','R','ü','s','t','u','n','g',$00 ;"Seelen Rüstung"

.flame_ball:
db 'F','l','a','m','m','e','n',' ','B','a','l','l',$00 ;"Flammen Ball"
.light_arrow:
db 'L','i','c','h','t',' ','P','f','e','i','l',$00 ;"Licht Pfeil"
.magic_flair:
db 'M','a','g','i','s','c','h','e','r',' ','F','l','a','i','r',$00 ;"Magischer Flair"
.rotator:
db 'R','o','t','a','t','i','o','n',$00 ;"Rotation"
.spark_bomb:
db 'F','u','n','k','e','n',' ','B','o','m','b','e',$00 ;"Funken Bombe"
.flame_pillar:
db 'F','l','a','m','m','e','n',' ','S','ä','u','l','e',$00 ;"Flammen Säule"
.tornado:
db 'T','o','r','n','a','d','o',$00 ;"Tornado"
.phoenix:
db 'F','e','u','e','r',' ','P','h','ö','n','i','x',$00 ;"Feuer Phönix"

.goats_food:
db 'Z','i','e','g','e','n','f','u','t','t','e','r',$00 ;"Ziegenfutter"
.harp_string:
db 'H','a','r','f','e','n',' ','S','a','i','t','e',$00 ;"Harfen Saite"
.pass:
db $C0,'P','a','ß',$00 ;"einen Paß"
.dream_rod:
db 'T','r','a','u','m','s','t','a','b',$00 ;"Traumstab"
.leos_brush:
db 'L','e','o','`','s',' ','P','i','n','s','e','l',$00 ;"Leo`s Pinsel"
.greenwood_leaves:
db 'B','l','ä','t','t','e','r',$00 ;"Blätter"
.moles_ribbon:
db 'M','a','u','l','w','u','r','f','s','b','a','n','d',$00 ;"Maulwurfsband"
.big_pearl:
db $B5,'g','r','o','ß','e',' ','P','e','r','l','e',$00 ;"die große Perle"
.mermaids_tears:
db 'J','u','n','g','f','r','a','u','t','r','ä','n','e',$00 ;"Jungfrauträne"
.mushroom_shoes:
db 'P','i','l','z','s','c','h','u','h','e',$00 ;"Pilzschuhe"
.door_key:
db $C0,'S','c','h','l','ü','s','s','e','l',$00 ;"einen Schlüssel"
.thunder_ring:
db 'D','o','n','n','e','r',' ','R','i','n','g',$00 ;"Donner Ring"
.delicious_seeds:
db 'L','e','c','k','e','r','e',' ','S','a','m','e','n',$00 ;"Leckere Samen"
.plant_leaves:
db 'B','l','ä','t','t','e','r',$00 ;"Blätter"
.mobile_key:
db 'e','i','n','e','n','T','ü','r','s','c','h','l','ü','ß','e','l',$00 ;"einenTürschlüßel"
.platinum_card:
db 'K','a','r','t','e',' ',$AD,'P','l','a','t','i','n',$00 ;"Karte aus Platin"
.vip_card:
db 'V','I','P',' ','K','a','r','t','e',$00 ;"VIP Karte"
.emblem_a:
db 'E','m','b','l','e','m',' ','A',$00 ;"Emblem A"
.emblem_b:
db 'E','m','b','l','e','m',' ','B',$00 ;"Emblem B"
.emblem_c:
db 'E','m','b','l','e','m',' ','C',$00 ;"Emblem C"
.emblem_d:
db 'E','m','b','l','e','m',' ','D',$00 ;"Emblem D"
.emblem_e:
db 'E','m','b','l','e','m',' ','E',$00 ;"Emblem E"
.emblem_f:
db 'E','m','b','l','e','m',' ','F',$00 ;"Emblem F"
.emblem_g:
db 'E','m','b','l','e','m',' ','G',$00 ;"Emblem G"
.emblem_h:
db 'E','m','b','l','e','m',' ','H',$00 ;"Emblem H"
.hot_mirror:
db 'h','e','i','ß','e','n',' ','S','p','i','e','g','e','l',$00 ;"heißen Spiegel"
.hot_ball:
db 'h','e','i','ß','e','n',' ','B','a','l','l',$00 ;"heißen Ball"
.hot_stick:
db 'h','e','i','ß','e','n',' ','S','t','o','c','k',$00 ;"heißen Stock"
.power_bracelet:
db 'K','r','a','f','t',' ','A','r','m','b','a','n','d',$00 ;"Kraft Armband"
.shield_bracelet:
db 'S','c','h','i','l','d',' ','A','r','m','b','a','n','d',$00 ;"Schild Armband"
.super_bracelet:
db 'S','u','p','e','r',' ','A','r','m','b','a','n','d',$00 ;"Super Armband"
.medical_herb:
db 'H','e','i','l','k','r','ä','u','t','e','r',$00 ;"Heilkräuter"
.strange_bottle:
db 's','e','l','t','s','a','m','e',' ','F','l','a','s','c','h','e',$00 ;"seltsame Flasche"
.brown_stone:
db 'b','r','a','u','n','e','n',' ','S','t','e','i','n',$00 ;"braunen Stein"
.green_stone:
db 'g','r','ü','n','e','n',' ','S','t','e','i','n',$00 ;"grünen Stein"
.blue_stone:
db 'b','l','a','u','e','n',' ','S','t','e','i','n',$00 ;"blauen Stein"
.silver_stone:
db 's','i','l','b','e','r','n','e','n',' ','S','t','e','i','n',$00 ;"silbernen Stein"
.purple_stone:
db 'l','i','l','a',' ','S','t','e','i','n',$00 ;"lila Stein"
.black_stone:
db 's','c','h','w','a','r','z','e','n',' ','S','t','e','i','n',$00 ;"schwarzen Stein"
.magic_bell:
db 'm','a','g','i','s','c','h','e',' ','G','l','o','c','k','e',$00 ;"magische Glocke"