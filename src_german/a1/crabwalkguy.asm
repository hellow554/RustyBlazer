
A1_script_crabwalkguy:
    %CopJumpIfSealed(!Lair_A1_Crabwalk_Guy, +)
    RTL
+
    %Cop85(CODE_C0A9C9)
    %CopAssignTalkCallback(.default_talk)
    %CopMakeNpcUnpassable()
    %CopWaitForEventFlagToBeSet(!EV_A1_CrabwalkGuyNoticedUs)
    %Cop8F()
    %Cop80(2)
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
; @TEXTBOX@
; "Hey, Du siehst so aus"
; "als würdest Du den"
; "Krabbenlauf beher-"
; "schen. Versuch`s mal." WFE
; "Du weißt nicht wie?"
; "Drücke einfach während "
; "des Laufens die L- oder "
; "R-Taste." -> Default_Text_End
db $10
db $48, $65, $79, $2C, $20, $83, $73, $69, $65, $68, $73, $74, $20, $E9, $AD, $0D
db $AF, $77, $5B, $72, $64, $65, $73, $74, $20, $83, $B7, $0D
db $4B, $72, $61, $62, $62, $65, $6E, $6C, $61, $75, $66, $20, $62, $65, $68, $65, $72, $2D, $0D
db $73, $63, $68, $65, $6E, $2E, $20, $56, $65, $72, $73, $75, $63, $68, $60, $73, $20, $6D, $61, $6C, $2E, $11
db $83, $77, $65, $69, $25, $74, $20, $DF, $77, $69, $65, $3F, $0D
db $44, $72, $5B, $63, $6B, $65, $20, $65, $69, $6E, $66, $61, $63, $68, $20, $77, $7B, $68, $72, $65, $6E, $64, $20, $0D
db $B8, $4C, $61, $75, $66, $65, $6E, $73, $20, $B5, $4C, $2D, $20, $6F, $64, $65, $72, $20, $0D
db $52, $2D, $54, $61, $73, $74, $65, $2E : db $13 : dw Default_Text_End
; @END@

.after_crabwalk_text:
; @TEXTBOX@
; "Na siehst Du ! Ich"
; "wußte daß Du es"
; "kannst. !" WFE
; "Das wird Dir noch von"
; "Nutzen sein, wenn Du"
; "kämpfst oder Magie"
; "benutzt." -> Default_Text_End
db $10
db $4E, $61, $20, $73, $69, $65, $68, $73, $74, $20, $83, $21, $20, $8F, $0D
db $77, $75, $25, $74, $65, $20, $BA, $83, $C3, $0D
db $6B, $61, $6E, $6E, $73, $74, $2E, $20, $21, $11
db $8A, $F7, $84, $E0, $EE, $0D
db $4E, $75, $74, $7A, $65, $6E, $20, $73, $65, $69, $6E, $2C, $20, $F3, $83, $0D
db $6B, $7B, $6D, $70, $66, $73, $74, $20, $6F, $64, $65, $72, $20, $9A, $0D
db $62, $65, $6E, $75, $74, $7A, $74, $2E : db $13 : dw Default_Text_End
; @END@
