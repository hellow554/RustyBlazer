A1_script_Tulip_Before_Painter_House:
    %CopJumpIfSealed($18, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()


.moving_loop:
    %CopPlayAnimation(!Anim_Village_Tulip_Left_Right)
    %Cop82()
    BRA .moving_loop

.talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_TulipBeforeHouseSecondTalk, .second_talk)
    %CopShowText(.txt_first_talk)
    RTL
.second_talk:
    %CopShowText(.txt_second_talk)
    RTL

.txt_first_talk:
; @DEFAULT_TEXTBOX@
; "Ich frage mich, wer die "
; "Grenze zwischen Traum "
; "und Realität gezogen "
; "hat." WFE
; "Manchmal passiert es,"
; "daß Dinge die im Traum "
; "passieren auch die "
; "Wirklichkeit verändern " -> Default_Text_End
db $10
db $8F,'f','r','a','g','e',' ','m','i','c','h',',',' ','w','e','r',' ',$B5,$0D
db 'G','r','e','n','z','e',' ','z','w','i','s','c','h','e','n',' ',$A5,$0D
db $EB,'R','e','a','l','i','t','ä','t',' ','g','e','z','o','g','e','n',' ',$0D
db 'h','a','t','.',$11
db 'M','a','n','c','h','m','a','l',' ','p','a','s','s','i','e','r','t',' ','e','s',',',$0D
db $BA,'D','i','n','g','e',' ',$B5,$D5,$A5,$0D
db 'p','a','s','s','i','e','r','e','n',' ',$B0,$B5,$0D
db 'W','i','r','k','l','i','c','h','k','e','i','t',' ','v','e','r','ä','n','d','e','r','n',' ',$13 : dw Default_Text_End
; @END@

.txt_second_talk:
; @DEFAULT_TEXTBOX@
; "Du erinnerst Dich an "
; "Lisa`s Traum, oder?"
; "Bist Du schon an den "
; "Ort zurückgekehrt?" WFE
; "Dinge könnten sich "
; "verändert haben, und "
; "nun anders aussehen." -> Default_Text_End
db $10
db $83,'e','r','i','n','n','e','r','s','t',' ',$85,'a','n',' ',$0D
db 'L','i','s','a','`','s',' ','T','r','a','u','m',',',' ','o','d','e','r','?',$0D
db 'B','i','s','t',' ',$83,$EA,'a','n',' ',$B7,$0D
db 'O','r','t',' ','z','u','r','ü','c','k','g','e','k','e','h','r','t','?',$11
db 'D','i','n','g','e',' ','k','ö','n','n','t','e','n',' ',$E5,$0D
db 'v','e','r','ä','n','d','e','r','t',' ','h','a','b','e','n',',',' ',$EB,$0D
db 'n','u','n',' ','a','n','d','e','r','s',' ','a','u','s','s','e','h','e','n','.',$13 : dw Default_Text_End
; @END@
