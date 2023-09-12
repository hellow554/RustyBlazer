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
db $C0,$61,$6C,$74,$65,$6E,$20,$4D,$61,$6E,$6E,$00 ; @STRING@ "einen alten Mann"
.old_woman:
db $BF,$61,$6C,$74,$65,$20,$46,$72,$61,$75,$00 ; @STRING@ "eine alte Frau"
.a_boy:
db $C0,$4A,$75,$6E,$67,$65,$6E,$00 ; @STRING@ "einen Jungen"
.lisa
db $4C,$69,$73,$61,$00 ; @STRING@ "Lisa"
.chief:
db $B7,$42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$00 ; @STRING@ "den Bürgermeister"
.bridge_guard:
db $B7,$42,$72,$5B,$63,$6B,$65,$6E,$77,$7B,$63,$68,$74,$65,$72,$00 ; @STRING@ "den Brückenwächter"
.architect:
db $C0,$41,$72,$63,$68,$69,$74,$65,$6B,$74,$00 ; @STRING@ "einen Architekt"
.son_of_shop_owner:
db $4B,$69,$6E,$64,$20,$B8,$42,$65,$73,$69,$74,$7A,$65,$72,$73,$00 ; @STRING@ "Kind des Besitzers"
.shop_owner:
db $B5,$4C,$61,$64,$65,$6E,$62,$65,$73,$69,$74,$7A,$65,$72,$69,$6E,$00 ; @STRING@ "die Ladenbesitzerin"
.goat:
db $BF,$5A,$69,$65,$67,$65,$00 ; @STRING@ "eine Ziege"
.lonely_goat:
db $BF,$65,$69,$6E,$73,$61,$6D,$65,$20,$5A,$69,$65,$67,$65,$00 ; @STRING@ "eine einsame Ziege"
.tulip:
db $BF,$54,$75,$6C,$70,$65,$00 ; @STRING@ "eine Tulpe"
.ivy:
db $45,$66,$65,$75,$00 ; @STRING@ "Efeu"
.water_mill_keeper:
db $57,$61,$73,$73,$65,$72,$6D,$5B,$68,$6C,$65,$6E,$20,$57,$7B,$63,$68,$74,$65,$72,$00 ; @STRING@ "Wassermühlen Wächter"
.squirrel:
db $BE,$45,$69,$63,$68,$68,$2A,$72,$6E,$63,$68,$65,$6E,$00 ; @STRING@ "ein Eichhörnchen"
.deer:
db $BE,$52,$65,$68,$00 ; @STRING@ "ein Reh"
.crocodil:
db $BE,$4B,$72,$6F,$6B,$6F,$64,$69,$6C,$00 ; @STRING@ "ein Krokodil"
.turbo:
db $20,$3C,$54,$75,$72,$62,$6F,$3E,$2C,$20,$B7,$48,$75,$6E,$64,$00 ; @STRING@ " <Turbo>, den Hund"
.guardian:
db $57,$6F,$6F,$64,$60,$73,$20,$57,$7B,$63,$68,$74,$65,$72,$00 ; @STRING@ "Wood`s Wächter"
.mole:
db $C0,$4D,$61,$75,$6C,$77,$75,$72,$66,$00 ; @STRING@ "einen Maulwurf"
.none:
db $6B,$65,$69,$6E,$65,$00 ; @STRING@ "keine"
.chief2:
db $B7,$42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$00 ; @STRING@ "den Bürgermeister"
.bird:
db $C0,$56,$6F,$67,$65,$6C,$00 ; @STRING@ "einen Vogel"
.dog:
db $C0,$48,$75,$6E,$64,$00 ; @STRING@ "einen Hund"
.mermaid:
db $BF,$4D,$65,$65,$72,$6A,$75,$6E,$67,$66,$72,$61,$75,$00 ; @STRING@ "eine Meerjungfrau"
.dolphin:
db $C0,$44,$65,$6C,$70,$68,$69,$6E,$00 ; @STRING@ "einen Delphin"
.angelfish:
db $C0,$45,$6E,$67,$65,$6C,$66,$69,$73,$63,$68,$00 ; @STRING@ "einen Engelfisch"
.queen:
db $B5,$4B,$2A,$6E,$69,$67,$69,$6E,$00 ; @STRING@ "die Königin"
.lue:
db $3C,$4C,$75,$65,$3E,$2C,$20,$B7,$44,$65,$6C,$70,$68,$69,$6E,$00 ; @STRING@ "<Lue>, den Delphin"
.mermaid_statue:
db $4D,$65,$65,$72,$6A,$75,$6E,$67,$66,$72,$61,$75,$73,$74,$61,$74,$75,$65,$00 ; @STRING@ "Meerjungfraustatue"
.boy:
db $C0,$4A,$75,$6E,$67,$65,$6E,$00 ; @STRING@ "einen Jungen"
.girl:
db $BE,$4D,$7B,$64,$63,$68,$65,$6E,$00 ; @STRING@ "ein Mädchen"
.grandfather:
db $C0,$47,$72,$6F,$25,$76,$61,$74,$65,$72,$00 ; @STRING@ "einen Großvater"
.grandmother:
db $BF,$47,$72,$6F,$25,$6D,$75,$74,$74,$65,$72,$00 ; @STRING@ "eine Großmutter"
.snail:
db $BF,$53,$63,$68,$6E,$65,$63,$6B,$65,$00 ; @STRING@ "eine Schnecke"
.king:
db $B7,$4B,$2A,$6E,$69,$67,$00 ; @STRING@ "den König"
.mushroom:
db $C0,$50,$69,$6C,$7A,$00 ; @STRING@ "einen Pilz"
.nome:
db $3C,$4E,$6F,$6D,$65,$3E,$2C,$20,$B5,$53,$63,$68,$6E,$65,$63,$6B,$65,$00 ; @STRING@ "<Nome>, die Schnecke"
.stairs:
db $BF,$54,$72,$65,$70,$70,$65,$00 ; @STRING@ "eine Treppe"
.great_door:
db $BF,$67,$72,$6F,$25,$65,$20,$54,$5B,$72,$00 ; @STRING@ "eine große Tür"
.cat:
db $BF,$4B,$61,$74,$7A,$65,$00 ; @STRING@ "eine Katze"
.plant:
db $BF,$50,$66,$6C,$61,$6E,$7A,$65,$00 ; @STRING@ "eine Pflanze"
.mouse:
db $BF,$4D,$61,$75,$73,$00 ; @STRING@ "eine Maus"
.drawers:
db $4B,$69,$73,$74,$65,$20,$DA,$53,$63,$68,$75,$62,$6C,$61,$64,$65,$6E,$00 ; @STRING@ "Kiste mit Schubladen"
.doll:
db $BF,$50,$75,$70,$70,$65,$00 ; @STRING@ "eine Puppe"
.marie:
db $3C,$4D,$61,$72,$69,$65,$3E,$2C,$20,$B5,$50,$75,$70,$70,$65,$00 ; @STRING@ "<Marie>, die Puppe"
.town_model:
db $BE,$4D,$6F,$64,$65,$6C,$20,$B6,$53,$74,$61,$64,$74,$00 ; @STRING@ "ein Model der Stadt"
.soldier:
db $C0,$53,$6F,$6C,$64,$61,$74,$00 ; @STRING@ "einen Soldat"
.maid:
db $BF,$4A,$75,$6E,$67,$66,$72,$61,$75,$00 ; @STRING@ "eine Jungfrau"
.singer:
db $C0,$53,$7B,$6E,$67,$65,$72,$00 ; @STRING@ "einen Sänger"
.magridd:
db $91,$4D,$61,$67,$72,$69,$64,$64,$00 ; @STRING@ "König Magridd"
.leo:
db $44,$72,$2E,$4C,$65,$6F,$00 ; @STRING@ "Dr.Leo"
.queen2:
db $B5,$4B,$2A,$6E,$69,$67,$69,$6E,$00 ; @STRING@ "die Königin"
