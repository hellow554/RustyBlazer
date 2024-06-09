A4_script_husband_of_witch:
    %CopJumpIfSealed(!Lair_A4_HusbandOfWitch, + ) : RTL : +
    %CopAssignTalkCallback(.talkback)
    %CopJumpIfSealed(!Lair_A4_Witch, +)
    LDA.W $16, X : AND.W #$FFF7 : STA.W $16, X
+:
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.talkback:
    %CopShowText(.txt)
    RTL

.txt:
; @DEFAULT_TEXTBOX@
; "Meine Frau konnte "
; "früher Magie benutzen." -> ACT4_CLEARBOX
db $10
db $4D,$65,$69,$6E,$65,$20,$46,$72,$61,$75,$20,$6B,$6F,$6E,$6E,$74,$65,$20,$0D
db $66,$72,$5B,$68,$65,$72,$20,$9A,$62,$65,$6E,$75,$74,$7A,$65,$6E,$2E,$13 : dw ACT4_CLEARBOX
; @END@

