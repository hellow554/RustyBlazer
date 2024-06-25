A1_script_chiefs_house_tulip:
    %CopJumpIfSealed(!Lair_A1_Chiefs_House_Tulip, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Chiefs_House_Tulip, .revealing)
    %CopSetScriptAddr(CODE_C0A9C9)
    %CopAssignTalkCallback(.talk)
    %CopMakeNpcUnpassable()

.loop:
    %CopPlayAnimation(Animation.VillageTulipLeftRight)
    %Cop82()
    BRA .loop

.talk:
    %CopJumpIfSealed(!Lair_A1_Chief, .lisa_sealed)
    %CopShowText(.text_lisa_revealed)
    RTL

.lisa_sealed:
    %CopShowText(.text_default)
.revealing:
    %CopShowText(.text_revealing)
    RTL

.text_lisa_revealed:
; @DEFAULT_TEXTBOX@
; "Es gab hier einmal "
; "eine Wassermühle bevor "
; "die Stadt zerstört "
; "wurde." WFE
; "Ich habe gehört, es "
; "gibt einen Mann der "
; "den Aufzug im unterir-"
; "dischen Schloß bedient" -> Default_Text_End
db $10
db $8C,'g','a','b',' ',$CE,$C4,$0D
db $BF,'W','a','s','s','e','r','m','ü','h','l','e',' ','b','e','v','o','r',' ',$0D
db $B5,'S','t','a','d','t',' ','z','e','r','s','t','ö','r','t',' ',$0D
db 'w','u','r','d','e','.',$11
db $8F,$CC,'g','e','h','ö','r','t',',',' ',$C3,$0D
db $CB,$C0,'M','a','n','n',' ',$B6,$0D
db $B7,'A','u','f','z','u','g',' ',$D5,'u','n','t','e','r','i','r','-',$0D
db 'd','i','s','c','h','e','n',' ',$9E,'b','e','d','i','e','n','t',$13 : dw Default_Text_End
; @END@

.text_revealing:
; @DEFAULT_TEXTBOX@
; WAIT 60
; PLAYER_NAME " hört "
; "eine sehr leise Stimme. " WFE
; -> .text_lisa_revealed+1
db $10
db $0E,$3C
db $02,$02,' ','h','ö','r','t',' ',$0D
db $BF,$E8,'l','e','i','s','e',' ','S','t','i','m','m','e','.',' ',$11
db $13 : dw .text_lisa_revealed+1
; @END@

.text_default:
; @DEFAULT_TEXTBOX@
; "Der Bürgermeister "
; "spricht jeden Morgen "
; "mit mir." WFE
; "Auch wenn ich nicht "
; "sprechen kann, so ver-"
; "ständige ich mich mit "
; "ihm durch Telepathie." -> Default_Text_End
db $10
db $88,'B','ü','r','g','e','r','m','e','i','s','t','e','r',' ',$0D
db 's','p','r','i','c','h','t',' ','j','e','d','e','n',' ','M','o','r','g','e','n',' ',$0D
db $DA,'m','i','r','.',$11
db 'A','u','c','h',' ',$F3,$D1,$DF,$0D
db 's','p','r','e','c','h','e','n',' ','k','a','n','n',',',' ',$E9,'v','e','r','-',$0D
db 's','t','ä','n','d','i','g','e',' ',$D1,$D9,$DA,$0D
db 'i','h','m',' ','d','u','r','c','h',' ','T','e','l','e','p','a','t','h','i','e','.',$13 : dw Default_Text_End
; @END@
