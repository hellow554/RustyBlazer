A1_script_chiefs_wife:
    %CopJumpIfSealed(!Lair_A1_Chiefs_Wife, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Chiefs_Wife, .revealing)
    %CopJumpIfSealed(!Lair_A1_Chief, .lisaRevealed)
    %CopAssignTalkCallback(.default_talk)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

.lisaRevealed:
    %CopJumpIfEventFlagIsSet(!EV_A1_SOMETHING_WITH_LISA_AND_CHIEFS_WIFE, +)
    %CopAssignTalkCallback(.lisa_revealed_talk)
    %CopTeleportEntityTo(!Entity_ChiefsWife, $3B, $1E)
    %CopMakeNpcUnpassable()
    %CopSetScriptAddrToNextInstruction()
    RTL

+:
    %Cop86()
    RTL

.default_talk:
    %CopJumpIfEventFlagIsSet(!EV_A1_ChiefsWifeAsk, .already_said_yes)
    %CopShowText(.first_talk)
    %CopShowMenu(choice_yes_no, 2, .said_no)
    LDA.L choice_idx
    BNE .said_no
    %CopSetEventFlag(!EV_A1_ChiefsWifeAsk)
    %CopShowText(.text_said_yes)
    BRL +

.said_no:
    %CopShowText(.text_said_no)
    RTL

.already_said_yes:
    %CopShowText(.text_after_saying_yes)
+:
    %CopRestoreToFullHealth()
    RTL

.revealing:
    %CopShowText(.text_revealing)
    %Cop86()
    RTL

.lisa_revealed_talk:
    %CopJumpIfItemNotObtained(Items.VipCard, .lisa_here)
    %CopShowText(.text_lisa_hijacked)
    RTL
.lisa_here
    %CopShowText(.text_lisa_here)
    RTL

.first_talk:
; @DEFAULT_TEXTBOX@
; "Mein Mann war einmal "
; "der Bürgermeister "
; "dieser Stadt." WFE
; "Eines Tages verschwand "
; "er auf mysteriöse "
; "Weise, zusammen mit "
; "den anderen Bewohnern." WFE
; "Ich fühle mich so ein-"
; "sam..." WFE
; "Wie wär`s, wenn Du "
; "eines meiner Kinder "
; "wärst ?" CONT
db $10
db $98,'M','a','n','n',' ',$FC,$C4,$0D
db $B6,'B','ü','r','g','e','r','m','e','i','s','t','e','r',' ',$0D
db $BD,'S','t','a','d','t','.',$11
db 'E','i','n','e','s',' ',$A6,'v','e','r','s','c','h','w','a','n','d',' ',$0D
db $C8,$AC,'m','y','s','t','e','r','i','ö','s','e',' ',$0D
db 'W','e','i','s','e',',',' ',$FF,$DA,$0D
db $B7,'a','n','d','e','r','e','n',' ','B','e','w','o','h','n','e','r','n','.',$11
db $8F,'f','ü','h','l','e',' ',$D9,$E9,'e','i','n','-',$0D
db 's','a','m','.','.','.',$11
db 'W','i','e',' ','w','ä','r','`','s',',',' ',$F3,$83,$0D
db $C5,$DE,'K','i','n','d','e','r',' ',$0D
db 'w','ä','r','s','t',' ','?',$0C
; @END@

.text_said_no:
; @NEW_TEXT@
; "Nun,"
; "das ist schade." -> Default_Text_End
db 'N','u','n',',',$0D
db $B9,$D2,'s','c','h','a','d','e','.',$13 : dw Default_Text_End
; @END@

.text_said_yes:
; @NEW_TEXT@
; "Wirklich?!"
; "Ich werde Dich von nun "
; "an "
; PLAYER_NAME " nennen." WFE
; "Benutze das Zimmer "
; "im zweiten Stock als "
; "Dein eigenes." -> Default_Text_End
db 'W','i','r','k','l','i','c','h','?','!',$0D
db $8F,$F2,$85,$EE,'n','u','n',' ',$0D
db 'a','n',' ',$0D
db $02,$02,' ','n','e','n','n','e','n','.',$11
db 'B','e','n','u','t','z','e',' ',$B9,'Z','i','m','m','e','r',' ',$0D
db $D5,'z','w','e','i','t','e','n',' ','S','t','o','c','k',' ',$AF,$0D
db 'D','e','i','n',' ','e','i','g','e','n','e','s','.',$13 : dw Default_Text_End
; @END@

.text_after_saying_yes:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME ","
; "Du läufst nur herum "
; "und tust gar nichts." WFE
; "Langsam fange ich an "
; "mir Sorgen zu machen."
; "Bleib` bitte hier, und "
; "ruhe Dich aus." -> Default_Text_End
db $10
db $02,$02,',',$0D
db $83,'l','ä','u','f','s','t',' ',$E1,'h','e','r','u','m',' ',$0D
db $EB,'t','u','s','t',' ','g','a','r',' ','n','i','c','h','t','s','.',$11
db 'L','a','n','g','s','a','m',' ','f','a','n','g','e',' ',$D1,'a','n',' ',$0D
db $DB,'S','o','r','g','e','n',' ',$FD,'m','a','c','h','e','n','.',$0D
db 'B','l','e','i','b','`',' ',$B2,'h','i','e','r',',',' ',$EB,$0D
db 'r','u','h','e',' ',$85,'a','u','s','.',$13 : dw Default_Text_End
; @END@

.text_lisa_here:
; @DEFAULT_TEXTBOX@
; "Das Lisa von ihren "
; "Eltern getrennt ist,"
; "tut mir leid." -> Default_Text_End
db $10
db $8A,$94,$EE,'i','h','r','e','n',' ',$0D
db 'E','l','t','e','r','n',' ','g','e','t','r','e','n','n','t',' ','i','s','t',',',$0D
db 't','u','t',' ',$DB,'l','e','i','d','.',$13 : dw Default_Text_End
; @END@

.text_lisa_hijacked:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME "!" WFE
; "Magridd`s Soldaten "
; "waren gerade hier, und "
; "haben Lisa entführt."
; "Du mußt sie retten !" -> Default_Text_End
db $10
db $02,$02,'!',$11
db 'M','a','g','r','i','d','d','`','s',' ','S','o','l','d','a','t','e','n',' ',$0D
db 'w','a','r','e','n',' ','g','e','r','a','d','e',' ','h','i','e','r',',',' ',$EB,$0D
db $D0,$94,'e','n','t','f','ü','h','r','t','.',$0D
db $83,'m','u','ß','t',' ',$E6,'r','e','t','t','e','n',' ','!',$13 : dw Default_Text_End
; @END@

.text_revealing:
; @DEFAULT_TEXTBOX@
; "Du hörst einen Seufzer "
; "aus dem Haus heraus." -> Default_Text_End
db $10
db $83,'h','ö','r','s','t',' ',$C0,'S','e','u','f','z','e','r',' ',$0D
db $AD,$BB,'H','a','u','s',' ','h','e','r','a','u','s','.',$13 : dw Default_Text_End
; @END@
