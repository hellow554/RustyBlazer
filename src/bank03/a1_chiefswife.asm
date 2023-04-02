A1_chiefswife_script:
    %CopJumpIfSealed($02, +)
    RTL

+:
    %CopJumpIfRevealing($02, .revealTalk)
    %CopJumpIfSealed($09, .villageChiefRevealed)
    %CopAssignTalkCallback(.defaultTalk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.villageChiefRevealed:
    %CopJumpIfEventFlagIsUnset($1F02|$8000, .bla)
    %CopAssignTalkCallback(.bla2)
    %CopTeleportNpcTo(!NPC_ChiefsWife, 59, 30)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.bla:
    COP #$86
    RTL

.defaultTalk:
    %CopJumpIfEventFlagIsUnset(!EV_A1_ChiefsWifeAsk|$8000, .alreadyAsked)
    %CopShowText(.aMyHusband)
    %CopShowMenu(choiceYesNo, 2, .sayNo)
    LDA.L choiceNumber&$00FFFF ; not sure what and why they did here
    BNE .sayNo ; if it is not 0, e.g. 1 -> no
    %CopSetEvent(!EV_A1_ChiefsWifeAsk)

    %CopShowText(.aSaidYes)
    BRL +

.sayNo:
    %CopShowText(.aSaidNo)
    RTL

.alreadyAsked:
    %CopShowText(.aTextProgression1)

+:
    %CopRestoreToFullHealth()
    RTL

.revealTalk:
    %CopShowText(.aRevealText)
    COP #$86
    RTL

.bla2:
    %CopJumpIfItemNotObtained(!itemVipCard, +)
    %CopShowText(.aAfterSoldiersTookLisa)
    RTL
+:
    %CopShowText(.aLisaRevealed)
    RTL


.aMyHusband:
    db $10, "My husband ", $EC, $E2, $A1, $0D
    db $E1, $EF, "Chief. ", $11
    db "One day he suddenly ", $0D
    db "disappeared along with", $0D
    db $E1, "other villagers. ", $11
    db $88, "feel so lonely.... ", $0D
    db "How ", $99, "being ", $CC, "of", $0D
    db $C2, "children? ", $0C

.aSaidNo:
    db "Well, ", $0D, "that`"
    db $D7
    db "too bad. ", $13, $88
    db $B9

.aSaidYes:
    db "Really?! ", $0D
    db $88, $F1, "call ", $FE, $0D
    db $02,$02, " ", $AD, "now on. ", $11
    db "Use ", $E1, "second floor ", $0D
    db "as ", $FF, "own room. "
    db $13
    dw aClearTextboxAndEnd

.aTextProgression1:
    db $10, $02, $02, ", ", $0D
    db $FE, $98, $BC, "walking ", $0D
    db $9B, "doing nothing. ", $11

    db $88, $9D, "beginning ", $E2, $0D
    db "worry ", $99, "you. ", $0D
    db "Please, stay ", $B9, $96, $0D
    db "rest. "
    db $13
    dw aClearTextboxAndEnd

.aLisaRevealed:
    db $10, $88, "feel bad ", $AE, "Li"
    db "sa, ", $0D, "having been sepa"
    db "rated ", $0D, $AD, "her parents. "
    db $13, $88, $B9

.aAfterSoldiersTookLisa:
    db $10, $02, $02, "! ", $11
    db "Soldiers ", $AD, $8D, $0D
    db $FD, $BC, "here! ", $0D
    db "They kidnapped Lisa! ", $0D
    db $95, "must rescue her! "
    db $13
    dw aClearTextboxAndEnd

.aRevealText
    db $10, $95, "hear ", $97, "sigh coming", $0D
    db $AD, "inside ", $E1, "house."
    db $13
    dw aClearTextboxAndEnd
