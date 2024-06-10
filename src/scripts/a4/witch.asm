A4_script_witch:
    %Cop3B(!Lair_A4_Witch, .revealed)
    %CopAssignTalkCallback(A4_script_unreleased_soul)
    SEP #$20
    LDA.B #$80
    PHA
    REP #$20
    LDA.W #Ax_Script_locret
    PHA
    RTL
.revealed:
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.something:
    %CopB2(CODE_C0A9C9, 0, $10, $40)
    %PlaySound($4E)
    LDY.W $039E
    LDA.W #$100
    STA.W 0, Y
    %CopLoopStart(225) : %CopLoopEnd()
    %PlaySound($4E)
    LDY.W $039E
    LDA.W #$20
    STA.W 0, Y
    LDA.W #$1A0
    STA.W 2, Y
    %CopShowText(.txt_after_teleport)
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk:
    %CopShowText(.txt_before_teleport)
    %Cop27(.something)

.txt_before_teleport:
; @DEFAULT_TEXTBOX@
; "Oh Schatz, ich kann "
; "immer noch Magie be-"
; "nutzen." WFE
; "Schau!" -> ACT4_CLEARBOX
db $10
db 'O','h',' ','S','c','h','a','t','z',',',' ',$D1,$D7,$0D
db $D4,$E0,$9A,'b','e','-',$0D
db 'n','u','t','z','e','n','.',$11
db 'S','c','h','a','u','!',$13 : dw ACT4_CLEARBOX
; @END@

.txt_after_teleport:
; @DEFAULT_TEXTBOX@
; "Siehst Du?" -> ACT4_CLEARBOX
db $10
db 'S','i','e','h','s','t',' ','D','u','?',$13 : dw ACT4_CLEARBOX
; @END@