A1_script_highground_jewel:
    JSL.L CODE_83C040
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
    JSL.L CODE_83C040
    %CopAssignTalkCallback(.talk)

.loop:
    %CopJumpIfSealed(!Lair_A1_Highground_Jewel, .lair_sealed)
    %Cop80($07)
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
db $68,$2A,$72,$74,$20,$BF,$6C,$65,$69,$73,$65,$20,$0D
db $A0,$AD,$BB,$4A,$75,$77,$65,$6C,$20,$0D
db $D3,$B6,$5D,$20,$45,$63,$6B,$65,$2E,$11
db $4B,$6F,$6D,$6D,$60,$20,$CE,$72,$5B,$62,$65,$72,$2E,$13 : dw Default_Text_End
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
db $8F,$F2,$84,$65,$69,$6E,$69,$67,$65,$20,$0D
db $52,$61,$74,$73,$63,$68,$6C,$7B,$67,$65,$20,$67,$65,$62,$65,$6E,$2E,$11
db $56,$65,$72,$67,$69,$25,$20,$6E,$69,$65,$2C,$20,$B5,$44,$69,$6E,$67,$65,$20,$0D
db $FB,$83,$67,$65,$73,$61,$6D,$6D,$65,$6C,$74,$20,$0D
db $68,$61,$73,$74,$2C,$20,$44,$65,$69,$6E,$65,$72,$20,$41,$75,$73,$72,$5B,$73,$74,$2D,$0D
db $75,$6E,$67,$20,$68,$69,$6E,$7A,$75,$7A,$75,$66,$5B,$67,$65,$6E,$2E,$11
db $13 : dw Text_Player_Gets_Exp
; @END@


.talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_HighGroundJewelAppeared, Jewel_Return_to_GrassValley)
    %CopShowText(.text_advice)
    %CopGiveNormalExp($30)
    %CopSetEventFlag(!EV_A1_HighGroundJewelAppeared)
