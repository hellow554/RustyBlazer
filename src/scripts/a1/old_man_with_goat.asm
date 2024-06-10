A1_script_old_man_with_goat:
    %CopJumpIfSealed(!Lair_A1_OldManWithGoat, +) : RTL : +
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk:  
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Nachdem ich meine "
; "Frau an den Folgen "
; "einer Krankheit ver-"
; "loren habe, fiel " WFE
; "mir eine Ziege auf,"
; "die sich am Haus "
; "aufhielt. Ich war so "
; "einsam, daß ich mich " WFE
; "dazu entschloß sie "
; "zu behalten." -> Default_Text_End
db $10
db 'N','a','c','h','d','e','m',' ',$D1,$DC,$0D
db 'F','r','a','u',' ','a','n',' ',$B7,'F','o','l','g','e','n',' ',$0D
db $C6,'K','r','a','n','k','h','e','i','t',' ','v','e','r','-',$0D
db 'l','o','r','e','n',' ','h','a','b','e',',',' ','f','i','e','l',' ',$11
db $DB,$BF,'Z','i','e','g','e',' ','a','u','f',',',$0D
db $B5,$E5,'a','m',' ','H','a','u','s',' ',$0D
db 'a','u','f','h','i','e','l','t','.',' ',$8F,$FC,$E9,$0D
db 'e','i','n','s','a','m',',',' ',$BA,$D1,$D9,$11
db 'd','a','z','u',' ','e','n','t','s','c','h','l','o','ß',' ',$E6,$0D
db $FD,'b','e','h','a','l','t','e','n','.',$13 : dw Default_Text_End
; @END@
