
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
db $14,$0B,'W','A','R','N','I','N','G','!',$0D,$0D,$0D,$0D
db 'T','h','i','s',' ','g','a','m','e',' ','p','a','k',' ','i','s',' ','n','o','t',' ','d','e','s','i','g','n','e','d',$0D,$0D,$0D,$0D
db 'f','o','r',' ','y','o','u','r',' ','S','U','P','E','R',' ','N','I','N','T','E','N','D','O','.',$0D,$0D,$0D,$0D,$0D,$0D
db $14,$14,'U','B','I',' ','S','O','F','T'
db $00
; @ENDSTRING@

Txt_Ubisoft_Presents:
; @NEW_TEXT@
; SETPOS $4C 3
; *"UBI SOFT PRÄSENTIERT" NO_NEWLINE
db $01,$4C,$03
db $03,$24,'U','B','I',' ','S','O','F','T',' ','P','R','Ä','S','E','N','T','I','E','R','T'
db $00
; @ENDSTRING@

Txt_Press_Start:
; @NEW_TEXT@
; CURSIVE
; SETPOS $94 4
; "drücke start" NO_NEWLINE
db $09
db $01,$94,$04
db 'd','r','ü','c','k','e',' ','s','t','a','r','t'
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
db $14,$06,'A','L','L',' ','R','I','G','H','T','S',' ','R','E','S','E','R','V','E','D',$0D
db ' ',' ','C','O','P','Y','R','I','G','H','T',' ','1','9','9','4',' ','Q','U','I','N','T','E','T','/','E','N','I','X',$0D
db $14,$09,'L','I','C','E','N','S','E','D',' ','T','O',' ','U','B','I',' ','S','O','F','T',$0D
db $14,$09,'L','I','C','E','N','S','E','D',' ','B','Y',' ','N','I','N','T','E','N','D','O'
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
db ' ',' ',$87,'a','l','t','e','n',' ','W','e','i','s','e','n',' ','e','r','z','ä','h','l','e','n',' ',$0D,$0D,$0D
db ' ',' ','s','p','ä','t',' ',$D3,$B6,'N','a','c','h','t',' ',$EE,$0D,$0D,$0D
db ' ',' ',$C7,'K','ö','n','i','g',',',' ','w','e','l','c','h','e','r',' ','d','u','r','c','h',' ',$0D,$0D,$0D
db ' ',' ',$B5,'V','e','r','s','u','c','h','u','n','g',' ',$B8,$82,$0D,$0D,$0D
db ' ',' ','z','e','r','s','t','ö','r','t',' ','w','u','r','d','e','.'
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
db ' ',' ',$8A,'I','m','p','e','r','i','u','m',' ',$EE,'F','r','e','i','l',',',' ',$F6,$0D,$0D,$0D
db ' ',' ',$B9,'L','a','n','d',' ','d','a','m','a','l','s',' ','g','e','n','a','n','n','t',' ','w','u','r','d','e',',',$0D,$0D,$0D
db ' ',' ',$F8,$F1,'m','ä','c','h','t','i','g','e','n',' ',$91,$0D,$0D,$0D
db ' ',' ',$99,'r','e','g','i','e','r','t','.'
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
db ' ',' ',$87,'M','e','h','r','h','e','i','t',' ',$B6,'B','e','v','ö','l','k','e','r','-',$0D,$0D,$0D
db ' ',' ','u','n','g',' ','h','i','e','l','t',' ',$B7,$91,$C9,$0D,$0D,$0D
db ' ',' ','g','u','t','h','e','r','z','i','g',' ',$EB,'g','n','ä','d','i','g','.',$0D,$0D,$0D
db ' ',' ','M','a','n','c','h','e',' ','s','a','h','e','n',' ','I','h','n',' ','j','e','d','o','c','h',' ',$AF,$0D,$0D,$0D
db ' ',' ',$C0,'m','a','c','h','t','h','u','n','g','r','i','g','e','n',' ',$0D,$0D,$0D
db ' ',' ','T','y','r','a','n','n','e','n',' ','a','n','.'
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
db ' ',' ','E','i','n','e','s',' ',$A6,'b','e','l','a','u','s','c','h','t','e',' ',$B6,$0D,$0D,$0D
db ' ',' ',$91,'z','w','e','i',' ','W','a','c','h','e','n',',',' ',$FB,$0D,$0D,$0D
db ' ',' ','ü','b','e','r',' ',$C0,'M','a','n','n',' ',$E2,'D','r','.',$0D,$0D,$0D
db ' ',' ',$93,'s','p','r','a','c','h','e','n','.',' ',$9F,'b','e','z','e','i','c','h','-',$0D,$0D,$0D
db ' ',' ','n','e','t','e','n',' ','I','h','n',' ',$AF,'g','r','o','ß','a','r','t','i','g','e','n',' ',$0D,$0D,$0D
db ' ',' ','E','r','f','i','n','d','e','r',' ',$EB,'G','e','n','i','e','.'
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
db ' ',' ',$88,$91,'v','e','r','b','r','a','c','h','t','e',' ',$EF,$0D,$0D,$0D
db ' ',' ','s','c','h','l','a','f','l','o','s','e',' ','N','ä','c','h','t','e',' ','d','a','m','i','t',',',$0D,$0D,$0D
db ' ',' ',$E5,'a','u','s','z','u','m','a','l','e','n',' ',$F6,$C8,$B5,$0D,$0D,$0D
db ' ',' ','D','i','e','n','s','t','e',' ',$B8,'E','r','f','i','n','d','e','r','s',' ',$E5,$0D,$0D,$0D
db ' ',' ',$FD,'N','u','t','z','e',' ','m','a','c','h','e','n',' ','k','o','n','n','t','e',',',' ',$EC,$0D,$0D,$0D
db ' ',' ',$E0,'r','e','i','c','h','e','r',' ',$FD,'w','e','r','d','e','n','.'
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
db ' ',' ','P','l','ö','t','z','l','i','c','h',' ','h','a','t','t','e',' ',$B6,$91,$0D,$0D,$0D
db ' ',' ',$BF,'I','d','e','e','.',' ','E','r',' ','b','e','f','a','h','l',' ','s','e','i','n','e','n',' ',$0D,$0D,$0D
db ' ',' ','W','a','c','h','e','n',' ','D','r','.',$93,'g','e','f','a','n','g','e','n',' ',$FD,$0D,$0D,$0D
db ' ',' ','n','e','h','m','e','n',',',' ',$EB,'i','h','n',' ','s','o','f','o','r','t',' ',$AC,$0D,$0D,$0D
db ' ',' ',$B9,$9E,$FD,'b','r','i','n','g','e','n','!'
db $00
; @ENDSTRING@


Txt_Intro7:
; @NEW_TEXT@
; SETPOS $80 2
; "  Dr. Leo wurde spät in der\n\n"
; "  Nacht zum Schloß gebracht." NO_NEWLINE
db $01,$80,$02
db ' ',' ','D','r','.',' ',$93,$F8,'s','p','ä','t',' ',$D3,'d','e','r',$0D,$0D,$0D
db ' ',' ','N','a','c','h','t',' ',$FE,$9E,'g','e','b','r','a','c','h','t','.'
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
db ' ',' ',$88,$91,'s','c','h','l','o','ß',' ','i','h','n',' ',$D3,$0D,$0D,$0D
db ' ',' ',$C7,'k','l','e','i','n','e','n',' ','R','a','u','m',' ','e','i','n',',',' ',$EB,$0D,$0D,$0D
db ' ',' ','b','e','f','a','h','l',' ','i','h','m',' ',$BF,'M','a','s','c','h','i','n','e',' ',$FD,$0D,$0D,$0D
db ' ',' ','e','r','f','i','n','d','e','n',' ',$DA,'w','e','l','c','h','e','r',' ','m','a','n',' ',$0D,$0D,$0D
db ' ',' ',$B7,$91,$B8,'B','ö','s','e','n',',',' ','D','e','a','t','h','-',$0D,$0D,$0D
db ' ',' ','t','o','l','l',',',' ','h','e','r','b','e','i','r','u','f','e','n',' ','k','o','n','n','t','e','.'
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
db ' ',' ','A','l','s',' ','D','r','.',$93,$B5,'M','a','s','c','h','i','n','e',' ',$0D,$0D,$0D
db ' ',' ','f','e','r','t','i','g','g','e','s','t','e','l','l','t',' ','h','a','t','t','e',',',' ','t','r','a','t',' ',$0D,$0D,$0D
db ' ',' ',$B6,$91,'s','o','f','o','r','t',' ',$DA,'D','e','a','t','h','-',$0D,$0D,$0D
db ' ',' ','t','o','l','l',' ',$D3,'V','e','r','b','i','n','d','u','n','g',',',' ',$D3,$B6,$0D,$0D,$0D
db ' ',' ','H','o','f','f','n','u','n','g',' ',$C0,'P','a','k','t',' ',$DA,$0D,$0D,$0D
db ' ',' ','i','h','m',' ','s','c','h','l','i','e','ß','e','n',' ',$FD,'k','ö','n','n','e','n','.'
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
db ' ',' ','N','a','c','h',' ','v','i','e','l','e','n',' ','T','a','g','e','n',' ',$FC,$B6,$0D,$0D,$0D
db ' ',' ','P','a','k','t',' ','b','e','s','i','e','g','e','l','t','.',' ',$88,$91,$0D,$0D,$0D
db ' ',' ','w','o','l','l','t','e',' ',$86,$AE,'L','e','b','e','-',$0D,$0D,$0D
db ' ',' ','w','e','s','e','n',' ',$EE,'F','r','e','i','l',' ','b','r','i','n','g','e','n',',',' ',$EC,$0D,$0D,$0D
db ' ',' ',$AF,'G','e','g','e','n','l','e','i','s','t','u','n','g',' ',$BE,'G','o','l','d','-',$0D,$0D,$0D
db ' ',' ','s','t','ü','c','k',' ',$C9,'j','e','d','e','n',' ',$FD,'e','r','h','a','l','t','e','n','.'
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
db ' ',' ','E','i','n','e','r',' ',$E3,$BB,'a','n','d','e','r','e','n',' ','v','e','r','-',$0D,$0D,$0D
db ' ',' ','s','c','h','w','a','n','d','e','n',' ',$B5,$97,$AD,$0D,$0D,$0D
db ' ',' ','F','r','e','i','l','.',' ','S','c','h','o','n',' ','b','a','l','d',' ',$FC,$B9,$0D,$0D,$0D
db ' ',' ','g','e','s','a','m','t','e',' ','L','a','n','d',' ',$F6,'l','e','e','r','g','e','f','e','g','t','.'
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
db ' ',' ','Z','w','e','i',' ','P','e','r','s','o','n','e','n',' ','b','e','o','b','a','c','h','t','e','t','e','n',' ',$0D,$0D,$0D
db ' ',' ',$B7,'g','e','s','a','m','t','e','n',' ','V','o','r','g','a','n','g','.',' ',$88,$0D,$0D,$0D
db ' ',' ','M','e','i','s','t','e','r',',',' ',$EB,'D','u',',',' ','s','e','i','n',' ',$0D,$0D,$0D
db ' ',' ','S','c','h','ü','l','e','r','.'
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
db ' ',' ',$3C,$88,$91,$FC,$E8,'t','ö','r','i','c','h','t',' ',$0D,$0D,$0D
db ' ',' ',$DA,$BB,$82,$FD,'h','a','n','d','e','l','n','.',$0D,$0D,$0D
db ' ',' ',$8C,'l','i','e','g','t',' ','n','u','n',' ','a','n',' ',$84,$AC,$B5,$0D,$0D,$0D
db ' ',' ','E','r','d','e',' ','h','i','n','a','b','z','u','s','t','e','i','g','e','n',' ',$EB,$0D,$0D,$0D
db ' ',' ',$E6,'w','i','e','d','e','r','z','u','b','e','l','e','b','e','n','!',$3E,',',$0D,$0D,$0D
db ' ',' ','s','a','g','t','e',' ',$B6,'M','e','i','s','t','e','r','.'
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
db ' ',' ','A','u','f',' ',$C7,'S','t','r','a','h','l',' ',$B8,'L','i','c','h','t','s',' ',$0D,$0D,$0D
db ' ',' ','s','t','e','i','g','s','t',' ',$83,'z','u','r',' ','E','r','d','e',' ','h','i','n','a','b','.','.',$0D,$0D,$0D
db ' ',' ','.','.','.','E','i','n',' ','K','r','i','e','g','e','r',' ','w','e','l','c','h','e','r',' ','g','e','-',$0D,$0D,$0D
db ' ',' ','s','c','h','i','c','k','t',' ','w','u','r','d','e',',',' ',$EC,'L','e','b','e','n',' ',$FD,$0D,$0D,$0D
db ' ',' ','s','c','h','ü','t','z','e','n',',',' ',$EB,$B9,'B','ö','s','e',' ',$FD,$0D,$0D,$0D
db ' ',' ','v','e','r','n','i','c','h','t','e','n','.','E','I','N',' ','S','O','U','L',' ','B','L','A','Z','E','R','!'
db $00
; @ENDSTRING@
