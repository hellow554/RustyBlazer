A1_script_Lisa:
    %CopJumpIfSealed(!Lair_A1_Lisa2, +) : RTL : +
    %CopJumpIfRevealing(!Lair_A1_Lisa2, .revealing)
    %CopJumpIfEventFlagIsSet(!EV_A1_SOMETHING_WITH_LISA_AND_CHIEFS_WIFE, .todo)
    %CopJumpIfItemNotObtained(!VipCard, .lisa_still_here)
    ; lisa was kidnapped
    %Cop86()
    RTL

.lisa_still_here:
    %CopAdjustNpcYPosition(-8)
    %CopJumpIfSealed(!Lair_A1_Lisa, .xxx_sealed)
    %CopAssignTalkCallback(.talk_first)

.CODE_C3956F:
COP #$07                             ;C3956F|0207    |      ;
db $02,$83,$FB,$95                   ;C39571|        |      ;
COP #$07                             ;C39575|0207    |      ;
db $01,$83,$E1,$95                   ;C39577|        |000083;
COP #$07                             ;C3957B|0207    |      ;
db $07,$82,$D4,$95                   ;C3957D|        |000082;
COP #$07                             ;C39581|0207    |      ;
db $05,$81,$D4,$95                   ;C39583|        |000081;
COP #$07                             ;C39587|0207    |      ;
db $04,$81,$95,$95                   ;C39589|        |000081;
COP #$80                             ;C3958D|0280    |      ;
db $12                               ;C3958F|        |000002;
COP #$82                             ;C39590|0282    |      ;
BRL .CODE_C3956F                      ;C39592|82DAFF  |C3956F;
LDA.W #$AF80                         ;C39595|A980AF  |      ;
TSB.W $0326                          ;C39598|0C2603  |810326;
COP #$80                             ;C3959B|0280    |      ;
db $13                               ;C3959D|        |000002;
COP #$82                             ;C3959E|0282    |      ;
COP #$80                             ;C395A0|0280    |      ;
db $14                               ;C395A2|        |000002;
COP #$82                             ;C395A3|0282    |      ;
LDA.W #$AF80                         ;C395A5|A980AF  |      ;
TRB.W $0326                          ;C395A8|1C2603  |810326;
COP #$01                             ;C395AB|0201    |      ;
db $18,$97                           ;C395AD|        |      ;
COP #$09                             ;C395AF|0209    |      ;
db $05,$81                           ;C395B1|        |000081;
COP #$91                             ;C395B3|0291    |      ;
COP #$0D                             ;C395B5|020D    |      ;
db $00,$37,$1F,$C4,$95               ;C395B7|        |      ;
COP #$0D                             ;C395BC|020D    |      ;
db $00,$3A,$20,$C4,$95               ;C395BE|        |      ;
RTL                                  ;C395C3|6B      |      ;
COP #$01                             ;C395C4|0201    |      ;
db $40,$97                           ;C395C6|        |      ;
COP #$09                             ;C395C8|0209    |      ;
db $07,$82                           ;C395CA|        |000082;
COP #$17                             ;C395CC|0217    |      ;
db $8E,$96                           ;C395CE|        |000296;
COP #$27                             ;C395D0|0227    |      ;
db $6F,$95                           ;C395D2|        |800295;
COP #$80                             ;C395D4|0280    |      ;
db $14                               ;C395D6|        |000002;
COP #$82                             ;C395D7|0282    |      ;
COP #$17                             ;C395D9|0217    |      ;
db $8E,$96                           ;C395DB|        |000296;
COP #$27                             ;C395DD|0227    |      ;
db $6F,$95                           ;C395DF|        |800295;
COP #$80                             ;C395E1|0280    |      ;
db $14                               ;C395E3|        |000002;
COP #$82                             ;C395E4|0282    |      ;
COP #$18                             ;C395E6|0218    |      ;
db $1D,$F3,$95                       ;C395E8|        |0095F3;
COP #$17                             ;C395EB|0217    |      ;
db $9C,$96                           ;C395ED|        |000296;
COP #$27                             ;C395EF|0227    |      ;
db $6F,$95                           ;C395F1|        |170295;
COP #$17                             ;C395F3|0217    |      ;
db $97,$96                           ;C395F5|        |000096;
COP #$27                             ;C395F7|0227    |      ;
db $6F,$95                           ;C395F9|        |800295;
COP #$80                             ;C395FB|0280    |      ;
db $14                               ;C395FD|        |000002;
COP #$82                             ;C395FE|0282    |      ;
COP #$17                             ;C39600|0217    |      ;
db $A5,$96                           ;C39602|        |000096;
COP #$27                             ;C39604|0227    |      ;
db $6F,$95                           ;C39606|        |800295;

.xxx_sealed:
COP #$80                             ;C39608|0280    |      ;
db $14                               ;C3960A|        |000002;
COP #$82                             ;C3960B|0282    |      ;
COP #$17                             ;C3960D|0217    |      ;
db $AA,$96                           ;C3960F|        |      ;
COP #$91                             ;C39611|0291    |      ;
RTL                                  ;C39613|6B      |      ;
.todo:
db $A9,$C0,$BF,$0C,$26,$03,$02,$A0   ;C39614|        |      ;
db $F8,$FF,$02,$07,$01,$9F,$47,$96   ;C3961C|        |      ;
db $02,$03,$29,$02,$04,$02,$01,$52   ;C39624|        |      ;
db $9B,$02,$03,$79,$02,$04,$02,$3C   ;C3962C|        |      ;
db $04,$02,$10,$02,$03,$01,$08,$01   ;C39634|        |000002;
db $48,$03,$A9,$C0,$BF,$1C,$26,$03   ;C3963C|        |      ;
db $02,$91,$6B,$02,$34,$02,$80,$13   ;C39644|        |      ;
db $02,$82,$02,$03,$5B,$02,$04,$02   ;C3964C|        |      ;
db $01,$8E,$9B,$02,$03,$F1,$02,$04   ;C39654|        |00008E;
db $02,$10,$00,$0B,$01,$00,$00,$00   ;C3965C|        |      ;
db $00,$02,$91,$6B                   ;C39664|        |      ;

.talk_first:
COP #$07                             ;C39668|0207    |      ;
db $04,$81,$89,$96                   ;C3966A|        |000081;
COP #$19                             ;C3966E|0219    |      ;
db $1C,$84,$96                       ;C39670|        |009684;
COP #$01                             ;C39673|0201    |      ;
db $E9,$96                           ;C39675|        |      ;
COP #$3C                             ;C39677|023C    |      ;
db $04                               ;C39679|        |000002;
COP #$10                             ;C3967A|0210    |      ;
db $02,$03,$02,$20,$01,$20,$03       ;C3967C|        |      ;
RTL                                  ;C39683|6B      |      ;
db $02,$01,$0B,$97,$6B,$02,$01,$18   ;C39684|        |      ;
db $97,$6B                           ;C3968C|        |00006B;
COP #$01                             ;C3968E|0201    |      ;
db $95,$97                           ;C39690|        |000097;
COP #$09                             ;C39692|0209    |      ;
db $01,$83                           ;C39694|        |000083;
RTL                                  ;C39696|6B      |      ;
db $02,$01,$A3,$98,$6B               ;C39697|        |      ;
COP #$01                             ;C3969C|0201    |      ;
db $A7,$98                           ;C3969E|        |000098;
COP #$09                             ;C396A0|0209    |      ;
db $02,$83                           ;C396A2|        |      ;
RTL                                  ;C396A4|6B      |      ;
db $02,$01,$D2,$9A,$6B,$02,$01,$D6   ;C396A5|        |      ;
db $9A,$6B                           ;C396AD|        |      ;

.revealing:
    %CopShowText(.text_revealing)
    COP #$86
    RTL

.text_revealing:
db $10,$0E,$3C,$83,$68,$2A,$72,$73   ;C396B6|        |C396C6;
db $74,$20,$BE,$6C,$65,$69,$73,$65   ;C396BE|        |000020;
db $73,$20,$0D,$53,$63,$68,$6E,$61   ;C396C6|        |000020;
db $72,$63,$68,$65,$6E,$20,$AD,$BB   ;C396CE|        |000063;
db $0D,$49,$6E,$6E,$65,$72,$6E,$20   ;C396D6|        |006E49;
db $B8,$48,$61,$75,$73,$65,$73,$2E   ;C396DE|        |      ;
db $13,$F0,$C8,$10,$0F,$02,$02,$20   ;C396E6|        |0000F0;
db $6C,$65,$67,$74,$20,$0D,$B7,$A4   ;C396EE|        |006765;
db $AC,$B7,$0D,$4B,$6F,$70,$66,$20   ;C396F6|        |000DB7;
db $B8,$4D,$7B,$64,$63,$68,$65,$6E   ;C396FE|        |      ;
db $73,$2E,$13,$F0,$C8,$10,$5A,$7A   ;C39706|        |00002E;
db $7A,$7A,$2E,$2E,$2E,$2E,$2E,$13   ;C3970E|        |      ;
db $F0,$C8,$10,$48,$75,$63,$68,$20   ;C39716|        |C396E0;
db $21,$20,$57,$65,$72,$20,$B4,$44   ;C3971E|        |000020;
db $75,$3F,$0D,$56,$65,$72,$73,$63   ;C39726|        |00003F;
db $68,$77,$69,$6E,$64,$65,$20,$AD   ;C3972E|        |      ;
db $DD,$0D,$48,$61,$75,$73,$21,$13   ;C39736|        |00480D;
db $F0,$C8,$10,$57,$61,$72,$74,$65   ;C3973E|        |C39708;
db $21,$0D,$8C,$74,$75,$74,$20,$DB   ;C39746|        |00000D;
db $6C,$65,$69,$64,$2C,$20,$BA,$0D   ;C3974E|        |006965;
db $D1,$85,$61,$6E,$67,$65,$73,$63   ;C39756|        |000085;
db $68,$72,$69,$65,$6E,$20,$0D,$68   ;C3975E|        |      ;
db $61,$62,$65,$2E,$11,$4B,$6F,$6D   ;C39766|        |000062;
db $6D,$60,$20,$B2,$7A,$75,$72,$5B   ;C3976E|        |002060;
db $63,$6B,$2C,$0D,$EB,$68,$2A,$72   ;C39776|        |00006B;
db $65,$20,$84,$DC,$47,$65,$2D,$0D   ;C3977E|        |000020;
db $73,$63,$68,$69,$63,$68,$74,$65   ;C39786|        |000063;
db $20,$61,$6E,$2E,$13,$F0,$C8,$10   ;C3978E|        |C36E61;
db $8F,$68,$61,$74,$74,$65,$20,$C0   ;C39796|        |746168;
db $E8,$0D,$73,$65,$6C,$74,$73,$61   ;C3979E|        |      ;
db $6D,$65,$6E,$20,$54,$72,$61,$75   ;C397A6|        |006E65;
db $6D,$2E,$20,$8C,$0D,$67,$69,$6E   ;C397AE|        |00202E;
db $67,$20,$EC,$6D,$65,$69,$6E,$65   ;C397B6|        |000020;
db $6E,$20,$56,$61,$74,$65,$72,$2C   ;C397BE|        |005620;
db $0D,$EB,$6A,$65,$6D,$61,$6E,$64   ;C397C6|        |006AEB;
db $65,$6E,$20,$B6,$F6,$11,$83,$61   ;C397CE|        |00006E;
db $75,$73,$73,$61,$68,$2E,$20,$98   ;C397D6|        |000073;
db $56,$61,$74,$65,$72,$20,$0D,$74   ;C397DE|        |000061;
db $72,$75,$67,$20,$DB,$61,$75,$66   ;C397E6|        |000075;
db $2C,$20,$84,$0D,$64,$69,$65,$73   ;C397EE|        |008420;
db $65,$6E,$20,$50,$69,$6E,$73,$65   ;C397F6|        |00006E;
db $6C,$20,$FD,$67,$65,$62,$65,$6E   ;C397FE|        |00FD20;
db $20,$0D,$EB,$84,$61,$6C,$6C,$65   ;C39806|        |C3EB0D;
db $73,$20,$FD,$65,$72,$2D,$11,$7A   ;C3980E|        |000020;
db $7B,$68,$6C,$65,$6E,$2C,$20,$F9   ;C39816|        |      ;
db $D1,$77,$65,$69,$25,$2E,$0D,$44   ;C3981E|        |000077;
db $69,$65,$73,$65,$72,$20,$50,$69   ;C39826|        |      ;
db $6E,$73,$65,$6C,$20,$D2,$0D,$61   ;C3982E|        |006573;
db $6C,$6C,$65,$73,$2C,$20,$F9,$DB   ;C39836|        |00656C;
db $EE,$0D,$DD,$56,$61,$74,$65,$72   ;C3983E|        |00DD0D;
db $20,$62,$6C,$69,$65,$62,$2E,$11   ;C39846|        |C36C62;
db $8F,$CC,$69,$68,$6E,$20,$CE,$0D   ;C3984E|        |6869CC;
db $69,$72,$67,$65,$6E,$64,$77,$6F   ;C39856|        |      ;
db $20,$76,$65,$72,$73,$74,$65,$63   ;C3985E|        |C36576;
db $6B,$74,$2E,$11,$A8,$83,$DB,$64   ;C39866|        |      ;
db $69,$65,$73,$65,$6E,$20,$0D,$50   ;C3986E|        |      ;
db $69,$6E,$73,$65,$6C,$20,$62,$72   ;C39876|        |      ;
db $69,$6E,$67,$73,$74,$2C,$20,$F2   ;C3987E|        |      ;
db $0D,$D1,$84,$61,$6C,$6C,$65,$73   ;C39886|        |0084D1;
db $20,$65,$72,$7A,$7B,$68,$6C,$65   ;C3988E|        |C37265;
db $6E,$20,$0D,$F9,$D1,$77,$65,$69   ;C39896|        |000D20;
db $25,$2E,$13,$F0,$C8,$10,$13,$25   ;C3989E|        |00002E;
db $98,$10,$4F,$68,$21,$20,$83,$CD   ;C398A6|        |      ;
db $B7,$50,$69,$6E,$73,$65,$6C,$20   ;C398AE|        |000050;
db $0D,$6D,$65,$69,$6E,$65,$73,$20   ;C398B6|        |00656D;
db $56,$61,$74,$65,$72,$73,$20,$0D   ;C398BE|        |000061;
db $67,$65,$66,$75,$6E,$64,$65,$6E   ;C398C6|        |000065;
db $2E,$20,$8F,$F2,$0D,$84,$61,$6C   ;C398CE|        |008F20;
db $6C,$65,$73,$20,$65,$72,$7A,$7B   ;C398D6|        |007365;
db $68,$6C,$65,$6E,$2E,$11,$4F,$68   ;C398DE|        |      ;
db $21,$20,$83,$CD,$B7,$50,$69,$6E   ;C398E6|        |000020;
db $73,$65,$6C,$20,$0D,$67,$65,$66   ;C398EE|        |000065;
db $75,$6E,$64,$65,$6E,$2E,$20,$8F   ;C398F6|        |00006E;
db $F2,$0D,$84,$6E,$75,$6E,$20,$61   ;C398FE|        |00000D;
db $6C,$6C,$65,$73,$20,$65,$72,$7A   ;C39906|        |00656C;
db $7B,$68,$6C,$65,$6E,$20,$0D,$F9   ;C3990E|        |      ;
db $D1,$77,$65,$69,$25,$2E,$11,$45   ;C39916|        |000077;
db $69,$6E,$65,$73,$20,$A6,$6B,$61   ;C3991E|        |      ;
db $6D,$20,$D1,$0D,$F1,$45,$69,$6E   ;C39926|        |00D120;
db $6B,$61,$75,$66,$65,$6E,$20,$7A   ;C3992E|        |      ;
db $75,$72,$5B,$63,$6B,$2C,$0D,$EB   ;C39936|        |000072;
db $66,$61,$6E,$64,$20,$C0,$5A,$65   ;C3993E|        |000061;
db $74,$74,$65,$6C,$2E,$11,$94,$CF   ;C39946|        |000074;
db $B7,$5A,$65,$74,$74,$65,$6C,$20   ;C3994E|        |00005A;
db $0D,$68,$65,$72,$76,$6F,$72,$67   ;C39956|        |006568;
db $65,$68,$6F,$6C,$74,$2C,$20,$EB   ;C3995E|        |000068;
db $61,$6E,$2D,$0D,$67,$65,$66,$61   ;C39966|        |00006E;
db $6E,$67,$65,$6E,$20,$FD,$6C,$65   ;C3996E|        |006567;
db $73,$65,$6E,$2E,$11,$3C,$4C,$69   ;C39976|        |000065;
db $73,$61,$2C,$20,$D1,$F2,$85,$0D   ;C3997E|        |000061;
db $BF,$57,$65,$69,$6C,$65,$20,$DF   ;C39986|        |696557;
db $73,$65,$68,$65,$6E,$20,$0D,$6B   ;C3998E|        |000065;
db $2A,$6E,$6E,$65,$6E,$2E,$20,$46   ;C39996|        |      ;
db $61,$6C,$6C,$73,$20,$83,$0D,$69   ;C3999E|        |00006C;
db $72,$67,$65,$6E,$64,$77,$65,$6C   ;C399A6|        |000067;
db $63,$68,$65,$20,$50,$72,$6F,$62   ;C399AE|        |000068;
db $6C,$65,$6D,$65,$20,$11,$68,$61   ;C399B6|        |006D65;
db $73,$74,$2C,$20,$73,$70,$72,$69   ;C399BE|        |000074;
db $63,$68,$20,$DA,$BB,$0D,$42,$5B   ;C399C6|        |000068;
db $72,$67,$65,$72,$6D,$65,$69,$73   ;C399CE|        |000067;
db $74,$65,$72,$2E,$11,$47,$69,$62   ;C399D6|        |000065;
db $20,$AC,$44,$65,$69,$6E,$65,$20   ;C399DE|        |C344AC;
db $46,$72,$65,$75,$6E,$64,$65,$20   ;C399E6|        |000072;
db $0D,$54,$75,$72,$62,$6F,$2C,$20   ;C399EE|        |007554;
db $B7,$48,$75,$6E,$64,$2C,$20,$11   ;C399F6|        |000048;
db $4C,$75,$65,$2C,$20,$B7,$44,$65   ;C399FE|        |C36575;
db $6C,$70,$68,$69,$6E,$2C,$20,$11   ;C39A06|        |006870;
db $4E,$6F,$6D,$65,$2C,$20,$B5,$53   ;C39A0E|        |006D6F;
db $63,$68,$6E,$65,$63,$6B,$65,$2C   ;C39A16|        |000068;
db $20,$11,$EB,$4D,$61,$72,$69,$65   ;C39A1E|        |C3EB11;
db $2C,$20,$B5,$50,$75,$70,$70,$65   ;C39A26|        |00B520;
db $20,$0D,$61,$63,$68,$74,$2E,$3E   ;C39A2E|        |C3610D;
db $20,$11,$87,$54,$69,$65,$72,$65   ;C39A36|        |C38711;
db $2C,$20,$B5,$C8,$67,$65,$2D,$0D   ;C39A3E|        |00B520;
db $6E,$61,$6E,$6E,$74,$20,$68,$61   ;C39A46|        |006E61;
db $74,$2C,$20,$77,$61,$72,$65,$6E   ;C39A4E|        |00002C;
db $20,$65,$69,$6E,$2D,$0D,$6D,$61   ;C39A56|        |C36965;
db $6C,$20,$73,$65,$69,$6E,$65,$20   ;C39A5E|        |007320;
db $48,$61,$75,$73,$74,$69,$65,$72   ;C39A66|        |      ;
db $65,$2E,$11,$8F,$76,$65,$72,$73   ;C39A6E|        |00002E;
db $74,$65,$68,$65,$20,$6A,$65,$64   ;C39A76|        |000065;
db $6F,$63,$68,$20,$0D,$6E,$69,$63   ;C39A7E|        |206863;
db $68,$74,$2C,$20,$F9,$C8,$DB,$0D   ;C39A86|        |      ;
db $73,$61,$67,$65,$6E,$20,$77,$69   ;C39A8E|        |000061;
db $6C,$6C,$2E,$11,$8F,$77,$65,$69   ;C39A96|        |002E6C;
db $25,$2C,$20,$BA,$83,$0D,$BE,$46   ;C39A9E|        |00002C;
db $72,$65,$6D,$64,$65,$72,$20,$62   ;C39AA6|        |000065;
db $69,$73,$74,$2C,$20,$AB,$0D,$77   ;C39AAE|        |      ;
db $5B,$72,$64,$65,$73,$74,$20,$83   ;C39AB6|        |      ;
db $E3,$DD,$0D,$56,$61,$74,$65,$72   ;C39ABE|        |0000DD;
db $20,$73,$75,$63,$68,$65,$6E,$20   ;C39AC6|        |C37573;
db $3F,$13,$F0,$C8,$10,$13,$9A,$9A   ;C39ACE|        |C8F013;
db $10,$8C,$CB,$4C,$65,$75,$74,$65   ;C39AD6|        |C39A64;
db $2C,$20,$B5,$0D,$67,$6C,$61,$75   ;C39ADE|        |00B520;
db $62,$65,$6E,$2C,$20,$BA,$6D,$61   ;C39AE6|        |C3094E;
db $6E,$20,$E3,$0D,$BB,$54,$6F,$64   ;C39AEE|        |00E320;
db $20,$D3,$C6,$61,$6E,$2D,$0D,$64   ;C39AF6|        |C3C6D3;
db $65,$72,$65,$6E,$20,$46,$6F,$72   ;C39AFE|        |000072;
db $6D,$20,$77,$69,$65,$64,$65,$72   ;C39B06|        |007720;
db $6B,$65,$68,$72,$74,$20,$11,$A8   ;C39B0E|        |      ;
db $B9,$73,$74,$69,$6D,$6D,$74,$2C   ;C39B16|        |007473;
db $20,$64,$61,$6E,$6E,$20,$0D,$66   ;C39B1E|        |C36164;
db $72,$61,$67,$65,$20,$D1,$6D,$69   ;C39B26|        |000061;
db $63,$68,$2C,$20,$F9,$0D,$DC,$4D   ;C39B2E|        |000068;
db $75,$74,$74,$65,$72,$20,$77,$6F   ;C39B36|        |000074;
db $68,$6C,$20,$67,$65,$2D,$0D,$72   ;C39B3E|        |      ;
db $61,$64,$65,$20,$74,$75,$74,$20   ;C39B46|        |000064;
db $3F,$13,$F0,$C8,$10,$0F,$8C,$73   ;C39B4E|        |C8F013;
db $63,$68,$65,$69,$6E,$74,$2C,$20   ;C39B56|        |000068;
db $AF,$6F,$62,$20,$0D,$94,$73,$63   ;C39B5E|        |20626F;
db $68,$6C,$7B,$66,$74,$2E,$0D,$0E   ;C39B66|        |      ;
db $5A,$02,$02,$2C,$20,$6C,$65,$67   ;C39B6E|        |      ;
db $74,$20,$0D,$B7,$A4,$AC,$0D,$4C   ;C39B76|        |000020;
db $69,$73,$61,$60,$73,$20,$4B,$6F   ;C39B7E|        |      ;
db $70,$66,$2E,$0E,$78,$13,$F1,$C8   ;C39B86|        |C39BEE;
db $10,$02,$02,$2C,$0D,$76,$65,$72   ;C39B8E|        |C39B92;
db $73,$70,$72,$69,$63,$68,$60,$20   ;C39B96|        |000070;
db $6D,$69,$72,$2C,$20,$BA,$0D,$83   ;C39B9E|        |007269;
db $C5,$A6,$7A,$75,$72,$5B,$63,$6B   ;C39BA6|        |0000A6;
db $2D,$0D,$6B,$65,$68,$72,$65,$6E   ;C39BAE|        |006B0D;
db $20,$77,$69,$72,$73,$74,$21,$0E   ;C39BB6|        |C36977;
db $B4,$13,$F1,$C8                   ;C39BBE|        |000013;