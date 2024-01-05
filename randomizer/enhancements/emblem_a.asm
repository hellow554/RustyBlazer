; in the original game the Emblem A spot only get's spawned if you talked to the watermillkeeper.
; we patch the game so it always spawns

; not sure how to do yet


EmbledA_Script:
    %CopBranchIfNpcHasReachedXY($00, 47, 50, .findEmbledA)
    RTL

.findEmbledA:
    %CopJumpIfEventFlagIsUnset(!EV_A1_PickedEmblemAUp|$8000, $8763)
    %CopShowText(.embledAFindText)
    %PlaySound(!Sound_ReceiveItem)
    %CopGiveItem(!itemEmblemA)
    %CopSetEventFlag(!EV_A1_PickedEmblemAUp)
    %CopSetScriptAddrToNextInstruction()
    RTL


.embledAFindText:
    db $10,$92,$BA,$03,$24,$E1,$4D,$61,$73,$74,$65
    db $72,$60,$D7,$0D,$45,$6D,$62,$6C,$65,$6D,$20,$41,$2E,$20,$03,$20
    db $13,$88,$B9
