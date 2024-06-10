
; @NEW_TEXT@
; SETPOS $40 $02
; "  Grass Valley bei Sonnen-\n\n"
; "  aufgang. Der schäumende \n\n"
; "  Ozean. Die wiederbelebte \n\n"
; "  Welt war wunderschön...." NO_NEWLINE
db $01,$40,$02
db ' ',' ','G','r','a','s','s',' ','V','a','l','l','e','y',' ','b','e','i',' ','S','o','n','n','e','n','-',$0D,$0D,$0D
db ' ',' ','a','u','f','g','a','n','g','.',' ',$88,'s','c','h','ä','u','m','e','n','d','e',' ',$0D,$0D,$0D
db ' ',' ','O','z','e','a','n','.',' ',$87,'w','i','e','d','e','r','b','e','l','e','b','t','e',' ',$0D,$0D,$0D
db ' ',' ',$A9,$FC,'w','u','n','d','e','r','s','c','h','ö','n','.','.','.','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; SETPOS $C0 $02
; "   Alle Lebewesen erfreuten \n\n"
; "   sich an der Schönheit des \n\n"
; "   Sonnenaufganges." NO_NEWLINE
db $01,$C0,$02
db $14,$03,'A','l','l','e',' ','L','e','b','e','w','e','s','e','n',' ','e','r','f','r','e','u','t','e','n',' ',$0D,$0D,$0D
db $14,$03,$E5,'a','n',' ',$B6,'S','c','h','ö','n','h','e','i','t',' ',$B8,$0D,$0D,$0D
db $14,$03,'S','o','n','n','e','n','a','u','f','g','a','n','g','e','s','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; SETPOS $40 $02
; " Jemand hatte sein Kind dabei \n\n"
; " ein anderer seinen Freund \n\n"
; " die Kreaturen waren ver-\n\n"
; " zaubert vom Anblick." NO_NEWLINE
db $01,$40,$02
db ' ','J','e','m','a','n','d',' ','h','a','t','t','e',' ','s','e','i','n',' ','K','i','n','d',' ','d','a','b','e','i',' ',$0D,$0D,$0D
db ' ',$BE,'a','n','d','e','r','e','r',' ','s','e','i','n','e','n',' ','F','r','e','u','n','d',' ',$0D,$0D,$0D
db ' ',$B5,'K','r','e','a','t','u','r','e','n',' ','w','a','r','e','n',' ','v','e','r','-',$0D,$0D,$0D
db ' ','z','a','u','b','e','r','t',' ',$F1,'A','n','b','l','i','c','k','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; SETPOS $C0 $02
; "  Plötzlich schoß ein Licht-\n\n"
; "  strahl in den Himmel.\n\n"
; "  Trotzdem niemand sah es." NO_NEWLINE
db $01,$C0,$02
db ' ',' ','P','l','ö','t','z','l','i','c','h',' ','s','c','h','o','ß',' ',$BE,'L','i','c','h','t','-',$0D,$0D,$0D
db ' ',' ','s','t','r','a','h','l',' ',$D3,$B7,'H','i','m','m','e','l','.',$0D,$0D,$0D
db ' ',' ','T','r','o','t','z','d','e','m',' ','n','i','e','m','a','n','d',' ','s','a','h',' ','e','s','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; SETPOS $C0 $02
; "   Lisa stand dort ganz \n\n"
; "   alleine." NO_NEWLINE
db $01,$C0,$02
db $14,$03,$94,'s','t','a','n','d',' ','d','o','r','t',' ','g','a','n','z',' ',$0D,$0D,$0D
db $14,$03,'a','l','l','e','i','n','e','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; SETPOS $40 02
; "   Früher fühlte sie sich ein-\n\n"
; "   sam, wenn sie den Sonnen-\n\n"
; "   aufgang sah aber jetzt \n\n"
; "   hält sie ihn für schön." NO_NEWLINE
db $01,$40,$02
db $14,$03,'F','r','ü','h','e','r',' ','f','ü','h','l','t','e',' ',$E6,$E5,'e','i','n','-',$0D,$0D,$0D
db $14,$03,'s','a','m',',',' ',$F3,$E6,$B7,'S','o','n','n','e','n','-',$0D,$0D,$0D
db $14,$03,'a','u','f','g','a','n','g',' ','s','a','h',' ',$AB,$D6,$0D,$0D,$0D
db $14,$03,'h','ä','l','t',' ',$E6,'i','h','n',' ',$C9,'s','c','h','ö','n','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; SETPOS $40 $02
; "  So wie ihr Vater das \n\n"
; "  Unmögliche möglich machte \n\n"
; "  glaubt Lisa an ihr Glück." NO_NEWLINE
db $01,$40,$02
db ' ',' ','S','o',' ',$F6,'i','h','r',' ','V','a','t','e','r',' ',$B9,$0D,$0D,$0D
db ' ',' ','U','n','m','ö','g','l','i','c','h','e',' ','m','ö','g','l','i','c','h',' ','m','a','c','h','t','e',' ',$0D,$0D,$0D
db ' ',' ','g','l','a','u','b','t',' ',$94,'a','n',' ','i','h','r',' ','G','l','ü','c','k','.'
db $00
; @ENDSTRING@

; @NEW_TEXT@
; CURSIVE
; SETPOS $58 $03
; "Das Ende" NO_NEWLINE
db $09
db $01,$58,$03
db $8A,'E','n','d','e'
db $00
; @ENDSTRING@
