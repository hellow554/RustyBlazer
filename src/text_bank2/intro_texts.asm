
Txt_Warning_NTSC:
; @NEW_TEXT@
; SETPOS $42 1
; BOLD
; "           WARNING!\n\n\n\n" NO_NEWLINE
; "This game pak is not designed\n\n\n\n" NO_NEWLINE
; "for your SUPER NINTENDO.\n\n\n\n\n\n" NO_NEWLINE
; "                    UBI SOFT" NO_NEWLINE
db $01,$42,$01
db $03,$24
db $14,$0B,$57,$41,$52,$4E,$49,$4E,$47,$21,$0D,$0D,$0D,$0D
db $54,$68,$69,$73,$20,$67,$61,$6D,$65,$20,$70,$61,$6B,$20,$69,$73,$20,$6E,$6F,$74,$20,$64,$65,$73,$69,$67,$6E,$65,$64,$0D,$0D,$0D,$0D
db $66,$6F,$72,$20,$79,$6F,$75,$72,$20,$53,$55,$50,$45,$52,$20,$4E,$49,$4E,$54,$45,$4E,$44,$4F,$2E,$0D,$0D,$0D,$0D,$0D,$0D
db $14,$14,$55,$42,$49,$20,$53,$4F,$46,$54
db $00
; @ENDSTRING@

Txt_Ubisoft_Presents:
; @NEW_TEXT@
; SETPOS $4C 3
; *"UBI SOFT PRÄSENTIERT" NO_NEWLINE
db $01,$4C,$03
db $03,$24,$55,$42,$49,$20,$53,$4F,$46,$54,$20,$50,$52,$7D,$53,$45,$4E,$54,$49,$45,$52,$54
db $00
; @ENDSTRING@

Txt_Press_Start:
; @NEW_TEXT@
; CURSIVE 
; SETPOS $94 4
; "drücke start" NO_NEWLINE
db $09
db $01,$94,$04
db $64,$72,$5B,$63,$6B,$65,$20,$73,$74,$61,$72,$74
db $00
; @ENDSTRING@

Txt_Rights_Reserved:
; @NEW_TEXT@
; CURSIVE
; SETPOS $80 5
; "      ALL RIGHTS RESERVED"
; "  COPYRIGHT 1994 QUINTET/ENIX"
; "         LICENSED TO UBI SOFT"
; "         LICENSED BY NINTENDO" NO_NEWLINE
db $09
db $01,$80,$05
db $14,$06,$41,$4C,$4C,$20,$52,$49,$47,$48,$54,$53,$20,$52,$45,$53,$45,$52,$56,$45,$44,$0D
db $20,$20,$43,$4F,$50,$59,$52,$49,$47,$48,$54,$20,$31,$39,$39,$34,$20,$51,$55,$49,$4E,$54,$45,$54,$2F,$45,$4E,$49,$58,$0D
db $14,$09,$4C,$49,$43,$45,$4E,$53,$45,$44,$20,$54,$4F,$20,$55,$42,$49,$20,$53,$4F,$46,$54,$0D
db $14,$09,$4C,$49,$43,$45,$4E,$53,$45,$44,$20,$42,$59,$20,$4E,$49,$4E,$54,$45,$4E,$44,$4F
db $00
; @ENDSTRING@

Txt_Intro1:
; @NEW_TEXT@
; SETPOS $80 2
; "  Die alten Weisen erzählen \n\n"
; "  spät in der Nacht von \n\n"
; "  einem König, welcher durch \n\n"
; "  die Versuchung des Bösen \n\n"
; "  zerstört wurde." NO_NEWLINE
db $01,$80,$02
db $20,$20,$87,$61,$6C,$74,$65,$6E,$20,$57,$65,$69,$73,$65,$6E,$20,$65,$72,$7A,$7B,$68,$6C,$65,$6E,$20,$0D,$0D,$0D
db $20,$20,$73,$70,$7B,$74,$20,$D3,$B6,$4E,$61,$63,$68,$74,$20,$EE,$0D,$0D,$0D
db $20,$20,$C7,$4B,$2A,$6E,$69,$67,$2C,$20,$77,$65,$6C,$63,$68,$65,$72,$20,$64,$75,$72,$63,$68,$20,$0D,$0D,$0D
db $20,$20,$B5,$56,$65,$72,$73,$75,$63,$68,$75,$6E,$67,$20,$B8,$82,$0D,$0D,$0D
db $20,$20,$7A,$65,$72,$73,$74,$2A,$72,$74,$20,$77,$75,$72,$64,$65,$2E
db $00
; @ENDSTRING@

Txt_Intro2:
; @NEW_TEXT@
; SETPOS $80 2
; "  Das Imperium von Freil, wie \n\n"
; "  das Land damals genannt wurde,\n\n"
; "  wurde vom mächtigen König \n\n"
; "  Magridd regiert." NO_NEWLINE
db $01,$80,$02
db $20,$20,$8A,$49,$6D,$70,$65,$72,$69,$75,$6D,$20,$EE,$46,$72,$65,$69,$6C,$2C,$20,$F6,$0D,$0D,$0D
db $20,$20,$B9,$4C,$61,$6E,$64,$20,$64,$61,$6D,$61,$6C,$73,$20,$67,$65,$6E,$61,$6E,$6E,$74,$20,$77,$75,$72,$64,$65,$2C,$0D,$0D,$0D
db $20,$20,$F8,$F1,$6D,$7B,$63,$68,$74,$69,$67,$65,$6E,$20,$91,$0D,$0D,$0D
db $20,$20,$99,$72,$65,$67,$69,$65,$72,$74,$2E
db $00
; @ENDSTRING@

Txt_Intro3:
; @NEW_TEXT@
; SETPOS $80 2
; "  Die Mehrheit der Bevölker-\n\n"
; "  ung hielt den König für \n\n"
; "  gutherzig und gnädig.\n\n"
; "  Manche sahen Ihn jedoch als \n\n"
; "  einen machthungrigen \n\n"
; "  Tyrannen an." NO_NEWLINE
db $01,$80,$02
db $20,$20,$87,$4D,$65,$68,$72,$68,$65,$69,$74,$20,$B6,$42,$65,$76,$2A,$6C,$6B,$65,$72,$2D,$0D,$0D,$0D
db $20,$20,$75,$6E,$67,$20,$68,$69,$65,$6C,$74,$20,$B7,$91,$C9,$0D,$0D,$0D
db $20,$20,$67,$75,$74,$68,$65,$72,$7A,$69,$67,$20,$EB,$67,$6E,$7B,$64,$69,$67,$2E,$0D,$0D,$0D
db $20,$20,$4D,$61,$6E,$63,$68,$65,$20,$73,$61,$68,$65,$6E,$20,$49,$68,$6E,$20,$6A,$65,$64,$6F,$63,$68,$20,$AF,$0D,$0D,$0D
db $20,$20,$C0,$6D,$61,$63,$68,$74,$68,$75,$6E,$67,$72,$69,$67,$65,$6E,$20,$0D,$0D,$0D
db $20,$20,$54,$79,$72,$61,$6E,$6E,$65,$6E,$20,$61,$6E,$2E
db $00
; @ENDSTRING@

Txt_Intro4:
; @NEW_TEXT@
; SETPOS $80 2
; "  Eines Tages belauschte der \n\n"
; "  König zwei Wachen, welche \n\n"
; "  über einen Mann namens Dr.\n\n"
; "  Leo sprachen. Sie bezeich-\n\n"
; "  neten Ihn als großartigen \n\n"
; "  Erfinder und Genie." NO_NEWLINE
db $01,$80,$02
db $20,$20,$45,$69,$6E,$65,$73,$20,$A6,$62,$65,$6C,$61,$75,$73,$63,$68,$74,$65,$20,$B6,$0D,$0D,$0D
db $20,$20,$91,$7A,$77,$65,$69,$20,$57,$61,$63,$68,$65,$6E,$2C,$20,$FB,$0D,$0D,$0D
db $20,$20,$5B,$62,$65,$72,$20,$C0,$4D,$61,$6E,$6E,$20,$E2,$44,$72,$2E,$0D,$0D,$0D
db $20,$20,$93,$73,$70,$72,$61,$63,$68,$65,$6E,$2E,$20,$9F,$62,$65,$7A,$65,$69,$63,$68,$2D,$0D,$0D,$0D
db $20,$20,$6E,$65,$74,$65,$6E,$20,$49,$68,$6E,$20,$AF,$67,$72,$6F,$25,$61,$72,$74,$69,$67,$65,$6E,$20,$0D,$0D,$0D
db $20,$20,$45,$72,$66,$69,$6E,$64,$65,$72,$20,$EB,$47,$65,$6E,$69,$65,$2E
db $00
; @ENDSTRING@

Txt_Intro5:
; @NEW_TEXT@
; SETPOS $80 2
; "  Der König verbrachte viele \n\n"
; "  schlaflose Nächte damit,\n\n"
; "  sich auszumalen wie er die \n\n"
; "  Dienste des Erfinders sich \n\n"
; "  zu Nutze machen konnte, um \n\n"
; "  noch reicher zu werden." NO_NEWLINE
db $01,$80,$02
db $20,$20,$88,$91,$76,$65,$72,$62,$72,$61,$63,$68,$74,$65,$20,$EF,$0D,$0D,$0D
db $20,$20,$73,$63,$68,$6C,$61,$66,$6C,$6F,$73,$65,$20,$4E,$7B,$63,$68,$74,$65,$20,$64,$61,$6D,$69,$74,$2C,$0D,$0D,$0D
db $20,$20,$E5,$61,$75,$73,$7A,$75,$6D,$61,$6C,$65,$6E,$20,$F6,$C8,$B5,$0D,$0D,$0D
db $20,$20,$44,$69,$65,$6E,$73,$74,$65,$20,$B8,$45,$72,$66,$69,$6E,$64,$65,$72,$73,$20,$E5,$0D,$0D,$0D
db $20,$20,$FD,$4E,$75,$74,$7A,$65,$20,$6D,$61,$63,$68,$65,$6E,$20,$6B,$6F,$6E,$6E,$74,$65,$2C,$20,$EC,$0D,$0D,$0D
db $20,$20,$E0,$72,$65,$69,$63,$68,$65,$72,$20,$FD,$77,$65,$72,$64,$65,$6E,$2E
db $00
; @ENDSTRING@

Txt_Intro6:
; @NEW_TEXT@
; SETPOS $80 2
; "  Plötzlich hatte der König \n\n"
; "  eine Idee. Er befahl seinen \n\n"
; "  Wachen Dr.Leo gefangen zu \n\n"
; "  nehmen, und ihn sofort auf \n\n"
; "  das Schloß zu bringen!" NO_NEWLINE
db $01,$80,$02
db $20,$20,$50,$6C,$2A,$74,$7A,$6C,$69,$63,$68,$20,$68,$61,$74,$74,$65,$20,$B6,$91,$0D,$0D,$0D
db $20,$20,$BF,$49,$64,$65,$65,$2E,$20,$45,$72,$20,$62,$65,$66,$61,$68,$6C,$20,$73,$65,$69,$6E,$65,$6E,$20,$0D,$0D,$0D
db $20,$20,$57,$61,$63,$68,$65,$6E,$20,$44,$72,$2E,$93,$67,$65,$66,$61,$6E,$67,$65,$6E,$20,$FD,$0D,$0D,$0D
db $20,$20,$6E,$65,$68,$6D,$65,$6E,$2C,$20,$EB,$69,$68,$6E,$20,$73,$6F,$66,$6F,$72,$74,$20,$AC,$0D,$0D,$0D
db $20,$20,$B9,$9E,$FD,$62,$72,$69,$6E,$67,$65,$6E,$21
db $00
; @ENDSTRING@


Txt_Intro7:
; @NEW_TEXT@
; SETPOS $80 2
; "  Dr. Leo wurde spät in der\n\n"
; "  Nacht zum Schloß gebracht." NO_NEWLINE
db $01,$80,$02
db $20,$20,$44,$72,$2E,$20,$93,$F8,$73,$70,$7B,$74,$20,$D3,$64,$65,$72,$0D,$0D,$0D
db $20,$20,$4E,$61,$63,$68,$74,$20,$FE,$9E,$67,$65,$62,$72,$61,$63,$68,$74,$2E
db $00
; @ENDSTRING@


Txt_Intro8:
; @NEW_TEXT@
; SETPOS $80 2
; "  Der König schloß ihn in \n\n"
; "  einem kleinen Raum ein, und \n\n"
; "  befahl ihm eine Maschine zu \n\n"
; "  erfinden mit welcher man \n\n"
; "  den König des Bösen, Death-\n\n"
; "  toll, herbeirufen konnte." NO_NEWLINE
db $01,$80,$02
db $20,$20,$88,$91,$73,$63,$68,$6C,$6F,$25,$20,$69,$68,$6E,$20,$D3,$0D,$0D,$0D
db $20,$20,$C7,$6B,$6C,$65,$69,$6E,$65,$6E,$20,$52,$61,$75,$6D,$20,$65,$69,$6E,$2C,$20,$EB,$0D,$0D,$0D
db $20,$20,$62,$65,$66,$61,$68,$6C,$20,$69,$68,$6D,$20,$BF,$4D,$61,$73,$63,$68,$69,$6E,$65,$20,$FD,$0D,$0D,$0D
db $20,$20,$65,$72,$66,$69,$6E,$64,$65,$6E,$20,$DA,$77,$65,$6C,$63,$68,$65,$72,$20,$6D,$61,$6E,$20,$0D,$0D,$0D
db $20,$20,$B7,$91,$B8,$42,$2A,$73,$65,$6E,$2C,$20,$44,$65,$61,$74,$68,$2D,$0D,$0D,$0D
db $20,$20,$74,$6F,$6C,$6C,$2C,$20,$68,$65,$72,$62,$65,$69,$72,$75,$66,$65,$6E,$20,$6B,$6F,$6E,$6E,$74,$65,$2E
db $00
; @ENDSTRING@


Txt_Intro9:
; @NEW_TEXT@
; SETPOS $80 2
; "  Als Dr.Leo die Maschine \n\n"
; "  fertiggestellt hatte, trat \n\n"
; "  der König sofort mit Death-\n\n"
; "  toll in Verbindung, in der \n\n"
; "  Hoffnung einen Pakt mit \n\n"
; "  ihm schließen zu können." NO_NEWLINE
db $01,$80,$02
db $20,$20,$41,$6C,$73,$20,$44,$72,$2E,$93,$B5,$4D,$61,$73,$63,$68,$69,$6E,$65,$20,$0D,$0D,$0D
db $20,$20,$66,$65,$72,$74,$69,$67,$67,$65,$73,$74,$65,$6C,$6C,$74,$20,$68,$61,$74,$74,$65,$2C,$20,$74,$72,$61,$74,$20,$0D,$0D,$0D
db $20,$20,$B6,$91,$73,$6F,$66,$6F,$72,$74,$20,$DA,$44,$65,$61,$74,$68,$2D,$0D,$0D,$0D
db $20,$20,$74,$6F,$6C,$6C,$20,$D3,$56,$65,$72,$62,$69,$6E,$64,$75,$6E,$67,$2C,$20,$D3,$B6,$0D,$0D,$0D
db $20,$20,$48,$6F,$66,$66,$6E,$75,$6E,$67,$20,$C0,$50,$61,$6B,$74,$20,$DA,$0D,$0D,$0D
db $20,$20,$69,$68,$6D,$20,$73,$63,$68,$6C,$69,$65,$25,$65,$6E,$20,$FD,$6B,$2A,$6E,$6E,$65,$6E,$2E
db $00
; @ENDSTRING@


Txt_Intro10:
; @NEW_TEXT@
; SETPOS $80 2
; "  Nach vielen Tagen war der \n\n"
; "  Pakt besiegelt. Der König \n\n"
; "  wollte Deathtoll alle Lebe-\n\n"
; "  wesen von Freil bringen, um \n\n"
; "  als Gegenleistung ein Gold-\n\n"
; "  stück für jeden zu erhalten." NO_NEWLINE
db $01,$80,$02
db $20,$20,$4E,$61,$63,$68,$20,$76,$69,$65,$6C,$65,$6E,$20,$54,$61,$67,$65,$6E,$20,$FC,$B6,$0D,$0D,$0D
db $20,$20,$50,$61,$6B,$74,$20,$62,$65,$73,$69,$65,$67,$65,$6C,$74,$2E,$20,$88,$91,$0D,$0D,$0D
db $20,$20,$77,$6F,$6C,$6C,$74,$65,$20,$86,$AE,$4C,$65,$62,$65,$2D,$0D,$0D,$0D
db $20,$20,$77,$65,$73,$65,$6E,$20,$EE,$46,$72,$65,$69,$6C,$20,$62,$72,$69,$6E,$67,$65,$6E,$2C,$20,$EC,$0D,$0D,$0D
db $20,$20,$AF,$47,$65,$67,$65,$6E,$6C,$65,$69,$73,$74,$75,$6E,$67,$20,$BE,$47,$6F,$6C,$64,$2D,$0D,$0D,$0D
db $20,$20,$73,$74,$5B,$63,$6B,$20,$C9,$6A,$65,$64,$65,$6E,$20,$FD,$65,$72,$68,$61,$6C,$74,$65,$6E,$2E
db $00
; @ENDSTRING@


Txt_Intro11:
; @NEW_TEXT@
; SETPOS $80 2
; "  Einer nach dem anderen ver-\n\n"
; "  schwanden die Menschen aus \n\n"
; "  Freil. Schon bald war das \n\n"
; "  gesamte Land wie leergefegt." NO_NEWLINE
db $01,$80,$02
db $20,$20,$45,$69,$6E,$65,$72,$20,$E3,$BB,$61,$6E,$64,$65,$72,$65,$6E,$20,$76,$65,$72,$2D,$0D,$0D,$0D
db $20,$20,$73,$63,$68,$77,$61,$6E,$64,$65,$6E,$20,$B5,$97,$AD,$0D,$0D,$0D
db $20,$20,$46,$72,$65,$69,$6C,$2E,$20,$53,$63,$68,$6F,$6E,$20,$62,$61,$6C,$64,$20,$FC,$B9,$0D,$0D,$0D
db $20,$20,$67,$65,$73,$61,$6D,$74,$65,$20,$4C,$61,$6E,$64,$20,$F6,$6C,$65,$65,$72,$67,$65,$66,$65,$67,$74,$2E
db $00
; @ENDSTRING@


Txt_Intro12:
; @NEW_TEXT@
; SETPOS $80 2
; "  Zwei Personen beobachteten \n\n"
; "  den gesamten Vorgang. Der \n\n"
; "  Meister, und Du, sein \n\n"
; "  Schüler." NO_NEWLINE
db $01,$80,$02
db $20,$20,$5A,$77,$65,$69,$20,$50,$65,$72,$73,$6F,$6E,$65,$6E,$20,$62,$65,$6F,$62,$61,$63,$68,$74,$65,$74,$65,$6E,$20,$0D,$0D,$0D
db $20,$20,$B7,$67,$65,$73,$61,$6D,$74,$65,$6E,$20,$56,$6F,$72,$67,$61,$6E,$67,$2E,$20,$88,$0D,$0D,$0D
db $20,$20,$4D,$65,$69,$73,$74,$65,$72,$2C,$20,$EB,$44,$75,$2C,$20,$73,$65,$69,$6E,$20,$0D,$0D,$0D
db $20,$20,$53,$63,$68,$5B,$6C,$65,$72,$2E
db $00
; @ENDSTRING@

Txt_Intro13:
; @NEW_TEXT@
; SETPOS $80 2
; "  \x3c\x88\x91\xfc\xe8töricht \n\n"
; "  mit dem Bösen zu handeln.\n\n"
; "  Es liegt nun an Dir auf die \n\n"
; "  Erde hinabzusteigen und \n\n"
; "  sie wiederzubeleben!\x3e,\n\n"
; "  sagte der Meister." NO_NEWLINE
db $01,$80,$02
db $20,$20,$3C,$88,$91,$FC,$E8,$74,$2A,$72,$69,$63,$68,$74,$20,$0D,$0D,$0D
db $20,$20,$DA,$BB,$82,$FD,$68,$61,$6E,$64,$65,$6C,$6E,$2E,$0D,$0D,$0D
db $20,$20,$8C,$6C,$69,$65,$67,$74,$20,$6E,$75,$6E,$20,$61,$6E,$20,$84,$AC,$B5,$0D,$0D,$0D
db $20,$20,$45,$72,$64,$65,$20,$68,$69,$6E,$61,$62,$7A,$75,$73,$74,$65,$69,$67,$65,$6E,$20,$EB,$0D,$0D,$0D
db $20,$20,$E6,$77,$69,$65,$64,$65,$72,$7A,$75,$62,$65,$6C,$65,$62,$65,$6E,$21,$3E,$2C,$0D,$0D,$0D
db $20,$20,$73,$61,$67,$74,$65,$20,$B6,$4D,$65,$69,$73,$74,$65,$72,$2E
db $00
; @ENDSTRING@

Txt_Intro14:
; @NEW_TEXT@
; SETPOS $80 2
; "  Auf einem Strahl des Lichts \n\n"
; "  steigst Du zur Erde hinab..\n\n"
; "  ...Ein Krieger welcher ge-\n\n"
; "  schickt wurde, um Leben zu \n\n"
; "  schützen, und das Böse zu \n\n"
; "  vernichten.EIN SOUL BLAZER!" NO_NEWLINE
db $01,$80,$02
db $20,$20,$41,$75,$66,$20,$C7,$53,$74,$72,$61,$68,$6C,$20,$B8,$4C,$69,$63,$68,$74,$73,$20,$0D,$0D,$0D
db $20,$20,$73,$74,$65,$69,$67,$73,$74,$20,$83,$7A,$75,$72,$20,$45,$72,$64,$65,$20,$68,$69,$6E,$61,$62,$2E,$2E,$0D,$0D,$0D
db $20,$20,$2E,$2E,$2E,$45,$69,$6E,$20,$4B,$72,$69,$65,$67,$65,$72,$20,$77,$65,$6C,$63,$68,$65,$72,$20,$67,$65,$2D,$0D,$0D,$0D
db $20,$20,$73,$63,$68,$69,$63,$6B,$74,$20,$77,$75,$72,$64,$65,$2C,$20,$EC,$4C,$65,$62,$65,$6E,$20,$FD,$0D,$0D,$0D
db $20,$20,$73,$63,$68,$5B,$74,$7A,$65,$6E,$2C,$20,$EB,$B9,$42,$2A,$73,$65,$20,$FD,$0D,$0D,$0D
db $20,$20,$76,$65,$72,$6E,$69,$63,$68,$74,$65,$6E,$2E,$45,$49,$4E,$20,$53,$4F,$55,$4C,$20,$42,$4C,$41,$5A,$45,$52,$21
db $00
; @ENDSTRING@
