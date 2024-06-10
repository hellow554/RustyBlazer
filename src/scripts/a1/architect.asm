A1_script_Architect:
    %CopJumpIfSealed(!Lair_A1_Architect, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.talk:
    %CopJumpIfEventFlagIsUnset($0107, .first_talk)
    %CopJumpIfEventFlagIsUnset($0003, .wall_done)
.first_talk:
    %CopShowText(.txt_default)
    %CopSetEventFlag($0107)
    %CopSetEventFlag($0003)
    RTL
.wall_done:
    %CopShowText(.txt_wall_done)
    RTL

.txt_default:
; @DEFAULT_TEXTBOX@
; "Mein Name ist Frank."
; "Ich bin Architekt." WFE
; "Ich habe alle Häuser "
; "in der Stadt gebaut."
; "Komm` später nochmal "
; "vorbei, dann zeige " WFE
; "ich Dir etwas." -> Default_Text_End
db $10
db $98,'N','a','m','e',' ',$D2,'F','r','a','n','k','.',$0D
db $8F,$B1,'A','r','c','h','i','t','e','k','t','.',$11
db $8F,$CC,$AE,'H','ä','u','s','e','r',' ',$0D
db $D3,$B6,'S','t','a','d','t',' ','g','e','b','a','u','t','.',$0D
db 'K','o','m','m','`',' ','s','p','ä','t','e','r',' ','n','o','c','h','m','a','l',' ',$0D
db 'v','o','r','b','e','i',',',' ','d','a','n','n',' ','z','e','i','g','e',' ',$11
db $D1,$84,'e','t','w','a','s','.',$13 : dw Default_Text_End
; @END@

.txt_wall_done:
; @DEFAULT_TEXTBOX@
; "Was hälst Du von "
; "dieser Mauer ? Ich bin "
; "als schneller Maurer "
; "bekannt!" -> Default_Text_End
db $10
db 'W','a','s',' ','h','ä','l','s','t',' ',$83,$EE,$0D
db $BD,'M','a','u','e','r',' ','?',' ',$8F,$B1,$0D
db $AF,'s','c','h','n','e','l','l','e','r',' ','M','a','u','r','e','r',' ',$0D
db 'b','e','k','a','n','n','t','!',$13 : dw Default_Text_End
; @END@