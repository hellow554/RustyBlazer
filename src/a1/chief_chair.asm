A1_script_chief_chair:
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfSealed(!Lair_A1_Chief, .chief_released)
    %CopPlayAnimation(!Anim_Village_Chief_Chair)
    %Cop82()
    RTL

.chief_released:
    %Cop86()
    RTL

.talk:
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Dies ist das Zimmer "
; "des Bürgermeisters. Er "
; "saß hier stundenlang "
; "und hat nachgedacht." WFE
; "Ich frage mich, wann "
; "er zurückkommen wird."
; -> Default_Text_End
db $10
db $89,$D2,$B9,$5A,$69,$6D,$6D,$65,$72,$20,$0D
db $B8,$42,$5B,$72,$67,$65,$72,$6D,$65,$69,$73,$74,$65,$72,$73,$2E,$20,$45,$72,$20,$0D
db $73,$61,$25,$20,$CE,$73,$74,$75,$6E,$64,$65,$6E,$6C,$61,$6E,$67,$20,$0D
db $EB,$CF,$6E,$61,$63,$68,$67,$65,$64,$61,$63,$68,$74,$2E,$11
db $8F,$66,$72,$61,$67,$65,$20,$6D,$69,$63,$68,$2C,$20,$77,$61,$6E,$6E,$20,$0D
db $C8,$7A,$75,$72,$5B,$63,$6B,$6B,$6F,$6D,$6D,$65,$6E,$20,$77,$69,$72,$64,$2E,$0D
db $13 : dw Default_Text_End
; @END@
