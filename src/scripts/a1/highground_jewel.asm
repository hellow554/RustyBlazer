A1_script_highground_jewel:
    JSL.L CODE_C3C040
    %CopAssignTalkCallback(.talk)
    SEP #$20
    LDA.B #$83
    PHA
    REP #$20
    LDA.W #$C05A
    PHA
    RTL

.talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_HighgroundJewelTalked, .already_talked)
    %CopShowText(Text_Jewel_Give_Exp)
    %CopGiveNormalExp($80)
    %CopSetEventFlag(!EV_A1_HighgroundJewelTalked)
    RTL

.already_talked:
    %CopShowText(Text_Wish_Luck)
    RTL



A1_script_highground_jewel_message:
    JSL.L CODE_C3C040
    %CopAssignTalkCallback(.talk)

.loop:
    %CopJumpIfSealed(!Lair_A1_Highground_Jewel, .lair_sealed)
    %CopPlayAnimation(!Anim_Village_Woman_Facing_Up)
    %Cop82()
    BRA .loop

.lair_sealed:
    %CopJumpIfEventFlagIsSet(!EV_A1_JewelSomething, .already_set)
    %CopSetEventFlag(!EV_A1_JewelSomething)
    LDA.W $16, X
    AND.W #$FFEF
    STA.W $16, X
    %CopShowText(.text_reveal)

.already_set:
    LDA.W $16, X
    ORA.W #$10
    STA.W $16, X
    SEP #$20
    LDA.B #$83
    PHA
    REP #$20
    LDA.W #TEMP_LOCRET
    PHA
    RTL

.text_reveal:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME NEWLINE
; "hört eine leise "
; "Stimme aus dem Juwel "
; "in der ↗ Ecke." WFE
; "Komm` hier rüber." -> Default_Text_End
db $10
db $02,$02,$0D
db 'h','ö','r','t',' ',$BF,'l','e','i','s','e',' ',$0D
db $A0,$AD,$BB,'J','u','w','e','l',' ',$0D
db $D3,$B6,'↗',' ','E','c','k','e','.',$11
db 'K','o','m','m','`',' ',$CE,'r','ü','b','e','r','.',$13 : dw Default_Text_End
; @END@

.text_advice:
; @DEFAULT_TEXTBOX@
; "Ich werde Dir einige "
; "Ratschläge geben." WFE
; "Vergiß nie, die Dinge "
; "welche Du gesammelt "
; "hast, Deiner Ausrüst-"
; "ung hinzuzufügen." WFE
; -> Text_Player_Gets_Exp
db $10
db $8F,$F2,$84,'e','i','n','i','g','e',' ',$0D
db 'R','a','t','s','c','h','l','ä','g','e',' ','g','e','b','e','n','.',$11
db 'V','e','r','g','i','ß',' ','n','i','e',',',' ',$B5,'D','i','n','g','e',' ',$0D
db $FB,$83,'g','e','s','a','m','m','e','l','t',' ',$0D
db 'h','a','s','t',',',' ','D','e','i','n','e','r',' ','A','u','s','r','ü','s','t','-',$0D
db 'u','n','g',' ','h','i','n','z','u','z','u','f','ü','g','e','n','.',$11
db $13 : dw Text_Player_Gets_Exp
; @END@


.talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_HighGroundJewelAppeared, Jewel_Return_to_GrassValley)
    %CopShowText(.text_advice)
    %CopGiveNormalExp($30)
    %CopSetEventFlag(!EV_A1_HighGroundJewelAppeared)