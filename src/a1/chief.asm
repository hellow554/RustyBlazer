A1_script_chief:
COP #$14                             ;C3ACEB|0214    |      ;
db $2E,$00,$F2,$AC                   ;C3ACED|        |00F200;
RTL                                  ;C3ACF1|6B      |      ;
COP #$85                             ;C3ACF2|0285    |      ;
db $C9,$A9,$80                       ;C3ACF4|        |      ;
COP #$17                             ;C3ACF7|0217    |      ;
db $04,$AD                           ;C3ACF9|        |0000AD;
COP #$15                             ;C3ACFB|0215    |      ;

CODE_C3ACFD:
COP #$80                             ;C3ACFD|0280    |      ;
db $1E                               ;C3ACFF|        |008202;
COP #$82                             ;C3AD00|0282    |      ;
BRA CODE_C3ACFD                      ;C3AD02|80F9    |C3ACFD;
db $02,$01,$09,$AD,$6B,$10,$56,$65   ;C3AD04|        |      ;
db $72,$67,$65,$77,$69,$73,$73,$65   ;C3AD0C|        |000067;
db $72,$65,$20,$44,$69,$63,$68,$2C   ;C3AD14|        |000065;
db $0D,$75,$6E,$74,$65,$72,$20,$61   ;C3AD1C|        |006E75;
db $6C,$6C,$65,$6E,$20,$54,$75,$6C   ;C3AD24|        |00656C;
db $70,$65,$6E,$20,$0D,$6E,$61,$63   ;C3AD2C|        |C3AD93;
db $68,$7A,$75,$73,$63,$68,$61,$75   ;C3AD34|        |      ;
db $65,$6E,$2E,$11,$8C,$6B,$2A,$6E   ;C3AD3C|        |00006E;
db $6E,$74,$65,$20,$73,$65,$69,$6E   ;C3AD44|        |006574;
db $2C,$20,$BA,$0D,$C6,$B6,$4A,$75   ;C3AD4C|        |00BA20;
db $6E,$67,$65,$6E,$2C,$0D,$C2,$64   ;C3AD54|        |006567;
db $61,$72,$75,$6E,$74,$65,$72,$20   ;C3AD5C|        |000072;
db $76,$65,$72,$2D,$0D,$73,$74,$65   ;C3AD64|        |000065;
db $63,$6B,$74,$20,$68,$61,$74,$2E   ;C3AD6C|        |00006B;
db $11,$45,$72,$20,$CF,$67,$65,$64   ;C3AD74|        |000045;
db $61,$63,$68,$74,$2C,$BA,$69,$68   ;C3AD7C|        |000063;
db $6E,$20,$0D,$6E,$69,$65,$6D,$61   ;C3AD84|        |000D20;
db $6E,$64,$20,$67,$65,$73,$65,$68   ;C3AD8C|        |002064;
db $65,$6E,$20,$68,$61,$74,$2C,$0D   ;C3AD94|        |00006E;
db $AB,$D1,$CC,$69,$68,$6E,$20,$62   ;C3AD9C|        |      ;
db $65,$2D,$0D,$6F,$62,$61,$63,$68   ;C3ADA4|        |00002D;
db $74,$65,$74,$21,$13,$F0,$C8       ;C3ADAC|        |000065;
COP #$14                             ;C3ADB3|0214    |      ;
db $09,$00,$BA,$AD                   ;C3ADB5|        |      ;
RTL                                  ;C3ADB9|6B      |      ;
COP #$30                             ;C3ADBA|0230    |      ;
db $09,$00,$54,$AE,$83               ;C3ADBC|        |      ;
COP #$11                             ;C3ADC1|0211    |      ;
db $01,$04,$08                       ;C3ADC3|        |000004;
COP #$85                             ;C3ADC6|0285    |      ;
db $C9,$A9,$80                       ;C3ADC8|        |      ;
COP #$17                             ;C3ADCB|0217    |      ;
db $3A,$AE                           ;C3ADCD|        |      ;
COP #$15                             ;C3ADCF|0215    |      ;
COP #$91                             ;C3ADD1|0291    |      ;
COP #$07                             ;C3ADD3|0207    |      ;
db $00,$9B,$E0,$AD                   ;C3ADD5|        |      ;
COP #$18                             ;C3ADD9|0218    |      ;
db $3A,$E0,$AD                       ;C3ADDB|        |      ;
BRA CODE_C3ADE1                      ;C3ADDE|8001    |C3ADE1;
RTL                                  ;C3ADE0|6B      |      ;

CODE_C3ADE1:
LDA.W #$2F80                         ;C3ADE1|A9802F  |      ;
TSB.W $0326                          ;C3ADE4|0C2603  |810326;
COP #$17                             ;C3ADE7|0217    |      ;
db $00,$00                           ;C3ADE9|        |      ;
COP #$31                             ;C3ADEB|0231    |      ;
db $00                               ;C3ADED|        |      ;
COP #$85                             ;C3ADEE|0285    |      ;
db $20,$AE,$83                       ;C3ADF0|        |C383AE;
COP #$03                             ;C3ADF3|0203    |      ;
db $F1                               ;C3ADF5|        |000002;
COP #$04                             ;C3ADF6|0204    |      ;
COP #$01                             ;C3ADF8|0201    |      ;
db $19,$B0                           ;C3ADFA|        |0002B0;
COP #$09                             ;C3ADFC|0209    |      ;
db $00,$9B                           ;C3ADFE|        |      ;
LDA.W #$2F80                         ;C3AE00|A9802F  |      ;
TSB.W $0326                          ;C3AE03|0C2603  |810326;
COP #$85                             ;C3AE06|0285    |      ;
db $2D,$AE,$83                       ;C3AE08|        |0083AE;
COP #$32                             ;C3AE0B|0232    |      ;
db $02                               ;C3AE0D|        |      ;
COP #$03                             ;C3AE0E|0203    |      ;
db $3D                               ;C3AE10|        |000402;
COP #$04                             ;C3AE11|0204    |      ;
LDA.W #$2F80                         ;C3AE13|A9802F  |      ;
TRB.W $0326                          ;C3AE16|1C2603  |810326;
COP #$17                             ;C3AE19|0217    |      ;
db $3A,$AE                           ;C3AE1B|        |      ;
COP #$91                             ;C3AE1D|0291    |      ;
RTL                                  ;C3AE1F|6B      |      ;
COP #$A8                             ;C3AE20|02A8    |      ;
db $00,$80,$8D                       ;C3AE22|        |      ;
COP #$92                             ;C3AE25|0292    |      ;
db $45                               ;C3AE27|        |000002;
COP #$94                             ;C3AE28|0294    |      ;
COP #$86                             ;C3AE2A|0286    |      ;
RTL                                  ;C3AE2C|6B      |      ;
COP #$A8                             ;C3AE2D|02A8    |      ;
db $00,$80,$8D                       ;C3AE2F|        |      ;
COP #$92                             ;C3AE32|0292    |      ;
db $46                               ;C3AE34|        |000002;
COP #$94                             ;C3AE35|0294    |      ;
COP #$86                             ;C3AE37|0286    |      ;
RTL                                  ;C3AE39|6B      |      ;
COP #$07                             ;C3AE3A|0207    |      ;
db $00,$9B,$45,$AE                   ;C3AE3C|        |      ;
COP #$18                             ;C3AE40|0218    |      ;
db $3A,$4A,$AE,$02,$01,$C6,$AF,$6B   ;C3AE42|        |      ;
COP #$01                             ;C3AE4A|0201    |      ;
db $BD,$AE                           ;C3AE4C|        |0000AE;
BRK #$5E                             ;C3AE4E|005E    |      ;
COP #$0A                             ;C3AE50|020A    |      ;
db $3A                               ;C3AE52|        |      ;
RTL                                  ;C3AE53|6B      |      ;
COP #$01                             ;C3AE54|0201    |      ;
db $5D,$AE                           ;C3AE56|        |0002AE;
COP #$37                             ;C3AE58|0237    |      ;
COP #$86                             ;C3AE5A|0286    |      ;
RTL                                  ;C3AE5C|6B      |      ;
db $10,$0E,$3C,$57,$69,$6C,$6C,$6B   ;C3AE5D|        |C3AE6D;
db $6F,$6D,$6D,$65,$6E,$20,$D3,$DD   ;C3AE65|        |656D6D;
db $0D,$5A,$69,$6D,$6D,$65,$72,$2E   ;C3AE6D|        |00695A;
db $20,$4A,$65,$74,$7A,$74,$20,$66   ;C3AE75|        |C3654A;
db $5B,$68,$6C,$65,$20,$0D,$D1,$D9   ;C3AE7D|        |      ;
db $F4,$F6,$0D,$D1,$73,$65,$6C,$62   ;C3AE85|        |000DF6;
db $73,$74,$2E,$11,$8F,$6D,$75,$25   ;C3AE8D|        |000074;
db $20,$84,$C2,$65,$72,$2D,$0D,$7A   ;C3AE95|        |C3C284;
db $7B,$68,$6C,$65,$6E,$2E,$0D,$4B   ;C3AE9D|        |      ;
db $6F,$6D,$6D,$60,$20,$B2,$7A,$75   ;C3AEA5|        |606D6D;
db $72,$5B,$63,$6B,$20,$FD,$0D,$DD   ;C3AEAD|        |00005B;
db $48,$61,$75,$73,$2E,$13,$F0,$C8   ;C3AEB5|        |      ;
db $10,$8F,$66,$5B,$68,$6C,$65,$20   ;C3AEBD|        |C3AE4E;
db $D9,$AF,$0D,$77,$7B,$72,$65,$20   ;C3AEC5|        |000DAF;
db $D1,$EE,$44,$75,$6E,$6B,$65,$6C   ;C3AECD|        |0000EE;
db $2D,$0D,$68,$65,$69,$74,$20,$75   ;C3AED5|        |00680D;
db $6D,$67,$65,$62,$65,$6E,$2E,$11   ;C3AEDD|        |006567;
db $49,$6E,$20,$BD,$44,$75,$6E,$6B   ;C3AEE5|        |      ;
db $65,$6C,$68,$65,$69,$74,$20,$0D   ;C3AEED|        |00006C;
db $68,$2A,$72,$74,$65,$20,$D1,$6D   ;C3AEF5|        |      ;
db $65,$69,$6E,$65,$6E,$20,$62,$65   ;C3AEFD|        |000069;
db $73,$74,$2D,$0D,$65,$6E,$20,$46   ;C3AF05|        |000074;
db $72,$65,$75,$6E,$64,$20,$4C,$65   ;C3AF0D|        |000065;
db $6F,$2E,$11,$45,$72,$20,$74,$72   ;C3AF15|        |45112E;
db $75,$67,$20,$DB,$61,$75,$66,$2C   ;C3AF1D|        |000067;
db $20,$B7,$0D,$62,$72,$61,$75,$6E   ;C3AF25|        |C30DB7;
db $65,$6E,$20,$A2,$C6,$0D,$50,$65   ;C3AF2D|        |00006E;
db $72,$73,$6F,$6E,$20,$FD,$67,$65   ;C3AF35|        |000073;
db $62,$65,$6E,$2C,$20,$B5,$0D,$02   ;C3AF3D|        |C31DA5;
db $02,$20,$68,$65,$69,$25,$74,$2E   ;C3AF45|        |      ;
db $11,$8F,$77,$65,$69,$25,$20,$DF   ;C3AF4D|        |00008F;
db $F6,$B6,$0D,$62,$72,$61,$75,$6E   ;C3AF55|        |0000B6;
db $65,$20,$A2,$61,$75,$73,$73,$69   ;C3AF5D|        |000020;
db $65,$68,$74,$2C,$0D,$AB,$64,$69   ;C3AF65|        |000068;
db $65,$73,$20,$D2,$65,$69,$6E,$65   ;C3AF6D|        |000073;
db $72,$2C,$0D,$B7,$D1,$EE,$69,$68   ;C3AF75|        |00002C;
db $6D,$20,$65,$72,$2D,$11,$68,$61   ;C3AF7D|        |006520;
db $6C,$74,$65,$6E,$20,$68,$61,$62   ;C3AF85|        |006574;
db $65,$2C,$20,$62,$65,$76,$6F,$72   ;C3AF8D|        |00002C;
db $20,$C8,$0D,$76,$65,$72,$73,$63   ;C3AF95|        |C30DC8;
db $68,$77,$75,$6E,$64,$65,$6E,$20   ;C3AF9D|        |      ;
db $69,$73,$74,$2E,$11,$02,$02,$2C   ;C3AFA5|        |      ;
db $20,$C1,$0D,$03,$24,$B7,$62,$72   ;C3AFAD|        |C30DC1;
db $61,$75,$6E,$65,$6E,$20,$53,$74   ;C3AFB5|        |000075;
db $65,$69,$6E,$03,$20,$2E,$13,$F0   ;C3AFBD|        |000069;
db $C8,$10,$44,$72,$2E,$93,$CF,$BF   ;C3AFC5|        |      ;
db $0D,$54,$6F,$63,$68,$74,$65,$72   ;C3AFCD|        |006F54;
db $20,$E2,$4C,$69,$73,$61,$2E,$11   ;C3AFD5|        |C34CE2;
db $8F,$F2,$DE,$46,$72,$61,$75,$20   ;C3AFDD|        |46DEF2;
db $0D,$73,$61,$67,$65,$6E,$2C,$20   ;C3AFE5|        |006173;
db $BA,$E6,$E5,$EC,$0D,$E6,$6B,$5B   ;C3AFED|        |      ;
db $6D,$6D,$65,$72,$6E,$20,$73,$6F   ;C3AFF5|        |00656D;
db $6C,$6C,$2C,$20,$62,$69,$73,$20   ;C3AFFD|        |002C6C;
db $0D,$44,$72,$2E,$93,$77,$69,$65   ;C3B005|        |007244;
db $64,$65,$72,$6B,$65,$68,$72,$74   ;C3B00D|        |000065;
db $2E,$13,$F0,$C8,$10,$50,$6C,$2A   ;C3B015|        |00F013;
db $74,$7A,$6C,$69,$63,$68,$20,$64   ;C3B01D|        |00007A;
db $6F,$6E,$6E,$65,$72,$74,$20,$B5   ;C3B025|        |656E6E;
db $0D,$A0,$B8,$4D,$65,$69,$73,$74   ;C3B02D|        |00B8A0;
db $65,$72,$73,$20,$0D,$F1,$48,$69   ;C3B035|        |000072;
db $6D,$6D,$65,$6C,$2E,$11,$3C,$88   ;C3B03D|        |00656D;
db $62,$72,$61,$75,$6E,$65,$20,$53   ;C3B045|        |C311BA;
db $74,$65,$69,$6E,$2C,$20,$B7,$0D   ;C3B04D|        |000065;
db $83,$D3,$B6,$48,$61,$6E,$64,$20   ;C3B055|        |0000D3;
db $68,$7B,$6C,$73,$74,$2C,$0D,$D2   ;C3B05D|        |      ;
db $B6,$A1,$7A,$75,$72,$20,$0D,$A9   ;C3B065|        |0000A1;
db $B8,$42,$2A,$73,$65,$6E,$2E,$11   ;C3B06D|        |      ;
db $86,$6C,$65,$62,$74,$20,$D3,$0D   ;C3B075|        |00006C;
db $BD,$57,$65,$6C,$74,$21,$11,$42   ;C3B07D|        |006557;
db $72,$69,$6E,$67,$20,$DB,$64,$69   ;C3B085|        |000069;
db $65,$73,$65,$6E,$20,$0D,$53,$74   ;C3B08D|        |000073;
db $65,$69,$6E,$21,$3E,$20,$13,$F0   ;C3B095|        |000069;
db $C8                               ;C3B09D|        |      ;
