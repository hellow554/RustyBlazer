
printOsdStringFromBankX:
PHP                                  ;C2AC12|08      |      ;
PHB                                  ;C2AC13|8B      |      ;
SEP #$20                             ;C2AC14|E220    |      ;
LDA.B $01,S                          ;C2AC16|A301    |000001;
CMP.B #$81                           ;C2AC18|C981    |      ;
BNE CODE_C2AC20                      ;C2AC1A|D004    |C2AC20;
LDA.B #$82                           ;C2AC1C|A982    |      ;
PHA                                  ;C2AC1E|48      |      ;
PLB                                  ;C2AC1F|AB      |      ;

CODE_C2AC20:
LDA.B #$20                           ;C2AC20|A920    |      ;
STA.W $03EB                          ;C2AC22|8DEB03  |8003EB;
LDA.B #$01                           ;C2AC25|A901    |      ;
STA.W $03F7                          ;C2AC27|8DF703  |8003F7;
STZ.W $03FB                          ;C2AC2A|9CFB03  |8003FB;
LDA.W $0000,Y                        ;C2AC2D|B90000  |800000;
CMP.B #$01                           ;C2AC30|C901    |      ;
BEQ UNREACH_C2AC57                   ;C2AC32|F023    |C2AC57;
CMP.B #$10                           ;C2AC34|C910    |      ;
BEQ CODE_C2AC47                      ;C2AC36|F00F    |C2AC47;
LDX.W $03F5                          ;C2AC38|AEF503  |8003F5;
PHX                                  ;C2AC3B|DA      |      ;
LDA.W $1B84                          ;C2AC3C|AD841B  |801B84;
BEQ UNREACH_C2AC44                   ;C2AC3F|F003    |C2AC44;
BRL CODE_C2AF26                      ;C2AC41|82E202  |C2AF26;

UNREACH_C2AC44:
db $82,$12,$01                       ;C2AC44|        |C2AD59;

CODE_C2AC47:
INY                                  ;C2AC47|C8      |      ;
LDX.W #$0406                         ;C2AC48|A20604  |      ;
PHX                                  ;C2AC4B|DA      |      ;
LDA.B #$18                           ;C2AC4C|A918    |      ;
STA.B $00                            ;C2AC4E|8500    |000000;
LDA.B #$09                           ;C2AC50|A909    |      ;
STA.B $02                            ;C2AC52|8502    |000002;
BRL CODE_C2ADC5                      ;C2AC54|826E01  |C2ADC5;

UNREACH_C2AC57:
db $DA                               ;C2AC57|        |      ;

CODE_C2AC58:
JSR.W CODE_C2AF59                    ;C2AC58|2059AF  |C2AF59;
CMP.B #$0D                           ;C2AC5B|C90D    |      ;
BNE CODE_C2AC62                      ;C2AC5D|D003    |C2AC62;
BRL CODE_C2AF26                      ;C2AC5F|82C402  |C2AF26;

CODE_C2AC62:
CMP.B #$14                           ;C2AC62|C914    |      ;
BNE CODE_C2AC69                      ;C2AC64|D003    |C2AC69;
db $82,$D5,$00                       ;C2AC66|        |C2AD3E;

CODE_C2AC69:
BCS CODE_C2ACE2                      ;C2AC69|B077    |C2ACE2;
CMP.B #$00                           ;C2AC6B|C900    |      ;
BNE CODE_C2AC72                      ;C2AC6D|D003    |C2AC72;
db $82,$D8,$02                       ;C2AC6F|        |C2AF4A;

CODE_C2AC72:
DEC A                                ;C2AC72|3A      |      ;
BNE CODE_C2AC78                      ;C2AC73|D003    |C2AC78;
db $82,$7A,$02                       ;C2AC75|        |C2AEF2;

CODE_C2AC78:
DEC A                                ;C2AC78|3A      |      ;
BNE CODE_C2AC7E                      ;C2AC79|D003    |C2AC7E;
BRL CODE_C2AECB                      ;C2AC7B|824D02  |C2AECB;

CODE_C2AC7E:
DEC A                                ;C2AC7E|3A      |      ;
BNE CODE_C2AC84                      ;C2AC7F|D003    |C2AC84;
BRL CODE_C2AEBC                      ;C2AC81|823802  |C2AEBC;

CODE_C2AC84:
DEC A                                ;C2AC84|3A      |      ;
BNE CODE_C2AC8A                      ;C2AC85|D003    |C2AC8A;
db $82,$0E,$02                       ;C2AC87|        |C2AE98;

CODE_C2AC8A:
DEC A                                ;C2AC8A|3A      |      ;
BNE CODE_C2AC90                      ;C2AC8B|D003    |C2AC90;
BRL CODE_C2AE65                      ;C2AC8D|82D501  |C2AE65;

CODE_C2AC90:
DEC A                                ;C2AC90|3A      |      ;
BNE CODE_C2AC96                      ;C2AC91|D003    |C2AC96;
BRL CODE_C2ADD6                      ;C2AC93|824001  |C2ADD6;

CODE_C2AC96:
DEC A                                ;C2AC96|3A      |      ;
BNE CODE_C2AC9C                      ;C2AC97|D003    |C2AC9C;
db $82,$1D,$01                       ;C2AC99|        |C2ADB9;

CODE_C2AC9C:
DEC A                                ;C2AC9C|3A      |      ;
BNE CODE_C2ACA2                      ;C2AC9D|D003    |C2ACA2;
BRL CODE_C2ADA7                      ;C2AC9F|820501  |C2ADA7;

CODE_C2ACA2:
DEC A                                ;C2ACA2|3A      |      ;
BNE CODE_C2ACA8                      ;C2ACA3|D003    |C2ACA8;
db $82,$F4,$00                       ;C2ACA5|        |C2AD9C;

CODE_C2ACA8:
DEC A                                ;C2ACA8|3A      |      ;
BNE CODE_C2ACAE                      ;C2ACA9|D003    |C2ACAE;
db $82,$E3,$00                       ;C2ACAB|        |C2AD91;

CODE_C2ACAE:
DEC A                                ;C2ACAE|3A      |      ;
BNE CODE_C2ACB4                      ;C2ACAF|D003    |C2ACB4;
db $82,$D7,$00                       ;C2ACB1|        |C2AD8B;

CODE_C2ACB4:
DEC A                                ;C2ACB4|3A      |      ;
BNE CODE_C2ACBA                      ;C2ACB5|D003    |C2ACBA;
BRL CODE_C2AF4D                      ;C2ACB7|829302  |C2AF4D;

CODE_C2ACBA:
DEC A                                ;C2ACBA|3A      |      ;
DEC A                                ;C2ACBB|3A      |      ;
BNE CODE_C2ACC1                      ;C2ACBC|D003    |C2ACC1;
BRL CODE_C2AD7B                      ;C2ACBE|82BA00  |C2AD7B;

CODE_C2ACC1:
DEC A                                ;C2ACC1|3A      |      ;
BNE CODE_C2ACC7                      ;C2ACC2|D003    |C2ACC7;
BRL CODE_C2AD70                      ;C2ACC4|82A900  |C2AD70;

CODE_C2ACC7:
DEC A                                ;C2ACC7|3A      |      ;
BNE CODE_C2ACCD                      ;C2ACC8|D003    |C2ACCD;
db $82,$8C,$00                       ;C2ACCA|        |C2AD59;

CODE_C2ACCD:
DEC A                                ;C2ACCD|3A      |      ;
BNE CODE_C2ACD3                      ;C2ACCE|D003    |C2ACD3;
BRL CODE_C2AF03                      ;C2ACD0|823002  |C2AF03;

CODE_C2ACD3:
DEC A                                ;C2ACD3|3A      |      ;
BNE CODE_C2ACD9                      ;C2ACD4|D003    |C2ACD9;
BRL CODE_C2AD53                      ;C2ACD6|827A00  |C2AD53;

CODE_C2ACD9:
DEC A                                ;C2ACD9|3A      |      ;
BNE UNREACH_C2ACDF                   ;C2ACDA|D003    |C2ACDF;
BRL CODE_C2AD33                      ;C2ACDC|825400  |C2AD33;

UNREACH_C2ACDF:
db $82,$76,$FF                       ;C2ACDF|        |C2AC58;

CODE_C2ACE2:
ORA.W $03FB                          ;C2ACE2|0DFB03  |8003FB;
STA.L L3_Text,X                      ;C2ACE5|9F00707F|7F7000;
XBA                                  ;C2ACE9|EB      |      ;
LDA.W $03EB                          ;C2ACEA|ADEB03  |8003EB;
STA.L $7F7001,X                      ;C2ACED|9F01707F|7F7001;
INX                                  ;C2ACF1|E8      |      ;
INX                                  ;C2ACF2|E8      |      ;
BIT.B #$02                           ;C2ACF3|8902    |      ;
BNE UNREACH_C2AD03                   ;C2ACF5|D00C    |C2AD03;
INC A                                ;C2ACF7|1A      |      ;
STA.L $7F6FBF,X                      ;C2ACF8|9FBF6F7F|7F6FBF;
XBA                                  ;C2ACFC|EB      |      ;
STA.L $7F6FBE,X                      ;C2ACFD|9FBE6F7F|7F6FBE;
BRA CODE_C2AD2D                      ;C2AD01|802A    |C2AD2D;

UNREACH_C2AD03:
db $BF,$BE,$6F,$7F,$C9,$FE,$90,$06   ;C2AD03|        |7F6FBE;
db $A9,$20,$9F,$BE,$6F,$7F,$EB,$C9   ;C2AD0B|        |      ;
db $F4,$B0,$08,$C9,$CC,$90,$13,$A9   ;C2AD13|        |0008B0;
db $FE,$80,$02,$A9,$FF,$9F,$BE,$6F   ;C2AD1B|        |000280;
db $7F,$EB,$AD,$EB,$03,$9F,$BF,$6F   ;C2AD23|        |EBADEB;
db $7F,$EB                           ;C2AD2B|        |2420EB;

CODE_C2AD2D:
JSR.W print_string_with_delay                    ;C2AD2D|2024B1  |C2B124;
BRL CODE_C2AC58                      ;C2AD30|8225FF  |C2AC58;

CODE_C2AD33:
LDA.W $0001,Y                        ;C2AD33|B90100  |800001;
XBA                                  ;C2AD36|EB      |      ;
LDA.W $0000,Y                        ;C2AD37|B90000  |800000;
TAY                                  ;C2AD3A|A8      |      ;
BRL CODE_C2AC58                      ;C2AD3B|821AFF  |C2AC58;
db $A9,$20,$EB,$B9,$00,$00,$C8,$EB   ;C2AD3E|        |      ;
db $9F,$00,$70,$7F,$E8,$E8,$EB,$3A   ;C2AD46|        |7F7000;
db $D0,$F5,$82,$05,$FF               ;C2AD4E|        |C2AD45;

CODE_C2AD53:
JSR.W CODE_C2B14A                    ;C2AD53|204AB1  |C2B14A;
BRL CODE_C2AC58                      ;C2AD56|82FFFE  |C2AC58;
db $FA,$20,$CA,$B0,$20,$0F,$B0,$C2   ;C2AD59|        |      ;
db $20,$AD,$ED,$03,$18,$69,$40,$00   ;C2AD61|        |C2EDAD;
db $AA,$DA,$E2,$20,$82,$E8,$FE       ;C2AD69|        |      ;

CODE_C2AD70:
LDA.W $03F7                          ;C2AD70|ADF703  |8303F7;
EOR.B #$01                           ;C2AD73|4901    |      ;
STA.W $03F7                          ;C2AD75|8DF703  |8303F7;
BRL CODE_C2AC58                      ;C2AD78|82DDFE  |C2AC58;

CODE_C2AD7B:
LDA.W $1B84                          ;C2AD7B|AD841B  |831B84;
BEQ CODE_C2AD87                      ;C2AD7E|F007    |C2AD87;
LDA.W $0000,Y                        ;C2AD80|B90000  |830000;
JSL.L CODE_C2B140                    ;C2AD83|2240B182|82B140;

CODE_C2AD87:
INY                                  ;C2AD87|C8      |      ;
BRL CODE_C2AC58                      ;C2AD88|82CDFE  |C2AC58;
db $C8,$C8,$C8,$82,$C7,$FE,$AD,$FB   ;C2AD8B|        |      ;
db $03,$49,$80,$8D,$FB,$03,$82,$BC   ;C2AD93|        |000049;
db $FE,$AD,$EB,$03,$49,$02,$8D,$EB   ;C2AD9B|        |00EBAD;
db $03,$82,$B1,$FE                   ;C2ADA3|        |000082;

CODE_C2ADA7:
PHX                                  ;C2ADA7|DA      |      ;
REP #$20                             ;C2ADA8|C220    |      ;
LDX.W $0000,Y                        ;C2ADAA|BE0000  |800000;
INY                                  ;C2ADAD|C8      |      ;
INY                                  ;C2ADAE|C8      |      ;
SEP #$20                             ;C2ADAF|E220    |      ;
JSL.L clearTextbox                    ;C2ADB1|22C5AB82|82ABC5;
PLX                                  ;C2ADB5|FA      |      ;
BRL CODE_C2AC58                      ;C2ADB6|829FFE  |C2AC58;
db $B9,$00,$00,$C8,$85,$00,$B9,$00   ;C2ADB9|        |000000;
db $00,$C8,$85,$02                   ;C2ADC1|        |      ;

CODE_C2ADC5:
JSR.W CODE_C2AB48                    ;C2ADC5|2048AB  |C2AB48;
REP #$20                             ;C2ADC8|C220    |      ;
PLA                                  ;C2ADCA|68      |      ;
CLC                                  ;C2ADCB|18      |      ;
ADC.W #$0082                         ;C2ADCC|698200  |      ;
TAX                                  ;C2ADCF|AA      |      ;
PHX                                  ;C2ADD0|DA      |      ;
SEP #$20                             ;C2ADD1|E220    |      ;
BRL CODE_C2AC58                      ;C2ADD3|8282FE  |C2AC58;

CODE_C2ADD6:
LDA.W $0000,Y                        ;C2ADD6|B90000  |820000;
INY                                  ;C2ADD9|C8      |      ;
STA.B $00                            ;C2ADDA|8500    |000000;
STA.B $02                            ;C2ADDC|8502    |000002;
REP #$20                             ;C2ADDE|C220    |      ;
DEC A                                ;C2ADE0|3A      |      ;
AND.W #$00FF                         ;C2ADE1|29FF00  |      ;
ASL A                                ;C2ADE4|0A      |      ;
PHX                                  ;C2ADE5|DA      |      ;
CLC                                  ;C2ADE6|18      |      ;
ADC.B $01,S                          ;C2ADE7|6301    |000001;
STA.B $01,S                          ;C2ADE9|8301    |000001;
TAX                                  ;C2ADEB|AA      |      ;
LDA.W $0000,Y                        ;C2ADEC|B90000  |820000;
INY                                  ;C2ADEF|C8      |      ;
INY                                  ;C2ADF0|C8      |      ;
PHY                                  ;C2ADF1|5A      |      ;
TAY                                  ;C2ADF2|A8      |      ;
SEP #$20                             ;C2ADF3|E220    |      ;
LDA.W $03EB                          ;C2ADF5|ADEB03  |8203EB;
XBA                                  ;C2ADF8|EB      |      ;

CODE_C2ADF9:
LDA.W $0000,Y                        ;C2ADF9|B90000  |820000;
AND.B #$0F                           ;C2ADFC|290F    |      ;
ORA.B #$30                           ;C2ADFE|0930    |      ;
REP #$20                             ;C2AE00|C220    |      ;
STA.L L3_Text,X                      ;C2AE02|9F00707F|7F7000;
DEX                                  ;C2AE06|CA      |      ;
DEX                                  ;C2AE07|CA      |      ;
SEP #$20                             ;C2AE08|E220    |      ;
DEC.B $00                            ;C2AE0A|C600    |000000;
BEQ CODE_C2AE28                      ;C2AE0C|F01A    |C2AE28;
LDA.W $0000,Y                        ;C2AE0E|B90000  |820000;
INY                                  ;C2AE11|C8      |      ;
AND.B #$F0                           ;C2AE12|29F0    |      ;
LSR A                                ;C2AE14|4A      |      ;
LSR A                                ;C2AE15|4A      |      ;
LSR A                                ;C2AE16|4A      |      ;
LSR A                                ;C2AE17|4A      |      ;
ORA.B #$30                           ;C2AE18|0930    |      ;
REP #$20                             ;C2AE1A|C220    |      ;
STA.L L3_Text,X                      ;C2AE1C|9F00707F|7F7000;
DEX                                  ;C2AE20|CA      |      ;
DEX                                  ;C2AE21|CA      |      ;
SEP #$20                             ;C2AE22|E220    |      ;
DEC.B $00                            ;C2AE24|C600    |000000;
BNE CODE_C2ADF9                      ;C2AE26|D0D1    |C2ADF9;

CODE_C2AE28:
INX                                  ;C2AE28|E8      |      ;
INX                                  ;C2AE29|E8      |      ;
DEC.B $02                            ;C2AE2A|C602    |000002;
BEQ CODE_C2AE3E                      ;C2AE2C|F010    |C2AE3E;
LDA.L L3_Text,X                      ;C2AE2E|BF00707F|7F7000;
CMP.B #$30                           ;C2AE32|C930    |      ;
BNE CODE_C2AE3E                      ;C2AE34|D008    |C2AE3E;
LDA.B #$20                           ;C2AE36|A920    |      ;
STA.L L3_Text,X                      ;C2AE38|9F00707F|7F7000;
BRA CODE_C2AE28                      ;C2AE3C|80EA    |C2AE28;

CODE_C2AE3E:
XBA                                  ;C2AE3E|EB      |      ;
BIT.B #$02                           ;C2AE3F|8902    |      ;
BNE CODE_C2AE5E                      ;C2AE41|D01B    |C2AE5E;
XBA                                  ;C2AE43|EB      |      ;
INC.B $02                            ;C2AE44|E602    |000002;

CODE_C2AE46:
LDA.L L3_Text,X                      ;C2AE46|BF00707F|7F7000;
REP #$20                             ;C2AE4A|C220    |      ;
ORA.W #$0100                         ;C2AE4C|090001  |      ;
STA.L L3_Text-!Row_Width,X                      ;C2AE4F|9FC06F7F|7F6FC0;
AND.W #$FEFF                         ;C2AE53|29FFFE  |      ;
SEP #$20                             ;C2AE56|E220    |      ;
INX                                  ;C2AE58|E8      |      ;
INX                                  ;C2AE59|E8      |      ;
DEC.B $02                            ;C2AE5A|C602    |000002;
BNE CODE_C2AE46                      ;C2AE5C|D0E8    |C2AE46;

CODE_C2AE5E:
PLY                                  ;C2AE5E|7A      |      ;
PLX                                  ;C2AE5F|FA      |      ;
INX                                  ;C2AE60|E8      |      ;
INX                                  ;C2AE61|E8      |      ;
BRL CODE_C2AC58                      ;C2AE62|82F3FD  |C2AC58;

CODE_C2AE65:
REP #$20                             ;C2AE65|C220    |      ;
LDA.W $0000,Y                        ;C2AE67|B90000  |820000;
INY                                  ;C2AE6A|C8      |      ;
INY                                  ;C2AE6B|C8      |      ;
STA.B $00                            ;C2AE6C|8500    |000000;
LDA.W $0000,Y                        ;C2AE6E|B90000  |820000;
INY                                  ;C2AE71|C8      |      ;
INY                                  ;C2AE72|C8      |      ;
PHY                                  ;C2AE73|5A      |      ;
TAY                                  ;C2AE74|A8      |      ;
LDA.W $0000,Y                        ;C2AE75|B90000  |820000;
ASL A                                ;C2AE78|0A      |      ;
CLC                                  ;C2AE79|18      |      ;
ADC.B $00                            ;C2AE7A|6500    |000000;
TAY                                  ;C2AE7C|A8      |      ;
SEP #$20                             ;C2AE7D|E220    |      ;
PHB                                  ;C2AE7F|8B      |      ;
LDA.B #$82                           ;C2AE80|A982    |      ;
PHA                                  ;C2AE82|48      |      ;
PLB                                  ;C2AE83|AB      |      ;
REP #$20                             ;C2AE84|C220    |      ;
LDA.W $0000,Y                        ;C2AE86|B90000  |820000;
TAY                                  ;C2AE89|A8      |      ;
SEP #$20                             ;C2AE8A|E220    |      ;
LDA.W $03EB                          ;C2AE8C|ADEB03  |8203EB;
XBA                                  ;C2AE8F|EB      |      ;
JSR.W CODE_C2AFDF                    ;C2AE90|20DFAF  |C2AFDF;
PLB                                  ;C2AE93|AB      |      ;
PLY                                  ;C2AE94|7A      |      ;
BRL CODE_C2AC58                      ;C2AE95|82C0FD  |C2AC58;
db $C2,$20,$5A,$B9,$00,$00,$A8,$B9   ;C2AE98|        |      ;
db $00,$00,$85,$00,$7A,$5A,$B9,$02   ;C2AEA0|        |      ;
db $00,$A8,$B9,$00,$00,$85,$02,$E2   ;C2AEA8|        |      ;
db $20,$20,$AA,$AA,$7A,$C8,$C8,$C8   ;C2AEB0|        |C2AA20;
db $C8,$82,$9C,$FD                   ;C2AEB8|        |      ;

CODE_C2AEBC:
LDA.W $03EB                          ;C2AEBC|ADEB03  |8203EB;
AND.B #$E3                           ;C2AEBF|29E3    |      ;
ORA.W $0000,Y                        ;C2AEC1|190000  |820000;
INY                                  ;C2AEC4|C8      |      ;
STA.W $03EB                          ;C2AEC5|8DEB03  |8203EB;
BRL CODE_C2AC58                      ;C2AEC8|828DFD  |C2AC58;

CODE_C2AECB:
LDA.W $0000,Y                        ;C2AECB|B90000  |800000;
INY                                  ;C2AECE|C8      |      ;
PHY                                  ;C2AECF|5A      |      ;
REP #$20                             ;C2AED0|C220    |      ;
AND.W #$00FF                         ;C2AED2|29FF00  |      ;
ASL A                                ;C2AED5|0A      |      ;
TAY                                  ;C2AED6|A8      |      ;
SEP #$20                             ;C2AED7|E220    |      ;
PHB                                  ;C2AED9|8B      |      ;
LDA.B #$82                           ;C2AEDA|A982    |      ;
PHA                                  ;C2AEDC|48      |      ;
PLB                                  ;C2AEDD|AB      |      ;
REP #$20                             ;C2AEDE|C220    |      ;
LDA.W osd2lut,Y               ;C2AEE0|B95BC9  |82C95B;
TAY                                  ;C2AEE3|A8      |      ;
SEP #$20                             ;C2AEE4|E220    |      ;
LDA.W $03EB                          ;C2AEE6|ADEB03  |8203EB;
XBA                                  ;C2AEE9|EB      |      ;
JSR.W CODE_C2AFDF                    ;C2AEEA|20DFAF  |C2AFDF;
PLB                                  ;C2AEED|AB      |      ;
PLY                                  ;C2AEEE|7A      |      ;
BRL CODE_C2AC58                      ;C2AEEF|8266FD  |C2AC58;
db $B9,$01,$00,$83,$02,$EB,$B9,$00   ;C2AEF2|        |000001;
db $00,$83,$01,$C8,$C8,$AA,$82,$55   ;C2AEFA|        |      ;
db $FD                               ;C2AF02|        |00DAFA;

CODE_C2AF03:
PLX                                  ;C2AF03|FA      |      ;

CODE_C2AF04:
PHX                                  ;C2AF04|DA      |      ;
JSR.W CODE_C2B0CA                    ;C2AF05|20CAB0  |C2B0CA;
REP #$20                             ;C2AF08|C220    |      ;
LDA.W $03EF                          ;C2AF0A|ADEF03  |8003EF;
DEC A                                ;C2AF0D|3A      |      ;
AND.W #$FFFE                         ;C2AF0E|29FEFF  |      ;
CLC                                  ;C2AF11|18      |      ;
ADC.B $01,S                          ;C2AF12|6301    |000001;
CLC                                  ;C2AF14|18      |      ;
ADC.W #$0040                         ;C2AF15|694000  |      ;
TAX                                  ;C2AF18|AA      |      ;
SEP #$20                             ;C2AF19|E220    |      ;
JSR.W CODE_C2B03A                    ;C2AF1B|203AB0  |C2B03A;
LDA.W $1B84                          ;C2AF1E|AD841B  |801B84;
BNE CODE_C2AF26                      ;C2AF21|D003    |C2AF26;
db $82,$33,$FE                       ;C2AF23|        |C2AD59;

CODE_C2AF26:
PLX                                  ;C2AF26|FA      |      ;
LDA.L $7F7080,X                      ;C2AF27|BF80707F|7F7080;
CMP.B #$04                           ;C2AF2B|C904    |      ;
BNE CODE_C2AF3C                      ;C2AF2D|D00D    |C2AF3C;
LDA.W $1B84                          ;C2AF2F|AD841B  |801B84;
BEQ CODE_C2AF04                      ;C2AF32|F0D0    |C2AF04;
JSR.W CODE_C2B0CA                    ;C2AF34|20CAB0  |C2B0CA;
JSR.W CODE_C2B080                    ;C2AF37|2080B0  |C2B080;
BRA CODE_C2AF46                      ;C2AF3A|800A    |C2AF46;

CODE_C2AF3C:
REP #$20                             ;C2AF3C|C220    |      ;
TXA                                  ;C2AF3E|8A      |      ;
CLC                                  ;C2AF3F|18      |      ;
ADC.W #$0080                         ;C2AF40|698000  |      ;
TAX                                  ;C2AF43|AA      |      ;
SEP #$20                             ;C2AF44|E220    |      ;

CODE_C2AF46:
PHX                                  ;C2AF46|DA      |      ;
BRL CODE_C2AC58                      ;C2AF47|820EFD  |C2AC58;
db $20,$4A,$B1                       ;C2AF4A|        |C2B14A;

CODE_C2AF4D:
PLX                                  ;C2AF4D|FA      |      ;
STX.W $03F5                          ;C2AF4E|8EF503  |8003F5;
LDA.B #$01                           ;C2AF51|A901    |      ;
TSB.W _03BA                          ;C2AF53|0CBA03  |8003BA;
PLB                                  ;C2AF56|AB      |      ;
PLP                                  ;C2AF57|28      |      ;
RTL                                  ;C2AF58|6B      |      ;
