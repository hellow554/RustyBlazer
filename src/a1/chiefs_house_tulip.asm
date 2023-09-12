A1_script_chiefs_house_tulip:
    %CopJumpIfSealed(!Lair_A1_Chiefs_House_Tulip, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Chiefs_House_Tulip, .revealing)
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()

.loop:
    %CopPlayAnimation(!Anim_Village_Tulip_Left_Right)
    %Cop82()
    BRA .loop

.talk:
    %CopJumpIfSealed(!Lair_A1_Chief, .lisa_sealed)
    %CopShowText(.text_lisa_revealed)
    RTL

.lisa_sealed:
    %CopShowText(.text_default)
.revealing:
    %CopShowText(.text_revealing)
    RTL

.text_lisa_revealed:
; @DEFAULT_TEXTBOX@
; "Es gab hier einmal "
; "eine Wassermühle bevor "
; "die Stadt zerstört "
; "wurde." WFE
; "Ich habe gehört, es "
; "gibt einen Mann der "
; "den Aufzug im unterir-"
; "dischen Schloß bedient" -> Default_Text_End
db $10
db $8C,$67,$61,$62,$20,$CE,$C4,$0D
db $BF,$57,$61,$73,$73,$65,$72,$6D,$5B,$68,$6C,$65,$20,$62,$65,$76,$6F,$72,$20,$0D
db $B5,$53,$74,$61,$64,$74,$20,$7A,$65,$72,$73,$74,$2A,$72,$74,$20,$0D
db $77,$75,$72,$64,$65,$2E,$11
db $8F,$CC,$67,$65,$68,$2A,$72,$74,$2C,$20,$C3,$0D
db $CB,$C0,$4D,$61,$6E,$6E,$20,$B6,$0D
db $B7,$41,$75,$66,$7A,$75,$67,$20,$D5,$75,$6E,$74,$65,$72,$69,$72,$2D,$0D
db $64,$69,$73,$63,$68,$65,$6E,$20,$9E,$62,$65,$64,$69,$65,$6E,$74,$13 : dw Default_Text_End
; @END@

.text_revealing:
; @DEFAULT_TEXTBOX@
; WAIT 60
; PLAYER_NAME " hört "
; "eine sehr leise Stimme. " WFE
; -> .text_lisa_revealed+1
db $10
db $0E,60
db $02,$02,$20,$68,$2A,$72,$74,$20,$0D
db $BF,$E8,$6C,$65,$69,$73,$65,$20,$53,$74,$69,$6D,$6D,$65,$2E,$20,$11
db $13 : dw .text_lisa_revealed+1
; @END@

.text_default:
; @DEFAULT_TEXTBOX@
; "Der Bürgermeister "
; "spricht jeden Morgen "
; "mit mir." WFE
; "Auch wenn ich nicht "
; "sprechen kann, so ver-"
; "ständige ich mich mit "
; "ihm durch Telepathie." -> Default_Text_End
db $10
db $88,$42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$20,$0D
db $73,$70,$72,$69,$63,$68,$74,$20,$6A,$65,$64,$65,$6E,$20,$4D,$6F,$72,$67,$65,$6E,$20,$0D
db $DA,$6D,$69,$72,$2E,$11
db $41,$75,$63,$68,$20,$F3,$D1,$DF,$0D
db $73,$70,$72,$65,$63,$68,$65,$6E,$20,$6B,$61,$6E,$6E,$2C,$20,$E9,$76,$65,$72,$2D,$0D
db $73,$74,$7B,$6E,$64,$69,$67,$65,$20,$D1,$D9,$DA,$0D
db $69,$68,$6D,$20,$64,$75,$72,$63,$68,$20,$54,$65,$6C,$65,$70,$61,$74,$68,$69,$65,$2E,$13 : dw Default_Text_End
; @END@
