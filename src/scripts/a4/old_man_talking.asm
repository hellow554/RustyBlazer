A4_script_old_man_talking:
    %CopJumpIfSealed(!Lair_A4_OldManTalking, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk_callback)
    %CopMakeNpcUnpassable()
    ; TODO: the event flag is wrong, but it must be 0?!
    %CopWaitForEventFlagToBeSet(!EV_A1_CrabwalkGuyNoticedUs)
    %CopMakeNpcPassable()
    %CopRemoveTalkCallback()
    %CopResetSpriteVertically()
    %Cop81(17, 2)
    %Cop83()
    %Cop81(16, 2)
    %Cop83()
    %Cop81(17, 6)
    %Cop83()
    %Cop81(16, 3)
    %Cop83()
    %CopFlipSpriteVertically()
    %CopPlayAnimation($E)
    %Cop82()
    %CopAssignTalkCallback(.talk_wrong_place)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEntityHasReachedXY(!Entity_Player, 10, 7, .talk_table)
    RTL

.talk_table:
    %CopShowText(.txt_table)
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk_callback:
    %CopShowText(.txt_first_talk)
    %CopSetEventFlag(0)
    RTL

.talk_wrong_place:
    %CopShowText(.txt_wrong_place)
    RTL

.txt_first_talk:
; @DEFAULT_TEXTBOX@
; "So, so, es ist selten "
; "hier jemand neues zu "
; "sehen. Komm` doch in "
; "mein Zimmer." -> ACT4_CLEARBOX
db $10
db 'S','o',',',' ','s','o',',',' ',$C3,$D2,'s','e','l','t','e','n',' ',$0D
db $CE,'j','e','m','a','n','d',' ','n','e','u','e','s',' ',$FD,$0D
db 's','e','h','e','n','.',' ','K','o','m','m','`',' ','d','o','c','h',' ',$D3,$0D
db 'm','e','i','n',' ','Z','i','m','m','e','r','.',$13 : dw ACT4_CLEARBOX
; @END@
.txt_wrong_place:
; @DEFAULT_TEXTBOX@
; "Setz` Dich hier vor "
; "mich." -> ACT4_CLEARBOX
db $10
db 'S','e','t','z','`',' ',$85,$CE,'v','o','r',' ',$0D
db 'm','i','c','h','.',$13 : dw ACT4_CLEARBOX
; @END@
.txt_table:
; @DEFAULT_TEXTBOX@
; "Ich habe so viele "
; "Fragen über mensch-"
; "liche Lebewesen." WFE
; "Wollen wir das aus-"
; "diskutieren?" -> ACT4_CLEARBOX
db $10
db $8F,$CC,$E9,$EF,$0D
db 'F','r','a','g','e','n',' ','ü','b','e','r',' ','m','e','n','s','c','h','-',$0D
db 'l','i','c','h','e',' ','L','e','b','e','w','e','s','e','n','.',$11
db 'W','o','l','l','e','n',' ','w','i','r',' ',$B9,'a','u','s','-',$0D
db 'd','i','s','k','u','t','i','e','r','e','n','?',$13 : dw ACT4_CLEARBOX
; @END@
