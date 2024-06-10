SectionNamesTable:
; --- Act1 ---
    dw .gv_shrine, .gv_highlands, .gv_secret_passage
    dw .gv_treasure_room, .gv_chief_room
    dw .gv_ug_west, .gv_ug_east
    dw .gv_leos_paintings1, .gv_leos_paintings2, .gv_leos_paintings3
    dw .gv_tulip_dream, .gv_leos_paintings4, .gv_boss_room
    dw .gv_trial_room, .lisas_dream
    dw .gv_zero0, .gv_zero1, .gv_zero2, .gv_zero3, .gv_zero4
; --- Act2 ---
    dw .gw_shrine, .gw_woods, .gw_mole_hole
    dw .gw_squirrel_house, .gw_squirrel_exchange
    dw .gw_lostside
    dw .gw_watershrine1, .gw_watershrine2, .gw_watershrine3
    dw .gw_fireshrine1, .gw_fireshrine2, .gw_fireshrine3
    dw .gw_lightshrine1, .gw_lightshrine2, .gw_tomb
    dw .gw_bird_dream, .gw_stump_dream
    dw .gw_zero0, .gw_zero1, .gw_zero2
; --- Act3 ---
    dw .se_shrine, .se_seabed_sanctuary, .se_seabed_st_elles1
    dw .se_secret_cave1, .se_secret_cave2, .se_dolphin_dream
    dw .se_southerta, .se_shore_reef, .se_durean, .se_blester
    dw .se_ghost_ship, .se_servas_dream, .se_seabed_st_elles2
    dw .se_zero0, .se_zero1, .se_zero2, .se_zero3
    dw .se_zero4, .se_zero5, .se_zero6
; --- Act4 ---
    dw .ms_shrine, .ms_house, .ms_north_slope, .ms_aurora
    dw .ms_old_man_dream, .ms_passage, .ms_underground_lake
    dw .ms_mushroom_dream, .ms_poseidon, .ms_top_of_mountain
    dw .ms_ice_hill, .ms_ice_field
    dw .ms_zero0, .ms_zero1, .ms_zero2, .ms_zero3
    dw .ms_zero4, .ms_zero5, .ms_zero6, .ms_zero7
; --- Act5 ---
    dw .lab_shrine, .lab_laboratory1, .lab_laboratory2
    dw .lab_attic, .lab_mice_nest, .lab_cat_dream
    dw .lab_basement1, .lab_basement2, .lab_powerplant
    dw .lab_tin_doll, .lab_dream1, .lab_modeltown1
    dw .lab_modeltown2
    dw .lab_zero0, .lab_zero1, .lab_zero2, .lab_zero3
    dw .lab_zero4, .lab_zero5, .lab_zero6

; --- Act6 ---
    dw .mc_shrine, .mc_castle, .mc_torture_chamber
    dw .mc_basement1, .mc_basement2, .mc_dream1
    dw .mc_left_tower1, .mc_left_tower2, .mc_prison
    dw .mc_right_tower1, .mc_right_tower2, .mc_right_tower3
    dw .mc_corridor_to_dock, .mc_dock_ship, .mc_airship
    dw .mc_soldiers_dream
    dw .mc_zero0, .mc_zero1, .mc_zero2, .mc_zero3
; --- Act7 ---
    dw .woe_shrine, .woe_world1, .woe_world2
    dw .woe_space, .woe_deathtoll1, .woe_deathtoll2
    dw .woe_zero0, .woe_zero1

; --- Act1 ---
.gv_shrine
db ' ',' ','T','e','m','p','e','l',' ',$D3,'G','r','a','s','s',' ','V','a','l','l','e','y',$00 ; @STRING@ "  Tempel in Grass Valley"
.gv_highlands:
db 'H','o','c','h','l','a','n','d',' ',$EE,'G','r','a','s','s',' ','V','a','l','l','e','y',$00 ; @STRING@ "Hochland von Grass Valley"
.gv_secret_passage:
db ' ',' ','G','e','h','e','i','m','g','a','n','g',' ',$B6,'K','i','n','d','e','r',$00 ; @STRING@ "  Geheimgang der Kinder"
.gv_treasure_room:
db $14,$07,'S','c','h','a','t','z','k','a','m','m','e','r',$00 ; @STRING@ "       Schatzkammer"
.gv_chief_room:
db ' ','R','a','u','m',' ',$B8,'B','ü','r','g','e','r','m','e','i','s','t','e','r','s',$00 ; @STRING@ " Raum des Bürgermeisters"
.gv_ug_west:
db ' ',' ','U','n','t','e','r','i','r','d','i','s','c','h','e','s',' ','S','c','h','l','o','ß',$00 ; @STRING@ "  Unterirdisches Schloß"
.gv_ug_east:
db ' ',' ','U','n','t','e','r','i','r','d','i','s','c','h','e','s',' ','S','c','h','l','o','ß',$00 ; @STRING@ "  Unterirdisches Schloß"
.gv_leos_paintings1:
db $14,$07,'L','e','o','`','s',' ','B','i','l','d','e','r',$00 ; @STRING@ "       Leo`s Bilder"
.gv_leos_paintings2:
db $14,$07,'L','e','o','`','s',' ','B','i','l','d','e','r',$00 ; @STRING@ "       Leo`s Bilder"
.gv_leos_paintings3:
db $14,$07,'L','e','o','`','s',' ','B','i','l','d','e','r',$00 ; @STRING@ "       Leo`s Bilder"
.gv_tulip_dream:
db $14,$05,$A5,$B6,'T','u','l','p','e',$00 ; @STRING@ "     Traum der Tulpe"
.gv_leos_paintings4:
db $14,$07,'L','e','o','`','s',' ','B','i','l','d','e','r',$00 ; @STRING@ "       Leo`s Bilder"
.gv_boss_room:
db $14,$04,$95,$B8,'B','i','l','d','e','s',$00 ; @STRING@ "    Monster des Bildes"
.gv_trial_room:
db $14,$07,'G','e','r','i','c','h','t','s','s','a','a','l',$00 ; @STRING@ "       Gerichtssaal"
.lisas_dream:
db $14,$07,'L','i','s','a','`','s',' ','T','r','a','u','m',$00 ; @STRING@ "       Lisa`s Traum"
.gv_zero0: db 0
.gv_zero1: db 0
.gv_zero2: db 0
.gv_zero3: db 0
.gv_zero4: db 0

; --- Act2 ---
.gw_shrine:
db ' ',' ','T','e','m','p','e','l',' ',$EE,'G','r','e','e','n',' ','W','o','o','d',$00 ; @STRING@ "  Tempel von Green Wood"
.gw_woods:
db ' ',' ','W','ä','l','d','e','r',' ',$EE,'G','r','e','e','n',' ','W','o','o','d',$00 ; @STRING@ "  Wälder von Green Wood"
.gw_mole_hole:
db ' ',$88,'B','a','u',' ',$C5,'M','a','u','l','w','u','r','f','s',$00 ; @STRING@ " Der Bau eines Maulwurfs"
.gw_squirrel_house:
db ' ',' ','H','a','u','s',' ',$B8,'E','i','c','h','h','ö','r','n','c','h','e','n','s',$00 ; @STRING@ "  Haus des Eichhörnchens"
.gw_squirrel_exchange:
db $14,$03,'E','i','c','h','h','ö','r','n','c','h','e','n','-','H','ä','n','d','l','e','r',$00 ; @STRING@ "   Eichhörnchen-Händler"
.gw_lostside:
db $14,$09,'L','o','s','t','s','i','d','e',$00 ; @STRING@ "         Lostside"
.gw_watershrine1:
db $14,$06,'W','a','s','s','e','r',' ','T','e','m','p','e','l',$00 ; @STRING@ "      Wasser Tempel"
.gw_watershrine2:
db $14,$06,'W','a','s','s','e','r',' ','T','e','m','p','e','l',$00 ; @STRING@ "      Wasser Tempel"
.gw_watershrine3:
db $14,$06,'W','a','s','s','e','r',' ','T','e','m','p','e','l',$00 ; @STRING@ "      Wasser Tempel"
.gw_fireshrine1:
db $14,$07,'F','e','u','e','r',' ','T','e','m','p','e','l',$00 ; @STRING@ "       Feuer Tempel"
.gw_fireshrine2:
db $14,$07,'F','e','u','e','r',' ','T','e','m','p','e','l',$00 ; @STRING@ "       Feuer Tempel"
.gw_fireshrine3:
db $14,$07,'F','e','u','e','r',' ','T','e','m','p','e','l',$00 ; @STRING@ "       Feuer Tempel"
.gw_lightshrine1:
db $14,$07,'L','i','c','h','t',' ','T','e','m','p','e','l',$00 ; @STRING@ "       Licht Tempel"
.gw_lightshrine2:
db $14,$07,'L','i','c','h','t',' ','T','e','m','p','e','l',$00 ; @STRING@ "       Licht Tempel"
.gw_tomb:
db ' ','G','r','a','b','s','t','ä','t','t','e',' ',$C6,'S','t','a','t','u','e',$00 ; @STRING@ " Grabstätte einer Statue"
.gw_bird_dream:
db $14,$03,$88,$A5,$B8,'V','o','g','e','l','s',$00 ; @STRING@ "   Der Traum des Vogels"
.gw_stump_dream:
db $14,$04,$A5,$B8,'S','t','u','m','p','f','e','s',$00 ; @STRING@ "    Traum des Stumpfes"
.gw_zero0: db 0
.gw_zero1: db 0
.gw_zero2: db 0

; --- Act3 ---
.se_shrine:
db ' ',$88,'T','e','m','p','e','l',' ',$EE,'S','t','.',' ','E','l','l','e','s',$00 ; @STRING@  " Der Tempel von St. Elles"
.se_seabed_sanctuary:
db $14,$03,'A','u','f',' ',$BB,'M','e','e','r','e','s','b','o','d','e','n',$00 ; @STRING@ "   Auf dem Meeresboden"
.se_seabed_st_elles1:
db ' ','M','e','e','r','e','s','b','o','d','e','n',' ',$EE,'S','t','.','E','l','l','e','s',$00 ; @STRING@ " Meeresboden von St.Elles"
.se_secret_cave1:
db $14,$04,$87,'g','e','h','e','i','m','e',' ','H','ö','h','l','e',$00 ; @STRING@ "    Die geheime Höhle"
.se_secret_cave2:
db $14,$04,$87,'g','e','h','e','i','m','e',' ','H','ö','h','l','e',$00 ; @STRING@ "    Die geheime Höhle"
.se_dolphin_dream:
db $14,$03,$A5,$C5,'D','e','l','p','h','i','n','s',$00 ; @STRING@ "   Traum eines Delphins"
.se_southerta:
db $14,$08,'S','o','u','t','h','e','r','t','a',$00 ; @STRING@ "        Southerta"
.se_shore_reef:
db ' ',' ','U','f','e','r','r','i','f','f',' ',$EE,'R','o','c','k','b','i','r','d',$00 ; @STRING@ "  Uferriff von Rockbird"
.se_durean:
db $14,$0A,'D','u','r','e','a','n',$00 ; @STRING@ "          Durean"
.se_blester:
db $14,$09,'B','l','e','s','t','e','r',$00 ; @STRING@ "         Blester"
.se_ghost_ship:
db $14,$04,'E','i','n',' ','G','e','i','s','t','e','r','s','c','h','i','f','f',$00 ; @STRING@ "    Ein Geisterschiff"
.se_servas_dream:
db $14,$06,'S','e','r','v','a','s','`',' ','T','r','a','u','m',$00 ; @STRING@ "      Servas` Traum"
.se_seabed_st_elles2:
db ' ','M','e','e','r','e','s','b','o','d','e','n',' ',$EE,'S','t','.','E','l','l','e','s',$00 ; @STRING@ " Meeresboden von St.Elles"
.se_zero0: db 0
.se_zero1: db 0
.se_zero2: db 0
.se_zero3: db 0
.se_zero4: db 0
.se_zero5: db 0
.se_zero6: db 0

; --- Act4 ---
.ms_shrine:
db ' ',' ','R','u','h','e','s','t','ä','t','t','e',' ',$C9,'S','e','e','l','e','n',$00 ; @STRING@ "  Ruhestätte für Seelen"
.ms_house:
db $14,$03,'S','e','e','l','e',' ',$B6,'B','e','r','g','h','ü','t','t','e',$00 ; @STRING@ "   Seele der Berghütte"
.ms_north_slope:
db $14,$04,'N','o','r','d','h','a','n','g',' ',$B8,'B','e','r','g','e','s',',',' ',$00 ; @STRING@ "    Nordhang des Berges, "
.ms_aurora:
db $14,$04,'A','u','r','o','r','a','`','s',' ','V','o','r','s','p','r','u','n','g',$00 ; @STRING@ "    Aurora`s Vorsprung"
.ms_old_man_dream:
db ' ',$A5,$C5,'a','l','t','e','n',' ','M','a','n','n','e','s',$00 ; @STRING@ " Traum eines alten Mannes"
.ms_passage:
db $14,$04,$88,'W','e','g',' ',$E3,'L','u','n','e',$00 ; @STRING@ "    Der Weg nach Lune"
.ms_underground_lake:
db $14,$04,'U','n','t','e','r','i','r','d','i','s','c','h','e','r',' ','S','e','e',$00 ; @STRING@ "    Unterirdischer See"
.ms_mushroom_dream:
db $14,$04,$A5,$C5,'P','i','l','z','e','s',$00 ; @STRING@ "    Traum eines Pilzes"
.ms_poseidon:
db $14,$09,'P','o','s','e','i','d','o','n',$00 ; @STRING@ "         Poseidon"
.ms_top_of_mountain:
db ' ','S','p','i','t','z','e',' ',$B8,'S','c','h','n','e','e','b','e','r','g','e','s',$00 ; @STRING@ " Spitze des Schneeberges"
.ms_ice_hill:
db $14,$07,'E','i','n',' ','E','i','s','h','ü','g','e','l',$00 ; @STRING@ "       Ein Eishügel"
.ms_ice_field:
db $14,$03,'E','i','s','f','e','l','d',' ',$EE,'L','a','y','n','o','l','e',$00 ; @STRING@ "   Eisfeld von Laynole"
.ms_zero0: db 0
.ms_zero1: db 0
.ms_zero2: db 0
.ms_zero3: db 0
.ms_zero4: db 0
.ms_zero5: db 0
.ms_zero6: db 0
.ms_zero7: db 0

; --- Act5 ---
.lab_shrine:
db $14,$05,$88,'L','a','b','o','r','t','e','m','p','e','l',$00 ; @STRING@ "     Der Labortempel"
.lab_laboratory1:
db $14,$07,'L','e','o','`','s',' ','L','a','b','o','r',$00 ; @STRING@ "       Leo`s Labor"
.lab_laboratory2:
db $14,$07,'L','e','o','`','s',' ','L','a','b','o','r',$00 ; @STRING@ "       Leo`s Labor"
.lab_attic:
db $14,$04,'A','u','f',' ',$BB,'D','a','c','h','b','o','d','e','n',$00 ; @STRING@ "    Auf dem Dachboden"
.lab_mice_nest:
db $14,$06,'E','i','n',' ','M','ä','u','s','e','l','o','c','h',$00 ; @STRING@ "      Ein Mäuseloch"
.lab_cat_dream:
db ' ',' ',$88,$A5,$C6,'K','a','t','z','e',$00 ; @STRING@ "  Der Traum einer Katze"
.lab_basement1:
db $14,$03,'I','m',' ','K','e','l','l','e','r',' ',$B8,'L','a','b','o','r','s',$00 ; @STRING@ "   Im Keller des Labors"
.lab_basement2:
db $14,$03,'I','m',' ','K','e','l','l','e','r',' ',$B8,'L','a','b','o','r','s',$00 ; @STRING@ "   Im Keller des Labors"
.lab_powerplant:
db $14,$08,'K','r','a','f','t','w','e','r','k',$00 ; @STRING@ "        Kraftwerk"
.lab_tin_doll:
db $14,$08,'Z','i','n','n','p','u','p','p','e',$00 ; @STRING@ "        Zinnpuppe"
.lab_dream1:
db $14,$07,'E','i','n',' ',$A5,'1',$00 ; @STRING@ "       Ein Traum 1"
.lab_modeltown1:
db $14,$05,'M','o','d','e','l','l',' ',$B6,'S','t','a','d','t',$00 ; @STRING@ "     Modell der Stadt"
.lab_modeltown2:
db $14,$05,'M','o','d','e','l','l',' ',$B6,'S','t','a','d','t',$00 ; @STRING@ "     Modell der Stadt"
.lab_zero0: db 0
.lab_zero1: db 0
.lab_zero2: db 0
.lab_zero3: db 0
.lab_zero4: db 0
.lab_zero5: db 0
.lab_zero6: db 0

; --- Act6 ---
.mc_shrine:
db $14,$05,'M','a','g','r','i','d','d','`','s',' ','S','c','h','l','o','ß',$00 ; @STRING@ "     Magridd`s Schloß"
.mc_castle:
db $9E,$EE,$91,'M','a','g','r','i','d','d',$00 ; @STRING@ "Schloß von König Magridd"
.mc_torture_chamber:
db $14,$05,$87,'F','o','l','t','e','r','k','a','m','m','e','r',$00 ; @STRING@ "     Die Folterkammer"
.mc_basement1:
db ' ',' ','I','m',' ','K','e','l','l','e','r',' ',$B8,'S','c','h','l','o','ß','e','s',$00 ; @STRING@ "  Im Keller des Schloßes"
.mc_basement2:
db ' ',' ','I','m',' ','K','e','l','l','e','r',' ',$B8,'S','c','h','l','o','ß','e','s',$00 ; @STRING@ "  Im Keller des Schloßes"
.mc_dream1:
db $14,$07,'E','i','n',' ',$A5,'1',$00 ; @STRING@ "       Ein Traum 1"
.mc_left_tower1:
db $14,$06,$88,'l','i','n','k','e',' ','T','u','r','m',$00 ; @STRING@ "      Der linke Turm"
.mc_left_tower2:
db $14,$06,$88,'l','i','n','k','e',' ','T','u','r','m',$00 ; @STRING@ "      Der linke Turm"
.mc_prison:
db $14,$06,'E','i','n',' ','G','e','f','ä','n','g','n','i','s',$00 ; @STRING@ "      Ein Gefängnis"
.mc_right_tower1:
db $14,$05,$88,'r','e','c','h','t','e',' ','T','u','r','m',$00 ; @STRING@ "     Der rechte Turm"
.mc_right_tower2:
db $14,$05,$88,'r','e','c','h','t','e',' ','T','u','r','m',$00 ; @STRING@ "     Der rechte Turm"
.mc_right_tower3:
db $14,$05,$88,'r','e','c','h','t','e',' ','T','u','r','m',$00 ; @STRING@ "     Der rechte Turm"
.mc_corridor_to_dock:
db ' ',' ','E','i','n',' ','K','o','r','r','i','d','o','r',' ',$FE,'P','i','e','r',$00 ; @STRING@ "  Ein Korridor zum Pier"
.mc_dock_ship:
db ' ',' ','P','i','e','r',' ',$B8,'L','u','f','t','s','c','h','i','f','f','e','s',$00 ; @STRING@ "  Pier des Luftschiffes"
.mc_airship:
db ' ',' ','D','e','c','k',' ',$B8,'L','u','f','t','s','c','h','i','f','f','e','s',$00 ; @STRING@ "  Deck des Luftschiffes"
.mc_soldiers_dream:
db $14,$03,$A5,$C5,'S','o','l','d','a','t','e','n',$00 ; @STRING@ "   Traum eines Soldaten"
.mc_zero0: db 0
.mc_zero1: db 0
.mc_zero2: db 0
.mc_zero3: db 0

; --- Act7 ---
.woe_shrine:
db ' ',' ','T','e','m','p','e','l',' ',$B6,'b','ö','s','e','n',' ','W','e','l','t',$00 ; @STRING@ "  Tempel der bösen Welt"
.woe_world1:
db $14,$06,$A9,$B8,'B','ö','s','e','n',$00 ; @STRING@ "      Welt des Bösen"
.woe_world2:
db $14,$06,$A9,$B8,'B','ö','s','e','n',$00 ; @STRING@ "      Welt des Bösen"
.woe_space:
db ' ',' ','V','e','r','z','a','u','b','e','r','t','e','r',' ','W','e','l','t','r','a','u','m',$00 ; @STRING@ "  Verzauberter Weltraum"
.woe_deathtoll1:
db $14,$03,'T','e','m','p','e','l',' ',$EE,'D','e','a','t','h','t','o','l','l',$00 ; @STRING@ "   Tempel von Deathtoll"
.woe_deathtoll2:
db ' ',' ','S','c','h','l','a','c','h','t',' ',$DA,'D','e','a','t','h','t','o','l','l',$00 ; @STRING@ "  Schlacht mit Deathtoll"
.woe_zero0: db 0
.woe_zero1: db 0
