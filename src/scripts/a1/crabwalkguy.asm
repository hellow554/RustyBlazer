A1_script_crabwalkguy:
    %CopJumpIfSealed(!Lair_A1_Crabwalk_Guy, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.default_talk)
    %CopMakeNpcUnpassable()
    %CopWaitForEventFlagToBeSet(!EV_A1_CrabwalkGuyNoticedUs)
    %Cop8F()
    %CopPlayAnimation(2)
    %Cop82()
    %CopSetScriptAddrToNextInstruction()
    ; --

    LDA.W buttons_pressed
    AND.W #!Key16_R|!Key16_L
    BNE .player_pressed_button
    RTL

.player_pressed_button:
    LDA.W buttons_pressed
    AND.W #$0F00
    BNE .player_moved_with_button
    RTL

.player_moved_with_button:
    %CopAssignTalkCallback(.talk_after_crabwalk)
    RTL

.default_talk
    %CopShowText(.default_text)
    %CopSetEventFlag(!EV_A1_CrabwalkGuyNoticedUs)
    RTL

.talk_after_crabwalk
    %CopShowText(.after_crabwalk_text)
    RTL

.default_text:
; @DEFAULT_TEXTBOX@
; "Hey, Du siehst so aus "
; "als würdest Du den "
; "Krabbenlauf beher-"
; "schen. Versuch`s mal." WFE
; "Du weißt nicht wie?"
; "Drücke einfach während "
; "des Laufens die L- oder "
; "R-Taste." -> Default_Text_End
db $10
db 'H','e','y',',',' ',$83,'s','i','e','h','s','t',' ',$E9,$AD,$0D
db $AF,'w','ü','r','d','e','s','t',' ',$83,$B7,$0D
db 'K','r','a','b','b','e','n','l','a','u','f',' ','b','e','h','e','r','-',$0D
db 's','c','h','e','n','.',' ','V','e','r','s','u','c','h','`','s',' ','m','a','l','.',$11
db $83,'w','e','i','ß','t',' ',$DF,'w','i','e','?',$0D
db 'D','r','ü','c','k','e',' ','e','i','n','f','a','c','h',' ','w','ä','h','r','e','n','d',' ',$0D
db $B8,'L','a','u','f','e','n','s',' ',$B5,'L','-',' ','o','d','e','r',' ',$0D
db 'R','-','T','a','s','t','e','.',$13 : dw Default_Text_End
; @END@

.after_crabwalk_text:
; @DEFAULT_TEXTBOX@
; "Na siehst Du ! Ich "
; "wußte daß Du es "
; "kannst. !" WFE
; "Das wird Dir noch von "
; "Nutzen sein, wenn Du "
; "kämpfst oder Magie "
; "benutzt." -> Default_Text_End
db $10
db 'N','a',' ','s','i','e','h','s','t',' ',$83,'!',' ',$8F,$0D
db 'w','u','ß','t','e',' ',$BA,$83,$C3,$0D
db 'k','a','n','n','s','t','.',' ','!',$11
db $8A,$F7,$84,$E0,$EE,$0D
db 'N','u','t','z','e','n',' ','s','e','i','n',',',' ',$F3,$83,$0D
db 'k','ä','m','p','f','s','t',' ','o','d','e','r',' ',$9A,$0D
db 'b','e','n','u','t','z','t','.',$13 : dw Default_Text_End
; @END@
