A1_script_lisas_dream:
    %CopJumpIfSealed($10, +) : RTL : +
    %CopJumpIfEventFlagIsSet(!EV_A1_SOMETHING_WITH_LISA_AND_CHIEFS_WIFE, .game_done_lisa_asks)
    %CopAssignTalkCallback(.talk_callback_before_seal)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    ;
    %CopJumpIfSealed(!Lair_A1_LisasDreamLair, +) : RTL : +
    ; the lair has been sealed by stepping on it, show the message box now
    %CopShowText(.txt_leos_talk)
    LDA.W #!Key16_All_Directions | !Key16_A | !Key16_Select
    TSB.W button_mask
    %Cop81($21, 2)
    %Cop83()
    %CopPlayAnimation($22)
    %Cop82()
    LDA.W #!Key16_All_Directions | !Key16_A | !Key16_Select
    TRB.W button_mask
    %CopShowText(.txt_lisa_answers_daddy)
    %CopAssignTalkCallback(.talk_callback_after_seal)
    %CopSetScriptAddrToNextInstruction()
    ;
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $12, $35, +) : RTL : +
    %CopPlayAnimation($1F)
    %Cop82()
    %CopSetScriptAddrToNextInstruction()
    ;
    RTL

.game_done_lisa_asks:
    LDA.W #!Key16_All_Directions | !Key16_A | !Key16_X | !Key16_Start | !Key16_Select | !Key16_B
    TSB.W button_mask
    %CopAdjustNpcXPosition($18)
    %CopLoopStart($29) : %CopLoopEnd()
    %CopShowText(.txt_lisa_asks_for_promise)

    LDA.W #!Key16_All_Directions | !Key16_A | !Key16_X | !Key16_Start | !Key16_Select | !Key16_B
    TRB.W button_mask
    %CopShowMenu(choice_yes, 1, +) : +

    LDA.W #!Key16_All_Directions | !Key16_A | !Key16_X | !Key16_Start | !Key16_Select | !Key16_B
    TSB.W button_mask
    %CopShowText(.txt_danke)
    %CopLoopStart($B5) : %CopLoopEnd()

    %CopSetEventFlag(!EV_A1_MadePromiseToLIsa)
    LDA.W #3
    STA.W _031E
    %Cop3C(4)
    %CopTeleportPlayerToMap($101, !Facing_Up, $3B0, $1D8)
    LDA.W #!Key16_All_Directions | !Key16_A | !Key16_X | !Key16_Start | !Key16_Select | !Key16_B
    TRB.W button_mask
    %CopSetScriptAddrToNextInstruction()
    ;
    RTL

.talk_callback_before_seal:
    %CopShowText(.txt_where_daddy)
    RTL

.talk_callback_after_seal:
    %CopShowText(.txt_who_are_u)
    %CopSetEventFlag(!EV_A1_TulipBeforeHouseSecondTalk)
    %Cop3C(4)
    %CopTeleportPlayerToMap($101, !Facing_Right, $3B0, $1E0)
    RTL

.txt_xxx:
; @DEFAULT_TEXTBOX@
; "Ich träume."
; -> Default_Text_End
db $10
db $8F,'t','r','ä','u','m','e','.',$0D
db $13 : dw Default_Text_End
; @END@

.txt_where_daddy:
; @DEFAULT_TEXTBOX@
; "Papa, wo bist Du?!" -> Default_Text_End
db $10
db 'P','a','p','a',',',' ','w','o',' ',$B4,'D','u','?','!',$13 : dw Default_Text_End
; @END@

.txt_leos_talk:
; @DEFAULT_TEXTBOX@
; "Eine traurige Stimme "
; "erklingt von irgendwo-"
; "her." WFE
; "«Lisa, du mußt alles "
; "was du weißt der Per-"
; "son vor Dir erzählen." WFE
; "Sie wird außerdem auch "
; "meinen Farbpinsel be-"
; "nötigen, um weiter zu "
; "kommen.» " -> Default_Text_End
db $10
db 'E','i','n','e',' ','t','r','a','u','r','i','g','e',' ',$A0,$0D
db 'e','r','k','l','i','n','g','t',' ',$EE,'i','r','g','e','n','d','w','o','-',$0D
db 'h','e','r','.',$11
db '«','L','i','s','a',',',' ','d','u',' ','m','u','ß','t',' ','a','l','l','e','s',' ',$0D
db $F9,'d','u',' ','w','e','i','ß','t',' ',$B6,'P','e','r','-',$0D
db 's','o','n',' ','v','o','r',' ',$84,'e','r','z','ä','h','l','e','n','.',$11
db $9F,$F7,'a','u','ß','e','r','d','e','m',' ',$B0,$0D
db 'm','e','i','n','e','n',' ','F','a','r','b','p','i','n','s','e','l',' ','b','e','-',$0D
db 'n','ö','t','i','g','e','n',',',' ',$EC,'w','e','i','t','e','r',' ',$FD,$0D
db 'k','o','m','m','e','n','.','»',' ',$13 : dw Default_Text_End
; @END@

.txt_lisa_answers_daddy:
; @DEFAULT_TEXTBOX@
; "Papa! Bist du es?" WFE
; "Wo bist du Papa?! Ich "
; "vermisse Dich so sehr." WFE
; "\x0f" "Es kam keine Antwort." -> Default_Text_End
db $10
db 'P','a','p','a','!',' ','B','i','s','t',' ','d','u',' ','e','s','?',$11
db 'W','o',' ',$B4,'d','u',' ','P','a','p','a','?','!',' ',$8F,$0D
db 'v','e','r','m','i','s','s','e',' ',$85,$E9,'s','e','h','r','.',$11
db $0F,$8C,'k','a','m',' ',$D8,'A','n','t','w','o','r','t','.',$13 : dw Default_Text_End
; @END@

.txt_who_are_u:
; @DEFAULT_TEXTBOX@
; "Wer bist du?"
; "Was tue ich hier?" -> Default_Text_End
db $10
db 'W','e','r',' ',$B4,'d','u','?',$0D
db 'W','a','s',' ','t','u','e',' ',$D1,'h','i','e','r','?',$13 : dw Default_Text_End
; @END@

.txt_lisa_asks_for_promise:
; @DEFAULT_TEXTBOX@
; "\x0f" PLAYER_NAME ","
; WAIT 60
; "Ich habe gedacht ich "
; "würde Dich hier tref-"
; "fen."
; WAIT 120
; "Ich bin so allein."
; WAIT 30
; "Ich weiß, daß ich "
; "mich im Laufe der Zeit "
; "nicht mehr so einsam "
; "fühlen werde."
; WAIT 90
; "Mein Vater hat mir "
; "immer erzählt, daß der "
; "Schlüssel zum Glück in "
; "der Ruhe zu finden ist "
; WAIT 90
; "und nicht in der Hast."
; "Ich weiß nicht, ob Du "
; "ein Mensch oder ein "
; "Engel bist, aber ich "
; WAIT 90
; "muß Dich um einen Ge-"
; "fallen bitten."
; WAIT 90
; "Ich werde Dich nicht "
; "fragen, ob Du bei mir "
; WAIT 90
; "bleiben willst,ver-"
; "spreche mir nur, daß "
; "Du eines Tages zurück-"
; "kehren wirst."
; WAIT 90
; "Du könntest mir jetzt "
; "etwas vorlügen, aber "
; WAIT 30
; "ich habe das Gefühl,"
; "daß unser Versprechen "
; "mir Hoffnung für die "
; "Zukunft gibt."
; WAIT 90
; "Bitte!" WAIT 40 NEWLINE
; "Bitte versprich` mir,"
; "daß Du eines Tages zu-"
; "rückkehren wirst." CONT
db $10
db $0F,$02,$02,',',$0D
db $0E,$3C
db $8F,$CC,'g','e','d','a','c','h','t',' ',$D1,$0D
db 'w','ü','r','d','e',' ',$85,$CE,'t','r','e','f','-',$0D
db 'f','e','n','.',$0D
db $0E,$78
db $8F,$B1,$E9,'a','l','l','e','i','n','.',$0D
db $0E,$1E
db $8F,'w','e','i','ß',',',' ',$BA,$D1,$0D
db $D9,$D5,'L','a','u','f','e',' ',$B6,'Z','e','i','t',' ',$0D
db $DF,'m','e','h','r',' ',$E9,'e','i','n','s','a','m',' ',$0D
db 'f','ü','h','l','e','n',' ','w','e','r','d','e','.',$0D
db $0E,$5A
db $98,'V','a','t','e','r',' ',$CF,$DB,$0D
db $D4,'e','r','z','ä','h','l','t',',',' ',$BA,$B6,$0D
db $A1,$FE,'G','l','ü','c','k',' ',$D3,$0D
db $B6,'R','u','h','e',' ',$FD,'f','i','n','d','e','n',' ',$D2,$0D
db $0E,$5A
db $EB,$DF,$D3,$B6,'H','a','s','t','.',$0D
db $8F,'w','e','i','ß',' ','n','i','c','h','t',',',' ','o','b',' ',$83,$0D
db $BE,'M','e','n','s','c','h',' ','o','d','e','r',' ',$BE,$0D
db 'E','n','g','e','l',' ','b','i','s','t',',',' ',$AB,$D1,$0D
db $0E,$5A
db 'm','u','ß',' ',$85,$EC,$C0,'G','e','-',$0D
db 'f','a','l','l','e','n',' ','b','i','t','t','e','n','.',$0D
db $0E,$5A
db $8F,$F2,$85,$DF,$0D
db 'f','r','a','g','e','n',',',' ','o','b',' ',$83,'b','e','i',' ',$DB,$0D
db $0E,$5A
db 'b','l','e','i','b','e','n',' ','w','i','l','l','s','t',',','v','e','r','-',$0D
db 's','p','r','e','c','h','e',' ',$DB,'n','u','r',',',' ',$BA,$0D
db $83,$C5,$A6,'z','u','r','ü','c','k','-',$0D
db 'k','e','h','r','e','n',' ','w','i','r','s','t','.',$0D
db $0E,$5A
db $83,'k','ö','n','n','t','e','s','t',' ',$DB,$D6,$0D
db $C2,'v','o','r','l','ü','g','e','n',',',' ',$AB,$0D
db $0E,$1E
db $D1,$CC,$B9,'G','e','f','ü','h','l',',',$0D
db $BA,'u','n','s','e','r',' ','V','e','r','s','p','r','e','c','h','e','n',' ',$0D
db $DB,'H','o','f','f','n','u','n','g',' ',$C9,$B5,$0D
db 'Z','u','k','u','n','f','t',' ','g','i','b','t','.',$0D
db $0E,$5A
db 'B','i','t','t','e','!',$0E,$28,$0D
db $81,'v','e','r','s','p','r','i','c','h','`',' ','m','i','r',',',$0D
db $BA,$83,$C5,$A6,'z','u','-',$0D
db 'r','ü','c','k','k','e','h','r','e','n',' ','w','i','r','s','t','.',$0C
; @END@

.txt_danke:
; @NEW_TEXT@
; "\x0fDanke!"
; WAIT 90
; "Ich wünschte,daß "
; "dieser Traum nie zu "
; "Ende gehen würde." NO_NEWLINE
; WAIT 120
; -> Default_Text_End+1
db $0F,'D','a','n','k','e','!',$0D
db $0E,$5A
db $8F,'w','ü','n','s','c','h','t','e',',',$BA,$0D
db $BD,$A5,'n','i','e',' ',$FD,$0D
db 'E','n','d','e',' ','g','e','h','e','n',' ','w','ü','r','d','e','.'
db $0E,$78
db $13 : dw Default_Text_End+1
; @END@
