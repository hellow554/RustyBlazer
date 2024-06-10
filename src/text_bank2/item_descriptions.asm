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
db 'E','i','n',' ',$A3,'v','o','m',$0D,$0D
db 'M','e','i','s','t','e','r','.'
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
db 'L','ä','h','m','u','n','g',' ','f','ü','r',$0D,$0D
db 's','t','a','r','k','e',' ','M','o','n','s','t','e','r','.'
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
db 'B','e','s','i','e','g','t',' ',$B5,'M','o','n','s','t','e','r',$0D,$0D
db $DA,$C7,'S','c','h','l','a','g','.'
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
db 'G','r','ö','ß','e','r','e',' ','C','h','a','n','c','e','n',$0D,$0D
db 'J','W','L',' ',$FD,'f','i','n','d','e','n'
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
db 'S','c','h','l','ä','g','t',' ',$B5,$95,$0D,$0D
db $DA,'s','p','e','z','i','e','l','l','e','r',' ','R','ü','s','t','u','n','g'
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
db 'S','c','h','l','ä','g','t',' ',$B5,'<','G','e','i','s','t','e','r','>',$0D,$0D
db 'M','o','n','s','t','e','r','.'
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
db $87,'H','P',' ',$F5,$E3,'d','e','m',$0D,$0D
db 'S','i','e','g',' ',$F4,'a','u','f','g','e','f','ü','l','l','t'
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
db $8A,'s','t','ä','r','k','s','t','e',' ','S','c','h','w','e','r','t',',',$0D,$0D
db $B9,$83,'b','e','n','u','t','z','e','n',' ','k','a','n','n','s','t'
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
db 'D','e','i','n','e',' ','A','b','w','e','h','r','k','r','ä','f','t','e',$0D,$0D
db $F5,'s','t','ä','r','k','e','r','.'
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
db $83,'k','a','n','n','s','t',' ','o','h','n','e',' ','G','e','f','a','h','r',$0D,$0D
db 'F','e','u','e','r',' ','ü','b','e','r','q','u','e','r','e','n','.'
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
db 'E','r','m','ö','g','l','i','c','h','t',' ',$C3,'D','i','r',',',$0D,$0D
db 'u','n','t','e','r',' ','W','a','s','s','e','r',' ',$FD,'l','a','u','f','e','n'
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
db 'V','e','r','r','i','n','g','e','r','t',' ',$B5,'n','o','t','w','e','n','-',$0D,$0D
db 'd','i','g','e','n',' ',$90,$EC,'1','/','2','.'
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
db 'U','n','b','e','s','i','e','g','b','a','r',' ',$C9,'e','i','n','e','n',$0D,$0D
db 'l','ä','n','g','e','r','e','n',' ','Z','e','i','t','a','b','s','t','a','n','d','.'
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
db 'S','c','h','w','a','c','h','e',' ',$95,'s','i','n','d',$0D,$0D
db $D8,'G','e','f','a','h','r',' ','m','e','h','r','.'
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
db 'B','e','s','c','h','ü','t','z','t',' ',$85,'v','o','r',' ','d','e','n',$0D,$0D
db 'G','e','f','a','h','r','e','n',' ','z','o','n','e','n'
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
db 'E','r','m','ö','g','l','i','c','h','t',' ',$C3,'D','i','r',',','D','i','c','h',$0D,$0D
db $D5,'W','e','l','t','a','l','l',' ',$FD,'b','e','w','e','g','e','n','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','4',$0D,$0D
db 'S','c','h','i','e','ß','t',' ',$C0,'F','e','u','e','r','-',$0D,$0D
db 'b','a','l','l',' ',$D3,$BF,'R','i','c','h','t','u','n','g','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','8',$0D,$0D
db 'S','c','h','i','e','ß','t',' ',$C0,'L','i','c','h','t',' ',$0D,$0D
db 'P','f','e','i','l',' ',$D3,$BF,'R','i','c','h','t','u','n','g'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','8',$0D,$0D
db $87,'K','r','a','f','t',' ',$F7,'d','u','r','c','h',' ',$0D,$0D
db 'K','n','o','p','f','d','r','u','c','k',' ','g','e','s','a','m','m','e','l','t','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','1',$0D,$0D
db 'E','i','n',' ','R','i','n','g',' ',$AD,'L','i','c','h','t',' ',$0D,$0D
db $F7,$85,'u','m','k','r','e','i','s','e','n','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','8',$0D,$0D
db 'A','b','g','e','l','e','g','t','e',' ','M','i','n','e','n',' ','w','e','r','d','e','n',$0D,$0D
db 'e','x','p','l','o','d','i','e','r','e','n','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':','2','0',$0D,$0D
db 'S','ä','u','l','e','n',' ',$AD,'F','e','u','e','r',$0D,$0D
db 'e','r','h','e','b','e','n',' ',$E5,$EC,'D','i','c','h','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','8',$0D,$0D
db 'E','i','n',' ','m','a','g','i','s','c','h','e','r',' ','T','o','r','n','a','d','o',' ',$0D,$0D
db $F7,'e','r','s','c','h','e','i','n','e','n','.'
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
db $9B,'J','U','W','E','L','E','N',' ',':',' ','2',$0D,$0D
db $88,'P','h','ö','n','i','x',' ',$F7,$85,$0D,$0D
db 'b','e','g','l','e','i','t','e','n','.'
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
db 'Z','i','e','g','e','n','f','u','t','t','e','r',' ',$F1,'Z','u','b','e','-',$0D,$0D
db 'h','ö','r','l','a','d','e','n','.'
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
db 'S','a','i','t','e',' ',$C6,'H','a','r','f','e',' ','v','o','m',$0D,$0D
db 'S','ä','n','g','e','r','.'
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
db 'E','i','n',' ','P','a','s','s',' ',$EE,$B7,$0D,$0D
db 'K','i','n','d','e','r','n',' ',$AD,'G','r','a','s','s',$0D,$0D
db 'V','a','l','l','e','y','.'
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
db 'E','i','n',' ','s','e','l','t','s','a','m',' ','a','u','s','s','e','h','e','n','d','-',$0D,$0D
db $C8,'S','t','a','b',',',' ',$DA,$BB,$83,'i','n',$0D,$0D
db 'T','r','ä','u','m','e',' ','s','c','h','a','u','e','n',' ','k','a','n','n','s','t','.'
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
db $88,'P','i','n','s','e','l',' ',$B6,$FE,$0D,$0D
db 'M','a','l','e','n',' ',$EE,$3C,$A9,$B8,$0D,$0D
db 'B','ö','s','e','n',$3E,' ','v','e','r','w','e','n','d','e','t',' ','w','u','r','d','e'
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
db 'S','y','m','b','o','l',' ',$EE,'T','u','r','b','o','.','J','e','d','e','r',$0D,$0D
db $DA,'d','i','e','s','e','m',' ','S','y','m','b','o','l',' ','g','i','l','t',$0D,$0D
db $AF,'B','o','t','e',' ','T','u','r','b','o','`','s','.'
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
db 'E','i','n',' ','B','a','n','d',',',$B9,'b','e','s','o','n','d','e','r','s',$0D,$0D
db 'M','o','n','m','o',',',$BB,'M','a','u','l','w','u','r','f',',','g','e','-',$0D,$0D
db 'f','i','e','l',',',$AF,$E6,'l','e','b','t','e','.'
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
db 'E','i','n','e',' ','w','u','n','d','e','r','s','c','h','ö','n','e',' ',$0D,$0D
db 'P','e','r','l','e',',',' ',$B5,'a','m',' ','K','o','r','a','l','l','e','n',$0D,$0D
db 'R','i','f','f',' ','g','e','f','u','n','d','e','n',' ','w','i','r','d','.'
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
db 'V','e','r','w','a','n','d','e','l','t',' ','L','a','v','a',' ',$D3,$0D,$0D
db 'S','t','e','i','n','.'
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
db $88,'S','c','h','n','e','c','k','e','n','s','c','h','l','e','i','m',$0D,$0D
db 'e','r','m','ö','g','l','i','c','h','t',' ',$C3,'D','i','r',',',' ','a','u','f',$0D,$0D
db 'E','i','s',' ',$FD,'l','a','u','f','e','n','.'
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
db $A1,$FE,'L','u','f','t','-',$0D,$0D
db 's','c','h','i','f','f','.',' ',$8A,'Z','ü','n','d','-',$0D,$0D
db 's','c','h','l','o','ß',' ',$D2,'a','m',' ','S','c','h','i','f','f','.'
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
db 'B','l','i','t','z','s','ä','u','l','e',' ','b','e','r','ü','h','r','s','t',',',' ',$0D,$0D
db $F7,$C3,'b','l','i','t','z','e','n','.'
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
db 'L','e','c','k','e','r','e',' ','S','a','m','e','n','.',$0D,$0D
db 'T','a','u','s','c','h','e',' ',$9F,'a','m',$0D,$0D
db 'B','e','s','t','e','n',' ','e','i','n','.'
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
db 'S','e','t','z','t',' ',$C0,'G','e','r','u','c','h',$0D,$0D
db 'f','r','e','i',',',' ','w','e','l','c','h','e','r',' ','K','a','t','z','e','n',$0D,$0D
db 'a','n','z','i','e','h','t','.'
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
db 'D','i','e','s','e','r',' ',$A1,'w','i','r','d',$0D,$0D
db $B5,'T','ü','r',' ',$FE,'L','a','b','o','r',$0D,$0D
db 'ö','f','f','n','e','n','.'
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
db $83,'k','a','n','n','s','t',' ',$B7,'l','i','n','k','e','n',$0D,$0D
db 'T','u','r','m',' ',$B8,$99,$0D,$0D
db 'S','c','h','l','o','ß','e','s',' ','b','e','t','r','e','t','e','n','.'
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
db $83,'k','a','n','n','s','t',' ','ü','b','e','r','a','l','l',' ','h','i','n',$0D,$0D
db $D5,'S','c','h','l','o','ß','e',' ','M','a','g','r','i','d','d','s','`','.'
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
db $A8,$83,'8',' ','h','i','e','r','v','o','n',' ','g','e','-',$0D,$0D
db 's','a','m','m','e','l','t',' ','h','a','s','t',',',' ',$B4,'D','u',$0D,$0D
db $BE,'M','e','i','s','t','e','r',' ',$B6,'M','a','g','i','e','.'
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
db $A8,$83,$AE,'3',' ','S','y','m','b','o','l','e',$0D,$0D
db 'e','r','h','a','l','t','e','n',' ','h','a','s','t',',',' ','w','i','r','d',$0D,$0D
db $B6,'P','h','ö','n','i','x',' ','k','o','m','m','e','n','.'
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
db $8A,'B','e','n','u','t','z','e','n',' ','d','i','e','s','e','s',$0D,$0D
db 'G','e','g','e','n','s','t','a','n','d','s',' ','v','e','r','d','o','p','p','e','l','t',$0D,$0D
db 'D','e','i','n','e',' ','A','n','g','r','i','f','f','s','k','r','a','f','t','.'
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
db 'V','e','r','r','i','n','g','e','r','t',' ',$B7,'S','c','h','a','d','e','n',$0D,$0D
db $B6,$95,$EC,'d','i','e',$0D,$0D
db 'H','ä','l','f','t','e','.'
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
db 'D','e','i','n',' ',$A3,$EB,'D','e','i','n','e',$0D,$0D
db $9D,'h','a','l','t','e','n',' ','d','o','p','p','e','l','t',$0D,$0D
db $E9,'v','i','e','l',' ','a','u','s','.'
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
db 'D','e','i','n','e',' ','H','P',' ',$F5,'w','i','e','d','e','r',$0D,$0D
db 'a','u','f','g','e','f','ü','l','l','t',',',' ',$F3,'D','e','i','n','e',$0D,$0D
db 'L','e','b','e','n','s','a','n','z','e','i','g','e',' ','0',' ','z','e','i','g','t','.'
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
db $83,$FA,$D8,'J','u','w','e','l','e','n',$0D,$0D
db 'v','e','r','l','i','e','r','e','n',',',' ',$F3,'D','e','i','n','e',$0D,$0D
db 'L','e','b','e','n','s','a','n','z','e','i','g','e',' ','0',' ','z','e','i','g','t','.'
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
db $F7,'e','r','s','c','h','e','i','n','e','n',',',' ','w','e','n','n',$0D,$0D
db $83,'6',' ','h','i','e','r','v','o','n',' ','s','a','m','m','e','l','s','t','.'
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
db $83,'k','a','n','n','s','t',' ','n','u','n',' ','M','a','g','i','e',$0D,$0D
db 'b','e','n','u','t','z','e','n',',',' ','o','h','n','e',' ','D','e','i','n','e',$0D,$0D
db $90,'a','u','f','z','u','b','r','a','u','c','h','e','n','.'
db $00
; @ENDSTRING@

.SequenceTable:
    dw 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16
    dw 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
    dw 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48
    dw 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64
