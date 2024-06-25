A1_script_magician:
    %CopJumpIfSealed(!Lair_A1_Magician, +) : RTL : +    
    %CopAdjustNpcXPosition(8)
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talkback)
    %CopMakeNpcUnpassable()
    ; because the magician is moved in between two blocks, we need to block both,
    ; so the player cannot escape our little trap ;)
    %CopAddBlockRelativeToNpc($10, $0)
    %CopWaitForEventFlagToBeSet(!EV_A1_MagicianTalk)
    %CopMakeNpcPassable()
    %CopRemoveBlockRelativeToNpc($10, 0)
    %CopSetScriptAddr(CODE_C0A9C9)
    %Cop86()
    RTL

.talkback:
    %CopShowText(.txt1)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!FlameBall)
    %CopShowText(.txt2)
    SEP #$20
    LDA.B #1
    STA.W player_souls
    REP #$20
    %CopSetEventFlag(!EV_A1_MagicianTalk)
    %PlaySound(!Sound_SomebodyAppears)
    RTL

.txt1:
; @DEFAULT_TEXTBOX@
; "Ich habe früher auch "
; "über den Wolken ge-"
; "wohnt, genau wie Du." WFE
; "Jetzt lebe ich auf der "
; "Erde und weit weg vom "
; "Meister." WFE
; "Alle Kreaturen, die "
; "Deathtoll gefangen hat, "
; "sind in Monsterhöhlen "
; "festgehalten." WFE
; "So wie Du mich befreit "
; "hast, mußt Du auch all "
; "die anderen befreien." WFE
; "Sogar die Befreiung "
; "eines kleinen Baumes "
; "oder Kreatur kann Dir "
; "bei Deiner Aufgabe " WFE
; "behilflich sein."
; "Hier, nimm dies." WFE
; PLAYER_NAME " erhielt "
; "\x03\x24" "die Magie des Flammen "
; "Ball\x03\x20." WFE
; CONT
db $10
db $8F,$CC,'f','r','ü','h','e','r',' ',$B0,$0D
db 'ü','b','e','r',' ',$B7,'W','o','l','k','e','n',' ','g','e','-',$0D
db 'w','o','h','n','t',',',' ','g','e','n','a','u',' ',$F6,'D','u','.',$11
db 'J','e','t','z','t',' ','l','e','b','e',' ',$D1,$AC,$B6,$0D
db 'E','r','d','e',' ',$EB,'w','e','i','t',' ','w','e','g',' ',$F1,$0D
db 'M','e','i','s','t','e','r','.',$11
db 'A','l','l','e',' ','K','r','e','a','t','u','r','e','n',',',' ',$B5,$0D
db $86,'g','e','f','a','n','g','e','n',' ','h','a','t',',',' ',$0D
db $E7,$D3,'M','o','n','s','t','e','r','h','ö','h','l','e','n',' ',$0D
db 'f','e','s','t','g','e','h','a','l','t','e','n','.',$11
db 'S','o',' ',$F6,$83,$D9,'b','e','f','r','e','i','t',' ',$0D
db 'h','a','s','t',',',' ','m','u','ß','t',' ',$83,$B0,'a','l','l',' ',$0D
db $B5,'a','n','d','e','r','e','n',' ','b','e','f','r','e','i','e','n','.',$11
db 'S','o','g','a','r',' ',$B5,'B','e','f','r','e','i','u','n','g',' ',$0D
db $C5,'k','l','e','i','n','e','n',' ','B','a','u','m','e','s',' ',$0D
db 'o','d','e','r',' ','K','r','e','a','t','u','r',' ',$D7,$84,$0D
db 'b','e','i',' ','D','e','i','n','e','r',' ','A','u','f','g','a','b','e',' ',$11
db 'b','e','h','i','l','f','l','i','c','h',' ','s','e','i','n','.',$0D
db 'H','i','e','r',',',' ','n','i','m','m',' ','d','i','e','s','.',$11
db $02,$02,' ',$C1,$0D
db $03,$24,$B5,$9A,$B8,'F','l','a','m','m','e','n',' ',$0D
db 'B','a','l','l',$03,$20,'.',$11
db $0C
; @END@

.txt2:
; @DEFAULT_TEXTBOX@
; "Jetzt werde ich Dich "
; "begleiten. Ich bin ein "
; "Magier,also kann ich "
; "alle Arten von Magie " WFE
; "verwenden. Ich werde "
; "meine Fähigkeiten be-"
; "nutzen, um Dir zu "
; "helfen." WFE
; "Achte aber immer da-"
; "rauf, daß ich genügend "
; "JUWELEN habe, um meine "
; "Magie zu benutzen." WFE
; "Als Du mich befreit "
; "hast, hinterließen "
; "die Monster ein paar "
; "goldene Steine." WFE
; "So sehen JUWELEN aus."
; "Laß uns zusammen die "
; "Welt wiederbeleben!" WFE
; "Wir müssen zum Tempel "
; "in Grass Valley gehen." -> Default_Text_End
db $10
db 'J','e','t','z','t',' ',$F2,$D1,$85,$0D
db 'b','e','g','l','e','i','t','e','n','.',' ',$8F,$B1,$BE,$0D
db 'M','a','g','i','e','r',',','a','l','s','o',' ',$D7,$D1,$0D
db $AE,'A','r','t','e','n',' ',$EE,$9A,$11
db 'v','e','r','w','e','n','d','e','n','.',' ',$8F,$F2,$0D
db $DC,'F','ä','h','i','g','k','e','i','t','e','n',' ','b','e','-',$0D
db 'n','u','t','z','e','n',',',' ',$EC,$84,$FD,$0D
db 'h','e','l','f','e','n','.',$11
db 'A','c','h','t','e',' ',$AB,$D4,'d','a','-',$0D
db 'r','a','u','f',',',' ',$BA,$D1,'g','e','n','ü','g','e','n','d',' ',$0D
db 'J','U','W','E','L','E','N',' ','h','a','b','e',',',' ',$EC,$DC,$0D
db $9A,$FD,'b','e','n','u','t','z','e','n','.',$11
db 'A','l','s',' ',$83,$D9,'b','e','f','r','e','i','t',' ',$0D
db 'h','a','s','t',',',' ','h','i','n','t','e','r','l','i','e','ß','e','n',' ',$0D
db $B5,$95,$BE,$E4,$0D
db 'g','o','l','d','e','n','e',' ','S','t','e','i','n','e','.',$11
db 'S','o',' ','s','e','h','e','n',' ','J','U','W','E','L','E','N',' ','a','u','s','.',$0D
db 'L','a','ß',' ',$ED,$FF,$B5,$0D
db $A9,'w','i','e','d','e','r','b','e','l','e','b','e','n','!',$11
db $AA,'m','ü','s','s','e','n',' ',$FE,'T','e','m','p','e','l',' ',$0D
db $D3,'G','r','a','s','s',' ','V','a','l','l','e','y',' ','g','e','h','e','n','.',$13 : dw Default_Text_End
; @END@
