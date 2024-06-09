A1_script_old_man_goat:
    %CopJumpIfSealed(!Lair_A1_OldManGoat, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    %CopPlayAnimation(!Anim_Village_Goat_Eating_And_Blinking)
    %Cop82()
    RTL

.talk:
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Ich weiß nicht, ob es "
; "so etwas wie Reinkar-"
; "nation gibt." WFE
; "Auch wenn ich nicht "
; "mit meinem Mann reden "
; "kann, so genieße ich "
; "seine Anwesenheit." -> Default_Text_End
db $10
db $8F,$77,$65,$69,$25,$20,$6E,$69,$63,$68,$74,$2C,$20,$6F,$62,$20,$C3,$0D
db $E9,$C2,$F6,$52,$65,$69,$6E,$6B,$61,$72,$2D,$0D
db $6E,$61,$74,$69,$6F,$6E,$20,$67,$69,$62,$74,$2E,$11
db $41,$75,$63,$68,$20,$F3,$D1,$DF,$0D
db $DA,$DD,$4D,$61,$6E,$6E,$20,$72,$65,$64,$65,$6E,$20,$0D
db $6B,$61,$6E,$6E,$2C,$20,$E9,$67,$65,$6E,$69,$65,$25,$65,$20,$D1,$0D
db $73,$65,$69,$6E,$65,$20,$41,$6E,$77,$65,$73,$65,$6E,$68,$65,$69,$74,$2E,$13 : dw Default_Text_End
; @END@
