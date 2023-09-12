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
db $20,$20,$54,$65,$6D,$70,$65,$6C,$20,$D3,$47,$72,$61,$73,$73,$20,$56,$61,$6C,$6C,$65,$79,$00 ; @STRING@ "  Tempel in Grass Valley"
.gv_highlands:
db $48,$6F,$63,$68,$6C,$61,$6E,$64,$20,$EE,$47,$72,$61,$73,$73,$20,$56,$61,$6C,$6C,$65,$79,$00 ; @STRING@ "Hochland von Grass Valley"
.gv_secret_passage:
db $20,$20,$47,$65,$68,$65,$69,$6D,$67,$61,$6E,$67,$20,$B6,$4B,$69,$6E,$64,$65,$72,$00 ; @STRING@ "  Geheimgang der Kinder"
.gv_treasure_room:
db $14,$07,$53,$63,$68,$61,$74,$7A,$6B,$61,$6D,$6D,$65,$72,$00 ; @STRING@ SPACE 7 "Schatzkammer"
.gv_chief_room:
db $20,$52,$61,$75,$6D,$20,$B8,$42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$73,$00 ; @STRING@ " Raum des Bürgermeisters"
.gv_ug_west:
db $20,$20,$55,$6E,$74,$65,$72,$69,$72,$64,$69,$73,$63,$68,$65,$73,$20,$53,$63,$68,$6C,$6F,$25,$00 ; @STRING@ "  Unterirdisches Schloß"
.gv_ug_east:
db $20,$20,$55,$6E,$74,$65,$72,$69,$72,$64,$69,$73,$63,$68,$65,$73,$20,$53,$63,$68,$6C,$6F,$25,$00 ; @STRING@ "  Unterirdisches Schloß"
.gv_leos_paintings1:
db $14,$07,$4C,$65,$6F,$60,$73,$20,$42,$69,$6C,$64,$65,$72,$00 ; @STRING@ SPACE 7 "Leo`s Bilder"
.gv_leos_paintings2:
db $14,$07,$4C,$65,$6F,$60,$73,$20,$42,$69,$6C,$64,$65,$72,$00 ; @STRING@ SPACE 7 "Leo`s Bilder"
.gv_leos_paintings3:
db $14,$07,$4C,$65,$6F,$60,$73,$20,$42,$69,$6C,$64,$65,$72,$00 ; @STRING@ SPACE 7 "Leo`s Bilder"
.gv_tulip_dream:
db $14,$05,$A5,$B6,$54,$75,$6C,$70,$65,$00 ; @STRING@ SPACE 5 "Traum der Tulpe"
.gv_leos_paintings4:
db $14,$07,$4C,$65,$6F,$60,$73,$20,$42,$69,$6C,$64,$65,$72,$00 ; @STRING@ SPACE 7 "Leo`s Bilder"
.gv_boss_room:
db $14,$04,$95,$B8,$42,$69,$6C,$64,$65,$73,$00 ; @STRING@ SPACE 4 "Monster des Bildes"
.gv_trial_room:
db $14,$07,$47,$65,$72,$69,$63,$68,$74,$73,$73,$61,$61,$6C,$00 ; @STRING@ SPACE 7 "Gerichtssaal"
.lisas_dream:
db $14,$07,$4C,$69,$73,$61,$60,$73,$20,$54,$72,$61,$75,$6D,$00 ; @STRING@ SPACE 7 "Lisa`s Traum"
.gv_zero0: db 0
.gv_zero1: db 0
.gv_zero2: db 0
.gv_zero3: db 0
.gv_zero4: db 0

; --- Act2 ---
.gw_shrine:
db $20,$20,$54,$65,$6D,$70,$65,$6C,$20,$EE,$47,$72,$65,$65,$6E,$20,$57,$6F,$6F,$64,$00 ; @STRING@ "  Tempel von Green Wood"
.gw_woods:
db $20,$20,$57,$7B,$6C,$64,$65,$72,$20,$EE,$47,$72,$65,$65,$6E,$20,$57,$6F,$6F,$64,$00 ; @STRING@ "  Wälder von Green Wood"
.gw_mole_hole:
db $20,$88,$42,$61,$75,$20,$C5,$4D,$61,$75,$6C,$77,$75,$72,$66,$73,$00 ; @STRING@ " Der Bau eines Maulwurfs"
.gw_squirrel_house:
db $20,$20,$48,$61,$75,$73,$20,$B8,$45,$69,$63,$68,$68,$2A,$72,$6E,$63,$68,$65,$6E,$73,$00 ; @STRING@ "  Haus des Eichhörnchens"
.gw_squirrel_exchange:
db $14,$03,$45,$69,$63,$68,$68,$2A,$72,$6E,$63,$68,$65,$6E,$2D,$48,$7B,$6E,$64,$6C,$65,$72,$00 ; @STRING@ SPACE 3 "Eichhörnchen-Händler"
.gw_lostside:
db $14,$09,$4C,$6F,$73,$74,$73,$69,$64,$65,$00 ; @STRING@ SPACE 9 "Lostside"
.gw_watershrine1:
db $14,$06,$57,$61,$73,$73,$65,$72,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 6 "Wasser Tempel"
.gw_watershrine2:
db $14,$06,$57,$61,$73,$73,$65,$72,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 6 "Wasser Tempel"
.gw_watershrine3:
db $14,$06,$57,$61,$73,$73,$65,$72,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 6 "Wasser Tempel"
.gw_fireshrine1:
db $14,$07,$46,$65,$75,$65,$72,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 7 "Feuer Tempel"
.gw_fireshrine2:
db $14,$07,$46,$65,$75,$65,$72,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 7 "Feuer Tempel"
.gw_fireshrine3:
db $14,$07,$46,$65,$75,$65,$72,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 7 "Feuer Tempel"
.gw_lightshrine1:
db $14,$07,$4C,$69,$63,$68,$74,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 7 "Licht Tempel"
.gw_lightshrine2:
db $14,$07,$4C,$69,$63,$68,$74,$20,$54,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 7 "Licht Tempel"
.gw_tomb:
db $20,$47,$72,$61,$62,$73,$74,$7B,$74,$74,$65,$20,$C6,$53,$74,$61,$74,$75,$65,$00 ; @STRING@ " Grabstätte einer Statue"
.gw_bird_dream:
db $14,$03,$88,$A5,$B8,$56,$6F,$67,$65,$6C,$73,$00 ; @STRING@ SPACE 3 "Der Traum des Vogels"
.gw_stump_dream:
db $14,$04,$A5,$B8,$53,$74,$75,$6D,$70,$66,$65,$73,$00 ; @STRING@ SPACE 4 "Traum des Stumpfes"
.gw_zero0: db 0
.gw_zero1: db 0
.gw_zero2: db 0

; --- Act3 ---
.se_shrine:
db $20,$88,$54,$65,$6D,$70,$65,$6C,$20,$EE,$53,$74,$2E,$20,$45,$6C,$6C,$65,$73,$00 ; @STRING@  " Der Tempel von St. Elles"
.se_seabed_sanctuary:
db $14,$03,$41,$75,$66,$20,$BB,$4D,$65,$65,$72,$65,$73,$62,$6F,$64,$65,$6E,$00 ; @STRING@ SPACE 3 "Auf dem Meeresboden"
.se_seabed_st_elles1:
db $20,$4D,$65,$65,$72,$65,$73,$62,$6F,$64,$65,$6E,$20,$EE,$53,$74,$2E,$45,$6C,$6C,$65,$73,$00 ; @STRING@ " Meeresboden von St.Elles"
.se_secret_cave1:
db $14,$04,$87,$67,$65,$68,$65,$69,$6D,$65,$20,$48,$2A,$68,$6C,$65,$00 ; @STRING@ SPACE 4 "Die geheime Höhle"
.se_secret_cave2:
db $14,$04,$87,$67,$65,$68,$65,$69,$6D,$65,$20,$48,$2A,$68,$6C,$65,$00 ; @STRING@ SPACE 4 "Die geheime Höhle"
.se_dolphin_dream:
db $14,$03,$A5,$C5,$44,$65,$6C,$70,$68,$69,$6E,$73,$00 ; @STRING@ SPACE 3 "Traum eines Delphins"
.se_southerta:
db $14,$08,$53,$6F,$75,$74,$68,$65,$72,$74,$61,$00 ; @STRING@ SPACE 8 "Southerta"
.se_shore_reef:
db $20,$20,$55,$66,$65,$72,$72,$69,$66,$66,$20,$EE,$52,$6F,$63,$6B,$62,$69,$72,$64,$00 ; @STRING@ "  Uferriff von Rockbird"
.se_durean:
db $14,$0A,$44,$75,$72,$65,$61,$6E,$00 ; @STRING@ SPACE 10 "Durean"
.se_blester:
db $14,$09,$42,$6C,$65,$73,$74,$65,$72,$00 ; @STRING@ SPACE 9 "Blester"
.se_ghost_ship:
db $14,$04,$45,$69,$6E,$20,$47,$65,$69,$73,$74,$65,$72,$73,$63,$68,$69,$66,$66,$00 ; @STRING@ SPACE 4 "Ein Geisterschiff"
.se_servas_dream:
db $14,$06,$53,$65,$72,$76,$61,$73,$60,$20,$54,$72,$61,$75,$6D,$00 ; @STRING@ SPACE 6 "Servas` Traum"
.se_seabed_st_elles2:
db $20,$4D,$65,$65,$72,$65,$73,$62,$6F,$64,$65,$6E,$20,$EE,$53,$74,$2E,$45,$6C,$6C,$65,$73,$00 ; @STRING@ " Meeresboden von St.Elles"
.se_zero0: db 0
.se_zero1: db 0
.se_zero2: db 0
.se_zero3: db 0
.se_zero4: db 0
.se_zero5: db 0
.se_zero6: db 0

; --- Act4 ---
.ms_shrine:
db $20,$20,$52,$75,$68,$65,$73,$74,$7B,$74,$74,$65,$20,$C9,$53,$65,$65,$6C,$65,$6E,$00 ; @STRING@ "  Ruhestätte für Seelen"
.ms_house:
db $14,$03,$53,$65,$65,$6C,$65,$20,$B6,$42,$65,$72,$67,$68,$5B,$74,$74,$65,$00 ; @STRING@ SPACE 3 "Seele der Berghütte"
.ms_north_slope:
db $14,$04,$4E,$6F,$72,$64,$68,$61,$6E,$67,$20,$B8,$42,$65,$72,$67,$65,$73,$2C,$20,$00 ; @STRING@ SPACE 4 "Nordhang des Berges, "
.ms_aurora:
db $14,$04,$41,$75,$72,$6F,$72,$61,$60,$73,$20,$56,$6F,$72,$73,$70,$72,$75,$6E,$67,$00 ; @STRING@ SPACE 4 "Aurora`s Vorsprung"
.ms_old_man_dream:
db $20,$A5,$C5,$61,$6C,$74,$65,$6E,$20,$4D,$61,$6E,$6E,$65,$73,$00 ; @STRING@ " Traum eines alten Mannes"
.ms_passage:
db $14,$04,$88,$57,$65,$67,$20,$E3,$4C,$75,$6E,$65,$00 ; @STRING@ SPACE 4 "Der Weg nach Lune"
.ms_underground_lake:
db $14,$04,$55,$6E,$74,$65,$72,$69,$72,$64,$69,$73,$63,$68,$65,$72,$20,$53,$65,$65,$00 ; @STRING@ SPACE 4 "Unterirdischer See"
.ms_mushroom_dream:
db $14,$04,$A5,$C5,$50,$69,$6C,$7A,$65,$73,$00 ; @STRING@ SPACE 4 "Traum eines Pilzes"
.ms_poseidon:
db $14,$09,$50,$6F,$73,$65,$69,$64,$6F,$6E,$00 ; @STRING@ SPACE 9 "Poseidon"
.ms_top_of_mountain:
db $20,$53,$70,$69,$74,$7A,$65,$20,$B8,$53,$63,$68,$6E,$65,$65,$62,$65,$72,$67,$65,$73,$00 ; @STRING@ " Spitze des Schneeberges"
.ms_ice_hill:
db $14,$07,$45,$69,$6E,$20,$45,$69,$73,$68,$5B,$67,$65,$6C,$00 ; @STRING@ SPACE 7 "Ein Eishügel"
.ms_ice_field:
db $14,$03,$45,$69,$73,$66,$65,$6C,$64,$20,$EE,$4C,$61,$79,$6E,$6F,$6C,$65,$00 ; @STRING@ SPACE 3 "Eisfeld von Laynole"
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
db $14,$05,$88,$4C,$61,$62,$6F,$72,$74,$65,$6D,$70,$65,$6C,$00 ; @STRING@ SPACE 5 "Der Labortempel"
.lab_laboratory1:
db $14,$07,$4C,$65,$6F,$60,$73,$20,$4C,$61,$62,$6F,$72,$00 ; @STRING@ SPACE 7 "Leo`s Labor"
.lab_laboratory2:
db $14,$07,$4C,$65,$6F,$60,$73,$20,$4C,$61,$62,$6F,$72,$00 ; @STRING@ SPACE 7 "Leo`s Labor"
.lab_attic:
db $14,$04,$41,$75,$66,$20,$BB,$44,$61,$63,$68,$62,$6F,$64,$65,$6E,$00 ; @STRING@ SPACE 4 "Auf dem Dachboden"
.lab_mice_nest:
db $14,$06,$45,$69,$6E,$20,$4D,$7B,$75,$73,$65,$6C,$6F,$63,$68,$00 ; @STRING@ SPACE 6 "Ein Mäuseloch"
.lab_cat_dream:
db $20,$20,$88,$A5,$C6,$4B,$61,$74,$7A,$65,$00 ; @STRING@ "  Der Traum einer Katze"
.lab_basement1:
db $14,$03,$49,$6D,$20,$4B,$65,$6C,$6C,$65,$72,$20,$B8,$4C,$61,$62,$6F,$72,$73,$00 ; @STRING@ SPACE 3 "Im Keller des Labors"
.lab_basement2:
db $14,$03,$49,$6D,$20,$4B,$65,$6C,$6C,$65,$72,$20,$B8,$4C,$61,$62,$6F,$72,$73,$00 ; @STRING@ SPACE 3 "Im Keller des Labors"
.lab_powerplant:
db $14,$08,$4B,$72,$61,$66,$74,$77,$65,$72,$6B,$00 ; @STRING@ SPACE 8 "Kraftwerk"
.lab_tin_doll:
db $14,$08,$5A,$69,$6E,$6E,$70,$75,$70,$70,$65,$00 ; @STRING@ SPACE 8 "Zinnpuppe"
.lab_dream1:
db $14,$07,$45,$69,$6E,$20,$A5,$31,$00 ; @STRING@ SPACE 7 "Ein Traum 1"
.lab_modeltown1:
db $14,$05,$4D,$6F,$64,$65,$6C,$6C,$20,$B6,$53,$74,$61,$64,$74,$00 ; @STRING@ SPACE 5 "Modell der Stadt"
.lab_modeltown2:
db $14,$05,$4D,$6F,$64,$65,$6C,$6C,$20,$B6,$53,$74,$61,$64,$74,$00 ; @STRING@ SPACE 5 "Modell der Stadt"
.lab_zero0: db 0
.lab_zero1: db 0
.lab_zero2: db 0
.lab_zero3: db 0
.lab_zero4: db 0
.lab_zero5: db 0
.lab_zero6: db 0

; --- Act6 ---
.mc_shrine:
db $14,$05,$4D,$61,$67,$72,$69,$64,$64,$60,$73,$20,$53,$63,$68,$6C,$6F,$25,$00 ; @STRING@ SPACE 5 "Magridd`s Schloß"
.mc_castle:
db $9E,$EE,$91,$4D,$61,$67,$72,$69,$64,$64,$00 ; @STRING@ "Schloß von König Magridd"
.mc_torture_chamber:
db $14,$05,$87,$46,$6F,$6C,$74,$65,$72,$6B,$61,$6D,$6D,$65,$72,$00 ; @STRING@ SPACE 5 "Die Folterkammer"
.mc_basement1:
db $20,$20,$49,$6D,$20,$4B,$65,$6C,$6C,$65,$72,$20,$B8,$53,$63,$68,$6C,$6F,$25,$65,$73,$00 ; @STRING@ "  Im Keller des Schloßes"
.mc_basement2:
db $20,$20,$49,$6D,$20,$4B,$65,$6C,$6C,$65,$72,$20,$B8,$53,$63,$68,$6C,$6F,$25,$65,$73,$00 ; @STRING@ "  Im Keller des Schloßes"
.mc_dream1:
db $14,$07,$45,$69,$6E,$20,$A5,$31,$00 ; @STRING@ SPACE 7 "Ein Traum 1"
.mc_left_tower1:
db $14,$06,$88,$6C,$69,$6E,$6B,$65,$20,$54,$75,$72,$6D,$00 ; @STRING@ SPACE 6 "Der linke Turm"
.mc_left_tower2:
db $14,$06,$88,$6C,$69,$6E,$6B,$65,$20,$54,$75,$72,$6D,$00 ; @STRING@ SPACE 6 "Der linke Turm"
.mc_prison:
db $14,$06,$45,$69,$6E,$20,$47,$65,$66,$7B,$6E,$67,$6E,$69,$73,$00 ; @STRING@ SPACE 6 "Ein Gefängnis"
.mc_right_tower1:
db $14,$05,$88,$72,$65,$63,$68,$74,$65,$20,$54,$75,$72,$6D,$00 ; @STRING@ SPACE 5 "Der rechte Turm"
.mc_right_tower2:
db $14,$05,$88,$72,$65,$63,$68,$74,$65,$20,$54,$75,$72,$6D,$00 ; @STRING@ SPACE 5 "Der rechte Turm"
.mc_right_tower3:
db $14,$05,$88,$72,$65,$63,$68,$74,$65,$20,$54,$75,$72,$6D,$00 ; @STRING@ SPACE 5 "Der rechte Turm"
.mc_corridor_to_dock:
db $20,$20,$45,$69,$6E,$20,$4B,$6F,$72,$72,$69,$64,$6F,$72,$20,$FE,$50,$69,$65,$72,$00 ; @STRING@ "  Ein Korridor zum Pier"
.mc_dock_ship:
db $20,$20,$50,$69,$65,$72,$20,$B8,$4C,$75,$66,$74,$73,$63,$68,$69,$66,$66,$65,$73,$00 ; @STRING@ "  Pier des Luftschiffes"
.mc_airship:
db $20,$20,$44,$65,$63,$6B,$20,$B8,$4C,$75,$66,$74,$73,$63,$68,$69,$66,$66,$65,$73,$00 ; @STRING@ "  Deck des Luftschiffes"
.mc_soldiers_dream:
db $14,$03,$A5,$C5,$53,$6F,$6C,$64,$61,$74,$65,$6E,$00 ; @STRING@ SPACE 3 "Traum eines Soldaten"
.mc_zero0: db 0
.mc_zero1: db 0
.mc_zero2: db 0
.mc_zero3: db 0

; --- Act7 ---
.woe_shrine:
db $20,$20,$54,$65,$6D,$70,$65,$6C,$20,$B6,$62,$2A,$73,$65,$6E,$20,$57,$65,$6C,$74,$00 ; @STRING@ "  Tempel der bösen Welt"
.woe_world1:
db $14,$06,$A9,$B8,$42,$2A,$73,$65,$6E,$00 ; @STRING@ SPACE 6 "Welt des Bösen"
.woe_world2:
db $14,$06,$A9,$B8,$42,$2A,$73,$65,$6E,$00 ; @STRING@ SPACE 6 "Welt des Bösen"
.woe_space:
db $20,$20,$56,$65,$72,$7A,$61,$75,$62,$65,$72,$74,$65,$72,$20,$57,$65,$6C,$74,$72,$61,$75,$6D,$00 ; @STRING@ "  Verzauberter Weltraum"
.woe_deathtoll1:
db $14,$03,$54,$65,$6D,$70,$65,$6C,$20,$EE,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$00 ; @STRING@ SPACE 3 "Tempel von Deathtoll"
.woe_deathtoll2:
db $20,$20,$53,$63,$68,$6C,$61,$63,$68,$74,$20,$DA,$44,$65,$61,$74,$68,$74,$6F,$6C,$6C,$00 ; @STRING@ "  Schlacht mit Deathtoll"
.woe_zero0: db 0
.woe_zero1: db 0
