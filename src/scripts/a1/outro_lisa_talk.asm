
CODE_C3C222:
    REP #$20
    LDA.W #$59
    STA.W BG3SC
    STZ.W bg3_horizontal_scroll
    STZ.w bg3_vertical_scroll
    LDA.W #$3FC0 ;!Key16_Menu_Keys
    TSB.W button_mask
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $2F, $29, .reached)
    LDA.W #6
    STA.W text_speed
    SEP #$20
    LDA.B #4
    STA.W TM
    REP #$20
    %CopLoopStart(61) : %CopLoopEnd()
    %CopShowText(.txt_blabla)
    %CopLoopStart(121) : %CopLoopEnd()
    STZ.W $0423
    LDA.W #$20
    STA.W _03B6
    %Cop3C(4)
    %CopTeleportPlayerToMap($D00, Facing.Left, $2F0, $290)
    %CopSetScriptAddrToNextInstruction()
    RTL

.reached:
    %CopSetScriptAddrToNextInstruction()
    %Cop34()
    LDA.W #4
    STA.W text_speed
    %CopLoopStart(61) : %CopLoopEnd()
    %CopShowText(.txt_hey_turbo)
    %CopLoopStart(121) : %CopLoopEnd()
    %CopAC(CODE_C0A9C9, $2F0, $2A0, $40)
    %PlaySound($96)
    %Cop33()
    LDA.W #!Key16_All_ActionButtons&~Key16.Y
    TSB.W button_mask
    %CopLoopStart(31) : %CopLoopEnd()
    %CopLoopStart(2) : {
        LDA.W #Facing.Right
        LDY.W _039E
        STA.W LiveEntities.facing, Y
        %CopJumpAfterNoFramesPassed(+, 16) : +

        LDA.W #Facing.Left
        LDY.W _039E
        STA.W LiveEntities.facing, Y
        %CopJumpAfterNoFramesPassed(+, 16) : +
    } : %CopLoopEnd()

    %CopLoopStart(91) : %CopLoopEnd()
    %CopFlipSpriteVertically()
    %CopPlayAnimation($25)
    %Cop82()
    %CopLoopStart(61) : %CopLoopEnd()
    %Cop32($11)
    %CopLoopStart(61) : %CopLoopEnd()
    %CopShowText(.txt_zzz)
    LDA.W #1
    STA.W text_speed
    %CopShowText(.txt_is_it_you)
    LDA.W #4
    STA.W text_speed
    %CopShowText(.txt_huh)
    %CopLoopStart(91) : %CopLoopEnd()

    %CopShowText(.txt_remember)
    LDA.W #!Key16_All_ActionButtons&~Key16.Y
    TRB.W button_mask
    %CopShowMenu(choice_yes_no, 2, .said_no)

    LDA.W #!Key16_All_ActionButtons&~Key16.Y
    TSB.W button_mask
    LDA.L choice_idx
    BNE .said_no
    %CopShowText(.txt_said_yes)
    BRA .next
.said_no:
    LDA.W #!Key16_All_ActionButtons&~Key16.Y
    TSB.W button_mask
    %CopShowText(.txt_said_no)
.next:
    %CopLoopStart(61) : %CopLoopEnd()
    %CopShowText(.txt_again)
    %CopResetSpriteVertically()
    %CopPlayAnimation($25)
    %Cop82()
    %CopLoopStart(41) : %CopLoopEnd()

    %CopShowText(.txt_come_turbo)
    LDA.W #1
    STA.W text_speed
    %CopShowText(.txt_baa)
    LDA.W #4
    STA.W text_speed
    %CopFlipSpriteVertically()
    %CopPlayAnimation($25)
    %Cop82()
    %CopLoopStart(41) : %CopLoopEnd()

    %CopShowText(.txt_looks_like_turbo)
    LDA.W #$380
    STA.W _0342
    %Cop81($26, 4)
    %Cop83()
    %CopResetSpriteVertically()
    %CopPlayAnimation($25)
    %Cop82()
    %CopLoopStart(31) : %CopLoopEnd()

    %CopShowText(.txt_hurry_up)
    %CopFlipSpriteVertically()
    %CopPlayAnimation($25)
    %Cop82()
    LDY.W _039E
    LDA.W LiveEntities.entity_id, Y
    AND.W #$EFFF
    STA.W LiveEntities.entity_id, Y
    LDA.W #$100
    STA.W inhibit_buttons_readout

    %CopSetEventFlag(!EV_Temporary)
    %CopPlayAnimation($26)
    %Cop82()
    LDA.W #0
    STA.W inhibit_buttons_readout
    %Cop81($26, 2)
    %Cop83()
    LDA.W #$100
    STA.W inhibit_buttons_readout
    %Cop81($26, 8)
    %Cop83()
    %CopJumpAfterNoFramesPassed(+, 330) : +

    LDA.W #0
    STA.W inhibit_buttons_readout
    %CopSetScriptAddr(.c3f0)
    %CopLoopStart(191) : %CopLoopEnd()
    STZ.W LiveEntities._30, X

    %CopLoopStart(32) : {
        SEP #$20
        LDA.W LiveEntities._30, X
        ORA.B #$E0
        STA.L CgData8bpp.CgData.blue
        REP #$20
        INC.W LiveEntities._30, X
        %CopJumpAfterNoFramesPassed(+, 2) : +
    } : %CopLoopEnd()
    %CopSetScriptAddrToNextInstruction()
    RTL

.c3f0:
    LDA.W #2
    TSB.W _03BA
    %CopLoopStart(2) : %CopLoopEnd()
    LDA.W #$FF
    STA.W bg3_horizontal_scroll
    PHX
    LDY.W #Txt_TheEnd
    JSL printOsdStringFromBank2
    PLX
    %CopLoopStart(255) : DEC bg3_horizontal_scroll : %CopLoopEnd()

    %CopSetScriptAddrToNextInstruction()
    RTL

.txt_blabla:
; @DEFAULT_TEXTBOX@
; "Mein Schüler,"
; WAIT 40 "erzähle mir was Dich "
; "beschäftigt."
; WAIT 90 "Ich weiß nicht, was "
; "zwischen Dir und dem "
; "Mädchen passiert ist."
; WAIT 90 "Wie auch immer..für "
; "mich bedeutet es, daß "
; "Du Dich noch nicht als "
; "himmlische Kreatur "
; WAIT 90 "fühlst. Es ist bereits "
; "ein Jahr vergangen,"
; "aber Deine Gefühle zu "
; "ihr haben sich nicht "
; "verändert."
; WAIT 90 "Vielleicht "
; "solltest Du versuchen "
; "als menschliches Lebe-"
; "wesen auf der Erde "
; WAIT 90 "zu leben. Beachte aber "
; "bitte, daß Du alle Er-"
; "innerungen an mich "
; "verlieren wirst,sobald "
; "Du auf der Erde bist."
; WAIT 120
; -> Default_Text_End_Wo_Wfak
db $10
db $98,'S','c','h','ü','l','e','r',',',$0D
db $0E,$28,'e','r','z','ä','h','l','e',' ',$DB,$F9,$85,$0D
db 'b','e','s','c','h','ä','f','t','i','g','t','.',$0D
db $0E,$5A,$8F,'w','e','i','ß',' ','n','i','c','h','t',',',' ',$F9,$0D
db 'z','w','i','s','c','h','e','n',' ',$84,$EB,$BB,$0D
db 'M','ä','d','c','h','e','n',' ','p','a','s','s','i','e','r','t',' ','i','s','t','.',$0D
db $0E,$5A,'W','i','e',' ',$B0,'i','m','m','e','r','.','.',$C9,$0D
db $D9,'b','e','d','e','u','t','e','t',' ','e','s',',',' ',$BA,$0D
db $83,$85,$E0,$DF,$AF,$0D
db 'h','i','m','m','l','i','s','c','h','e',' ','K','r','e','a','t','u','r',' ',$0D
db $0E,$5A,'f','ü','h','l','s','t','.',' ',$8C,$D2,'b','e','r','e','i','t','s',' ',$0D
db $BE,'J','a','h','r',' ','v','e','r','g','a','n','g','e','n',',',$0D
db $AB,'D','e','i','n','e',' ','G','e','f','ü','h','l','e',' ',$FD,$0D
db 'i','h','r',' ',$D0,$E5,$DF,$0D
db 'v','e','r','ä','n','d','e','r','t','.',$0D
db $0E,$5A,$A7,$0D
db 's','o','l','l','t','e','s','t',' ',$83,'v','e','r','s','u','c','h','e','n',' ',$0D
db $AF,'m','e','n','s','c','h','l','i','c','h','e','s',' ','L','e','b','e','-',$0D
db 'w','e','s','e','n',' ',$AC,$B6,'E','r','d','e',' ',$0D
db $0E,$5A,$FD,'l','e','b','e','n','.',' ','B','e','a','c','h','t','e',' ',$AB,$0D
db 'b','i','t','t','e',',',' ',$BA,$83,$AE,'E','r','-',$0D
db 'i','n','n','e','r','u','n','g','e','n',' ','a','n',' ',$D9,$0D
db 'v','e','r','l','i','e','r','e','n',' ','w','i','r','s','t',',','s','o','b','a','l','d',' ',$0D
db $83,$AC,$B6,'E','r','d','e',' ','b','i','s','t','.',$0D
db $0E,$78
db $13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_hey_turbo:
; @DEFAULT_TEXTBOX@
; "Hey," WAIT 40 "Turbo,"
; WAIT 90 "Ich fühle etwas selt-"
; "sames in der Luft."
; WAIT 60 "Was ist nur los mit "
; "mir?"
; WAIT 90 -> Default_Text_End_Wo_Wfak
db $10
db 'H','e','y',',',$0E,$28,'T','u','r','b','o',',',$0D
db $0E,$5A,$8F,'f','ü','h','l','e',' ',$C2,'s','e','l','t','-',$0D
db 's','a','m','e','s',' ',$D3,$B6,'L','u','f','t','.',$0D
db $0E,$3C,'W','a','s',' ',$D2,$E1,'l','o','s',' ',$DA,$0D
db 'm','i','r','?',$0D
db $0E,$5A,$13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_zzz:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME "?" WAIT 90 CONT
db $10
db $02,$02,'?',$0E,$5A,$0C
; @END@

.txt_is_it_you:
; @NEW_TEXT@
; "Bist Du das ?" WAIT 180 CONT
db 'B','i','s','t',' ',$83,$B9,'?',$0E,$B4,$0C
; @END@

.txt_huh:
; @NEW_TEXT@
; "Huch.....!"
; WAIT 90
; "Ich habe gewußt,daß "
; "Du zurückkommen "
; "würdest."
; WAIT 90 -> Default_Text_End_Wo_Wfak
db 'H','u','c','h','.','.','.','.','.','!',$0D
db $0E,$5A
db $8F,$CC,'g','e','w','u','ß','t',',',$BA,$0D
db $83,'z','u','r','ü','c','k','k','o','m','m','e','n',' ',$0D
db 'w','ü','r','d','e','s','t','.',$0D
db $0E,$5A,$13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_remember:
; @DEFAULT_TEXTBOX@
; "Was ist los?"
; WAIT 40 "Erinnerst Du Dich "
; "nicht an mich?" CONT
db $10
db 'W','a','s',' ',$D2,'l','o','s','?',$0D
db $0E,$28,'E','r','i','n','n','e','r','s','t',' ',$83,$85,$0D
db $DF,'a','n',' ','m','i','c','h','?',$0C
; @END@

.txt_said_yes:
; @NEW_TEXT@
; "Nein, ich kann es "
; "nicht glauben."
; WAIT 120 -> .txt_yes_no_common
db 'N','e','i','n',',',' ',$D1,$D7,$C3,$0D
db $DF,'g','l','a','u','b','e','n','.',$0D
db $0E,$78,$13 : dw .txt_yes_no_common
; @END@

.txt_said_no:
; @NEW_TEXT@
; "Es ist okay."
; WAIT 40 "Du brauchst Dir keine "
; "Sorgen zu machen."
; WAIT 60 "Ich kann es an Deinen "
; "Augen ablesen."
; WAIT 90
db $8C,$D2,'o','k','a','y','.',$0D
db $0E,$28,$83,'b','r','a','u','c','h','s','t',' ',$84,$D8,$0D
db 'S','o','r','g','e','n',' ',$FD,'m','a','c','h','e','n','.',$0D
db $0E,$3C,$8F,$D7,$C3,'a','n',' ','D','e','i','n','e','n',' ',$0D
db 'A','u','g','e','n',' ','a','b','l','e','s','e','n','.',$0D
db $0E,$5A
; @END@

.txt_yes_no_common:
; @NEW_TEXT@
; "Ich bin es,"
; "Lisa...."
; WAIT 40 "Die Tochter des Er-"
; "finders Dr.Leo !"
; WAIT 90 "Bitte!"
; WAIT 40 "Erinnerst Du Dich "
; "nicht an mich?"
; WAIT 180 "Nun gut."
; WAIT 90 "Du hast mich noch nie "
; "belogen."
; WAIT 90 "Ich kann nur nicht "
; "glauben, daß Du Dein "
; "gesamtes Gedächtnis "
; "verloren hast."
; WAIT 90 "Okay, ich werde nicht "
; "nochmal fragen."
; WAIT 90 "Ich werde anscheinend "
; "meine Denkweise ändern "
; "müssen."
; WAIT 90 "Wir können uns schöne "
; "und wundervolle Er-"
; "innerungen erschaffen!"
; WAIT 120 -> Default_Text_End_Wo_Wfak
db $8F,$B1,'e','s',',',$0D
db 'L','i','s','a','.','.','.','.',$0D
db $0E,$28,$87,'T','o','c','h','t','e','r',' ',$B8,'E','r','-',$0D
db 'f','i','n','d','e','r','s',' ','D','r','.',$93,'!',$0D
db $0E,$5A,'B','i','t','t','e','!',$0D
db $0E,$28,'E','r','i','n','n','e','r','s','t',' ',$83,$85,$0D
db $DF,'a','n',' ','m','i','c','h','?',$0D
db $0E,$B4,'N','u','n',' ','g','u','t','.',$0D
db $0E,$5A,$83,$CD,$D9,$E0,'n','i','e',' ',$0D
db 'b','e','l','o','g','e','n','.',$0D
db $0E,$5A,$8F,$D7,$E1,$DF,$0D
db 'g','l','a','u','b','e','n',',',' ',$BA,$83,'D','e','i','n',' ',$0D
db 'g','e','s','a','m','t','e','s',' ','G','e','d','ä','c','h','t','n','i','s',' ',$0D
db 'v','e','r','l','o','r','e','n',' ','h','a','s','t','.',$0D
db $0E,$5A,'O','k','a','y',',',' ',$D1,$F2,$DF,$0D
db 'n','o','c','h','m','a','l',' ','f','r','a','g','e','n','.',$0D
db $0E,$5A,$8F,$F2,'a','n','s','c','h','e','i','n','e','n','d',' ',$0D
db $DC,'D','e','n','k','w','e','i','s','e',' ','ä','n','d','e','r','n',' ',$0D
db 'm','ü','s','s','e','n','.',$0D
db $0E,$5A,$AA,'k','ö','n','n','e','n',' ',$ED,'s','c','h','ö','n','e',' ',$0D
db $EB,'w','u','n','d','e','r','v','o','l','l','e',' ','E','r','-',$0D
db 'i','n','n','e','r','u','n','g','e','n',' ','e','r','s','c','h','a','f','f','e','n','!',$0D
db $0E,$78,$13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_again:
; @DEFAULT_TEXTBOX@
; "Also, nochmal von "
; "vorne."
; WAIT 90 "Ich bin Lisa."
; WAIT 90 "Und die Ziege hinter "
; "mir ist Turbo."
; WAIT 90 -> Default_Text_End_Wo_Wfak
db $10
db 'A','l','s','o',',',' ','n','o','c','h','m','a','l',' ',$EE,$0D
db 'v','o','r','n','e','.',$0D
db $0E,$5A,$8F,$B1,'L','i','s','a','.',$0D
db $0E,$5A,'U','n','d',' ',$B5,'Z','i','e','g','e',' ','h','i','n','t','e','r',' ',$0D
db $DB,$D2,'T','u','r','b','o','.',$0D
db $0E,$5A,$13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_come_turbo:
; @DEFAULT_TEXTBOX@
; "Komm` schon Turbo,"
; WAIT 40 "sag` «Guten Tag»."
; WAIT 90 CONT
db $10
db 'K','o','m','m','`',' ',$EA,'T','u','r','b','o',',',$0D
db $0E,$28,'s','a','g','`',' ','«','G','u','t','e','n',' ','T','a','g','»','.',$0D
db $0E,$5A,$0C
; @END@

.txt_baa:
; @DEFAULT_TEXTBOX@
; "Määäääh!"
; WAIT 90 -> Default_Text_End_Wo_Wfak
db $10
db 'M','ä','ä','ä','ä','ä','h','!',$0D
db $0E,$5A,$13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_looks_like_turbo:
; @DEFAULT_TEXTBOX@
; "Sie sieht so aus wie "
; "ein Hund den ich ein-"
; "mal gehabt habe."
; WAIT 90 "Aus diesem Grund heißt "
; "sie Turbo."
; WAIT 90 "Na komm`. Ich werde "
; "Dir die Gegend zeigen."
; WAIT 120 -> Default_Text_End_Wo_Wfak
db $10
db $9F,'s','i','e','h','t',' ',$E9,$AD,$F6,$0D
db $BE,'H','u','n','d',' ',$B7,$D1,'e','i','n','-',$0D
db 'm','a','l',' ','g','e','h','a','b','t',' ','h','a','b','e','.',$0D
db $0E,$5A,'A','u','s',' ','d','i','e','s','e','m',' ','G','r','u','n','d',' ','h','e','i','ß','t',' ',$0D
db $E6,'T','u','r','b','o','.',$0D
db $0E,$5A,'N','a',' ','k','o','m','m','`','.',' ',$8F,$F2,$0D
db $84,$B5,'G','e','g','e','n','d',' ','z','e','i','g','e','n','.',$0D
db $0E,$78,$13 : dw Default_Text_End_Wo_Wfak
; @END@

.txt_hurry_up:
; @DEFAULT_TEXTBOX@
; "Beeil dich Turbo!" WAIT 120 -> Default_Text_End_Wo_Wfak
db $10
db 'B','e','e','i','l',' ','d','i','c','h',' ','T','u','r','b','o','!',$0E,$78,$13 : dw Default_Text_End_Wo_Wfak
; @END@

CODE_C3C8CF:
    %CopJumpIfEventFlagIsSet(!EV_Temporary, .flag_set)
    %CopPlayAnimation($24)
    %Cop82()
    BRA CODE_C3C8CF
.flag_set:
    %Cop81($1B, 4)
    %Cop83()
    %CopPlayAnimation($24)
    %Cop82()
    %Cop81($1B, 8)
    %Cop83()
    %CopSetScriptAddrToNextInstruction()
    RTL
