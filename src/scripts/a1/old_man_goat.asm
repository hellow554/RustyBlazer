A1_script_old_man_goat:
    %CopJumpIfSealed(!Lair_A1_OldManGoat, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    %CopPlayAnimation(!Anim_Village_Goat_Eating_And_Blinking)
    %Cop82()
    RTL

.talk:
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Ich weiß nicht, ob es "
; "so etwas wie Reinkar-"
; "nation gibt." WFE
; "Auch wenn ich nicht "
; "mit meinem Mann reden "
; "kann, so genieße ich "
; "seine Anwesenheit." -> Default_Text_End
db $10
db $8F,'w','e','i','ß',' ','n','i','c','h','t',',',' ','o','b',' ',$C3,$0D
db $E9,$C2,$F6,'R','e','i','n','k','a','r','-',$0D
db 'n','a','t','i','o','n',' ','g','i','b','t','.',$11
db 'A','u','c','h',' ',$F3,$D1,$DF,$0D
db $DA,$DD,'M','a','n','n',' ','r','e','d','e','n',' ',$0D
db 'k','a','n','n',',',' ',$E9,'g','e','n','i','e','ß','e',' ',$D1,$0D
db 's','e','i','n','e',' ','A','n','w','e','s','e','n','h','e','i','t','.',$13 : dw Default_Text_End
; @END@