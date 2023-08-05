A1_script_chiefs_wife:
    %CopJumpIfSealed(!Lair_A1_Chiefs_Wife, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Chiefs_Wife, .revealing)
    %CopJumpIfSealed(!Lair_A1_Lisa, .lisaRevealed)
    %CopAssignTalkCallback(.default_talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.lisaRevealed:
    %CopJumpIfEventFlagIsSet(!EV_A1_SOMETHING_WITH_LISA_AND_CHIEFS_WIFE, +)
    %CopAssignTalkCallback(.lisa_revealed_talk)
    %CopTeleportEntityTo(!Entity_ChiefsWife, $3B, $1E)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

+:
    %Cop86()
    RTL

.default_talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_ChiefsWifeAsk, .already_said_yes)
    %CopShowText(.first_talk)
    %CopShowMenu(choice_yes_no, 2, .said_no)
    LDA.L choice_idx
    BNE .said_no
    %CopSetEventFlag(!EV_A1_ChiefsWifeAsk)
    %CopShowText(.text_said_yes)
    BRL +

.said_no:
    %CopShowText(.text_said_no)
    RTL

.already_said_yes:
    %CopShowText(.text_after_saying_yes)
+:
    %CopRestoreToFullHealth()
    RTL

.revealing:
    %CopShowText(.text_revealing)
    %Cop86()
    RTL

.lisa_revealed_talk:
    %CopJumpIfItemNotObtained(!VipCard, .lisa_here)
    %CopShowText(.text_lisa_hijacked)
    RTL
.lisa_here
    %CopShowText(.text_lisa_here)
    RTL

.first_talk:
; @TEXTBOX@
; "Mein Mann war einmal"
; "der Bürgermeister "
; "dieser Stadt." WFE
; "Eines Tages verschwand "
; "er auf mysteriöse "
; "Weise, zusammen mit"
; "den anderen Bewohnern." WFE
; "Ich fühle mich so ein-"
; "sam..." WFE
; "Wie wär`s, wenn Du"
; "eines meiner Kinder "
; "wärst ?" CONT
db $10
db $98, $4D, $61, $6E, $6E, $20, $FC, $C4, $0D
db $B6, $42, $5B, $72, $67, $65, $72, $6D, $65, $69, $73, $74, $65, $72, $20, $0D
db $BD, $53, $74, $61, $64, $74, $2E, $11
db $45, $69, $6E, $65, $73, $20, $A6, $76, $65, $72, $73, $63, $68, $77, $61, $6E, $64, $20, $0D
db $C8, $AC, $6D, $79, $73, $74, $65, $72, $69, $2A, $73, $65, $20, $0D
db $57, $65, $69, $73, $65, $2C, $20, $FF, $DA, $0D
db $B7, $61, $6E, $64, $65, $72, $65, $6E, $20, $42, $65, $77, $6F, $68, $6E, $65, $72, $6E, $2E, $11
db $8F, $66, $5B, $68, $6C, $65, $20, $D9, $E9, $65, $69, $6E, $2D, $0D
db $73, $61, $6D, $2E, $2E, $2E, $11
db $57, $69, $65, $20, $77, $7B, $72, $60, $73, $2C, $20, $F3, $83, $0D
db $C5, $DE, $4B, $69, $6E, $64, $65, $72, $20, $0D
db $77, $7B, $72, $73, $74, $20, $3F, $0C
; @END@

.text_said_no:
; @TEXTCONT@
; "Nun,"
; "das ist schade." -> Default_Text_End
db $4E, $75, $6E, $2C, $0D
db $B9, $D2, $73, $63, $68, $61, $64, $65, $2E, $13 : dw Default_Text_End
; @END@

.text_said_yes:
; @TEXTCONT@
; "Wirklich?!"
; "Ich werde Dich von nun "
; "an "
; PLAYER_NAME " nennen." WFE
; "Benutze das Zimmer "
; "im zweiten Stock als"
; "Dein eigenes." -> Default_Text_End
db $57, $69, $72, $6B, $6C, $69, $63, $68, $3F, $21, $0D
db $8F, $F2, $85, $EE, $6E, $75, $6E, $20, $0D
db $61, $6E, $20, $0D
db $02, $02, $20, $6E, $65, $6E, $6E, $65, $6E, $2E, $11
db $42, $65, $6E, $75, $74, $7A, $65, $20, $B9, $5A, $69, $6D, $6D, $65, $72, $20, $0D
db $D5, $7A, $77, $65, $69, $74, $65, $6E, $20, $53, $74, $6F, $63, $6B, $20, $AF, $0D
db $44, $65, $69, $6E, $20, $65, $69, $67, $65, $6E, $65, $73, $2E, $13 : dw Default_Text_End
; @END@

.text_after_saying_yes:
; @TEXTBOX@
; PLAYER_NAME ","
; "Du läufst nur herum "
; "und tust gar nichts." WFE
; "Langsam fange ich an "
; "mir Sorgen zu machen."
; "Bleib` bitte hier, und"
; "ruhe Dich aus." -> Default_Text_End
db $10
db $02, $02, $2C, $0D
db $83, $6C, $7B, $75, $66, $73, $74, $20, $E1, $68, $65, $72, $75, $6D, $20, $0D
db $EB, $74, $75, $73, $74, $20, $67, $61, $72, $20, $6E, $69, $63, $68, $74, $73, $2E, $11
db $4C, $61, $6E, $67, $73, $61, $6D, $20, $66, $61, $6E, $67, $65, $20, $D1, $61, $6E, $20, $0D
db $DB, $53, $6F, $72, $67, $65, $6E, $20, $FD, $6D, $61, $63, $68, $65, $6E, $2E, $0D
db $42, $6C, $65, $69, $62, $60, $20, $B2, $68, $69, $65, $72, $2C, $20, $EB, $0D
db $72, $75, $68, $65, $20, $85, $61, $75, $73, $2E, $13 : dw Default_Text_End
; @END@

.text_lisa_here:
; @TEXTBOX@
; "Das Lisa von ihren "
; "Eltern getrennt ist,"
; "tut mir leid." -> Default_Text_End
db $10
db $8A, $94, $EE, $69, $68, $72, $65, $6E, $20, $0D
db $45, $6C, $74, $65, $72, $6E, $20, $67, $65, $74, $72, $65, $6E, $6E, $74, $20, $69, $73, $74, $2C, $0D
db $74, $75, $74, $20, $DB, $6C, $65, $69, $64, $2E, $13 : dw Default_Text_End
; @END@

.text_lisa_hijacked:
; @TEXTBOX@
; PLAYER_NAME "!" WFE
; "Magridd`s Soldaten "
; "waren gerade hier, und"
; "haben Lisa entführt."
; "Du mußt sie retten !" -> Default_Text_End
db $10
db $02, $02, $21, $11
db $4D, $61, $67, $72, $69, $64, $64, $60, $73, $20, $53, $6F, $6C, $64, $61, $74, $65, $6E, $20, $0D
db $77, $61, $72, $65, $6E, $20, $67, $65, $72, $61, $64, $65, $20, $68, $69, $65, $72, $2C, $20, $EB, $0D
db $D0, $94, $65, $6E, $74, $66, $5B, $68, $72, $74, $2E, $0D
db $83, $6D, $75, $25, $74, $20, $E6, $72, $65, $74, $74, $65, $6E, $20, $21, $13 : dw Default_Text_End
; @END@

.text_revealing:
; @TEXTBOX@
; "Du hörst einen Seufzer "
; "aus dem Haus heraus." -> Default_Text_End
db $10
db $83, $68, $2A, $72, $73, $74, $20, $C0, $53, $65, $75, $66, $7A, $65, $72, $20, $0D
db $AD, $BB, $48, $61, $75, $73, $20, $68, $65, $72, $61, $75, $73, $2E, $13 : dw Default_Text_End
; @END@
