A1_script_secret_shack_kid:
    %CopJumpIfSealed(!Lair_A1_SecretShackKid, +) : RTL : +
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk_in_entry)
    %CopSetScriptAddrToNextInstruction()
    %CopBranchIfEntityHasReachedXY(!Entity_Player, $38, $3A, +) : RTL : +

    %CopJumpIfEventFlagIsSet(!EV_A1_Found_APass, .already_talked)
    %CopShowText(.text_default)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfSealed(!Lair_A1_Sleeping_Tulip, +) : RTL : +

    %CopBranchIfEntityHasReachedXY(!Entity_Player, $3C, $37, +) : RTL : +

    %CopAssignTalkCallback(0)
    %CopMakeNpcPassable()
    %CopPlayAnimation($0F)
    %Cop82()
    %Cop9D($0F)
    %Cop9E(+) : +

    %CopPlayAnimation($11)
    %Cop82()
    %Cop9D($11)
    %Cop9E(+) : +

    %Cop81($10, $02)
    %Cop83()
    %Cop9D($10)
    %Cop9E(+) : +

    %Cop81($11, $03)
    %Cop83()
    %Cop9D($10)
    %Cop9E(+) : +

    %Cop97()
    %CopPlayAnimation($0E)
    %Cop82()
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk_out_of_way)
    %CopSetScriptAddrToNextInstruction()
    %Cop0C(!Entity_Player, $02, +) : RTL : +

    %Cop96()
    %CopPlayAnimation($0C)
    %Cop82()
    %CopShowText(.text_followed)
    %CopSetScriptAddrToNextInstruction()
    RTL

.already_talked:
    %CopAssignTalkCallback(.talk_need_pass)
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk_in_entry:
    %CopShowText(.text_hint)
    %CopSetEventFlag(!EV_A1_Hideout_Kid_Hint_Given)
    RTL

.talk_out_of_way:
    %CopShowText(.text_followed)
    RTL

.talk_need_pass:
    %CopJumpIfItemNotObtained(!APass, ..no_pass)
    %CopShowText(.text_found_pass)
    RTL
..no_pass:
    %CopShowText(.text_presented_pass)
    RTL

.text_default:
; @DEFAULT_TEXTBOX@
; "Oh, Du hast mich er-"
; "schreckt !" -> Default_Text_End
db $10
db $4F,$68,$2C,$20,$83,$CD,$D9,$65,$72,$2D,$0D
db $73,$63,$68,$72,$65,$63,$6B,$74,$20,$21,$13 : dw Default_Text_End
; @END@

.text_hint:
; @DEFAULT_TEXTBOX@
; "Dies ist unsere ge-"
; "heime Hütte. Wir haben "
; "unseren Schatz hier "
; "in der Nähe versteckt." -> Default_Text_End
db $10
db $89,$D2,$75,$6E,$73,$65,$72,$65,$20,$67,$65,$2D,$0D
db $68,$65,$69,$6D,$65,$20,$48,$5B,$74,$74,$65,$2E,$20,$AA,$D0,$0D
db $75,$6E,$73,$65,$72,$65,$6E,$20,$53,$63,$68,$61,$74,$7A,$20,$CE,$0D
db $D3,$B6,$4E,$7B,$68,$65,$20,$76,$65,$72,$73,$74,$65,$63,$6B,$74,$2E,$13 : dw Default_Text_End
; @END@

.text_followed:
; @DEFAULT_TEXTBOX@
; "Bist Du mir gefolgt ?"
; "Ich werde Dir nicht "
; "sagen wo unser Schatz "
; "ist." -> Default_Text_End
db $10
db $42,$69,$73,$74,$20,$83,$DB,$67,$65,$66,$6F,$6C,$67,$74,$20,$3F,$0D
db $8F,$F2,$84,$DF,$0D
db $73,$61,$67,$65,$6E,$20,$77,$6F,$20,$75,$6E,$73,$65,$72,$20,$53,$63,$68,$61,$74,$7A,$20,$0D
db $69,$73,$74,$2E,$13 : dw Default_Text_End
; @END@

.text_found_pass:
; @DEFAULT_TEXTBOX@
; "Oh! Das ist mein Paß!"
; "Nun gut, ich werde ihn "
; "Dir geben." -> Default_Text_End
db $10
db $4F,$68,$21,$20,$8A,$D2,$6D,$65,$69,$6E,$20,$50,$61,$25,$21,$0D
db $4E,$75,$6E,$20,$67,$75,$74,$2C,$20,$D1,$F2,$69,$68,$6E,$20,$0D
db $84,$67,$65,$62,$65,$6E,$2E,$13 : dw Default_Text_End
; @END@

.text_presented_pass:
; @DEFAULT_TEXTBOX@
; "Hat Dir der Pass ge-"
; "holfen ?" -> Default_Text_End
db $10
db $48,$61,$74,$20,$84,$B6,$50,$61,$73,$73,$20,$67,$65,$2D,$0D
db $68,$6F,$6C,$66,$65,$6E,$20,$3F,$13 : dw Default_Text_End
; @END@
