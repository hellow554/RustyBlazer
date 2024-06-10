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
db 'M','e','i','n','e',' ','F','r','a','u',' ','k','o','n','n','t','e',' ',$0D
db 'f','r','ü','h','e','r',' ',$9A,'b','e','n','u','t','z','e','n','.',$13 : dw ACT4_CLEARBOX
; @END@
