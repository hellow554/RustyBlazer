A1_script_sleeping_tulip:
    %CopJumpIfSealed(!Lair_A1_Sleeping_Tulip, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.default_talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $2F, $36, .pushing_tulip)
    RTL

.pushing_tulip:
    %CopLoopStart(40)
    LDA.W buttons_pressed
    AND.W #Key16.Left
    BEQ .stopped_pushing
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $2F, $36, .still_pushing)
    BRL .stopped_pushing

.still_pushing:
    %CopLoopEnd()
    %CopMakeNpcPassable()
    LDA.W #!Key16_All_Directions|Key16.A|Key16.Select
    TSB.W button_mask
    %Cop81($20, $10)
    %Cop83()
    LDA.W #!Key16_All_Directions|Key16.A|Key16.Select
    TRB.W button_mask
    %CopMakeNpcUnpassable()
    %CopJumpIfEventFlagIsSet(!EV_A1_Found_APass, .already_found_pass)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, $2E, $36, .find_pass)
    RTL

.find_pass:
    %CopShowText(.text_find_pass)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(Items.APass)
    %CopSetEventFlag(!EV_A1_Found_APass)
.already_found_pass:
    %CopSetScriptAddrToNextInstruction()
    RTL

.stopped_pushing:
    %Cop27(.pushing_tulip)

.default_talk:
    %CopJumpIfItemIsNotEquipped(Items.DreamRod, ..sleeping)
    %CopShowText(.text_dreamrod)
    %Cop3C(4)
    %CopTeleportPlayerToMap($403, Facing.Down, $78, $70)
    RTL

..sleeping:
    %CopShowText(.text_zzz)
    RTL

.text_zzz:
; @DEFAULT_TEXTBOX@
; "Zzzz...." -> Default_Text_End
db $10
db 'Z','z','z','z','.','.','.','.',$13 : dw Default_Text_End
; @END@

.text_find_pass:
; @DEFAULT_TEXTBOX@
; "Dort ist " * "ein Paß" * "." -> Default_Text_End
db $10
db 'D','o','r','t',' ',$D2,$03,$24,$BE,'P','a','ß',$03,$20,'.',$13 : dw Default_Text_End
; @END@

.text_dreamrod:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME " legt "
; "den Traumstab auf die "
; "Blüten der Tulpe." -> Default_Text_End
db $10
db $02,$02,' ','l','e','g','t',' ',$0D
db $B7,$A4,$AC,$B5,$0D
db 'B','l','ü','t','e','n',' ',$B6,'T','u','l','p','e','.',$13 : dw Default_Text_End
; @END@
