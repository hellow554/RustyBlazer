A1_script_bridge_guard:
    %CopJumpIfSealed(!Lair_A1_Bridge_Guard, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
;---
    %CopJumpIfEventFlagIsSet(!EV_A1_Talked_To_Bridge_Guard, +)
    %CopAssignTalkCallback(.talk_first_talk)
    RTL

+
    %CopAssignTalkCallback(.talk_after_move)
.already_talked:
    %Cop0C(!Entity_Player, $04, .inside)
    %CopJumpIfEventFlagIsSet(!EV_A1_BridgeGuard_GotOutOfWay, .talk_guard_moved)
    %CopJumpDependingOnPlayerXProximity(0, .too_left, .inside, .too_right)

.too_left:
    %Cop97()
    BRL +
.too_right:
    %Cop96()
+
    %Cop80($02)
    %Cop82()
    BRL .todo3

.talk_guard_moved:
    %CopMakeNpcPassable()
    %Cop9D($04)
    %Cop9E(+)
+
    %CopMakeNpcUnpassable()
    %CopClearEventFlag(!EV_A1_BridgeGuard_GotOutOfWay)
    BRL .todo3

.inside:
    %CopJumpIfEventFlagIsSet(!EV_A1_BridgeGuard_GotOutOfWay, .todo4)
    %CopMakeNpcPassable()
    %Cop9D($03)
    %Cop9E(+)
+
    %Cop80($01)
    %Cop82()
    %CopMakeNpcUnpassable()
    %CopSetEventFlag(!EV_A1_BridgeGuard_GotOutOfWay)
    BRL .todo3

.todo4:
    %Cop80($01)
    %Cop82()

.todo3:
    %Cop27(.already_talked)

.talk_first_talk:
    %CopShowText(.text_first_talk)
    %CopSetEventFlag(!EV_A1_Talked_To_Bridge_Guard)
    RTL

.talk_after_move:
    %CopShowText(.text_next)
    RTL

.text_first_talk:
; @TEXTBOX@
; "Ich bin der Wächter "
; "dieser Brücke." WFE
; "Ich glaube nicht, daß"
; "es nötig ist so eine"
; "kleine Brücke zu be-"
;; My current parser is not smart enough for the following one.
;; Let's help him out
; "wachen.\x83darfst durch." NO_NEWLINE
; -> Default_Text_End
db $10
db $8F, $B1, $B6, $57, $7B, $63, $68, $74, $65, $72, $20, $0D
db $BD, $42, $72, $5B, $63, $6B, $65, $2E, $11
db $8F, $67, $6C, $61, $75, $62, $65, $20, $6E, $69, $63, $68, $74, $2C, $20, $BA, $0D
db $C3, $6E, $2A, $74, $69, $67, $20, $D2, $E9, $BF, $0D
db $6B, $6C, $65, $69, $6E, $65, $20, $42, $72, $5B, $63, $6B, $65, $20, $FD, $62, $65, $2D, $0D
db $77, $61, $63, $68, $65, $6E, $2E, $83, $64, $61, $72, $66, $73, $74, $20, $64, $75, $72, $63, $68, $2E
db $13 : dw Default_Text_End
; @END@

.text_next
; @TEXTBOX@
; "Du darfst die Brücke "
; "überqueren." -> Default_Text_End
db $10
db $83, $64, $61, $72, $66, $73, $74, $20, $B5, $42, $72, $5B, $63, $6B, $65, $20, $0D
db $5B, $62, $65, $72, $71, $75, $65, $72, $65, $6E, $2E, $13 : dw Default_Text_End
; @END@
