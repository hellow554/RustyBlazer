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
    %CopResetSpriteVertically()
    BRL +
.too_right:
    %CopFlipSpriteVertically()
+
    %CopPlayAnimation(Animation.VillageManFacingLeft)
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
    %CopPlayAnimation(Animation.VillageManFacingUp)
    %Cop82()
    %CopMakeNpcUnpassable()
    %CopSetEventFlag(!EV_A1_BridgeGuard_GotOutOfWay)
    BRL .todo3

.todo4:
    %CopPlayAnimation(Animation.VillageManFacingUp)
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
; @DEFAULT_TEXTBOX@
; "Ich bin der Wächter "
; "dieser Brücke." WFE
; "Ich glaube nicht, daß "
; "es nötig ist so eine "
; "kleine Brücke zu be-"
; "wachen.Du darfst durch." -> Default_Text_End
db $10
db $8F,$B1,$B6,'W','ä','c','h','t','e','r',' ',$0D
db $BD,'B','r','ü','c','k','e','.',$11
db $8F,'g','l','a','u','b','e',' ','n','i','c','h','t',',',' ',$BA,$0D
db $C3,'n','ö','t','i','g',' ',$D2,$E9,$BF,$0D
db 'k','l','e','i','n','e',' ','B','r','ü','c','k','e',' ',$FD,'b','e','-',$0D
db 'w','a','c','h','e','n','.',$83,'d','a','r','f','s','t',' ','d','u','r','c','h','.',$13 : dw Default_Text_End
; @END@

.text_next
; @DEFAULT_TEXTBOX@
; "Du darfst die Brücke "
; "überqueren." -> Default_Text_End
db $10
db $83,'d','a','r','f','s','t',' ',$B5,'B','r','ü','c','k','e',' ',$0D
db 'ü','b','e','r','q','u','e','r','e','n','.',$13 : dw Default_Text_End
; @END@
