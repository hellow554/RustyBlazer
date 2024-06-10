A1_script_chief_chair:
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.talk)
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfSealed(!Lair_A1_Chief, .chief_released)
    %CopPlayAnimation(!Anim_Village_Chief_Chair)
    %Cop82()
    RTL

.chief_released:
    %Cop86()
    RTL

.talk:
    %CopShowText(.text)
    RTL

.text:
; @DEFAULT_TEXTBOX@
; "Dies ist das Zimmer "
; "des Bürgermeisters. Er "
; "saß hier stundenlang "
; "und hat nachgedacht." WFE
; "Ich frage mich, wann "
; "er zurückkommen wird."
; -> Default_Text_End
db $10
db $89,$D2,$B9,'Z','i','m','m','e','r',' ',$0D
db $B8,'B','ü','r','g','e','r','m','e','i','s','t','e','r','s','.',' ','E','r',' ',$0D
db 's','a','ß',' ',$CE,'s','t','u','n','d','e','n','l','a','n','g',' ',$0D
db $EB,$CF,'n','a','c','h','g','e','d','a','c','h','t','.',$11
db $8F,'f','r','a','g','e',' ','m','i','c','h',',',' ','w','a','n','n',' ',$0D
db $C8,'z','u','r','ü','c','k','k','o','m','m','e','n',' ','w','i','r','d','.',$0D
db $13 : dw Default_Text_End
; @END@