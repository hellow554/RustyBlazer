ORG  $C20000
BASE $820000

incsrc "bankC2/_data.asm"

CODE_C28000:
PHP                                  ;C28000|08      |      ;
REP #$30                             ;C28001|C230    |      ;
LDX.W #$0000                         ;C28003|A20000  |      ;
TXY                                  ;C28006|9B      |      ;
LDA.W bg1_hofs                          ;C28007|AD3A03  |81033A;
PHA                                  ;C2800A|48      |      ;
LDA.W PlayerPosReal.x                          ;C2800B|AD7403  |810374;
SEC                                  ;C2800E|38      |      ;
SBC.W #$0070                         ;C2800F|E97000  |      ;
BPL CODE_C28019                      ;C28012|1005    |C28019;
LDA.W #$0000                         ;C28014|A90000  |      ;
BRA CODE_C2802F                      ;C28017|8016    |C2802F;

CODE_C28019:
CLC                                  ;C28019|18      |      ;
ADC.W #$0100                         ;C2801A|690001  |      ;
CMP.W $0342                          ;C2801D|CD4203  |810342;
BCS CODE_C28028                      ;C28020|B006    |C28028;
SEC                                  ;C28022|38      |      ;
SBC.W #$0100                         ;C28023|E90001  |      ;
BRA CODE_C2802F                      ;C28026|8007    |C2802F;

CODE_C28028:
LDA.W $0342                          ;C28028|AD4203  |810342;
SEC                                  ;C2802B|38      |      ;
SBC.W #$0100                         ;C2802C|E90001  |      ;

CODE_C2802F:
SEC                                  ;C2802F|38      |      ;
SBC.B $01,S                          ;C28030|E301    |000001;
TAX                                  ;C28032|AA      |      ;
PLA                                  ;C28033|68      |      ;
LDA.W bg1_vofs                          ;C28034|AD3C03  |81033C;
PHA                                  ;C28037|48      |      ;
LDA.W PlayerPosReal.y                          ;C28038|AD7603  |810376;
SEC                                  ;C2803B|38      |      ;
SBC.W #$0080                         ;C2803C|E98000  |      ;
BPL CODE_C28046                      ;C2803F|1005    |C28046;
LDA.W #$0000                         ;C28041|A90000  |      ;
BRA CODE_C2805C                      ;C28044|8016    |C2805C;

CODE_C28046:
CLC                                  ;C28046|18      |      ;
ADC.W $03CC                          ;C28047|6DCC03  |8103CC;
CMP.W $0344                          ;C2804A|CD4403  |810344;
BCS CODE_C28055                      ;C2804D|B006    |C28055;
SEC                                  ;C2804F|38      |      ;
SBC.W $03CC                          ;C28050|EDCC03  |8103CC;
BRA CODE_C2805C                      ;C28053|8007    |C2805C;

CODE_C28055:
LDA.W $0344                          ;C28055|AD4403  |810344;
SEC                                  ;C28058|38      |      ;
SBC.W $03CC                          ;C28059|EDCC03  |8103CC;

CODE_C2805C:
SEC                                  ;C2805C|38      |      ;
SBC.B $01,S                          ;C2805D|E301    |000001;
TAY                                  ;C2805F|A8      |      ;
PLA                                  ;C28060|68      |      ;
STX.W $0382                          ;C28061|8E8203  |810382;
STY.W $0384                          ;C28064|8C8403  |810384;
PLP                                  ;C28067|28      |      ;
RTL                                  ;C28068|6B      |      ;

CODE_C28069:
PHP                                  ;C28069|08      |      ;
REP #$20                             ;C2806A|C220    |      ;
LDA.W $0382                          ;C2806C|AD8203  |810382;
BEQ .CODE_C280AE                      ;C2806F|F03D    |C280AE;
BPL .CODE_C28084                      ;C28071|1011    |C28084;
LDA.W bg1_hofs                          ;C28073|AD3A03  |81033A;
BEQ .CODE_C280AE                      ;C28076|F036    |C280AE;
PHA                                  ;C28078|48      |      ;
CLC                                  ;C28079|18      |      ;
ADC.W $0382                          ;C2807A|6D8203  |810382;
BPL .CODE_C2809C                      ;C2807D|101D    |C2809C;
LDA.W #0
BRA .CODE_C2809C

.CODE_C28084:
LDA.W bg1_hofs                          ;C28084|AD3A03  |81033A;
PHA                                  ;C28087|48      |      ;
CLC                                  ;C28088|18      |      ;
ADC.W $0382                          ;C28089|6D8203  |810382;
CLC                                  ;C2808C|18      |      ;
ADC.W #$0100                         ;C2808D|690001  |      ;
CMP.W $0342                          ;C28090|CD4203  |810342;
BCC .CODE_C28098                      ;C28093|9003    |C28098;
LDA.W $0342                          ;C28095|AD4203  |810342;

.CODE_C28098:
SEC                                  ;C28098|38      |      ;
SBC.W #$0100                         ;C28099|E90001  |      ;

.CODE_C2809C:
STA.W bg1_hofs                          ;C2809C|8D3A03  |81033A;
PLA                                  ;C2809F|68      |      ;
EOR.W bg1_hofs                          ;C280A0|4D3A03  |81033A;
AND.W #$0010                         ;C280A3|291000  |      ;
BEQ .CODE_C280AE                      ;C280A6|F006    |C280AE;
LDA.W #$0080                         ;C280A8|A98000  |      ;
TSB.W $0396                          ;C280AB|0C9603  |810396;

.CODE_C280AE:
LDA.W $0384                          ;C280AE|AD8403  |810384;
BEQ .CODE_C280F0                      ;C280B1|F03D    |C280F0;
BPL .CODE_C280C6                      ;C280B3|1011    |C280C6;
LDA.W bg1_vofs                          ;C280B5|AD3C03  |81033C;
BEQ .CODE_C280F0                      ;C280B8|F036    |C280F0;
PHA                                  ;C280BA|48      |      ;
CLC                                  ;C280BB|18      |      ;
ADC.W $0384                          ;C280BC|6D8403  |810384;
BPL .CODE_C280DE                      ;C280BF|101D    |C280DE;
LDA.W #0
BRA .CODE_C280DE

.CODE_C280C6:
LDA.W bg1_vofs                          ;C280C6|AD3C03  |81033C;
PHA                                  ;C280C9|48      |      ;
CLC                                  ;C280CA|18      |      ;
ADC.W $0384                          ;C280CB|6D8403  |810384;
CLC                                  ;C280CE|18      |      ;
ADC.W $03CC                          ;C280CF|6DCC03  |8103CC;
CMP.W $0344                          ;C280D2|CD4403  |810344;
BCC .CODE_C280DA                      ;C280D5|9003    |C280DA;
LDA.W $0344                          ;C280D7|AD4403  |810344;

.CODE_C280DA:
SEC                                  ;C280DA|38      |      ;
SBC.W $03CC                          ;C280DB|EDCC03  |8103CC;

.CODE_C280DE:
STA.W bg1_vofs                          ;C280DE|8D3C03  |81033C;
PLA                                  ;C280E1|68      |      ;
EOR.W bg1_vofs                          ;C280E2|4D3C03  |81033C;
AND.W #$0010                         ;C280E5|291000  |      ;
BEQ .CODE_C280F0                      ;C280E8|F006    |C280F0;
LDA.W #$0040                         ;C280EA|A94000  |      ;
TSB.W $0396                          ;C280ED|0C9603  |810396;

.CODE_C280F0:
LDX.W #$0004                         ;C280F0|A20400  |      ;
LDA.W $034E                          ;C280F3|AD4E03  |81034E;
BEQ .CODE_C280FE                      ;C280F6|F006    |C280FE;
LDA.W #$0020                         ;C280F8|A92000  |      ;
JSR.W CODE_C284E1                    ;C280FB|20E184  |C284E1;

.CODE_C280FE:
LDA.W $0350                          ;C280FE|AD5003  |810350;
BEQ .CODE_C28109                      ;C28101|F006    |C28109;
LDA.W #$0010                         ;C28103|A91000  |      ;
JSR.W CODE_C2852F                    ;C28106|202F85  |C2852F;

.CODE_C28109:
PLP                                  ;C28109|28      |      ;
RTL                                  ;C2810A|6B      |      ;

CODE_C2810B:
LDA.B #$80                           ;C2810B|A980    |      ;
TRB.W $0396                          ;C2810D|1C9603  |810396;
BEQ .CODE_C28118                      ;C28110|F006    |C28118;
LDX.W #$0000                         ;C28112|A20000  |      ;
JSR.W CODE_C28163                    ;C28115|206381  |C28163;

.CODE_C28118:
LDA.B #$40                           ;C28118|A940    |      ;
TRB.W $0396                          ;C2811A|1C9603  |810396;
BEQ .CODE_C28125                      ;C2811D|F006    |C28125;
LDX.W #$0000                         ;C2811F|A20000  |      ;
JSR.W CODE_C281C2                    ;C28122|20C281  |C281C2;

.CODE_C28125:
LDX.W $038E                          ;C28125|AE8E03  |81038E;
STX.W $0382                          ;C28128|8E8203  |810382;
LDX.W $0390                          ;C2812B|AE9003  |810390;
STX.W $0384                          ;C2812E|8E8403  |810384;
LDA.B #$20                           ;C28131|A920    |      ;
TRB.W $0396                          ;C28133|1C9603  |810396;
BEQ .CODE_C28145                      ;C28136|F00D    |C28145;
LDX.W #$0004                         ;C28138|A20400  |      ;
LDA.W $0343,X                        ;C2813B|BD4303  |810343;
CMP.B #$03                           ;C2813E|C903    |      ;
BCC .CODE_C28145                      ;C28140|9003    |C28145;
JSR CODE_C28163                       ;C28142|        |C28163;

.CODE_C28145:
LDA.B #$10                           ;C28145|A910    |      ;
TRB.W $0396                          ;C28147|1C9603  |810396;
BEQ .CODE_C28159                      ;C2814A|F00D    |C28159;
LDX.W #$0004                         ;C2814C|A20400  |      ;
LDA.W $0345,X                        ;C2814F|BD4503  |810345;
CMP.B #$03                           ;C28152|C903    |      ;
BCC .CODE_C28159                      ;C28154|9003    |C28159;
JSR CODE_C281C2                       ;C28156|        |C281C2;

.CODE_C28159:
LDX.W #$0000                         ;C28159|A20000  |      ;
STX.W $0382                          ;C2815C|8E8203  |810382;
STX.W $0384                          ;C2815F|8E8403  |810384;
RTL                                  ;C28162|6B      |      ;

CODE_C28163:
REP #$20                             ;C28163|C220    |      ;
LDA.W #$0000                         ;C28165|A90000  |      ;
LDY.W $0382                          ;C28168|AC8203  |810382;
BEQ CODE_C281BF                      ;C2816B|F052    |C281BF;
BMI CODE_C28172                      ;C2816D|3003    |C28172;
LDA.W #$0100                         ;C2816F|A90001  |      ;

CODE_C28172:
CLC                                  ;C28172|18      |      ;
ADC.W bg1_hofs,X                        ;C28173|7D3A03  |81033A;
AND.W #$0FF0                         ;C28176|29F00F  |      ;
STA.B $16                            ;C28179|8516    |000016;
LDA.W bg1_vofs,X                        ;C2817B|BD3C03  |81033C;
AND.W #$0F00                         ;C2817E|29000F  |      ;
STA.B $18                            ;C28181|8518    |000018;
SEP #$20                             ;C28183|E220    |      ;
LDY.W $0354,X                        ;C28185|BC5403  |810354;
STY.B $00                            ;C28188|8400    |000000;
LDY.W $0352,X                        ;C2818A|BC5203  |810352;
STY.B $02                            ;C2818D|8402    |000002;
LDY.W $0342,X                        ;C2818F|BC4203  |810342;
STY.B $04                            ;C28192|8404    |000004;
LDA.W $036B,X                        ;C28194|BD6B03  |81036B;
STZ.B $06                            ;C28197|6406    |000006;
STA.B $07                            ;C28199|8507    |000007;
LDA.W $0343,X                        ;C2819B|BD4303  |810343;
XBA                                  ;C2819E|EB      |      ;
LDA.W $0345,X                        ;C2819F|BD4503  |810345;
JSL.L multiply                    ;C281A2|22D1B182|82B1D1;
CLC                                  ;C281A6|18      |      ;
ADC.W $0353,X                        ;C281A7|7D5303  |810353;
STZ.B $08                            ;C281AA|6408    |000008;
STA.B $09                            ;C281AC|8509    |000009;
LDY.W $035C,X                        ;C281AE|BC5C03  |81035C;
STY.B $0A                            ;C281B1|840A    |00000A;
LDY.W $035A,X                        ;C281B3|BC5A03  |81035A;
STY.B $29                            ;C281B6|8429    |000029;
LDY.W $0362,X                        ;C281B8|BC6203  |810362;
TYX                                  ;C281BB|BB      |      ;
JSR.W CODE_C2832F                    ;C281BC|202F83  |C2832F;

CODE_C281BF:
SEP #$20                             ;C281BF|E220    |      ;
RTS                                  ;C281C1|60      |      ;

CODE_C281C2:
REP #$20                             ;C281C2|C220    |      ;
LDA.W bg1_hofs,X                        ;C281C4|BD3A03  |81033A;
AND.W #$0F00                         ;C281C7|29000F  |      ;
STA.B $16                            ;C281CA|8516    |000016;
LDA.W #$0000                         ;C281CC|A90000  |      ;
LDY.W $0384                          ;C281CF|AC8403  |810384;
BEQ CODE_C2820B                      ;C281D2|F037    |C2820B;
BMI CODE_C281D9                      ;C281D4|3003    |C281D9;
LDA.W #$0100                         ;C281D6|A90001  |      ;

CODE_C281D9:
CLC                                  ;C281D9|18      |      ;
ADC.W bg1_vofs,X                        ;C281DA|7D3C03  |81033C;
AND.W #$0FF0                         ;C281DD|29F00F  |      ;
STA.B $18                            ;C281E0|8518    |000018;
SEP #$20                             ;C281E2|E220    |      ;
LDY.W $0354,X                        ;C281E4|BC5403  |810354;
STY.B $00                            ;C281E7|8400    |000000;
LDY.W $0352,X                        ;C281E9|BC5203  |810352;
STY.B $02                            ;C281EC|8402    |000002;
LDY.W $0342,X                        ;C281EE|BC4203  |810342;
STY.B $04                            ;C281F1|8404    |000004;
LDA.W $036B,X                        ;C281F3|BD6B03  |81036B;
STZ.B $06                            ;C281F6|6406    |000006;
STA.B $07                            ;C281F8|8507    |000007;
LDY.W $035C,X                        ;C281FA|BC5C03  |81035C;
STY.B $0A                            ;C281FD|840A    |00000A;
LDY.W $035A,X                        ;C281FF|BC5A03  |81035A;
STY.B $29                            ;C28202|8429    |000029;
LDY.W $0364,X                        ;C28204|BC6403  |810364;
TYX                                  ;C28207|BB      |      ;
JSR.W CODE_C283AB                    ;C28208|20AB83  |C283AB;

CODE_C2820B:
SEP #$20                             ;C2820B|E220    |      ;
RTS                                  ;C2820D|60      |      ;
CODE_C2820E:
REP #$20                             ;C2820E|C220    |      ;
LDA.W PlayerPosReal.x                          ;C28210|AD7403  |810374;
SEC                                  ;C28213|38      |      ;
SBC.W #$0070                         ;C28214|E97000  |      ;
BPL CODE_C2821E                      ;C28217|1005    |C2821E;
LDA.W #$0000                         ;C28219|A90000  |      ;
BRA CODE_C28234                      ;C2821C|8016    |C28234;

CODE_C2821E:
CLC                                  ;C2821E|18      |      ;
ADC.W #$0100                         ;C2821F|690001  |      ;
CMP.W $0342                          ;C28222|CD4203  |810342;
BCS CODE_C2822D                      ;C28225|B006    |C2822D;
SEC                                  ;C28227|38      |      ;
SBC.W #$0100                         ;C28228|E90001  |      ;
BRA CODE_C28234                      ;C2822B|8007    |C28234;

CODE_C2822D:
LDA.W $0342                          ;C2822D|AD4203  |810342;
SEC                                  ;C28230|38      |      ;
SBC.W #$0100                         ;C28231|E90001  |      ;

CODE_C28234:
STA.W bg1_hofs                          ;C28234|8D3A03  |81033A;
LDA.W PlayerPosReal.y                          ;C28237|AD7603  |810376;
SEC                                  ;C2823A|38      |      ;
SBC.W #$0090                         ;C2823B|E99000  |      ;
BPL CODE_C28245                      ;C2823E|1005    |C28245;
LDA.W #$0000                         ;C28240|A90000  |      ;
BRA CODE_C2825B                      ;C28243|8016    |C2825B;

CODE_C28245:
CLC                                  ;C28245|18      |      ;
ADC.W $03CC                          ;C28246|6DCC03  |8103CC;
CMP.W $0344                          ;C28249|CD4403  |810344;
BCS CODE_C28254                      ;C2824C|B006    |C28254;
SEC                                  ;C2824E|38      |      ;
SBC.W $03CC                          ;C2824F|EDCC03  |8103CC;
BRA CODE_C2825B                      ;C28252|8007    |C2825B;

CODE_C28254:
LDA.W $0344                          ;C28254|AD4403  |810344;
SEC                                  ;C28257|38      |      ;
SBC.W $03CC                          ;C28258|EDCC03  |8103CC;

CODE_C2825B:
STA.W bg1_vofs                          ;C2825B|8D3C03  |81033C;
LDA.W $0342                          ;C2825E|AD4203  |810342;
LSR A                                ;C28261|4A      |      ;
LSR A                                ;C28262|4A      |      ;
LSR A                                ;C28263|4A      |      ;
LSR A                                ;C28264|4A      |      ;
STA.W $0392                          ;C28265|8D9203  |810392;
LDA.W $0344                          ;C28268|AD4403  |810344;
LSR A                                ;C2826B|4A      |      ;
LSR A                                ;C2826C|4A      |      ;
LSR A                                ;C2826D|4A      |      ;
LSR A                                ;C2826E|4A      |      ;
STA.W $0394                          ;C2826F|8D9403  |810394;
LDX.W #$0000                         ;C28272|A20000  |      ;

CODE_C28275:
REP #$20                             ;C28275|C220    |      ;
LDA.W #$0000                         ;C28277|A90000  |      ;
JSR.W CODE_C284E1                    ;C2827A|20E184  |C284E1;
LDA.W $0342,X                        ;C2827D|BD4203  |810342;
BEQ CODE_C28290                      ;C28280|F00E    |C28290;
LDA.W bg1_hofs,X                        ;C28282|BD3A03  |81033A;

CODE_C28285:
SEC                                  ;C28285|38      |      ;
SBC.W $0342,X                        ;C28286|FD4203  |810342;
BCC CODE_C28290                      ;C28289|9005    |C28290;
STA.W bg1_hofs,X                        ;C2828B|9D3A03  |81033A;
BRA CODE_C28285                      ;C2828E|80F5    |C28285;

CODE_C28290:
LDA.W #$0000                         ;C28290|A90000  |      ;
JSR.W CODE_C2852F                    ;C28293|202F85  |C2852F;
LDA.W $0344,X                        ;C28296|BD4403  |810344;
BEQ CODE_C282A9                      ;C28299|F00E    |C282A9;
LDA.W bg1_vofs,X                        ;C2829B|BD3C03  |81033C;

CODE_C2829E:
SEC                                  ;C2829E|38      |      ;
SBC.W $0344,X                        ;C2829F|FD4403  |810344;
BCC CODE_C282A9                      ;C282A2|9005    |C282A9;
STA.W bg1_vofs,X                        ;C282A4|9D3C03  |81033C;
BRA CODE_C2829E                      ;C282A7|80F5    |C2829E;

CODE_C282A9:
SEP #$20                             ;C282A9|E220    |      ;
REP #$20                             ;C282AB|C220    |      ;
LDA.W bg1_hofs,X                        ;C282AD|BD3A03  |81033A;
AND.W #$FF00                         ;C282B0|2900FF  |      ;
STA.B $16                            ;C282B3|8516    |000016;
LDA.W bg1_vofs,X                        ;C282B5|BD3C03  |81033C;
AND.W #$FF00                         ;C282B8|2900FF  |      ;
STA.B $18                            ;C282BB|8518    |000018;
SEP #$20                             ;C282BD|E220    |      ;
LDY.W $0354,X                        ;C282BF|BC5403  |810354;
STY.B $00                            ;C282C2|8400    |000000;
LDY.W $0352,X                        ;C282C4|BC5203  |810352;
STY.B $02                            ;C282C7|8402    |000002;
LDY.W $0342,X                        ;C282C9|BC4203  |810342;
STY.B $04                            ;C282CC|8404    |000004;
LDA.W $036B,X                        ;C282CE|BD6B03  |81036B;
STZ.B $06                            ;C282D1|6406    |000006;
STA.B $07                            ;C282D3|8507    |000007;
LDA.W $0343,X                        ;C282D5|BD4303  |810343;
XBA                                  ;C282D8|EB      |      ;
LDA.W $0345,X                        ;C282D9|BD4503  |810345;
JSL.L multiply                    ;C282DC|22D1B182|82B1D1;
CLC                                  ;C282E0|18      |      ;
ADC.W $0353,X                        ;C282E1|7D5303  |810353;
STZ.B $08                            ;C282E4|6408    |000008;
STA.B $09                            ;C282E6|8509    |000009;
LDY.W $035C,X                        ;C282E8|BC5C03  |81035C;
STY.B $0A                            ;C282EB|840A    |00000A;
LDY.W $035A,X                        ;C282ED|BC5A03  |81035A;
STY.B $29                            ;C282F0|8429    |000029;
LDY.W $0362,X                        ;C282F2|BC6203  |810362;
STY.B $32                            ;C282F5|8432    |000032;
LDY.W $0364,X                        ;C282F7|BC6403  |810364;
STY.B $35                            ;C282FA|8435    |000035;
LDA.B #$20                           ;C282FC|A920    |      ;

CODE_C282FE:
PHA                                  ;C282FE|48      |      ;
PHX                                  ;C282FF|DA      |      ;
LDX.B $32                            ;C28300|A632    |000032;
JSR.W CODE_C2832F                    ;C28302|202F83  |C2832F;
JSL.L CODE_C2857D                    ;C28305|227D8582|82857D;
PLX                                  ;C28309|FA      |      ;
REP #$20                             ;C2830A|C220    |      ;
LDA.B $16                            ;C2830C|A516    |000016;
CLC                                  ;C2830E|18      |      ;
ADC.W #$0010                         ;C2830F|691000  |      ;
CMP.W $0342,X                        ;C28312|DD4203  |810342;
BCC CODE_C2831A                      ;C28315|9003    |C2831A;
AND.W #$0100                         ;C28317|290001  |      ;

CODE_C2831A:
STA.B $16                            ;C2831A|8516    |000016;
SEP #$20                             ;C2831C|E220    |      ;
PLA                                  ;C2831E|68      |      ;
DEC A                                ;C2831F|3A      |      ;
BNE CODE_C282FE                      ;C28320|D0DC    |C282FE;
INX                                  ;C28322|E8      |      ;
INX                                  ;C28323|E8      |      ;
INX                                  ;C28324|E8      |      ;
INX                                  ;C28325|E8      |      ;
CPX.W #$0008                         ;C28326|E00800  |      ;
BEQ CODE_C2832E                      ;C28329|F003    |C2832E;
BRL CODE_C28275                      ;C2832B|8247FF  |C28275;

CODE_C2832E:
RTL                                  ;C2832E|6B      |      ;

CODE_C2832F:
PHP                                  ;C2832F|08      |      ;
PHB                                  ;C28330|8B      |      ;
SEP #$20                             ;C28331|E220    |      ;
LDA.B $19                            ;C28333|A519    |000019;
XBA                                  ;C28335|EB      |      ;
LDA.B $05                            ;C28336|A505    |000005;
JSL.L multiply                    ;C28338|22D1B182|82B1D1;
CLC                                  ;C2833C|18      |      ;
ADC.B $17                            ;C2833D|6517    |000017;
CLC                                  ;C2833F|18      |      ;
ADC.B $03                            ;C28340|6503    |000003;
XBA                                  ;C28342|EB      |      ;
LDA.B $16                            ;C28343|A516    |000016;
LSR A                                ;C28345|4A      |      ;
LSR A                                ;C28346|4A      |      ;
LSR A                                ;C28347|4A      |      ;
LSR A                                ;C28348|4A      |      ;
TAY                                  ;C28349|A8      |      ;
LDA.B #$7E                           ;C2834A|A97E    |      ;
PHA                                  ;C2834C|48      |      ;
PLB                                  ;C2834D|AB      |      ;
LDA.B $17                            ;C2834E|A517    |000017;
AND.B #$01                           ;C28350|2901    |      ;
ASL A                                ;C28352|0A      |      ;
ASL A                                ;C28353|0A      |      ;
XBA                                  ;C28354|EB      |      ;
LDA.B $16                            ;C28355|A516    |000016;
LSR A                                ;C28357|4A      |      ;
LSR A                                ;C28358|4A      |      ;
LSR A                                ;C28359|4A      |      ;
AND.B #$1E                           ;C2835A|291E    |      ;
REP #$20                             ;C2835C|C220    |      ;
CLC                                  ;C2835E|18      |      ;
ADC.B $00                            ;C2835F|6500    |000000;
STA.W $0000,X                        ;C28361|9D0000  |7E0000;
INX                                  ;C28364|E8      |      ;
INX                                  ;C28365|E8      |      ;
LDA.B $18                            ;C28366|A518    |000018;
AND.W #$0100                         ;C28368|290001  |      ;
BNE CODE_C2838B                      ;C2836B|D01E    |C2838B;
JSR.W CODE_C28419                    ;C2836D|201984  |C28419;
TYA                                  ;C28370|98      |      ;
CLC                                  ;C28371|18      |      ;
ADC.B $04                            ;C28372|6504    |000004;
CMP.B $08                            ;C28374|C508    |000008;
BCC CODE_C2837E                      ;C28376|9006    |C2837E;
SEC                                  ;C28378|38      |      ;
SBC.B $08                            ;C28379|E508    |000008;
CLC                                  ;C2837B|18      |      ;
ADC.B $02                            ;C2837C|6502    |000002;

CODE_C2837E:
TAY                                  ;C2837E|A8      |      ;
TXA                                  ;C2837F|8A      |      ;
CLC                                  ;C28380|18      |      ;
ADC.W #$0080                         ;C28381|698000  |      ;
TAX                                  ;C28384|AA      |      ;
JSR.W CODE_C28419                    ;C28385|201984  |C28419;
PLB                                  ;C28388|AB      |      ;
PLP                                  ;C28389|28      |      ;
RTS                                  ;C2838A|60      |      ;

CODE_C2838B:
PHX                                  ;C2838B|DA      |      ;
TXA                                  ;C2838C|8A      |      ;
CLC                                  ;C2838D|18      |      ;
ADC.W #$0080                         ;C2838E|698000  |      ;
TAX                                  ;C28391|AA      |      ;
JSR.W CODE_C28419                    ;C28392|201984  |C28419;
TYA                                  ;C28395|98      |      ;
CLC                                  ;C28396|18      |      ;
ADC.B $04                            ;C28397|6504    |000004;
CMP.B $08                            ;C28399|C508    |000008;
BCC CODE_C283A3                      ;C2839B|9006    |C283A3;
SEC                                  ;C2839D|38      |      ;
SBC.B $08                            ;C2839E|E508    |000008;
CLC                                  ;C283A0|18      |      ;
ADC.B $02                            ;C283A1|6502    |000002;

CODE_C283A3:
TAY                                  ;C283A3|A8      |      ;
PLX                                  ;C283A4|FA      |      ;
JSR.W CODE_C28419                    ;C283A5|201984  |C28419;
PLB                                  ;C283A8|AB      |      ;
PLP                                  ;C283A9|28      |      ;
RTS                                  ;C283AA|60      |      ;

CODE_C283AB:
PHP                                  ;C283AB|08      |      ;
PHB                                  ;C283AC|8B      |      ;
SEP #$20                             ;C283AD|E220    |      ;
LDA.B $19                            ;C283AF|A519    |000019;
XBA                                  ;C283B1|EB      |      ;
LDA.B $05                            ;C283B2|A505    |000005;
JSL.L multiply                    ;C283B4|22D1B182|82B1D1;
CLC                                  ;C283B8|18      |      ;
ADC.B $17                            ;C283B9|6517    |000017;
CLC                                  ;C283BB|18      |      ;
ADC.B $03                            ;C283BC|6503    |000003;
XBA                                  ;C283BE|EB      |      ;
LDA.B $18                            ;C283BF|A518    |000018;
AND.B #$F0                           ;C283C1|29F0    |      ;
TAY                                  ;C283C3|A8      |      ;
LDA.B #$7E                           ;C283C4|A97E    |      ;
PHA                                  ;C283C6|48      |      ;
PLB                                  ;C283C7|AB      |      ;
REP #$20                             ;C283C8|C220    |      ;
LDA.B $18                            ;C283CA|A518    |000018;
AND.W #$00F0                         ;C283CC|29F000  |      ;
ASL A                                ;C283CF|0A      |      ;
ASL A                                ;C283D0|0A      |      ;
PHA                                  ;C283D1|48      |      ;
LDA.B $18                            ;C283D2|A518    |000018;
AND.W #$0100                         ;C283D4|290001  |      ;
ASL A                                ;C283D7|0A      |      ;
ASL A                                ;C283D8|0A      |      ;
ASL A                                ;C283D9|0A      |      ;
CLC                                  ;C283DA|18      |      ;
ADC.B $01,S                          ;C283DB|6301    |000001;
CLC                                  ;C283DD|18      |      ;
ADC.B $00                            ;C283DE|6500    |000000;
STA.W $0000,X                        ;C283E0|9D0000  |7E0000;
PLA                                  ;C283E3|68      |      ;
INX                                  ;C283E4|E8      |      ;
INX                                  ;C283E5|E8      |      ;
LDA.B $16                            ;C283E6|A516    |000016;
AND.W #$0100                         ;C283E8|290001  |      ;
BNE CODE_C28402                      ;C283EB|D015    |C28402;
JSR.W CODE_C28466                    ;C283ED|206684  |C28466;
TYA                                  ;C283F0|98      |      ;
CLC                                  ;C283F1|18      |      ;
ADC.W #$0100                         ;C283F2|690001  |      ;
TAY                                  ;C283F5|A8      |      ;
TXA                                  ;C283F6|8A      |      ;
CLC                                  ;C283F7|18      |      ;
ADC.W #$0080                         ;C283F8|698000  |      ;
TAX                                  ;C283FB|AA      |      ;
JSR.W CODE_C28466                    ;C283FC|206684  |C28466;
PLB                                  ;C283FF|AB      |      ;
PLP                                  ;C28400|28      |      ;
RTS                                  ;C28401|60      |      ;

CODE_C28402:
PHX                                  ;C28402|DA      |      ;
TXA                                  ;C28403|8A      |      ;
CLC                                  ;C28404|18      |      ;
ADC.W #$0080                         ;C28405|698000  |      ;
TAX                                  ;C28408|AA      |      ;
JSR.W CODE_C28466                    ;C28409|206684  |C28466;
TYA                                  ;C2840C|98      |      ;
CLC                                  ;C2840D|18      |      ;
ADC.W #$0100                         ;C2840E|690001  |      ;
TAY                                  ;C28411|A8      |      ;
PLX                                  ;C28412|FA      |      ;
JSR.W CODE_C28466                    ;C28413|206684  |C28466;
PLB                                  ;C28416|AB      |      ;
PLP                                  ;C28417|28      |      ;
RTS                                  ;C28418|60      |      ;

CODE_C28419:
PHX                                  ;C28419|DA      |      ;
PHY                                  ;C2841A|5A      |      ;
LDA.W #$0010                         ;C2841B|A91000  |      ;
STA.B $0E                            ;C2841E|850E    |00000E;

CODE_C28420:
LDA.W $0000,Y                        ;C28420|B90000  |7E0000;
AND.W #$00FF                         ;C28423|29FF00  |      ;
PHY                                  ;C28426|5A      |      ;
ASL A                                ;C28427|0A      |      ;
ASL A                                ;C28428|0A      |      ;
ASL A                                ;C28429|0A      |      ;
TAY                                  ;C2842A|A8      |      ;
LDA.B ($29),Y                        ;C2842B|B129    |000029;
INY                                  ;C2842D|C8      |      ;
INY                                  ;C2842E|C8      |      ;
AND.B $0A                            ;C2842F|250A    |00000A;
ORA.B $06                            ;C28431|0506    |000006;
STA.W $0000,X                        ;C28433|9D0000  |7E0000;
LDA.B ($29),Y                        ;C28436|B129    |000029;
INY                                  ;C28438|C8      |      ;
INY                                  ;C28439|C8      |      ;
AND.B $0A                            ;C2843A|250A    |00000A;
ORA.B $06                            ;C2843C|0506    |000006;
STA.W $0040,X                        ;C2843E|9D4000  |7E0040;
LDA.B ($29),Y                        ;C28441|B129    |000029;
INY                                  ;C28443|C8      |      ;
INY                                  ;C28444|C8      |      ;
AND.B $0A                            ;C28445|250A    |00000A;
ORA.B $06                            ;C28447|0506    |000006;
STA.W $0002,X                        ;C28449|9D0200  |7E0002;
LDA.B ($29),Y                        ;C2844C|B129    |000029;
AND.B $0A                            ;C2844E|250A    |00000A;
ORA.B $06                            ;C28450|0506    |000006;
STA.W $0042,X                        ;C28452|9D4200  |7E0042;
INX                                  ;C28455|E8      |      ;
INX                                  ;C28456|E8      |      ;
INX                                  ;C28457|E8      |      ;
INX                                  ;C28458|E8      |      ;
PLA                                  ;C28459|68      |      ;
CLC                                  ;C2845A|18      |      ;
ADC.W #$0010                         ;C2845B|691000  |      ;
TAY                                  ;C2845E|A8      |      ;
DEC.B $0E                            ;C2845F|C60E    |00000E;
BNE CODE_C28420                      ;C28461|D0BD    |C28420;
PLY                                  ;C28463|7A      |      ;
PLX                                  ;C28464|FA      |      ;
RTS                                  ;C28465|60      |      ;

CODE_C28466:
PHX                                  ;C28466|DA      |      ;
PHY                                  ;C28467|5A      |      ;
LDA.W #$0010                         ;C28468|A91000  |      ;
STA.B $0E                            ;C2846B|850E    |00000E;

CODE_C2846D:
LDA.W $0000,Y                        ;C2846D|B90000  |7E0000;
AND.W #$00FF                         ;C28470|29FF00  |      ;
INY                                  ;C28473|C8      |      ;
PHY                                  ;C28474|5A      |      ;
ASL A                                ;C28475|0A      |      ;
ASL A                                ;C28476|0A      |      ;
ASL A                                ;C28477|0A      |      ;
TAY                                  ;C28478|A8      |      ;
LDA.B ($29),Y                        ;C28479|B129    |000029;
INY                                  ;C2847B|C8      |      ;
INY                                  ;C2847C|C8      |      ;
AND.B $0A                            ;C2847D|250A    |00000A;
ORA.B $06                            ;C2847F|0506    |000006;
STA.W $0000,X                        ;C28481|9D0000  |7E0000;
LDA.B ($29),Y                        ;C28484|B129    |000029;
INY                                  ;C28486|C8      |      ;
INY                                  ;C28487|C8      |      ;
AND.B $0A                            ;C28488|250A    |00000A;
ORA.B $06                            ;C2848A|0506    |000006;
STA.W $0002,X                        ;C2848C|9D0200  |7E0002;
LDA.B ($29),Y                        ;C2848F|B129    |000029;
INY                                  ;C28491|C8      |      ;
INY                                  ;C28492|C8      |      ;
AND.B $0A                            ;C28493|250A    |00000A;
ORA.B $06                            ;C28495|0506    |000006;
STA.W $0040,X                        ;C28497|9D4000  |7E0040;
LDA.B ($29),Y                        ;C2849A|B129    |000029;
AND.B $0A                            ;C2849C|250A    |00000A;
ORA.B $06                            ;C2849E|0506    |000006;
STA.W $0042,X                        ;C284A0|9D4200  |7E0042;
INX                                  ;C284A3|E8      |      ;
INX                                  ;C284A4|E8      |      ;
INX                                  ;C284A5|E8      |      ;
INX                                  ;C284A6|E8      |      ;
PLY                                  ;C284A7|7A      |      ;
DEC.B $0E                            ;C284A8|C60E    |00000E;
BNE CODE_C2846D                      ;C284AA|D0C1    |C2846D;
PLY                                  ;C284AC|7A      |      ;
PLX                                  ;C284AD|FA      |      ;
RTS                                  ;C284AE|60      |      ;

CODE_C284AF:
PHP                                  ;C284AF|08      |      ;
PHY                                  ;C284B0|5A      |      ;
SEP #$20                             ;C284B1|E220    |      ;
STA.W M7A                          ;C284B3|8D1B21  |81211B;
XBA                                  ;C284B6|EB      |      ;
STA.W M7A                          ;C284B7|8D1B21  |81211B;
REP #$20                             ;C284BA|C220    |      ;
TYA                                  ;C284BC|98      |      ;
SEP #$20                             ;C284BD|E220    |      ;
STA.W M7B                          ;C284BF|8D1C21  |81211C;
STA.W M7B                          ;C284C2|8D1C21  |81211C;
LDY.W MPYL                          ;C284C5|AC3421  |812134;
STY.W $4204                          ;C284C8|8C0442  |814204;
XBA                                  ;C284CB|EB      |      ;
STA.W $4206                          ;C284CC|8D0642  |814206;
NOP                                  ;C284CF|EA      |      ;
NOP                                  ;C284D0|EA      |      ;
NOP                                  ;C284D1|EA      |      ;
NOP                                  ;C284D2|EA      |      ;
NOP                                  ;C284D3|EA      |      ;
NOP                                  ;C284D4|EA      |      ;
NOP                                  ;C284D5|EA      |      ;
NOP                                  ;C284D6|EA      |      ;
LDA.W $4215                          ;C284D7|AD1542  |814215;
XBA                                  ;C284DA|EB      |      ;
LDA.W $4214                          ;C284DB|AD1442  |814214;
PLY                                  ;C284DE|7A      |      ;
PLP                                  ;C284DF|28      |      ;
RTS                                  ;C284E0|60      |      ;

CODE_C284E1:
PHP                                  ;C284E1|08      |      ;
PHY                                  ;C284E2|5A      |      ;
REP #$20                             ;C284E3|C220    |      ;
PHA                                  ;C284E5|48      |      ;
LDA.W bg1_hofs,X                        ;C284E6|BD3A03  |81033A;
PHA                                  ;C284E9|48      |      ;
LDY.W $034A,X                        ;C284EA|BC4A03  |81034A;
LDA.W bg1_hofs                          ;C284ED|AD3A03  |81033A;
JSR.W CODE_C284AF                    ;C284F0|20AF84  |C284AF;
TAY                                  ;C284F3|A8      |      ;
CLC                                  ;C284F4|18      |      ;
ADC.W #$0100                         ;C284F5|690001  |      ;
CMP.W $0342,X                        ;C284F8|DD4203  |810342;
BCC CODE_C2850A                      ;C284FB|900D    |C2850A;
LDA.W $0342,X                        ;C284FD|BD4203  |810342;
CMP.W #$0300                         ;C28500|C90003  |      ;
BCC CODE_C2850A                      ;C28503|9005    |C2850A;
SEC                                  ;C28505|38      |      ;
SBC.W #$0100                         ;C28506|E90001  |      ;
TAY                                  ;C28509|A8      |      ;

CODE_C2850A:
TYA                                  ;C2850A|98      |      ;
CLC                                  ;C2850B|18      |      ;
ADC.W $038A                          ;C2850C|6D8A03  |81038A;
STA.W bg1_hofs,X                        ;C2850F|9D3A03  |81033A;
LDA.B $01,S                          ;C28512|A301    |000001;
EOR.W bg1_hofs,X                        ;C28514|5D3A03  |81033A;
AND.W #$0010                         ;C28517|291000  |      ;
BEQ CODE_C28521                      ;C2851A|F005    |C28521;
LDA.B $03,S                          ;C2851C|A303    |000003;
TSB.W $0396                          ;C2851E|0C9603  |810396;

CODE_C28521:
LDA.W bg1_hofs,X                        ;C28521|BD3A03  |81033A;
SEC                                  ;C28524|38      |      ;
SBC.B $01,S                          ;C28525|E301    |000001;
STA.W $038E                          ;C28527|8D8E03  |81038E;
PLA                                  ;C2852A|68      |      ;
PLA                                  ;C2852B|68      |      ;
PLY                                  ;C2852C|7A      |      ;
PLP                                  ;C2852D|28      |      ;
RTS                                  ;C2852E|60      |      ;

CODE_C2852F:
PHP                                  ;C2852F|08      |      ;
PHY                                  ;C28530|5A      |      ;
REP #$20                             ;C28531|C220    |      ;
PHA                                  ;C28533|48      |      ;
LDA.W bg1_vofs,X                        ;C28534|BD3C03  |81033C;
PHA                                  ;C28537|48      |      ;
LDY.W $034C,X                        ;C28538|BC4C03  |81034C;
LDA.W bg1_vofs                          ;C2853B|AD3C03  |81033C;
JSR.W CODE_C284AF                    ;C2853E|20AF84  |C284AF;
TAY                                  ;C28541|A8      |      ;
CLC                                  ;C28542|18      |      ;
ADC.W $03CC                          ;C28543|6DCC03  |8103CC;
CMP.W $0344,X                        ;C28546|DD4403  |810344;
BCC CODE_C28558                      ;C28549|900D    |C28558;
LDA.W $0344,X                        ;C2854B|BD4403  |810344;
CMP.W #$0300                         ;C2854E|C90003  |      ;
BCC CODE_C28558                      ;C28551|9005    |C28558;
SEC                                  ;C28553|38      |      ;
SBC.W $03CC                          ;C28554|EDCC03  |8103CC;
TAY                                  ;C28557|A8      |      ;

CODE_C28558:
TYA                                  ;C28558|98      |      ;
CLC                                  ;C28559|18      |      ;
ADC.W $038C                          ;C2855A|6D8C03  |81038C;
STA.W bg1_vofs,X                        ;C2855D|9D3C03  |81033C;
LDA.B $01,S                          ;C28560|A301    |000001;
EOR.W bg1_vofs,X                        ;C28562|5D3C03  |81033C;
AND.W #$0010                         ;C28565|291000  |      ;
BEQ CODE_C2856F                      ;C28568|F005    |C2856F;
LDA.B $03,S                          ;C2856A|A303    |000003;
TSB.W $0396                          ;C2856C|0C9603  |810396;

CODE_C2856F:
LDA.W bg1_vofs,X                        ;C2856F|BD3C03  |81033C;
SEC                                  ;C28572|38      |      ;
SBC.B $01,S                          ;C28573|E301    |000001;
STA.W $0390                          ;C28575|8D9003  |810390;
PLA                                  ;C28578|68      |      ;
PLA                                  ;C28579|68      |      ;
PLY                                  ;C2857A|7A      |      ;
PLP                                  ;C2857B|28      |      ;
RTS                                  ;C2857C|60      |      ;
PHP                                  ;C2857D|08      |      ;
REP #$20                             ;C2857E|C220    |      ;
SEP #$10                             ;C28580|E210    |      ;
LDX.B #$81                           ;C28582|A281    |      ;
STX.W VMAIN                          ;C28584|8E1521  |812115;
LDA.B [$32]                          ;C28587|A732    |000032;
BEQ CODE_C285E0                      ;C28589|F055    |C285E0;
LDA.B [$32]                          ;C2858B|A732    |000032;
STA.W VMADDL                          ;C2858D|8D1621  |812116;
LDA.B $32                            ;C28590|A532    |000032;
CLC                                  ;C28592|18      |      ;
ADC.W #$0002                         ;C28593|690200  |      ;
STA.W A1T2L                          ;C28596|8D2243  |814322;
JSR.W CODE_C28640                    ;C28599|204086  |C28640;
LDA.B [$32]                          ;C2859C|A732    |000032;
CLC                                  ;C2859E|18      |      ;
ADC.W #$0001                         ;C2859F|690100  |      ;
STA.W VMADDL                          ;C285A2|8D1621  |812116;
LDA.B $32                            ;C285A5|A532    |000032;
CLC                                  ;C285A7|18      |      ;
ADC.W #$0042                         ;C285A8|694200  |      ;
STA.W A1T2L                          ;C285AB|8D2243  |814322;
JSR.W CODE_C28640                    ;C285AE|204086  |C28640;
LDA.B [$32]                          ;C285B1|A732    |000032;
CLC                                  ;C285B3|18      |      ;
ADC.W #$0800                         ;C285B4|690008  |      ;
STA.W VMADDL                          ;C285B7|8D1621  |812116;
LDA.B $32                            ;C285BA|A532    |000032;
CLC                                  ;C285BC|18      |      ;
ADC.W #$0082                         ;C285BD|698200  |      ;
STA.W A1T2L                          ;C285C0|8D2243  |814322;
JSR.W CODE_C28640                    ;C285C3|204086  |C28640;
LDA.B [$32]                          ;C285C6|A732    |000032;
CLC                                  ;C285C8|18      |      ;
ADC.W #$0801                         ;C285C9|690108  |      ;
STA.W VMADDL                          ;C285CC|8D1621  |812116;
LDA.B $32                            ;C285CF|A532    |000032;
CLC                                  ;C285D1|18      |      ;
ADC.W #$00C2                         ;C285D2|69C200  |      ;
STA.W A1T2L                          ;C285D5|8D2243  |814322;
JSR.W CODE_C28640                    ;C285D8|204086  |C28640;
LDA.W #$0000                         ;C285DB|A90000  |      ;
STA.B [$32]                          ;C285DE|8732    |000032;

CODE_C285E0:
LDX.B #$80                           ;C285E0|A280    |      ;
STX.W VMAIN                          ;C285E2|8E1521  |812115;
LDA.B [$35]                          ;C285E5|A735    |000035;
BEQ CODE_C2863E                      ;C285E7|F055    |C2863E;
LDA.B [$35]                          ;C285E9|A735    |000035;
STA.W VMADDL                          ;C285EB|8D1621  |812116;
LDA.B $35                            ;C285EE|A535    |000035;
CLC                                  ;C285F0|18      |      ;
ADC.W #$0002                         ;C285F1|690200  |      ;
STA.W A1T2L                          ;C285F4|8D2243  |814322;
JSR.W CODE_C28640                    ;C285F7|204086  |C28640;
LDA.B [$35]                          ;C285FA|A735    |000035;
CLC                                  ;C285FC|18      |      ;
ADC.W #$0020                         ;C285FD|692000  |      ;
STA.W VMADDL                          ;C28600|8D1621  |812116;
LDA.B $35                            ;C28603|A535    |000035;
CLC                                  ;C28605|18      |      ;
ADC.W #$0042                         ;C28606|694200  |      ;
STA.W A1T2L                          ;C28609|8D2243  |814322;
JSR.W CODE_C28640                    ;C2860C|204086  |C28640;
LDA.B [$35]                          ;C2860F|A735    |000035;
CLC                                  ;C28611|18      |      ;
ADC.W #$0400                         ;C28612|690004  |      ;
STA.W VMADDL                          ;C28615|8D1621  |812116;
LDA.B $35                            ;C28618|A535    |000035;
CLC                                  ;C2861A|18      |      ;
ADC.W #$0082                         ;C2861B|698200  |      ;
STA.W A1T2L                          ;C2861E|8D2243  |814322;
JSR.W CODE_C28640                    ;C28621|204086  |C28640;
LDA.B [$35]                          ;C28624|A735    |000035;
CLC                                  ;C28626|18      |      ;
ADC.W #$0420                         ;C28627|692004  |      ;
STA.W VMADDL                          ;C2862A|8D1621  |812116;
LDA.B $35                            ;C2862D|A535    |000035;
CLC                                  ;C2862F|18      |      ;
ADC.W #$00C2                         ;C28630|69C200  |      ;
STA.W A1T2L                          ;C28633|8D2243  |814322;
JSR.W CODE_C28640                    ;C28636|204086  |C28640;
LDA.W #$0000                         ;C28639|A90000  |      ;
STA.B [$35]                          ;C2863C|8735    |000035;

CODE_C2863E:
PLP                                  ;C2863E|28      |      ;
RTL                                  ;C2863F|6B      |      ;

CODE_C28640:
LDX.B #$01                           ;C28640|A201    |      ;
STX.W DMAP2                          ;C28642|8E2043  |814320;
LDX.B #$18                           ;C28645|A218    |      ;
STX.W BBAD2                          ;C28647|8E2143  |814321;
LDX.B #$7E                           ;C2864A|A27E    |      ;
STX.W A1B2                          ;C2864C|8E2443  |814324;
LDA.W #$0040                         ;C2864F|A94000  |      ;
STA.W DAS2L                          ;C28652|8D2543  |814325;
LDX.B #$04                           ;C28655|A204    |      ;
STX.W MDMAEN                          ;C28657|8E0B42  |81420B;
RTS                                  ;C2865A|60      |      ;
PHP                                  ;C2865B|08      |      ;
PHB                                  ;C2865C|8B      |      ;
SEP #$20                             ;C2865D|E220    |      ;
LDA.W $0024,X                        ;C2865F|BD2400  |810024;
PHA                                  ;C28662|48      |      ;
PLB                                  ;C28663|AB      |      ;
REP #$20                             ;C28664|C220    |      ;
LDA.W $001E,X                        ;C28666|BD1E00  |8D001E;
ASL A                                ;C28669|0A      |      ;
TAY                                  ;C2866A|A8      |      ;
LDA.W UNREACH_8D8000,Y               ;C2866B|B90080  |8D8000;
PHA                                  ;C2866E|48      |      ;
LDA.W $0020,X                        ;C2866F|BD2000  |8D0020;
ASL A                                ;C28672|0A      |      ;
CLC                                  ;C28673|18      |      ;
ADC.W $0020,X                        ;C28674|7D2000  |8D0020;
ASL A                                ;C28677|0A      |      ;
CLC                                  ;C28678|18      |      ;
ADC.B $01,S                          ;C28679|6301    |000001;
PLY                                  ;C2867B|7A      |      ;
TAY                                  ;C2867C|A8      |      ;
LDA.W $0000,Y                        ;C2867D|B90000  |8D0000;
AND.W #$00FF                         ;C28680|29FF00  |      ;
BEQ CODE_C286C6                      ;C28683|F041    |C286C6;
DEC A                                ;C28685|3A      |      ;
STA.W $0026,X                        ;C28686|9D2600  |8D0026;
LDA.W $0001,Y                        ;C28689|B90100  |8D0001;
STA.W $0008,X                        ;C2868C|9D0800  |8D0008;
LDA.W $0003,Y                        ;C2868F|B90300  |8D0003;
AND.W #$00FF                         ;C28692|29FF00  |      ;
ASL A                                ;C28695|0A      |      ;
CLC                                  ;C28696|18      |      ;
ADC.W #$0000                         ;C28697|690000  |      ;
STA.W $000A,X                        ;C2869A|9D0A00  |8D000A;
LDA.W $0004,Y                        ;C2869D|B90400  |8D0004;
AND.W #$00FF                         ;C286A0|29FF00  |      ;
STA.W $000C,X                        ;C286A3|9D0C00  |8D000C;
PHA                                  ;C286A6|48      |      ;
LDA.W $0005,Y                        ;C286A7|B90500  |8D0005;
AND.W #$00FF                         ;C286AA|29FF00  |      ;
STA.W $0014,X                        ;C286AD|9D1400  |8D0014;
STA.W $000E,X                        ;C286B0|9D0E00  |8D000E;
INC.W $0020,X                        ;C286B3|FE2000  |8D0020;
PLA                                  ;C286B6|68      |      ;
CMP.W #$0002                         ;C286B7|C90200  |      ;
BNE CODE_C286C2                      ;C286BA|D006    |C286C2;
INC.W $000B,X                        ;C286BC|FE0B00  |8D000B;
INC.W $000B,X                        ;C286BF|FE0B00  |8D000B;

CODE_C286C2:
PLB                                  ;C286C2|AB      |      ;
PLP                                  ;C286C3|28      |      ;
CLC                                  ;C286C4|18      |      ;
RTL                                  ;C286C5|6B      |      ;

CODE_C286C6:
STZ.W $0020,X                        ;C286C6|9E2000  |8D0020;
PLB                                  ;C286C9|AB      |      ;
PLP                                  ;C286CA|28      |      ;
SEC                                  ;C286CB|38      |      ;
RTL                                  ;C286CC|6B      |      ;
PHB                                  ;C286CD|8B      |      ;
PHX                                  ;C286CE|DA      |      ;
LDA.W $0023,X                        ;C286CF|BD2300  |810023;
AND.W #$FF00                         ;C286D2|2900FF  |      ;
ORA.W #$007F                         ;C286D5|097F00  |      ;
STA.W $1C5E                          ;C286D8|8D5E1C  |811C5E;
LDA.W $000C,X                        ;C286DB|BD0C00  |81000C;
PHA                                  ;C286DE|48      |      ;
LDY.W $000A,X                        ;C286DF|BC0A00  |81000A;
LDA.W $0008,X                        ;C286E2|BD0800  |810008;
TAX                                  ;C286E5|AA      |      ;
PLA                                  ;C286E6|68      |      ;
JSR.W UNREACH_C21C5C                 ;C286E7|205C1C  |C21C5C;
TXA                                  ;C286EA|8A      |      ;
PLX                                  ;C286EB|FA      |      ;
STA.W $0008,X                        ;C286EC|9D0800  |810008;
PLB                                  ;C286EF|AB      |      ;
RTL                                  ;C286F0|6B      |      ;
PHP                                  ;C286F1|08      |      ;
PHX                                  ;C286F2|DA      |      ;
PHA                                  ;C286F3|48      |      ;
REP #$20                             ;C286F4|C220    |      ;
JSL.L ConvPosToArrayIdx                    ;C286F6|22E08183|8381E0;
SEP #$20                             ;C286FA|E220    |      ;
PLA                                  ;C286FC|68      |      ;
STA.L tilemap,X                      ;C286FD|9F00807E|7E8000;
PHX                                  ;C28701|DA      |      ;
REP #$20                             ;C28702|C220    |      ;
AND.W #$00FF                         ;C28704|29FF00  |      ;
ASL A                                ;C28707|0A      |      ;
ASL A                                ;C28708|0A      |      ;
ASL A                                ;C28709|0A      |      ;
TAX                                  ;C2870A|AA      |      ;
LDA.L $7E2000,X                      ;C2870B|BF00207E|7E2000;
AND.W $035C                          ;C2870F|2D5C03  |81035C;
ORA.W $036A                          ;C28712|0D6A03  |81036A;
STA.W $1C7D                          ;C28715|8D7D1C  |811C7D;
LDA.L $7E2002,X                      ;C28718|BF02207E|7E2002;
AND.W $035C                          ;C2871C|2D5C03  |81035C;
ORA.W $036A                          ;C2871F|0D6A03  |81036A;
STA.W $1C81                          ;C28722|8D811C  |811C81;
LDA.L $7E2004,X                      ;C28725|BF04207E|7E2004;
AND.W $035C                          ;C28729|2D5C03  |81035C;
ORA.W $036A                          ;C2872C|0D6A03  |81036A;
STA.W $1C85                          ;C2872F|8D851C  |811C85;
LDA.L $7E2006,X                      ;C28732|BF06207E|7E2006;
AND.W $035C                          ;C28736|2D5C03  |81035C;
ORA.W $036A                          ;C28739|0D6A03  |81036A;
STA.W $1C89                          ;C2873C|8D891C  |811C89;
SEP #$20                             ;C2873F|E220    |      ;
LDA.L $7E2001,X                      ;C28741|BF01207E|7E2001;
AND.B #$02                           ;C28745|2902    |      ;
PHA                                  ;C28747|48      |      ;
LDA.L $7E2003,X                      ;C28748|BF03207E|7E2003;
AND.B #$02                           ;C2874C|2902    |      ;
PHA                                  ;C2874E|48      |      ;
LDA.L $7E2005,X                      ;C2874F|BF05207E|7E2005;
AND.B #$02                           ;C28753|2902    |      ;
PHA                                  ;C28755|48      |      ;
LDA.L $7E2007,X                      ;C28756|BF07207E|7E2007;
AND.B #$02                           ;C2875A|2902    |      ;
ASL A                                ;C2875C|0A      |      ;
ORA.B $01,S                          ;C2875D|0301    |000001;
ASL A                                ;C2875F|0A      |      ;
ORA.B $02,S                          ;C28760|0302    |000002;
ASL A                                ;C28762|0A      |      ;
ORA.B $03,S                          ;C28763|0303    |000003;
LSR A                                ;C28765|4A      |      ;
XBA                                  ;C28766|EB      |      ;
PLA                                  ;C28767|68      |      ;
PLA                                  ;C28768|68      |      ;
PLA                                  ;C28769|68      |      ;
XBA                                  ;C2876A|EB      |      ;
PLX                                  ;C2876B|FA      |      ;
STA.L passable_map,X                      ;C2876C|9F00807F|7F8000;
REP #$20                             ;C28770|C220    |      ;
LDA.B $16                            ;C28772|A516    |000016;
CLC                                  ;C28774|18      |      ;
ADC.W #$0010                         ;C28775|691000  |      ;
SEC                                  ;C28778|38      |      ;
SBC.W bg1_hofs                          ;C28779|ED3A03  |81033A;
CMP.W #$0111                         ;C2877C|C91101  |      ;
BCS CODE_C287A9                      ;C2877F|B028    |C287A9;
LDA.B $18                            ;C28781|A518    |000018;
CLC                                  ;C28783|18      |      ;
ADC.W #$0010                         ;C28784|691000  |      ;
SEC                                  ;C28787|38      |      ;
SBC.W bg1_vofs                          ;C28788|ED3C03  |81033C;
CMP.W #$0111                         ;C2878B|C91101  |      ;
BCS CODE_C287A9                      ;C2878E|B019    |C287A9;
JSL.L CODE_C3820E                    ;C28790|220E8283|83820E;
STA.W $1C7B                          ;C28794|8D7B1C  |811C7B;
INC A                                ;C28797|1A      |      ;
STA.W $1C7F                          ;C28798|8D7F1C  |811C7F;
CLC                                  ;C2879B|18      |      ;
ADC.W #$001F                         ;C2879C|691F00  |      ;
STA.W $1C83                          ;C2879F|8D831C  |811C83;
INC A                                ;C287A2|1A      |      ;
STA.W $1C87                          ;C287A3|8D871C  |811C87;
STZ.W $1C8B                          ;C287A6|9C8B1C  |811C8B;

CODE_C287A9:
PLX                                  ;C287A9|FA      |      ;
PLP                                  ;C287AA|28      |      ;
RTL                                  ;C287AB|6B      |      ;
db $08,$DA,$48,$C2,$20,$22,$E0,$81   ;C287AC|        |      ;
db $83,$E2,$20,$68,$9F,$00,$80,$7E   ;C287B4|        |0000E2;
db $9F,$00,$C0,$7E,$DA,$C2,$20,$29   ;C287BC|        |7EC000;
db $FF,$00,$0A,$0A,$0A,$AA,$BF,$00   ;C287C4|        |0A0A00;
db $20,$7E,$2D,$5C,$03,$0D,$6A,$03   ;C287CC|        |C22D7E;
db $8D,$7D,$1C,$BF,$02,$20,$7E,$2D   ;C287D4|        |001C7D;
db $5C,$03,$0D,$6A,$03,$8D,$81,$1C   ;C287DC|        |6A0D03;
db $BF,$04,$20,$7E,$2D,$5C,$03,$0D   ;C287E4|        |7E2004;
db $6A,$03,$8D,$85,$1C,$BF,$06,$20   ;C287EC|        |      ;
db $7E,$2D,$5C,$03,$0D,$6A,$03,$8D   ;C287F4|        |005C2D;
db $89,$1C,$BF,$00,$28,$7E,$2D,$60   ;C287FC|        |      ;
db $03,$0D,$6E,$03,$8D,$8D,$1C,$BF   ;C28804|        |00000D;
db $02,$28,$7E,$2D,$60,$03,$0D,$6E   ;C2880C|        |      ;
db $03,$8D,$91,$1C,$BF,$04,$28,$7E   ;C28814|        |00008D;
db $2D,$60,$03,$0D,$6E,$03,$8D,$95   ;C2881C|        |000360;
db $1C,$BF,$06,$28,$7E,$2D,$60,$03   ;C28824|        |0006BF;
db $0D,$6E,$03,$8D,$99,$1C,$E2,$20   ;C2882C|        |00036E;
db $BF,$01,$20,$7E,$29,$02,$48,$BF   ;C28834|        |7E2001;
db $03,$20,$7E,$29,$02,$48,$BF,$05   ;C2883C|        |000020;
db $20,$7E,$29,$02,$48,$BF,$07,$20   ;C28844|        |C2297E;
db $7E,$29,$02,$0A,$03,$01,$0A,$03   ;C2884C|        |000229;
db $02,$0A,$03,$03,$4A,$EB,$68,$68   ;C28854|        |      ;
db $68,$EB,$FA,$9F,$00,$80,$7F,$C2   ;C2885C|        |      ;
db $20,$A5,$16,$18,$69,$10,$00,$38   ;C28864|        |C216A5;
db $ED,$3A,$03,$C9,$11,$01,$B0,$44   ;C2886C|        |00033A;
db $A5,$18,$18,$69,$10,$00,$38,$ED   ;C28874|        |000018;
db $3C,$03,$C9,$11,$01,$B0,$35,$22   ;C2887C|        |00C903;
db $0E,$82,$83,$48,$8D,$7B,$1C,$1A   ;C28884|        |008382;
db $8D,$7F,$1C,$18,$69,$1F,$00,$8D   ;C2888C|        |001C7F;
db $83,$1C,$1A,$8D,$87,$1C,$68,$38   ;C28894|        |00001C;
db $E9,$00,$60,$18,$69,$00,$70,$8D   ;C2889C|        |      ;
db $8B,$1C,$1A,$8D,$8F,$1C,$18,$69   ;C288A4|        |      ;
db $1F,$00,$8D,$93,$1C,$1A,$8D,$97   ;C288AC|        |938D00;
db $1C,$9C,$9B,$1C,$FA,$28,$6B       ;C288B4|        |009B9C;
PHX                                  ;C288BB|DA      |      ;
ASL A                                ;C288BC|0A      |      ;
ASL A                                ;C288BD|0A      |      ;
ASL A                                ;C288BE|0A      |      ;
TAX                                  ;C288BF|AA      |      ;
TXY                                  ;C288C0|9B      |      ;
LDA.L UNREACH_82FB15,X               ;C288C1|BF15FB82|82FB15;
STA.B $16                            ;C288C5|8516    |000016;
LDA.L UNREACH_82FB17,X               ;C288C7|BF17FB82|82FB17;
STA.B $18                            ;C288CB|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C288CD|22E08183|8381E0;
PHX                                  ;C288D1|DA      |      ;
TYX                                  ;C288D2|BB      |      ;
LDA.L UNREACH_82FB11,X               ;C288D3|BF11FB82|82FB11;
AND.W #$00FF                         ;C288D7|29FF00  |      ;
ASL A                                ;C288DA|0A      |      ;
ASL A                                ;C288DB|0A      |      ;
ASL A                                ;C288DC|0A      |      ;
ASL A                                ;C288DD|0A      |      ;
STA.B $00                            ;C288DE|8500    |000000;
LDA.L UNREACH_82FB12,X               ;C288E0|BF12FB82|82FB12;
AND.W #$00FF                         ;C288E4|29FF00  |      ;
ASL A                                ;C288E7|0A      |      ;
ASL A                                ;C288E8|0A      |      ;
ASL A                                ;C288E9|0A      |      ;
ASL A                                ;C288EA|0A      |      ;
STA.B $18                            ;C288EB|8518    |000018;
LDA.L UNREACH_82FB13,X               ;C288ED|BF13FB82|82FB13;
AND.W #$00FF                         ;C288F1|29FF00  |      ;
STA.B $02                            ;C288F4|8502    |000002;
LDA.L UNREACH_82FB14,X               ;C288F6|BF14FB82|82FB14;
AND.W #$00FF                         ;C288FA|29FF00  |      ;
STA.B $0E                            ;C288FD|850E    |00000E;
LDY.W #$0000                         ;C288FF|A00000  |      ;
PLX                                  ;C28902|FA      |      ;

CODE_C28903:
PHX                                  ;C28903|DA      |      ;
LDA.B $02                            ;C28904|A502    |000002;
STA.B $0C                            ;C28906|850C    |00000C;
LDA.B $00                            ;C28908|A500    |000000;
STA.B $16                            ;C2890A|8516    |000016;

CODE_C2890C:
PHX                                  ;C2890C|DA      |      ;
SEP #$20                             ;C2890D|E220    |      ;
LDA.L tilemap,X                      ;C2890F|BF00807E|7E8000;
PHA                                  ;C28913|48      |      ;
LDA.L passable_map,X                      ;C28914|BF00807F|7F8000;
PHA                                  ;C28918|48      |      ;
REP #$20                             ;C28919|C220    |      ;
JSL.L ConvPosToArrayIdx                    ;C2891B|22E08183|8381E0;
SEP #$20                             ;C2891F|E220    |      ;
PLA                                  ;C28921|68      |      ;
STA.L passable_map,X                      ;C28922|9F00807F|7F8000;
PLA                                  ;C28926|68      |      ;
STA.L tilemap,X                      ;C28927|9F00807E|7E8000;
REP #$20                             ;C2892B|C220    |      ;
LDA.B $16                            ;C2892D|A516    |000016;
CLC                                  ;C2892F|18      |      ;
ADC.W #$0010                         ;C28930|691000  |      ;
SEC                                  ;C28933|38      |      ;
SBC.W bg1_hofs                          ;C28934|ED3A03  |81033A;
CMP.W #$0111                         ;C28937|C91101  |      ;
BCS CODE_C289A6                      ;C2893A|B06A    |C289A6;
LDA.B $18                            ;C2893C|A518    |000018;
CLC                                  ;C2893E|18      |      ;
ADC.W #$0010                         ;C2893F|691000  |      ;
SEC                                  ;C28942|38      |      ;
SBC.W bg1_vofs                          ;C28943|ED3C03  |81033C;
CMP.W #$0111                         ;C28946|C91101  |      ;
BCS CODE_C289A6                      ;C28949|B05B    |C289A6;
LDA.L tilemap,X                      ;C2894B|BF00807E|7E8000;
AND.W #$00FF                         ;C2894F|29FF00  |      ;
ASL A                                ;C28952|0A      |      ;
ASL A                                ;C28953|0A      |      ;
ASL A                                ;C28954|0A      |      ;
TAX                                  ;C28955|AA      |      ;
LDA.L $7E2000,X                      ;C28956|BF00207E|7E2000;
AND.W $035C                          ;C2895A|2D5C03  |81035C;
ORA.W $036A                          ;C2895D|0D6A03  |81036A;
STA.W $1C7D,Y                        ;C28960|997D1C  |811C7D;
LDA.L $7E2002,X                      ;C28963|BF02207E|7E2002;
AND.W $035C                          ;C28967|2D5C03  |81035C;
ORA.W $036A                          ;C2896A|0D6A03  |81036A;
STA.W $1C81,Y                        ;C2896D|99811C  |811C81;
LDA.L $7E2004,X                      ;C28970|BF04207E|7E2004;
AND.W $035C                          ;C28974|2D5C03  |81035C;
ORA.W $036A                          ;C28977|0D6A03  |81036A;
STA.W $1C85,Y                        ;C2897A|99851C  |811C85;
LDA.L $7E2006,X                      ;C2897D|BF06207E|7E2006;
AND.W $035C                          ;C28981|2D5C03  |81035C;
ORA.W $036A                          ;C28984|0D6A03  |81036A;
STA.W $1C89,Y                        ;C28987|99891C  |811C89;
JSL.L CODE_C3820E                    ;C2898A|220E8283|83820E;
STA.W $1C7B,Y                        ;C2898E|997B1C  |811C7B;
INC A                                ;C28991|1A      |      ;
STA.W $1C7F,Y                        ;C28992|997F1C  |811C7F;
CLC                                  ;C28995|18      |      ;
ADC.W #$001F                         ;C28996|691F00  |      ;
STA.W $1C83,Y                        ;C28999|99831C  |811C83;
INC A                                ;C2899C|1A      |      ;
STA.W $1C87,Y                        ;C2899D|99871C  |811C87;
TYA                                  ;C289A0|98      |      ;
CLC                                  ;C289A1|18      |      ;
ADC.W #$0010                         ;C289A2|691000  |      ;
TAY                                  ;C289A5|A8      |      ;

CODE_C289A6:
PLX                                  ;C289A6|FA      |      ;
JSL.L CODE_C38242                    ;C289A7|22428283|838242;
LDA.B $16                            ;C289AB|A516    |000016;
CLC                                  ;C289AD|18      |      ;
ADC.W #$0010                         ;C289AE|691000  |      ;
STA.B $16                            ;C289B1|8516    |000016;
DEC.B $0C                            ;C289B3|C60C    |00000C;
BEQ CODE_C289BA                      ;C289B5|F003    |C289BA;
BRL CODE_C2890C                      ;C289B7|8252FF  |C2890C;

CODE_C289BA:
PLX                                  ;C289BA|FA      |      ;
JSL.L CODE_C38259                    ;C289BB|22598283|838259;
LDA.B $18                            ;C289BF|A518    |000018;
CLC                                  ;C289C1|18      |      ;
ADC.W #$0010                         ;C289C2|691000  |      ;
STA.B $18                            ;C289C5|8518    |000018;
DEC.B $0E                            ;C289C7|C60E    |00000E;
BEQ CODE_C289CE                      ;C289C9|F003    |C289CE;
BRL CODE_C28903                      ;C289CB|8235FF  |C28903;

CODE_C289CE:
LDA.W #$0000                         ;C289CE|A90000  |      ;
STA.W $1C7B,Y                        ;C289D1|997B1C  |811C7B;
PLX                                  ;C289D4|FA      |      ;
RTL                                  ;C289D5|6B      |      ;

check_current_tile_for_action:
    ; check if we are on an even position (not in between two tiles)
    LDA.W PlayerPosReal.x
    ORA.W PlayerPosReal.y
    AND.B #$0F
    BNE .check_something

    ; yes we are, calculate the offset into the tilemap
    REP #$20
    LDA.W PlayerPosReal.x
    STA.B $16
    LDA.W PlayerPosReal.y
    SEC
    SBC.W #$0010
    STA.B $18
    JSL.L ConvPosToArrayIdx

    ; check if the current tile is a cleared lair
    SEP #$20
    LDA.L tilemap, X
    CMP.B #!TM_ClearedLair
    BNE .check_for_door
LDA.W $0464                          ;C289FE|AD6404  |810464;
BNE .ret                      ;C28A01|D025    |C28A28;
JSL.L seal_lair_at_player_pos                    ;C28A03|22258C82|828C25;
BRA .CODE_C28A1B                      ;C28A07|8012    |C28A1B;

.check_for_door:
    JSL.L check_door_entrance                    ;C28A09|229B8B82|828B9B;
BCS .CODE_C28A1B                      ;C28A0D|B00C    |C28A1B;
JSL.L CODE_C28A29                    ;C28A0F|22298A82|828A29;
BCS .CODE_C28A1B                      ;C28A13|B006    |C28A1B;

.check_something:
JSL.L CODE_C28AF2                    ;C28A15|22F28A82|828AF2;
BCC .ret                      ;C28A19|900D    |C28A28;

.CODE_C28A1B:
REP #$20                             ;C28A1B|C220    |      ;
LDX.W $039E                          ;C28A1D|AE9E03  |81039E;
STZ.W $0004,X                        ;C28A20|9E0400  |810004;
STZ.W $0006,X                        ;C28A23|9E0600  |810006;
SEP #$20                             ;C28A26|E220    |      ;

.ret:
    RTL

CODE_C28A29:
JSL.L CODE_C382FC                    ;C28A29|22FC8283|8382FC;
BCS CODE_C28A5A                      ;C28A2D|B02B    |C28A5A;
CMP.B #$00                           ;C28A2F|C900    |      ;
BNE CODE_C28A5A                      ;C28A31|D027    |C28A5A;
LDX.W $03B0                          ;C28A33|AEB003  |8103B0;

CODE_C28A36:
LDA.W LUT_C1A9DE,X               ;C28A36|BDDEA9  |81A9DE;
CMP.B #$FF                           ;C28A39|C9FF    |      ;
BEQ CODE_C28A5A                      ;C28A3B|F01D    |C28A5A;
LDA.W PlayerPosInt.x                          ;C28A3D|AD7803  |810378;
CMP.W LUT_C1A9DE,X               ;C28A40|DDDEA9  |81A9DE;
BNE CODE_C28A4D                      ;C28A43|D008    |C28A4D;
LDA.W PlayerPosInt.y                          ;C28A45|AD7A03  |81037A;
CMP.W UNREACH_81A9DF,X               ;C28A48|DDDFA9  |81A9DF;
BEQ CODE_C28A5C                      ;C28A4B|F00F    |C28A5C;

CODE_C28A4D:
REP #$20                             ;C28A4D|C220    |      ;
TXA                                  ;C28A4F|8A      |      ;
CLC                                  ;C28A50|18      |      ;
ADC.W #$0006                         ;C28A51|690600  |      ;
TAX                                  ;C28A54|AA      |      ;
SEP #$20                             ;C28A55|E220    |      ;
BRL CODE_C28A36                      ;C28A57|82DCFF  |C28A36;

CODE_C28A5A:
CLC                                  ;C28A5A|18      |      ;
RTL                                  ;C28A5B|6B      |      ;

CODE_C28A5C:
TXY                                  ;C28A5C|9B      |      ;
REP #$20                             ;C28A5D|C220    |      ;
LDA.W PlayerPosReal.x                          ;C28A5F|AD7403  |810374;
STA.B $16                            ;C28A62|8516    |000016;
LDA.W PlayerPosReal.y                          ;C28A64|AD7603  |810376;
SEC                                  ;C28A67|38      |      ;
SBC.W #$0020                         ;C28A68|E92000  |      ;
STA.B $18                            ;C28A6B|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C28A6D|22E08183|8381E0;
SEP #$20                             ;C28A71|E220    |      ;
LDA.L tilemap,X                      ;C28A73|BF00807E|7E8000;
CMP.B #$FB                           ;C28A77|C9FB    |      ;
BNE CODE_C28A5A                      ;C28A79|D0DF    |C28A5A;
TYX                                  ;C28A7B|BB      |      ;
LDA.B #$00                           ;C28A7C|A900    |      ;
XBA                                  ;C28A7E|EB      |      ;
LDA.W UNREACH_81A9E0,X               ;C28A7F|BDE0A9  |81A9E0;
AND.B #$7F                           ;C28A82|297F    |      ;
LDY.W #$1A7E                         ;C28A84|A07E1A  |      ;
JSL.L checkIfBitIsSet                    ;C28A87|22CA8283|8382CA;
BCS CODE_C28A5A                      ;C28A8B|B0CD    |C28A5A;
JSL.L setBit                    ;C28A8D|22708283|838270;
BRK #$15                             ;C28A91|0015    |      ;
LDA.W UNREACH_81A9E0,X               ;C28A93|BDE0A9  |81A9E0;
BMI UNREACH_C28AA0                   ;C28A96|3008    |C28AA0;
LDA.B #$FC                           ;C28A98|A9FC    |      ;
JSL.L CODE_C286F1                    ;C28A9A|22F18682|8286F1;
BRA CODE_C28AA6                      ;C28A9E|8006    |C28AA6;

UNREACH_C28AA0:
db $A9,$FC,$22,$AC,$87,$82           ;C28AA0|        |      ;

CODE_C28AA6:
LDA.B #$1E                           ;C28AA6|A91E    |      ;
JSL.L CODE_C2B140                    ;C28AA8|2240B182|82B140;
LDA.W UNREACH_81A9E1,X               ;C28AAC|BDE1A9  |81A9E1;
STA.W $03CA                          ;C28AAF|8DCA03  |8103CA;
STZ.W $03CB                          ;C28AB2|9CCB03  |8103CB;
BEQ UNREACH_C28ACA                   ;C28AB5|F013    |C28ACA;
CMP.B #$FF                           ;C28AB7|C9FF    |      ;
BEQ CODE_C28AD3                      ;C28AB9|F018    |C28AD3;
JSL.L giveItem                    ;C28ABB|22FEA082|82A0FE;
LDY.W #Txt_Item_Received                         ;C28ABF|A0E3E4  |      ;
JSL.L printOsdStringFromBankX                    ;C28AC2|2212AC82|82AC12;
BRK #$9E                             ;C28AC6|009E    |      ;
SEC                                  ;C28AC8|38      |      ;
RTL                                  ;C28AC9|6B      |      ;

UNREACH_C28ACA:
db $A0,$FD,$E4,$22,$12,$AC,$82,$38   ;C28ACA|        |      ;
db $6B                               ;C28AD2|        |      ;

CODE_C28AD3:
REP #$20                             ;C28AD3|C220    |      ;
LDA.W UNREACH_81A9E2,X               ;C28AD5|BDE2A9  |81A9E2;
STA.W $03CA                          ;C28AD8|8DCA03  |8103CA;
JSL.L CODE_C385D9                    ;C28ADB|22D98583|8385D9;
LDA.W #!UpdateHud_Gold                         ;C28ADF|A91000  |      ;
TSB.W display_hud_bitfield                          ;C28AE2|0C3203  |810332;
SEP #$20                             ;C28AE5|E220    |      ;
LDY.W #Txt_Received_Jwl                         ;C28AE7|A007E5  |      ;
JSL.L printOsdStringFromBankX                    ;C28AEA|2212AC82|82AC12;
BRK #$8D                             ;C28AEE|008D    |      ;
SEC                                  ;C28AF0|38      |      ;
RTL                                  ;C28AF1|6B      |      ;

CODE_C28AF2:
PHP                                  ;C28AF2|08      |      ;
LDX.W $03B4                          ;C28AF3|AEB403  |8103B4;
BEQ CODE_C28B23                      ;C28AF6|F02B    |C28B23;

CODE_C28AF8:
LDA.W LUT_C1AC96,X               ;C28AF8|BD96AC  |81AC96;
CMP.B #$FF                           ;C28AFB|C9FF    |      ;
BEQ CODE_C28B23                      ;C28AFD|F024    |C28B23;
LDA.W PlayerPosInt.x                          ;C28AFF|AD7803  |810378;
SEC                                  ;C28B02|38      |      ;
SBC.W LUT_C1AC96,X               ;C28B03|FD96AC  |81AC96;
CMP.W UNREACH_81AC98,X               ;C28B06|DD98AC  |81AC98;
BCS CODE_C28B17                      ;C28B09|B00C    |C28B17;
LDA.W PlayerPosInt.y                          ;C28B0B|AD7A03  |81037A;
SEC                                  ;C28B0E|38      |      ;
SBC.W UNREACH_81AC97,X               ;C28B0F|FD97AC  |81AC97;
CMP.W UNREACH_81AC99,X               ;C28B12|DD99AC  |81AC99;
BCC CODE_C28B26                      ;C28B15|900F    |C28B26;

CODE_C28B17:
REP #$20                             ;C28B17|C220    |      ;
TXA                                  ;C28B19|8A      |      ;
CLC                                  ;C28B1A|18      |      ;
ADC.W #$000B                         ;C28B1B|690B00  |      ;
TAX                                  ;C28B1E|AA      |      ;
SEP #$20                             ;C28B1F|E220    |      ;
BRA CODE_C28AF8                      ;C28B21|80D5    |C28AF8;

CODE_C28B23:
PLP                                  ;C28B23|28      |      ;
CLC                                  ;C28B24|18      |      ;
RTL                                  ;C28B25|6B      |      ;

CODE_C28B26:
REP #$20                             ;C28B26|C220    |      ;
LDA.W LUT_C1AC96,X               ;C28B28|BD96AC  |81AC96;
AND.W #$00FF                         ;C28B2B|29FF00  |      ;
ASL A                                ;C28B2E|0A      |      ;
ASL A                                ;C28B2F|0A      |      ;
ASL A                                ;C28B30|0A      |      ;
ASL A                                ;C28B31|0A      |      ;
STA.B $00                            ;C28B32|8500    |000000;
LDA.W UNREACH_81AC97,X               ;C28B34|BD97AC  |81AC97;
AND.W #$00FF                         ;C28B37|29FF00  |      ;
ASL A                                ;C28B3A|0A      |      ;
ASL A                                ;C28B3B|0A      |      ;
ASL A                                ;C28B3C|0A      |      ;
ASL A                                ;C28B3D|0A      |      ;
CLC                                  ;C28B3E|18      |      ;
ADC.W #$0010                         ;C28B3F|691000  |      ;
STA.B $02                            ;C28B42|8502    |000002;
LDA.W UNREACH_81AC98,X               ;C28B44|BD98AC  |81AC98;
AND.W #$00FF                         ;C28B47|29FF00  |      ;
ASL A                                ;C28B4A|0A      |      ;
ASL A                                ;C28B4B|0A      |      ;
ASL A                                ;C28B4C|0A      |      ;
ASL A                                ;C28B4D|0A      |      ;
SEC                                  ;C28B4E|38      |      ;
SBC.W #$000F                         ;C28B4F|E90F00  |      ;
STA.B $04                            ;C28B52|8504    |000004;
LDA.W UNREACH_81AC99,X               ;C28B54|BD99AC  |81AC99;
AND.W #$00FF                         ;C28B57|29FF00  |      ;
ASL A                                ;C28B5A|0A      |      ;
ASL A                                ;C28B5B|0A      |      ;
ASL A                                ;C28B5C|0A      |      ;
ASL A                                ;C28B5D|0A      |      ;
SEC                                  ;C28B5E|38      |      ;
SBC.W #$000F                         ;C28B5F|E90F00  |      ;
STA.B $06                            ;C28B62|8506    |000006;
LDA.W PlayerPosReal.x                          ;C28B64|AD7403  |810374;
SEC                                  ;C28B67|38      |      ;
SBC.B $00                            ;C28B68|E500    |000000;
CMP.B $04                            ;C28B6A|C504    |000004;
BCS CODE_C28B23                      ;C28B6C|B0B5    |C28B23;
LDA.W PlayerPosReal.y                          ;C28B6E|AD7603  |810376;
SEC                                  ;C28B71|38      |      ;
SBC.B $02                            ;C28B72|E502    |000002;
CMP.B $06                            ;C28B74|C506    |000006;
BCS CODE_C28B23                      ;C28B76|B0AB    |C28B23;
SEP #$20                             ;C28B78|E220    |      ;
LDA.W UNREACH_81AC9A,X               ;C28B7A|BD9AAC  |81AC9A;
STA.W $0319                          ;C28B7D|8D1903  |810319;
LDA.W UNREACH_81AC9B,X               ;C28B80|BD9BAC  |81AC9B;
STA.W sceneId                          ;C28B83|8D1803  |810318;
LDA.W UNREACH_81AC9C,X               ;C28B86|BD9CAC  |81AC9C;
STA.W TeleportPos.facing                          ;C28B89|8D8003  |810380;
LDY.W UNREACH_81AC9D,X               ;C28B8C|BC9DAC  |81AC9D;
STY.W TeleportPos.x                          ;C28B8F|8C7C03  |81037C;
LDY.W UNREACH_81AC9F,X               ;C28B92|BC9FAC  |81AC9F;
STY.W TeleportPos.y                          ;C28B95|8C7E03  |81037E;
PLP                                  ;C28B98|28      |      ;
SEC                                  ;C28B99|38      |      ;
RTL                                  ;C28B9A|6B      |      ;

check_door_entrance:
LDX.W $03AE                          ;C28B9B|AEAE03  |8103AE;

CODE_C28B9E:
LDA.W LUT_C1B69A,X               ;C28B9E|BD9AB6  |81B69A;
CMP.B #$FF                           ;C28BA1|C9FF    |      ;
BEQ CODE_C28C23                      ;C28BA3|F07E    |C28C23;
CMP.W PlayerPosInt.x                          ;C28BA5|CD7803  |810378;
BNE CODE_C28C1C                      ;C28BA8|D072    |C28C1C;
LDA.W UNREACH_81B69B,X               ;C28BAA|BD9BB6  |81B69B;
CMP.W PlayerPosInt.y                          ;C28BAD|CD7A03  |81037A;
BNE CODE_C28C1C                      ;C28BB0|D06A    |C28C1C;
LDA.W UNREACH_81B69D,X               ;C28BB2|BD9DB6  |81B69D;
XBA                                  ;C28BB5|EB      |      ;
LDA.W UNREACH_81B69C,X               ;C28BB6|BD9CB6  |81B69C;
LDY.W #$1A9E                         ;C28BB9|A09E1A  |      ;
JSL.L checkIfBitIsSet                    ;C28BBC|22CA8283|8382CA;
BCC CODE_C28C23                      ;C28BC0|9061    |C28C23;
REP #$20                             ;C28BC2|C220    |      ;
LDA.W UNREACH_81B69C,X               ;C28BC4|BD9CB6  |81B69C;
ASL A                                ;C28BC7|0A      |      ;
ASL A                                ;C28BC8|0A      |      ;
ASL A                                ;C28BC9|0A      |      ;
ASL A                                ;C28BCA|0A      |      ;
ASL A                                ;C28BCB|0A      |      ;
CLC                                  ;C28BCC|18      |      ;
ADC.W #$BA0D                         ;C28BCD|690DBA  |      ;
TAX                                  ;C28BD0|AA      |      ;
LDY.W #$1C6D                         ;C28BD1|A06D1C  |      ;
LDA.W #$0007                         ;C28BD4|A90700  |      ;
MVN $81,$81                          ;C28BD7|548181  |      ;
SEP #$20                             ;C28BDA|E220    |      ;
LDA.W $03AA                          ;C28BDC|ADAA03  |8103AA;
CLC                                  ;C28BDF|18      |      ;
ADC.B #$02                           ;C28BE0|6902    |      ;
STA.W $1C6E                          ;C28BE2|8D6E1C  |811C6E;
JSR.W CODE_C2912A                    ;C28BE5|202A91  |C2912A;
LDA.B #$01                           ;C28BE8|A901    |      ;
STA.W $1C75                          ;C28BEA|8D751C  |811C75;
INC.W $1C6C                          ;C28BED|EE6C1C  |811C6C;
LDA.B #$23                           ;C28BF0|A923    |      ;

CODE_C28BF2:
JSL.L CODE_C0819A                    ;C28BF2|229A8180|80819A;
DEC A                                ;C28BF6|3A      |      ;
BNE CODE_C28BF2                      ;C28BF7|D0F9    |C28BF2;
STZ.W $1C6C                          ;C28BF9|9C6C1C  |811C6C;
REP #$20                             ;C28BFC|C220    |      ;
LDX.W $03AC                          ;C28BFE|AEAC03  |8103AC;
LDA.W $03AA                          ;C28C01|ADAA03  |8103AA;
EOR.W #$0001                         ;C28C04|490100  |      ;
STA.W $03AA                          ;C28C07|8DAA03  |8103AA;
BEQ CODE_C28C0E                      ;C28C0A|F002    |C28C0E;
INX                                  ;C28C0C|E8      |      ;
INX                                  ;C28C0D|E8      |      ;

CODE_C28C0E:
LDA.W LUT_C1B69A,X               ;C28C0E|BD9AB6  |81B69A;
SEC                                  ;C28C11|38      |      ;
SBC.W #$B69A                         ;C28C12|E99AB6  |      ;
STA.W $03AE                          ;C28C15|8DAE03  |8103AE;
SEP #$20                             ;C28C18|E220    |      ;
SEC                                  ;C28C1A|38      |      ;
RTL                                  ;C28C1B|6B      |      ;

CODE_C28C1C:
INX                                  ;C28C1C|E8      |      ;
INX                                  ;C28C1D|E8      |      ;
INX                                  ;C28C1E|E8      |      ;
INX                                  ;C28C1F|E8      |      ;
BRL CODE_C28B9E                      ;C28C20|827BFF  |C28B9E;

CODE_C28C23:
CLC                                  ;C28C23|18      |      ;
RTL                                  ;C28C24|6B      |      ;

seal_lair_at_player_pos:
    STX.B TempVar0
    LDX.W #0
    TXY

.find_correct_lair_entry:
..loop:
    LDA.W LairDataStructure.resur_map_num, X
    CMP.B #$FF ; the end marker
    BEQ ..ret
    LDA.W LairDataStructure.lair_map_number, X
    CMP.W current_map_number
    BNE ..next
    LDA.W LairDataStructure.lair_pos_x, X
    CMP.W PlayerPosInt.x
    BNE ..next
    LDA.W LairDataStructure.lair_pos_y, X
    CMP.W PlayerPosInt.y
    BEQ .found_entry

..next:
    REP #$20
    TXA
    CLC
    ADC.W #objectsize(LairDataStructure)
    TAX
    SEP #$20
    INY
    BRA ..loop

..ret:
    RTL

; X contains an offset in respect to `LairDataStructure`
; Y contains the index number of `LairDataStructure`
.found_entry:

    ; decremtn `remaining_lair` by one
    LDA.W remaining_lair
    BEQ + : DEC.W remaining_lair : +

    PHX
    LDA.W LairDataStructure.field_08, X
    PHP
    ; load previous X, which contains the index into an array (in this case `tilemap`)
    LDX.B $00
    ; seal the lair and store that into the tilemap
    LDA.B #!TM_SealedLair
    STA.L tilemap, X
    PLP ; pull `field_08` equal flag
    BEQ + : STA DATA_7EC000, X : +

    ; pull the offset to `LairDataStructure` from stack
    PLX
    ; check where the action is taking place, on the current screen or somewhere else
    LDA.W LairDataStructure.field_0E, X
    ORA.W LairDataStructure.field_0F, X
    BNE + : BRL CODE_C28D18 : +

    ; we stay right where we are
    PHX
    LDA.W LairDataStructure.field_0A, X
    ORA.B #$80
    TYX
    ; indicate that the lair is sealed now
    STA.L lair_spawn, X

    ; also store that in the `lair_sealed_table`
    REP #$20
    TYA
    LDY.W #lair_sealed_table
    JSL.L setBit
    ; also set it in the `something_table`
    LDY.W #something_table
    JSL.L setBit

    SEP #$20
    ; pull the offset to `LairDataStructure` from stack
    PLX
    ; check if we are on the same map
    LDA.W LairDataStructure.resur_map_num, X
    CMP.W current_map_number
    BNE CODE_C28CFD ; TODO

    ; load X and Y position of event to trigger
    REP #$20
    LDA.W LairDataStructure.field_0E, X
    AND.W #$FF
    ASL #4
    STA.B $16

    LDA.W LairDataStructure.field_0F, X
    AND.W #$FF
    ASL #4
    STA.B $18

    PHX
    TXA
    CLC

    ; copy 8 bytes from `LairDataStructure, X` to $1C6D
    ADC.W #LairDataStructure
    TAX
    LDY.W #$1C6D
    LDA.W #7
    MVN $81,$81

    ; pull old offset to LairDataStructure
    PLX
    SEP #$20
    LDA.W LairDataStructure.field_08, X
    BEQ CODE_C28CFA
    LSR
    BCC CODE_C28CE1
    JSR.W CODE_C2925E
    BRA CODE_C28CE4

CODE_C28CE1:
    JSR.W CODE_C291CB
CODE_C28CE4:
    BRK #$94
    JSL.L CODE_C0819A
    LDA.B #1
    STA.W $1C75
    LDA.B #$23
CODE_C28CF1:
    JSL.L CODE_C0819A
    DEC
    BNE CODE_C28CF1
    BRA CODE_C28D03

CODE_C28CFA:
JSR.W CODE_C291CB                    ;C28CFA|20CB91  |C291CB;

CODE_C28CFD:
JSL.L CODE_C0819A                    ;C28CFD|229A8180|80819A;
BRK #$94                             ;C28D01|0094    |      ;
CODE_C28D03:
LDA.B #$01                           ;C28D03|A901    |      ;
STA.W $1C75                          ;C28D05|8D751C  |811C75;
INC.W $1C6C                          ;C28D08|EE6C1C  |811C6C;
LDA.B #$23                           ;C28D0B|A923    |      ;

CODE_C28D0D:
JSL.L CODE_C0819A                    ;C28D0D|229A8180|80819A;
DEC A                                ;C28D11|3A      |      ;
BNE CODE_C28D0D                      ;C28D12|D0F9    |C28D0D;
STZ.W $1C6C                          ;C28D14|9C6C1C  |811C6C;
RTL                                  ;C28D17|6B      |      ;

CODE_C28D18:
PHX                                  ;C28D18|DA      |      ;
LDA.W LairDataStructure.field_0A, X
ORA.B #$C0                           ;C28D1C|09C0    |      ;
TYX                                  ;C28D1E|BB      |      ;
STA.L lair_spawn,X                      ;C28D1F|9F03027F|7F0203;
PLX                                  ;C28D23|FA      |      ;
LDA.W UNREACH_81BA0D,X               ;C28D24|BD0DBA  |81BA0D;
CMP.W current_map_number                          ;C28D27|CD6A1C  |811C6A;
BNE CODE_C28D54                      ;C28D2A|D028    |C28D54;
db $C2,$20,$BD,$0F,$BA,$29,$FF,$00   ;C28D2C|        |      ;
db $0A,$0A,$0A,$0A,$85,$16,$BD,$10   ;C28D34|        |      ;
db $BA,$29,$FF,$00,$0A,$0A,$0A,$0A   ;C28D3C|        |      ;
db $85,$18,$22,$E0,$81,$83,$E2,$20   ;C28D44|        |000018;
db $A9,$01,$9F,$00,$80,$7F,$80,$A9   ;C28D4C|        |      ;

CODE_C28D54:
BRK #$98                             ;C28D54|0098    |      ;
LDA.W $0314                          ;C28D56|AD1403  |810314;
STA.W $03FF                          ;C28D59|8DFF03  |8103FF;
LDA.W $0316                          ;C28D5C|AD1603  |810316;
STA.W $0401                          ;C28D5F|8D0104  |810401;
LDA.W UNREACH_81BA2A,X               ;C28D62|BD2ABA  |81BA2A;
STA.W TeleportPos.facing                          ;C28D65|8D8003  |810380;
REP #$20                             ;C28D68|C220    |      ;
LDA.W PlayerPosReal.x                          ;C28D6A|AD7403  |810374;
STA.W $0403                          ;C28D6D|8D0304  |810403;
LDA.W PlayerPosReal.y                          ;C28D70|AD7603  |810376;
SEC                                  ;C28D73|38      |      ;
SBC.W #$0010                         ;C28D74|E91000  |      ;
STA.W $0405                          ;C28D77|8D0504  |810405;
LDA.W UNREACH_81BA0F,X               ;C28D7A|BD0FBA  |81BA0F;
AND.W #$00FF                         ;C28D7D|29FF00  |      ;
ASL A                                ;C28D80|0A      |      ;
ASL A                                ;C28D81|0A      |      ;
ASL A                                ;C28D82|0A      |      ;
ASL A                                ;C28D83|0A      |      ;
STA.W TeleportPos.x                          ;C28D84|8D7C03  |81037C;
LDA.W UNREACH_81BA10,X               ;C28D87|BD10BA  |81BA10;
AND.W #$00FF                         ;C28D8A|29FF00  |      ;
ASL A                                ;C28D8D|0A      |      ;
ASL A                                ;C28D8E|0A      |      ;
ASL A                                ;C28D8F|0A      |      ;
ASL A                                ;C28D90|0A      |      ;
STA.W TeleportPos.y                          ;C28D91|8D7E03  |81037E;
LDA.W UNREACH_81BA0D,X               ;C28D94|BD0DBA  |81BA0D;
AND.W #$00FF                         ;C28D97|29FF00  |      ;
ASL A                                ;C28D9A|0A      |      ;
TAX                                  ;C28D9B|AA      |      ;
SEP #$20                             ;C28D9C|E220    |      ;
LDA.B #$80                           ;C28D9E|A980    |      ;
STA.W $03E5                          ;C28DA0|8DE503  |8103E5;
LDA.L UNREACH_82FC39,X               ;C28DA3|BF39FC82|82FC39;
STA.W $0319                          ;C28DA7|8D1903  |810319;
LDA.L UNREACH_82FC3A,X               ;C28DAA|BF3AFC82|82FC3A;
STA.W sceneId                          ;C28DAE|8D1803  |810318;
LDA.B #$20                           ;C28DB1|A920    |      ;
STA.W $03B6                          ;C28DB3|8DB603  |8103B6;
STY.W revealing_lair_id                          ;C28DB6|8C0704  |810407;
INC.W lair_reveal_in_progress                          ;C28DB9|EEFD03  |8103FD;
RTL                                  ;C28DBC|6B      |      ;

CODE_C28DBD:
LDX.W #$0000                         ;C28DBD|A20000  |      ;
TXY                                  ;C28DC0|9B      |      ;

CODE_C28DC1:
LDA.W UNREACH_81BA0D,X               ;C28DC1|BD0DBA  |81BA0D;
BMI UNREACH_C28DE8                   ;C28DC4|3022    |C28DE8;
CMP.W current_map_number                          ;C28DC6|CD6A1C  |811C6A;
BNE CODE_C28DDB                      ;C28DC9|D010    |C28DDB;
LDA.W UNREACH_81BA0F,X               ;C28DCB|BD0FBA  |81BA0F;
CMP.W PlayerPosInt.x                          ;C28DCE|CD7803  |810378;
BNE CODE_C28DDB                      ;C28DD1|D008    |C28DDB;
LDA.W UNREACH_81BA10,X               ;C28DD3|BD10BA  |81BA10;
CMP.W PlayerPosInt.y                          ;C28DD6|CD7A03  |81037A;
BEQ CODE_C28DE9                      ;C28DD9|F00E    |C28DE9;

CODE_C28DDB:
REP #$20                             ;C28DDB|C220    |      ;
TXA                                  ;C28DDD|8A      |      ;
CLC                                  ;C28DDE|18      |      ;
ADC.W #$0020                         ;C28DDF|692000  |      ;
TAX                                  ;C28DE2|AA      |      ;
INY                                  ;C28DE3|C8      |      ;
SEP #$20                             ;C28DE4|E220    |      ;
BRA CODE_C28DC1                      ;C28DE6|80D9    |C28DC1;

UNREACH_C28DE8:
db $6B                               ;C28DE8|        |      ;

CODE_C28DE9:
LDA.W UNREACH_81BA16,X               ;C28DE9|BD16BA  |81BA16;
STA.W $03CA                          ;C28DEC|8DCA03  |8103CA;
STZ.W $03CB                          ;C28DEF|9CCB03  |8103CB;
PHX                                  ;C28DF2|DA      |      ;
PHY                                  ;C28DF3|5A      |      ;
LDY.W #Txt_Soul_Release                         ;C28DF4|A0C8E4  |      ;
JSL.L printOsdStringFromBankX                    ;C28DF7|2212AC82|82AC12;
JSL.L CODE_C0819A                    ;C28DFB|229A8180|80819A;
PLY                                  ;C28DFF|7A      |      ;
PLX                                  ;C28E00|FA      |      ;
PHX                                  ;C28E01|DA      |      ;
TYX                                  ;C28E02|BB      |      ;
LDA.L lair_spawn,X                      ;C28E03|BF03027F|7F0203;
AND.B #$BF                           ;C28E07|29BF    |      ;
STA.L lair_spawn,X                      ;C28E09|9F03027F|7F0203;
PLX                                  ;C28E0D|FA      |      ;
REP #$20                             ;C28E0E|C220    |      ;
TYA                                  ;C28E10|98      |      ;
PHA                                  ;C28E11|48      |      ;
TXA                                  ;C28E12|8A      |      ;
CLC                                  ;C28E13|18      |      ;
ADC.W #$BA0D                         ;C28E14|690DBA  |      ;
TAX                                  ;C28E17|AA      |      ;
LDY.W #$1C6D                         ;C28E18|A06D1C  |      ;
LDA.W #$0007                         ;C28E1B|A90700  |      ;
MVN $81,$81                          ;C28E1E|548181  |      ;
LDA.W $1C6F                          ;C28E21|AD6F1C  |811C6F;
AND.W #$00FF                         ;C28E24|29FF00  |      ;
ASL A                                ;C28E27|0A      |      ;
ASL A                                ;C28E28|0A      |      ;
ASL A                                ;C28E29|0A      |      ;
ASL A                                ;C28E2A|0A      |      ;
STA.B $16                            ;C28E2B|8516    |000016;
LDA.W $1C70                          ;C28E2D|AD701C  |811C70;
AND.W #$00FF                         ;C28E30|29FF00  |      ;
ASL A                                ;C28E33|0A      |      ;
ASL A                                ;C28E34|0A      |      ;
ASL A                                ;C28E35|0A      |      ;
ASL A                                ;C28E36|0A      |      ;
STA.B $18                            ;C28E37|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C28E39|22E08183|8381E0;
PHX                                  ;C28E3D|DA      |      ;
SEP #$20                             ;C28E3E|E220    |      ;
LDA.W $0343                          ;C28E40|AD4303  |810343;
XBA                                  ;C28E43|EB      |      ;
LDA.W $0345                          ;C28E44|AD4503  |810345;
JSL.L multiply                    ;C28E47|22D1B182|82B1D1;
STA.B $01                            ;C28E4B|8501    |000001;
STZ.B $00                            ;C28E4D|6400    |000000;
LDY.W #$0004                         ;C28E4F|A00400  |      ;

CODE_C28E52:
REP #$20                             ;C28E52|C220    |      ;
TXA                                  ;C28E54|8A      |      ;
CLC                                  ;C28E55|18      |      ;
ADC.B $00                            ;C28E56|6500    |000000;
TAX                                  ;C28E58|AA      |      ;
SEP #$20                             ;C28E59|E220    |      ;
CPX.W #$4000                         ;C28E5B|E00040  |      ;
BCS CODE_C28E63                      ;C28E5E|B003    |C28E63;
DEY                                  ;C28E60|88      |      ;
BNE CODE_C28E52                      ;C28E61|D0EF    |C28E52;

CODE_C28E63:
PLX                                  ;C28E63|FA      |      ;
BRK #$9C                             ;C28E64|009C    |      ;
LDA.W $1C73                          ;C28E66|AD731C  |811C73;
BNE CODE_C28E74                      ;C28E69|D009    |C28E74;
STZ.W $1C75                          ;C28E6B|9C751C  |811C75;
JSL.L CODE_C0819A                    ;C28E6E|229A8180|80819A;
BRA CODE_C28E95                      ;C28E72|8021    |C28E95;

CODE_C28E74:
JSR.W CODE_C2912A                    ;C28E74|202A91  |C2912A;
LDA.B #$01                           ;C28E77|A901    |      ;
STA.W $1C75                          ;C28E79|8D751C  |811C75;
INC.W $1C6C                          ;C28E7C|EE6C1C  |811C6C;
LDA.B #$23                           ;C28E7F|A923    |      ;

CODE_C28E81:
JSL.L CODE_C0819A                    ;C28E81|229A8180|80819A;
DEC A                                ;C28E85|3A      |      ;
BNE CODE_C28E81                      ;C28E86|D0F9    |C28E81;
STZ.W $1C6C                          ;C28E88|9C6C1C  |811C6C;
INC.W $1C6E                          ;C28E8B|EE6E1C  |811C6E;
LDA.W $1C6E                          ;C28E8E|AD6E1C  |811C6E;
CMP.B #$04                           ;C28E91|C904    |      ;
BCC CODE_C28E74                      ;C28E93|90DF    |C28E74;

CODE_C28E95:
REP #$20                             ;C28E95|C220    |      ;
PLA                                  ;C28E97|68      |      ;
LDY.W #$1A9E                         ;C28E98|A09E1A  |      ;
JSL.L setBit                    ;C28E9B|22708283|838270;
LDY.W #$1ADE                         ;C28E9F|A0DE1A  |      ;
JSL.L setBit                    ;C28EA2|22708283|838270;
SEP #$20                             ;C28EA6|E220    |      ;
RTL                                  ;C28EA8|6B      |      ;

CODE_C28EA9:
REP #$20                             ;C28EA9|C220    |      ;
LDA.W PlayerPosReal.x                          ;C28EAB|AD7403  |810374;
STA.B $16                            ;C28EAE|8516    |000016;
LDA.W PlayerPosReal.y                          ;C28EB0|AD7603  |810376;
SEC                                  ;C28EB3|38      |      ;
SBC.W #$0010                         ;C28EB4|E91000  |      ;
STA.B $18                            ;C28EB7|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C28EB9|22E08183|8381E0;
SEP #$20                             ;C28EBD|E220    |      ;
LDA.L passable_map,X                      ;C28EBF|BF00807F|7F8000;
CMP.B #$01                           ;C28EC3|C901    |      ;
BNE UNREACH_C28ECC                   ;C28EC5|D005    |C28ECC;
JSL.L CODE_C28DBD                    ;C28EC7|22BD8D82|828DBD;
RTL                                  ;C28ECB|6B      |      ;

UNREACH_C28ECC:
REP #$20
LDA.W revealing_lair_id
ASL #5
TAX
SEP #$20
LDA.W LairDataStructure.npc_name, X
STA.W text_lut_id
STZ.W text_lut_id+1
LDY.W #Txt_Soul_Still_Captured
JSL.L printOsdStringFromBankX
RTL

CODE_C28EEA:
LDA.W $1C75                          ;C28EEA|AD751C  |811C75;
BNE CODE_C28EF0                      ;C28EED|D001    |C28EF0;
RTL                                  ;C28EEF|6B      |      ;

CODE_C28EF0:
LDA.W $1C6C                          ;C28EF0|AD6C1C  |811C6C;
BNE CODE_C28EF8                      ;C28EF3|D003    |C28EF8;
db $82,$B5,$00                       ;C28EF5|        |C28FAD;

CODE_C28EF8:
PHP                                  ;C28EF8|08      |      ;
REP #$20                             ;C28EF9|C220    |      ;
LDY.W #$0000                         ;C28EFB|A00000  |      ;
LDA.W bg1_hofs                          ;C28EFE|AD3A03  |81033A;
AND.W #$FFF0                         ;C28F01|29F0FF  |      ;
STA.W $1C77                          ;C28F04|8D771C  |811C77;
LDA.W bg1_vofs                          ;C28F07|AD3C03  |81033C;
AND.W #$FFF0                         ;C28F0A|29F0FF  |      ;
STA.W $1C79                          ;C28F0D|8D791C  |811C79;
LDA.W $1C75                          ;C28F10|AD751C  |811C75;
DEC A                                ;C28F13|3A      |      ;
ASL A                                ;C28F14|0A      |      ;
ASL A                                ;C28F15|0A      |      ;
ASL A                                ;C28F16|0A      |      ;
ASL A                                ;C28F17|0A      |      ;
ASL A                                ;C28F18|0A      |      ;
TAX                                  ;C28F19|AA      |      ;
LDA.W #$0010                         ;C28F1A|A91000  |      ;
STA.B $0C                            ;C28F1D|850C    |00000C;

CODE_C28F1F:
LDA.L UNREACH_82F43A,X               ;C28F1F|BF3AF482|82F43A;
AND.W #$00FF                         ;C28F23|29FF00  |      ;
ASL A                                ;C28F26|0A      |      ;
ASL A                                ;C28F27|0A      |      ;
ASL A                                ;C28F28|0A      |      ;
ASL A                                ;C28F29|0A      |      ;
CLC                                  ;C28F2A|18      |      ;
ADC.W $1C77                          ;C28F2B|6D771C  |811C77;
STA.B $16                            ;C28F2E|8516    |000016;
LDA.L UNREACH_82F44A,X               ;C28F30|BF4AF482|82F44A;
AND.W #$00FF                         ;C28F34|29FF00  |      ;
ASL A                                ;C28F37|0A      |      ;
ASL A                                ;C28F38|0A      |      ;
ASL A                                ;C28F39|0A      |      ;
ASL A                                ;C28F3A|0A      |      ;
CLC                                  ;C28F3B|18      |      ;
ADC.W $1C79                          ;C28F3C|6D791C  |811C79;
STA.B $18                            ;C28F3F|8518    |000018;
PHX                                  ;C28F41|DA      |      ;
JSR.W CODE_C29062                    ;C28F42|206290  |C29062;
STA.W $1C7B,Y                        ;C28F45|997B1C  |811C7B;
INC A                                ;C28F48|1A      |      ;
STA.W $1C7F,Y                        ;C28F49|997F1C  |811C7F;
CLC                                  ;C28F4C|18      |      ;
ADC.W #$001F                         ;C28F4D|691F00  |      ;
STA.W $1C83,Y                        ;C28F50|99831C  |811C83;
INC A                                ;C28F53|1A      |      ;
STA.W $1C87,Y                        ;C28F54|99871C  |811C87;
LDA.L $7E2000,X                      ;C28F57|BF00207E|7E2000;
AND.W $035C                          ;C28F5B|2D5C03  |81035C;
ORA.W $036A                          ;C28F5E|0D6A03  |81036A;
STA.W $1C7D,Y                        ;C28F61|997D1C  |811C7D;
LDA.L $7E2002,X                      ;C28F64|BF02207E|7E2002;
AND.W $035C                          ;C28F68|2D5C03  |81035C;
ORA.W $036A                          ;C28F6B|0D6A03  |81036A;
STA.W $1C81,Y                        ;C28F6E|99811C  |811C81;
LDA.L $7E2004,X                      ;C28F71|BF04207E|7E2004;
AND.W $035C                          ;C28F75|2D5C03  |81035C;
ORA.W $036A                          ;C28F78|0D6A03  |81036A;
STA.W $1C85,Y                        ;C28F7B|99851C  |811C85;
LDA.L $7E2006,X                      ;C28F7E|BF06207E|7E2006;
AND.W $035C                          ;C28F82|2D5C03  |81035C;
ORA.W $036A                          ;C28F85|0D6A03  |81036A;
STA.W $1C89,Y                        ;C28F88|99891C  |811C89;
PLX                                  ;C28F8B|FA      |      ;
TYA                                  ;C28F8C|98      |      ;
CLC                                  ;C28F8D|18      |      ;
ADC.W #$0010                         ;C28F8E|691000  |      ;
TAY                                  ;C28F91|A8      |      ;
INX                                  ;C28F92|E8      |      ;
DEC.B $0C                            ;C28F93|C60C    |00000C;
BNE CODE_C28F1F                      ;C28F95|D088    |C28F1F;
LDA.W #$0000                         ;C28F97|A90000  |      ;
STA.W $1C7B,Y                        ;C28F9A|997B1C  |811C7B;
INC.W $1C75                          ;C28F9D|EE751C  |811C75;
LDA.W $1C75                          ;C28FA0|AD751C  |811C75;
CMP.W #$0024                         ;C28FA3|C92400  |      ;
BCC CODE_C28FAB                      ;C28FA6|9003    |C28FAB;
STZ.W $1C75                          ;C28FA8|9C751C  |811C75;

CODE_C28FAB:
PLP                                  ;C28FAB|28      |      ;
RTL                                  ;C28FAC|6B      |      ;
db $08,$C2,$20,$A0,$00,$00,$AD,$3A   ;C28FAD|        |      ;
db $03,$29,$F0,$FF,$8D,$77,$1C,$AD   ;C28FB5|        |000029;
db $3C,$03,$29,$F0,$FF,$8D,$79,$1C   ;C28FBD|        |002903;
db $AD,$75,$1C,$3A,$0A,$0A,$0A,$0A   ;C28FC5|        |001C75;
db $0A,$AA,$A9,$10,$00,$85,$0C,$BF   ;C28FCD|        |      ;
db $3A,$F4,$82,$29,$FF,$00,$0A,$0A   ;C28FD5|        |      ;
db $0A,$0A,$18,$6D,$77,$1C,$85,$16   ;C28FDD|        |      ;
db $BF,$4A,$F4,$82,$29,$FF,$00,$0A   ;C28FE5|        |82F44A;
db $0A,$0A,$0A,$18,$6D,$79,$1C,$85   ;C28FED|        |      ;
db $18,$DA,$20,$C6,$90,$99,$7B,$1C   ;C28FF5|        |      ;
db $1A,$99,$7F,$1C,$18,$69,$1F,$00   ;C28FFD|        |      ;
db $99,$83,$1C,$1A,$99,$87,$1C,$BF   ;C29005|        |001C83;
db $00,$28,$7E,$2D,$60,$03,$0D,$6E   ;C2900D|        |      ;
db $03,$99,$7D,$1C,$BF,$02,$28,$7E   ;C29015|        |000099;
db $2D,$60,$03,$0D,$6E,$03,$99,$81   ;C2901D|        |000360;
db $1C,$BF,$04,$28,$7E,$2D,$60,$03   ;C29025|        |0004BF;
db $0D,$6E,$03,$99,$85,$1C,$BF,$06   ;C2902D|        |00036E;
db $28,$7E,$2D,$60,$03,$0D,$6E,$03   ;C29035|        |      ;
db $99,$89,$1C,$FA,$98,$18,$69,$10   ;C2903D|        |001C89;
db $00,$A8,$E8,$C6,$0C,$D0,$88,$A9   ;C29045|        |      ;
db $00,$00,$99,$7B,$1C,$EE,$75,$1C   ;C2904D|        |      ;
db $AD,$75,$1C,$C9,$24,$00,$90,$03   ;C29055|        |001C75;
db $9C,$75,$1C,$28,$6B               ;C2905D|        |001C75;

CODE_C29062:
LDA.B $18                            ;C29062|A518    |000018;
PHA                                  ;C29064|48      |      ;
SEP #$20                             ;C29065|E220    |      ;
LDA.W $0343                          ;C29067|AD4303  |810343;
JSL.L multiply                    ;C2906A|22D1B182|82B1D1;
STA.B $02,S                          ;C2906E|8302    |000002;
LDA.B $16                            ;C29070|A516    |000016;
LSR A                                ;C29072|4A      |      ;
LSR A                                ;C29073|4A      |      ;
LSR A                                ;C29074|4A      |      ;
LSR A                                ;C29075|4A      |      ;
AND.B #$0F                           ;C29076|290F    |      ;
CLC                                  ;C29078|18      |      ;
ADC.B $01,S                          ;C29079|6301    |000001;
STA.B $01,S                          ;C2907B|8301    |000001;
LDA.B $17                            ;C2907D|A517    |000017;
CLC                                  ;C2907F|18      |      ;
ADC.B $02,S                          ;C29080|6302    |000002;
STA.B $02,S                          ;C29082|8302    |000002;
REP #$20                             ;C29084|C220    |      ;
PLX                                  ;C29086|FA      |      ;
LDA.L tilemap,X                      ;C29087|BF00807E|7E8000;
AND.W #$00FF                         ;C2908B|29FF00  |      ;
ASL A                                ;C2908E|0A      |      ;
ASL A                                ;C2908F|0A      |      ;
ASL A                                ;C29090|0A      |      ;
TAX                                  ;C29091|AA      |      ;
LDA.B $18                            ;C29092|A518    |000018;
AND.W #$00F8                         ;C29094|29F800  |      ;
ASL A                                ;C29097|0A      |      ;
ASL A                                ;C29098|0A      |      ;
PHA                                  ;C29099|48      |      ;
LDA.B $16                            ;C2909A|A516    |000016;
AND.W #$00F8                         ;C2909C|29F800  |      ;
LSR A                                ;C2909F|4A      |      ;
LSR A                                ;C290A0|4A      |      ;
LSR A                                ;C290A1|4A      |      ;
CLC                                  ;C290A2|18      |      ;
ADC.B $01,S                          ;C290A3|6301    |000001;
STA.B $01,S                          ;C290A5|8301    |000001;
LDA.B $16                            ;C290A7|A516    |000016;
AND.W #$0100                         ;C290A9|290001  |      ;
ASL A                                ;C290AC|0A      |      ;
ASL A                                ;C290AD|0A      |      ;
CLC                                  ;C290AE|18      |      ;
ADC.B $01,S                          ;C290AF|6301    |000001;
STA.B $01,S                          ;C290B1|8301    |000001;
LDA.B $18                            ;C290B3|A518    |000018;
AND.W #$0100                         ;C290B5|290001  |      ;
ASL A                                ;C290B8|0A      |      ;
ASL A                                ;C290B9|0A      |      ;
ASL A                                ;C290BA|0A      |      ;
CLC                                  ;C290BB|18      |      ;
ADC.B $01,S                          ;C290BC|6301    |000001;
STA.B $01,S                          ;C290BE|8301    |000001;
PLA                                  ;C290C0|68      |      ;
CLC                                  ;C290C1|18      |      ;
ADC.W #$6000                         ;C290C2|690060  |      ;
RTS                                  ;C290C5|60      |      ;
db $A5,$18,$48,$E2,$20,$AD,$43,$03   ;C290C6|        |000018;
db $22,$D1,$B1,$82,$83,$02,$A5,$16   ;C290CE|        |82B1D1;
db $4A,$4A,$4A,$4A,$29,$0F,$18,$63   ;C290D6|        |      ;
db $01,$83,$01,$A5,$17,$18,$63,$02   ;C290DE|        |000083;
db $83,$02,$C2,$20,$FA,$BF,$00,$C0   ;C290E6|        |000002;
db $7E,$29,$FF,$00,$0A,$0A,$0A,$AA   ;C290EE|        |00FF29;
db $A5,$18,$29,$F8,$00,$0A,$0A,$48   ;C290F6|        |000018;
db $A5,$16,$29,$F8,$00,$4A,$4A,$4A   ;C290FE|        |000016;
db $18,$63,$01,$83,$01,$A5,$16,$29   ;C29106|        |      ;
db $00,$01,$0A,$0A,$18,$63,$01,$83   ;C2910E|        |      ;
db $01,$A5,$18,$29,$00,$01,$0A,$0A   ;C29116|        |0000A5;
db $0A,$18,$63,$01,$83,$01,$68,$18   ;C2911E|        |      ;
db $69,$00,$70,$60                   ;C29126|        |      ;

CODE_C2912A:
PHP                                  ;C2912A|08      |      ;
REP #$20                             ;C2912B|C220    |      ;
LDA.W $1C71                          ;C2912D|AD711C  |811C71;
AND.W #$00FF                         ;C29130|29FF00  |      ;
ASL A                                ;C29133|0A      |      ;
ASL A                                ;C29134|0A      |      ;
ASL A                                ;C29135|0A      |      ;
ASL A                                ;C29136|0A      |      ;
STA.B $16                            ;C29137|8516    |000016;
LDA.W $1C72                          ;C29139|AD721C  |811C72;
AND.W #$00FF                         ;C2913C|29FF00  |      ;
ASL A                                ;C2913F|0A      |      ;
ASL A                                ;C29140|0A      |      ;
ASL A                                ;C29141|0A      |      ;
ASL A                                ;C29142|0A      |      ;
STA.B $18                            ;C29143|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C29145|22E08183|8381E0;
STX.W $1C66                          ;C29149|8E661C  |811C66;
STX.W $1C68                          ;C2914C|8E681C  |811C68;
SEP #$20                             ;C2914F|E220    |      ;
SEP #$20                             ;C29151|E220    |      ;
LDA.W $0343                          ;C29153|AD4303  |810343;
XBA                                  ;C29156|EB      |      ;
LDA.W $0345                          ;C29157|AD4503  |810345;
JSL.L multiply                    ;C2915A|22D1B182|82B1D1;
XBA                                  ;C2915E|EB      |      ;
LDA.W $1C6E                          ;C2915F|AD6E1C  |811C6E;
JSL.L multiply                    ;C29162|22D1B182|82B1D1;
STA.W $1C65                          ;C29166|8D651C  |811C65;
XBA                                  ;C29169|EB      |      ;
STA.W $1C64                          ;C2916A|8D641C  |811C64;
LDA.W $1C74                          ;C2916D|AD741C  |811C74;
CMP.B #$80                           ;C29170|C980    |      ;

CODE_C29172:
BCS CODE_C29172                      ;C29172|B0FE    |C29172;
STA.B $10                            ;C29174|8510    |000010;

CODE_C29176:
LDA.W $1C73                          ;C29176|AD731C  |811C73;
CMP.B #$80                           ;C29179|C980    |      ;

CODE_C2917B:
BCS CODE_C2917B                      ;C2917B|B0FE    |C2917B;
STA.B $0E                            ;C2917D|850E    |00000E;

CODE_C2917F:
REP #$20                             ;C2917F|C220    |      ;
LDA.W $1C66                          ;C29181|AD661C  |811C66;
CLC                                  ;C29184|18      |      ;
ADC.W $1C64                          ;C29185|6D641C  |811C64;
TAX                                  ;C29188|AA      |      ;
SEP #$20                             ;C29189|E220    |      ;
LDA.L tilemap,X                      ;C2918B|BF00807E|7E8000;
PHA                                  ;C2918F|48      |      ;
LDA.L passable_map,X                      ;C29190|BF00807F|7F8000;
PHA                                  ;C29194|48      |      ;
LDX.W $1C66                          ;C29195|AE661C  |811C66;
LDA.L passable_map,X                      ;C29198|BF00807F|7F8000;
AND.B #$F0                           ;C2919C|29F0    |      ;
ORA.B $01,S                          ;C2919E|0301    |000001;
STA.L passable_map,X                      ;C291A0|9F00807F|7F8000;
PLA                                  ;C291A4|68      |      ;
PLA                                  ;C291A5|68      |      ;
STA.L tilemap,X                      ;C291A6|9F00807E|7E8000;
LDX.W $1C66                          ;C291AA|AE661C  |811C66;
JSL.L CODE_C38242                    ;C291AD|22428283|838242;
STX.W $1C66                          ;C291B1|8E661C  |811C66;
DEC.B $0E                            ;C291B4|C60E    |00000E;
BNE CODE_C2917F                      ;C291B6|D0C7    |C2917F;
LDX.W $1C68                          ;C291B8|AE681C  |811C68;
JSL.L CODE_C38259                    ;C291BB|22598283|838259;
STX.W $1C68                          ;C291BF|8E681C  |811C68;
STX.W $1C66                          ;C291C2|8E661C  |811C66;
DEC.B $10                            ;C291C5|C610    |000010;
BNE CODE_C29176                      ;C291C7|D0AD    |C29176;
PLP                                  ;C291C9|28      |      ;
RTS                                  ;C291CA|60      |      ;

CODE_C291CB:
PHP                                  ;C291CB|08      |      ;
REP #$20                             ;C291CC|C220    |      ;
JSL.L ConvPosToArrayIdx                    ;C291CE|22E08183|8381E0;
STX.W $1C62                          ;C291D2|8E621C  |811C62;
STX.W $1C64                          ;C291D5|8E641C  |811C64;
LDA.W $1C71                          ;C291D8|AD711C  |811C71;
AND.W #$00FF                         ;C291DB|29FF00  |      ;
ASL A                                ;C291DE|0A      |      ;
ASL A                                ;C291DF|0A      |      ;
ASL A                                ;C291E0|0A      |      ;
ASL A                                ;C291E1|0A      |      ;
STA.B $16                            ;C291E2|8516    |000016;
LDA.W $1C72                          ;C291E4|AD721C  |811C72;
AND.W #$00FF                         ;C291E7|29FF00  |      ;
ASL A                                ;C291EA|0A      |      ;
ASL A                                ;C291EB|0A      |      ;
ASL A                                ;C291EC|0A      |      ;
ASL A                                ;C291ED|0A      |      ;
STA.B $18                            ;C291EE|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C291F0|22E08183|8381E0;
STX.W $1C66                          ;C291F4|8E661C  |811C66;
STX.W $1C68                          ;C291F7|8E681C  |811C68;
SEP #$20                             ;C291FA|E220    |      ;
LDA.W $1C74                          ;C291FC|AD741C  |811C74;
CMP.B #$80                           ;C291FF|C980    |      ;

CODE_C29201:
BCS CODE_C29201                      ;C29201|B0FE    |C29201;
STA.B $10                            ;C29203|8510    |000010;

CODE_C29205:
LDA.W $1C73                          ;C29205|AD731C  |811C73;
CMP.B #$80                           ;C29208|C980    |      ;

CODE_C2920A:
BCS CODE_C2920A                      ;C2920A|B0FE    |C2920A;
STA.B $0E                            ;C2920C|850E    |00000E;

CODE_C2920E:
LDX.W $1C62                          ;C2920E|AE621C  |811C62;
LDA.L tilemap,X                      ;C29211|BF00807E|7E8000;
PHA                                  ;C29215|48      |      ;
LDA.L passable_map,X                      ;C29216|BF00807F|7F8000;
LDX.W $1C66                          ;C2921A|AE661C  |811C66;
STA.L passable_map,X                      ;C2921D|9F00807F|7F8000;
PLA                                  ;C29221|68      |      ;
STA.L tilemap,X                      ;C29222|9F00807E|7E8000;
LDX.W $1C62                          ;C29226|AE621C  |811C62;
JSL.L CODE_C38242                    ;C29229|22428283|838242;
STX.W $1C62                          ;C2922D|8E621C  |811C62;
LDX.W $1C66                          ;C29230|AE661C  |811C66;
JSL.L CODE_C38242                    ;C29233|22428283|838242;
STX.W $1C66                          ;C29237|8E661C  |811C66;
DEC.B $0E                            ;C2923A|C60E    |00000E;
BNE CODE_C2920E                      ;C2923C|D0D0    |C2920E;
LDX.W $1C64                          ;C2923E|AE641C  |811C64;
JSL.L CODE_C38259                    ;C29241|22598283|838259;
STX.W $1C64                          ;C29245|8E641C  |811C64;
STX.W $1C62                          ;C29248|8E621C  |811C62;
LDX.W $1C68                          ;C2924B|AE681C  |811C68;
JSL.L CODE_C38259                    ;C2924E|22598283|838259;
STX.W $1C68                          ;C29252|8E681C  |811C68;
STX.W $1C66                          ;C29255|8E661C  |811C66;
DEC.B $10                            ;C29258|C610    |000010;
BNE CODE_C29205                      ;C2925A|D0A9    |C29205;
PLP                                  ;C2925C|28      |      ;
RTS                                  ;C2925D|60      |      ;

CODE_C2925E:
PHP
REP #$20
JSL.L ConvPosToArrayIdx
STX.W _1C62
STX.W _1C64
LDA.W _1C71
AND.W #$FF
ASL #4
STA.B $16
LDA.W _1C72
AND.W #$FF
ASL #4
STA.B $18
JSL ConvPosToArrayIdx
STX.W _1C66
STX.W _1C68
SEP #$20
LDA.W _1C74
CMP.B #$80
- : BCS - ; WUT? This is a lockup
STA.B $10

.loop:
LDA.W _1C73
CMP.B #$80
- : BCS - ; next lockup
STA.B $0E

.inner_loop:
LDX.W _1C62
LDA.L tilemap, X
PHA
LDA.L passable_map, X
LDX.W _1C66
STA.L passable_map, X
PLA
STA.L tilemap, X
STA.L DATA_7EC000, X
LDX.W _1C62
JSL.L CODE_C38242
STX.W _1C62
LDX.W _1C66
JSL.L CODE_C38242
STX.W _1C66
DEC.B $0E
BNE .inner_loop

LDX.W _1C64
JSL CODE_C38259
STX.W _1C64
STX.W _1C62
LDX.W _1C68
JSL CODE_C38259
STX.W _1C68
STX.W _1C66
DEC.B $10
BNE .loop
PLP
RTS


CODE_C292F5:
LDX.W #$0000                         ;C292F5|A20000  |      ;
TXY                                  ;C292F8|9B      |      ;

CODE_C292F9:
LDA.W $1A9E,Y                        ;C292F9|B99E1A  |811A9E;
INY                                  ;C292FC|C8      |      ;
STA.B $04                            ;C292FD|8504    |000004;
LDA.B #$08                           ;C292FF|A908    |      ;
STA.B $0C                            ;C29301|850C    |00000C;

CODE_C29303:
LDA.W UNREACH_81BA0D,X               ;C29303|BD0DBA  |81BA0D;
BPL CODE_C2930B                      ;C29306|1003    |C2930B;
BRL CODE_C29394                      ;C29308|828900  |C29394;

CODE_C2930B:
LSR.B $04                            ;C2930B|4604    |000004;
BCC CODE_C29380                      ;C2930D|9071    |C29380;
CMP.W current_map_number                          ;C2930F|CD6A1C  |811C6A;
BNE CODE_C29380                      ;C29312|D06C    |C29380;
LDA.W UNREACH_81BA13,X               ;C29314|BD13BA  |81BA13;
ORA.W UNREACH_81BA14,X               ;C29317|1D14BA  |81BA14;
BEQ CODE_C29380                      ;C2931A|F064    |C29380;
PHX                                  ;C2931C|DA      |      ;
PHY                                  ;C2931D|5A      |      ;
LDA.W UNREACH_81BA1B,X               ;C2931E|BD1BBA  |81BA1B;
ORA.W UNREACH_81BA1C,X               ;C29321|1D1CBA  |81BA1C;
BEQ CODE_C29363                      ;C29324|F03D    |C29363;
REP #$20                             ;C29326|C220    |      ;
LDA.W UNREACH_81BA1B,X               ;C29328|BD1BBA  |81BA1B;
AND.W #$00FF                         ;C2932B|29FF00  |      ;
ASL A                                ;C2932E|0A      |      ;
ASL A                                ;C2932F|0A      |      ;
ASL A                                ;C29330|0A      |      ;
ASL A                                ;C29331|0A      |      ;
STA.B $16                            ;C29332|8516    |000016;
LDA.W UNREACH_81BA1C,X               ;C29334|BD1CBA  |81BA1C;
AND.W #$00FF                         ;C29337|29FF00  |      ;
ASL A                                ;C2933A|0A      |      ;
ASL A                                ;C2933B|0A      |      ;
ASL A                                ;C2933C|0A      |      ;
ASL A                                ;C2933D|0A      |      ;
STA.B $18                            ;C2933E|8518    |000018;
LDA.W UNREACH_81BA15,X               ;C29340|BD15BA  |81BA15;
LSR A                                ;C29343|4A      |      ;
PHP                                  ;C29344|08      |      ;
TXA                                  ;C29345|8A      |      ;
CLC                                  ;C29346|18      |      ;
ADC.W #$BA0D                         ;C29347|690DBA  |      ;
TAX                                  ;C2934A|AA      |      ;
LDY.W #$1C6D                         ;C2934B|A06D1C  |      ;
LDA.W #$0007                         ;C2934E|A90700  |      ;
MVN $81,$81                          ;C29351|548181  |      ;
PLP                                  ;C29354|28      |      ;
SEP #$20                             ;C29355|E220    |      ;
BCS UNREACH_C2935E                   ;C29357|B005    |C2935E;
JSR.W CODE_C291CB                    ;C29359|20CB91  |C291CB;
BRA CODE_C2937E                      ;C2935C|8020    |C2937E;

UNREACH_C2935E:
db $20,$5E,$92,$80,$1B               ;C2935E|        |C2925E;

CODE_C29363:
REP #$20                             ;C29363|C220    |      ;
TXA                                  ;C29365|8A      |      ;
CLC                                  ;C29366|18      |      ;
ADC.W #$BA0D                         ;C29367|690DBA  |      ;
TAX                                  ;C2936A|AA      |      ;
LDY.W #$1C6D                         ;C2936B|A06D1C  |      ;
LDA.W #$0007                         ;C2936E|A90700  |      ;
MVN $81,$81                          ;C29371|548181  |      ;
SEP #$20                             ;C29374|E220    |      ;
LDA.B #$03                           ;C29376|A903    |      ;
STA.W $1C6E                          ;C29378|8D6E1C  |811C6E;
JSR.W CODE_C2912A                    ;C2937B|202A91  |C2912A;

CODE_C2937E:
PLY                                  ;C2937E|7A      |      ;
PLX                                  ;C2937F|FA      |      ;

CODE_C29380:
REP #$20                             ;C29380|C220    |      ;
TXA                                  ;C29382|8A      |      ;
CLC                                  ;C29383|18      |      ;
ADC.W #$0020                         ;C29384|692000  |      ;
TAX                                  ;C29387|AA      |      ;
SEP #$20                             ;C29388|E220    |      ;
DEC.B $0C                            ;C2938A|C60C    |00000C;
BEQ CODE_C29391                      ;C2938C|F003    |C29391;
BRL CODE_C29303                      ;C2938E|8272FF  |C29303;

CODE_C29391:
BRL CODE_C292F9                      ;C29391|8265FF  |C292F9;

CODE_C29394:
RTL                                  ;C29394|6B      |      ;

CODE_C29395:
LDX.W #$01FF                         ;C29395|A2FF01  |      ;

CODE_C29398:
LDA.L lair_spawn,X                      ;C29398|BF03027F|7F0203;
BPL CODE_C293A1                      ;C2939C|1003    |C293A1;
ASL A                                ;C2939E|0A      |      ;
BMI CODE_C293A5                      ;C2939F|3004    |C293A5;

CODE_C293A1:
DEX                                  ;C293A1|CA      |      ;
BPL CODE_C29398                      ;C293A2|10F4    |C29398;
RTL                                  ;C293A4|6B      |      ;

CODE_C293A5:
REP #$20                             ;C293A5|C220    |      ;
PHX                                  ;C293A7|DA      |      ;
TXA                                  ;C293A8|8A      |      ;
ASL A                                ;C293A9|0A      |      ;
ASL A                                ;C293AA|0A      |      ;
ASL A                                ;C293AB|0A      |      ;
ASL A                                ;C293AC|0A      |      ;
ASL A                                ;C293AD|0A      |      ;
TAX                                  ;C293AE|AA      |      ;
TAY                                  ;C293AF|A8      |      ;
SEP #$20                             ;C293B0|E220    |      ;
LDA.W UNREACH_81BA0D,X               ;C293B2|BD0DBA  |81BA0D;
CMP.W current_map_number                          ;C293B5|CD6A1C  |811C6A;
BEQ CODE_C293BD                      ;C293B8|F003    |C293BD;
db $82,$84,$00                       ;C293BA|        |C29441;

CODE_C293BD:
LDY.W UNREACH_81BA2B,X               ;C293BD|BC2BBA  |81BA2B;
BEQ CODE_C293D2                      ;C293C0|F010    |C293D2;
LDA.W UNREACH_81BA2C,X               ;C293C2|BD2CBA  |81BA2C;
XBA                                  ;C293C5|EB      |      ;
LDA.W UNREACH_81BA2B,X               ;C293C6|BD2BBA  |81BA2B;
LDY.W #$1ADE                         ;C293C9|A0DE1A  |      ;
JSL.L checkIfBitIsSet                    ;C293CC|22CA8283|8382CA;
BCC CODE_C29441                      ;C293D0|906F    |C29441;

CODE_C293D2:
TXY                                  ;C293D2|9B      |      ;
REP #$20                             ;C293D3|C220    |      ;
LDA.W UNREACH_81BA0F,X               ;C293D5|BD0FBA  |81BA0F;
AND.W #$00FF                         ;C293D8|29FF00  |      ;
ASL A                                ;C293DB|0A      |      ;
ASL A                                ;C293DC|0A      |      ;
ASL A                                ;C293DD|0A      |      ;
ASL A                                ;C293DE|0A      |      ;
STA.B $16                            ;C293DF|8516    |000016;
LDA.W UNREACH_81BA10,X               ;C293E1|BD10BA  |81BA10;
AND.W #$00FF                         ;C293E4|29FF00  |      ;
ASL A                                ;C293E7|0A      |      ;
ASL A                                ;C293E8|0A      |      ;
ASL A                                ;C293E9|0A      |      ;
ASL A                                ;C293EA|0A      |      ;
STA.B $18                            ;C293EB|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C293ED|22E08183|8381E0;
SEP #$20                             ;C293F1|E220    |      ;
LDA.W UNREACH_81BA13,Y               ;C293F3|B913BA  |81BA13;
ORA.W UNREACH_81BA14,Y               ;C293F6|1914BA  |81BA14;
BNE CODE_C2943B                      ;C293F9|D040    |C2943B;
LDA.W $0343                          ;C293FB|AD4303  |810343;
XBA                                  ;C293FE|EB      |      ;
LDA.W $0345                          ;C293FF|AD4503  |810345;
JSL.L multiply                    ;C29402|22D1B182|82B1D1;
STA.B $01                            ;C29406|8501    |000001;
STZ.B $00                            ;C29408|6400    |000000;
XBA                                  ;C2940A|EB      |      ;
LDA.W UNREACH_81BA0E,Y               ;C2940B|B90EBA  |81BA0E;
BEQ CODE_C29421                      ;C2940E|F011    |C29421;
JSL.L multiply                    ;C29410|22D1B182|82B1D1;
REP #$20                             ;C29414|C220    |      ;
PHX                                  ;C29416|DA      |      ;
XBA                                  ;C29417|EB      |      ;
CLC                                  ;C29418|18      |      ;
ADC.B $01,S                          ;C29419|6301    |000001;
TAX                                  ;C2941B|AA      |      ;
PLA                                  ;C2941C|68      |      ;
SEP #$20                             ;C2941D|E220    |      ;
BRA CODE_C2943B                      ;C2941F|801A    |C2943B;

CODE_C29421:
LDY.W #$0003                         ;C29421|A00300  |      ;

CODE_C29424:
LDA.B #$01                           ;C29424|A901    |      ;
STA.L passable_map,X                      ;C29426|9F00807F|7F8000;
REP #$20                             ;C2942A|C220    |      ;
TXA                                  ;C2942C|8A      |      ;
CLC                                  ;C2942D|18      |      ;
ADC.B $00                            ;C2942E|6500    |000000;
TAX                                  ;C29430|AA      |      ;
SEP #$20                             ;C29431|E220    |      ;
CPX.W #$4000                         ;C29433|E00040  |      ;
BCS CODE_C29441                      ;C29436|B009    |C29441;
DEY                                  ;C29438|88      |      ;
BNE CODE_C29424                      ;C29439|D0E9    |C29424;

CODE_C2943B:
LDA.B #$01                           ;C2943B|A901    |      ;
STA.L passable_map,X                      ;C2943D|9F00807F|7F8000;

CODE_C29441:
PLX                                  ;C29441|FA      |      ;
BRL CODE_C293A1                      ;C29442|825CFF  |C293A1;

CODE_C29445:
LDX.W #$0000                         ;C29445|A20000  |      ;
STZ.W $03AA                          ;C29448|9CAA03  |8103AA;
REP #$20                             ;C2944B|C220    |      ;
LDA.W current_map_number                          ;C2944D|AD6A1C  |811C6A;
ASL A                                ;C29450|0A      |      ;
ASL A                                ;C29451|0A      |      ;
TAX                                  ;C29452|AA      |      ;
STX.W $03AC                          ;C29453|8EAC03  |8103AC;
LDA.W LUT_C1B69A,X               ;C29456|BD9AB6  |81B69A;
SEC                                  ;C29459|38      |      ;
SBC.W #$B69A                         ;C2945A|E99AB6  |      ;
STA.W $03AE                          ;C2945D|8DAE03  |8103AE;
TAX                                  ;C29460|AA      |      ;
SEP #$20                             ;C29461|E220    |      ;

.loop:
LDA.W LUT_C1B69A,X               ;C29463|BD9AB6  |81B69A;
CMP.B #$FF                           ;C29466|C9FF    |      ;
BEQ .ret                      ;C29468|F024    |C2948E;
CMP.W PlayerPosInt.x                          ;C2946A|CD7803  |810378;
BNE .next                      ;C2946D|D018    |C29487;
LDA.W UNREACH_81B69B,X               ;C2946F|BD9BB6  |81B69B;
CMP.W PlayerPosInt.y                          ;C29472|CD7A03  |81037A;
BNE .next                      ;C29475|D010    |C29487;
LDA.W UNREACH_81B69D,X               ;C29477|BD9DB6  |81B69D;
XBA                                  ;C2947A|EB      |      ;
LDA.W UNREACH_81B69C,X               ;C2947B|BD9CB6  |81B69C;
LDY.W #$1A9E                         ;C2947E|A09E1A  |      ;
JSL.L checkIfBitIsSet                    ;C29481|22CA8283|8382CA;
BCS .copy                      ;C29485|B008    |C2948F;

.next:
INX                                  ;C29487|E8      |      ;
INX                                  ;C29488|E8      |      ;
INX                                  ;C29489|E8      |      ;
INX                                  ;C2948A|E8      |      ;
BRL .loop                      ;C2948B|82D5FF  |C29463;

.ret:
RTL                                  ;C2948E|6B      |      ;

.copy:
REP #$20                             ;C2948F|C220    |      ;
LDA.W UNREACH_81B69C,X               ;C29491|BD9CB6  |81B69C;
ASL A                                ;C29494|0A      |      ;
ASL A                                ;C29495|0A      |      ;
ASL A                                ;C29496|0A      |      ;
ASL A                                ;C29497|0A      |      ;
ASL A                                ;C29498|0A      |      ;
CLC                                  ;C29499|18      |      ;
ADC.W #$BA0D                         ;C2949A|690DBA  |      ;
TAX                                  ;C2949D|AA      |      ;
LDY.W #$1C6D                         ;C2949E|A06D1C  |      ;
LDA.W #$0007                         ;C294A1|A90700  |      ;
MVN $81,$81                          ;C294A4|548181  |      ;
SEP #$20                             ;C294A7|E220    |      ;
LDA.B #$02                           ;C294A9|A902    |      ;
STA.W $1C6E                          ;C294AB|8D6E1C  |811C6E;
JSR.W CODE_C2912A                    ;C294AE|202A91  |C2912A;
REP #$20                             ;C294B1|C220    |      ;
LDX.W $03AC                          ;C294B3|AEAC03  |8103AC;
LDA.W $03AA                          ;C294B6|ADAA03  |8103AA;
EOR.W #$0001                         ;C294B9|490100  |      ;
STA.W $03AA                          ;C294BC|8DAA03  |8103AA;
BEQ CODE_C294C3                      ;C294BF|F002    |C294C3;
INX                                  ;C294C1|E8      |      ;
INX                                  ;C294C2|E8      |      ;

CODE_C294C3:
LDA.W LUT_C1B69A,X               ;C294C3|BD9AB6  |81B69A;
SEC                                  ;C294C6|38      |      ;
SBC.W #$B69A                         ;C294C7|E99AB6  |      ;
STA.W $03AE                          ;C294CA|8DAE03  |8103AE;
SEP #$20                             ;C294CD|E220    |      ;
RTL                                  ;C294CF|6B      |      ;

CODE_C294D0:
REP #$20                             ;C294D0|C220    |      ;
LDA.W current_map_number                          ;C294D2|AD6A1C  |811C6A;
ASL A                                ;C294D5|0A      |      ;
TAX                                  ;C294D6|AA      |      ;
LDA.W LUT_C1AC96,X               ;C294D7|BD96AC  |81AC96;
SEC                                  ;C294DA|38      |      ;
SBC.W #$AC96                         ;C294DB|E996AC  |      ;
STA.W $03B4                          ;C294DE|8DB403  |8103B4;
SEP #$20                             ;C294E1|E220    |      ;
RTL                                  ;C294E3|6B      |      ;

CODE_C294E4:
REP #$20                             ;C294E4|C220    |      ;
LDA.W current_map_number                          ;C294E6|AD6A1C  |811C6A;
ASL A                                ;C294E9|0A      |      ;
TAX                                  ;C294EA|AA      |      ;
LDA.W LUT_C1A9DE,X               ;C294EB|BDDEA9  |81A9DE;
SEC                                  ;C294EE|38      |      ;
SBC.W #$A9DE                         ;C294EF|E9DEA9  |      ;
STA.W $03B0                          ;C294F2|8DB003  |8103B0;
SEP #$20                             ;C294F5|E220    |      ;
LDX.W $03B0                          ;C294F7|AEB003  |8103B0;

.outer_loop:
LDA.W LUT_C1A9DE,X               ;C294FA|BDDEA9  |81A9DE;
CMP.B #$FF                           ;C294FD|C9FF    |      ;
BEQ .ret                      ;C294FF|F07C    |C2957D;
LDA.B #$00                           ;C29501|A900    |      ;
XBA                                  ;C29503|EB      |      ;
LDA.W UNREACH_81A9E0,X               ;C29504|BDE0A9  |81A9E0;
AND.B #$7F                           ;C29507|297F    |      ;
LDY.W #$1A7E                         ;C29509|A07E1A  |      ;
JSL.L checkIfBitIsSet                    ;C2950C|22CA8283|8382CA;
BCC .next                      ;C29510|905E    |C29570;
PHX                                  ;C29512|DA      |      ;
LDA.W UNREACH_81A9E0,X               ;C29513|BDE0A9  |81A9E0;
STA.B $02                            ;C29516|8502    |000002;
REP #$20                             ;C29518|C220    |      ;
LDA.W LUT_C1A9DE,X               ;C2951A|BDDEA9  |81A9DE;
AND.W #$00FF                         ;C2951D|29FF00  |      ;
ASL A                                ;C29520|0A      |      ;
ASL A                                ;C29521|0A      |      ;
ASL A                                ;C29522|0A      |      ;
ASL A                                ;C29523|0A      |      ;
STA.B $16                            ;C29524|8516    |000016;
LDA.W UNREACH_81A9DF,X               ;C29526|BDDFA9  |81A9DF;
AND.W #$00FF                         ;C29529|29FF00  |      ;
DEC A                                ;C2952C|3A      |      ;
ASL A                                ;C2952D|0A      |      ;
ASL A                                ;C2952E|0A      |      ;
ASL A                                ;C2952F|0A      |      ;
ASL A                                ;C29530|0A      |      ;
STA.B $18                            ;C29531|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C29533|22E08183|8381E0;
SEP #$20                             ;C29537|E220    |      ;
LDA.W $0343                          ;C29539|AD4303  |810343;
XBA                                  ;C2953C|EB      |      ;
LDA.W $0345                          ;C2953D|AD4503  |810345;
JSL.L multiply                    ;C29540|22D1B182|82B1D1;
STA.B $01                            ;C29544|8501    |000001;
XBA                                  ;C29546|EB      |      ;
STA.B $00                            ;C29547|8500    |000000;

.inner_loop:
LDA.L tilemap,X                      ;C29549|BF00807E|7E8000;
CMP.B #$FB                           ;C2954D|C9FB    |      ;
BNE +                      ;C2954F|D010    |C29561;
LDA.B #$FC                           ;C29551|A9FC    |      ;
STA.L tilemap,X                      ;C29553|9F00807E|7E8000;
LDA.B $02                            ;C29557|A502    |000002;
BPL +                      ;C29559|1006    |C29561;
LDA.B #$FC
STA.L DATA_7EC000, X

+:
REP #$20                             ;C29561|C220    |      ;
TXA                                  ;C29563|8A      |      ;
CLC                                  ;C29564|18      |      ;
ADC.B $00                            ;C29565|6500    |000000;
TAX                                  ;C29567|AA      |      ;
CPX.W #$4000                         ;C29568|E00040  |      ;
SEP #$20                             ;C2956B|E220    |      ;
BCC .inner_loop                      ;C2956D|90DA    |C29549;
PLX                                  ;C2956F|FA      |      ;

.next:
REP #$20                             ;C29570|C220    |      ;
TXA                                  ;C29572|8A      |      ;
CLC                                  ;C29573|18      |      ;
ADC.W #$0006                         ;C29574|690600  |      ;
TAX                                  ;C29577|AA      |      ;
SEP #$20                             ;C29578|E220    |      ;
BRL .outer_loop                      ;C2957A|827DFF  |C294FA;

.ret:
RTL                                  ;C2957D|6B      |      ;

CODE_C2957E:
    LDX.W #0
    TXY
    STZ.W remaining_lair

.count_loop:
    LDA.W LairDataStructure, Y
    CMP.B #$FF ; $FF is the endmarker for that table
    BEQ .ret
    LDA.W LairDataStructure.lair_map_number, Y
    CMP.W current_map_number
    BNE .next_lair
    INC.W remaining_lair
    LDA.L lair_spawn, X
    BMI .handle_cleared_lair
    BEQ .handle_cleared_lair
    JSL.L CODE_C0947B

.next_lair:
    REP #$20
    ; increase Y by `objectsize(LairDataStructure)` ($20)
    TYA
    CLC
    ADC.W #objectsize(LairDataStructure)
    TAY
    SEP #$20
    ; increase X by one
    INX
    BRA .count_loop

.ret:
    RTL

.handle_cleared_lair:
    PHX
    PHY
    PHP
    REP #$20
    ; convert lair short x pos to a long position
    LDA.W LairDataStructure.lair_pos_x, Y
    AND.W #$FF
    ASL #4
    STA.B $16
    ; convert lair short y pos to a long position
    LDA.W LairDataStructure.lair_pos_y, Y
    AND.W #$FF
    ASL #4
    STA.B $18
    JSL.L ConvPosToArrayIdx
    SEP #$20
    LDA.B #$FE
    PLP
    BPL + ; highest bit is not set, so it's open
    LDA.B #!TM_SealedLair
    DEC.W remaining_lair

+:
    STA.L tilemap, X
    XBA
    LDA.W LairDataStructure.field_08, Y
    BEQ +
    XBA
    STA.L DATA_7EC000, X

+:
    PLY
    PLX
    BRA .next_lair

CODE_C295F1:
    LDX.W #0
    TXY

.loop:
    LDA.L UNREACH_82F89A, X
    CMP.B #$FF ; end marker
    BEQ .ret

CMP.W current_map_number                          ;C295FD|CD6A1C  |811C6A;
BNE .CODE_C29614                      ;C29600|D012    |C29614;
LDA.L UNREACH_82F89C,X               ;C29602|BF9CF882|82F89C;
XBA                                  ;C29606|EB      |      ;
LDA.L UNREACH_82F89B,X               ;C29607|BF9BF882|82F89B;
LDY.W #$1A5E                         ;C2960B|A05E1A  |      ;
JSL.L checkIfBitIsSet                    ;C2960E|22CA8283|8382CA;
BCS .CODE_C29621                      ;C29612|B00D    |C29621;

.CODE_C29614:
REP #$20                             ;C29614|C220    |      ;
TXA                                  ;C29616|8A      |      ;
CLC                                  ;C29617|18      |      ;
ADC.W #$0009                         ;C29618|690900  |      ;
TAX                                  ;C2961B|AA      |      ;
SEP #$20                             ;C2961C|E220    |      ;
BRA .loop                      ;C2961E|80D5    |C295F5;

.ret:
    RTL

.CODE_C29621:
PHX                                  ;C29621|DA      |      ;
LDA.L UNREACH_82F89D,X               ;C29622|BF9DF882|82F89D;
STA.W $1C71                          ;C29626|8D711C  |811C71;
LDA.L UNREACH_82F89E,X               ;C29629|BF9EF882|82F89E;
STA.W $1C72                          ;C2962D|8D721C  |811C72;
LDA.L UNREACH_82F89F,X               ;C29630|BF9FF882|82F89F;
STA.W $1C73                          ;C29634|8D731C  |811C73;
LDA.L UNREACH_82F8A0,X               ;C29637|BFA0F882|82F8A0;
STA.W $1C74                          ;C2963B|8D741C  |811C74;
REP #$20                             ;C2963E|C220    |      ;
LDA.L UNREACH_82F8A1,X               ;C29640|BFA1F882|82F8A1;
AND.W #$00FF                         ;C29644|29FF00  |      ;
ASL A                                ;C29647|0A      |      ;
ASL A                                ;C29648|0A      |      ;
ASL A                                ;C29649|0A      |      ;
ASL A                                ;C2964A|0A      |      ;
STA.B $16                            ;C2964B|8516    |000016;
LDA.L UNREACH_82F8A2,X               ;C2964D|BFA2F882|82F8A2;
AND.W #$00FF                         ;C29651|29FF00  |      ;
ASL A                                ;C29654|0A      |      ;
ASL A                                ;C29655|0A      |      ;
ASL A                                ;C29656|0A      |      ;
ASL A                                ;C29657|0A      |      ;
STA.B $18                            ;C29658|8518    |000018;
JSR.W CODE_C291CB                    ;C2965A|20CB91  |C291CB;
SEP #$20                             ;C2965D|E220    |      ;
PLX                                  ;C2965F|FA      |      ;
BRA .CODE_C29614                      ;C29660|80B2    |C29614;

CODE_C29662:
PHX                                  ;C29662|DA      |      ;
PHY                                  ;C29663|5A      |      ;
LDX.W #$0000                         ;C29664|A20000  |      ;

.CODE_C29667:
LDA.W UNREACH_81F99A,X               ;C29667|BD9AF9  |81F99A;
BMI .CODE_C29691                      ;C2966A|3025    |C29691;
CMP.W current_map_number                          ;C2966C|CD6A1C  |811C6A;
BNE .CODE_C2968B                      ;C2966F|D01A    |C2968B;
LDA.W UNREACH_81F99C,X               ;C29671|BD9CF9  |81F99C;
XBA                                  ;C29674|EB      |      ;
LDA.W UNREACH_81F99B,X               ;C29675|BD9BF9  |81F99B;
LDY.W #$1ADE                         ;C29678|A0DE1A  |      ;
JSL.L checkIfBitIsSet                    ;C2967B|22CA8283|8382CA;
BCC .CODE_C2968B                      ;C2967F|900A    |C2968B;
LDA.W UNREACH_81F99D,X               ;C29681|BD9DF9  |81F99D;
STA.W $031E                          ;C29684|8D1E03  |81031E;
SEC                                  ;C29687|38      |      ;
PLY                                  ;C29688|7A      |      ;
PLX                                  ;C29689|FA      |      ;
RTL                                  ;C2968A|6B      |      ;

.CODE_C2968B:
INX                                  ;C2968B|E8      |      ;
INX                                  ;C2968C|E8      |      ;
INX                                  ;C2968D|E8      |      ;
INX                                  ;C2968E|E8      |      ;
BRA .CODE_C29667                      ;C2968F|80D6    |C29667;

.CODE_C29691:
CLC                                  ;C29691|18      |      ;
PLY                                  ;C29692|7A      |      ;
PLX                                  ;C29693|FA      |      ;
RTL                                  ;C29694|6B      |      ;

CODE_C29695:
LDA.W current_map_number                          ;C29695|AD6A1C  |811C6A;
SEC                                  ;C29698|38      |      ;
SBC.B #$10                           ;C29699|E910    |      ;
CMP.B #$03                           ;C2969B|C903    |      ;
BCS .CODE_C296A0                      ;C2969D|B001    |C296A0;
RTL                                  ;C2969F|6B      |      ;

.CODE_C296A0:
LDA.B #$12                           ;C296A0|A912    |      ;
XBA                                  ;C296A2|EB      |      ;
LDA.B #<:.data                           ;C296A3|A982    |      ;
LDY.W #.data                         ;C296A5|A0AD96  |      ;
JSL.L CODE_C2988F                    ;C296A8|228F9882|82988F;
RTL                                  ;C296AC|6B      |      ;
.data
db $14,$FC,$FF,$0C,$00,$00,$0C,$04   ;C296AD|        |0000FC;
db $00,$01,$03,$00,$01,$02,$00,$01   ;C296B5|        |      ;
db $01,$00,$01,$00,$00,$00,$AD,$82   ;C296BD|        |000000;
db $1B,$29,$02,$00,$D0,$01,$6B,$E2   ;C296C5|        |      ;
db $20,$9C,$23,$21,$9C,$24,$21,$A9   ;C296CD|        |C2239C;
db $30,$8D,$25,$21,$A9,$12,$8D,$30   ;C296D5|        |C29664;
db $21,$C2,$20,$80,$7B,$AD,$82,$1B   ;C296DD|        |0000C2;
db $29,$10,$00,$D0,$01,$6B,$E2,$20   ;C296E5|        |      ;
db $A9,$20,$8D,$23,$21,$8D,$C5,$03   ;C296ED|        |      ;
db $9C,$24,$21,$9C,$25,$21,$A9,$01   ;C296F5|        |002124;
db $8D,$8A,$03,$8D,$8C,$03,$C2,$20   ;C296FD|        |00038A;
db $80,$56,$AD,$82,$1B,$29,$08,$00   ;C29705|        |C2975D;
db $D0,$01,$6B,$E2,$20,$A9,$20,$8D   ;C2970D|        |C29710;
db $23,$21,$8D,$C5,$03,$9C,$24,$21   ;C29715|        |000021;
db $A9,$01,$8D,$25,$21,$A9,$01,$8D   ;C2971D|        |      ;
db $8A,$03,$8D,$8C,$03,$C2,$20,$80   ;C29725|        |      ;
db $2F,$AD,$82,$1B,$29,$04,$00,$D0   ;C2972D|        |1B82AD;
db $01,$6B,$E2,$20,$A9,$33,$8D,$23   ;C29735|        |00006B;
db $21,$8D,$C5,$03,$9C,$24,$21,$9C   ;C2973D|        |00008D;
db $25,$21,$9C,$2E,$21,$A9,$03,$8D   ;C29745|        |000021;
db $2F,$21,$A9,$82,$8D,$30,$21,$C2   ;C2974D|        |82A921;
db $20,$02,$B0,$47,$B1,$80,$10,$20   ;C29755|        |C2B002;
db $02,$91,$DA,$AC,$A2,$03,$B9,$00   ;C2975D|        |      ;
db $00,$38,$ED,$3A,$03,$18,$69,$08   ;C29765|        |      ;
db $00,$30,$0A,$C9,$00,$01,$90,$08   ;C2976D|        |      ;
db $A9,$FF,$00,$80,$03,$A9,$00,$00   ;C29775|        |      ;
db $85,$16,$B9,$02,$00,$38,$ED,$3C   ;C2977D|        |000016;
db $03,$38,$E9,$08,$00,$30,$0A,$C9   ;C29785|        |000038;
db $E0,$00,$90,$08,$A9,$DF,$00,$80   ;C2978D|        |      ;
db $03,$A9,$00,$00,$85,$18,$A2,$00   ;C29795|        |0000A9;
db $00,$9B,$A9,$E0,$00,$85,$0C,$A5   ;C2979D|        |      ;
db $18,$38,$E9,$40,$00,$F0,$44,$10   ;C297A5|        |      ;
db $0C,$49,$FF,$FF,$1A,$C9,$80,$00   ;C297AD|        |00FF49;
db $B0,$6E,$A8,$80,$36,$A8,$38,$E5   ;C297B5|        |C29825;
db $0C,$49,$FF,$FF,$1A,$85,$0C,$98   ;C297BD|        |00FF49;
db $C9,$80,$00,$90,$16,$38,$E9,$7E   ;C297C5|        |      ;
db $00,$A8,$A9,$7E,$FF,$9F,$00,$70   ;C297CD|        |      ;
db $7E,$A9,$7E,$00,$9F,$00,$78,$7E   ;C297D5|        |007EA9;
db $E8,$E8,$98,$9F,$00,$78,$7E,$09   ;C297DD|        |      ;
db $00,$FF,$9F,$00,$70,$7E,$E8,$E8   ;C297E5|        |      ;
db $A0,$00,$00,$E2,$20,$A9,$02,$9F   ;C297ED|        |      ;
db $00,$70,$7E,$9F,$00,$78,$7E,$A5   ;C297F5|        |      ;
db $16,$38,$F9,$C4,$FD,$B0,$02,$A9   ;C297FD|        |000038;
db $00,$9F,$01,$70,$7E,$A5,$16,$18   ;C29805|        |      ;
db $79,$C4,$FD,$90,$02,$A9,$FF,$9F   ;C2980D|        |00FDC4;
db $01,$78,$7E,$E8,$E8,$C8,$C8,$C6   ;C29815|        |000078;
db $0C,$F0,$05,$C0,$80,$00,$90,$CD   ;C2981D|        |0005F0;
db $E2,$20,$A9,$01,$9F,$00,$70,$7E   ;C29825|        |      ;
db $9F,$00,$78,$7E,$A9,$FF,$9F,$01   ;C2982D|        |7E7800;
db $70,$7E,$A9,$00,$9F,$01,$78,$7E   ;C29835|        |C298B5;
db $A9,$00,$9F,$02,$70,$7E,$9F,$02   ;C2983D|        |      ;
db $78,$7E,$A9,$26,$EB,$A9,$7E,$A0   ;C29845|        |      ;
db $00,$70,$22,$8F,$98,$82,$A9,$27   ;C2984D|        |      ;
db $EB,$A9,$7E,$A0,$00,$78,$22,$8F   ;C29855|        |      ;
db $98,$82,$FA,$C2,$20,$6B           ;C2985D|        |      ;

prepare_dma_bank0:
    STZ.B HDMA_channel_enable_bits
    LDA.B #$10
    STA.B HDMA_channel_next_free_slot
    LDA.B #$40
    STA.B HDMA_channel_offset
    LDX.W #$6000
    STX.B $48
    RTL

;; `A` contains the bank
;; `B` contains the target $21xx
;; `Y` contains the address
CODE_C29873:
    PHP
    PHX
    SEP #$20
    PHA
    LDA.B #$00
    XBA
    PHA
    TAX
    LDA.L CODE_C2988F_dma_control_data, X
    LDX.B HDMA_channel_offset
    ORA.B #$40 ; enables pointer-pointer transfer (`a` bit of DMAPx register)
    STA.W DMAP0, X
    LDA.B $02,S ; loads the provided bank from the stack
    STA.W DAS00, X ; store the length for HDMA transfer
    BRA CODE_C2988F_common

;; `A` contains the bank
;; `B` contains the target $21xx
;; `Y` contains the address
CODE_C2988F:
    PHP
    PHX
    SEP #$20
    PHA
    LDA.B #$00
    XBA
    PHA
    TAX
    ; we use X as an index to the array below
    LDA.L .dma_control_data, X
    LDX.B HDMA_channel_offset
    STA.W DMAP0, X

.common:
    ; X now contains an offset for the correct DMA channel
    PLA ; still the target for $21xx
    STA.W BBAD0, X
    REP #$20
    TYA
    STA.W A1T0L, X ; stores the source address into the correct DMA channel
    SEP #$20
    PLA
    STA.W A1B0, X ; stores tha bank
    LDA.B HDMA_channel_next_free_slot
    TSB.B HDMA_channel_enable_bits
    ASL.B HDMA_channel_next_free_slot
    LDA.B HDMA_channel_offset
    ADC.B #$10
    STA.B HDMA_channel_offset
    PLX
    PLP
    RTL

;; dma control data contains the data for the DMAPx register
;; depending on which register you want to access, here are some
;; predefined uses for those, e.g. which direction, transfer mode, ...
.dma_control_data:
db $00,$00,$01,$01,$02,$00,$00,$00   ;C298C1|        |      ;
db $00,$00,$00,$00,$00,$02,$02,$02   ;C298C9|        |      ;
db $02,$02,$02,$02,$02,$00,$01,$01   ;C298D1|        |      ;
db $01,$01,$00,$02,$02,$02,$02,$02   ;C298D9|        |000001;
db $02,$00,$02,$00,$00,$00,$00,$00   ;C298E1|        |      ;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C298E9|        |      ;
db $00,$00,$00,$00,$80,$80,$80,$80   ;C298F1|        |      ;
db $82,$81,$81,$82,$82,$82,$80,$80   ;C298F9|        |C21A7D;

check_buttons:
    LDA.W buttons_pressed8
    BIT.B #!Key8_Select
    BEQ + : BRL open_equipment_menu : +
    BIT.B #!Key8_B
    BEQ + : BRL button_b_pressed : +
    BIT.B #!Key8_All_Directions
    BNE +
    LDA.W buttons_pressed
    BIT.B #!Key16_A
    BNE open_stats_menu
+:
    RTL

open_stats_menu:
    LDA.W player_current_health
    LDX.W #player_current_health_ascii
    JSL.L convert_hex_to_dec

    LDA.W player_max_health
    LDX.W #player_max_health_ascii
    JSL.L convert_hex_to_dec

    LDA.W player_strength_from_level
    PHA
    CMP.B #!WeaponsMaxPoints
    BCC +
    LDA.B #!WeaponsMaxPoints
    STA player_strength_from_level
+:
    LDA.W player_defense_from_level
    PHA
    CMP.B #!ArmorMaxPoints
    BCC +
    LDA.B #!ArmorMaxPoints
    STA.W player_defense_from_level
+:
    LDY.W #txt_stats_menu
    JSL.L printOsdStringFromBank2
    PLA
    STA.W player_defense_from_level
    PLA
    STA.W player_strength_from_level
    %PlaySound(!Sound_MenuBeep)
    JSL.L wait_vblank

; wait for key release
-:
    JSR.W vblank_readButtons_and_count_frames
    BIT.B #!Key16_A
    BNE -
    REP #$20

; wait for key press
-:
    JSR.W vblank_readButtons_and_count_frames
    BIT.W #!Key16_Menu_Keys
    BEQ -

    SEP #$20
    LDY.W #txt_soul_menu
    JSL.L printOsdStringFromBank2
    JSR.W print_soul_names
    REP #$20

; wait for key release
-:
    JSR.W vblank_readButtons_and_count_frames
    BIT.W #!Key16_Menu_Keys
    BNE -

; wait for key press
-:
    JSR.W vblank_readButtons_and_count_frames
    BIT.W #!Key16_Menu_Keys
    BEQ -

    LDA.W #!Key16_A | !Key16_B | !Key16_X | !Key16_Y
    TRB.W _032A
    STZ.W buttons_pressed
    SEP #$20
    %PlaySound(!Sound_MenuBeep)
    JSR.W clearOsd
    LDA.B #!UpdateHud_All
    STA.W display_hud_bitfield
    JSL.L update_hud
    JSR.W vblank_readButtons_and_count_frames
    RTL

vblank_readButtons_and_count_frames:
    JSL.L wait_vblank
    LDX.W _0312
    DEX
    STX.W _0312
    LDA.W buttons_pressed
    RTS

print_soul_names:
    LDA.W player_souls
    LDY.W #osd_soul_names
; A will be checked if the lowest bit is set or not
; Y contains the pointer to a string
.loop:
    LSR
    PHA
    BCC .next_soul
    PHY
    JSL.L printOsdStringFromBank2
    PLY

.next_soul:
    REP #$20
    TYA
    CLC
    ADC.W #25 ; the size of one soul string
    TAY
    SEP #$20
    PLA
    CPY.W #osd_item_menu_end ; check if we checked all souls
    BNE .loop
    RTS


button_b_pressed:
    JSL.L disable_vblank_interrupt                    ;C299DD|22AEB182|82B1AE;
    JSR.W CODE_C299E9                    ;C299E1|20E999  |C299E9;
    JSL.L enable_interrupts                    ;C299E4|22A2B182|82B1A2;
    RTL                                  ;C299E8|6B      |      ;

CODE_C299E9:
JSL.L CODE_C382FC                    ;C299E9|22FC8283|8382FC;
BCC CODE_C299F0                      ;C299ED|9001    |C299F0;
RTS

CODE_C299F0:
PHP                                  ;C299F0|08      |      ;
REP #$20                             ;C299F1|C220    |      ;
LDY.W $039E                          ;C299F3|AC9E03  |81039E;
AND.W #$00FF                         ;C299F6|29FF00  |      ;
BEQ CODE_C29A48                      ;C299F9|F04D    |C29A48;
DEC A                                ;C299FB|3A      |      ;
BNE CODE_C29A01                      ;C299FC|D003    |C29A01;
BRL CODE_C29AAC                      ;C299FE|82AB00  |C29AAC;

CODE_C29A01:
DEC A                                ;C29A01|3A      |      ;
BNE CODE_C29A07                      ;C29A02|D003    |C29A07;
BRL CODE_C29A0A                      ;C29A04|820300  |C29A0A;

CODE_C29A07:
BRL CODE_C29A2B                      ;C29A07|822100  |C29A2B;

CODE_C29A0A:
LDA.W #$0002                         ;C29A0A|A90200  |      ;
STA.B $00                            ;C29A0D|8500    |000000;
LDA.W $0000,Y                        ;C29A0F|B90000  |810000;
CLC                                  ;C29A12|18      |      ;
ADC.W #$0010                         ;C29A13|691000  |      ;
STA.B $16                            ;C29A16|8516    |000016;
LDA.W $0002,Y                        ;C29A18|B90200  |810002;
SEC                                  ;C29A1B|38      |      ;
SBC.W #$0008                         ;C29A1C|E90800  |      ;
STA.B $18                            ;C29A1F|8518    |000018;
JSR.W CODE_C29AC9                    ;C29A21|20C99A  |C29AC9;
BCC CODE_C29A29                      ;C29A24|9003    |C29A29;
BRL CODE_C29AFE                      ;C29A26|82D500  |C29AFE;

CODE_C29A29:
PLP                                  ;C29A29|28      |      ;
RTS                                  ;C29A2A|60      |      ;

CODE_C29A2B:
LDA.W #$0003                         ;C29A2B|A90300  |      ;
STA.B $00                            ;C29A2E|8500    |000000;
LDA.W $0000,Y                        ;C29A30|B90000  |810000;
STA.B $16                            ;C29A33|8516    |000016;
LDA.W $0002,Y                        ;C29A35|B90200  |810002;
SEC                                  ;C29A38|38      |      ;
SBC.W #$0008                         ;C29A39|E90800  |      ;
STA.B $18                            ;C29A3C|8518    |000018;
JSR.W CODE_C29AC9                    ;C29A3E|20C99A  |C29AC9;
BCC CODE_C29A46                      ;C29A41|9003    |C29A46;
BRL CODE_C29AFE                      ;C29A43|82B800  |C29AFE;

CODE_C29A46:
PLP                                  ;C29A46|28      |      ;
RTS                                  ;C29A47|60      |      ;

CODE_C29A48:
LDA.W #$0000                         ;C29A48|A90000  |      ;
STA.B $00                            ;C29A4B|8500    |000000;
LDA.W $0000,Y                        ;C29A4D|B90000  |810000;
CLC                                  ;C29A50|18      |      ;
ADC.W #$0008                         ;C29A51|690800  |      ;
STA.B $16                            ;C29A54|8516    |000016;
LDA.W $0002,Y                        ;C29A56|B90200  |810002;
SEC                                  ;C29A59|38      |      ;
SBC.W #$0010                         ;C29A5A|E91000  |      ;
STA.B $18                            ;C29A5D|8518    |000018;
JSR.W CODE_C29AC9                    ;C29A5F|20C99A  |C29AC9;
BCC CODE_C29A67                      ;C29A62|9003    |C29A67;
BRL CODE_C29AFE                      ;C29A64|829700  |C29AFE;

CODE_C29A67:
PHX                                  ;C29A67|DA      |      ;
LDX.W $039E                          ;C29A68|AE9E03  |81039E;
LDA.W $0000,X                        ;C29A6B|BD0000  |810000;
AND.W #$FFF0                         ;C29A6E|29F0FF  |      ;
STA.B $16                            ;C29A71|8516    |000016;
LDA.W $0002,X                        ;C29A73|BD0200  |810002;
SEC                                  ;C29A76|38      |      ;
SBC.W #$0020                         ;C29A77|E92000  |      ;
AND.W #$FFF0                         ;C29A7A|29F0FF  |      ;
STA.B $18                            ;C29A7D|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C29A7F|22E08183|8381E0;
LDA.L passable_map,X                      ;C29A83|BF00807F|7F8000;
PLX                                  ;C29A87|FA      |      ;
AND.W #$000F                         ;C29A88|290F00  |      ;
CMP.W #$0006                         ;C29A8B|C90600  |      ;
BNE CODE_C29AAA                      ;C29A8E|D01A    |C29AAA;
LDA.W $0000,Y                        ;C29A90|B90000  |810000;
CLC                                  ;C29A93|18      |      ;
ADC.W #$0008                         ;C29A94|690800  |      ;
STA.B $16                            ;C29A97|8516    |000016;
LDA.W $0002,Y                        ;C29A99|B90200  |810002;
SEC                                  ;C29A9C|38      |      ;
SBC.W #$0020                         ;C29A9D|E92000  |      ;
STA.B $18                            ;C29AA0|8518    |000018;
JSR.W CODE_C29AC9                    ;C29AA2|20C99A  |C29AC9;
BCC CODE_C29AAA                      ;C29AA5|9003    |C29AAA;
BRL CODE_C29AFE                      ;C29AA7|825400  |C29AFE;

CODE_C29AAA:
PLP                                  ;C29AAA|28      |      ;
RTS                                  ;C29AAB|60      |      ;

CODE_C29AAC:
LDA.W #$0001                         ;C29AAC|A90100  |      ;
STA.B $00                            ;C29AAF|8500    |000000;
LDA.W $0000,Y                        ;C29AB1|B90000  |810000;
CLC                                  ;C29AB4|18      |      ;
ADC.W #$0008                         ;C29AB5|690800  |      ;
STA.B $16                            ;C29AB8|8516    |000016;
LDA.W $0002,Y                        ;C29ABA|B90200  |810002;
STA.B $18                            ;C29ABD|8518    |000018;
JSR.W CODE_C29AC9                    ;C29ABF|20C99A  |C29AC9;
BCC CODE_C29AC7                      ;C29AC2|9003    |C29AC7;
BRL CODE_C29AFE                      ;C29AC4|823700  |C29AFE;

CODE_C29AC7:
PLP                                  ;C29AC7|28      |      ;
RTS                                  ;C29AC8|60      |      ;

CODE_C29AC9:
LDA.W $06B2                          ;C29AC9|ADB206  |8106B2;

CODE_C29ACC:
TAX                                  ;C29ACC|AA      |      ;
BEQ CODE_C29AFA                      ;C29ACD|F02B    |C29AFA;
LDA.W $0016,X                        ;C29ACF|BD1600  |810016;
BIT.W #$0040                         ;C29AD2|894000  |      ;
BEQ CODE_C29AF5                      ;C29AD5|F01E    |C29AF5;
LDA.B $16                            ;C29AD7|A516    |000016;
SEC                                  ;C29AD9|38      |      ;
SBC.W $0000,X                        ;C29ADA|FD0000  |810000;
CMP.W $0010,X                        ;C29ADD|DD1000  |810010;
BEQ CODE_C29AE4                      ;C29AE0|F002    |C29AE4;
BCS CODE_C29AF5                      ;C29AE2|B011    |C29AF5;

CODE_C29AE4:
LDA.B $18                            ;C29AE4|A518    |000018;
SEC                                  ;C29AE6|38      |      ;
SBC.W $0002,X                        ;C29AE7|FD0200  |810002;
CLC                                  ;C29AEA|18      |      ;
ADC.W $0012,X                        ;C29AEB|7D1200  |810012;
CMP.W $0012,X                        ;C29AEE|DD1200  |810012;
BEQ CODE_C29AFC                      ;C29AF1|F009    |C29AFC;
BCC CODE_C29AFC                      ;C29AF3|9007    |C29AFC;

CODE_C29AF5:
LDA.W $003E,X                        ;C29AF5|BD3E00  |81003E;
BRA CODE_C29ACC                      ;C29AF8|80D2    |C29ACC;

CODE_C29AFA:
CLC                                  ;C29AFA|18      |      ;
RTS                                  ;C29AFB|60      |      ;

CODE_C29AFC:
SEC                                  ;C29AFC|38      |      ;
RTS                                  ;C29AFD|60      |      ;

CODE_C29AFE:
LDA.W $0030,X                        ;C29AFE|BD3000  |810030;
BEQ CODE_C29B5F                      ;C29B01|F05C    |C29B5F;
LDA.W $0016,X                        ;C29B03|BD1600  |810016;
BIT.W #$0008                         ;C29B06|890800  |      ;
BNE CODE_C29B22                      ;C29B09|D017    |C29B22;
SEP #$20                             ;C29B0B|E220    |      ;
LDA.B #$82                           ;C29B0D|A982    |      ;
PHA                                  ;C29B0F|48      |      ;
PEA.W UNREACH_819B5E                 ;C29B10|F45E9B  |819B5E;
LDY.W $0038,X                        ;C29B13|BC3800  |810038;
LDA.W Entity.behaviour_bank,Y               ;C29B16|B90D80  |81800D;
PHA                                  ;C29B19|48      |      ;
LDY.W $0030,X                        ;C29B1A|BC3000  |810030;
DEY                                  ;C29B1D|88      |      ;
PHY                                  ;C29B1E|5A      |      ;
REP #$20                             ;C29B1F|C220    |      ;
RTL                                  ;C29B21|6B      |      ;

CODE_C29B22:
PHX                                  ;C29B22|DA      |      ;
LDY.W #$1A1E                         ;C29B23|A01E1A  |      ;
LDA.W #$003F                         ;C29B26|A93F00  |      ;
MVN $81,$81                          ;C29B29|548181  |      ;
PLX                                  ;C29B2C|FA      |      ;
PHX                                  ;C29B2D|DA      |      ;
JSR.W CODE_C29B61                    ;C29B2E|20619B  |C29B61;
AND.W #$00FF                         ;C29B31|29FF00  |      ;
STA.W $001E,X                        ;C29B34|9D1E00  |81001E;
STZ.W $0020,X                        ;C29B37|9E2000  |810020;
JSL.L CODE_C0891F                    ;C29B3A|221F8980|80891F;
SEP #$20                             ;C29B3E|E220    |      ;
LDA.B #$82                           ;C29B40|A982    |      ;
PHA                                  ;C29B42|48      |      ;
PEA.W UNREACH_819B54                 ;C29B43|F4549B  |819B54;
LDY.W $0038,X                        ;C29B46|BC3800  |810038;
LDA.W Entity.behaviour_bank,Y               ;C29B49|B90D80  |81800D;
PHA                                  ;C29B4C|48      |      ;
LDY.W $0030,X                        ;C29B4D|BC3000  |810030;
DEY                                  ;C29B50|88      |      ;
PHY                                  ;C29B51|5A      |      ;
REP #$20                             ;C29B52|C220    |      ;
RTL                                  ;C29B54|6B      |      ;
LDX.W #$1A1E                         ;C29B55|A21E1A  |      ;
PLY                                  ;C29B58|7A      |      ;
LDA.W #$003F                         ;C29B59|A93F00  |      ;
MVN $81,$81                          ;C29B5C|548181  |      ;

CODE_C29B5F:
PLP                                  ;C29B5F|28      |      ;
RTS                                  ;C29B60|60      |      ;

CODE_C29B61:
PHP                                  ;C29B61|08      |      ;
SEP #$20                             ;C29B62|E220    |      ;
LDY.W $001E,X                        ;C29B64|BC1E00  |81001E;
LDA.B #$06                           ;C29B67|A906    |      ;
JSL.L CODE_C2B1E8                    ;C29B69|22E8B182|82B1E8;
XBA                                  ;C29B6D|EB      |      ;
LDA.B #$06                           ;C29B6E|A906    |      ;
JSL.L multiply                    ;C29B70|22D1B182|82B1D1;
STA.B $01                            ;C29B74|8501    |000001;
LDA.B $00                            ;C29B76|A500    |000000;
BEQ CODE_C29B98                      ;C29B78|F01E    |C29B98;
DEC A                                ;C29B7A|3A      |      ;
BEQ CODE_C29B96                      ;C29B7B|F019    |C29B96;
DEC A                                ;C29B7D|3A      |      ;
BEQ CODE_C29B89                      ;C29B7E|F009    |C29B89;
LDA.W $001D,X                        ;C29B80|BD1D00  |81001D;
BIT.B #$40                           ;C29B83|8940    |      ;
BNE CODE_C29B94                      ;C29B85|D00D    |C29B94;
BRA CODE_C29B90                      ;C29B87|8007    |C29B90;

CODE_C29B89:
LDA.W $001D,X                        ;C29B89|BD1D00  |81001D;
BIT.B #$40                           ;C29B8C|8940    |      ;
BEQ CODE_C29B94                      ;C29B8E|F004    |C29B94;

CODE_C29B90:
JSL.L CODE_C38313                    ;C29B90|22138383|838313;

CODE_C29B94:
INC.B $01                            ;C29B94|E601    |000001;

CODE_C29B96:
INC.B $01                            ;C29B96|E601    |000001;

CODE_C29B98:
LDA.B $01                            ;C29B98|A501    |000001;
PLP                                  ;C29B9A|28      |      ;
RTS                                  ;C29B9B|60      |      ;

;; TODO
open_equipment_menu:
STZ.B $42                            ;C29B9C|6442    |000042;
JSL.L wait_vblank                    ;C29B9E|22B7B182|82B1B7;
LDA.B #$80                           ;C29BA2|A980    |      ;
STA.W INIDISP                          ;C29BA4|8D0021  |812100;
LDA.B #$5C                           ;C29BA7|A95C    |      ;
STA.W BG2SC                          ;C29BA9|8D0821  |812108;
LDA.B #$20                           ;C29BAC|A920    |      ;
STA.W BG12NBA                          ;C29BAE|8D0B21  |81210B;
LDA.B #$06                           ;C29BB1|A906    |      ;
STA.W TM                          ;C29BB3|8D2C21  |81212C;
STZ.W CGADSUB                          ;C29BB6|9C3121  |812131;
STZ.W W12SEL                          ;C29BB9|9C2321  |812123;
LDX.W bg1_hofs                          ;C29BBC|AE3A03  |81033A;
STX.W $0466                          ;C29BBF|8E6604  |810466;
LDX.W bg1_vofs                          ;C29BC2|AE3C03  |81033C;
STX.W $0468                          ;C29BC5|8E6804  |810468;
LDX.W $033E                          ;C29BC8|AE3E03  |81033E;
STX.W $046A                          ;C29BCB|8E6A04  |81046A;
LDX.W $0340                          ;C29BCE|AE4003  |810340;
STX.W $046C                          ;C29BD1|8E6C04  |81046C;
LDX.W #$0000                         ;C29BD4|A20000  |      ;
STX.W bg1_hofs                          ;C29BD7|8E3A03  |81033A;
STX.W bg1_vofs                          ;C29BDA|8E3C03  |81033C;
STX.W $033E                          ;C29BDD|8E3E03  |81033E;
STX.W $0340                          ;C29BE0|8E4003  |810340;
STZ.W $043B                          ;C29BE3|9C3B04  |81043B;
LDA.W Equipment.magic                          ;C29BE6|AD621B  |811B62;
STA.W $0441                          ;C29BE9|8D4104  |810441;
JSR.W CODE_C2A3EF                    ;C29BEC|20EFA3  |C2A3EF;
JSR.W CODE_C2A41B                    ;C29BEF|201BA4  |C2A41B;
JSR.W CODE_C2A442                    ;C29BF2|2042A4  |C2A442;
JSR.W CODE_C2A395                    ;C29BF5|2095A3  |C2A395;
JSL.L wait_vblank                    ;C29BF8|22B7B182|82B1B7;
BRK #$07                             ;C29BFC|0007    |      ;
JSR.W CODE_C29C80                    ;C29BFE|20809C  |C29C80;
LDA.B #$C0                           ;C29C01|A9C0    |      ;
TRB.W $032B                          ;C29C03|1C2B03  |81032B;
STZ.W $0323                          ;C29C06|9C2303  |810323;
JSL.L wait_vblank                    ;C29C09|22B7B182|82B1B7;
LDX.W $0466                          ;C29C0D|AE6604  |810466;
STX.W bg1_hofs                          ;C29C10|8E3A03  |81033A;
LDX.W $0468                          ;C29C13|AE6804  |810468;
STX.W bg1_vofs                          ;C29C16|8E3C03  |81033C;
LDX.W $046A                          ;C29C19|AE6A04  |81046A;
STX.W $033E                          ;C29C1C|8E3E03  |81033E;
LDX.W $046C                          ;C29C1F|AE6C04  |81046C;
STX.W $0340                          ;C29C22|8E4003  |810340;
LDA.B #$80                           ;C29C25|A980    |      ;
STA.W INIDISP                          ;C29C27|8D0021  |812100;
LDA.W $03C4                          ;C29C2A|ADC403  |8103C4;
STA.W BG2SC                          ;C29C2D|8D0821  |812108;
STZ.W BG12NBA                          ;C29C30|9C0B21  |81210B;
LDA.W $03C2                          ;C29C33|ADC203  |8103C2;
STA.W TM                          ;C29C36|8D2C21  |81212C;
LDA.W $03C3                          ;C29C39|ADC303  |8103C3;
STA.W CGADSUB                          ;C29C3C|8D3121  |812131;
LDA.W $03C5                          ;C29C3F|ADC503  |8103C5;
STA.W W12SEL                          ;C29C42|8D2321  |812123;
JSL.L CODE_C2A468                    ;C29C45|2268A482|82A468;
JSR.W CODE_C2A405                    ;C29C49|2005A4  |C2A405;
JSL.L CODE_C2A4A1                    ;C29C4C|22A1A482|82A4A1;
LDA.W Equipment.magic                          ;C29C50|AD621B  |811B62;
CMP.W $0441                          ;C29C53|CD4104  |810441;
BEQ CODE_C29C62                      ;C29C56|F00A    |C29C62;
JSL.L CODE_C0ACA9                    ;C29C58|22A9AC80|80ACA9;
STZ.W $043F                          ;C29C5C|9C3F04  |81043F;
STZ.W $0440                          ;C29C5F|9C4004  |810440;

CODE_C29C62:
JSL.L CODE_C38321                    ;C29C62|22218383|838321;
JSR.W clearOsd                    ;C29C66|2055A3  |C2A355;
LDA.B #!UpdateHud_All                           ;C29C69|A91F    |      ;
STA.W display_hud_bitfield                          ;C29C6B|8D3203  |810332;
JSL.L wait_vblank                    ;C29C6E|22B7B182|82B1B7;
JSL.L CODE_C0814E                    ;C29C72|224E8180|80814E;
JSL.L wait_vblank                    ;C29C76|22B7B182|82B1B7;
LDA.B #$0F                           ;C29C7A|A90F    |      ;
STA.W INIDISP                          ;C29C7C|8D0021  |812100;
RTL                                  ;C29C7F|6B      |      ;

CODE_C29C80:
JSR.W clearOsd                    ;C29C80|2055A3  |C2A355;
LDY.W #osd_item_menu                         ;C29C83|A070C8  |      ;
JSL.L printOsdStringFromBank2                    ;C29C86|2254A782|82A754;
LDA.B #$01                           ;C29C8A|A901    |      ;
STA.W $03BA                          ;C29C8C|8DBA03  |8103BA;
JSL.L enable_interrupts                    ;C29C8F|22A2B182|82B1A2;
JSL.L enableNmiInterruptAndTurnScreenOn                    ;C29C93|2276B182|82B176;
JSR.W CODE_C29F1D                    ;C29C97|201D9F  |C29F1D;
LDA.B #$02                           ;C29C9A|A902    |      ;
STA.W $03BA                          ;C29C9C|8DBA03  |8103BA;
JSL.L wait_vblank                    ;C29C9F|22B7B182|82B1B7;
LDA.B #$01                           ;C29CA3|A901    |      ;
STA.W $03BA                          ;C29CA5|8DBA03  |8103BA;
JSL.L wait_vblank                    ;C29CA8|22B7B182|82B1B7;
LDX.W #$048A                         ;C29CAC|A28A04  |      ;
LDA.B #$00                           ;C29CAF|A900    |      ;
XBA                                  ;C29CB1|EB      |      ;
LDA.B #$04                           ;C29CB2|A904    |      ;

CODE_C29CB4:
JSR.W CODE_C2A13D                    ;C29CB4|203DA1  |C2A13D;
BCC CODE_C29CBC                      ;C29CB7|9003    |C29CBC;
BRL CODE_C29D49                      ;C29CB9|828D00  |C29D49;

CODE_C29CBC:
CMP.B #$00                           ;C29CBC|C900    |      ;
BEQ CODE_C29CC8                      ;C29CBE|F008    |C29CC8;
DEC A                                ;C29CC0|3A      |      ;
BEQ CODE_C29CE9                      ;C29CC1|F026    |C29CE9;
DEC A                                ;C29CC3|3A      |      ;
BEQ CODE_C29D0A                      ;C29CC4|F044    |C29D0A;
BRA CODE_C29D28                      ;C29CC6|8060    |C29D28;

CODE_C29CC8:
LDA.B #$08                           ;C29CC8|A908    |      ;
LDY.W #$1B1E                         ;C29CCA|A01E1B  |      ;
JSR.W CODE_C29DA8                    ;C29CCD|20A89D  |C29DA8;
BCS CODE_C29CD8                      ;C29CD0|B006    |C29CD8;
STA.W Equipment.sword                          ;C29CD2|8D5E1B  |811B5E;
JSR.W CODE_C29EF2                    ;C29CD5|20F29E  |C29EF2;

CODE_C29CD8:
LDY.W #osd_item_menu_lower_part                         ;C29CD8|A093C8  |      ;
JSL.L printOsdStringFromBank2                    ;C29CDB|2254A782|82A754;
LDX.W #$048A                         ;C29CDF|A28A04  |      ;
LDA.B #$00                           ;C29CE2|A900    |      ;
XBA                                  ;C29CE4|EB      |      ;
LDA.B #$04                           ;C29CE5|A904    |      ;
BRA CODE_C29CB4                      ;C29CE7|80CB    |C29CB4;

CODE_C29CE9:
LDA.B #$08                           ;C29CE9|A908    |      ;
LDY.W #$1B26                         ;C29CEB|A0261B  |      ;
JSR.W CODE_C29DA8                    ;C29CEE|20A89D  |C29DA8;
BCS CODE_C29CF9                      ;C29CF1|B006    |C29CF9;
STA.W Equipment.armor                          ;C29CF3|8D601B  |811B60;
JSR.W CODE_C29EF2                    ;C29CF6|20F29E  |C29EF2;

CODE_C29CF9:
LDY.W #osd_item_menu_lower_part                         ;C29CF9|A093C8  |      ;
JSL.L printOsdStringFromBank2                    ;C29CFC|2254A782|82A754;
LDX.W #$050A                         ;C29D00|A20A05  |      ;
LDA.B #$01                           ;C29D03|A901    |      ;
XBA                                  ;C29D05|EB      |      ;
LDA.B #$04                           ;C29D06|A904    |      ;
BRA CODE_C29CB4                      ;C29D08|80AA    |C29CB4;

CODE_C29D0A:
LDA.B #$08                           ;C29D0A|A908    |      ;
LDY.W #$1B2E                         ;C29D0C|A02E1B  |      ;
JSR.W CODE_C29DA8                    ;C29D0F|20A89D  |C29DA8;
BCS CODE_C29D17                      ;C29D12|B003    |C29D17;
STA.W Equipment.magic                          ;C29D14|8D621B  |811B62;

CODE_C29D17:
LDY.W #osd_item_menu_lower_part                         ;C29D17|A093C8  |      ;
JSL.L printOsdStringFromBank2                    ;C29D1A|2254A782|82A754;
LDX.W #$058A                         ;C29D1E|A28A05  |      ;
LDA.B #$02                           ;C29D21|A902    |      ;
XBA                                  ;C29D23|EB      |      ;
LDA.B #$04                           ;C29D24|A904    |      ;
BRA CODE_C29CB4                      ;C29D26|808C    |C29CB4;

CODE_C29D28:
LDA.B #$28                           ;C29D28|A928    |      ;
LDY.W #$1B36                         ;C29D2A|A0361B  |      ;
JSR.W CODE_C29FF7                    ;C29D2D|20F79F  |C29FF7;
BCS CODE_C29D35                      ;C29D30|B003    |C29D35;
STA.W Equipment.item                          ;C29D32|8D641B  |811B64;

CODE_C29D35:
LDY.W #osd_item_menu_lower_part                         ;C29D35|A093C8  |      ;
JSL.L printOsdStringFromBank2                    ;C29D38|2254A782|82A754;
LDX.W #$060A                         ;C29D3C|A20A06  |      ;
LDA.B #$03                           ;C29D3F|A903    |      ;
XBA                                  ;C29D41|EB      |      ;
LDA.B #$04                           ;C29D42|A904    |      ;
BRL CODE_C29CB4                      ;C29D44|826DFF  |C29CB4;
db $18,$60                           ;C29D47|        |      ;

CODE_C29D49:
SEC                                  ;C29D49|38      |      ;
RTS                                  ;C29D4A|60      |      ;
db $DA,$5A,$20,$75,$A3,$A0,$70,$C8   ;C29D4B|        |      ;
db $22,$54,$A7,$82,$A9,$01,$8D,$BA   ;C29D53|        |82A754;
db $03,$22,$B7,$B1,$82,$20,$42,$A4   ;C29D5B|        |000022;
db $20,$1D,$9F,$A9,$02,$8D,$BA,$03   ;C29D63|        |C29F1D;
db $22,$B7,$B1,$82,$A9,$01,$8D,$BA   ;C29D6B|        |82B1B7;
db $03,$22,$B7,$B1,$82,$7A,$FA,$60   ;C29D73|        |000022;

CODE_C29D7B:
PHX                                  ;C29D7B|DA      |      ;
PHY                                  ;C29D7C|5A      |      ;
LDY.W #item_menu                         ;C29D7D|A0CFC8  |      ;
JSL.L printOsdStringFromBank2                    ;C29D80|2254A782|82A754;
LDA.B #$01                           ;C29D84|A901    |      ;
STA.W $03BA                          ;C29D86|8DBA03  |8103BA;
JSL.L wait_vblank                    ;C29D89|22B7B182|82B1B7;
JSR.W CODE_C2A455                    ;C29D8D|2055A4  |C2A455;
JSR.W CODE_C29FD8                    ;C29D90|20D89F  |C29FD8;
LDA.B #$02                           ;C29D93|A902    |      ;
STA.W $03BA                          ;C29D95|8DBA03  |8103BA;
JSL.L wait_vblank                    ;C29D98|22B7B182|82B1B7;
LDA.B #$01                           ;C29D9C|A901    |      ;
STA.W $03BA                          ;C29D9E|8DBA03  |8103BA;
JSL.L wait_vblank                    ;C29DA1|22B7B182|82B1B7;
PLY                                  ;C29DA5|7A      |      ;
PLX                                  ;C29DA6|FA      |      ;
RTS                                  ;C29DA7|60      |      ;

CODE_C29DA8:
STA.W number_of_choies                          ;C29DA8|8DC603  |8103C6;
STY.W $0056                          ;C29DAB|8C5600  |810056;
STZ.W cursor_counter                          ;C29DAE|9CC803  |8103C8;
JSR.W CODE_C29EB0                    ;C29DB1|20B09E  |C29EB0;
LDX.W #$0000                         ;C29DB4|A20000  |      ;
TXY                                  ;C29DB7|9B      |      ;

CODE_C29DB8:
LDA.B ($56),Y                        ;C29DB8|B156    |000056;
BMI CODE_C29DCB                      ;C29DBA|300F    |C29DCB;
INY                                  ;C29DBC|C8      |      ;
CPY.W number_of_choies                          ;C29DBD|CCC603  |8103C6;
BNE CODE_C29DB8                      ;C29DC0|D0F6    |C29DB8;
LDY.W #$0000                         ;C29DC2|A00000  |      ;
LDA.B ($56),Y                        ;C29DC5|B156    |000056;
ORA.B #$80                           ;C29DC7|0980    |      ;
STA.B ($56),Y                        ;C29DC9|9156    |000056;

CODE_C29DCB:
JSR.W CODE_C29F1D                    ;C29DCB|201D9F  |C29F1D;
JSL.L wait_vblank                    ;C29DCE|22B7B182|82B1B7;
PHY                                  ;C29DD2|5A      |      ;
REP #$20                             ;C29DD3|C220    |      ;
LDA.B ($56),Y                        ;C29DD5|B156    |000056;
AND.W #$007F                         ;C29DD7|297F00  |      ;
PHA                                  ;C29DDA|48      |      ;
BEQ CODE_C29DF4                      ;C29DDB|F017    |C29DF4;
LDY.W #UI_LevelStrengthDefense                         ;C29DDD|A09AD7  |      ;
CMP.W #$0009                         ;C29DE0|C90900  |      ;
BCC CODE_C29DF0                      ;C29DE3|900B    |C29DF0;
LDY.W #$D7B4                         ;C29DE5|A0B4D7  |      ;
CMP.W #$0011                         ;C29DE8|C91100  |      ;
BCC CODE_C29DF0                      ;C29DEB|9003    |C29DF0;
LDY.W #$D7C7                         ;C29DED|A0C7D7  |      ;

CODE_C29DF0:
JSL.L printOsdStringFromBank2                    ;C29DF0|2254A782|82A754;

CODE_C29DF4:
PLA                                  ;C29DF4|68      |      ;
ASL A                                ;C29DF5|0A      |      ;
TAX                                  ;C29DF6|AA      |      ;
LDA.L ItemDescriptionTable,X               ;C29DF7|BFCED782|82D7CE;
TAY                                  ;C29DFB|A8      |      ;
SEP #$20                             ;C29DFC|E220    |      ;
JSL.L printOsdStringFromBank2                    ;C29DFE|2254A782|82A754;
PLY                                  ;C29E02|7A      |      ;

CODE_C29E03:
JSR.W advance_frame_and_read_lower_buttons                    ;C29E03|2069B1  |C2B169;
BEQ CODE_C29E10                      ;C29E06|F008    |C29E10;
JSR.W CODE_C29ED4                    ;C29E08|20D49E  |C29ED4;
JSR.W CODE_C29F1D                    ;C29E0B|201D9F  |C29F1D;
BRA CODE_C29E03                      ;C29E0E|80F3    |C29E03;

CODE_C29E10:
JSR.W advance_frame_and_read_lower_buttons                    ;C29E10|2069B1  |C2B169;
LSR A                                ;C29E13|4A      |      ;
BCS UNREACH_C29E5C                   ;C29E14|B046    |C29E5C;
LSR A                                ;C29E16|4A      |      ;
BCS UNREACH_C29E6F                   ;C29E17|B056    |C29E6F;
LSR A                                ;C29E19|4A      |      ;
BCS CODE_C29E7F                      ;C29E1A|B063    |C29E7F;
LSR A                                ;C29E1C|4A      |      ;
BCS CODE_C29E8D                      ;C29E1D|B06E    |C29E8D;
LSR A                                ;C29E1F|4A      |      ;
LSR A                                ;C29E20|4A      |      ;
LSR A                                ;C29E21|4A      |      ;
BCS CODE_C29E2F                      ;C29E22|B00B    |C29E2F;
LSR A                                ;C29E24|4A      |      ;
BCS CODE_C29E2F                      ;C29E25|B008    |C29E2F;
JSR.W CODE_C29ED4                    ;C29E27|20D49E  |C29ED4;
JSR.W CODE_C29F1D                    ;C29E2A|201D9F  |C29F1D;
BRA CODE_C29E10                      ;C29E2D|80E1    |C29E10;

CODE_C29E2F:
BRK #$18                             ;C29E2F|0018    |      ;
LDA.B ($56),Y                        ;C29E31|B156    |000056;
ORA.B #$80                           ;C29E33|0980    |      ;
STA.B ($56),Y                        ;C29E35|9156    |000056;
JSR.W CODE_C29F1D                    ;C29E37|201D9F  |C29F1D;
LDA.B #$01                           ;C29E3A|A901    |      ;
TSB.W $03BA                          ;C29E3C|0CBA03  |8103BA;
JSL.L wait_vblank                    ;C29E3F|22B7B182|82B1B7;
LDA.B ($56),Y                        ;C29E43|B156    |000056;
AND.B #$7F                           ;C29E45|297F    |      ;
CLC                                  ;C29E47|18      |      ;
RTS                                  ;C29E48|60      |      ;
db $00,$07,$20,$C2,$9E,$20,$1D,$9F   ;C29E49|        |      ;
db $A9,$01,$0C,$BA,$03,$22,$B7,$B1   ;C29E51|        |      ;
db $82,$38,$60                       ;C29E59|        |C2FE94;

UNREACH_C29E5C:
db $98,$18,$69,$04,$CD,$C6,$03,$90   ;C29E5C|        |      ;
db $03,$82,$63,$FF,$BB,$C8,$C8,$C8   ;C29E64|        |000082;
db $C8,$80,$27                       ;C29E6C|        |      ;

UNREACH_C29E6F:
db $98,$38,$E9,$04,$10,$03,$82,$53   ;C29E6F|        |      ;
db $FF,$BB,$88,$88,$88,$88,$80,$17   ;C29E77|        |8888BB;

CODE_C29E7F:
TYA                                  ;C29E7F|98      |      ;
INC A                                ;C29E80|1A      |      ;
CMP.W number_of_choies                          ;C29E81|CDC603  |8103C6;
BCC CODE_C29E89                      ;C29E84|9003    |C29E89;
db $82,$42,$FF                       ;C29E86|        |C29DCB;

CODE_C29E89:
TYX                                  ;C29E89|BB      |      ;
INY                                  ;C29E8A|C8      |      ;
BRA CODE_C29E96                      ;C29E8B|8009    |C29E96;

CODE_C29E8D:
TYA                                  ;C29E8D|98      |      ;
DEC A                                ;C29E8E|3A      |      ;
BPL CODE_C29E94                      ;C29E8F|1003    |C29E94;
db $82,$37,$FF                       ;C29E91|        |C29DCB;

CODE_C29E94:
TYX                                  ;C29E94|BB      |      ;
DEY                                  ;C29E95|88      |      ;

CODE_C29E96:
BRK #$07                             ;C29E96|0007    |      ;
PHY                                  ;C29E98|5A      |      ;
LDA.B ($56),Y                        ;C29E99|B156    |000056;
ORA.B #$80                           ;C29E9B|0980    |      ;
STA.B ($56),Y                        ;C29E9D|9156    |000056;
TXY                                  ;C29E9F|9B      |      ;
LDA.B ($56),Y                        ;C29EA0|B156    |000056;
AND.B #$7F                           ;C29EA2|297F    |      ;
STA.B ($56),Y                        ;C29EA4|9156    |000056;
STZ.W cursor_counter                          ;C29EA6|9CC803  |8103C8;
PLY                                  ;C29EA9|7A      |      ;
JSR.W CODE_C29ED4                    ;C29EAA|20D49E  |C29ED4;
BRL CODE_C29DCB                      ;C29EAD|821BFF  |C29DCB;

CODE_C29EB0:
LDX.W #$0000                         ;C29EB0|A20000  |      ;
TXY                                  ;C29EB3|9B      |      ;

CODE_C29EB4:
LDA.B ($56),Y                        ;C29EB4|B156    |000056;
STA.L $7F0403,X                      ;C29EB6|9F03047F|7F0403;
INY                                  ;C29EBA|C8      |      ;
INX                                  ;C29EBB|E8      |      ;
CPX.W number_of_choies                          ;C29EBC|ECC603  |8103C6;
BNE CODE_C29EB4                      ;C29EBF|D0F3    |C29EB4;
RTS                                  ;C29EC1|60      |      ;
db $A2,$00,$00,$9B,$BF,$03,$04,$7F   ;C29EC2|        |      ;
db $91,$56,$C8,$E8,$EC,$C6,$03,$D0   ;C29ECA|        |000056;
db $F3,$60                           ;C29ED2|        |000060;

CODE_C29ED4:
LDA.W cursor_counter                          ;C29ED4|ADC803  |8103C8;
AND.B #$1F                           ;C29ED7|291F    |      ;
CMP.B #$18                           ;C29ED9|C918    |      ;
BCC CODE_C29EE3                      ;C29EDB|9006    |C29EE3;
LDA.B ($56),Y                        ;C29EDD|B156    |000056;
AND.B #$7F                           ;C29EDF|297F    |      ;
BRA CODE_C29EE7                      ;C29EE1|8004    |C29EE7;

CODE_C29EE3:
LDA.B ($56),Y                        ;C29EE3|B156    |000056;
ORA.B #$80                           ;C29EE5|0980    |      ;

CODE_C29EE7:
STA.B ($56),Y                        ;C29EE7|9156    |000056;
INC.W cursor_counter                          ;C29EE9|EEC803  |8103C8;
LDA.B #$01                           ;C29EEC|A901    |      ;
TSB.W $03BA                          ;C29EEE|0CBA03  |8103BA;
RTS                                  ;C29EF1|60      |      ;

CODE_C29EF2:
LDX.W Equipment.sword                          ;C29EF2|AE5E1B  |811B5E;
LDA.L ItemStrenghTable_Ptr,X               ;C29EF5|BF7DE482|82E47D;
STA.W player_strength_from_item                          ;C29EF9|8D701B  |811B70;
LDA.L ItemDefenseTable_Ptr,X               ;C29EFC|BF8EE482|82E48E;
STA.W player_defense_from_item                          ;C29F00|8D741B  |811B74;
LDX.W Equipment.armor                          ;C29F03|AE601B  |811B60;
LDA.L ItemStrenghTable_Ptr,X               ;C29F06|BF7DE482|82E47D;
CLC                                  ;C29F0A|18      |      ;
ADC.W player_strength_from_item                          ;C29F0B|6D701B  |811B70;
STA.W player_strength_from_item                          ;C29F0E|8D701B  |811B70;
LDA.L ItemDefenseTable_Ptr,X               ;C29F11|BF8EE482|82E48E;
CLC                                  ;C29F15|18      |      ;
ADC.W player_defense_from_item                          ;C29F16|6D741B  |811B74;
STA.W player_defense_from_item                          ;C29F19|8D741B  |811B74;
RTS                                  ;C29F1C|60      |      ;

CODE_C29F1D:
PHP                                  ;C29F1D|08      |      ;
PHY                                  ;C29F1E|5A      |      ;
REP #$20                             ;C29F1F|C220    |      ;
LDX.W #$0000                         ;C29F21|A20000  |      ;

CODE_C29F24:
PHX                                  ;C29F24|DA      |      ;
TXA                                  ;C29F25|8A      |      ;
ASL A                                ;C29F26|0A      |      ;
TAX                                  ;C29F27|AA      |      ;
LDA.W UNREACH_81F9F7,X               ;C29F28|BDF7F9  |81F9F7;
TAY                                  ;C29F2B|A8      |      ;
PLX                                  ;C29F2C|FA      |      ;
LDA.W $1B1E,X                        ;C29F2D|BD1E1B  |811B1E;
JSR.W CODE_C29F6C                    ;C29F30|206C9F  |C29F6C;
INX                                  ;C29F33|E8      |      ;
CPX.W #$0008                         ;C29F34|E00800  |      ;
BNE CODE_C29F24                      ;C29F37|D0EB    |C29F24;
LDX.W #$0000                         ;C29F39|A20000  |      ;

CODE_C29F3C:
PHX                                  ;C29F3C|DA      |      ;
TXA                                  ;C29F3D|8A      |      ;
ASL A                                ;C29F3E|0A      |      ;
TAX                                  ;C29F3F|AA      |      ;
LDA.W UNREACH_81FA07,X               ;C29F40|BD07FA  |81FA07;
TAY                                  ;C29F43|A8      |      ;
PLX                                  ;C29F44|FA      |      ;
LDA.W $1B26,X                        ;C29F45|BD261B  |811B26;
JSR.W CODE_C29F6C                    ;C29F48|206C9F  |C29F6C;
INX                                  ;C29F4B|E8      |      ;
CPX.W #$0008                         ;C29F4C|E00800  |      ;
BNE CODE_C29F3C                      ;C29F4F|D0EB    |C29F3C;
LDX.W #$0000                         ;C29F51|A20000  |      ;

CODE_C29F54:
PHX                                  ;C29F54|DA      |      ;
TXA                                  ;C29F55|8A      |      ;
ASL A                                ;C29F56|0A      |      ;
TAX                                  ;C29F57|AA      |      ;
LDA.W UNREACH_81FA17,X               ;C29F58|BD17FA  |81FA17;
TAY                                  ;C29F5B|A8      |      ;
PLX                                  ;C29F5C|FA      |      ;
LDA.W $1B2E,X                        ;C29F5D|BD2E1B  |811B2E;
JSR.W CODE_C29F6C                    ;C29F60|206C9F  |C29F6C;
INX                                  ;C29F63|E8      |      ;
CPX.W #$0008                         ;C29F64|E00800  |      ;
BNE CODE_C29F54                      ;C29F67|D0EB    |C29F54;
PLY                                  ;C29F69|7A      |      ;
PLP                                  ;C29F6A|28      |      ;
RTS                                  ;C29F6B|60      |      ;

CODE_C29F6C:
PHB                                  ;C29F6C|8B      |      ;
PHX                                  ;C29F6D|DA      |      ;
XBA                                  ;C29F6E|EB      |      ;
TAX                                  ;C29F6F|AA      |      ;
SEP #$20                             ;C29F70|E220    |      ;
PHP                                  ;C29F72|08      |      ;
LDA.B #$7F                           ;C29F73|A97F    |      ;
PHA                                  ;C29F75|48      |      ;
PLB                                  ;C29F76|AB      |      ;
PLP                                  ;C29F77|28      |      ;
BMI CODE_C29F8A                      ;C29F78|3010    |C29F8A;
LDA.B #$00                           ;C29F7A|A900    |      ;
STA.W $7000,Y                        ;C29F7C|990070  |7F7000;
STA.W $7002,Y                        ;C29F7F|990270  |7F7002;
STA.W $7040,Y                        ;C29F82|994070  |7F7040;
STA.W $7042,Y                        ;C29F85|994270  |7F7042;
BRA CODE_C29FAF                      ;C29F88|8025    |C29FAF;

CODE_C29F8A:
LDA.B #$3B                           ;C29F8A|A93B    |      ;
STA.W $7000,Y                        ;C29F8C|990070  |7F7000;
STA.W $7002,Y                        ;C29F8F|990270  |7F7002;
STA.W $7040,Y                        ;C29F92|994070  |7F7040;
STA.W $7042,Y                        ;C29F95|994270  |7F7042;
LDA.W $7001,Y                        ;C29F98|B90170  |7F7001;
ORA.B #$0C                           ;C29F9B|090C    |      ;
STA.W $7001,Y                        ;C29F9D|990170  |7F7001;
EOR.B #$40                           ;C29FA0|4940    |      ;
STA.W $7003,Y                        ;C29FA2|990370  |7F7003;
EOR.B #$C0                           ;C29FA5|49C0    |      ;
STA.W $7041,Y                        ;C29FA7|994170  |7F7041;
EOR.B #$40                           ;C29FAA|4940    |      ;
STA.W $7043,Y                        ;C29FAC|994370  |7F7043;

CODE_C29FAF:
REP #$20                             ;C29FAF|C220    |      ;
XBA                                  ;C29FB1|EB      |      ;
AND.W #$007F                         ;C29FB2|297F00  |      ;
ASL A                                ;C29FB5|0A      |      ;
ASL A                                ;C29FB6|0A      |      ;
ASL A                                ;C29FB7|0A      |      ;
TAX                                  ;C29FB8|AA      |      ;
LDA.L UNREACH_898800,X               ;C29FB9|BF008889|898800;
STA.W $7800,Y                        ;C29FBD|990078  |7F7800;
LDA.L UNREACH_898802,X               ;C29FC0|BF028889|898802;
STA.W $7802,Y                        ;C29FC4|990278  |7F7802;
LDA.L UNREACH_898804,X               ;C29FC7|BF048889|898804;
STA.W $7840,Y                        ;C29FCB|994078  |7F7840;
LDA.L UNREACH_898806,X               ;C29FCE|BF068889|898806;
STA.W $7842,Y                        ;C29FD2|994278  |7F7842;
PLX                                  ;C29FD5|FA      |      ;
PLB                                  ;C29FD6|AB      |      ;
RTS                                  ;C29FD7|60      |      ;

CODE_C29FD8:
PHP                                  ;C29FD8|08      |      ;
PHY                                  ;C29FD9|5A      |      ;
REP #$20                             ;C29FDA|C220    |      ;
LDX.W #$0000                         ;C29FDC|A20000  |      ;

CODE_C29FDF:
PHX                                  ;C29FDF|DA      |      ;
TXA                                  ;C29FE0|8A      |      ;
ASL A                                ;C29FE1|0A      |      ;
TAX                                  ;C29FE2|AA      |      ;
LDA.W UNREACH_81FA27,X               ;C29FE3|BD27FA  |81FA27;
TAY                                  ;C29FE6|A8      |      ;
PLX                                  ;C29FE7|FA      |      ;
LDA.W $1B36,X                        ;C29FE8|BD361B  |811B36;
JSR.W CODE_C29F6C                    ;C29FEB|206C9F  |C29F6C;
INX                                  ;C29FEE|E8      |      ;
CPX.W #$0028                         ;C29FEF|E02800  |      ;
BNE CODE_C29FDF                      ;C29FF2|D0EB    |C29FDF;
PLY                                  ;C29FF4|7A      |      ;
PLP                                  ;C29FF5|28      |      ;
RTS                                  ;C29FF6|60      |      ;

CODE_C29FF7:
STA.W number_of_choies                          ;C29FF7|8DC603  |8103C6;
STY.W $0056                          ;C29FFA|8C5600  |810056;
STZ.W cursor_counter                          ;C29FFD|9CC803  |8103C8;
JSR.W CODE_C29EB0                    ;C2A000|20B09E  |C29EB0;
LDX.W #$0000                         ;C2A003|A20000  |      ;
TXY                                  ;C2A006|9B      |      ;

CODE_C2A007:
LDA.B ($56),Y                        ;C2A007|B156    |000056;
BMI CODE_C2A01A                      ;C2A009|300F    |C2A01A;
INY                                  ;C2A00B|C8      |      ;
CPY.W number_of_choies                          ;C2A00C|CCC603  |8103C6;
BNE CODE_C2A007                      ;C2A00F|D0F6    |C2A007;
db $A0,$00,$00,$B1,$56,$09,$80,$91   ;C2A011|        |      ;
db $56                               ;C2A019|        |000020;

CODE_C2A01A:
JSR.W CODE_C29FD8                    ;C2A01A|20D89F  |C29FD8;
JSL.L wait_vblank                    ;C2A01D|22B7B182|82B1B7;
PHY                                  ;C2A021|5A      |      ;
REP #$20                             ;C2A022|C220    |      ;
LDA.B ($56),Y                        ;C2A024|B156    |000056;
AND.W #$007F                         ;C2A026|297F00  |      ;
BEQ CODE_C2A034                      ;C2A029|F009    |C2A034;
PHA                                  ;C2A02B|48      |      ;
LDY.W #$D7C7                         ;C2A02C|A0C7D7  |      ;
JSL.L printOsdStringFromBank2                    ;C2A02F|2254A782|82A754;
PLA                                  ;C2A033|68      |      ;

CODE_C2A034:
ASL A                                ;C2A034|0A      |      ;
TAX                                  ;C2A035|AA      |      ;
LDA.L ItemDescriptionTable,X               ;C2A036|BFCED782|82D7CE;
TAY                                  ;C2A03A|A8      |      ;
SEP #$20                             ;C2A03B|E220    |      ;
JSL.L printOsdStringFromBank2                    ;C2A03D|2254A782|82A754;
PLY                                  ;C2A041|7A      |      ;

CODE_C2A042:
JSR.W advance_frame_and_read_lower_buttons                    ;C2A042|2069B1  |C2B169;
BEQ CODE_C2A04F                      ;C2A045|F008    |C2A04F;
JSR.W CODE_C29ED4                    ;C2A047|20D49E  |C29ED4;
JSR.W CODE_C29FD8                    ;C2A04A|20D89F  |C29FD8;
BRA CODE_C2A042                      ;C2A04D|80F3    |C2A042;

CODE_C2A04F:
JSR.W advance_frame_and_read_lower_buttons                    ;C2A04F|2069B1  |C2B169;
LSR A                                ;C2A052|4A      |      ;
BCS CODE_C2A0CD                      ;C2A053|B078    |C2A0CD;
LSR A                                ;C2A055|4A      |      ;
BCC CODE_C2A05B                      ;C2A056|9003    |C2A05B;
BRL CODE_C2A0DB                      ;C2A058|828000  |C2A0DB;

CODE_C2A05B:
LSR A                                ;C2A05B|4A      |      ;
BCS CODE_C2A09E                      ;C2A05C|B040    |C2A09E;
LSR A                                ;C2A05E|4A      |      ;
BCS CODE_C2A0B7                      ;C2A05F|B056    |C2A0B7;
LSR A                                ;C2A061|4A      |      ;
LSR A                                ;C2A062|4A      |      ;
LSR A                                ;C2A063|4A      |      ;
BCS CODE_C2A071                      ;C2A064|B00B    |C2A071;
LSR A                                ;C2A066|4A      |      ;
BCS CODE_C2A071                      ;C2A067|B008    |C2A071;
JSR.W CODE_C29ED4                    ;C2A069|20D49E  |C29ED4;
JSR.W CODE_C29FD8                    ;C2A06C|20D89F  |C29FD8;
BRA CODE_C2A04F                      ;C2A06F|80DE    |C2A04F;

CODE_C2A071:
BRK #$18                             ;C2A071|0018    |      ;
LDA.B ($56),Y                        ;C2A073|B156    |000056;
ORA.B #$80                           ;C2A075|0980    |      ;
STA.B ($56),Y                        ;C2A077|9156    |000056;
JSR.W CODE_C29FD8                    ;C2A079|20D89F  |C29FD8;
LDA.B #$01                           ;C2A07C|A901    |      ;
TSB.W $03BA                          ;C2A07E|0CBA03  |8103BA;
JSL.L wait_vblank                    ;C2A081|22B7B182|82B1B7;
LDA.B ($56),Y                        ;C2A085|B156    |000056;
AND.B #$7F                           ;C2A087|297F    |      ;
CLC                                  ;C2A089|18      |      ;
RTS                                  ;C2A08A|60      |      ;
db $00,$07,$20,$C2,$9E,$20,$D8,$9F   ;C2A08B|        |      ;
db $A9,$01,$0C,$BA,$03,$22,$B7,$B1   ;C2A093|        |      ;
db $82,$38,$60                       ;C2A09B|        |C200D6;

CODE_C2A09E:
TYA                                  ;C2A09E|98      |      ;
CLC                                  ;C2A09F|18      |      ;
ADC.B #$0A                           ;C2A0A0|690A    |      ;
CMP.W number_of_choies                          ;C2A0A2|CDC603  |8103C6;
BCC CODE_C2A0AA                      ;C2A0A5|9003    |C2A0AA;
db $82,$70,$FF                       ;C2A0A7|        |C2A01A;

CODE_C2A0AA:
TYX                                  ;C2A0AA|BB      |      ;
INY                                  ;C2A0AB|C8      |      ;
INY                                  ;C2A0AC|C8      |      ;
INY                                  ;C2A0AD|C8      |      ;
INY                                  ;C2A0AE|C8      |      ;
INY                                  ;C2A0AF|C8      |      ;
INY                                  ;C2A0B0|C8      |      ;
INY                                  ;C2A0B1|C8      |      ;
INY                                  ;C2A0B2|C8      |      ;
INY                                  ;C2A0B3|C8      |      ;
INY                                  ;C2A0B4|C8      |      ;
BRA CODE_C2A0E4                      ;C2A0B5|802D    |C2A0E4;

CODE_C2A0B7:
TYA                                  ;C2A0B7|98      |      ;
SEC                                  ;C2A0B8|38      |      ;
SBC.B #$0A                           ;C2A0B9|E90A    |      ;
BPL CODE_C2A0C0                      ;C2A0BB|1003    |C2A0C0;
db $82,$5A,$FF                       ;C2A0BD|        |C2A01A;

CODE_C2A0C0:
TYX                                  ;C2A0C0|BB      |      ;
DEY                                  ;C2A0C1|88      |      ;
DEY                                  ;C2A0C2|88      |      ;
DEY                                  ;C2A0C3|88      |      ;
DEY                                  ;C2A0C4|88      |      ;
DEY                                  ;C2A0C5|88      |      ;
DEY                                  ;C2A0C6|88      |      ;
DEY                                  ;C2A0C7|88      |      ;
DEY                                  ;C2A0C8|88      |      ;
DEY                                  ;C2A0C9|88      |      ;
DEY                                  ;C2A0CA|88      |      ;
BRA CODE_C2A0E4                      ;C2A0CB|8017    |C2A0E4;

CODE_C2A0CD:
TYA                                  ;C2A0CD|98      |      ;
INC A                                ;C2A0CE|1A      |      ;
CMP.W number_of_choies                          ;C2A0CF|CDC603  |8103C6;
BCC CODE_C2A0D7                      ;C2A0D2|9003    |C2A0D7;
db $82,$43,$FF                       ;C2A0D4|        |C2A01A;

CODE_C2A0D7:
TYX                                  ;C2A0D7|BB      |      ;
INY                                  ;C2A0D8|C8      |      ;
BRA CODE_C2A0E4                      ;C2A0D9|8009    |C2A0E4;

CODE_C2A0DB:
TYA                                  ;C2A0DB|98      |      ;
DEC A                                ;C2A0DC|3A      |      ;
BPL CODE_C2A0E2                      ;C2A0DD|1003    |C2A0E2;
db $82,$38,$FF                       ;C2A0DF|        |C2A01A;

CODE_C2A0E2:
TYX                                  ;C2A0E2|BB      |      ;
DEY                                  ;C2A0E3|88      |      ;

CODE_C2A0E4:
BRK #$07                             ;C2A0E4|0007    |      ;
PHY                                  ;C2A0E6|5A      |      ;
LDA.B ($56),Y                        ;C2A0E7|B156    |000056;
ORA.B #$80                           ;C2A0E9|0980    |      ;
STA.B ($56),Y                        ;C2A0EB|9156    |000056;
TXY                                  ;C2A0ED|9B      |      ;
LDA.B ($56),Y                        ;C2A0EE|B156    |000056;
AND.B #$7F                           ;C2A0F0|297F    |      ;
STA.B ($56),Y                        ;C2A0F2|9156    |000056;
STZ.W cursor_counter                          ;C2A0F4|9CC803  |8103C8;
PLY                                  ;C2A0F7|7A      |      ;
JSR.W CODE_C29ED4                    ;C2A0F8|20D49E  |C29ED4;
BRL CODE_C2A01A                      ;C2A0FB|821CFF  |C2A01A;

giveItem:
    PHP
    SEP #$20
    CMP.B #!GoatsFood
    BCS .is_item
    ; this codepath is taken for weapons, armor and magic
    XBA                                  ;C2A105|EB      |      ;
    LDA.B #$00                           ;C2A106|A900    |      ;
    XBA                                  ;C2A108|EB      |      ;
    TAY                                  ;C2A109|A8      |      ;
    DEY                                  ;C2A10A|88      |      ;
    STA.W Inventory.swords, Y                        ;C2A10B|991E1B  |811B1E;
    PLP                                  ;C2A10E|28      |      ;
    RTL                                  ;C2A10F|6B      |      ;

.is_item:
    XBA                                  ;C2A110|EB      |      ;
    LDA.B #$00                           ;C2A111|A900    |      ;
    XBA                                  ;C2A113|EB      |      ;
    TAY                                  ;C2A114|A8      |      ;
    DEY                                  ;C2A115|88      |      ;
    PHA                                  ;C2A116|48      |      ;
    LDA.W Inventory.swords, Y                        ;C2A117|B91E1B  |811B1E;
    PHA                                  ;C2A11A|48      |      ;
    AND.B #$80                           ;C2A11B|2980    |      ;
    ORA.B $02,S                          ;C2A11D|0302    |000002;
    STA.W $1B1E,Y                        ;C2A11F|991E1B  |811B1E;
    BPL .already_equipped                      ;C2A122|1005    |C2A129;
    AND.B #$7F
    STA.W Equipment.item

.already_equipped:
    PLA                                  ;C2A129|68      |      ;
    AND.B #$7F                           ;C2A12A|297F    |      ;
    CMP.B #!MedicalHerb                           ;C2A12C|C938    |      ;
    BNE .end                      ;C2A12E|D00A    |C2A13A;
    LDA.W player_max_health                          ;C2A130|AD8A1B  |811B8A;
    SEC                                  ;C2A133|38      |      ;
    SBC.W player_current_health                          ;C2A134|ED881B  |811B88;
    STA.W player_health_restore ;C2A137|8D4704  |810447;

.end:
    PLA                                  ;C2A13A|68      |      ;
    PLP                                  ;C2A13B|28      |      ;
    RTL                                  ;C2A13C|6B      |      ;

CODE_C2A13D:
STA.W number_of_choies                          ;C2A13D|8DC603  |8103C6;
XBA                                  ;C2A140|EB      |      ;
PHA                                  ;C2A141|48      |      ;
STZ.W cursor_counter                          ;C2A142|9CC803  |8103C8;

CODE_C2A145:
LDA.B #$2B                           ;C2A145|A92B    |      ;
STA.L L3_Text-!Row_Width,X                      ;C2A147|9FC06F7F|7F6FC0;
STA.L L3_Text,X                      ;C2A14B|9F00707F|7F7000;
LDA.B #$01                           ;C2A14F|A901    |      ;
TSB.W $03BA                          ;C2A151|0CBA03  |8103BA;

CODE_C2A154:
JSR.W advance_frame_and_read_lower_buttons                    ;C2A154|2069B1  |C2B169;
BEQ CODE_C2A15E                      ;C2A157|F005    |C2A15E;
JSR.W alternateCursor                    ;C2A159|2010A3  |C2A310;
BRA CODE_C2A154                      ;C2A15C|80F6    |C2A154;

CODE_C2A15E:
JSR.W advance_frame_and_read_lower_buttons                    ;C2A15E|2069B1  |C2B169;
BIT.B #$08                           ;C2A161|8908    |      ;
BNE CODE_C2A18A                      ;C2A163|D025    |C2A18A;
BIT.B #$04                           ;C2A165|8904    |      ;
BNE CODE_C2A19F                      ;C2A167|D036    |C2A19F;
BIT.B #$40                           ;C2A169|8940    |      ;
BNE CODE_C2A17B                      ;C2A16B|D00E    |C2A17B;
BIT.B #$80                           ;C2A16D|8980    |      ;
BNE CODE_C2A176                      ;C2A16F|D005    |C2A176;
JSR.W alternateCursor                    ;C2A171|2010A3  |C2A310;
BRA CODE_C2A15E                      ;C2A174|80E8    |C2A15E;

CODE_C2A176:
BRK #$07                             ;C2A176|0007    |      ;
CLC                                  ;C2A178|18      |      ;
BRA CODE_C2A17E                      ;C2A179|8003    |C2A17E;

CODE_C2A17B:
BRK #$07                             ;C2A17B|0007    |      ;
SEC                                  ;C2A17D|38      |      ;

CODE_C2A17E:
LDA.B #$2B                           ;C2A17E|A92B    |      ;
STA.L L3_Text-!Row_Width,X                      ;C2A180|9FC06F7F|7F6FC0;
STA.L L3_Text,X                      ;C2A184|9F00707F|7F7000;
PLA                                  ;C2A188|68      |      ;
RTS                                  ;C2A189|60      |      ;

CODE_C2A18A:
LDA.B $01,S                          ;C2A18A|A301    |000001;
BEQ CODE_C2A154                      ;C2A18C|F0C6    |C2A154;
DEC A                                ;C2A18E|3A      |      ;
STA.B $01,S                          ;C2A18F|8301    |000001;
TXY                                  ;C2A191|9B      |      ;
REP #$20                             ;C2A192|C220    |      ;
TYA                                  ;C2A194|98      |      ;
SEC                                  ;C2A195|38      |      ;
SEC                                  ;C2A196|38      |      ;
SBC.W #$0080                         ;C2A197|E98000  |      ;
TAY                                  ;C2A19A|A8      |      ;
SEP #$20                             ;C2A19B|E220    |      ;
BRA CODE_C2A1B4                      ;C2A19D|8015    |C2A1B4;

CODE_C2A19F:
LDA.B $01,S                          ;C2A19F|A301    |000001;
INC A                                ;C2A1A1|1A      |      ;
CMP.W number_of_choies                          ;C2A1A2|CDC603  |8103C6;
BCS CODE_C2A154                      ;C2A1A5|B0AD    |C2A154;
STA.B $01,S                          ;C2A1A7|8301    |000001;
TXY                                  ;C2A1A9|9B      |      ;
REP #$20                             ;C2A1AA|C220    |      ;
TYA                                  ;C2A1AC|98      |      ;
CLC                                  ;C2A1AD|18      |      ;
ADC.W #$0080                         ;C2A1AE|698000  |      ;
TAY                                  ;C2A1B1|A8      |      ;
SEP #$20                             ;C2A1B2|E220    |      ;

CODE_C2A1B4:
BRK #$07                             ;C2A1B4|0007    |      ;
LDA.B #$20                           ;C2A1B6|A920    |      ;
STA.L L3_Text-!Row_Width,X                      ;C2A1B8|9FC06F7F|7F6FC0;
STA.L L3_Text,X                      ;C2A1BC|9F00707F|7F7000;
STZ.W cursor_counter                          ;C2A1C0|9CC803  |8103C8;
TYX                                  ;C2A1C3|BB      |      ;
LDA.W $043B                          ;C2A1C4|AD3B04  |81043B;
BEQ CODE_C2A1DB                      ;C2A1C7|F012    |C2A1DB;
db $A3,$01,$C9,$03,$D0,$03,$82,$73   ;C2A1C9|        |000001;
db $FF,$20,$4B,$9D,$9C,$3B,$04,$82   ;C2A1D1|        |9D4B20;
db $6A,$FF                           ;C2A1D9|        |      ;

CODE_C2A1DB:
LDA.B $01,S                          ;C2A1DB|A301    |000001;
CMP.B #$03                           ;C2A1DD|C903    |      ;
BEQ CODE_C2A1E4                      ;C2A1DF|F003    |C2A1E4;
BRL CODE_C2A145                      ;C2A1E1|8261FF  |C2A145;

CODE_C2A1E4:
JSR.W CODE_C29D7B                    ;C2A1E4|207B9D  |C29D7B;
INC.W $043B                          ;C2A1E7|EE3B04  |81043B;
BRL CODE_C2A145                      ;C2A1EA|8258FF  |C2A145;

CODE_C2A1ED:
    PHX
    SEP #$20
    STA.W number_of_choies
    XBA
    PHA

.loop:
    LDA.B 1, S
    REP #$20
    AND.W #$FF
    ASL
    TAX
    LDA.L .data, X
    TAX
    SEP #$20
    STZ.W cursor_counter
    LDA.B #'+'
    STA.L L3_Text - !Row_Width, X
    STA.L L3_Text, X
    LDA.B #$01
    TSB.W _03BA

.wait_for_key_release:
    JSR.W advance_frame_and_read_lower_buttons
    BEQ .key_pressed
    JSR.W alternateCursor
    BRA .wait_for_key_release

.key_pressed:
    JSR.W advance_frame_and_read_lower_buttons
    BIT.B #!Key8_Up   : BNE .pressed_up
    BIT.B #!Key8_Down : BNE .pressed_down
    BIT.B #!Key8_Y    : BNE .pressed_y
    BIT.B #!Key8_B    : BNE .pressed_b
    JSR.W alternateCursor
    BRA .key_pressed

.pressed_b:
    BRK #$18
    CLC
    LDA.B #'+'
    STA.L L3_Text - !Row_Width, X
    STA.L L3_Text, X
    BRA .end

.pressed_y:
    BRK #$7
    SEC
    LDA.B #' '
    STA.L L3_Text - !Row_Width, X
    STA.L L3_Text, X
.end:
    PLA
    PLX
    REP #$20
    RTL

.pressed_up:
    LDA.B 1, S
    BEQ .wait_for_key_release
    DEC
    STA.B 1, S
    BRA .update_l3

.pressed_down:
    LDA.B 1, S
    INC A
    CMP.W number_of_choies
    BCS .wait_for_key_release
    STA.B 1, S

.update_l3:
    BRK #$07
    LDA.B #' '
    STA.L L3_Text - !Row_Width,X
    STA.L L3_Text,X
    BRL .loop

.data:
    dw $02CA,$038A,$044A,$050A,$05CA

;;; A contains the number of choices
;;; X contains the position on the screen to display the box
;;; Y contains the pointer to the text to display
;;;
;;; returns two things:
;;;  1. The carry bit is set if the dialog has been aborted by pressing the Y Key, else it's clear.
;;;  2. In register A the index of the choice is returned
printAndRunChoiceBox:
    STA.W number_of_choies
    XBA
    PHA
    STZ.W cursor_counter

.begin:
    LDA.B #'▶' ; pointee for the current choice
    STA.L L3_Text-!Row_Width,X
    STA.L L3_Text, X
    LDA.B #$01
    TSB.W $03BA

.loop:
.wait_for_button_release:
    JSR.W advance_frame_and_read_lower_buttons
    BEQ .wait_for_button_press
    JSR.W alternateCursor
    BRA .wait_for_button_release

.wait_for_button_press:
    JSR.W advance_frame_and_read_lower_buttons
    BIT.B #!Key8_Up
    BNE .pressed_up
    BIT.B #!Key8_Down
    BNE .pressed_down
    BIT.B #!Key8_Y
    BNE .pressed_y
    BIT.B #!Key8_B
    BNE .pressed_b
    JSR.W alternateCursor
    BRA .wait_for_button_press

.pressed_b:
    %PlaySound(!Sound_DiaglogConfirm)
    CLC
    BRA .return

.pressed_y:
    %PlaySound(!Sound_MenuBeep)
    SEC

.return:
    LDA.B #'▶'
    STA.L L3_Text-!Row_Width,X
    STA.L L3_Text,X
    PLA
    RTL

.pressed_up:
    LDA.B 1, S
    BEQ .loop ; don't wrap up, but return if it's zero
    DEC
    STA.B 1, S ; decrement the index
    TXY
    REP #$20
    TYA
    SEC
    SEC
    SBC.W #!Row_Width*2
    TAY
    SEP #$20
    BRA .cursor_moved

.pressed_down:
    LDA.B 1, S
    INC A
    CMP.W number_of_choies
    BCS .loop ; don't go beyond the last choice
    STA.B 1, S ; increment the index
    TXY
    REP #$20
    TYA
    CLC
    ADC.W #!Row_Width*2
    TAY
    SEP #$20

.cursor_moved:
    %PlaySound(!Sound_MenuBeep)
    LDA.B #' '
    STA.L L3_Text-!Row_Width,X
    STA.L L3_Text,X
    STZ.W cursor_counter ; reset the cursor counter
    TYX
    BRL .begin

alternateCursor:
    LDA.W cursor_counter
    AND.B #$1F ; keep it below 32
    CMP.B #$18 ; compare it, so to make a ~80% on/off time
    BCC .show_cursor
    LDA.B #' '
    BRA .put_on_l3

.show_cursor:
    LDA.B #'▶'

.put_on_l3:
    STA.L L3_Text-!Row_Width, X
    STA.L L3_Text, X
    INC.W cursor_counter
    LDA.B #$01
    TSB.W $03BA
    RTS

PHP                                  ;C2A330|08      |      ;
SEP #$20                             ;C2A331|E220    |      ;
LDA.B #$5C                           ;C2A333|A95C    |      ;
STA.W BG2SC                          ;C2A335|8D0821  |812108;
LDA.B #$20                           ;C2A338|A920    |      ;
STA.W BG12NBA                          ;C2A33A|8D0B21  |81210B;
LDA.B #$06                           ;C2A33D|A906    |      ;
STA.W TM                          ;C2A33F|8D2C21  |81212C;
STZ.W CGADSUB                          ;C2A342|9C3121  |812131;
LDA.B #$09                           ;C2A345|A909    |      ;
STA.W BGMODE                          ;C2A347|8D0521  |812105;
JSR.W CODE_C2A41B                    ;C2A34A|201BA4  |C2A41B;
JSR.W CODE_C2A442                    ;C2A34D|2042A4  |C2A442;
JSR.W CODE_C2A395                    ;C2A350|2095A3  |C2A395;
PLP                                  ;C2A353|28      |      ;
RTL                                  ;C2A354|6B      |      ;

clearOsd:
    PHP
    PHB
    SEP #$20
    LDA.B #$7F ; load bank $7F
    PHA
    PLB
    REP #$20
    LDA.W #$2000 ; transparent whitespace
    LDX.W #$07FE ; total screen length

-:
    STA.W L3_Text, X
    DEX
    DEX
    BPL -
    LDA.W #1
    TSB.W $03BA
    PLB
    PLP
    RTS

CODE_C2A375:
    PHP
    PHB
    SEP #$20
    LDA.B #$7F ; load bank $7F
    PHA
    PLB
    REP #$20
    LDA.W #$2000 ; transparent whitespace
    LDX.W #$3FE ; upper half of the screen

-:
    STA.W L3_Text, X
    DEX
    DEX
    BPL -
    LDA.W #1
    TSB.W $03BA
    PLB
    PLP
    RTS

CODE_C2A395:
PHP                                  ;C2A395|08      |      ;
PHB                                  ;C2A396|8B      |      ;
LDA.B #$7F                           ;C2A397|A97F    |      ;
PHA                                  ;C2A399|48      |      ;
PLB                                  ;C2A39A|AB      |      ;
REP #$20                             ;C2A39B|C220    |      ;
LDY.W #$F200                         ;C2A39D|A000F2  |      ;
STY.B $00                            ;C2A3A0|8400    |000000;
LDA.W #$0089                         ;C2A3A2|A98900  |      ;
STA.B $02                            ;C2A3A5|8502    |000002;
LDY.W #$0000                         ;C2A3A7|A00000  |      ;

CODE_C2A3AA:
LDA.B [$00]                          ;C2A3AA|A700    |000000;
INC.B $00                            ;C2A3AC|E600    |000000;
AND.W #$00FF                         ;C2A3AE|29FF00  |      ;
ASL A                                ;C2A3B1|0A      |      ;
ASL A                                ;C2A3B2|0A      |      ;
ASL A                                ;C2A3B3|0A      |      ;
TAX                                  ;C2A3B4|AA      |      ;
LDA.L UNREACH_898800,X               ;C2A3B5|BF008889|898800;
STA.W $7800,Y                        ;C2A3B9|990078  |7F7800;
LDA.L UNREACH_898802,X               ;C2A3BC|BF028889|898802;
STA.W $7802,Y                        ;C2A3C0|990278  |7F7802;
LDA.L UNREACH_898804,X               ;C2A3C3|BF048889|898804;
STA.W $7840,Y                        ;C2A3C7|994078  |7F7840;
LDA.L UNREACH_898806,X               ;C2A3CA|BF068889|898806;
STA.W $7842,Y                        ;C2A3CE|994278  |7F7842;
INY                                  ;C2A3D1|C8      |      ;
INY                                  ;C2A3D2|C8      |      ;
INY                                  ;C2A3D3|C8      |      ;
INY                                  ;C2A3D4|C8      |      ;
TYA                                  ;C2A3D5|98      |      ;
AND.W #$003F                         ;C2A3D6|293F00  |      ;
BNE CODE_C2A3AA                      ;C2A3D9|D0CF    |C2A3AA;
TYA                                  ;C2A3DB|98      |      ;
CLC                                  ;C2A3DC|18      |      ;
ADC.W #$0040                         ;C2A3DD|694000  |      ;
TAY                                  ;C2A3E0|A8      |      ;
CPY.W #$0800                         ;C2A3E1|C00008  |      ;
BNE CODE_C2A3AA                      ;C2A3E4|D0C4    |C2A3AA;
PLB                                  ;C2A3E6|AB      |      ;
LDA.W #$0002                         ;C2A3E7|A90200  |      ;
TSB.W $03BA                          ;C2A3EA|0CBA03  |8103BA;
PLP                                  ;C2A3ED|28      |      ;
RTS                                  ;C2A3EE|60      |      ;

CODE_C2A3EF:
PHP                                  ;C2A3EF|08      |      ;
PHX                                  ;C2A3F0|DA      |      ;
REP #$20                             ;C2A3F1|C220    |      ;
LDX.W #$01FE                         ;C2A3F3|A2FE01  |      ;

CODE_C2A3F6:
LDA.L $7F0000,X                      ;C2A3F6|BF00007F|7F0000;
STA.L $7E6000,X                      ;C2A3FA|9F00607E|7E6000;
DEX                                  ;C2A3FE|CA      |      ;
DEX                                  ;C2A3FF|CA      |      ;
BPL CODE_C2A3F6                      ;C2A400|10F4    |C2A3F6;
PLX                                  ;C2A402|FA      |      ;
PLP                                  ;C2A403|28      |      ;
RTS                                  ;C2A404|60      |      ;

CODE_C2A405:
PHP                                  ;C2A405|08      |      ;
PHX                                  ;C2A406|DA      |      ;
REP #$20                             ;C2A407|C220    |      ;
LDX.W #$01FE                         ;C2A409|A2FE01  |      ;

CODE_C2A40C:
LDA.L $7E6000,X                      ;C2A40C|BF00607E|7E6000;
STA.L $7F0000,X                      ;C2A410|9F00007F|7F0000;
DEX                                  ;C2A414|CA      |      ;
DEX                                  ;C2A415|CA      |      ;
BPL CODE_C2A40C                      ;C2A416|10F4    |C2A40C;
PLX                                  ;C2A418|FA      |      ;
PLP                                  ;C2A419|28      |      ;
RTS                                  ;C2A41A|60      |      ;

CODE_C2A41B:
LDX.W #$2000                         ;C2A41B|A20020  |      ;
STX.W VMADDL                          ;C2A41E|8E1621  |812116;
LDA.B #$01                           ;C2A421|A901    |      ;
STA.W DMAP0                          ;C2A423|8D0043  |814300;
LDA.B #$18                           ;C2A426|A918    |      ;
STA.W BBAD0                          ;C2A428|8D0143  |814301;
LDX.W #$B000                         ;C2A42B|A200B0  |      ;
STX.W A1T0L                          ;C2A42E|8E0243  |814302;
LDA.B #$89                           ;C2A431|A989    |      ;
STA.W A1B0                          ;C2A433|8D0443  |814304;
LDX.W #$2000                         ;C2A436|A20020  |      ;
STX.W DAS0L                          ;C2A439|8E0543  |814305;
LDA.B #$01                           ;C2A43C|A901    |      ;
STA.W MDMAEN                          ;C2A43E|8D0B42  |81420B;
RTS                                  ;C2A441|60      |      ;

CODE_C2A442:
PHB                                  ;C2A442|8B      |      ;
REP #$20                             ;C2A443|C220    |      ;
LDX.W #$F100                         ;C2A445|A200F1  |      ;
LDY.W #$0000                         ;C2A448|A00000  |      ;
LDA.W #$00FF                         ;C2A44B|A9FF00  |      ;
MVN $7F,$89                          ;C2A44E|547F89  |      ;
SEP #$20                             ;C2A451|E220    |      ;
PLB                                  ;C2A453|AB      |      ;
RTS                                  ;C2A454|60      |      ;

CODE_C2A455:
PHB                                  ;C2A455|8B      |      ;
REP #$20                             ;C2A456|C220    |      ;
LDX.W #$F000                         ;C2A458|A200F0  |      ;
LDY.W #$0000                         ;C2A45B|A00000  |      ;
LDA.W #$00FF                         ;C2A45E|A9FF00  |      ;
MVN $7F,$89                          ;C2A461|547F89  |      ;
SEP #$20                             ;C2A464|E220    |      ;
PLB                                  ;C2A466|AB      |      ;
RTS                                  ;C2A467|60      |      ;
LDX.W #$2000                         ;C2A468|A20020  |      ;
STX.W VMADDL                          ;C2A46B|8E1621  |812116;
LDA.B #$01                           ;C2A46E|A901    |      ;
STA.W DMAP0                          ;C2A470|8D0043  |814300;
LDA.B #$18                           ;C2A473|A918    |      ;
STA.W BBAD0                          ;C2A475|8D0143  |814301;
LDX.W #$C000                         ;C2A478|A200C0  |      ;
STX.W A1T0L                          ;C2A47B|8E0243  |814302;
LDA.B #$7F                           ;C2A47E|A97F    |      ;
STA.W A1B0                          ;C2A480|8D0443  |814304;
LDX.W #$2000                         ;C2A483|A20020  |      ;
STX.W DAS0L                          ;C2A486|8E0543  |814305;
LDA.B #$01                           ;C2A489|A901    |      ;
STA.W MDMAEN                          ;C2A48B|8D0B42  |81420B;
PHB                                  ;C2A48E|8B      |      ;
REP #$20                             ;C2A48F|C220    |      ;
LDX.W #$F300                         ;C2A491|A200F3  |      ;
LDY.W #$0160                         ;C2A494|A06001  |      ;
LDA.W #$009F                         ;C2A497|A99F00  |      ;
MVN $7F,$89                          ;C2A49A|547F89  |      ;
SEP #$20                             ;C2A49D|E220    |      ;
PLB                                  ;C2A49F|AB      |      ;
RTL                                  ;C2A4A0|6B      |      ;

CODE_C2A4A1:
PHP                                  ;C2A4A1|08      |      ;
REP #$20                             ;C2A4A2|C220    |      ;
LDA.W Equipment.magic                          ;C2A4A4|AD621B  |811B62;
SEC                                  ;C2A4A7|38      |      ;
SBC.W #$0011                         ;C2A4A8|E91100  |      ;
CMP.W #$0008                         ;C2A4AB|C90800  |      ;
BCS CODE_C2A4F1                      ;C2A4AE|B041    |C2A4F1;
PHA                                  ;C2A4B0|48      |      ;
ASL A                                ;C2A4B1|0A      |      ;
CLC                                  ;C2A4B2|18      |      ;
ADC.B $01,S                          ;C2A4B3|6301    |000001;
PLX                                  ;C2A4B5|FA      |      ;
TAX                                  ;C2A4B6|AA      |      ;
SEP #$20                             ;C2A4B7|E220    |      ;
LDY.W #$2600                         ;C2A4B9|A00026  |      ;
STY.W VMADDL                          ;C2A4BC|8C1621  |812116;
LDA.B #$01                           ;C2A4BF|A901    |      ;
STA.W DMAP0                          ;C2A4C1|8D0043  |814300;
LDA.B #$18                           ;C2A4C4|A918    |      ;
STA.W BBAD0                          ;C2A4C6|8D0143  |814301;
LDY.W UNREACH_81FB88,X               ;C2A4C9|BC88FB  |81FB88;
STY.W A1T0L                          ;C2A4CC|8C0243  |814302;
LDA.W UNREACH_81FB8A,X               ;C2A4CF|BD8AFB  |81FB8A;
STA.W A1B0                          ;C2A4D2|8D0443  |814304;
LDY.W #$0800                         ;C2A4D5|A00008  |      ;
STY.W DAS0L                          ;C2A4D8|8C0543  |814305;
LDA.B #$01                           ;C2A4DB|A901    |      ;
STA.W MDMAEN                          ;C2A4DD|8D0B42  |81420B;
REP #$20                             ;C2A4E0|C220    |      ;
PHB                                  ;C2A4E2|8B      |      ;
LDA.W UNREACH_81FBA0,X               ;C2A4E3|BDA0FB  |81FBA0;
TAX                                  ;C2A4E6|AA      |      ;
LDY.W #$0160                         ;C2A4E7|A06001  |      ;
LDA.W #$001F                         ;C2A4EA|A91F00  |      ;
MVN $7F,$8F                          ;C2A4ED|547F8F  |      ;
PLB                                  ;C2A4F0|AB      |      ;

CODE_C2A4F1:
PLP                                  ;C2A4F1|28      |      ;
RTL                                  ;C2A4F2|6B      |      ;

EnterPlayerName:
    PHP
    PHX
    PHY
    SEP #$20
    STZ.W $044D
    STZ.W $044F
    LDX.W #number_of_choies
    LDY.W #player_name

.find_null:
    LDA.W 0, Y      ; load first character of name
    BEQ .enter_loop ; and check if it's null (so an empty string)
    INY             ; if not, increment Y
    BRA .find_null  ; until we found a null byte

.enter_loop:
    %PlaySound(!Sound_MenuBeep)

.loop_wo_beep:
    PHX
    PHY
    LDY.W #txt_enter_player_name
    JSL.L printOsdStringFromBank2
    LDY.W #txt_enter_player_name_alphabet
    JSL.L printOsdStringFromBank2
    PLY
    PLX
    LDA.B #'+'
    STA.L L3_Text, X
    STA.L L3_Text-!Row_Width, X

.wait_key_release:
    JSR.W advance_frame_and_read_lower_buttons
    CMP.B #$00
    BNE .wait_key_release

.key_loop:
    JSR.W advance_frame_and_read_lower_buttons
    LSR A
    BCC + : BRL .pressed_right : +
    LSR A
    BCC + : BRL .pressed_left : +
    LSR A
    BCC + : BRL .pressed_down : +
    LSR A
    BCC + : BRL .pressed_up : +
    LSR A
    BCC + : BRL .pressed_start : +
    LSR A
    LSR A
    BCC + : BRL .pressed_y : +
    LSR A
    BCC + : BRL .pressed_b : +
    BRA .key_loop

.pressed_up:
    LDA.W player_name_dialog_y
    ; is it zero? Wrap top to bottom
    BEQ ..wrap_around
    DEC.W player_name_dialog_y
    CMP.B #$02
    BEQ ..skip_first_gap
    CMP.B #$04
    BNE ..skip_second_gap

..skip_first_gap:
    REP #$20
    TXA
    SEC
    SBC.W #!Row_Width
    TAX

..skip_second_gap:
    REP #$20
    TXA
    SEC
    SBC.W #!Row_Width * 2
    TAX
    SEP #$20
    BRL .enter_loop

..wrap_around:
    LDA.B #$04
    STA.W player_name_dialog_y
    REP #$20
    TXA
    CLC
    ADC.W #!Row_Width * 10
    TAX
    SEP #$20
    BRL .enter_loop

.pressed_down:
    LDA.W player_name_dialog_y
    CMP.B #$04
    BCS   ..wrap_around
    INC.W player_name_dialog_y
    CMP.B #$01
    BEQ ..skip_first_gap
    CMP.B #$03
    BNE ..skip_second_gap

..skip_first_gap:
    REP #$20
    TXA
    CLC
    ADC.W #!Row_Width
    TAX

..skip_second_gap:
    REP #$20
    TXA
    CLC
    ADC.W #!Row_Width * 2
    TAX
    SEP #$20
    BRL .enter_loop

..wrap_around:
    STZ.W player_name_dialog_y
    REP #$20
    TXA
    SEC
    SBC.W #!Row_Width * 10
    TAX
    SEP #$20
    BRL .enter_loop

.pressed_left:
    LDA.W player_name_dialog_x
    BEQ ..wrap_around
    DEC.W player_name_dialog_x
    DEX #4
    BRL .enter_loop

..wrap_around:
    LDA.B #$0C
    STA player_name_dialog_x
    REP #$20
    TXA
    CLC
    ADC.W #$0C * 4
    TAX
    SEP #$20
    BRL .enter_loop

.pressed_right:
    LDA.W player_name_dialog_x
    ; did we exceed the line length of 12?
    CMP.B #$0C
    BCS ..wrap_around
    INC.W player_name_dialog_x
    INX #4
    BRL .enter_loop

..wrap_around:
    STZ.W player_name_dialog_x
    REP #$20
    TXA
    SEC
    SBC.W #$0C * 4
    TAX
    SEP #$20
    BRL .enter_loop

;; Y is for deleting the last char
.pressed_y:
    ; check if we have any chars to delete
    ; by comparing if Y is equal to the player_name pointer
    ; if yes, we can't delete any chars and return to the loop
    CPY.W #player_name
    BNE + : BRL .key_loop : +
    ; delete the last char
    ; just decrement y and add a terminating 0 byte
    DEY
    LDA.B #0
    STA.W 0, Y
    BRL .enter_loop

.pressed_b:
    LDA.L L3_Text+2, X
    ; enter key
    CMP.B #$23
    BEQ .pressed_start
    ; backspace key
    CMP.B #$24
    BEQ .pressed_y
    CPY.W #player_name+8
    BCC + : BRL .key_loop : +
    LDA.L L3_Text+2, X
    STA.W 0, Y
    INY
    %PlaySound(!Sound_DiaglogConfirm)
    BRL .loop_wo_beep

.pressed_start:
    CPY.W #player_name
    ; check if we have entered at least one char
    BNE + : BRL .key_loop : +
    ; add terminating zero byte
    LDA.B #$00
    STA.W 0, Y
    LDY.W #txt_clear_enter_player_name_box
    JSL.L printOsdStringFromBank2
    JSR.W advance_frame_and_read_lower_buttons
    PLY
    PLX
    PLP
    RTL

update_hud:
    LDA.W current_map_number
    SEC
    SBC.B #$0F
    CMP.B #$04
    BCS +
    BRL .end

+:
    LDA.W displayEnemeyHealthCounter
    BEQ .enemy_dead
    BPL .dec_counter
    ; I think it is doint it, because it will also display the "dead" health bar
    DEC A
    BMI .next
    LDY.W #enemy_life
    BRA .print_it

.enemy_dead:
    LDY.W #enemy_life_delete

.print_it:
    JSL.L printOsdStringFromBank2

.dec_counter:
    DEC.W displayEnemeyHealthCounter
    DEC.W displayEnemeyHealthCounter

.next:
    JSL.L RestoreHealth
    JSL.L IncrementExpPerTick
    LDA.W display_hud_bitfield
    ; if it's zero, let's skip the rest
    BEQ .end
    LSR.W display_hud_bitfield
    BCC .checkExp
    ; let's print the general layout
    LDY.W #hud_lev_exp_gem
    JSL.L printOsdStringFromBank2

.checkExp:
    LSR.W display_hud_bitfield
    BCC .checkHealth
    LDY.W #hud_exp
    JSL.L printOsdStringFromBank2

.checkHealth:
    LSR.W display_hud_bitfield
    BCC .checkLvl
    LDY.W #hud_health
    JSL.L printOsdStringFromBank2

.checkLvl:
    LSR.W display_hud_bitfield
    BCC .checkGold
    LDY.W #hud_level
    JSL.L printOsdStringFromBank2

.checkGold:
    LSR.W display_hud_bitfield
    BCC .end
    LDY.W #hud_gold
    JSL.L printOsdStringFromBank2

.end:
    STZ.W display_hud_bitfield
    RTL

db $08,$8B,$E2,$20,$A9,$82,$48,$AB   ;C2A6D4|        |      ;
db $A2,$02,$07,$DA,$B9,$00,$00,$D0   ;C2A6DC|        |      ;
db $03,$82,$68,$00,$C8,$C9,$0D,$F0   ;C2A6E4|        |000082;
db $29,$DA,$48,$9F,$00,$70,$7F,$A9   ;C2A6EC|        |      ;
db $21,$9F,$01,$70,$7F,$C2,$20,$8A   ;C2A6F4|        |00009F;
db $18,$69,$40,$00,$29,$FF,$07,$AA   ;C2A6FC|        |      ;
db $E2,$20,$68,$9F,$00,$70,$7F,$A9   ;C2A704|        |      ;
db $20,$9F,$01,$70,$7F,$FA,$E8,$E8   ;C2A70C|        |C2019F;
db $80,$CA,$A9,$01,$0C,$BA,$03,$A9   ;C2A714|        |C2A6E0;
db $20,$EE,$88,$03,$22,$E5,$81,$80   ;C2A71C|        |C288EE;
db $3A,$D0,$F6,$C2,$20,$68,$18,$69   ;C2A724|        |      ;
db $00,$01,$29,$FF,$07,$AA,$48,$E2   ;C2A72C|        |      ;
db $20,$DA,$A9,$80,$85,$0C,$A9,$00   ;C2A734|        |C2A9DA;
db $9F,$00,$70,$7F,$A9,$20,$9F,$01   ;C2A73C|        |7F7000;
db $70,$7F,$E8,$E8,$C6,$0C,$D0,$EE   ;C2A744|        |C2A7C5;
db $FA,$82,$90,$FF,$FA,$AB,$28,$6B   ;C2A74C|        |      ;

incsrc "bankC2/printosd2.asm"
incsrc "bankC2/printosdX.asm"

CODE_C2AF59:
    LDA.W 0, Y
    BMI .do_lookup ; do a lookup if the high bit ($80) is set
    INY
    CMP.B #' '
    BNE .end
    LDA.L L3_Text,X
    CMP.B #$08
    BEQ CODE_C2AF59

.end:
    RTS

.do_lookup:
    INY
    PHB
    PHY
    REP #$20
    AND.W #datasize(Words_LUT)/!WORDLUT_ENTRY_SIZE-1
    PHA
    ASL A
    CLC
    ADC.B 1, S
    ASL A
    ASL A
    TAY
    PLA
    SEP #$20
    LDA.B #$86
    PHA
    PLB
    LDA.B #$0C
    STA.B $14
    LDA.W $03EB
    XBA

.print_loop:
    LDA.W Words_LUT, Y
    BEQ ..break
    INY
    ORA.W $03FB
    REP #$20
    STA.L L3_Text, X
    INX
    INX
    BIT.W #$0200
    BNE +
    ORA.W #$0100
    STA.L $7F6FBE, X
    AND.W #$FEFF

+:
    SEP #$20
    JSR.W print_string_with_delay
    DEC.B $14
    BNE .print_loop

..break:
    LDA.L L3_Text, X
    CMP.B #$08
    BEQ .out
    LDA.B #$20
    ORA.W $03FB
    REP #$20
    STA.L L3_Text, X
    INX
    INX
    BIT.W #$0200
    BNE .out
    ORA.W #$0100
    STA.L $7F6FBE, X
    AND.W #$FEFF

.out:
    SEP #$20
    PLY
    PLB
    BRL CODE_C2AF59

CODE_C2AFDF:
LDA.W $0000,Y                        ;C2AFDF|B90000  |820000;
BMI CODE_C2B009                      ;C2AFE2|3025    |C2B009;
BNE CODE_C2AFE7                      ;C2AFE4|D001    |C2AFE7;
RTS                                  ;C2AFE6|60      |      ;

CODE_C2AFE7:
INY                                  ;C2AFE7|C8      |      ;
ORA.W $03FB                          ;C2AFE8|0DFB03  |8203FB;
REP #$20                             ;C2AFEB|C220    |      ;
STA.L L3_Text,X                      ;C2AFED|9F00707F|7F7000;
INX                                  ;C2AFF1|E8      |      ;
INX                                  ;C2AFF2|E8      |      ;
BIT.W #$0200                         ;C2AFF3|890002  |      ;
BNE CODE_C2B002                      ;C2AFF6|D00A    |C2B002;
ORA.W #$0100                         ;C2AFF8|090001  |      ;
STA.L $7F6FBE,X                      ;C2AFFB|9FBE6F7F|7F6FBE;
AND.W #$FEFF                         ;C2AFFF|29FFFE  |      ;

CODE_C2B002:
SEP #$20                             ;C2B002|E220    |      ;
JSR.W print_string_with_delay                    ;C2B004|2024B1  |C2B124;
BRA CODE_C2AFDF                      ;C2B007|80D6    |C2AFDF;

CODE_C2B009:
JSR.W CODE_C2AF59                    ;C2B009|2059AF  |C2AF59;
DEY                                  ;C2B00C|88      |      ;
BRA CODE_C2AFDF                      ;C2B00D|80D0    |C2AFDF;
db $C2,$20,$AE,$ED,$03,$AD,$F1,$03   ;C2B00F|        |      ;
db $85,$0E,$AD,$EF,$03,$85,$0C,$DA   ;C2B017|        |00000E;
db $A9,$20,$20,$9F,$00,$70,$7F,$E8   ;C2B01F|        |      ;
db $E8,$C6,$0C,$D0,$F6,$FA,$8A,$18   ;C2B027|        |      ;
db $69,$40,$00,$AA,$C6,$0E,$D0,$E2   ;C2B02F|        |      ;
db $E2,$20,$60                       ;C2B037|        |      ;

CODE_C2B03A:
LDA.B #$3D                           ;C2B03A|A93D    |      ;

CODE_C2B03C:
STA.L L3_Text,X                      ;C2B03C|9F00707F|7F7000;
LDA.B #$01                           ;C2B040|A901    |      ;
STA.W $03BA                          ;C2B042|8DBA03  |8003BA;
JSR.W CODE_C2B161                    ;C2B045|2061B1  |C2B161;
BIT.B #$C0                           ;C2B048|89C0    |      ;
BEQ CODE_C2B069                      ;C2B04A|F01D    |C2B069;
LDA.W _0312                          ;C2B04C|AD1203  |800312;
AND.B #$10                           ;C2B04F|2910    |      ;
BNE CODE_C2B03A                      ;C2B051|D0E7    |C2B03A;
LDA.B #$20                           ;C2B053|A920    |      ;
BRA CODE_C2B03C                      ;C2B055|80E5    |C2B03C;

CODE_C2B057:
LDA.B #$3D                           ;C2B057|A93D    |      ;

CODE_C2B059:
STA.L L3_Text,X                      ;C2B059|9F00707F|7F7000;
LDA.B #$01                           ;C2B05D|A901    |      ;
STA.W $03BA                          ;C2B05F|8DBA03  |8003BA;
JSR.W CODE_C2B161                    ;C2B062|2061B1  |C2B161;
BIT.B #$C0                           ;C2B065|89C0    |      ;
BNE CODE_C2B074                      ;C2B067|D00B    |C2B074;

CODE_C2B069:
LDA.W _0312                          ;C2B069|AD1203  |800312;
AND.B #$10                           ;C2B06C|2910    |      ;
BNE CODE_C2B057                      ;C2B06E|D0E7    |C2B057;
LDA.B #$20                           ;C2B070|A920    |      ;
BRA CODE_C2B059                      ;C2B072|80E5    |C2B059;

CODE_C2B074:
LDA.B #$20                           ;C2B074|A920    |      ;
STA.L L3_Text,X                      ;C2B076|9F00707F|7F7000;
LDA.B #$01                           ;C2B07A|A901    |      ;
STA.W $03BA                          ;C2B07C|8DBA03  |8003BA;
RTS                                  ;C2B07F|60      |      ;

CODE_C2B080:
REP #$20                             ;C2B080|C220    |      ;
PHX                                  ;C2B082|DA      |      ;
LDX.W $03ED                          ;C2B083|AEED03  |8003ED;
LDA.W $03F1                          ;C2B086|ADF103  |8003F1;
SEC                                  ;C2B089|38      |      ;
SBC.W #$0003                         ;C2B08A|E90300  |      ;
BEQ CODE_C2B0B0                      ;C2B08D|F021    |C2B0B0;
STA.B $0E                            ;C2B08F|850E    |00000E;

CODE_C2B091:
LDA.W $03EF                          ;C2B091|ADEF03  |8003EF;
STA.B $0C                            ;C2B094|850C    |00000C;
PHX                                  ;C2B096|DA      |      ;

CODE_C2B097:
LDA.L $7F7080,X                      ;C2B097|BF80707F|7F7080;
STA.L L3_Text,X                      ;C2B09B|9F00707F|7F7000;
INX                                  ;C2B09F|E8      |      ;
INX                                  ;C2B0A0|E8      |      ;
DEC.B $0C                            ;C2B0A1|C60C    |00000C;
BNE CODE_C2B097                      ;C2B0A3|D0F2    |C2B097;
PLX                                  ;C2B0A5|FA      |      ;
TXA                                  ;C2B0A6|8A      |      ;
CLC                                  ;C2B0A7|18      |      ;
ADC.W #$0040                         ;C2B0A8|694000  |      ;
TAX                                  ;C2B0AB|AA      |      ;
DEC.B $0E                            ;C2B0AC|C60E    |00000E;
BNE CODE_C2B091                      ;C2B0AE|D0E1    |C2B091;

CODE_C2B0B0:
LDA.W $03EF                          ;C2B0B0|ADEF03  |8003EF;
STA.B $0C                            ;C2B0B3|850C    |00000C;
LDA.W #$2020                         ;C2B0B5|A92020  |      ;

CODE_C2B0B8:
STA.L L3_Text,X                      ;C2B0B8|9F00707F|7F7000;
STA.L $7F7040,X                      ;C2B0BC|9F40707F|7F7040;
INX                                  ;C2B0C0|E8      |      ;
INX                                  ;C2B0C1|E8      |      ;
DEC.B $0C                            ;C2B0C2|C60C    |00000C;
BNE CODE_C2B0B8                      ;C2B0C4|D0F2    |C2B0B8;
PLX                                  ;C2B0C6|FA      |      ;
SEP #$20                             ;C2B0C7|E220    |      ;
RTS                                  ;C2B0C9|60      |      ;

CODE_C2B0CA:
PHX                                  ;C2B0CA|DA      |      ;
PHY                                  ;C2B0CB|5A      |      ;
LDA.L $7F6FFE,X                      ;C2B0CC|BFFE6F7F|7F6FFE;
CMP.B #$07                           ;C2B0D0|C907    |      ;
BEQ CODE_C2B0D8                      ;C2B0D2|F004    |C2B0D8;
db $CA,$CA,$80,$F4                   ;C2B0D4|        |      ;

CODE_C2B0D8:
LDA.L L3_Text-!Row_Width,X                      ;C2B0D8|BFC06F7F|7F6FC0;
CMP.B #$03                           ;C2B0DC|C903    |      ;
BEQ CODE_C2B0EC                      ;C2B0DE|F00C    |C2B0EC;
REP #$20                             ;C2B0E0|C220    |      ;
TXA                                  ;C2B0E2|8A      |      ;
SEC                                  ;C2B0E3|38      |      ;
SBC.W #$0040                         ;C2B0E4|E94000  |      ;
TAX                                  ;C2B0E7|AA      |      ;
SEP #$20                             ;C2B0E8|E220    |      ;
BRA CODE_C2B0D8                      ;C2B0EA|80EC    |C2B0D8;

CODE_C2B0EC:
STX.W $03ED                          ;C2B0EC|8EED03  |8003ED;
STZ.B $00                            ;C2B0EF|6400    |000000;

CODE_C2B0F1:
LDA.L L3_Text,X                      ;C2B0F1|BF00707F|7F7000;
CMP.B #$08                           ;C2B0F5|C908    |      ;
BEQ CODE_C2B0FF                      ;C2B0F7|F006    |C2B0FF;
INX                                  ;C2B0F9|E8      |      ;
INX                                  ;C2B0FA|E8      |      ;
INC.B $00                            ;C2B0FB|E600    |000000;
BRA CODE_C2B0F1                      ;C2B0FD|80F2    |C2B0F1;

CODE_C2B0FF:
LDA.B $00                            ;C2B0FF|A500    |000000;
STA.W $03EF                          ;C2B101|8DEF03  |8003EF;
STZ.B $00                            ;C2B104|6400    |000000;

CODE_C2B106:
LDA.L L3_Text,X                      ;C2B106|BF00707F|7F7000;
CMP.B #$06                           ;C2B10A|C906    |      ;
BEQ CODE_C2B11C                      ;C2B10C|F00E    |C2B11C;
REP #$20                             ;C2B10E|C220    |      ;
TXA                                  ;C2B110|8A      |      ;
CLC                                  ;C2B111|18      |      ;
ADC.W #$0040                         ;C2B112|694000  |      ;
TAX                                  ;C2B115|AA      |      ;
SEP #$20                             ;C2B116|E220    |      ;
INC.B $00                            ;C2B118|E600    |000000;
BRA CODE_C2B106                      ;C2B11A|80EA    |C2B106;

CODE_C2B11C:
LDA.B $00                            ;C2B11C|A500    |000000;
STA.W $03F1                          ;C2B11E|8DF103  |8003F1;
PLY                                  ;C2B121|7A      |      ;
PLX                                  ;C2B122|FA      |      ;
RTS                                  ;C2B123|60      |      ;

print_string_with_delay:
AND.B #$7F                           ;C2B124|297F    |      ;
CMP.B #$20                           ;C2B126|C920    |      ;
BNE CODE_C2B12B                      ;C2B128|D001    |C2B12B;
RTS                                  ;C2B12A|60      |      ;

CODE_C2B12B:
LDA.B #$01                           ;C2B12B|A901    |      ;
TSB.W $03BA                          ;C2B12D|0CBA03  |8003BA;
LDA.W $1B84                          ;C2B130|AD841B  |801B84;
JSL.L CODE_C2B140                    ;C2B133|2240B182|82B140;
LDA.W $03F7                          ;C2B137|ADF703  |8003F7;
BNE CODE_C2B13D                      ;C2B13A|D001    |C2B13D;
RTS                                  ;C2B13C|60      |      ;

CODE_C2B13D:
BRK #$07                             ;C2B13D|0007    |      ;
RTS                                  ;C2B13F|60      |      ;

CODE_C2B140:
BEQ CODE_C2B149                      ;C2B140|F007    |C2B149;
JSL.L CODE_C081E5                    ;C2B142|22E58180|8081E5;
DEC A                                ;C2B146|3A      |      ;
BRA CODE_C2B140                      ;C2B147|80F7    |C2B140;

CODE_C2B149:
RTL                                  ;C2B149|6B      |      ;

CODE_C2B14A:
JSR.W CODE_C2B161                    ;C2B14A|2061B1  |C2B161;
BIT.B #$CF                           ;C2B14D|89CF    |      ;
BNE CODE_C2B14A                      ;C2B14F|D0F9    |C2B14A;

CODE_C2B151:
JSR.W CODE_C2B161                    ;C2B151|2061B1  |C2B161;
BIT.B #$CF                           ;C2B154|89CF    |      ;
BEQ CODE_C2B151                      ;C2B156|F0F9    |C2B151;
LDA.B #$C0                           ;C2B158|A9C0    |      ;
TRB.W $032B                          ;C2B15A|1C2B03  |80032B;
STZ.W $0323                          ;C2B15D|9C2303  |800323;
RTS                                  ;C2B160|60      |      ;

CODE_C2B161:
JSL.L CODE_C081E5                    ;C2B161|22E58180|8081E5;
LDA.W $0323                          ;C2B165|AD2303  |810323;
RTS                                  ;C2B168|60      |      ;

;; returns Key8 value
advance_frame_and_read_lower_buttons:
    LDA.W vblank_interrupt_enabled
BEQ CODE_C2B161                      ;C2B16C|F0F3    |C2B161;
JSL.L wait_vblank                    ;C2B16E|22B7B182|82B1B7;
LDA.W $0323                          ;C2B172|AD2303  |810323;
RTS                                  ;C2B175|60      |      ;

enableNmiInterruptAndTurnScreenOn:
    PHP
    SEP #$20
    JSL.L wait_vblank
    ; enable nmi, vertical irq and joypad polling
    LDA.B #%10100001
    STA.W NMITIMEN
    LDA.B #$0F
    STA.W INIDISP
    INC.W vblank_interrupt_enabled
    PLP
    RTL

disableNmiInterruptAndBlankScreen:
    PHP
    SEP #$20
    JSL.L wait_vblank
    LDA.B #1 ; enable joypad readout, but disable NMI v and h count
    STA.W NMITIMEN
    LDA.B #$80 ; turn screen off
    STA.W INIDISP
    STZ.W vblank_interrupt_enabled
    PLP
    RTL

enable_interrupts:
    LDA.W RDNMI ; ack the nmi flag
    LDA.B #%10100001 ; enable NMI, V-Count and Joypad interrupts
    STA.W NMITIMEN
    INC.W vblank_interrupt_enabled
    RTL

disable_vblank_interrupt:
    LDA.B #1
    STA.W NMITIMEN ; enable joypad readout, but disable NMI v and h count
    STZ.W vblank_interrupt_enabled
    RTL

wait_vblank:
    PHP
    SEP #$20
    PHA
    LDA.W RDNMI ; reset vblank interrupt bit
.loop:
    LDA.W RDNMI ; wait for vblank interrupt
    BPL .loop

    LDA.W RDNMI
    PLA
    PLP
    RTL

;; A contains the number of vblanks to wait for
wait_for_n_vblanks:
    JSL.L wait_vblank
    DEC A
    BNE wait_for_n_vblanks
    RTL

multiply:
    STA.L WRMPYA
    XBA
    STA.L WRMPYB
    NOP #4
    LDA.L RDMPYH
    XBA
    LDA.L RDMPYL
    RTL

divide:
    STY WRDIVL
    STA.W WRDIVB
    NOP #8
    LDA.W RDMPYL
    XBA
    LDA.W RDDIVL
    RTL

; seems to be not used anywhere
CODE_C2B1FE:
    PHP
    SEP #$20
    XBA
    LDA.B #0
    XBA
    CMP.B #$80
    BCC +
    XBA
    DEC
    XBA
+:
    PLP
    RTL

    BMI +
    LSR
    RTL
+:
    SEC
    ROR
    RTL


;; A contains the number to convert
;; X contains the location where to store the decimal
convert_hex_to_dec:
    ; clear target - set it to 0
    STZ.W 0, X
    STZ.W $1, X
.hundrets:
    CMP.B #100 : BCC .tens ; branch if we have less then 100
    SEC
    SBC.B #100
    INC.W $1, X ; increment 100 digit
    BRA .hundrets
.tens:
    ; tens are weird
    ; we store them as ones and do the shift later
    CMP.B #10 : BCC .ones ; branch if we have less then 10
    SEC
    SBC.B #10
    INC.W 0, X
    BRA .tens
.ones:
    ; we shift the previous tens 4 times,
    ; so they are on the tens spot in bcd notation
    ASL.W 0, X
    ASL.W 0, X
    ASL.W 0, X
    ASL.W 0, X
    ; now or the ones into the place
    ORA.W 0, X
    STA.W 0, X
    RTL

CODE_C2B246:
PHX
PHY
PHP
SEP #$20
REP #$10
LDX.W #$F
LDA.B #0
XBA
CLC
.loop1:
LDA.W _0302, X
ADC.W _0301, X
STA.W _0301, X
DEX
BNE .loop1

LDX.W #$10
.loop2:
INC.W _0301, X
BNE .out
DEX
BNE .loop2

.out:
LDA.W _0302
PLP
PLY
PLX
RTL


CODE_C2B272:
PHP                                  ;C2B272|08      |      ;
PHB                                  ;C2B273|8B      |      ;
PHX                                  ;C2B274|DA      |      ;
PHY                                  ;C2B275|5A      |      ;
REP #$10                             ;C2B276|C210    |      ;
SEP #$20                             ;C2B278|E220    |      ;
LDA.B #$7E                           ;C2B27A|A97E    |      ;
PHA                                  ;C2B27C|48      |      ;
PLB                                  ;C2B27D|AB      |      ;
LDX.W #$0100                         ;C2B27E|A20001  |      ;
STX.B $1F                            ;C2B281|861F    |00001F;
STX.B $21                            ;C2B283|8621    |000021;
LDA.B #$20                           ;C2B285|A920    |      ;

CODE_C2B287:
STA.B ($1F)                          ;C2B287|921F    |00001F;
INC.B $1F                            ;C2B289|E61F    |00001F;
BNE CODE_C2B287                      ;C2B28B|D0FA    |C2B287;
LDA.B #$EF                           ;C2B28D|A9EF    |      ;
STA.B $1F                            ;C2B28F|851F    |00001F;
LDA.B #$80                           ;C2B291|A980    |      ;
STA.B $1E                            ;C2B293|851E    |00001E;
LDX.B $25                            ;C2B295|A625    |000025;
LDY.B $23                            ;C2B297|A423    |000023;

CODE_C2B299:
LDA.B [$29]                          ;C2B299|A729    |000029;
AND.B $1E                            ;C2B29B|251E    |00001E;
PHA                                  ;C2B29D|48      |      ;
LSR.B $1E                            ;C2B29E|461E    |00001E;
BCC CODE_C2B2AA                      ;C2B2A0|9008    |C2B2AA;
ROR.B $1E                            ;C2B2A2|661E    |00001E;
INC.B $29                            ;C2B2A4|E629    |000029;
BNE CODE_C2B2AA                      ;C2B2A6|D002    |C2B2AA;
INC.B $2A                            ;C2B2A8|E62A    |00002A;

CODE_C2B2AA:
PLA                                  ;C2B2AA|68      |      ;
BEQ CODE_C2B2BD                      ;C2B2AB|F010    |C2B2BD;
JSR.W CODE_C2B2E2                    ;C2B2AD|20E2B2  |C2B2E2;
STA.W $0000,X                        ;C2B2B0|9D0000  |7E0000;
INX                                  ;C2B2B3|E8      |      ;
STA.B ($1F)                          ;C2B2B4|921F    |00001F;
INC.B $1F                            ;C2B2B6|E61F    |00001F;
DEY                                  ;C2B2B8|88      |      ;
BNE CODE_C2B299                      ;C2B2B9|D0DE    |C2B299;
BRA CODE_C2B2DD                      ;C2B2BB|8020    |C2B2DD;

CODE_C2B2BD:
JSR.W CODE_C2B2E2                    ;C2B2BD|20E2B2  |C2B2E2;
STA.B $21                            ;C2B2C0|8521    |000021;
JSR.W CODE_C2B33F                    ;C2B2C2|203FB3  |C2B33F;
INC A                                ;C2B2C5|1A      |      ;
INC A                                ;C2B2C6|1A      |      ;

CODE_C2B2C7:
XBA                                  ;C2B2C7|EB      |      ;
LDA.B ($21)                          ;C2B2C8|B221    |000021;
INC.B $21                            ;C2B2CA|E621    |000021;
STA.B ($1F)                          ;C2B2CC|921F    |00001F;
INC.B $1F                            ;C2B2CE|E61F    |00001F;
STA.W $0000,X                        ;C2B2D0|9D0000  |7E0000;
INX                                  ;C2B2D3|E8      |      ;
DEY                                  ;C2B2D4|88      |      ;
BEQ CODE_C2B2DD                      ;C2B2D5|F006    |C2B2DD;
XBA                                  ;C2B2D7|EB      |      ;
DEC A                                ;C2B2D8|3A      |      ;
BNE CODE_C2B2C7                      ;C2B2D9|D0EC    |C2B2C7;
BRA CODE_C2B299                      ;C2B2DB|80BC    |C2B299;

CODE_C2B2DD:
PLY                                  ;C2B2DD|7A      |      ;
PLX                                  ;C2B2DE|FA      |      ;
PLB                                  ;C2B2DF|AB      |      ;
PLP                                  ;C2B2E0|28      |      ;
RTL                                  ;C2B2E1|6B      |      ;

CODE_C2B2E2:
LDA.B $1E                            ;C2B2E2|A51E    |00001E;
BMI CODE_C2B329                      ;C2B2E4|3043    |C2B329;
ASL A                                ;C2B2E6|0A      |      ;
BMI CODE_C2B322                      ;C2B2E7|3039    |C2B322;
ASL A                                ;C2B2E9|0A      |      ;
BMI CODE_C2B31B                      ;C2B2EA|302F    |C2B31B;
ASL A                                ;C2B2EC|0A      |      ;
BMI CODE_C2B314                      ;C2B2ED|3025    |C2B314;
ASL A                                ;C2B2EF|0A      |      ;
BMI CODE_C2B30D                      ;C2B2F0|301B    |C2B30D;
ASL A                                ;C2B2F2|0A      |      ;
BMI CODE_C2B306                      ;C2B2F3|3011    |C2B306;
ASL A                                ;C2B2F5|0A      |      ;
BMI CODE_C2B2FF                      ;C2B2F6|3007    |C2B2FF;
REP #$20                             ;C2B2F8|C220    |      ;
LDA.B [$29]                          ;C2B2FA|A729    |000029;
XBA                                  ;C2B2FC|EB      |      ;
BRA CODE_C2B332                      ;C2B2FD|8033    |C2B332;

CODE_C2B2FF:
REP #$20                             ;C2B2FF|C220    |      ;
LDA.B [$29]                          ;C2B301|A729    |000029;
XBA                                  ;C2B303|EB      |      ;
BRA CODE_C2B333                      ;C2B304|802D    |C2B333;

CODE_C2B306:
REP #$20                             ;C2B306|C220    |      ;
LDA.B [$29]                          ;C2B308|A729    |000029;
XBA                                  ;C2B30A|EB      |      ;
BRA CODE_C2B334                      ;C2B30B|8027    |C2B334;

CODE_C2B30D:
REP #$20                             ;C2B30D|C220    |      ;
LDA.B [$29]                          ;C2B30F|A729    |000029;
XBA                                  ;C2B311|EB      |      ;
BRA CODE_C2B335                      ;C2B312|8021    |C2B335;

CODE_C2B314:
REP #$20                             ;C2B314|C220    |      ;
LDA.B [$29]                          ;C2B316|A729    |000029;
XBA                                  ;C2B318|EB      |      ;
BRA CODE_C2B336                      ;C2B319|801B    |C2B336;

CODE_C2B31B:
REP #$20                             ;C2B31B|C220    |      ;
LDA.B [$29]                          ;C2B31D|A729    |000029;
XBA                                  ;C2B31F|EB      |      ;
BRA CODE_C2B337                      ;C2B320|8015    |C2B337;

CODE_C2B322:
REP #$20                             ;C2B322|C220    |      ;
LDA.B [$29]                          ;C2B324|A729    |000029;
XBA                                  ;C2B326|EB      |      ;
BRA CODE_C2B338                      ;C2B327|800F    |C2B338;

CODE_C2B329:
LDA.B [$29]                          ;C2B329|A729    |000029;
REP #$20                             ;C2B32B|C220    |      ;
INC.B $29                            ;C2B32D|E629    |000029;
SEP #$20                             ;C2B32F|E220    |      ;
RTS                                  ;C2B331|60      |      ;

CODE_C2B332:
ASL A                                ;C2B332|0A      |      ;

CODE_C2B333:
ASL A                                ;C2B333|0A      |      ;

CODE_C2B334:
ASL A                                ;C2B334|0A      |      ;

CODE_C2B335:
ASL A                                ;C2B335|0A      |      ;

CODE_C2B336:
ASL A                                ;C2B336|0A      |      ;

CODE_C2B337:
ASL A                                ;C2B337|0A      |      ;

CODE_C2B338:
ASL A                                ;C2B338|0A      |      ;
INC.B $29                            ;C2B339|E629    |000029;
XBA                                  ;C2B33B|EB      |      ;
SEP #$20                             ;C2B33C|E220    |      ;
RTS                                  ;C2B33E|60      |      ;

CODE_C2B33F:
LDA.B $1E                            ;C2B33F|A51E    |00001E;
CMP.B #$10                           ;C2B341|C910    |      ;
BCC CODE_C2B361                      ;C2B343|901C    |C2B361;
LSR A                                ;C2B345|4A      |      ;
LSR A                                ;C2B346|4A      |      ;
LSR A                                ;C2B347|4A      |      ;
LSR A                                ;C2B348|4A      |      ;
STA.B $1E                            ;C2B349|851E    |00001E;
XBA                                  ;C2B34B|EB      |      ;
LDA.B [$29]                          ;C2B34C|A729    |000029;
XBA                                  ;C2B34E|EB      |      ;
REP #$20                             ;C2B34F|C220    |      ;
LSR A                                ;C2B351|4A      |      ;
BCS CODE_C2B35B                      ;C2B352|B007    |C2B35B;
LSR A                                ;C2B354|4A      |      ;
BCS CODE_C2B35B                      ;C2B355|B004    |C2B35B;
LSR A                                ;C2B357|4A      |      ;
BCS CODE_C2B35B                      ;C2B358|B001    |C2B35B;
LSR A                                ;C2B35A|4A      |      ;

CODE_C2B35B:
SEP #$20                             ;C2B35B|E220    |      ;
XBA                                  ;C2B35D|EB      |      ;
AND.B #$0F                           ;C2B35E|290F    |      ;
RTS                                  ;C2B360|60      |      ;

CODE_C2B361:
LSR A                                ;C2B361|4A      |      ;
BCS CODE_C2B392                      ;C2B362|B02E    |C2B392;
LSR A                                ;C2B364|4A      |      ;
BCS CODE_C2B385                      ;C2B365|B01E    |C2B385;
LSR A                                ;C2B367|4A      |      ;
BCS CODE_C2B379                      ;C2B368|B00F    |C2B379;
LDA.B #$80                           ;C2B36A|A980    |      ;
STA.B $1E                            ;C2B36C|851E    |00001E;
LDA.B [$29]                          ;C2B36E|A729    |000029;
REP #$20                             ;C2B370|C220    |      ;
INC.B $29                            ;C2B372|E629    |000029;
SEP #$20                             ;C2B374|E220    |      ;
AND.B #$0F                           ;C2B376|290F    |      ;
RTS                                  ;C2B378|60      |      ;

CODE_C2B379:
LDA.B #$40                           ;C2B379|A940    |      ;
STA.B $1E                            ;C2B37B|851E    |00001E;
REP #$20                             ;C2B37D|C220    |      ;
LDA.B [$29]                          ;C2B37F|A729    |000029;
XBA                                  ;C2B381|EB      |      ;
ASL A                                ;C2B382|0A      |      ;
BRA CODE_C2B39E                      ;C2B383|8019    |C2B39E;

CODE_C2B385:
LDA.B #$20                           ;C2B385|A920    |      ;
STA.B $1E                            ;C2B387|851E    |00001E;
REP #$20                             ;C2B389|C220    |      ;
LDA.B [$29]                          ;C2B38B|A729    |000029;
XBA                                  ;C2B38D|EB      |      ;
ASL A                                ;C2B38E|0A      |      ;
ASL A                                ;C2B38F|0A      |      ;
BRA CODE_C2B39E                      ;C2B390|800C    |C2B39E;

CODE_C2B392:
LDA.B #$10                           ;C2B392|A910    |      ;
STA.B $1E                            ;C2B394|851E    |00001E;
REP #$20                             ;C2B396|C220    |      ;
LDA.B [$29]                          ;C2B398|A729    |000029;
XBA                                  ;C2B39A|EB      |      ;
ASL A                                ;C2B39B|0A      |      ;
ASL A                                ;C2B39C|0A      |      ;
ASL A                                ;C2B39D|0A      |      ;

CODE_C2B39E:
INC.B $29                            ;C2B39E|E629    |000029;
SEP #$20                             ;C2B3A0|E220    |      ;
XBA                                  ;C2B3A2|EB      |      ;
AND.B #$0F                           ;C2B3A3|290F    |      ;
RTS                                  ;C2B3A5|60      |      ;

CODE_C2B3A6:
PHP                                  ;C2B3A6|08      |      ;
SEP #$20                             ;C2B3A7|E220    |      ;
REP #$10                             ;C2B3A9|C210    |      ;
JSR.W CODE_C2B3FF                    ;C2B3AB|20FFB3  |C2B3FF;

CODE_C2B3AE:
JSR.W CODE_C2B964                    ;C2B3AE|2064B9  |C2B964;
CMP.B #$00                           ;C2B3B1|C900    |      ;
BEQ CODE_C2B3FD                      ;C2B3B3|F048    |C2B3FD;
BIT.B #$80                           ;C2B3B5|8980    |      ;
BEQ CODE_C2B3BE                      ;C2B3B7|F005    |C2B3BE;
JSR.W CODE_C2B43F                    ;C2B3B9|203FB4  |C2B43F;
BRA CODE_C2B3AE                      ;C2B3BC|80F0    |C2B3AE;

CODE_C2B3BE:
BIT.B #$40                           ;C2B3BE|8940    |      ;
BEQ CODE_C2B3C7                      ;C2B3C0|F005    |C2B3C7;
JSR.W CODE_C2B532                    ;C2B3C2|2032B5  |C2B532;
BRA CODE_C2B3AE                      ;C2B3C5|80E7    |C2B3AE;

CODE_C2B3C7:
BIT.B #$20                           ;C2B3C7|8920    |      ;
BEQ CODE_C2B3D0                      ;C2B3C9|F005    |C2B3D0;
JSR.W CODE_C2B571                    ;C2B3CB|2071B5  |C2B571;
BRA CODE_C2B3AE                      ;C2B3CE|80DE    |C2B3AE;

CODE_C2B3D0:
BIT.B #$10                           ;C2B3D0|8910    |      ;
BEQ CODE_C2B3D9                      ;C2B3D2|F005    |C2B3D9;
JSR.W CODE_C2B62B                    ;C2B3D4|202BB6  |C2B62B;
BRA CODE_C2B3AE                      ;C2B3D7|80D5    |C2B3AE;

CODE_C2B3D9:
BIT.B #$08                           ;C2B3D9|8908    |      ;
BEQ CODE_C2B3E2                      ;C2B3DB|F005    |C2B3E2;
JSR.W CODE_C2B77E                    ;C2B3DD|207EB7  |C2B77E;
BRA CODE_C2B3AE                      ;C2B3E0|80CC    |C2B3AE;

CODE_C2B3E2:
BIT.B #$04                           ;C2B3E2|8904    |      ;
BEQ CODE_C2B3EB                      ;C2B3E4|F005    |C2B3EB;
db $20,$B9,$B8,$80,$C3               ;C2B3E6|        |C2B8B9;

CODE_C2B3EB:
BIT.B #$02                           ;C2B3EB|8902    |      ;
BEQ CODE_C2B3F4                      ;C2B3ED|F005    |C2B3F4;
JSR.W CODE_C2B8C3                    ;C2B3EF|20C3B8  |C2B8C3;
BRA CODE_C2B3AE                      ;C2B3F2|80BA    |C2B3AE;

CODE_C2B3F4:
BIT.B #$01                           ;C2B3F4|8901    |      ;
BEQ CODE_C2B3AE                      ;C2B3F6|F0B6    |C2B3AE;
JSR.W CODE_C2B920                    ;C2B3F8|2020B9  |C2B920;
BRA CODE_C2B3AE                      ;C2B3FB|80B1    |C2B3AE;

CODE_C2B3FD:
PLP                                  ;C2B3FD|28      |      ;
RTL                                  ;C2B3FE|6B      |      ;

CODE_C2B3FF:
LDY.W #$0000                         ;C2B3FF|A00000  |      ;

CODE_C2B402:
LDA.B [$2F],Y                        ;C2B402|B72F    |00002F;
INY                                  ;C2B404|C8      |      ;
XBA                                  ;C2B405|EB      |      ;
LDA.B [$2F],Y                        ;C2B406|B72F    |00002F;
INY                                  ;C2B408|C8      |      ;
CMP.W $0316                          ;C2B409|CD1603  |810316;
BNE CODE_C2B415                      ;C2B40C|D007    |C2B415;
XBA                                  ;C2B40E|EB      |      ;
CMP.W $0314                          ;C2B40F|CD1403  |810314;
BNE CODE_C2B415                      ;C2B412|D001    |C2B415;
RTS                                  ;C2B414|60      |      ;

CODE_C2B415:
JSR.W CODE_C2B964                    ;C2B415|2064B9  |C2B964;
CMP.B #$00                           ;C2B418|C900    |      ;
BEQ CODE_C2B402                      ;C2B41A|F0E6    |C2B402;
ASL A                                ;C2B41C|0A      |      ;
BCS CODE_C2B437                      ;C2B41D|B018    |C2B437;
ASL A                                ;C2B41F|0A      |      ;
BCS CODE_C2B437                      ;C2B420|B015    |C2B437;
ASL A                                ;C2B422|0A      |      ;
BCS CODE_C2B436                      ;C2B423|B011    |C2B436;
ASL A                                ;C2B425|0A      |      ;
BCS CODE_C2B439                      ;C2B426|B011    |C2B439;
ASL A                                ;C2B428|0A      |      ;
BCS CODE_C2B43C                      ;C2B429|B011    |C2B43C;
ASL A                                ;C2B42B|0A      |      ;
BCS CODE_C2B43A                      ;C2B42C|B00C    |C2B43A;
ASL A                                ;C2B42E|0A      |      ;
BCS CODE_C2B438                      ;C2B42F|B007    |C2B438;
ASL A                                ;C2B431|0A      |      ;
BCS CODE_C2B437                      ;C2B432|B003    |C2B437;
db $80,$FE                           ;C2B434|        |C2B434;

CODE_C2B436:
INY                                  ;C2B436|C8      |      ;

CODE_C2B437:
INY                                  ;C2B437|C8      |      ;

CODE_C2B438:
INY                                  ;C2B438|C8      |      ;

CODE_C2B439:
INY                                  ;C2B439|C8      |      ;

CODE_C2B43A:
INY                                  ;C2B43A|C8      |      ;
INY                                  ;C2B43B|C8      |      ;

CODE_C2B43C:
INY                                  ;C2B43C|C8      |      ;
BRA CODE_C2B415                      ;C2B43D|80D6    |C2B415;

CODE_C2B43F:
LDA.W $03B6                          ;C2B43F|ADB603  |8103B6;
BIT.B #$08                           ;C2B442|8908    |      ;
BEQ .CODE_C2B44D                      ;C2B444|F007    |C2B44D;
INY #6
RTS

.CODE_C2B44D:
PHP                                  ;C2B44D|08      |      ;
REP #$20                             ;C2B44E|C220    |      ;
JSR.W CODE_C2B964                    ;C2B450|2064B9  |C2B964;
XBA                                  ;C2B453|EB      |      ;
STA.B $00                            ;C2B454|8500    |000000;
JSR.W CODE_C2B964                    ;C2B456|2064B9  |C2B964;
XBA                                  ;C2B459|EB      |      ;
ASL A                                ;C2B45A|0A      |      ;
STA.B $02                            ;C2B45B|8502    |000002;
JSR.W CODE_C2B964                    ;C2B45D|2064B9  |C2B964;
PHA                                  ;C2B460|48      |      ;
XBA                                  ;C2B461|EB      |      ;
CLC                                  ;C2B462|18      |      ;
ADC.W #$0000                         ;C2B463|690000  |      ;
STA.W VMADDL                          ;C2B466|8D1621  |812116;
LDX.W #$0029                         ;C2B469|A22900  |      ;
JSR.W CODE_C2B731                    ;C2B46C|2031B7  |C2B731;
LDA.B $01,S                          ;C2B46F|A301    |000001;
BEQ .CODE_C2B484                      ;C2B471|F011    |C2B484;
CMP.W #$0010                         ;C2B473|C91000  |      ;
BEQ .CODE_C2B48E                      ;C2B476|F016    |C2B48E;
CMP.W #$0020                         ;C2B478|C92000  |      ;
BEQ .CODE_C2B498                      ;C2B47B|F01B    |C2B498;
CMP.W #$0030                         ;C2B47D|C93000  |      ;
BEQ .CODE_C2B4A2                      ;C2B480|F020    |C2B4A2;
BRA .CODE_C2B4AD                      ;C2B482|8029    |C2B4AD;

.CODE_C2B484:
LDX.W #$0409                         ;C2B484|A20904  |      ;
JSR.W CODE_C2B9A8                    ;C2B487|20A8B9  |C2B9A8;
BCS .CODE_C2B4B9                      ;C2B48A|B02D    |C2B4B9;
BRA .ret                      ;C2B48C|801C    |C2B4AA;

.CODE_C2B48E:
LDX.W #$040D                         ;C2B48E|A20D04  |      ;
JSR.W CODE_C2B9A8                    ;C2B491|20A8B9  |C2B9A8;
BCS .CODE_C2B4B9                      ;C2B494|B023    |C2B4B9;
BRA .ret                      ;C2B496|8012    |C2B4AA;

.CODE_C2B498:
LDX.W #$0411                         ;C2B498|A21104  |      ;
JSR.W CODE_C2B9A8                    ;C2B49B|20A8B9  |C2B9A8;
BCS .CODE_C2B4B9                      ;C2B49E|B019    |C2B4B9;
db $80,$08                           ;C2B4A0|        |C2B4AA;

.CODE_C2B4A2:
LDX.W #$0415                         ;C2B4A2|A21504  |      ;
JSR.W CODE_C2B9A8                    ;C2B4A5|20A8B9  |C2B9A8;
BCS .CODE_C2B4B9                      ;C2B4A8|B00F    |C2B4B9;

.ret:
PLA                                  ;C2B4AA|68      |      ;
PLP                                  ;C2B4AB|28      |      ;
RTS                                  ;C2B4AC|60      |      ;

.CODE_C2B4AD:
STZ.W $040B                          ;C2B4AD|9C0B04  |81040B;
STZ.W $040F                          ;C2B4B0|9C0F04  |81040F;
STZ.W $0413                          ;C2B4B3|9C1304  |810413;
STZ.W $0417                          ;C2B4B6|9C1704  |810417;

.CODE_C2B4B9:
ASL.B $00                            ;C2B4B9|0600    |000000;
BCC CODE_C2B4F0                      ;C2B4BB|9033    |C2B4F0;
PLA                                  ;C2B4BD|68      |      ;
CMP.W #$00FF                         ;C2B4BE|C9FF00  |      ;
BEQ .CODE_C2B4D4                   ;C2B4C1|F011    |C2B4D4;
PHY                                  ;C2B4C3|5A      |      ;
LDY.B $00                            ;C2B4C4|A400    |000000;

..copy_loop:
LDA.B [$29],Y                        ;C2B4C6|B729    |000029;
STA.W VMDATAL                          ;C2B4C8|8D1821  |812118;
INY                                  ;C2B4CB|C8      |      ;
INY                                  ;C2B4CC|C8      |      ;
CPY.B $02                            ;C2B4CD|C402    |000002;
BNE ..copy_loop                      ;C2B4CF|D0F5    |C2B4C6;
PLY                                  ;C2B4D1|7A      |      ;
PLP                                  ;C2B4D2|28      |      ;
RTS                                  ;C2B4D3|60      |      ;

.CODE_C2B4D4:
LDX.W #0
STX.W VMADDL
PHY
SEP #$20
LDY.W #0

..copy_loop:
LDA.B [$29], Y
STA.W VMDATAH
INY
CPY.W #$4000
BNE ..copy_loop
REP #$20
PLY
PLP
RTS


CODE_C2B4F0:
LDA.B [$29]                          ;C2B4F0|A729    |000029;
STA.B $23                            ;C2B4F2|8523    |000023;
INC.B $29                            ;C2B4F4|E629    |000029;
INC.B $29                            ;C2B4F6|E629    |000029;
LDX.W #$6000                         ;C2B4F8|A20060  |      ;
STX.B $25                            ;C2B4FB|8625    |000025;
JSL.L CODE_C2B272                    ;C2B4FD|2272B282|82B272;
PLA                                  ;C2B501|68      |      ;
CMP.W #$00FF                         ;C2B502|C9FF00  |      ;
BEQ CODE_C2B518                      ;C2B505|F011    |C2B518;
LDX.B $00                            ;C2B507|A600    |000000;

CODE_C2B509:
LDA.L $7E6000,X                      ;C2B509|BF00607E|7E6000;
STA.W VMDATAL                          ;C2B50D|8D1821  |812118;
INX                                  ;C2B510|E8      |      ;
INX                                  ;C2B511|E8      |      ;
CPX.B $02                            ;C2B512|E402    |000002;
BNE CODE_C2B509                      ;C2B514|D0F3    |C2B509;
PLP                                  ;C2B516|28      |      ;
RTS                                  ;C2B517|60      |      ;

CODE_C2B518:
LDX.W #$0000                         ;C2B518|A20000  |      ;
STX.W VMADDL                          ;C2B51B|8E1621  |812116;
SEP #$20                             ;C2B51E|E220    |      ;
LDX.W #$0000                         ;C2B520|A20000  |      ;

CODE_C2B523:
LDA.L $7E6000,X                      ;C2B523|BF00607E|7E6000;
STA.W VMDATAH                          ;C2B527|8D1921  |812119;
INX                                  ;C2B52A|E8      |      ;
CPX.W #$4000                         ;C2B52B|E00040  |      ;
BNE CODE_C2B523                      ;C2B52E|D0F3    |C2B523;
PLP                                  ;C2B530|28      |      ;
RTS                                  ;C2B531|60      |      ;

CODE_C2B532:
LDA.W $03B6                          ;C2B532|ADB603  |8103B6;
BIT.B #$04                           ;C2B535|8904    |      ;
BEQ CODE_C2B540                      ;C2B537|F007    |C2B540;
db $C8,$C8,$C8,$C8,$C8,$C8,$60       ;C2B539|        |      ;

CODE_C2B540:
PHP                                  ;C2B540|08      |      ;
REP #$20                             ;C2B541|C220    |      ;
JSR.W CODE_C2B964                    ;C2B543|2064B9  |C2B964;
ASL A                                ;C2B546|0A      |      ;
STA.B $00                            ;C2B547|8500    |000000;
JSR.W CODE_C2B964                    ;C2B549|2064B9  |C2B964;
ASL A                                ;C2B54C|0A      |      ;
STA.B $02                            ;C2B54D|8502    |000002;
JSR.W CODE_C2B964                    ;C2B54F|2064B9  |C2B964;
ASL A                                ;C2B552|0A      |      ;
STA.B $04                            ;C2B553|8504    |000004;
LDX.W #$0029                         ;C2B555|A22900  |      ;
JSR.W CODE_C2B731                    ;C2B558|2031B7  |C2B731;
PHY                                  ;C2B55B|5A      |      ;
LDY.B $00                            ;C2B55C|A400    |000000;
LDX.B $04                            ;C2B55E|A604    |000004;

CODE_C2B560:
LDA.B [$29],Y                        ;C2B560|B729    |000029;
STA.L $7F0000,X                      ;C2B562|9F00007F|7F0000;
INY                                  ;C2B566|C8      |      ;
INY                                  ;C2B567|C8      |      ;
INX                                  ;C2B568|E8      |      ;
INX                                  ;C2B569|E8      |      ;
CPY.B $02                            ;C2B56A|C402    |000002;
BNE CODE_C2B560                      ;C2B56C|D0F2    |C2B560;
PLY                                  ;C2B56E|7A      |      ;
PLP                                  ;C2B56F|28      |      ;
RTS                                  ;C2B570|60      |      ;

CODE_C2B571:
LDA.W $03B6                          ;C2B571|ADB603  |8103B6;
BIT.B #$02                           ;C2B574|8902    |      ;
BEQ CODE_C2B580                      ;C2B576|F008    |C2B580;
db $C8,$C8,$C8,$C8,$C8,$C8,$C8,$60   ;C2B578|        |      ;

CODE_C2B580:
PHP                                  ;C2B580|08      |      ;
REP #$20                             ;C2B581|C220    |      ;
JSR.W CODE_C2B964                    ;C2B583|2064B9  |C2B964;
XBA                                  ;C2B586|EB      |      ;
STA.B $06                            ;C2B587|8506    |000006;
AND.W #$7FFF                         ;C2B589|29FF7F  |      ;
LSR A                                ;C2B58C|4A      |      ;
LSR A                                ;C2B58D|4A      |      ;
STA.B $00                            ;C2B58E|8500    |000000;
JSR.W CODE_C2B964                    ;C2B590|2064B9  |C2B964;
XBA                                  ;C2B593|EB      |      ;
LSR A                                ;C2B594|4A      |      ;
LSR A                                ;C2B595|4A      |      ;
STA.B $02                            ;C2B596|8502    |000002;
JSR.W CODE_C2B964                    ;C2B598|2064B9  |C2B964;
XBA                                  ;C2B59B|EB      |      ;
LSR A                                ;C2B59C|4A      |      ;
LSR A                                ;C2B59D|4A      |      ;
STA.B $04                            ;C2B59E|8504    |000004;
JSR.W CODE_C2B964                    ;C2B5A0|2064B9  |C2B964;
PHA                                  ;C2B5A3|48      |      ;
LDX.W #$0029                         ;C2B5A4|A22900  |      ;
JSR.W CODE_C2B731                    ;C2B5A7|2031B7  |C2B731;
LDA.B $01,S                          ;C2B5AA|A301    |000001;
CMP.W #$0001                         ;C2B5AC|C90100  |      ;
BEQ CODE_C2B5B8                      ;C2B5AF|F007    |C2B5B8;
CMP.W #$0002                         ;C2B5B1|C90200  |      ;
BEQ CODE_C2B5C2                      ;C2B5B4|F00C    |C2B5C2;
BRA CODE_C2B5CD                      ;C2B5B6|8015    |C2B5CD;

CODE_C2B5B8:
LDX.W #$0419                         ;C2B5B8|A21904  |      ;
JSR.W CODE_C2B9A8                    ;C2B5BB|20A8B9  |C2B9A8;
BCS CODE_C2B5D3                      ;C2B5BE|B013    |C2B5D3;
BRA CODE_C2B5CA                      ;C2B5C0|8008    |C2B5CA;

CODE_C2B5C2:
LDX.W #$041D                         ;C2B5C2|A21D04  |      ;
JSR.W CODE_C2B9A8                    ;C2B5C5|20A8B9  |C2B9A8;
BCS CODE_C2B5D3                      ;C2B5C8|B009    |C2B5D3;

CODE_C2B5CA:
PLA                                  ;C2B5CA|68      |      ;
PLP                                  ;C2B5CB|28      |      ;
RTS                                  ;C2B5CC|60      |      ;

CODE_C2B5CD:
STZ.W $041B                          ;C2B5CD|9C1B04  |81041B;
STZ.W $041F                          ;C2B5D0|9C1F04  |81041F;

CODE_C2B5D3:
LDA.B $06                            ;C2B5D3|A506    |000006;
BPL CODE_C2B5EE                      ;C2B5D5|1017    |C2B5EE;
db $A9,$00,$60,$85,$2C,$5A,$A0,$00   ;C2B5D7|        |      ;
db $00,$B7,$29,$97,$2C,$C8,$C8,$C0   ;C2B5DF|        |      ;
db $00,$08,$D0,$F5,$7A,$80,$11       ;C2B5E7|        |      ;

CODE_C2B5EE:
LDA.B [$29]                          ;C2B5EE|A729    |000029;
STA.B $23                            ;C2B5F0|8523    |000023;
INC.B $29                            ;C2B5F2|E629    |000029;
INC.B $29                            ;C2B5F4|E629    |000029;
LDX.W #$6000                         ;C2B5F6|A20060  |      ;
STX.B $25                            ;C2B5F9|8625    |000025;
JSL.L CODE_C2B272                    ;C2B5FB|2272B282|82B272;
PLA                                  ;C2B5FF|68      |      ;
LDX.W #$2000                         ;C2B600|A20020  |      ;
JSR.W CODE_C2B60E                    ;C2B603|200EB6  |C2B60E;
LDX.W #$2800                         ;C2B606|A20028  |      ;
JSR.W CODE_C2B60E                    ;C2B609|200EB6  |C2B60E;
PLP                                  ;C2B60C|28      |      ;
RTS                                  ;C2B60D|60      |      ;

CODE_C2B60E:
LSR A                                ;C2B60E|4A      |      ;
BCC CODE_C2B62A                      ;C2B60F|9019    |C2B62A;
PHA                                  ;C2B611|48      |      ;
PHY                                  ;C2B612|5A      |      ;
STX.B $2C                            ;C2B613|862C    |00002C;
LDX.B $00                            ;C2B615|A600    |000000;
LDY.B $04                            ;C2B617|A404    |000004;

CODE_C2B619:
LDA.L $7E6000,X                      ;C2B619|BF00607E|7E6000;
XBA                                  ;C2B61D|EB      |      ;
STA.B [$2C],Y                        ;C2B61E|972C    |00002C;
INX                                  ;C2B620|E8      |      ;
INX                                  ;C2B621|E8      |      ;
INY                                  ;C2B622|C8      |      ;
INY                                  ;C2B623|C8      |      ;
CPX.B $02                            ;C2B624|E402    |000002;
BNE CODE_C2B619                      ;C2B626|D0F1    |C2B619;
PLY                                  ;C2B628|7A      |      ;
PLA                                  ;C2B629|68      |      ;

CODE_C2B62A:
RTS                                  ;C2B62A|60      |      ;

CODE_C2B62B:
LDA.W $03B6                          ;C2B62B|ADB603  |8103B6;
BIT.B #$01                           ;C2B62E|8901    |      ;
BEQ CODE_C2B637                      ;C2B630|F005    |C2B637;
db $C8,$C8,$C8,$C8,$60               ;C2B632|        |      ;

CODE_C2B637:
PHP                                  ;C2B637|08      |      ;
REP #$20                             ;C2B638|C220    |      ;
JSR.W CODE_C2B964                    ;C2B63A|2064B9  |C2B964;
STA.B $04                            ;C2B63D|8504    |000004;
LDX.W #$0029                         ;C2B63F|A22900  |      ;
JSR.W CODE_C2B731                    ;C2B642|2031B7  |C2B731;
LDA.B $04                            ;C2B645|A504    |000004;
CMP.W #$0001                         ;C2B647|C90100  |      ;
BEQ CODE_C2B65B                      ;C2B64A|F00F    |C2B65B;
CMP.W #$0002                         ;C2B64C|C90200  |      ;
BNE CODE_C2B665                      ;C2B64F|D014    |C2B665;
LDX.W #$0425                         ;C2B651|A22504  |      ;
JSR.W CODE_C2B9A8                    ;C2B654|20A8B9  |C2B9A8;
BCS CODE_C2B66B                      ;C2B657|B012    |C2B66B;
PLP                                  ;C2B659|28      |      ;
RTS                                  ;C2B65A|60      |      ;

CODE_C2B65B:
LDX.W #$0421                         ;C2B65B|A22104  |      ;
JSR.W CODE_C2B9A8                    ;C2B65E|20A8B9  |C2B9A8;
BCS CODE_C2B66B                      ;C2B661|B008    |C2B66B;
db $28,$60                           ;C2B663|        |      ;

CODE_C2B665:
STZ.W $0423                          ;C2B665|9C2304  |810423;
STZ.W $0427                          ;C2B668|9C2704  |810427;

CODE_C2B66B:
LDA.B [$29]                          ;C2B66B|A729    |000029;
INC.B $29                            ;C2B66D|E629    |000029;
AND.W #$00FF                         ;C2B66F|29FF00  |      ;
XBA                                  ;C2B672|EB      |      ;
STA.B $00                            ;C2B673|8500    |000000;
LDA.B [$29]                          ;C2B675|A729    |000029;
INC.B $29                            ;C2B677|E629    |000029;
AND.W #$00FF                         ;C2B679|29FF00  |      ;
XBA                                  ;C2B67C|EB      |      ;
STA.B $02                            ;C2B67D|8502    |000002;
SEP #$20                             ;C2B67F|E220    |      ;
LDA.B $01                            ;C2B681|A501    |000001;
XBA                                  ;C2B683|EB      |      ;
LDA.B $03                            ;C2B684|A503    |000003;
JSL.L multiply                    ;C2B686|22D1B182|82B1D1;
REP #$20                             ;C2B68A|C220    |      ;
XBA                                  ;C2B68C|EB      |      ;
STA.B $23                            ;C2B68D|8523    |000023;
LDA.B $03                            ;C2B68F|A503    |000003;
BMI CODE_C2B69B                      ;C2B691|3008    |C2B69B;
LDA.B [$29]                          ;C2B693|A729    |000029;
STA.B $23                            ;C2B695|8523    |000023;
INC.B $29                            ;C2B697|E629    |000029;
INC.B $29                            ;C2B699|E629    |000029;

CODE_C2B69B:
LDA.B $04                            ;C2B69B|A504    |000004;
AND.W #$FF7F                         ;C2B69D|297FFF  |      ;
BNE CODE_C2B6A7                      ;C2B6A0|D005    |C2B6A7;
JSR.W CODE_C2B6EA                    ;C2B6A2|20EAB6  |C2B6EA;
BRA CODE_C2B6B7                      ;C2B6A5|8010    |C2B6B7;

CODE_C2B6A7:
LDX.W #$0000                         ;C2B6A7|A20000  |      ;
JSR.W CODE_C2B6B9                    ;C2B6AA|20B9B6  |C2B6B9;
BCS CODE_C2B6B7                      ;C2B6AD|B008    |C2B6B7;
LDX.W #$0004                         ;C2B6AF|A20400  |      ;
JSR.W CODE_C2B6B9                    ;C2B6B2|20B9B6  |C2B6B9;
BCS CODE_C2B6B7                      ;C2B6B5|B000    |C2B6B7;

CODE_C2B6B7:
PLP                                  ;C2B6B7|28      |      ;
RTS                                  ;C2B6B8|60      |      ;

CODE_C2B6B9:
LSR A                                ;C2B6B9|4A      |      ;
BCC CODE_C2B6E9                      ;C2B6BA|902D    |C2B6E9;
PHA                                  ;C2B6BC|48      |      ;
PHY                                  ;C2B6BD|5A      |      ;
LDA.B $00                            ;C2B6BE|A500    |000000;
STA.W $0342,X                        ;C2B6C0|9D4203  |810342;
LDA.B $02                            ;C2B6C3|A502    |000002;
STA.W $0344,X                        ;C2B6C5|9D4403  |810344;
LDY.W $0352,X                        ;C2B6C8|BC5203  |810352;
LDA.B $03                            ;C2B6CB|A503    |000003;
BPL CODE_C2B6E0                      ;C2B6CD|1011    |C2B6E0;
db $84,$2C,$A0,$00,$00,$B7,$29,$97   ;C2B6CF|        |00002C;
db $2C,$C8,$C8,$C4,$23,$D0,$F6,$80   ;C2B6D7|        |00C8C8;
db $06                               ;C2B6DF|        |000084;

CODE_C2B6E0:
STY.B $25                            ;C2B6E0|8425    |000025;
JSL.L CODE_C2B272                    ;C2B6E2|2272B282|82B272;
PLY                                  ;C2B6E6|7A      |      ;
PLA                                  ;C2B6E7|68      |      ;
SEC                                  ;C2B6E8|38      |      ;

CODE_C2B6E9:
RTS                                  ;C2B6E9|60      |      ;

CODE_C2B6EA:
PHP                                  ;C2B6EA|08      |      ;
PHY                                  ;C2B6EB|5A      |      ;
LDA.B $03                            ;C2B6EC|A503    |000003;
BPL CODE_C2B705                      ;C2B6EE|1015    |C2B705;
db $A0,$00,$C0,$84,$2C,$A0,$00,$00   ;C2B6F0|        |      ;
db $B7,$29,$97,$2C,$C8,$C8,$C0,$00   ;C2B6F8|        |000029;
db $40,$D0,$F5,$80,$09               ;C2B700|        |      ;

CODE_C2B705:
LDX.W #$C000                         ;C2B705|A200C0  |      ;
STX.B $25                            ;C2B708|8625    |000025;
JSL.L CODE_C2B272                    ;C2B70A|2272B282|82B272;
SEP #$20                             ;C2B70E|E220    |      ;
LDX.W #$0000                         ;C2B710|A20000  |      ;
STX.W VMADDL                          ;C2B713|8E1621  |812116;
STZ.W VMAIN                          ;C2B716|9C1521  |812115;
LDX.W #$0000                         ;C2B719|A20000  |      ;

CODE_C2B71C:
LDA.L DATA_7EC000,X                      ;C2B71C|BF00C07E|7EC000;
STA.W VMDATAL                          ;C2B720|8D1821  |812118;
INX                                  ;C2B723|E8      |      ;
CPX.W #$4000                         ;C2B724|E00040  |      ;
BNE CODE_C2B71C                      ;C2B727|D0F3    |C2B71C;
LDA.B #$80                           ;C2B729|A980    |      ;
STA.W VMAIN                          ;C2B72B|8D1521  |812115;
PLY                                  ;C2B72E|7A      |      ;
PLP                                  ;C2B72F|28      |      ;
RTS                                  ;C2B730|60      |      ;

;; [$2F] contains a 24-bit base address
;; Y contains an offset to [$2F]
;; X - ?! (offset to $1 and $2)
;; ?? convert to hirom address ??
CODE_C2B731:
    PHP
    ; load 16-bit pointer
    REP #$20
    LDA.B [$2F], Y
    INY
    INY
    STA.B $29
    ; load 8-bit bank
    SEP #$20
    LDA.B [$2F],Y
    INY
    STA.B $2B
    ; do conversion ... ?
    REP #$20
    LDA.W 1, X
    AND.W #$7F
    PHA
EOR.W $0001,X                        ;C2B74A|5D0100  |810001;
ASL A                                ;C2B74D|0A      |      ;
ORA.W #$0080                         ;C2B74E|098000  |      ;
ORA.B $01,S                          ;C2B751|0301    |000001;
STA.W $0001,X                        ;C2B753|9D0100  |810001;
PLA                                  ;C2B756|68      |      ;
SEP #$20                             ;C2B757|E220    |      ;
LDA.W $0002,X                        ;C2B759|BD0200  |810002;
CMP.B #$70                           ;C2B75C|C970    |      ;
BCS .ret                      ;C2B75E|B01A    |C2B77A;
CLC                                  ;C2B760|18      |      ;
ADC.B #$80                           ;C2B761|6980    |      ;
CMP.B #$90                           ;C2B763|C990    |      ;
BCC .CODE_C2B777                      ;C2B765|9010    |C2B777;
CLC                                  ;C2B767|18      |      ;
ADC.B #$30                           ;C2B768|6930    |      ;
STA.W $0002,X                        ;C2B76A|9D0200  |810002;
LDA.W $0001,X                        ;C2B76D|BD0100  |810001;
AND.B #$7F                           ;C2B770|297F    |      ;
STA.W $0001,X                        ;C2B772|9D0100  |810001;
BRA .ret                      ;C2B775|8003    |C2B77A;

.CODE_C2B777:
STA.W $0002,X                        ;C2B777|9D0200  |810002;

.ret:
REP #$20                             ;C2B77A|C220    |      ;
PLP                                  ;C2B77C|28      |      ;
RTS                                  ;C2B77D|60      |      ;

CODE_C2B77E:
    JSR.W CODE_C2B964
    BIT.B #$80
    BEQ CODE_C2B790
    BIT.B #$40
    BEQ CODE_C2B78A
    RTS

CODE_C2B78A:
    ORA.B #$40
    JSR.W CODE_C2B96F
    RTS

CODE_C2B790:
STA.W current_map_number
PHY                                  ;C2B793|5A      |      ;
REP #$20                             ;C2B794|C220    |      ;
AND.W #$00FF                         ;C2B796|29FF00  |      ;
ASL A                                ;C2B799|0A      |      ;
TAX                                  ;C2B79A|AA      |      ;
LDA.L LUT_C2EEAE,X               ;C2B79B|BFAEEE82|82EEAE;
SEC                                  ;C2B79F|38      |      ;
SBC.W #$EEAE                         ;C2B7A0|E9AEEE  |      ;
TAX                                  ;C2B7A3|AA      |      ;
SEP #$20                             ;C2B7A4|E220    |      ;
LDA.L LUT_C2EEAE,X               ;C2B7A6|BFAEEE82|82EEAE;
STA.W TM                          ;C2B7AA|8D2C21  |81212C;
STA.W TMW                          ;C2B7AD|8D2E21  |81212E;
STA.W $03C2                          ;C2B7B0|8DC203  |8103C2;
LDA.L LUT_C2EEAE+1,X               ;C2B7B3|BFAFEE82|82EEAF;
STA.W TS                          ;C2B7B7|8D2D21  |81212D;
STA.W TSW                          ;C2B7BA|8D2F21  |81212F;
LDA.L LUT_C2EEAE+2,X               ;C2B7BD|BFB0EE82|82EEB0;
STA.W CGWSEL                          ;C2B7C1|8D3021  |812130;
LDA.L LUT_C2EEAE+3,X               ;C2B7C4|BFB1EE82|82EEB1;
STA.W CGADSUB                          ;C2B7C8|8D3121  |812131;
STA.W $03C3                          ;C2B7CB|8DC303  |8103C3;
LDA.L LUT_C2EEAE+4,X               ;C2B7CE|BFB2EE82|82EEB2;
AND.B #$30                           ;C2B7D2|2930    |      ;
STA.W $0373                          ;C2B7D4|8D7303  |810373;
LDA.L LUT_C2EEAE+4,X               ;C2B7D7|BFB2EE82|82EEB2;
STZ.W $036B                          ;C2B7DB|9C6B03  |81036B;
STZ.W $036F                          ;C2B7DE|9C6F03  |81036F;
LDY.W #$2000                         ;C2B7E1|A00020  |      ;
ROR A                                ;C2B7E4|6A      |      ;
BCC CODE_C2B7EA                      ;C2B7E5|9003    |C2B7EA;
db $8C,$6A,$03                       ;C2B7E7|        |00036A;

CODE_C2B7EA:
ROR A                                ;C2B7EA|6A      |      ;
BCC CODE_C2B7F0                      ;C2B7EB|9003    |C2B7F0;
STY.W $036E                          ;C2B7ED|8C6E03  |81036E;

CODE_C2B7F0:
ROR A                                ;C2B7F0|6A      |      ;
ROR A                                ;C2B7F1|6A      |      ;
ROR A                                ;C2B7F2|6A      |      ;
ROR A                                ;C2B7F3|6A      |      ;
LDY.W #$00E0                         ;C2B7F4|A0E000  |      ;
ROR A                                ;C2B7F7|6A      |      ;
BCC CODE_C2B7FD                      ;C2B7F8|9003    |C2B7FD;
LDY.W #$0100                         ;C2B7FA|A00001  |      ;

CODE_C2B7FD:
STY.W $03CC                          ;C2B7FD|8CCC03  |8103CC;
ROR A                                ;C2B800|6A      |      ;
BCS CODE_C2B808                      ;C2B801|B005    |C2B808;
LDA.B #$01                           ;C2B803|A901    |      ;
TSB.W $036F                          ;C2B805|0C6F03  |81036F;

CODE_C2B808:
LDY.W #$FDFF                         ;C2B808|A0FFFD  |      ;
STY.W $035C                          ;C2B80B|8C5C03  |81035C;
STY.W $0360                          ;C2B80E|8C6003  |810360;
STZ.W $03DD                          ;C2B811|9CDD03  |8103DD;
LDA.L LUT_C2EEAE+5,X               ;C2B814|BFB3EE82|82EEB3;
BPL CODE_C2B81D                      ;C2B818|1003    |C2B81D;
INC.W $03DD                          ;C2B81A|EEDD03  |8103DD;

CODE_C2B81D:
LDA.W $03DD                          ;C2B81D|ADDD03  |8103DD;
BNE CODE_C2B83F                      ;C2B820|D01D    |C2B83F;
LDA.L LUT_C2EEAE+5,X               ;C2B822|BFB3EE82|82EEB3;
PHA                                  ;C2B826|48      |      ;
AND.B #$03                           ;C2B827|2903    |      ;
CLC                                  ;C2B829|18      |      ;
ADC.B #$60                           ;C2B82A|6960    |      ;
STA.W BG1SC                          ;C2B82C|8D0721  |812107;
PLA                                  ;C2B82F|68      |      ;
LSR A                                ;C2B830|4A      |      ;
LSR A                                ;C2B831|4A      |      ;
AND.B #$03                           ;C2B832|2903    |      ;
CLC                                  ;C2B834|18      |      ;
ADC.B #$70                           ;C2B835|6970    |      ;
STA.W BG2SC                          ;C2B837|8D0821  |812108;
STA.W $03C4                          ;C2B83A|8DC403  |8103C4;
BRA CODE_C2B85A                      ;C2B83D|801B    |C2B85A;

CODE_C2B83F:
LDA.L LUT_C2EEAE+5,X               ;C2B83F|BFB3EE82|82EEB3;
PHA                                  ;C2B843|48      |      ;
AND.B #$03                           ;C2B844|2903    |      ;
CLC                                  ;C2B846|18      |      ;
ADC.B #$70                           ;C2B847|6970    |      ;
STA.W BG1SC                          ;C2B849|8D0721  |812107;
PLA                                  ;C2B84C|68      |      ;
LSR A                                ;C2B84D|4A      |      ;
LSR A                                ;C2B84E|4A      |      ;
AND.B #$03                           ;C2B84F|2903    |      ;
CLC                                  ;C2B851|18      |      ;
ADC.B #$60                           ;C2B852|6960    |      ;
STA.W BG2SC                          ;C2B854|8D0821  |812108;
STA.W $03C4                          ;C2B857|8DC403  |8103C4;

CODE_C2B85A:
LDA.L LUT_C2EEAE+6,X               ;C2B85A|BFB4EE82|82EEB4;
STA.W BGMODE                          ;C2B85E|8D0521  |812105;
PHX                                  ;C2B861|DA      |      ;
LDY.W #$0000                         ;C2B862|A00000  |      ;

CODE_C2B865:
LDA.L LUT_C2EEAE+7,X               ;C2B865|BFB5EE82|82EEB5;
AND.B #$0F                           ;C2B869|290F    |      ;
STA.W $034B,Y                        ;C2B86B|994B03  |81034B;
LDA.L LUT_C2EEAE+7,X               ;C2B86E|BFB5EE82|82EEB5;
AND.B #$F0                           ;C2B872|29F0    |      ;
LSR A                                ;C2B874|4A      |      ;
LSR A                                ;C2B875|4A      |      ;
LSR A                                ;C2B876|4A      |      ;
LSR A                                ;C2B877|4A      |      ;
STA.W $034A,Y                        ;C2B878|994A03  |81034A;
INX                                  ;C2B87B|E8      |      ;
INY                                  ;C2B87C|C8      |      ;
INY                                  ;C2B87D|C8      |      ;
CPY.W #$0008                         ;C2B87E|C00800  |      ;
BNE CODE_C2B865                      ;C2B881|D0E2    |C2B865;
PLX                                  ;C2B883|FA      |      ;
LDA.W $031E                          ;C2B884|AD1E03  |81031E;
BEQ CODE_C2B88B                      ;C2B887|F002    |C2B88B;
BRA CODE_C2B891                      ;C2B889|8006    |C2B891;

CODE_C2B88B:
JSL.L CODE_C29662                    ;C2B88B|22629682|829662;
BCC CODE_C2B899                      ;C2B88F|9008    |C2B899;

CODE_C2B891:
LDA.L LUT_C2EEAE+11,X               ;C2B891|BFB9EE82|82EEB9;
AND.B #$3F                           ;C2B895|293F    |      ;
BRA CODE_C2B8A2                      ;C2B897|8009    |C2B8A2;

CODE_C2B899:
LDA.L LUT_C2EEAE+11,X               ;C2B899|BFB9EE82|82EEB9;
BPL CODE_C2B8A2                      ;C2B89D|1003    |C2B8A2;
INC.W $031E                          ;C2B89F|EE1E03  |81031E;

CODE_C2B8A2:
ASL A                                ;C2B8A2|0A      |      ;
BPL CODE_C2B8A8                      ;C2B8A3|1003    |C2B8A8;
INC.W $031E                          ;C2B8A5|EE1E03  |81031E;

CODE_C2B8A8:
ASL A                                ;C2B8A8|0A      |      ;
BPL CODE_C2B8AE                      ;C2B8A9|1003    |C2B8AE;
INC.W $0445                          ;C2B8AB|EE4504  |810445;

CODE_C2B8AE:
LDA.L LUT_C2EEAE+11,X               ;C2B8AE|BFB9EE82|82EEB9;
AND.B #$0F                           ;C2B8B2|290F    |      ;
STA.W _03BC                          ;C2B8B4|8DBC03  |8103BC;
PLY                                  ;C2B8B7|7A      |      ;
RTS                                  ;C2B8B8|60      |      ;
db $20,$64,$B9,$20,$64,$B9,$20,$64   ;C2B8B9|        |C2B964;
db $B9,$60                           ;C2B8C1|        |00AD60;

CODE_C2B8C3:
LDA.W $03B6                          ;C2B8C3|ADB603  |8103B6;
BIT.B #$20                           ;C2B8C6|8920    |      ;
BEQ CODE_C2B8D0                      ;C2B8C8|F006    |C2B8D0;
INY                                  ;C2B8CA|C8      |      ;
INY                                  ;C2B8CB|C8      |      ;
INY                                  ;C2B8CC|C8      |      ;
INY                                  ;C2B8CD|C8      |      ;
INY                                  ;C2B8CE|C8      |      ;
RTS                                  ;C2B8CF|60      |      ;

CODE_C2B8D0:
JSR.W CODE_C2B964                    ;C2B8D0|2064B9  |C2B964;
STA.W $031A                          ;C2B8D3|8D1A03  |81031A;
JSR.W CODE_C2B964                    ;C2B8D6|2064B9  |C2B964;
STA.W $031C                          ;C2B8D9|8D1C03  |81031C;
LDX.W #$0029                         ;C2B8DC|A22900  |      ;
JSR.W CODE_C2B731                    ;C2B8DF|2031B7  |C2B731;
LDA.W $031E                          ;C2B8E2|AD1E03  |81031E;
CMP.W $031C                          ;C2B8E5|CD1C03  |81031C;
BEQ CODE_C2B8EB                      ;C2B8E8|F001    |C2B8EB;
RTS                                  ;C2B8EA|60      |      ;

CODE_C2B8EB:
LDX.W #$042D                         ;C2B8EB|A22D04  |      ;
JSR.W CODE_C2B9A8                    ;C2B8EE|20A8B9  |C2B9A8;
BCS CODE_C2B8F4                      ;C2B8F1|B001    |C2B8F4;
RTS                                  ;C2B8F3|60      |      ;

CODE_C2B8F4:
LDA.B #$F0                           ;C2B8F4|A9F0    |      ;
STA.W APUI00                          ;C2B8F6|8D4021  |812140;

CODE_C2B8F9:
LDA.W APUI00                          ;C2B8F9|AD4021  |812140;
BNE CODE_C2B8F9                      ;C2B8FC|D0FB    |C2B8F9;
LDA.B #$02                           ;C2B8FE|A902    |      ;
JSL.L wait_for_n_vblanks                    ;C2B900|22C9B182|82B1C9;
LDA.B #$FF                           ;C2B904|A9FF    |      ;
STA.W APUI00                          ;C2B906|8D4021  |812140;
LDA.B #$02                           ;C2B909|A902    |      ;
JSL.L wait_for_n_vblanks                    ;C2B90B|22C9B182|82B1C9;
JSL.L CODE_C5C5AC                    ;C2B90F|22ACC585|85C5AC;
LDA.B #$03                           ;C2B913|A903    |      ;
JSL.L wait_for_n_vblanks                    ;C2B915|22C9B182|82B1C9;
LDA.W $031A                          ;C2B919|AD1A03  |81031A;
STA.W APUI00                          ;C2B91C|8D4021  |812140;
RTS                                  ;C2B91F|60      |      ;

CODE_C2B920:
LDA.W $03B6                          ;C2B920|ADB603  |8103B6;
BIT.B #$10                           ;C2B923|8910    |      ;
BEQ CODE_C2B92E                      ;C2B925|F007    |C2B92E;
db $C8,$C8,$C8,$C8,$C8,$C8,$60       ;C2B927|        |      ;

CODE_C2B92E:
JSR.W CODE_C2B964                    ;C2B92E|2064B9  |C2B964;
PHA                                  ;C2B931|48      |      ;
JSR.W CODE_C2B964                    ;C2B932|2064B9  |C2B964;
JSR.W CODE_C2B964                    ;C2B935|2064B9  |C2B964;
LDX.W #$0029                         ;C2B938|A22900  |      ;
JSR.W CODE_C2B731                    ;C2B93B|2031B7  |C2B731;
LDX.W #$0429                         ;C2B93E|A22904  |      ;
JSR.W CODE_C2B9A8                    ;C2B941|20A8B9  |C2B9A8;
BCS CODE_C2B948                      ;C2B944|B002    |C2B948;
PLA                                  ;C2B946|68      |      ;
RTS                                  ;C2B947|60      |      ;

CODE_C2B948:
REP #$20                             ;C2B948|C220    |      ;
LDA.B [$29]                          ;C2B94A|A729    |000029;
STA.B $23                            ;C2B94C|8523    |000023;
INC.B $29                            ;C2B94E|E629    |000029;
INC.B $29                            ;C2B950|E629    |000029;
SEP #$20                             ;C2B952|E220    |      ;
LDX.W #$3800                         ;C2B954|A20038  |      ;
PLA                                  ;C2B957|68      |      ;
BEQ CODE_C2B95D                      ;C2B958|F003    |C2B95D;
LDX.W #$F000                         ;C2B95A|A200F0  |      ;

CODE_C2B95D:
STX.B $25                            ;C2B95D|8625    |000025;
JSL.L CODE_C2B272                    ;C2B95F|2272B282|82B272;
RTS                                  ;C2B963|60      |      ;

CODE_C2B964:
PHP                                  ;C2B964|08      |      ;
REP #$20                             ;C2B965|C220    |      ;
LDA.B [$2F],Y                        ;C2B967|B72F    |00002F;
INY                                  ;C2B969|C8      |      ;
AND.W #$00FF                         ;C2B96A|29FF00  |      ;
PLP                                  ;C2B96D|28      |      ;
RTS                                  ;C2B96E|60      |      ;

CODE_C2B96F:
STA.B $00                            ;C2B96F|8500    |000000;
LDY.W #$0000                         ;C2B971|A00000  |      ;

CODE_C2B974:
INY                                  ;C2B974|C8      |      ;
INY                                  ;C2B975|C8      |      ;

CODE_C2B976:
LDA.B [$2F],Y                        ;C2B976|B72F    |00002F;
INY                                  ;C2B978|C8      |      ;
CMP.B #$00                           ;C2B979|C900    |      ;
BEQ CODE_C2B974                      ;C2B97B|F0F7    |C2B974;
ASL A                                ;C2B97D|0A      |      ;
BCS CODE_C2B998                      ;C2B97E|B018    |C2B998;
ASL A                                ;C2B980|0A      |      ;
BCS CODE_C2B998                      ;C2B981|B015    |C2B998;
ASL A                                ;C2B983|0A      |      ;
BCS CODE_C2B997                      ;C2B984|B011    |C2B997;
ASL A                                ;C2B986|0A      |      ;
BCS CODE_C2B99A                      ;C2B987|B011    |C2B99A;
ASL A                                ;C2B989|0A      |      ;
BCS CODE_C2B9A0                      ;C2B98A|B014    |C2B9A0;
ASL A                                ;C2B98C|0A      |      ;
BCS CODE_C2B99B                      ;C2B98D|B00C    |C2B99B;
ASL A                                ;C2B98F|0A      |      ;
BCS CODE_C2B999                      ;C2B990|B007    |C2B999;
ASL A                                ;C2B992|0A      |      ;
BCS CODE_C2B998                      ;C2B993|B003    |C2B998;
db $80,$FE                           ;C2B995|        |C2B995;

CODE_C2B997:
INY                                  ;C2B997|C8      |      ;

CODE_C2B998:
INY                                  ;C2B998|C8      |      ;

CODE_C2B999:
INY                                  ;C2B999|C8      |      ;

CODE_C2B99A:
INY                                  ;C2B99A|C8      |      ;

CODE_C2B99B:
INY                                  ;C2B99B|C8      |      ;
INY                                  ;C2B99C|C8      |      ;
INY                                  ;C2B99D|C8      |      ;
BRA CODE_C2B976                      ;C2B99E|80D6    |C2B976;

CODE_C2B9A0:
LDA.B [$2F],Y                        ;C2B9A0|B72F    |00002F;
INY                                  ;C2B9A2|C8      |      ;
CMP.B $00                            ;C2B9A3|C500    |000000;
BNE CODE_C2B976                      ;C2B9A5|D0CF    |C2B976;
RTS                                  ;C2B9A7|60      |      ;

CODE_C2B9A8:
PHP                                  ;C2B9A8|08      |      ;
REP #$20                             ;C2B9A9|C220    |      ;
LDA.B $29                            ;C2B9AB|A529    |000029;
CMP.W $0000,X                        ;C2B9AD|DD0000  |810000;
BNE CODE_C2B9C0                      ;C2B9B0|D00E    |C2B9C0;
SEP #$20                             ;C2B9B2|E220    |      ;
LDA.B $2B                            ;C2B9B4|A52B    |00002B;
CMP.W $0002,X                        ;C2B9B6|DD0200  |810002;
BNE CODE_C2B9C0                      ;C2B9B9|D005    |C2B9C0;
REP #$20                             ;C2B9BB|C220    |      ;
PLP                                  ;C2B9BD|28      |      ;
CLC                                  ;C2B9BE|18      |      ;
RTS                                  ;C2B9BF|60      |      ;

CODE_C2B9C0:
SEP #$20                             ;C2B9C0|E220    |      ;
LDA.B $2B                            ;C2B9C2|A52B    |00002B;
STA.W $0002,X                        ;C2B9C4|9D0200  |810002;
REP #$20                             ;C2B9C7|C220    |      ;
LDA.B $29                            ;C2B9C9|A529    |000029;
STA.W $0000,X                        ;C2B9CB|9D0000  |810000;
PLP                                  ;C2B9CE|28      |      ;
SEC                                  ;C2B9CF|38      |      ;
RTS                                  ;C2B9D0|60      |      ;

init_system:
    PHP                                  ;C2B9D1|08      |      ;
    SEP #$20                             ;C2B9D2|E220    |      ;
    REP #$10                             ;C2B9D4|C210    |      ;
    LDA.B #$80                           ;C2B9D6|A980    |      ;
    STA.W INIDISP                          ;C2B9D8|8D0021  |812100;
    STZ.W OBSEL                          ;C2B9DB|9C0121  |812101;
    STZ.W OAMADDL                          ;C2B9DE|9C0221  |812102;
    STZ.W OAMADDH                          ;C2B9E1|9C0321  |812103;
    STZ.W BGMODE                          ;C2B9E4|9C0521  |812105;
    STZ.W MOSAIC                          ;C2B9E7|9C0621  |812106;
    STZ.W BG1SC                          ;C2B9EA|9C0721  |812107;
    STZ.W BG2SC                          ;C2B9ED|9C0821  |812108;
    STZ.W BG3SC                          ;C2B9F0|9C0921  |812109;
    STZ.W BG4SC                          ;C2B9F3|9C0A21  |81210A;
    STZ.W BG12NBA                          ;C2B9F6|9C0B21  |81210B;
    STZ.W BG34NBA                          ;C2B9F9|9C0C21  |81210C;
    STZ.W BG1HOFS                          ;C2B9FC|9C0D21  |81210D;
    STZ.W BG1HOFS                          ;C2B9FF|9C0D21  |81210D;
    STZ.W BG1VOFS                          ;C2BA02|9C0E21  |81210E;
    STZ.W BG1VOFS                          ;C2BA05|9C0E21  |81210E;
    STZ.W BG2HOFS                          ;C2BA08|9C0F21  |81210F;
    STZ.W BG2HOFS                          ;C2BA0B|9C0F21  |81210F;
    STZ.W BG2VOFS                          ;C2BA0E|9C1021  |812110;
    STZ.W BG2VOFS                          ;C2BA11|9C1021  |812110;
    STZ.W BG3HOFS                          ;C2BA14|9C1121  |812111;
    STZ.W BG3HOFS                          ;C2BA17|9C1121  |812111;
    STZ.W BG3VOFS                          ;C2BA1A|9C1221  |812112;
    STZ.W BG3VOFS                          ;C2BA1D|9C1221  |812112;
    STZ.W BG4HOFS                          ;C2BA20|9C1321  |812113;
    STZ.W BG4HOFS                          ;C2BA23|9C1321  |812113;
    STZ.W BG4VOFS                          ;C2BA26|9C1421  |812114;
    STZ.W BG4VOFS                          ;C2BA29|9C1421  |812114;
    LDA.B #$80                           ;C2BA2C|A980    |      ;
    STA.W VMAIN                          ;C2BA2E|8D1521  |812115;
    STZ.W VMADDL                          ;C2BA31|9C1621  |812116;
    STZ.W VMADDH                          ;C2BA34|9C1721  |812117;
    LDA.B #$80                           ;C2BA37|A980    |      ;
    STA.W M7SEL                          ;C2BA39|8D1A21  |81211A;
    LDA.B #$01                           ;C2BA3C|A901    |      ;
    STZ.W M7A                          ;C2BA3E|9C1B21  |81211B;
    STA.W M7A                          ;C2BA41|8D1B21  |81211B;
    STZ.W M7B                          ;C2BA44|9C1C21  |81211C;
    STZ.W M7B                          ;C2BA47|9C1C21  |81211C;
    STZ.W M7C                          ;C2BA4A|9C1D21  |81211D;
    STZ.W M7C                          ;C2BA4D|9C1D21  |81211D;
    STZ.W M7D                          ;C2BA50|9C1E21  |81211E;
    STA.W M7D                          ;C2BA53|8D1E21  |81211E;
    STZ.W M7X                          ;C2BA56|9C1F21  |81211F;
    STZ.W M7X                          ;C2BA59|9C1F21  |81211F;
    STZ.W M7Y                          ;C2BA5C|9C2021  |812120;
    STZ.W M7Y                          ;C2BA5F|9C2021  |812120;
    STZ.W CGADD                          ;C2BA62|9C2121  |812121;
    STZ.W W12SEL                          ;C2BA65|9C2321  |812123;
    STZ.W W34SEL                          ;C2BA68|9C2421  |812124;
    STZ.W WOBJSEL                          ;C2BA6B|9C2521  |812125;
    STZ.W WH0                          ;C2BA6E|9C2621  |812126;
    STZ.W WH1                          ;C2BA71|9C2721  |812127;
    STZ.W WH2                          ;C2BA74|9C2821  |812128;
    STZ.W WH3                          ;C2BA77|9C2921  |812129;
    STZ.W WBGLOG                          ;C2BA7A|9C2A21  |81212A;
    STZ.W WOBJLOG                          ;C2BA7D|9C2B21  |81212B;
    STZ.W TM                          ;C2BA80|9C2C21  |81212C;
    STZ.W TS                          ;C2BA83|9C2D21  |81212D;
    STZ.W TMW                          ;C2BA86|9C2E21  |81212E;
    STZ.W TSW                          ;C2BA89|9C2F21  |81212F;
    LDA.B #$02                           ;C2BA8C|A902    |      ;
    STA.W CGWSEL                          ;C2BA8E|8D3021  |812130;
    STZ.W CGADSUB                          ;C2BA91|9C3121  |812131;
    LDA.B #$E0                           ;C2BA94|A9E0    |      ;
    STA.W COLDATA                          ;C2BA96|8D3221  |812132;
    STZ.W SETINI                          ;C2BA99|9C3321  |812133;
    STZ.W NMITIMEN                          ;C2BA9C|9C0042  |814200;
    LDA.B #$FF                           ;C2BA9F|A9FF    |      ;
    STA.W WRIO                          ;C2BAA1|8D0142  |814201;
    LDA.B #$00                           ;C2BAA4|A900    |      ;
    STZ.W WRMPYA                          ;C2BAA6|9C0242  |814202;
    STZ.W WRMPYB                          ;C2BAA9|9C0342  |814203;
    STZ.W WRDIVL                          ;C2BAAC|9C0442  |814204;
    STZ.W WRDIVH                          ;C2BAAF|9C0542  |814205;
    STZ.W WRDIVB                          ;C2BAB2|9C0642  |814206;
    STZ.W HTIMEL                          ;C2BAB5|9C0742  |814207;
    STZ.W HTIMEH                          ;C2BAB8|9C0842  |814208;
    STZ.W VTIMEL                          ;C2BABB|9C0942  |814209;
    STZ.W VTIMEH                          ;C2BABE|9C0A42  |81420A;
    STZ.W MDMAEN                          ;C2BAC1|9C0B42  |81420B;
    STZ.W HDMAEN                         ;C2BAC4|9C0C42  |81420C;
    LDA.B #$01                           ;C2BAC7|A901    |      ;
    STA.W MEMSEL                          ;C2BAC9|8D0D42  |81420D;
    REP #$20                             ;C2BACC|C220    |      ;
    LDX.W #$0000                         ;C2BACE|A20000  |      ;
    LDA.W #$0000                         ;C2BAD1|A90000  |      ;

-:
    STA.W 0, X                        ;C2BAD4|9D0000  |810000;
    INX                                  ;C2BAD7|E8      |      ;
    INX                                  ;C2BAD8|E8      |      ;
    CPX.W #$1F00                         ;C2BAD9|E0001F  |      ;
    BNE -                      ;C2BADC|D0F6    |C2BAD4;

    LDX.W #$2000                         ;C2BADE|A20020  |      ;
-:
    STA.L $7E0000,X                      ;C2BAE1|9F00007E|7E0000;
    INX                                  ;C2BAE5|E8      |      ;
    INX                                  ;C2BAE6|E8      |      ;
    BNE -                      ;C2BAE7|D0F8    |C2BAE1;

    LDX.W #$0000                         ;C2BAE9|A20000  |      ;

-:
    STA.L $7F0000,X                      ;C2BAEC|9F00007F|7F0000;
    INX                                  ;C2BAF0|E8      |      ;
    INX                                  ;C2BAF1|E8      |      ;
    BNE -                      ;C2BAF2|D0F8    |C2BAEC;

    SEP #$20                             ;C2BAF4|E220    |      ;
    LDX.W #$8000                         ;C2BAF6|A20080  |      ;
    STX.B $2F                            ;C2BAF9|862F    |00002F;
    LDA.B #$86                           ;C2BAFB|A986    |      ;
    STA.B $31                            ;C2BAFD|8531    |000031;
    PLP                                  ;C2BAFF|28      |      ;
    RTL                                  ;C2BB00|6B      |      ;

init_window_system:
    SEP #$20                             ;C2BB01|E220    |      ;
    LDA.B #$01                           ;C2BB03|A901    |      ;
    STA.W OBSEL                          ;C2BB05|8D0121  |812101;
    LDA.B #$09                           ;C2BB08|A909    |      ;
    STA.W BGMODE                          ;C2BB0A|8D0521  |812105;
    LDA.B #$63                           ;C2BB0D|A963    |      ;
    STA.W BG1SC                          ;C2BB0F|8D0721  |812107;
    LDA.B #$73                           ;C2BB12|A973    |      ;
    STA.W BG2SC                          ;C2BB14|8D0821  |812108;
    LDA.B #$58                           ;C2BB17|A958    |      ;
    STA.W BG3SC                          ;C2BB19|8D0921  |812109;
    LDA.B #$00                           ;C2BB1C|A900    |      ;
    STA.W BG12NBA                          ;C2BB1E|8D0B21  |81210B;
    LDA.B #$04                           ;C2BB21|A904    |      ;
    STA.W BG34NBA                          ;C2BB23|8D0C21  |81210C;
    LDA.B #$33                           ;C2BB26|A933    |      ;
    STA.W W12SEL                          ;C2BB28|8D2321  |812123;
    STA.W W34SEL                          ;C2BB2B|8D2421  |812124;
    STA.W WOBJSEL                          ;C2BB2E|8D2521  |812125;
    LDA.B #$00                           ;C2BB31|A900    |      ;
    STA.W WH0                          ;C2BB33|8D2621  |812126;
    LDA.B #$FF                           ;C2BB36|A9FF    |      ;
    STA.W WH1                          ;C2BB38|8D2721  |812127;
    LDA.B #$00                           ;C2BB3B|A900    |      ;
    STA.W WH2                          ;C2BB3D|8D2821  |812128;
    STA.W WH3                          ;C2BB40|8D2921  |812129;
    LDA.B #$82                           ;C2BB43|A982    |      ;
    STA.W CGWSEL                          ;C2BB45|8D3021  |812130;
    LDA.B #$07                           ;C2BB48|A907    |      ;
    STA.W TM                          ;C2BB4A|8D2C21  |81212C;
    RTL                                  ;C2BB4D|6B      |      ;

incsrc "text_bank2/intro_texts.asm"

db $09,$0A,$01   ;C2C2F6|        |      ;
db $DC,$02,$02,$04,$01,$1C,$03,$02   ;C2C2FE|        |000202;
db $05,$01,$5C,$03,$02,$06,$01,$9C   ;C2C306|        |000001;
db $03,$02,$07,$01,$DC,$03,$02,$08   ;C2C30E|        |000002;
db $00

incsrc "text_bank2/outro_texts.asm"

txt_main_menu:
; @NEW_TEXT@
; SETPOS $88 $00
; DRAWBOX $16 $16
; SETPOS $4C $01 "Welcher Spielstand ?" NO_NEWLINE
; SETPOS $18 $02 "Name" NO_NEWLINE
; SETPOS $26 $02 "Lev" NO_NEWLINE
; SETPOS $2E $02 "Area" NO_NEWLINE
; SETPOS $CA $02
; " Nr1:\n\n\n" NO_NEWLINE
; " Nr2:\n\n\n" NO_NEWLINE
; " Nr3:\n\n\n" NO_NEWLINE
; " Nr4:\n\n\n" NO_NEWLINE
; " Spielstand löschen" NO_NEWLINE
db $01,$88,$00
db $07,$16,$16
db $01,$4C,$01,'W','e','l','c','h','e','r',' ','S','p','i','e','l','s','t','a','n','d',' ','?'
db $01,$18,$02,'N','a','m','e'
db $01,$26,$02,'L','e','v'
db $01,$2E,$02,'A','r','e','a'
db $01,$CA,$02
db ' ','N','r','1',':',$0D,$0D,$0D
db ' ','N','r','2',':',$0D,$0D,$0D
db ' ','N','r','3',':',$0D,$0D,$0D
db ' ','N','r','4',':',$0D,$0D,$0D
db ' ','S','p','i','e','l','s','t','a','n','d',' ','l','ö','s','c','h','e','n'
db $00
; @ENDSTRING@

txt_save1_stats:
; @NEW_TEXT@
; SETPOS $D4 $02
; PLAYER_NAME8
; SETPOS $E8 $02
; DECVAL $02 $045C
; SETPOS $F2 $02
; DECVAL $01 $045E
db $01,$D4,$02
db $02,$03
db $01,$E8,$02
db $06,$02 : dw $045C
db $01,$F2,$02
db $06,$01 : dw $045E
db $00
; @ENDSTRING@

txt_save2_stats:
; @NEW_TEXT@
; SETPOS $94 $03
; PLAYER_NAME8
; SETPOS $A8 $03
; DECVAL $02 $045C
; SETPOS $B2 $03
; DECVAL $01 $045E
db $01,$94,$03
db $02,$03
db $01,$A8,$03
db $06,$02 : dw $045C
db $01,$B2,$03
db $06,$01 : dw $045E
db $00
; @ENDSTRING@

txt_save3_stats:
; @NEW_TEXT@
; SETPOS $54 $04
; PLAYER_NAME8
; SETPOS $68 $04
; DECVAL $02 $045C
; SETPOS $72 $04
; DECVAL $01 $045E
db $01,$54,$04
db $02,$03
db $01,$68,$04
db $06,$02 : dw $045C
db $01,$72,$04
db $06,$01 : dw $045E
db $00
; @ENDSTRING@

txt_save4_stats:
; @NEW_TEXT@
; SETPOS $14 $05
; PLAYER_NAME8
; SETPOS $28 $05
; DECVAL $02 $045C
; SETPOS $32 $05
; DECVAL $01 $045E
db $01,$14,$05
db $02,$03
db $01,$28,$05
db $06,$02 : dw $045C
db $01,$32,$05
db $06,$01 : dw $045E
db $00
; @ENDSTRING@

txt_enter_player_name:
; @NEW_TEXT@
; SETPOS $84 $01
; DRAWBOX $1A $13
; SETPOS $4A $02
; " Gib Deinen Namen ein." NO_NEWLINE
; SETPOS $18 $03
; PLAYER_NAME
; CURSIVE
; SETPOS $58 $03
; "--------" NO_NEWLINE
db $01,$84,$01
db $07,$1A,$13
db $01,$4A,$02
db ' ','G','i','b',' ','D','e','i','n','e','n',' ','N','a','m','e','n',' ','e','i','n','.'
db $01,$18,$03
db $02,$02
db $09
db $01,$58,$03
db '-','-','-','-','-','-','-','-'
db $00
; @ENDSTRING@

txt_enter_player_name_alphabet:
; @NEW_TEXT@
; SETPOS $C6 $03
; " A B C D E F G H I J K L M\n"
; " N O P Q R S T U V W X Y Z\n\n"
; " a b c d e f g h i j k l m\n"
; " n o p q r s t u v w x y z\n\n"
; " 0 1 2 3 4 5 6 7 8 9 . \x24 \x23\n"
db $01,$C6,$03
db ' ','A',' ','B',' ','C',' ','D',' ','E',' ','F',' ','G',' ','H',' ','I',' ','J',' ','K',' ','L',' ','M',$0D,$0D
db ' ','N',' ','O',' ','P',' ','Q',' ','R',' ','S',' ','T',' ','U',' ','V',' ','W',' ','X',' ','Y',' ','Z',$0D,$0D,$0D
db ' ','a',' ','b',' ','c',' ','d',' ','e',' ','f',' ','g',' ','h',' ','i',' ','j',' ','k',' ','l',' ','m',$0D,$0D
db ' ','n',' ','o',' ','p',' ','q',' ','r',' ','s',' ','t',' ','u',' ','v',' ','w',' ','x',' ','y',' ','z',$0D,$0D,$0D
db ' ','0',' ','1',' ','2',' ','3',' ','4',' ','5',' ','6',' ','7',' ','8',' ','9',' ','.',' ',$24,' ',$23,$0D,$0D
db $00
; @ENDSTRING@

txt_clear_enter_player_name_box:
; @NEW_TEXT@
; CLEARBOX $84 $01
db $08,$84,$01
db $00
; @ENDSTRING@

txt_next_level:
; @NEW_TEXT@
; CURSIVE BOLD
; SETPOS 18 2
; "Höherer Level!" NO_NEWLINE
db $09,$03,$24
db $01,$12,$02
db 'H','ö','h','e','r','e','r',' ','L','e','v','e','l','!'
db $00
; @ENDSTRING@

txt_delete_next_level:
; @NEW_TEXT@
; CURSIVE
; SETPOS 18 2
; "@@@@@@@@@@@@@@" NO_NEWLINE
db $09
db $01,$12,$02
db '@','@','@','@','@','@','@','@','@','@','@','@','@','@'
db $00
; @ENDSTRING@

txt_current_map:
; @NEW_TEXT@
; SETPOS 18 2
; SPACE 14
; SETPOS $84 1
; DRAWBOX 26 2
; LOOKUP SectionNamesTable $1C6A
db $01,$12,$02
db $14,$0E
db $01,$84,$01
db $07,$1A,$02
db $05 : dw SectionNamesTable,$1C6A
db $00
; @ENDSTRING@

txt_lairs_remaining:
; @NEW_TEXT@
; SETPOS $1E $05
; DRAWBOX 13 4
; "Monsterhöhlen\n\n" NO_NEWLINE
; "     Übrig " NO_NEWLINE
; DECVAL 2 lair_remaining_ascii
db $01,$1E,$05
db $07,$0D,$04
db 'M','o','n','s','t','e','r','h','ö','h','l','e','n',$0D,$0D
db $14,$05,'Ü','b','r','i','g',' '
db $06,$02 : dw lair_remaining_ascii
db $00
; @ENDSTRING@

txt_clear_pause_menu:
; @NEW_TEXT@
; CLEARBOX $84 $01
; CLEARBOX $1E $05
db $08,$84,$01
db $08,$1E,$05
db $00
; @ENDSTRING@

txt_stats_menu:
; @NEW_TEXT@
;; Draw box and set positions
; SETPOS $12 $02
; SPACE $0E
; SETPOS $86 $01
; DRAWBOX $17 $13
; BOLD OFF
;; print player name
; SETPOS $0C 02
; PLAYER_NAME
;; print current and max health
; SETPOS $22 $02
; "HP" NO_NEWLINE
; SETPOS $28 $02
; DECVAL 03 player_current_health_ascii
; "/" NO_NEWLINE
; SETPOS $30 $02
; DECVAL 03 player_max_health_ascii
;; print next level exp
; SETPOS $88 02
; "Folg. Level :" NO_NEWLINE
; SETPOS $A6 $02
; DECVAL $08 ExpNeededForNextLevel
;; print current strength
; SETPOS $1E $03
; REPEAT $26 player_strength_from_level
; SETPOS $5E $03
; REPEAT $26 player_strength_from_item
; SETPOS $48 $03
; "Stärke   :" NO_NEWLINE
;; print current defense
; SETPOS $DE $03
; REPEAT $27 player_defense_from_level
; SETPOS $1E $04
; REPEAT $27 player_defense_from_item
; SETPOS $08 $04
; "Abwehr   :" NO_NEWLINE
;; print equipped weapon
; SETPOS $C8 $04
; "Waffe :" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.sword
;; print equipped armor
; SETPOS $48 $05
; "Schutz:" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.armor
;; print equipped magic
; SETPOS $C8 $05
; "Magie :" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.magic
;; print equipped item
; SETPOS $48 $06
; "Dinge :" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.item
db $01,$12,$02
db $14,$0E
db $01,$86,$01
db $07,$17,$13
db $03,$20
db $01,$0C,$02
db $02,$02
db $01,$22,$02
db 'H','P'
db $01,$28,$02
db $06,$03 : dw player_current_health_ascii
db '/'
db $01,$30,$02
db $06,$03 : dw player_max_health_ascii
db $01,$88,$02
db 'F','o','l','g','.',' ','L','e','v','e','l',' ',':'
db $01,$A6,$02
db $06,$08 : dw ExpNeededForNextLevel
db $01,$1E,$03
db $0B,$26 : dw player_strength_from_level
db $01,$5E,$03
db $0B,$26 : dw player_strength_from_item
db $01,$48,$03
db 'S','t','ä','r','k','e',$14,$03,':'
db $01,$DE,$03
db $0B,$27 : dw player_defense_from_level
db $01,$1E,$04
db $0B,$27 : dw player_defense_from_item
db $01,$08,$04
db 'A','b','w','e','h','r',$14,$03,':'
db $01,$C8,$04
db 'W','a','f','f','e',' ',':'
db $05 : dw AllItemsTable : dw Equipment.sword
db $01,$48,$05
db 'S','c','h','u','t','z',':'
db $05 : dw AllItemsTable : dw Equipment.armor
db $01,$C8,$05
db $9A,':'
db $05 : dw AllItemsTable : dw Equipment.magic
db $01,$48,$06
db 'D','i','n','g','e',' ',':'
db $05 : dw AllItemsTable : dw Equipment.item
db $00
; @ENDSTRING@

txt_soul_menu:
; @NEW_TEXT@
; CLEARBOX $86 $01
; SETPOS $88 $01
; DRAWBOX $16 $13
; SETPOS $58 $02
; "Seelen" NO_NEWLINE
db $08,$86,$01
db $01,$88,$01
db $07,$16,$13
db $01,$58,$02
db 'S','e','e','l','e','n'
db $00
; @ENDSTRING@

osd_soul_names:
.soul_of_magician:
; @NEW_TEXT@
; SETPOS $0C $03
; "Seele@der@Magie@@@@@@" NO_NEWLINE
db $01,$0C,$03
db 'S','e','e','l','e','@','d','e','r','@','M','a','g','i','e','@','@','@','@','@','@'
db $00
; @ENDSTRING@

.soul_of_light:
; @NEW_TEXT@
; SETPOS $CC $03
; "Seele@des@Lichts@@@@@" NO_NEWLINE
db $01,$CC,$03
db 'S','e','e','l','e','@','d','e','s','@','L','i','c','h','t','s','@','@','@','@','@'
db $00
; @ENDSTRING@

.soul_of_protection:
; @NEW_TEXT@
; SETPOS $8C $04
; "Seele@des@Schildes@@@" NO_NEWLINE
db $01,$8C,$04
db 'S','e','e','l','e','@','d','e','s','@','S','c','h','i','l','d','e','s','@','@','@'
db $00
; @ENDSTRING@

.soul_of_detection:
; @NEW_TEXT@
; SETPOS $4C $05
; "Seele@der@Entdeckung@" NO_NEWLINE
db $01,$4C,$05
db 'S','e','e','l','e','@','d','e','r','@','E','n','t','d','e','c','k','u','n','g','@'
db $00
; @ENDSTRING@

.soul_of_reality:
; @NEW_TEXT@
; SETPOS $0C $06
; "Seele@der@Realität@@@" NO_NEWLINE
db $01,$0C,$06
db 'S','e','e','l','e','@','d','e','r','@','R','e','a','l','i','t','ä','t','@','@','@'
db $00
; @ENDSTRING@
osd_item_menu_end:

osd_item_menu:
; @NEW_TEXT@
;; draw and print header
; SETPOS $88 $00
; DRAWBOX $06 $0C
; "Waffen" NO_NEWLINE
; SETPOS $98 $00
; DRAWBOX $06 $0C
; "Schutz" NO_NEWLINE
; SETPOS $A8 $00
; DRAWBOX $06 $0C
; "Magie" NO_NEWLINE
;; draw and print lower box
; LABEL osd_item_menu_lower_part
; SETPOS $08 $04
; DRAWBOX $16 $08
; SETPOS $8A $04
; " Waf.:" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.sword
; "\n\n Sch.:" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.armor
; "\n\n Mag.:" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.magic
; "\n\n Ding:" NO_NEWLINE
; LOOKUP AllItemsTable Equipment.item
db $01,$88,$00
db $07,$06,$0C
db 'W','a','f','f','e','n'
db $01,$98,$00
db $07,$06,$0C
db 'S','c','h','u','t','z'
db $01,$A8,$00
db $07,$06,$0C
db 'M','a','g','i','e'
 osd_item_menu_lower_part:
db $01,$08,$04
db $07,$16,$08
db $01,$8A,$04
db ' ','W','a','f','.',':'
db $05 : dw AllItemsTable : dw Equipment.sword
db $0D,$0D,' ','S','c','h','.',':'
db $05 : dw AllItemsTable : dw Equipment.armor
db $0D,$0D,' ','M','a','g','.',':'
db $05 : dw AllItemsTable : dw Equipment.magic
db $0D,$0D,' ','D','i','n','g',':'
db $05 : dw AllItemsTable : dw Equipment.item
db $00
; @ENDSTRING@

item_menu:
; @NEW_TEXT@
; SETPOS $88 $00
; DRAWBOX $16 $0C
; SETPOS $1A $01
; "Dinge" NO_NEWLINE
db $01,$88,$00
db $07,$16,$0C
db $01,$1A,$01
db 'D','i','n','g','e'
db $00
; @ENDSTRING@

hud_lev_exp_gem_repeat_space:
    db ' '
hud_lev_exp_gem_repeat_lifebar:
    db $19

hud_lev_exp_gem:
; @NEW_TEXT@
; CURSIVE BOLD
; SETPOS $00 $07
; REPEAT $1A .repeat_space
; SETPOS $42 00
; "LEV" NO_NEWLINE
; SETPOS $50 $00
; "EXP" NO_NEWLINE
; SETPOS $6A 00
; "JWL" NO_NEWLINE
; SETPOS $C0 00
; PLAYER
; SETPOS $CC $00
;;TODO: FIND OUT WHAT THIS IS
; "\x03\x28" NO_NEWLINE
; REPEAT $20 .repeat_lifebar
db $09,$03,$24
db $01,$00,$07
db $0B,$1A : dw .repeat_space
db $01,$42,$00
db 'L','E','V'
db $01,$50,$00
db 'E','X','P'
db $01,$6A,$00
db 'J','W','L'
db $01,$C0,$00
db $02,$00
db $01,$CC,$00
db $03,$28
db $0B,$20 : dw .repeat_lifebar
db $00
; @ENDSTRING@

hud_exp:
db $09,$01,$58   ;C2C906|        |      ;
db $00,$03,$20,$06,$08,$78,$1B,$00   ;C2C90E|        |      ;
hud_health:
db $09,$01,$CC,$00,$03,$2C,$04,$88   ;C2C916|        |      ;
db $1B,$8A,$1B,$00
hud_level:
db $09,$01,$4A,$00   ;C2C91E|        |      ;
db $03,$20,$06,$02,$6A,$1B,$00
hud_gold:
db $09   ;C2C926|        |000020;
db $01,$72,$00,$03,$20,$06,$06,$66   ;C2C92E|        |000072;
db $1B,$00

enemy_life_delete:
db $09,$01,$40,$01,$0B,$20   ;C2C936|        |      ;
db $DE,$C8,$00
enemy_life:
db $09,$01,$40,$01,$03   ;C2C93E|        |0000C8;
db $24,$02,$01,$01,$4C,$01,$03,$2C   ;C2C946|        |000002;
db $0B,$20,$DF,$C8,$01,$4C,$01,$04   ;C2C94E|        |      ;
db $36,$03,$38,$03,$00

osd2lut:
    dw .player, .enemy, player_name, player_name8, .ayer
    dw .healthbar, .punctuation, .sym2, .lmno

.player:        db $0A, $0B, $0C, $0D, $0E, $0F, $00
.enemy:         db $10, $11, $12, $13, $14, $15, $00
.ayer:          db $0C, $0D, $0E, $0F, $00
.healthbar:     db $1C, $1D, $1E, $1F, $00
.punctuation:   db $2C, $2D, $2E, $2F, $00
.sym2:          db $3C, $3D, $3E, $3F, $00
.lmno:          db $4C, $4D, $4E, $4F, $00

incsrc "text_bank2/section_names.asm"
incsrc "text_bank2/choices.asm"
incsrc "text_bank2/all_items.asm"
incsrc "text_bank2/character_names.asm"
incsrc "text_bank2/lvl_str_def.asm"
incsrc "text_bank2/item_descriptions.asm"

ItemStrenghTable_Ptr:
    db 0
ItemStrenghTable:
    db 1, 2, 3, 4, 6, 8, 10, 12
    db 0, 0, 0, 0, 0, 0,  0,  0

ItemDefenseTable_Ptr:
    db 0
    db 0, 0, 0, 0, 0, 0,  0,  0
ItemDefenseTable:
    db 1, 2, 3, 4, 6, 8, 10, 12
WeaponLevelRequirement: ; BCD values
    dw $1, $5, $11, $15, $16, $19, $22, $24

Txt_Soul_Still_Captured:
; @DEFAULT_TEXTBOX@
; BOLD
; LOOKUP CharacterNamesTable text_lut_id
; BOLD NEWLINE
; "ist noch gefangen." -> Txt_Rcv_End
db $10
db $03,$24
db $05 : dw CharacterNamesTable : dw text_lut_id
db $03,$20,$0D
db $D2,$E0,'g','e','f','a','n','g','e','n','.',$13 : dw Txt_Rcv_End
; @END@

Txt_Soul_Release:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME " befreite "
; BOLD
; LOOKUP CharacterNamesTable text_lut_id
; BOLD "." -> Txt_Rcv_End
db $10
db $02,$02,' ','b','e','f','r','e','i','t','e',' ',$0D
db $03,$24
db $05 : dw CharacterNamesTable : dw text_lut_id
db $03,$20,'.',$13 : dw Txt_Rcv_End
; @END@

Txt_Item_Received:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME " erhielt."
; BOLD
; LOOKUP AllItemsTable text_lut_id
; BOLD "." -> Txt_Rcv_End
db $10
db $02,$02,' ','e','r','h','i','e','l','t','.',$0D
db $03,$24
db $05 : dw AllItemsTable : dw text_lut_id
db $03,$20,'.',$13 : dw Txt_Rcv_End
; @END@

Txt_Item_Empty:
; @DEFAULT_TEXTBOX@
; "Leer.\n" -> Txt_Rcv_End
db $10
db 'L','e','e','r','.',$0D,$13 : dw Txt_Rcv_End
; @END@

Txt_Received_Jwl:
; @DEFAULT_TEXTBOX@
; PLAYER_NAME " fand"
; * DECVAL 3 text_lut_id " JUWELEN." *
;; we fallthrough to Txt_Rcv_End
db $10
db $02,$02,' ','f','a','n','d',$0D
db $03,$24,$06,$03 : dw text_lut_id : db ' ','J','U','W','E','L','E','N','.',$03,$20
; @END@

Txt_Rcv_End:
; @NEW_TEXT@
; WFAK
; CLEARBOX 6 4
; CONT
db $12
db $08,$06,$04
db $0C
; @END@

incsrc "text_bank2/credits.asm"

LUT_C2EEAE:
dw BgmArray+0, BgmArray+12, BgmArray+24, BgmArray+36
dw BgmArray+48, BgmArray+60, BgmArray+72, BgmArray+84
dw BgmArray+96, BgmArray+108, BgmArray+120, BgmArray+132
dw BgmArray+144, BgmArray+156, BgmArray+168, BgmArray+180
dw BgmArray+192, BgmArray+204, BgmArray+216, BgmArray+228
dw BgmArray+240, BgmArray+252, BgmArray+264, BgmArray+276
dw BgmArray+288, BgmArray+324, BgmArray+336, BgmArray+348
dw BgmArray+360, BgmArray+372, BgmArray+384, BgmArray+396
dw BgmArray+408, BgmArray+420, BgmArray+432, BgmArray+300
dw BgmArray+312, 0, 0, 0
dw BgmArray+444, BgmArray+456, BgmArray+468, BgmArray+480
dw BgmArray+492, BgmArray+504, BgmArray+528, BgmArray+540
dw BgmArray+552, BgmArray+564, BgmArray+576, BgmArray+588
dw BgmArray+516, 0, 0, 0
dw 0, 0, 0, 0, BgmArray+600
dw BgmArray+612, BgmArray+624, BgmArray+636, BgmArray+648
dw BgmArray+660, BgmArray+672, BgmArray+684, BgmArray+696
dw BgmArray+708, BgmArray+720, BgmArray+732, 0
dw 0, 0, 0, 0, 0
dw 0, 0, BgmArray+744, BgmArray+756
dw BgmArray+768, BgmArray+780, BgmArray+792, BgmArray+804
dw BgmArray+816, BgmArray+828, BgmArray+840, BgmArray+852
dw BgmArray+864, BgmArray+876, BgmArray+888, 0
dw 0, 0, 0, 0, 0
dw 0, BgmArray+900, BgmArray+912, BgmArray+924
dw BgmArray+936, BgmArray+948, BgmArray+960, BgmArray+972
dw BgmArray+984, BgmArray+996, BgmArray+1008, BgmArray+1020
dw BgmArray+1032, BgmArray+1044, BgmArray+1056, BgmArray+1068
dw BgmArray+1080, 0, 0, 0
dw 0, BgmArray+1092, BgmArray+1104, BgmArray+1116
dw BgmArray+1128, BgmArray+1140, BgmArray+1152, 0
dw 0

macro BgMode(a, b, c, d, e, f, g, h, i, j, k, l)
    db <a>, <b>, <c>, <d>, <e>, <f>, <g>, <h>, <i>, <j>, <k>, <l>
endmacro

.bgm_array_start:
struct BgmArray .bgm_array_start
    .main_window: skip 1
    .sub_window: skip 1
    .color_math_a: skip 1
    .color_math_b: skip 1
    .e: skip 1
    .f: skip 1
    .bgmode: skip 1
    .h: skip 1
    .i: skip 1
    .j: skip 1
    .k: skip 1
    .l: skip 1
endstruct

    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $11, $11, $20)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $43, $24, $8F, $09, $11, $11, $00, $00, $20)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $00, $00, $20)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $00, $00, $20)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $81, $64, $0F, $09, $11, $11, $00, $00, $20)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $0F, $09, $11, $11, $12, $12, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $0F, $09, $11, $11, $12, $12, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $24, $0F, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $64, $0F, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $24, $0F, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $64, $0F, $09, $11, $11, $00, $00, $A0)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $24, $0F, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $64, $0F, $09, $11, $11, $00, $00, $C0)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $0F, $09, $11, $11, $12, $12, $A0)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $0F, $09, $11, $11, $11, $11, $00)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $95, $24, $0F, $0F, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG3, $00, $80, $00, $04, $00, $09, $11, $11, $00, $00, $00)
    %BgMode(!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $24, $8F, $09, $11, $11, $00, $00, $20)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $11, $11, $21)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $01, $26, $8F, $09, $11, $11, $00, $00, $21)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $0F, $09, $11, $11, $11, $11, $21)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $11, $11, $21)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $11, $11, $21)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $0F, $09, $11, $11, $11, $11, $A1)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $01, $26, $8F, $09, $11, $11, $00, $00, $A1)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $03, $09, $11, $11, $00, $00, $01)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $03, $09, $11, $11, $00, $00, $01)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $03, $09, $11, $11, $00, $00, $01)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $02, $82, $83, $24, $03, $09, $11, $11, $11, $11, $01)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $03, $09, $11, $11, $11, $00, $01)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $03, $09, $11, $11, $11, $00, $01)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $03, $09, $11, $11, $11, $00, $01)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $03, $09, $11, $11, $11, $11, $01)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $02, $82, $83, $64, $0F, $09, $11, $11, $11, $11, $01)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $11, $11, $C1)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $11, $11, $22)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $0F, $09, $11, $11, $00, $12, $22)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $03, $24, $8C, $09, $11, $11, $12, $12, $02)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $03, $24, $8C, $09, $11, $11, $12, $12, $02)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $00, $64, $0F, $09, $11, $11, $02, $02, $22)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $03, $24, $8C, $09, $11, $11, $12, $12, $A2)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $03, $24, $8C, $09, $11, $11, $12, $12, $02)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $11, $11, $02)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $11, $11, $02)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $03, $80, $03, $24, $03, $09, $11, $11, $11, $11, $02)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $43, $24, $8C, $09, $11, $11, $00, $00, $02)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $12, $C2)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $12, $A2)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $11, $11, $23)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $03, $24, $03, $09, $11, $11, $00, $12, $23)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $01, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $A2, $24, $0F, $09, $11, $11, $12, $02, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $A2, $24, $0F, $09, $11, $11, $12, $02, $A3)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $14, $14, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $11, $11, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $11, $11, $A3)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $64, $03, $09, $11, $11, $11, $11, $C3)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $12, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $26, $8F, $09, $11, $11, $14, $14, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $0F, $09, $11, $11, $12, $12, $03)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $11, $11, $24)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $12, $24)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $12, $24)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $64, $03, $09, $11, $11, $12, $12, $24)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $64, $03, $09, $11, $11, $12, $12, $24)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $12, $12, $A4)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $35, $03, $09, $11, $11, $12, $12, $04)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $43, $26, $8F, $09, $11, $11, $11, $11, $04)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $35, $0F, $09, $11, $11, $12, $12, $04)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $0F, $09, $11, $11, $12, $12, $C4)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $43, $26, $8F, $09, $11, $11, $11, $11, $A4)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $B6, $0F, $09, $11, $11, $11, $11, $04)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $B6, $0F, $09, $11, $11, $11, $11, $04)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $E4, $0F, $09, $11, $11, $11, $11, $25)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $24, $0F, $09, $11, $11, $11, $11, $25)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $01, $01, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $B6, $0F, $09, $11, $11, $11, $11, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $B6, $0F, $09, $11, $11, $11, $11, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $B6, $0F, $09, $11, $11, $11, $11, $A5)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $01, $01, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $82, $00, $B6, $0F, $09, $11, $11, $11, $11, $05)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $02, $02, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $B6, $0F, $09, $11, $11, $11, $11, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $00, $B6, $0F, $09, $11, $11, $11, $11, $05)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $02, $02, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $03, $09, $11, $11, $11, $01, $05)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $02, $24, $0F, $09, $11, $11, $11, $11, $25)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $43, $26, $8F, $09, $11, $11, $01, $11, $C5)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $12, $82, $43, $26, $8F, $09, $11, $11, $01, $11, $A5)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $03, $E4, $0F, $09, $11, $11, $11, $11, $26)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $02, $82, $43, $24, $0F, $09, $11, $11, $00, $12, $06)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $02, $82, $43, $24, $0F, $09, $11, $11, $00, $12, $06)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $02, $82, $43, $24, $0F, $09, $11, $11, $11, $11, $06)
    %BgMode(!BGM_BG1|!BGM_BG3|!BGM_Obj, $00, $80, $01, $64, $0F, $09, $11, $11, $00, $00, $06)
    %BgMode(!BGM_BG1|!BGM_BG2|!BGM_BG3|!BGM_Obj, $00, $80, $82, $74, $03, $09, $11, $11, $11, $11, $06)



db $07,$07,$07,$07   ;C2F436|        |000011;
db $07,$07,$07,$07,$07,$07,$07,$07   ;C2F43E|        |000007;
db $07,$07,$07,$07,$00,$01,$02,$03   ;C2F446|        |000007;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F44E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F456|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F45E|        |000005;
db $0C,$0D,$0E,$0F,$07,$07,$07,$07   ;C2F466|        |000E0D;
db $07,$07,$07,$07,$07,$07,$07,$07   ;C2F46E|        |000007;
db $07,$07,$07,$07,$08,$08,$08,$08   ;C2F476|        |000007;
db $08,$08,$08,$08,$08,$08,$08,$08   ;C2F47E|        |      ;
db $08,$08,$08,$08,$00,$01,$02,$03   ;C2F486|        |      ;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F48E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F496|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F49E|        |000005;
db $0C,$0D,$0E,$0F,$08,$08,$08,$08   ;C2F4A6|        |000E0D;
db $08,$08,$08,$08,$08,$08,$08,$08   ;C2F4AE|        |      ;
db $08,$08,$08,$08,$06,$06,$06,$06   ;C2F4B6|        |      ;
db $06,$06,$06,$06,$06,$06,$06,$06   ;C2F4BE|        |000006;
db $06,$06,$06,$06,$00,$01,$02,$03   ;C2F4C6|        |000006;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F4CE|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F4D6|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F4DE|        |000005;
db $0C,$0D,$0E,$0F,$06,$06,$06,$06   ;C2F4E6|        |000E0D;
db $06,$06,$06,$06,$06,$06,$06,$06   ;C2F4EE|        |000006;
db $06,$06,$06,$06,$09,$09,$09,$09   ;C2F4F6|        |000006;
db $09,$09,$09,$09,$09,$09,$09,$09   ;C2F4FE|        |      ;
db $09,$09,$09,$09,$00,$01,$02,$03   ;C2F506|        |      ;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F50E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F516|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F51E|        |000005;
db $0C,$0D,$0E,$0F,$09,$09,$09,$09   ;C2F526|        |000E0D;
db $09,$09,$09,$09,$09,$09,$09,$09   ;C2F52E|        |      ;
db $09,$09,$09,$09,$05,$05,$05,$05   ;C2F536|        |      ;
db $05,$05,$05,$05,$05,$05,$05,$05   ;C2F53E|        |000005;
db $05,$05,$05,$05,$00,$01,$02,$03   ;C2F546|        |000005;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F54E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F556|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F55E|        |000005;
db $0C,$0D,$0E,$0F,$05,$05,$05,$05   ;C2F566|        |000E0D;
db $05,$05,$05,$05,$05,$05,$05,$05   ;C2F56E|        |000005;
db $05,$05,$05,$05,$0A,$0A,$0A,$0A   ;C2F576|        |000005;
db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;C2F57E|        |      ;
db $0A,$0A,$0A,$0A,$00,$01,$02,$03   ;C2F586|        |      ;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F58E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F596|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F59E|        |000005;
db $0C,$0D,$0E,$0F,$0A,$0A,$0A,$0A   ;C2F5A6|        |000E0D;
db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;C2F5AE|        |      ;
db $0A,$0A,$0A,$0A,$04,$04,$04,$04   ;C2F5B6|        |      ;
db $04,$04,$04,$04,$04,$04,$04,$04   ;C2F5BE|        |000004;
db $04,$04,$04,$04,$00,$01,$02,$03   ;C2F5C6|        |000004;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F5CE|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F5D6|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F5DE|        |000005;
db $0C,$0D,$0E,$0F,$04,$04,$04,$04   ;C2F5E6|        |000E0D;
db $04,$04,$04,$04,$04,$04,$04,$04   ;C2F5EE|        |000004;
db $04,$04,$04,$04,$0B,$0B,$0B,$0B   ;C2F5F6|        |000004;
db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;C2F5FE|        |      ;
db $0B,$0B,$0B,$0B,$00,$01,$02,$03   ;C2F606|        |      ;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F60E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F616|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F61E|        |000005;
db $0C,$0D,$0E,$0F,$0B,$0B,$0B,$0B   ;C2F626|        |000E0D;
db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;C2F62E|        |      ;
db $0B,$0B,$0B,$0B,$03,$03,$03,$03   ;C2F636|        |      ;
db $03,$03,$03,$03,$03,$03,$03,$03   ;C2F63E|        |000003;
db $03,$03,$03,$03,$00,$01,$02,$03   ;C2F646|        |000003;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F64E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F656|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F65E|        |000005;
db $0C,$0D,$0E,$0F,$03,$03,$03,$03   ;C2F666|        |000E0D;
db $03,$03,$03,$03,$03,$03,$03,$03   ;C2F66E|        |000003;
db $03,$03,$03,$03,$0C,$0C,$0C,$0C   ;C2F676|        |000003;
db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;C2F67E|        |000C0C;
db $0C,$0C,$0C,$0C,$00,$01,$02,$03   ;C2F686|        |000C0C;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F68E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F696|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F69E|        |000005;
db $0C,$0D,$0E,$0F,$0C,$0C,$0C,$0C   ;C2F6A6|        |000E0D;
db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;C2F6AE|        |000C0C;
db $0C,$0C,$0C,$0C,$02,$02,$02,$02   ;C2F6B6|        |000C0C;
db $02,$02,$02,$02,$02,$02,$02,$02   ;C2F6BE|        |      ;
db $02,$02,$02,$02,$00,$01,$02,$03   ;C2F6C6|        |      ;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F6CE|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F6D6|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F6DE|        |000005;
db $0C,$0D,$0E,$0F,$02,$02,$02,$02   ;C2F6E6|        |000E0D;
db $02,$02,$02,$02,$02,$02,$02,$02   ;C2F6EE|        |      ;
db $02,$02,$02,$02,$0D,$0D,$0D,$0D   ;C2F6F6|        |      ;
db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;C2F6FE|        |000D0D;
db $0D,$0D,$0D,$0D,$00,$01,$02,$03   ;C2F706|        |000D0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F70E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F716|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F71E|        |000005;
db $0C,$0D,$0E,$0F,$0D,$0D,$0D,$0D   ;C2F726|        |000E0D;
db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;C2F72E|        |000D0D;
db $0D,$0D,$0D,$0D,$01,$01,$01,$01   ;C2F736|        |000D0D;
db $01,$01,$01,$01,$01,$01,$01,$01   ;C2F73E|        |000001;
db $01,$01,$01,$01,$00,$01,$02,$03   ;C2F746|        |000001;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F74E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F756|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F75E|        |000005;
db $0C,$0D,$0E,$0F,$01,$01,$01,$01   ;C2F766|        |000E0D;
db $01,$01,$01,$01,$01,$01,$01,$01   ;C2F76E|        |000001;
db $01,$01,$01,$01,$0E,$0E,$0E,$0E   ;C2F776|        |000001;
db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;C2F77E|        |000E0E;
db $0E,$0E,$0E,$0E,$00,$01,$02,$03   ;C2F786|        |000E0E;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F78E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F796|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F79E|        |000005;
db $0C,$0D,$0E,$0F,$0E,$0E,$0E,$0E   ;C2F7A6|        |000E0D;
db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;C2F7AE|        |000E0E;
db $0E,$0E,$0E,$0E,$00,$00,$00,$00   ;C2F7B6|        |000E0E;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2F7BE|        |      ;
db $00,$00,$00,$00,$00,$01,$02,$03   ;C2F7C6|        |      ;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F7CE|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F7D6|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F7DE|        |000005;
db $0C,$0D,$0E,$0F,$00,$00,$00,$00   ;C2F7E6|        |000E0D;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2F7EE|        |      ;
db $00,$00,$00,$00,$0F,$0F,$0F,$0F   ;C2F7F6|        |      ;
db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;C2F7FE|        |0F0F0F;
db $0F,$0F,$0F,$0F,$00,$01,$02,$03   ;C2F806|        |0F0F0F;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F80E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F816|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F81E|        |000005;
db $0C,$0D,$0E,$0F,$0F,$0F,$0F,$0F   ;C2F826|        |000E0D;
db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;C2F82E|        |0F0F0F;
db $0F,$0F,$0F,$0F,$10,$10,$10,$10   ;C2F836|        |0F0F0F;
db $10,$10,$10,$10,$10,$10,$10,$10   ;C2F83E|        |C2F850;
db $10,$10,$10,$10,$00,$01,$02,$03   ;C2F846|        |C2F858;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F84E|        |000005;
db $0C,$0D,$0E,$0F,$00,$01,$02,$03   ;C2F856|        |000E0D;
db $04,$05,$06,$07,$08,$09,$0A,$0B   ;C2F85E|        |000005;
db $0C,$0D,$0E,$0F,$10,$10,$10,$10   ;C2F866|        |000E0D;
db $10,$10,$10,$10,$10,$10,$10,$10   ;C2F86E|        |C2F880;
db $10,$10,$10,$10,$01,$02,$03,$04   ;C2F876|        |C2F888;
db $05,$06,$07,$08,$09,$0A,$0B,$0C   ;C2F87E|        |000006;
db $0D,$0E,$0F,$10,$10,$10,$10,$10   ;C2F886|        |000F0E;
db $10,$10,$10,$10,$10,$10,$10,$10   ;C2F88E|        |C2F8A0;
db $10,$10,$10,$10,$01,$0F,$00,$00   ;C2F896|        |C2F8A8;
db $10,$01,$1F,$00,$D0,$01,$0F,$00   ;C2F89E|        |C2F8A1;
db $3F,$10,$01,$1F,$3F,$D0,$01,$0F   ;C2F8A6|        |1F0110;
db $00,$00,$2F,$40,$03,$00,$EF,$01   ;C2F8AE|        |      ;
db $0F,$00,$1D,$12,$06,$1D,$1D,$D2   ;C2F8B6|        |121D00;
db $00,$FF,$00,$05,$06,$01,$01,$00   ;C2F8BE|        |      ;
db $0F,$00,$FF,$00,$07,$08,$01,$01   ;C2F8C6|        |00FF00;
db $03,$0F,$00,$00,$02,$07,$08,$01   ;C2F8CE|        |00000F;
db $01,$00,$0F,$00,$24,$02,$09,$06   ;C2F8D6|        |000000;
db $01,$01,$00,$0F,$06,$32,$02,$0B   ;C2F8DE|        |000001;
db $30,$02,$04,$1C,$00,$06,$32,$02   ;C2F8E6|        |C2F8EA;
db $0F,$36,$01,$01,$1E,$00,$14,$3B   ;C2F8EE|        |010136;
db $02,$05,$06,$01,$01,$00,$0F,$14   ;C2F8F6|        |      ;
db $70,$02,$09,$06,$01,$01,$00,$0F   ;C2F8FE|        |C2F902;
db $18,$41,$02,$0D,$08,$01,$02,$00   ;C2F906|        |      ;
db $0E,$28,$2A,$00,$05,$06,$01,$01   ;C2F90E|        |002A28;
db $00,$0F,$28,$78,$02,$09,$06,$01   ;C2F916|        |      ;
db $01,$00,$0F,$3C,$F9,$02,$05,$06   ;C2F91E|        |000000;
db $01,$01,$00,$0F,$3C,$E4,$02,$09   ;C2F926|        |000001;
db $06,$01,$01,$00,$0F,$50,$1C,$03   ;C2F92E|        |000001;
db $05,$06,$01,$01,$00,$0F,$50,$2D   ;C2F936|        |000006;
db $03,$09,$06,$01,$01,$00,$0F,$64   ;C2F93E|        |000009;
db $6A,$03,$05,$06,$01,$01,$00,$0F   ;C2F946|        |      ;
db $64,$93,$03,$09,$06,$01,$01,$00   ;C2F94E|        |000093;
db $0F,$78,$97,$03,$05,$06,$01,$01   ;C2F956|        |039778;
db $00,$0F,$78,$A2,$03,$09,$06,$01   ;C2F95E|        |      ;
db $01,$00,$0F,$16,$20,$00,$05,$0B   ;C2F966|        |000000;
db $05,$04,$11,$00,$16,$1F,$00,$08   ;C2F96E|        |000004;
db $12,$01,$01,$19,$00,$16,$4F,$00   ;C2F976|        |000001;
db $08,$12,$01,$01,$19,$01,$16,$74   ;C2F97E|        |      ;
db $02,$18,$15,$03,$04,$16,$00,$23   ;C2F986|        |      ;
db $61,$02,$19,$19,$01,$01,$19,$1A   ;C2F98E|        |000002;
db $23,$61,$02,$19,$0C,$01,$02,$19   ;C2F996|        |000061;
db $12,$15,$75,$02,$1B,$06,$03,$03   ;C2F99E|        |000015;
db $0D,$08,$24,$58,$02,$1D,$09,$01   ;C2F9A6|        |002408;
db $01,$1C,$5C,$24,$58,$02,$0F,$05   ;C2F9AE|        |00001C;
db $02,$02,$0E,$09,$33,$7C,$02,$05   ;C2F9B6|        |      ;
db $43,$01,$08,$0A,$43,$33,$7C,$02   ;C2F9BE|        |000001;
db $05,$41,$01,$02,$06,$41,$33,$7C   ;C2F9C6|        |000041;
db $02,$05,$40,$01,$01,$0A,$40,$33   ;C2F9CE|        |      ;
db $7C,$02,$0E,$15,$01,$01,$0E,$14   ;C2F9D6|        |C20E02;
db $33,$7C,$02,$02,$34,$02,$01,$02   ;C2F9DE|        |00007C;
db $33,$34,$79,$02,$07,$2A,$05,$04   ;C2F9E6|        |000034;
db $00,$3C,$72,$FF,$00,$1B,$17,$02   ;C2F9EE|        |      ;
db $04,$01,$2C,$71,$FF,$00,$17,$22   ;C2F9F6|        |000001;
db $01,$01,$17,$21,$0F,$50,$02,$00   ;C2F9FE|        |000001;
db $10,$10,$0B,$00,$20,$0F,$95,$03   ;C2FA06|        |C2FA18;
db $10,$06,$0E,$0A,$10,$26,$0F,$03   ;C2FA0E|        |C2FA16;
db $03,$0D,$0A,$08,$06,$10,$20,$0F   ;C2FA16|        |00000D;
db $FC,$00,$0D,$00,$02,$09,$00,$00   ;C2FA1E|        |C20D00;
db $2C,$31,$00,$09,$07,$04,$02,$00   ;C2FA26|        |000031;
db $0E,$2D,$BB,$02,$05,$1F,$01,$01   ;C2FA2E|        |00BB2D;
db $02,$22,$3D,$3E,$00,$1F,$2E,$04   ;C2FA36|        |      ;
db $02,$20,$2C,$3D,$3E,$00,$18,$2E   ;C2FA3E|        |      ;
db $06,$02,$18,$2C,$3D,$3E,$00,$11   ;C2FA46|        |000002;
db $2E,$06,$02,$11,$2C,$55,$26,$03   ;C2FA4E|        |000206;
db $01,$08,$11,$05,$01,$68,$55,$26   ;C2FA56|        |000008;
db $03,$03,$03,$12,$04,$03,$63,$73   ;C2FA5E|        |000003;
db $FF,$00,$1B,$17,$02,$04,$01,$2C   ;C2FA66|        |171B00;
db $73,$FF,$00,$17,$22,$01,$01,$17   ;C2FA6E|        |0000FF;
db $21,$65,$46,$00,$00,$12,$01,$2B   ;C2FA76|        |000065;
db $00,$D2,$65,$46,$00,$3F,$12,$01   ;C2FA7E|        |      ;
db $2B,$3F,$D2,$65,$46,$00,$00,$3C   ;C2FA86|        |      ;
db $40,$04,$00,$FC,$65,$8C,$03,$1D   ;C2FA8E|        |      ;
db $12,$05,$01,$1D,$92,$42,$E7,$02   ;C2FA96|        |000005;
db $12,$2E,$0E,$08,$20,$40,$15,$5C   ;C2FA9E|        |00002E;
db $02,$02,$20,$01,$02,$0D,$25,$0E   ;C2FAA6|        |      ;
db $FA,$00,$0F,$34,$04,$02,$0F,$2E   ;C2FAAE|        |      ;
db $0E,$FF,$00,$19,$2F,$01,$01,$19   ;C2FAB6|        |0000FF;
db $2E,$7B,$50,$00,$08,$00,$10,$0C   ;C2FABE|        |00507B;
db $08,$40,$7B,$50,$00,$06,$00,$02   ;C2FAC6|        |      ;
db $03,$06,$40,$7B,$50,$00,$18,$00   ;C2FACE|        |000006;
db $02,$03,$18,$40,$13,$FF,$00,$23   ;C2FAD6|        |      ;
db $23,$13,$0B,$23,$E3,$13,$FF,$00   ;C2FADE|        |000013;
db $34,$29,$02,$02,$2B,$E5,$13,$FF   ;C2FAE6|        |000029;
db $00,$35,$28,$01,$01,$35,$ED,$13   ;C2FAEE|        |      ;
db $FF,$00,$35,$2B,$01,$01,$35,$E6   ;C2FAF6|        |2B3500;
db $13,$FF,$00,$34,$2B,$01,$01,$33   ;C2FAFE|        |0000FF;
db $EA,$13,$FF,$00,$36,$1A,$08,$0C   ;C2FB06|        |      ;
db $36,$9A,$FF,$06,$0B,$04,$03,$20   ;C2FB0E|        |00009A;
db $00,$B0,$00,$0D,$0B,$06,$03,$30   ;C2FB16|        |      ;
db $01,$B0,$00,$0E,$0C,$04,$02,$70   ;C2FB1E|        |0000B0;
db $00,$C0,$00,$0E,$00,$01,$09,$20   ;C2FB26|        |      ;
db $01,$00,$00,$06,$0B,$04,$03,$20   ;C2FB2E|        |000000;
db $00,$B0,$00,$01

db $01,$04,$04,$01   ;C2FB36|        |      ;
db $01,$01,$01,$01,$01,$05,$04,$04   ;C2FB3E|        |000001;
db $04,$01,$04,$04,$01,$02,$02,$01   ;C2FB46|        |000001;
db $01,$01,$04,$01,$01,$01,$01,$04   ;C2FB4E|        |000001;
db $04,$02,$02,$01,$01,$02,$01,$01   ;C2FB56|        |000002;
db $01,$04,$04,$01,$01,$03,$03,$02   ;C2FB5E|        |000004;
db $02,$01,$01,$01,$01,$02,$06,$02   ;C2FB66|        |      ;
db $02,$03,$03,$04,$04,$02,$02,$03   ;C2FB6E|        |      ;
db $03,$04,$04,$03,$03,$04,$04,$02   ;C2FB76|        |000004;
db $01,$02,$02,$03,$03,$00,$00,$00   ;C2FB7E|        |000002;
db $00,$00,$00,$01,$01,$04,$04,$08   ;C2FB86|        |      ;
db $03,$01,$02,$02,$01,$08,$04,$04   ;C2FB8E|        |000001;
db $04,$03,$03,$04,$04,$04,$04,$01   ;C2FB96|        |000003;
db $05,$01,$05,$08,$04,$00,$00,$00   ;C2FB9E|        |000001;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2FBA6|        |      ;
db $00,$00,$00,$01,$01,$04,$04,$03   ;C2FBAE|        |      ;
db $04,$03,$03,$03,$03,$03,$04,$03   ;C2FBB6|        |000003;
db $04,$03,$04,$02,$01,$03,$03,$02   ;C2FBBE|        |000003;
db $06,$04,$04,$00,$00,$00,$00,$00   ;C2FBC6|        |000004;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2FBCE|        |      ;
db $00,$00,$00,$01,$01,$02,$02,$02   ;C2FBD6|        |      ;
db $02,$01,$01,$02,$01,$02,$02,$04   ;C2FBDE|        |      ;
db $04,$02,$06,$04,$04,$02,$02,$02   ;C2FBE6|        |000002;
db $06,$04,$04,$04,$04,$00,$00,$00   ;C2FBEE|        |000004;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2FBF6|        |      ;
db $00,$00,$00,$01,$01,$04,$04,$03   ;C2FBFE|        |      ;
db $03,$03,$03,$04,$04,$04,$04,$02   ;C2FC06|        |000003;
db $02,$02,$02,$02,$02,$02,$02,$02   ;C2FC0E|        |      ;
db $02,$02,$02,$03,$02,$03,$03,$03   ;C2FC16|        |      ;
db $03,$03,$03,$00,$00,$00,$00,$00   ;C2FC1E|        |000003;
db $00,$00,$00,$01,$01,$03,$06,$02   ;C2FC26|        |      ;
db $04,$02,$04,$01,$03,$01,$01,$00   ;C2FC2E|        |000002;
db $00,$00,$00,$00,$01,$01,$01,$01   ;C2FC36|        |      ;
db $02,$01,$03,$01,$04,$02,$01,$02   ;C2FC3E|        |      ;
db $02,$03,$01,$03,$02,$03,$03,$03   ;C2FC46|        |      ;
db $04,$03,$05,$03,$06,$00,$08,$02   ;C2FC4E|        |000003;
db $03,$00,$09,$00,$0A,$00,$0B,$00   ;C2FC56|        |000000;
db $0C,$00,$0D,$00,$02,$04,$01,$04   ;C2FC5E|        |000D00;
db $02,$04,$03,$04,$04,$05,$01,$05   ;C2FC66|        |      ;
db $02,$05,$03,$05,$04,$05,$05,$05   ;C2FC6E|        |      ;
db $06,$05,$07,$05,$08,$05,$09,$05   ;C2FC76|        |000005;
db $0A,$04,$05,$04,$06,$00,$00,$00   ;C2FC7E|        |      ;
db $00,$00,$00,$00,$03,$06,$01,$07   ;C2FC86|        |      ;
db $01,$07,$02,$07,$03,$07,$04,$08   ;C2FC8E|        |000007;
db $01,$08,$02,$08,$03,$08,$04,$09   ;C2FC96|        |000008;
db $01,$09,$02,$07,$05,$00,$00,$00   ;C2FC9E|        |000009;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2FCA6|        |      ;
db $00,$00,$00,$00,$04,$0A,$01,$0B   ;C2FCAE|        |      ;
db $01,$0B,$02,$0B,$03,$0B,$04,$0B   ;C2FCB6|        |00000B;
db $05,$0B,$06,$0B,$07,$0C,$01,$0C   ;C2FCBE|        |00000B;
db $02,$0C,$03,$00,$00,$00,$00,$00   ;C2FCC6|        |      ;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2FCCE|        |      ;
db $00,$00,$00,$00,$05,$0D,$01,$0D   ;C2FCD6|        |      ;
db $02,$0D,$03,$0D,$04,$0D,$05,$0E   ;C2FCDE|        |      ;
db $01,$0E,$02,$0E,$03,$0E,$04,$0E   ;C2FCE6|        |00000E;
db $05,$0F,$01,$0F,$02,$00,$00,$00   ;C2FCEE|        |00000F;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C2FCF6|        |      ;
db $00,$00,$00,$00,$06,$10,$01,$11   ;C2FCFE|        |      ;
db $01,$11,$02,$11,$03,$11,$04,$12   ;C2FD06|        |000011;
db $01,$12,$02,$12,$03,$12,$04,$12   ;C2FD0E|        |000012;
db $05,$12,$06,$12,$07,$13,$01,$13   ;C2FD16|        |000012;
db $02,$13,$03,$00,$00,$00,$00,$00   ;C2FD1E|        |      ;
db $00,$00,$00,$00,$07,$14,$01,$14   ;C2FD26|        |      ;
db $02,$14,$03,$15,$01,$15,$02,$00   ;C2FD2E|        |      ;
db $00,$00,$00                       ;C2FD36|        |      ;

padbyte $FF : pad $C30000
