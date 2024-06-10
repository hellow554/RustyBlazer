A1_script_Tulip_Above_Entrance:
    %CopJumpIfSealed(!Lair_A1_Tulip_Above_Entrance, +) : RTL : +
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()
.loop:
    COP #$80
    db $1E
    COP #$82
    BRA .loop
.talk:
    %CopJumpIfItemNotObtained(!DreamRod, .talk_no_dreamrod)
    %CopShowText(.text_has_dreamrod)
    RTL
.talk_no_dreamrod:
    %CopShowText(.text_no_dreamrod)
    RTL

.text_has_dreamrod:
; @DEFAULT_TEXTBOX@
; "Der Traumstab, den Du "
; "besitzt, ist ein ma-"
; "gischer Stab, durch "
; "welchen Du in die " WFE
; "Träume andere Leute "
; "schauen kannst. Be-"
; "nutze diesen Stab,"
; "wenn Du mit jemandem " WFE
; "sprechen möchtest, der "
; "schläft." -> Default_Text_End
db $10
db $88,'T','r','a','u','m','s','t','a','b',',',' ',$B7,$83,$0D
db 'b','e','s','i','t','z','t',',',' ',$D2,$BE,'m','a','-',$0D
db 'g','i','s','c','h','e','r',' ','S','t','a','b',',',' ','d','u','r','c','h',' ',$0D
db 'w','e','l','c','h','e','n',' ',$83,$D3,$B5,$11
db 'T','r','ä','u','m','e',' ','a','n','d','e','r','e',' ','L','e','u','t','e',' ',$0D
db 's','c','h','a','u','e','n',' ','k','a','n','n','s','t','.',' ','B','e','-',$0D
db 'n','u','t','z','e',' ','d','i','e','s','e','n',' ','S','t','a','b',',',$0D
db $F3,$83,$DA,'j','e','m','a','n','d','e','m',' ',$11
db 's','p','r','e','c','h','e','n',' ','m','ö','c','h','t','e','s','t',',',' ',$B6,$0D
db 's','c','h','l','ä','f','t','.',$13 : dw Default_Text_End
; @END@

.text_no_dreamrod:
; @DEFAULT_TEXTBOX@
; "Ich habe gehört, es "
; "gibt einen magischen "
; "Stab, der es dem Be-"
; "sitzer ermöglicht, mit " WFE
; "schlafenden Personen "
; "zu sprechen. Er soll "
; "im unterirdischen "
; "Schloß versteckt sein." -> Default_Text_End
db $10
db $8F,$CC,'g','e','h','ö','r','t',',',' ',$C3,$0D
db $CB,$C0,'m','a','g','i','s','c','h','e','n',' ',$0D
db 'S','t','a','b',',',' ',$B6,$C3,$BB,'B','e','-',$0D
db 's','i','t','z','e','r',' ','e','r','m','ö','g','l','i','c','h','t',',',' ',$DA,$11
db 's','c','h','l','a','f','e','n','d','e','n',' ','P','e','r','s','o','n','e','n',' ',$0D
db $FD,'s','p','r','e','c','h','e','n','.',' ','E','r',' ','s','o','l','l',' ',$0D
db $D5,'u','n','t','e','r','i','r','d','i','s','c','h','e','n',' ',$0D
db $9E,'v','e','r','s','t','e','c','k','t',' ','s','e','i','n','.',$13 : dw Default_Text_End
; @END@