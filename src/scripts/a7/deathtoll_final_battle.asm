
A7_Script_FinalDeahtollBattle:
;setup battle
    STX.W _039C
    LDA.W $1A, X
    ORA.W #$200
    STA.W $1A, X
    STZ.W _0472
    %CopSetScriptAddr(CODE_C0D639)
    %CopAC(CODE_C0D390, $38, $70, $200)
    %CopAC(CODE_C0D398, $B8, $70, $200)
    %CopAC(CODE_C0D210, $38, $40, $200)
    %CopAC(CODE_C0D23E, $B8, $40, $200)
    %CopLoopStart($3D) : %CopLoopEnd()
    BRA .spawn_flame_pillars

.check_all_pillars_dead:
    %CopSetScriptAddrToNextInstruction()
    LDA.W game_state
    AND.W #$FF
    CMP.W #4 ; amount of pillars that has been spawned
    BEQ + : RTL : + ; check if all pillars are dead, then continue

    SEP #$20
    STZ.W game_state
    REP #$20
    %CopPlayAnimation($14) ; probably the head liftet animation
    %Cop82()
    ; make deathtoll vulnerable
    LDA.W LiveEntities.entity_id, X
    AND.W #~$200
    STA.W LiveEntities.entity_id, X
    %CopPlayAnimation($12)
    %Cop82()
    %CopB0(.todo2, $80, $300)
    %CopPlayAnimation($13)
    %Cop82()
    %CopB2(.flameball1, $8, $10, $200)
    %CopB2(.flameball2, $8, $10, $200)
    %CopB2(.flameball3, $8, $10, $200)
    ; make him invincible again
    LDA.W LiveEntities.entity_id, X
    ORA.W #$200
    STA.W LiveEntities.entity_id, X
    %CopPlayAnimation($15)
    %Cop82()
    ; fallthrough

.spawn_flame_pillars:
    %CopLoopStart(4) : { ; how many are spawned
        %CopB0(.todo1, $80, $301)
        %CopJumpAfterNoFramesPassed(+, 40) : + ; delay between spawns
    } : %CopLoopEnd()
    BRA .check_all_pillars_dead

.todo1:
db $BD   ;C0D146|        |000028;
db $1A,$00,$09,$00,$01,$9D,$1A,$00   ;C0D14E|        |      ;
db $02,$1F,$02,$35,$A0,$AD,$43,$04   ;C0D156|        |      ;
db $18,$69,$20,$00,$9D,$00,$00,$02   ;C0D15E|        |      ;
db $1F,$02,$35,$1E,$AD,$43,$04,$18   ;C0D166|        |1E3502;
db $69,$B0,$00,$9D,$02,$00,$E2,$20   ;C0D16E|        |      ;
db $A9,$FF,$9D,$25,$00,$C2,$20,$02   ;C0D176|        |      ;
db $80,$16,$02,$82,$BD,$16,$00,$29   ;C0D17E|        |C0D196;
db $FF,$FC,$9D,$16,$00,$BD,$25,$00   ;C0D186|        |169DFC;
db $29,$FF,$00,$C9,$FC,$00,$90,$07   ;C0D18E|        |      ;
db $02,$80,$17,$02,$82,$80,$EE,$BD   ;C0D196|        |      ;
db $16,$00,$09,$00,$03,$9D,$16,$00   ;C0D19E|        |000000;
db $02,$80,$18,$02,$82,$E2,$20,$EE   ;C0D1A6|        |      ;
db $5E,$1A,$C2,$20,$02,$B0,$BC,$D1   ;C0D1AE|        |00C21A;
db $80,$00,$40,$02,$86,$6B,$02,$A8   ;C0D1B6|        |C0D1B8;
db $00,$80,$8E,$AD,$05,$00,$9D,$1E   ;C0D1BE|        |      ;
db $00,$9E,$20,$00,$AD,$72,$03,$9D   ;C0D1C6|        |      ;
db $1C,$00,$02,$A4,$02,$80,$05,$02   ;C0D1CE|        |000200;
db $82,$02,$81,$0A,$04,$02,$83,$02   ;C0D1D6|        |C052DB;
db $86,$6B

.flameball1:
    %PlaySound($51)
    %CopPlayAnimation($1A)
    %Cop82()
    %Cop81($1C, $08)
    %Cop83()
    %Cop86()
    RTL

.flameball2:
    %CopPlayAnimation($1B)
    %Cop82()
    %Cop81($1C, $08)
    %Cop83()
    %Cop86()
    RTL

.flameball3:
    %CopFlipSpriteVertically()
    BRA .flameball2

.todo2:
    %CopA3()
    %CopAdjustNpcYPosition(-2)
    %CopPlayAnimation($19)
    %Cop82()
    %Cop86()
    RTL

CODE_C0D210:
db $02,$81,$0E,$0E,$02,$83   ;C0D20E|        |00006B;
db $02,$80,$0D,$02,$82,$00,$4B,$02   ;C0D216|        |      ;
db $B0,$6C,$D2,$80,$00,$02,$02,$1B   ;C0D21E|        |C0D28C;
db $2A,$D2,$02,$00,$02,$03,$03,$02   ;C0D226|        |      ;
db $B0,$BB,$D2,$80,$00,$02,$02,$1B   ;C0D22E|        |C0D1EB;
db $3A,$D2,$03,$00,$02,$04,$80,$D2   ;C0D236|        |      ;

CODE_C0D23E:
db $02,$81,$0E,$0E,$02,$83,$02,$80   ;C0D23E|        |      ;
db $0D,$02,$82,$00,$4B,$02,$B0,$FE   ;C0D246|        |008202;
db $D2,$80,$00,$02,$02,$1B,$58,$D2   ;C0D24E|        |000080;
db $02,$00,$02,$03,$03,$02,$B0,$4D   ;C0D256|        |      ;
db $D3,$80,$00,$02,$02,$1B,$68,$D2   ;C0D25E|        |000080;
db $03,$00,$02,$04,$80,$D2,$BD,$16   ;C0D266|        |000000;
db $00,$89,$00,$80,$D0,$44,$02,$81   ;C0D26E|        |      ;
db $0C,$02,$02,$83,$02,$9A,$00,$00   ;C0D276|        |000202;
db $84,$D2,$9E,$D2,$9E,$D2,$02,$09   ;C0D27E|        |0000D2;
db $06,$99,$02,$A1,$F8,$FF,$08,$00   ;C0D286|        |000099;
db $02,$97,$02,$81,$1D,$02,$02,$83   ;C0D28E|        |      ;
db $02,$A1,$F8,$FF,$08,$00,$80,$CE   ;C0D296|        |      ;
db $02,$09,$06,$19,$02,$A1,$08,$00   ;C0D29E|        |      ;
db $08,$00,$02,$96,$02,$81,$1D,$02   ;C0D2A6|        |      ;
db $02,$83,$02,$A1,$08,$00,$08,$00   ;C0D2AE|        |      ;
db $80,$B4,$02,$86,$6B,$BD,$16,$00   ;C0D2B6|        |C0D26C;
db $89,$00,$80,$D0,$38,$02,$81,$0C   ;C0D2BE|        |      ;
db $02,$02,$83,$02,$07,$06,$19,$E5   ;C0D2C6|        |      ;
db $D2,$02,$A1,$F8,$FF,$08,$00,$02   ;C0D2CE|        |000002;
db $97,$02,$81,$1D,$02,$02,$83,$02   ;C0D2D6|        |000002;
db $A1,$F8,$FF,$08,$00,$80,$D6,$02   ;C0D2DE|        |0000F8;
db $A1,$08,$00,$08,$00,$02,$96,$02   ;C0D2E6|        |000008;
db $81,$1D,$02,$02,$83,$02,$A1,$08   ;C0D2EE|        |00001D;
db $00,$08,$00,$80,$C0,$02,$86,$6B   ;C0D2F6|        |      ;
db $BD,$16,$00,$89,$00,$80,$D0,$44   ;C0D2FE|        |000016;
db $02,$81,$0C,$02,$02,$83,$02,$9A   ;C0D306|        |      ;
db $00,$00,$16,$D3,$30,$D3,$30,$D3   ;C0D30E|        |      ;
db $02,$09,$07,$99,$02,$A1,$F8,$FF   ;C0D316|        |      ;
db $08,$00,$02,$97,$02,$81,$1D,$02   ;C0D31E|        |      ;
db $02,$83,$02,$A1,$F8,$FF,$08,$00   ;C0D326|        |      ;
db $80,$CE,$02,$09,$07,$19,$02,$A1   ;C0D32E|        |C0D2FE;
db $08,$00,$08,$00,$02,$96,$02,$81   ;C0D336|        |      ;
db $1D,$02,$02,$83,$02,$A1,$08,$00   ;C0D33E|        |000202;
db $08,$00,$80,$B4,$02,$86,$6B,$BD   ;C0D346|        |      ;
db $16,$00,$89,$00,$80,$D0,$38,$02   ;C0D34E|        |000000;
db $81,$0C,$02,$02,$83,$02,$07,$07   ;C0D356|        |00000C;
db $19,$77,$D3,$02,$A1,$F8,$FF,$08   ;C0D35E|        |00D377;
db $00,$02,$97,$02,$81,$1D,$02,$02   ;C0D366|        |      ;
db $83,$02,$A1,$F8,$FF,$08,$00,$80   ;C0D36E|        |000002;
db $D6,$02,$A1,$08,$00,$08,$00,$02   ;C0D376|        |000002;
db $96,$02,$81,$1D,$02,$02,$83,$02   ;C0D37E|        |000002;
db $A1,$08,$00,$08,$00,$80,$C0,$02   ;C0D386|        |000008;
db $86,$6B
CODE_C0D390:
%CopPlayAnimation($11)
%Cop82()
%CopSetScriptAddrToNextInstruction()
RTL
CODE_C0D398:
%CopPlayAnimation($10)
%Cop82()
%CopSetScriptAddrToNextInstruction()
RTL
db $A9,$00,$20,$0C,$26,$03   ;C0D39E|        |00006B;
db $E2,$20,$A9,$80,$9D,$36,$00,$C2   ;C0D3A6|        |      ;
db $20,$A9,$10,$20,$9D,$16,$00,$EE   ;C0D3AE|        |C010A9;
db $72,$04,$02,$37,$02,$31,$00,$02   ;C0D3B6|        |000004;
db $03,$F1,$02,$04,$BD,$16,$00,$29   ;C0D3BE|        |0000F1;
db $EF,$FF,$9D,$16,$00,$02,$01,$18   ;C0D3C6|        |169DFF;
db $D4,$AD,$82,$1B,$29,$1F,$00,$3A   ;C0D3CE|        |0000AD;
db $F0,$06,$02,$01,$A2,$D4,$80,$04   ;C0D3D6|        |C0D3DE;
db $02,$01,$61,$D4,$E2,$20,$9C,$82   ;C0D3DE|        |      ;
db $1B,$C2,$20,$02,$03,$3D,$02,$04   ;C0D3E6|        |      ;
db $02,$01,$0A,$D6,$02,$85,$2C,$D6   ;C0D3EE|        |      ;
db $80,$02,$03,$F1,$02,$04,$02,$09   ;C0D3F6|        |C0D3FA;
db $02,$9F,$A9,$05,$00,$8D,$84,$1B   ;C0D3FE|        |      ;
db $A9,$01,$00,$8D,$1E,$03,$02,$10   ;C0D406|        |      ;
db $00,$07,$01,$70,$00,$60,$00,$02   ;C0D40E|        |      ;
db $91,$6B


.txt_defeated:
; @DEFAULT_TEXTBOX@
; "Letzendlich, " PLAYER_NAME " "
; "besiegt Deathtoll!" WFE
; "Plötzlich hört "
; PLAYER_NAME " eine leise "
; "Stimme." WFE CONT
db $10
db 'L','e','t','z','e','n','d','l','i','c','h',',',' ',$02,$02,' ',$0D
db 'b','e','s','i','e','g','t',' ','D','e','a','t','h','t','o','l','l','!',$11
db 'P','l','ö','t','z','l','i','c','h',' ','h','ö','r','t',' ',$0D
db $02,$02,' ',$BF,'l','e','i','s','e',' ',$0D
db 'S','t','i','m','m','e','.',$11,$0C
; @END@

.txt_one_soul:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME ",ich habe mich "
; "entschlossen hierzu-"
; "bleiben, und die Welt " WFE
; "des Bösen zu "
; "versiegeln....." WFE -> .seal_common
db $10
db $02,$02,',',$D1,$CC,$D9,$0D
db 'e','n','t','s','c','h','l','o','s','s','e','n',' ','h','i','e','r','z','u','-',$0D
db 'b','l','e','i','b','e','n',',',' ',$EB,$B5,$A9,$11
db $B8,$82,$FD,$0D
db 'v','e','r','s','i','e','g','e','l','n','.','.','.','.','.',$11,$13 : dw .seal_common
; @END@

.txt_multiple_souls:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME ",wir haben uns "
; "entschlossen, die "
; "Welt des Bösen zu "
; "versiegeln...." WFE
; LABEL .seal_common
; "Die Welt des Bösen ist "
; "eine dunkle Welt, die "
; "in den Hinterköpfen "
; "der Menschen existiert. " WFE
; "Solange es Erfindungen "
; "auf dieser Welt gibt,"
; "wird immer wieder das "
; "Gleiche passieren." WFE
; "Ich werde hierbleiben,"
; "um soviel wie möglich "
; "zu stoppen." WFE
; "Du bist noch jung,"
; "Du solltest noch mehr "
; "Erfahrung sammeln." WFE
; "Und wenn Du alle "
; "Gründe, wie "
; "alle Gefühle," WFE
; "alle Verbindungen " WFE
; "und Existenzen,"
; "herausgefunden hast,"
; "bist Du so weise wie "
; "der Meister." WFE
; PLAYER_NAME ",beeil` Dich." WFAK
; CLEARBOX 6 4
; CONT
db $10
db $02,$02,',','w','i','r',' ',$D0,$ED,$0D
db 'e','n','t','s','c','h','l','o','s','s','e','n',',',' ',$B5,$0D
db $A9,$B8,$82,$FD,$0D
db 'v','e','r','s','i','e','g','e','l','n','.','.','.','.',$11
 .seal_common:
db $87,$A9,$B8,$82,$D2,$0D
db $BF,'d','u','n','k','l','e',' ','W','e','l','t',',',' ',$B5,$0D
db $D3,$B7,'H','i','n','t','e','r','k','ö','p','f','e','n',' ',$0D
db $B6,$97,'e','x','i','s','t','i','e','r','t','.',' ',$11
db 'S','o','l','a','n','g','e',' ',$C3,'E','r','f','i','n','d','u','n','g','e','n',' ',$0D
db $AC,$BD,$A9,'g','i','b','t',',',$0D
db $F7,$D4,$F4,$B9,$0D
db 'G','l','e','i','c','h','e',' ','p','a','s','s','i','e','r','e','n','.',$11
db $8F,$F2,'h','i','e','r','b','l','e','i','b','e','n',',',$0D
db $EC,'s','o','v','i','e','l',' ',$F6,'m','ö','g','l','i','c','h',' ',$0D
db $FD,'s','t','o','p','p','e','n','.',$11
db $83,$B4,$E0,'j','u','n','g',',',$0D
db $83,'s','o','l','l','t','e','s','t',' ',$E0,'m','e','h','r',' ',$0D
db 'E','r','f','a','h','r','u','n','g',' ','s','a','m','m','e','l','n','.',$11
db 'U','n','d',' ',$F3,$83,$AE,$0D
db 'G','r','ü','n','d','e',',',' ',$F6,$0D
db $AE,'G','e','f','ü','h','l','e',',',$11
db $AE,'V','e','r','b','i','n','d','u','n','g','e','n',' ',$11
db $EB,'E','x','i','s','t','e','n','z','e','n',',',$0D
db 'h','e','r','a','u','s','g','e','f','u','n','d','e','n',' ','h','a','s','t',',',$0D
db $B4,$83,$E9,'w','e','i','s','e',' ',$F6,$0D
db $B6,'M','e','i','s','t','e','r','.',$11
db $02,$02,',','b','e','e','i','l','`',' ','D','i','c','h','.',$12
db $08,$06,$04
db $0C
; @END@

; @DEFAULT_TEXTBOX@
; "Die Welt des Bösen "
; "fing an zu "
; "verschwinden." WFAK
; CLEARBOX 6 4
; CONT
db $10
db $87,$A9,$B8,$82,$0D
db 'f','i','n','g',' ','a','n',' ',$FD,$0D
db 'v','e','r','s','c','h','w','i','n','d','e','n','.',$12
db $08,$06,$04
db $0C
; @END@


    %CopA8(DATA_CD8000)
    %Cop92($4D)
    %Cop94()
    %Cop86()
    RTL

CODE_C0D639:
LDA.W $16, X
ORA.W #$10
STA.W $16, X
%CopSetScriptAddrToNextInstruction()
;
SEP #$20
LDA.W _0472
BNE .skip
LDA.B #$2C
XBA
LDA.B #<:(.data2)
LDY.W #.data2
JSL.L CODE_C2988F
BRA .ret
.skip:
LDA.B #$2C
XBA
LDA.B #<:(.data1)
LDY.W #.data1
JSL.L CODE_C2988F
.ret:
REP #$20
RTL
.data1: dw $167F,$1610
.data2: dw $1701
.endmarker: db $00
