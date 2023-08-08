A1_script_Architect:
    %CopJumpIfSealed(!Lair_A1_Architect, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk:
    %CopJumpIfEventFlagIsUnset($0107, .first_talk)
    %CopJumpIfEventFlagIsUnset($0003, .wall_done)
.first_talk:
    %CopShowText(.txt_default)
    %CopSetEventFlag($0107)
    %CopSetEventFlag($0003)
    RTL
.wall_done:
    %CopShowText(.txt_wall_done)
    RTL

.txt_default:
; @DEFAULT_TEXTBOX@
; "Mein Name ist Frank."
; "Ich bin Architekt." WFE
; "Ich habe alle Häuser "
; "in der Stadt gebaut."
; "Komm` später nochmal "
; "vorbei, dann zeige " WFE
; "ich Dir etwas." -> Default_Text_End
db $10
db $98,$4E,$61,$6D,$65,$20,$D2,$46,$72,$61,$6E,$6B,$2E,$0D
db $8F,$B1,$41,$72,$63,$68,$69,$74,$65,$6B,$74,$2E,$11
db $8F,$CC,$AE,$48,$7B,$75,$73,$65,$72,$20,$0D
db $D3,$B6,$53,$74,$61,$64,$74,$20,$67,$65,$62,$61,$75,$74,$2E,$0D
db $4B,$6F,$6D,$6D,$60,$20,$73,$70,$7B,$74,$65,$72,$20,$6E,$6F,$63,$68,$6D,$61,$6C,$20,$0D
db $76,$6F,$72,$62,$65,$69,$2C,$20,$64,$61,$6E,$6E,$20,$7A,$65,$69,$67,$65,$20,$11
db $D1,$84,$65,$74,$77,$61,$73,$2E,$13 : dw Default_Text_End
; @END@

.txt_wall_done:
; @DEFAULT_TEXTBOX@
; "Was hälst Du von "
; "dieser Mauer ? Ich bin "
; "als schneller Maurer "
; "bekannt!" -> Default_Text_End
db $10
db $57,$61,$73,$20,$68,$7B,$6C,$73,$74,$20,$83,$EE,$0D
db $BD,$4D,$61,$75,$65,$72,$20,$3F,$20,$8F,$B1,$0D
db $AF,$73,$63,$68,$6E,$65,$6C,$6C,$65,$72,$20,$4D,$61,$75,$72,$65,$72,$20,$0D
db $62,$65,$6B,$61,$6E,$6E,$74,$21,$13 : dw Default_Text_End
; @END@
