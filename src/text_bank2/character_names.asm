CharacterNamesTable:
    dw .old_man, .old_woman, .a_boy, .lisa
    dw .chief, .bridge_guard, .architect, .son_of_shop_owner
    dw .shop_owner, .goat, .lonely_goat, .tulip
    dw .ivy, .water_mill_keeper, .squirrel, .deer
    dw .crocodil, .turbo, .guardian, .mole
    dw .none, .chief2, .bird, .dog
    dw .mermaid, .dolphin, .angelfish, .queen
    dw .lue, .mermaid_statue, .boy, .girl
    dw .grandfather, .grandmother, .snail, .king
    dw .mushroom, .nome, .stairs, .great_door
    dw .cat, .plant, .mouse, .drawers
    dw .doll, .marie, .town_model, .soldier
    dw .maid, .singer, .magridd, .leo, .queen2

.old_man:
db $C0,'a','l','t','e','n',' ','M','a','n','n',$00 ; @STRING@ "einen alten Mann"
.old_woman:
db $BF,'a','l','t','e',' ','F','r','a','u',$00 ; @STRING@ "eine alte Frau"
.a_boy:
db $C0,'J','u','n','g','e','n',$00 ; @STRING@ "einen Jungen"
.lisa
db 'L','i','s','a',$00 ; @STRING@ "Lisa"
.chief:
db $B7,'B','ü','r','g','e','r','m','e','i','s','t','e','r',$00 ; @STRING@ "den Bürgermeister"
.bridge_guard:
db $B7,'B','r','ü','c','k','e','n','w','ä','c','h','t','e','r',$00 ; @STRING@ "den Brückenwächter"
.architect:
db $C0,'A','r','c','h','i','t','e','k','t',$00 ; @STRING@ "einen Architekt"
.son_of_shop_owner:
db 'K','i','n','d',' ',$B8,'B','e','s','i','t','z','e','r','s',$00 ; @STRING@ "Kind des Besitzers"
.shop_owner:
db $B5,'L','a','d','e','n','b','e','s','i','t','z','e','r','i','n',$00 ; @STRING@ "die Ladenbesitzerin"
.goat:
db $BF,'Z','i','e','g','e',$00 ; @STRING@ "eine Ziege"
.lonely_goat:
db $BF,'e','i','n','s','a','m','e',' ','Z','i','e','g','e',$00 ; @STRING@ "eine einsame Ziege"
.tulip:
db $BF,'T','u','l','p','e',$00 ; @STRING@ "eine Tulpe"
.ivy:
db 'E','f','e','u',$00 ; @STRING@ "Efeu"
.water_mill_keeper:
db 'W','a','s','s','e','r','m','ü','h','l','e','n',' ','W','ä','c','h','t','e','r',$00 ; @STRING@ "Wassermühlen Wächter"
.squirrel:
db $BE,'E','i','c','h','h','ö','r','n','c','h','e','n',$00 ; @STRING@ "ein Eichhörnchen"
.deer:
db $BE,'R','e','h',$00 ; @STRING@ "ein Reh"
.crocodil:
db $BE,'K','r','o','k','o','d','i','l',$00 ; @STRING@ "ein Krokodil"
.turbo:
db ' ','<','T','u','r','b','o','>',',',' ',$B7,'H','u','n','d',$00 ; @STRING@ " <Turbo>, den Hund"
.guardian:
db 'W','o','o','d','`','s',' ','W','ä','c','h','t','e','r',$00 ; @STRING@ "Wood`s Wächter"
.mole:
db $C0,'M','a','u','l','w','u','r','f',$00 ; @STRING@ "einen Maulwurf"
.none:
db 'k','e','i','n','e',$00 ; @STRING@ "keine"
.chief2:
db $B7,'B','ü','r','g','e','r','m','e','i','s','t','e','r',$00 ; @STRING@ "den Bürgermeister"
.bird:
db $C0,'V','o','g','e','l',$00 ; @STRING@ "einen Vogel"
.dog:
db $C0,'H','u','n','d',$00 ; @STRING@ "einen Hund"
.mermaid:
db $BF,'M','e','e','r','j','u','n','g','f','r','a','u',$00 ; @STRING@ "eine Meerjungfrau"
.dolphin:
db $C0,'D','e','l','p','h','i','n',$00 ; @STRING@ "einen Delphin"
.angelfish:
db $C0,'E','n','g','e','l','f','i','s','c','h',$00 ; @STRING@ "einen Engelfisch"
.queen:
db $B5,'K','ö','n','i','g','i','n',$00 ; @STRING@ "die Königin"
.lue:
db '<','L','u','e','>',',',' ',$B7,'D','e','l','p','h','i','n',$00 ; @STRING@ "<Lue>, den Delphin"
.mermaid_statue:
db 'M','e','e','r','j','u','n','g','f','r','a','u','s','t','a','t','u','e',$00 ; @STRING@ "Meerjungfraustatue"
.boy:
db $C0,'J','u','n','g','e','n',$00 ; @STRING@ "einen Jungen"
.girl:
db $BE,'M','ä','d','c','h','e','n',$00 ; @STRING@ "ein Mädchen"
.grandfather:
db $C0,'G','r','o','ß','v','a','t','e','r',$00 ; @STRING@ "einen Großvater"
.grandmother:
db $BF,'G','r','o','ß','m','u','t','t','e','r',$00 ; @STRING@ "eine Großmutter"
.snail:
db $BF,'S','c','h','n','e','c','k','e',$00 ; @STRING@ "eine Schnecke"
.king:
db $B7,'K','ö','n','i','g',$00 ; @STRING@ "den König"
.mushroom:
db $C0,'P','i','l','z',$00 ; @STRING@ "einen Pilz"
.nome:
db '<','N','o','m','e','>',',',' ',$B5,'S','c','h','n','e','c','k','e',$00 ; @STRING@ "<Nome>, die Schnecke"
.stairs:
db $BF,'T','r','e','p','p','e',$00 ; @STRING@ "eine Treppe"
.great_door:
db $BF,'g','r','o','ß','e',' ','T','ü','r',$00 ; @STRING@ "eine große Tür"
.cat:
db $BF,'K','a','t','z','e',$00 ; @STRING@ "eine Katze"
.plant:
db $BF,'P','f','l','a','n','z','e',$00 ; @STRING@ "eine Pflanze"
.mouse:
db $BF,'M','a','u','s',$00 ; @STRING@ "eine Maus"
.drawers:
db 'K','i','s','t','e',' ',$DA,'S','c','h','u','b','l','a','d','e','n',$00 ; @STRING@ "Kiste mit Schubladen"
.doll:
db $BF,'P','u','p','p','e',$00 ; @STRING@ "eine Puppe"
.marie:
db '<','M','a','r','i','e','>',',',' ',$B5,'P','u','p','p','e',$00 ; @STRING@ "<Marie>, die Puppe"
.town_model:
db $BE,'M','o','d','e','l',' ',$B6,'S','t','a','d','t',$00 ; @STRING@ "ein Model der Stadt"
.soldier:
db $C0,'S','o','l','d','a','t',$00 ; @STRING@ "einen Soldat"
.maid:
db $BF,'J','u','n','g','f','r','a','u',$00 ; @STRING@ "eine Jungfrau"
.singer:
db $C0,'S','ä','n','g','e','r',$00 ; @STRING@ "einen Sänger"
.magridd:
db $91,'M','a','g','r','i','d','d',$00 ; @STRING@ "König Magridd"
.leo:
db 'D','r','.','L','e','o',$00 ; @STRING@ "Dr.Leo"
.queen2:
db $B5,'K','ö','n','i','g','i','n',$00 ; @STRING@ "die Königin"
