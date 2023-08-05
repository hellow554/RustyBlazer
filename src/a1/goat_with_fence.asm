A1_script_GoatWithFence:
    %CopJumpIfSealed(!Lair_A1_xxx, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAC(.herbs_on_the_ground, 0, $10, $2000)
    %CopAssignTalkCallback(.talk)

.loop:
    %Cop81($1B, $02)
    %Cop83()
    %CopMakeNpcUnpassable()
    %Cop81($24, $04)
    %Cop83()
    %CopMakeNpcPassable()
    %Cop87()
    BRL .loop

.herbs_on_the_ground:
    %CopJumpIfEventFlagIsSet(!EV_A1_FoundHerbsOnTheGround, .herbs_found)
    %CopBranchIfEntityHasReachedXY(!Entity_Player, $34, $2C, .find_herbs)
    RTL
.find_herbs:
    %CopShowText(.text_hk)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!MedicalHerb)
    %CopSetEventFlag(!EV_A1_FoundHerbsOnTheGround)
.herbs_found:
    COP #$86
    RTL

.talk:
    %CopJumpIfSealed(!Lair_A1_Lisa, +)
    %CopShowText(.text_default)
    RTL
+
    %CopShowText(.text_after_lisa)
    RTL

.text_default:
; @TEXTBOX@
; "Ich frage mich, warum "
; "die Menschen in so "
; "kleinen Häusern "
; "wohnen." WFE
; "Hälst Du es für "
; "möglich, daß der "
; "Bürgermeister in eines" WFE
; "der Gemälde in dem "
; "Haus oben auf "
; "dem Hügel "
; "hineingezogen wurde ?" -> Default_Text_End
db $10
db $8F, $66, $72, $61, $67, $65, $20, $6D, $69, $63, $68, $2C, $20, $77, $61, $72, $75, $6D, $20, $0D
db $B5, $97, $D3, $E9, $0D
db $6B, $6C, $65, $69, $6E, $65, $6E, $20, $48, $7B, $75, $73, $65, $72, $6E, $20, $0D
db $77, $6F, $68, $6E, $65, $6E, $2E, $11
db $48, $7B, $6C, $73, $74, $20, $83, $C3, $C9, $0D
db $6D, $2A, $67, $6C, $69, $63, $68, $2C, $20, $BA, $B6, $0D
db $42, $5B, $72, $67, $65, $72, $6D, $65, $69, $73, $74, $65, $72, $20, $D3, $C5, $11
db $B6, $47, $65, $6D, $7B, $6C, $64, $65, $20, $D3, $BB, $0D
db $48, $61, $75, $73, $20, $6F, $62, $65, $6E, $20, $AC, $0D
db $BB, $48, $5B, $67, $65, $6C, $20, $0D
db $68, $69, $6E, $65, $69, $6E, $67, $65, $7A, $6F, $67, $65, $6E, $20, $F8, $3F, $13 : dw Default_Text_End
; @END@

.text_after_lisa:
; @TEXTBOX@
; "Ich frage mich, warum "
; "die Menschen in so "
; "kleinen Häusern "
; "wohnen." WFE
; "Hälst Du es für mög-"
; "lich, daß der Bürger-"
; "meister von den Toten "
; "zurückgekehrt ist ?" -> Default_Text_End
db $10
db $8F, $66, $72, $61, $67, $65, $20, $6D, $69, $63, $68, $2C, $20, $77, $61, $72, $75, $6D, $20, $0D
db $B5, $97, $D3, $E9, $0D
db $6B, $6C, $65, $69, $6E, $65, $6E, $20, $48, $7B, $75, $73, $65, $72, $6E, $20, $0D
db $77, $6F, $68, $6E, $65, $6E, $2E, $11
db $48, $7B, $6C, $73, $74, $20, $83, $C3, $C9, $6D, $2A, $67, $2D, $0D
db $6C, $69, $63, $68, $2C, $20, $BA, $B6, $42, $5B, $72, $67, $65, $72, $2D, $0D
db $6D, $65, $69, $73, $74, $65, $72, $20, $EE, $B7, $54, $6F, $74, $65, $6E, $20, $0D
db $7A, $75, $72, $5B, $63, $6B, $67, $65, $6B, $65, $68, $72, $74, $20, $D2, $3F, $13 : dw Default_Text_End
; @END@

.text_hk:
; @TEXTBOX@
; "Da sind" *"Heilkräuter \n"*
; "am Rande des Zaunes." -> Default_Text_End
db $10
db $44, $61, $20, $E7, $03, $24, $8E, $0D, $03, $20
db $61, $6D, $20, $52, $61, $6E, $64, $65, $20, $B8, $5A, $61, $75, $6E, $65, $73, $2E, $13 : dw Default_Text_End
; @END@
