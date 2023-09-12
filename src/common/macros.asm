macro CopNop()
    COP #$00
endmacro

macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopYesNoChoice(noptr)
    COP #$02
    dw <noptr>
endmacro

macro CopLoop(times)
    COP #$03
    db <times>
endmacro

macro CopLoopEnd()
    COP #$04
endmacro

macro CopWaitForEventFlagToBeSet(eventId)
    assert <eventId>&$FF<8, "Second byte must be less than 8"
    assert <eventId><$8000, "EventId must be less than $8000"
    COP #$05
    dw <eventId>
endmacro

; I'm not sure if this is ever used
macro CopJump(addr)
    COP #$06
    dw <addr>
endmacro

macro CopJumpIfEventFlagIsUnset(eventId, addr)
    assert <eventId>&$FF<8, "Second byte must be less than 8"
    assert <eventId><$8000, "EventId must be less than $8000"
    COP #$07
    dw <eventId>
    dw <addr>
endmacro

macro CopJumpIfEventFlagIsSet(eventId, addr)
    assert <eventId>&$FF<8, "Second byte must be less than 8"
    assert <eventId><$8000, "EventId must be less than $8000"
    COP #$07
    dw <eventId>|$8000
    dw <addr>
endmacro

; Not sure why this exists... let's see if we need it
; macro CopJumpIfEventFlagIsSet(eventId, addr)
;     assert <eventId>&$FF<8, "Second byte must be less than 8"
;     COP #$08
;     dw <eventId>
;     dw <addr>
; endmacro

macro CopSetEventFlag(eventId)
    assert <eventId>&$FF<8, "Second byte must be less than 8"
    assert <eventId><$8000, "EventId must be less than $8000"
    COP #$09
    dw <eventId>|$8000
endmacro

macro CopClearEventFlag(eventId)
    assert <eventId>&$FF<8, "Second byte must be less than 8"
    assert <eventId><$8000, "EventId must be less than $8000"
    COP #$09
    dw <eventId>
endmacro

macro CopGiveItem(itemId)
    COP #$0A
    db <itemId>
endmacro

macro CopRemoveItem(itemId)
    COP #$0B
    db <itemId>
endmacro

macro Cop0C(npc_id, b, target)
    COP #$0C
    db <npc_id>, <b>
    dw <target>
endmacro

macro CopJumpIfEntityHasReachedXY(npc_id, x, y, target)
    COP #$0D
    db <npc_id>, <x>, <y>
    dw <target>
endmacro

; 0E and 0F are not implemented

macro CopTeleportPlayerToMap(map, facing, x, y)
    COP #$10
    dw <map>
    db <facing>
    dw <x>, <y>
endmacro

macro CopTeleportEntityTo(npc_id, x, y)
    COP #$11
    db <npc_id>, <x>, <y>
endmacro

macro CopSetEntityScriptAddr(npc_id, addr)
    COP #$12
    db <npc_id>
    dw <addr>
endmacro

macro Cop13(npc_id, addr)
    COP #$13
    db <npc_id>
    dw <addr>
endmacro

macro CopJumpIfSealed(lairId, target)
    COP #$14
    dw <lairId>
    dw <target>
endmacro

macro CopMakeNpcUnpassable()
    COP #$15
endmacro

macro CopMakeNpcPassable()
    COP #$16
endmacro

macro CopAssignTalkCallback(ptr)
    COP #$17
    dw <ptr>
endmacro

macro CopJumpIfItemNotObtained(itemId, target)
    COP #$18
    db <itemId>
    dw <target>
endmacro

macro CopJumpIfItemIsNotEquipped(itemId, target)
    COP #$19
    db <itemId>
    dw <target>
endmacro

macro CopShowMenu(choices_txt_ptr, number_of_choices, abort_ptr)
    COP #$1A
    dw <choices_txt_ptr>
    db <number_of_choices>
    dw <abort_ptr>
endmacro

macro CopJumpAfterNoFramesPassed(target, noFrames)
    COP #$1B
    dw <target>, <noFrames>
endmacro

; probably - compare entity with entity_id and if it matches jump to target
macro Cop1C(entity_id, target)
    COP #$1C
    dw <entity_id>, <target>
endmacro

; probably - set entity id flag
macro Cop1D(entity_id)
    COP #$1D
    dw <entity_id>
endmacro

; probably - bitmask for entity id flags
macro Cop1E(entity_id)
    COP #$1E
    dw <entity_id>
endmacro

; does something in a loop
macro Cop1F()
    COP #$1F
endmacro

; probably - if the player is not on a even position
macro Cop20(target)
    COP #$20
    dw <target>
endmacro

; probably - if the current position is on an unpassable position: jump
macro Cop21(target)
    COP #$21
    dw <target>
endmacro

; probably - if the leftside position is an unpassable position: jump
macro Cop22(target)
    COP #$22
    dw <target>
endmacro

; probably - if the upside position is an unpassable position: jump
macro Cop23(target)
    COP #$23
    dw <target>
endmacro

; probably - if the downside position is an unpassable position: jump
macro Cop24(target)
    COP #$24
    dw <target>
endmacro

macro CopAddGold(bcd_amount)
    COP #$25
    dw <bcd_amount>
endmacro

macro CopCastMagic(bcd_cost, no_money_callback)
    COP #$26
    dw <bcd_cost>, <no_money_callback>
endmacro

; set `v18` to the offset $18 of the struct also zeros $14
macro Cop27(v18)
    COP #$27
    dw <v18>
endmacro

; probably - if the current position is an unpassable position: jump
macro Cop28(target)
    COP #$28
    dw <target>
endmacro

macro Cop29()

endmacro

macro CopAddBlockRelativeToNpc(x, y)
    COP #$2A
    dw <x>
    dw <y>
endmacro

macro CopRemoveBlockRelativeToNpc(x, y)
    COP #$2B
    dw <x>
    dw <y>
endmacro

; 2C and 2D are not implemented

macro Cop2E(entity_id, word)
    COP #$2E
    db <entity_id>
    dw <word>
endmacro

; something with offset calculation
macro Cop2F(off_x, off_y)
    COP #$2F
    dw <off_x>, <off_y>
endmacro

macro CopJumpIfRevealing(lairId, target_24)
    COP #$30
    dw <lairId>
    dl <target_24>
endmacro

; sets the script address to CODE_C0E6DA as well setting that byte into $30
macro Cop31(byte)
    COP #$31
    db <byte>
endmacro

; sets the script address to CODE_C0ACFA as well setting that byte into $30
macro Cop32(byte)
    COP #$32
    db <byte>
endmacro

macro CopGiveInstantExp(bcd_exp)
    COP #$36
    dw <bcd_exp>
endmacro

macro CopRestoreToFullHealth()
    COP #$37
endmacro

macro CopGiveNormalExp(bcd_exp)
    COP #$38
    dw <bcd_exp>
endmacro

macro HarmPlayer(amount)
    COP #$39
    db <amount>
endmacro

macro CopChooseName()
    COP #$3A
endmacro

macro Cop3B(lair_id, target)
    COP #$3B
    dw <lair_id>, <target>
endmacro

macro Cop3C(a)
    COP #$3C
    db <a>
endmacro

; COPs 3D to 7F are not implemented

macro CopPlayAnimation(animation_id)
    COP #$80
    db <animation_id>
endmacro

macro Cop81(a, b)
    COP #$81
    db <a>, <b>
endmacro

macro Cop82()
    COP #$82
endmacro

macro Cop83()
    COP #$83
endmacro

macro CopSetScriptAddr(addr_24)
    COP #$85
    dl <addr_24>
endmacro

macro Cop86()
    COP #$86
endmacro

macro Cop87()
    COP #$87
endmacro

macro Cop8F()
    COP #$8F
endmacro

macro CopSetScriptAddrToNextInstruction()
    COP #$91
endmacro

macro CopFlipSpriteVertically()
    COP #$96
endmacro

macro CopResetSpriteVertically()
    COP #$97
endmacro

macro CopJumpDependingOnPlayerXProximity(x_proximity, too_left, inside, too_right)
    COP #$9A
    dw <x_proximity>, <too_left>, <inside>, <too_right>
endmacro

macro CopJumpDependingOnPlayerYProximity(y_proximity, too_top, inside, too_bottom)
    COP #$9B
    dw <y_proximity>, <too_top>, <inside>, <too_bottom>
endmacro

macro Cop9D(byte)
    COP #$9D
    db <byte>
endmacro

macro Cop9E(target)
    COP #$9E
    dw <target>
endmacro

macro CopAdjustNpcXPosition(pos)
    COP #$9F
    dw <pos>
endmacro

macro CopAdjustNpcYPosition(pos)
    COP #$A0
    dw <pos>
endmacro

macro CopAC(target_24, a, b, c)
    COP #$AC
    dl <target_24>
    dw <a>, <b>, <c>
endmacro

macro create_entity(name, offsense, flags1, hp, bcd_exp, spriteId, facing, flags2, zUknown, behaviour_ptr)
if not(stringsequal("<name>", "_"))
<name>:
endif
    db <offsense>, <flags1>, <hp>
    dw <bcd_exp>
    db <spriteId>, <facing>, <flags2>
    dl <zUknown>
    dl <behaviour_ptr>
endmacro

macro create_entities_placement(name, mapNumber, mapSubnumber, addr)
if not(stringsequal("<name>", "_"))
<name>:
endif
    db <mapNumber>
    db <mapSubnumber>
    dw <addr>
endmacro


macro PlaySound(id)
    BRK #<id>
endmacro

macro SwitchToBank(id)
    LDA.B <id>
    PHA
    PLB
endmacro
