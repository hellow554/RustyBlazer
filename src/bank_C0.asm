ORG  $C00000
BASE $800000

incsrc "bankC0/_data.asm"

incsrc "bankC0/interruptvector.asm"
incsrc "bankC0/main.asm"

CODE_C0814E:
PHB                                  ;C0814E|8B      |      ;
PHA                                  ;C0814F|48      |      ;
XBA                                  ;C08150|EB      |      ;
PHA                                  ;C08151|48      |      ;
PHX                                  ;C08152|DA      |      ;
PHY                                  ;C08153|5A      |      ;
JSL.L disable_vblank_interrupt                    ;C08154|22AEB182|82B1AE;
INC.W $03A8                          ;C08158|EEA803  |8103A8;
JSL.L prepare_dma_bank0                    ;C0815B|22639882|829863;
JSL.L CODE_C085D2                    ;C0815F|22D28580|8085D2;
JSL.L CODE_C085F0                    ;C08163|22F08580|8085F0;
JSL.L CODE_C28000                    ;C08167|22008082|828000;
JSL.L CODE_C28069                    ;C0816B|22698082|828069;
JSL.L CODE_C2810B                    ;C0816F|220B8182|82810B;
JSL.L CODE_C0871A                    ;C08173|221A8780|80871A;
LDA.W $046E                          ;C08177|AD6E04  |81046E;
BNE CODE_C08184                      ;C0817A|D008    |C08184;
JSL.L update_hud                    ;C0817C|225EA682|82A65E;
JSL.L CODE_C29695                    ;C08180|22959682|829695;

CODE_C08184:
JSL.L CODE_C3814B                    ;C08184|224B8183|83814B;
STZ.W $03A8                          ;C08188|9CA803  |8103A8;
JSL.L enable_interrupts                    ;C0818B|22A2B182|82B1A2;
JSL.L wait_vblank                    ;C0818F|22B7B182|82B1B7;
PLY                                  ;C08193|7A      |      ;
PLX                                  ;C08194|FA      |      ;
PLA                                  ;C08195|68      |      ;
XBA                                  ;C08196|EB      |      ;
PLA                                  ;C08197|68      |      ;
PLB                                  ;C08198|AB      |      ;
RTL                                  ;C08199|6B      |      ;

CODE_C0819A:
PHB                                  ;C0819A|8B      |      ;
PHA                                  ;C0819B|48      |      ;
XBA                                  ;C0819C|EB      |      ;
PHA                                  ;C0819D|48      |      ;
PHX                                  ;C0819E|DA      |      ;
PHY                                  ;C0819F|5A      |      ;
LDA.B #$81                           ;C081A0|A981    |      ;
PHA                                  ;C081A2|48      |      ;
PLB                                  ;C081A3|AB      |      ;
INC.W $03A8                          ;C081A4|EEA803  |8103A8;
JSL.L prepare_dma_bank0                    ;C081A7|22639882|829863;
JSL.L CODE_C085D2                    ;C081AB|22D28580|8085D2;
JSL.L CODE_C085F0                    ;C081AF|22F08580|8085F0;
JSL.L CODE_C28069                    ;C081B3|22698082|828069;
JSL.L CODE_C2810B                    ;C081B7|220B8182|82810B;
JSL.L CODE_C0871A                    ;C081BB|221A8780|80871A;
JSL.L update_hud                    ;C081BF|225EA682|82A65E;
JSL.L CODE_C29695                    ;C081C3|22959682|829695;
JSL.L CODE_C3814B                    ;C081C7|224B8183|83814B;
JSL.L CODE_C28EEA                    ;C081CB|22EA8E82|828EEA;
JSL.L enable_interrupts                    ;C081CF|22A2B182|82B1A2;
JSL.L wait_vblank                    ;C081D3|22B7B182|82B1B7;
JSL.L disable_vblank_interrupt                    ;C081D7|22AEB182|82B1AE;
STZ.W $03A8                          ;C081DB|9CA803  |8103A8;
PLY                                  ;C081DE|7A      |      ;
PLX                                  ;C081DF|FA      |      ;
PLA                                  ;C081E0|68      |      ;
XBA                                  ;C081E1|EB      |      ;
PLA                                  ;C081E2|68      |      ;
PLB                                  ;C081E3|AB      |      ;
RTL                                  ;C081E4|6B      |      ;

CODE_C081E5:
PHB                                  ;C081E5|8B      |      ;
PHA                                  ;C081E6|48      |      ;
XBA                                  ;C081E7|EB      |      ;
PHA                                  ;C081E8|48      |      ;
PHX                                  ;C081E9|DA      |      ;
PHY                                  ;C081EA|5A      |      ;
LDA.B #$81                           ;C081EB|A981    |      ;
PHA                                  ;C081ED|48      |      ;
PLB                                  ;C081EE|AB      |      ;
INC.W $03A8                          ;C081EF|EEA803  |8103A8;
JSL.L prepare_dma_bank0                    ;C081F2|22639882|829863;
JSL.L CODE_C085D2                    ;C081F6|22D28580|8085D2;
JSL.L CODE_C085F0                    ;C081FA|22F08580|8085F0;
JSL.L CODE_C28069                    ;C081FE|22698082|828069;
JSL.L CODE_C2810B                    ;C08202|220B8182|82810B;
JSL.L CODE_C0871A                    ;C08206|221A8780|80871A;
JSL.L update_hud                    ;C0820A|225EA682|82A65E;
JSL.L CODE_C29695                    ;C0820E|22959682|829695;
JSL.L CODE_C3814B                    ;C08212|224B8183|83814B;
JSL.L enable_interrupts                    ;C08216|22A2B182|82B1A2;
JSL.L wait_vblank                    ;C0821A|22B7B182|82B1B7;
JSL.L disable_vblank_interrupt                    ;C0821E|22AEB182|82B1AE;
STZ.W $03A8                          ;C08222|9CA803  |8103A8;
PLY                                  ;C08225|7A      |      ;
PLX                                  ;C08226|FA      |      ;
PLA                                  ;C08227|68      |      ;
XBA                                  ;C08228|EB      |      ;
PLA                                  ;C08229|68      |      ;
PLB                                  ;C0822A|AB      |      ;
RTL                                  ;C0822B|6B      |      ;

incsrc "bankC0/debug_code.asm"

CODE_C08344:
    LDA.W $0490
    BNE + : RTS : +
    AND.B #$F0
    LSR
    LSR
    LSR
    LSR
    XBA
    LDA.B #$0A
    JSL multiply
    PHA
    LDA $490
    AND #$0F
    CLC
    ADC 1, S
    JSL giveItem
    PLA
    STZ $490
    RTS

incsrc "bankC0/nmi_func.asm"

CODE_C08511:
    LDA.W $03B8
    BNE .CODE_C08517
    RTS

.CODE_C08517:
LDA.B #VMDATAL                           ;C08517|A918    |      ;
STA.W DMA_Regs[2].destination                          ;C08519|8D2143  |814321;
LDA.B #$01                           ;C0851C|A901    |      ;
STA.W DMA_Regs[2].control                          ;C0851E|8D2043  |814320;
LDY.W #$0000                         ;C08521|A00000  |      ;
LDX.W #$2000                         ;C08524|A20020  |      ;
STX.W VMADDL                          ;C08527|8E1621  |812116;
JSR.W .CODE_C08550                    ;C0852A|205085  |C08550;
LDX.W #$0000                         ;C0852D|A20000  |      ;

.CODE_C08530:
LDY.W $1A06,X                        ;C08530|BC061A  |811A06;
BEQ .CODE_C08540                      ;C08533|F00B    |C08540;
INC.W $1A07,X                        ;C08535|FE071A  |811A07;
INC.W $1A07,X                        ;C08538|FE071A  |811A07;
INX                                  ;C0853B|E8      |      ;
INX                                  ;C0853C|E8      |      ;
INX                                  ;C0853D|E8      |      ;
BRA .CODE_C08530                      ;C0853E|80F0    |C08530;

.CODE_C08540:
LDY.W #$0000                         ;C08540|A00000  |      ;
LDX.W #$2100                         ;C08543|A20021  |      ;
STX.W VMADDL                          ;C08546|8E1621  |812116;
JSR.W .CODE_C08550                    ;C08549|205085  |C08550;
STZ.W $03B8                          ;C0854C|9CB803  |8103B8;
RTS                                  ;C0854F|60      |      ;

.CODE_C08550:
LDX.W $1A06,Y                        ;C08550|BE061A  |811A06;
BEQ .ret                      ;C08553|F019    |C0856E;
STX.W DMA_Regs[2].source_address_word                          ;C08555|8E2243  |814322;
LDA.W $1A08,Y                        ;C08558|B9081A  |811A08;
STA.W DMA_Regs[2].source_address_bank                          ;C0855B|8D2443  |814324;
LDX.W #$0040                         ;C0855E|A24000  |      ;
STX.W DMA_Regs[2].size_word                          ;C08561|8E2543  |814325;
LDA.B #$04                           ;C08564|A904    |      ;
STA.W MDMAEN                          ;C08566|8D0B42  |81420B;
INY                                  ;C08569|C8      |      ;
INY                                  ;C0856A|C8      |      ;
INY                                  ;C0856B|C8      |      ;
BRA .CODE_C08550                      ;C0856C|80E2    |C08550;

.ret:
RTS                                  ;C0856E|60      |      ;

CODE_C0856F:
LDA.W $03E3                          ;C0856F|ADE303  |8103E3;
BNE CODE_C08575                      ;C08572|D001    |C08575;
RTS                                  ;C08574|60      |      ;

CODE_C08575:
LDA.B #$01                           ;C08575|A901    |      ;
STA.W DMA_Regs[2].control                          ;C08577|8D2043  |814320;
LDA.B #VMDATAL                           ;C0857A|A918    |      ;
STA.W DMA_Regs[2].destination                          ;C0857C|8D2143  |814321;
LDX.W $03DF                          ;C0857F|AEDF03  |8103DF;
STX.W DMA_Regs[2].source_address_word                          ;C08582|8E2243  |814322;
LDA.B #$7F                           ;C08585|A97F    |      ;
STA.W DMA_Regs[2].source_address_bank                          ;C08587|8D2443  |814324;
LDX.W #$0040                         ;C0858A|A24000  |      ;
STX.W DMA_Regs[2].size_word                          ;C0858D|8E2543  |814325;
LDX.W $03E1                          ;C08590|AEE103  |8103E1;
STX.W VMADDL                          ;C08593|8E1621  |812116;
LDA.B #$04                           ;C08596|A904    |      ;
STA.W MDMAEN                          ;C08598|8D0B42  |81420B;
LDX.W #$0040                         ;C0859B|A24000  |      ;
STX.W DMA_Regs[2].size_word                          ;C0859E|8E2543  |814325;
LDA.W $03E1                          ;C085A1|ADE103  |8103E1;
STA.W VMADDL                          ;C085A4|8D1621  |812116;
LDA.W $03E2                          ;C085A7|ADE203  |8103E2;
INC A                                ;C085AA|1A      |      ;
STA.W VMADDH                          ;C085AB|8D1721  |812117;
LDA.B #$04                           ;C085AE|A904    |      ;
STA.W MDMAEN                          ;C085B0|8D0B42  |81420B;
STZ.W $03E3                          ;C085B3|9CE303  |8103E3;
RTS                                  ;C085B6|60      |      ;

CODE_C085B7:
REP #$20                             ;C085B7|C220    |      ;
TSX                                  ;C085B9|BA      |      ;
LDA.W #$1C7A                         ;C085BA|A97A1C  |      ;
TCS                                  ;C085BD|1B      |      ;

CODE_C085BE:
PLA                                  ;C085BE|68      |      ;
BEQ CODE_C085CA                      ;C085BF|F009    |C085CA;
STA.W VMADDL                          ;C085C1|8D1621  |812116;
PLA                                  ;C085C4|68      |      ;
STA.W VMDATAL                          ;C085C5|8D1821  |812118;
BRA CODE_C085BE                      ;C085C8|80F4    |C085BE;

CODE_C085CA:
TXS                                  ;C085CA|9A      |      ;
STZ.W $1C7B                          ;C085CB|9C7B1C  |811C7B;
SEP #$20                             ;C085CE|E220    |      ;
RTS                                  ;C085D0|60      |      ;

IRQ_Func:
    RTI                              ;C085D1|        |      ;

CODE_C085D2:
PHP                                  ;C085D2|08      |      ;
PHB                                  ;C085D3|8B      |      ;
PEI.B ($38)                          ;C085D4|D438    |000038;
PEI.B ($39)                          ;C085D6|D439    |000039;
REP #$20                             ;C085D8|C220    |      ;
STZ.W $1F00                          ;C085DA|9C001F  |811F00;
LDA.W $06B2                          ;C085DD|ADB206  |8106B2;
PEA.W UNREACH_8185E6                 ;C085E0|F4E685  |8185E6;
PEA.W UNREACH_8189EA                 ;C085E3|F4EA89  |8189EA;
RTS                                  ;C085E6|60      |      ;
PLX                                  ;C085E7|FA      |      ;
STX.B $39                            ;C085E8|8639    |000039;
PLX                                  ;C085EA|FA      |      ;
STX.B $38                            ;C085EB|8638    |000038;
PLB                                  ;C085ED|AB      |      ;
PLP                                  ;C085EE|28      |      ;
RTL                                  ;C085EF|6B      |      ;

CODE_C085F0:
PHP                                  ;C085F0|08      |      ;
REP #$20                             ;C085F1|C220    |      ;
LDA.W $06B4                          ;C085F3|ADB406  |8106B4;
LDY.W #$0000                         ;C085F6|A00000  |      ;

CODE_C085F9:
TAX                                  ;C085F9|AA      |      ;
BNE CODE_C085FF                      ;C085FA|D003    |C085FF;
BRL CODE_C086A6                      ;C085FC|82A700  |C086A6;

CODE_C085FF:
LDA.W $0000,X                        ;C085FF|BD0000  |810000;
SEC                                  ;C08602|38      |      ;
SBC.W $0008,X                        ;C08603|FD0800  |810008;
SEC                                  ;C08606|38      |      ;
SBC.W bg1_hofs                          ;C08607|ED3A03  |81033A;
CMP.W #$0100                         ;C0860A|C90001  |      ;
BCC CODE_C08624                      ;C0860D|9015    |C08624;
BMI CODE_C08614                      ;C0860F|3003    |C08614;
BRL CODE_C08697                      ;C08611|828300  |C08697;

CODE_C08614:
LDA.W $0000,X                        ;C08614|BD0000  |810000;
CLC                                  ;C08617|18      |      ;
ADC.W $000C,X                        ;C08618|7D0C00  |81000C;
SEC                                  ;C0861B|38      |      ;
SBC.W bg1_hofs                          ;C0861C|ED3A03  |81033A;
CMP.W #$0100                         ;C0861F|C90001  |      ;
BCS CODE_C08697                      ;C08622|B073    |C08697;

CODE_C08624:
LDA.W $0002,X                        ;C08624|BD0200  |810002;
SEC                                  ;C08627|38      |      ;
SBC.W $000A,X                        ;C08628|FD0A00  |81000A;
SEC                                  ;C0862B|38      |      ;
SBC.W bg1_vofs                          ;C0862C|ED3C03  |81033C;
CMP.W #$00E0                         ;C0862F|C9E000  |      ;
BCC CODE_C08646                      ;C08632|9012    |C08646;
BPL CODE_C08697                      ;C08634|1061    |C08697;
LDA.W $0002,X                        ;C08636|BD0200  |810002;
CLC                                  ;C08639|18      |      ;
ADC.W $000E,X                        ;C0863A|7D0E00  |81000E;
SEC                                  ;C0863D|38      |      ;
SBC.W bg1_vofs                          ;C0863E|ED3C03  |81033C;
CMP.W #$00E0                         ;C08641|C9E000  |      ;
BCS CODE_C08697                      ;C08644|B051    |C08697;

CODE_C08646:
LDA.W $0016,X                        ;C08646|BD1600  |810016;
BIT.W #$2000                         ;C08649|890020  |      ;
BNE CODE_C08688                      ;C0864C|D03A    |C08688;
LDA.W $001A,X                        ;C0864E|BD1A00  |81001A;
BIT.W #$0080                         ;C08651|898000  |      ;
BNE CODE_C08688                      ;C08654|D032    |C08688;
BIT.W #$6000                         ;C08656|890060  |      ;
BEQ CODE_C08665                      ;C08659|F00A    |C08665;
BIT.W #$4000                         ;C0865B|890040  |      ;
BNE CODE_C08671                      ;C0865E|D011    |C08671;
LDA.W #$01FE                         ;C08660|A9FE01  |      ;
BRA CODE_C08678                      ;C08663|8013    |C08678;

CODE_C08665:
LDA.W $0002,X                        ;C08665|BD0200  |810002;
SEC                                  ;C08668|38      |      ;
SBC.W bg1_vofs                          ;C08669|ED3C03  |81033C;
CMP.W #$0100                         ;C0866C|C90001  |      ;
BCC CODE_C08674                      ;C0866F|9003    |C08674;

CODE_C08671:
LDA.W #$00FF                         ;C08671|A9FF00  |      ;

CODE_C08674:
EOR.W #$00FF                         ;C08674|49FF00  |      ;
ASL A                                ;C08677|0A      |      ;

CODE_C08678:
CMP.W #$0200                         ;C08678|C90002  |      ;
BCS CODE_C08678                      ;C0867B|B0FB    |C08678;
STA.W $1900,Y                        ;C0867D|990019  |811900;
TXA                                  ;C08680|8A      |      ;
STA.W $1902,Y                        ;C08681|990219  |811902;
INY                                  ;C08684|C8      |      ;
INY                                  ;C08685|C8      |      ;
INY                                  ;C08686|C8      |      ;
INY                                  ;C08687|C8      |      ;

CODE_C08688:
LDA.W $0016,X                        ;C08688|BD1600  |810016;
AND.W #$7FFF                         ;C0868B|29FF7F  |      ;
STA.W $0016,X                        ;C0868E|9D1600  |810016;
LDA.W $003C,X                        ;C08691|BD3C00  |81003C;
BRL CODE_C085F9                      ;C08694|8262FF  |C085F9;

CODE_C08697:
LDA.W $0016,X                        ;C08697|BD1600  |810016;
ORA.W #$8000                         ;C0869A|090080  |      ;
STA.W $0016,X                        ;C0869D|9D1600  |810016;
LDA.W $003C,X                        ;C086A0|BD3C00  |81003C;
BRL CODE_C085F9                      ;C086A3|8253FF  |C085F9;

CODE_C086A6:
LDA.W #$FFFF                         ;C086A6|A9FFFF  |      ;
STA.W $1900,Y                        ;C086A9|990019  |811900;
LDA.W #oam_data                         ;C086AC|A99204  |      ;
STA.B $02                            ;C086AF|8502    |000002;
TSC                                  ;C086B1|3B      |      ;
STA.B $00                            ;C086B2|8500    |000000;
LDA.W #$18FF                         ;C086B4|A9FF18  |      ;
TCS                                  ;C086B7|1B      |      ;

CODE_C086B8:
PLX                                  ;C086B8|FA      |      ;
BMI CODE_C086F2                      ;C086B9|3037    |C086F2;
LDY.W $0100,X                        ;C086BB|BC0001  |810100;
BNE CODE_C086DA                      ;C086BE|D01A    |C086DA;
LDA.B $02                            ;C086C0|A502    |000002;
STA.W $0100,X                        ;C086C2|9D0001  |810100;
TAY                                  ;C086C5|A8      |      ;
PLA                                  ;C086C6|68      |      ;
STA.W $0000,Y                        ;C086C7|990000  |810000;
LDA.W #$0000                         ;C086CA|A90000  |      ;
STA.W $0002,Y                        ;C086CD|990200  |810002;
LDA.B $02                            ;C086D0|A502    |000002;
CLC                                  ;C086D2|18      |      ;
ADC.W #$0004                         ;C086D3|690400  |      ;
STA.B $02                            ;C086D6|8502    |000002;
BRA CODE_C086B8                      ;C086D8|80DE    |C086B8;

CODE_C086DA:
LDA.B $02                            ;C086DA|A502    |000002;
STA.W $0100,X                        ;C086DC|9D0001  |810100;
TAX                                  ;C086DF|AA      |      ;
PLA                                  ;C086E0|68      |      ;
STA.W $0000,X                        ;C086E1|9D0000  |810000;
TYA                                  ;C086E4|98      |      ;
STA.W $0002,X                        ;C086E5|9D0200  |810002;
LDA.B $02                            ;C086E8|A502    |000002;
CLC                                  ;C086EA|18      |      ;
ADC.W #$0004                         ;C086EB|690400  |      ;
STA.B $02                            ;C086EE|8502    |000002;
BRA CODE_C086B8                      ;C086F0|80C6    |C086B8;

CODE_C086F2:
LDA.W #$00FF                         ;C086F2|A9FF00  |      ;
TCS                                  ;C086F5|1B      |      ;
LDX.W #$0000                         ;C086F6|A20000  |      ;
BRA CODE_C086FD                      ;C086F9|8002    |C086FD;

CODE_C086FB:
PHA                                  ;C086FB|48      |      ;
PLA                                  ;C086FC|68      |      ;

CODE_C086FD:
PLY                                  ;C086FD|7A      |      ;
BEQ CODE_C086FD                      ;C086FE|F0FD    |C086FD;
BMI CODE_C08712                      ;C08700|3010    |C08712;

CODE_C08702:
LDA.W $0000,Y                        ;C08702|B90000  |810000;
STA.W $1900,X                        ;C08705|9D0019  |811900;
INX                                  ;C08708|E8      |      ;
INX                                  ;C08709|E8      |      ;
LDA.W $0002,Y                        ;C0870A|B90200  |810002;
BEQ CODE_C086FB                      ;C0870D|F0EC    |C086FB;
TAY                                  ;C0870F|A8      |      ;
BRA CODE_C08702                      ;C08710|80F0    |C08702;

CODE_C08712:
STZ.W $1900,X                        ;C08712|9E0019  |811900;
LDA.B $00                            ;C08715|A500    |000000;
TCS                                  ;C08717|1B      |      ;
PLP                                  ;C08718|28      |      ;
RTL                                  ;C08719|6B      |      ;

CODE_C0871A:
PHB                                  ;C0871A|8B      |      ;
PHP                                  ;C0871B|08      |      ;
SEP #$20                             ;C0871C|E220    |      ;
REP #$30                             ;C0871E|C230    |      ;
LDA.W #$1A06                         ;C08720|A9061A  |      ;
STA.B $04                            ;C08723|8504    |000004;
STZ.W $1A06                          ;C08725|9C061A  |811A06;
STZ.B $02                            ;C08728|6402    |000002;
LDA.W bg1_hofs                          ;C0872A|AD3A03  |81033A;
SEC                                  ;C0872D|38      |      ;
SBC.W #$0010                         ;C0872E|E91000  |      ;
STA.B $52                            ;C08731|8552    |000052;
LDA.W bg1_vofs                          ;C08733|AD3C03  |81033C;
SEC                                  ;C08736|38      |      ;
SBC.W #$0010                         ;C08737|E91000  |      ;
STA.B $54                            ;C0873A|8554    |000054;
LDA.W #$0692                         ;C0873C|A99206  |      ;
STA.B $4C                            ;C0873F|854C    |00004C;
LDA.W #$0004                         ;C08741|A90400  |      ;
STA.B $4E                            ;C08744|854E    |00004E;
TSC                                  ;C08746|3B      |      ;
STA.B $00                            ;C08747|8500    |000000;
LDA.W #$0691                         ;C08749|A99106  |      ;
TCS                                  ;C0874C|1B      |      ;
LDX.W #$0010                         ;C0874D|A21000  |      ;
LDA.W #$E080                         ;C08750|A980E0  |      ;

CODE_C08753:
PHA                                  ;C08753|48      |      ;
PHA                                  ;C08754|48      |      ;
PHA                                  ;C08755|48      |      ;
PHA                                  ;C08756|48      |      ;
PHA                                  ;C08757|48      |      ;
PHA                                  ;C08758|48      |      ;
PHA                                  ;C08759|48      |      ;
PHA                                  ;C0875A|48      |      ;
PHA                                  ;C0875B|48      |      ;
PHA                                  ;C0875C|48      |      ;
PHA                                  ;C0875D|48      |      ;
PHA                                  ;C0875E|48      |      ;
PHA                                  ;C0875F|48      |      ;
PHA                                  ;C08760|48      |      ;
PHA                                  ;C08761|48      |      ;
PHA                                  ;C08762|48      |      ;
DEX                                  ;C08763|CA      |      ;
BNE CODE_C08753                      ;C08764|D0ED    |C08753;
LDA.B $00                            ;C08766|A500    |000000;
TCS                                  ;C08768|1B      |      ;
LDX.W #$0000                         ;C08769|A20000  |      ;
TXY                                  ;C0876C|9B      |      ;

CODE_C0876D:
LDA.W $1900,X                        ;C0876D|BD0019  |811900;
BEQ CODE_C0877E                      ;C08770|F00C    |C0877E;
INX                                  ;C08772|E8      |      ;
INX                                  ;C08773|E8      |      ;
PHX                                  ;C08774|DA      |      ;
TAX                                  ;C08775|AA      |      ;
JSR.W CODE_C0878D                    ;C08776|208D87  |C0878D;
PLX                                  ;C08779|FA      |      ;
BCS CODE_C0878A                      ;C0877A|B00E    |C0878A;
BRA CODE_C0876D                      ;C0877C|80EF    |C0876D;

CODE_C0877E:
SEP #$20                             ;C0877E|E220    |      ;
LDA.B $00                            ;C08780|A500    |000000;

CODE_C08782:
LSR A                                ;C08782|4A      |      ;
LSR A                                ;C08783|4A      |      ;
DEC.B $4E                            ;C08784|C64E    |00004E;
BNE CODE_C08782                      ;C08786|D0FA    |C08782;
STA.B ($4C)                          ;C08788|924C    |00004C;

CODE_C0878A:
PLP                                  ;C0878A|28      |      ;
PLB                                  ;C0878B|AB      |      ;
RTL                                  ;C0878C|6B      |      ;

CODE_C0878D:
PHB                                  ;C0878D|8B      |      ;
PHX                                  ;C0878E|DA      |      ;
SEP #$20                             ;C0878F|E220    |      ;
LDA.W $0024,X                        ;C08791|BD2400  |810024;
PHA                                  ;C08794|48      |      ;
PLB                                  ;C08795|AB      |      ;
REP #$20                             ;C08796|C220    |      ;
LDA.W $0000,X                        ;C08798|BD0000  |8A0000;
SEC                                  ;C0879B|38      |      ;
SBC.W $0008,X                        ;C0879C|FD0800  |8A0008;
SEC                                  ;C0879F|38      |      ;
SBC.B $52                            ;C087A0|E552    |000052;
STA.B $16                            ;C087A2|8516    |000016;
LDA.W $0002,X                        ;C087A4|BD0200  |8A0002;
SEC                                  ;C087A7|38      |      ;
SBC.W $000A,X                        ;C087A8|FD0A00  |8A000A;
SEC                                  ;C087AB|38      |      ;
SBC.B $54                            ;C087AC|E554    |000054;
STA.B $18                            ;C087AE|8518    |000018;
LDA.W $001C,X                        ;C087B0|BD1C00  |8A001C;
STA.B $50                            ;C087B3|8550    |000050;
STZ.B $06                            ;C087B5|6406    |000006;
LDA.W $0016,X                        ;C087B7|BD1600  |8A0016;
BIT.W #$0800                         ;C087BA|890008  |      ;
BEQ CODE_C087D2                      ;C087BD|F013    |C087D2;
LDA.W $0026,X                        ;C087BF|BD2600  |8B0026;
BMI CODE_C087CA                      ;C087C2|3006    |C087CA;
LSR A                                ;C087C4|4A      |      ;
BCS CODE_C087D2                      ;C087C5|B00B    |C087D2;
BRL CODE_C08853                      ;C087C7|828900  |C08853;

CODE_C087CA:
LSR A                                ;C087CA|4A      |      ;
BCS CODE_C087D2                      ;C087CB|B005    |C087D2;
LDA.W #$0E00                         ;C087CD|A9000E  |      ;
STA.B $06                            ;C087D0|8506    |000006;

CODE_C087D2:
LDA.W $001A,X                        ;C087D2|BD1A00  |8A001A;
BPL CODE_C087DA                      ;C087D5|1003    |C087DA;
BRL CODE_C0885E                      ;C087D7|828400  |C0885E;

CODE_C087DA:
LDA.W $0028,X                        ;C087DA|BD2800  |8E0028;
TAX                                  ;C087DD|AA      |      ;
LDA.W $0000,X                        ;C087DE|BD0000  |8E0000;
INX                                  ;C087E1|E8      |      ;
INX                                  ;C087E2|E8      |      ;
STA.B $0C                            ;C087E3|850C    |00000C;

CODE_C087E5:
LDA.B $50                            ;C087E5|A550    |000050;
ASL A                                ;C087E7|0A      |      ;
LDA.W $0003,X                        ;C087E8|BD0300  |8E0003;
BCC CODE_C087EE                      ;C087EB|9001    |C087EE;
XBA                                  ;C087ED|EB      |      ;

CODE_C087EE:
AND.W #$00FF                         ;C087EE|29FF00  |      ;
CLC                                  ;C087F1|18      |      ;
ADC.B $18                            ;C087F2|6518    |000018;
CMP.W #$00F0                         ;C087F4|C9F000  |      ;
BCS CODE_C08856                      ;C087F7|B05D    |C08856;
SBC.W #$0010                         ;C087F9|E91000  |      ;
STA.W $0493,Y                        ;C087FC|999304  |8E0493;
LDA.W $0005,X                        ;C087FF|BD0500  |8E0005;
EOR.B $50                            ;C08802|4550    |000050;
ORA.B $06                            ;C08804|0506    |000006;
STA.W $0494,Y                        ;C08806|999404  |8E0494;
LDA.B $50                            ;C08809|A550    |000050;
ASL A                                ;C0880B|0A      |      ;
ASL A                                ;C0880C|0A      |      ;
LDA.W $0001,X                        ;C0880D|BD0100  |8E0001;
BCC CODE_C08813                      ;C08810|9001    |C08813;
XBA                                  ;C08812|EB      |      ;

CODE_C08813:
AND.W #$00FF                         ;C08813|29FF00  |      ;
CLC                                  ;C08816|18      |      ;
ADC.B $16                            ;C08817|6516    |000016;
CMP.W #$0110                         ;C08819|C91001  |      ;
BCS CODE_C08856                      ;C0881C|B038    |C08856;
SBC.W #$000F                         ;C0881E|E90F00  |      ;
SEP #$20                             ;C08821|E220    |      ;
STA.W oam_data,Y                        ;C08823|999204  |8E0492;
XBA                                  ;C08826|EB      |      ;
LSR A                                ;C08827|4A      |      ;
ROR.B $00                            ;C08828|6600    |000000;
LDA.W $0000,X                        ;C0882A|BD0000  |8E0000;
LSR A                                ;C0882D|4A      |      ;
ROR.B $00                            ;C0882E|6600    |000000;
DEC.B $4E                            ;C08830|C64E    |00004E;
BNE CODE_C0883E                      ;C08832|D00A    |C0883E;
LDA.B $00                            ;C08834|A500    |000000;
STA.B ($4C)                          ;C08836|924C    |00004C;
INC.B $4C                            ;C08838|E64C    |00004C;
LDA.B #$04                           ;C0883A|A904    |      ;
STA.B $4E                            ;C0883C|854E    |00004E;

CODE_C0883E:
REP #$20                             ;C0883E|C220    |      ;
INY                                  ;C08840|C8      |      ;
INY                                  ;C08841|C8      |      ;
INY                                  ;C08842|C8      |      ;
INY                                  ;C08843|C8      |      ;
CPY.W #$0200                         ;C08844|C00002  |      ;
BEQ CODE_C08853                      ;C08847|F00A    |C08853;

CODE_C08849:
TXA                                  ;C08849|8A      |      ;
CLC                                  ;C0884A|18      |      ;
ADC.W #$0007                         ;C0884B|690700  |      ;
TAX                                  ;C0884E|AA      |      ;
DEC.B $0C                            ;C0884F|C60C    |00000C;
BNE CODE_C087E5                      ;C08851|D092    |C087E5;

CODE_C08853:
PLX                                  ;C08853|FA      |      ;
PLB                                  ;C08854|AB      |      ;
RTS                                  ;C08855|60      |      ;

CODE_C08856:
LDA.W #$E080                         ;C08856|A980E0  |      ;
STA.W oam_data,Y                        ;C08859|999204  |7E0492;
BRA CODE_C08849                      ;C0885C|80EB    |C08849;

CODE_C0885E:
LDA.W $0034,X                        ;C0885E|BD3400  |8A0034;
STA.W $1A02                          ;C08861|8D021A  |8A1A02;
LDA.W $002C,X                        ;C08864|BD2C00  |8A002C;
STA.W $1A04                          ;C08867|8D041A  |8A1A04;
LDA.W $0028,X                        ;C0886A|BD2800  |8A0028;
TAX                                  ;C0886D|AA      |      ;
LDA.W $0000,X                        ;C0886E|BD0000  |8A0000;
INX                                  ;C08871|E8      |      ;
INX                                  ;C08872|E8      |      ;
STA.B $0C                            ;C08873|850C    |00000C;
INC.W $03B8                          ;C08875|EEB803  |8A03B8;

CODE_C08878:
LDA.B $50                            ;C08878|A550    |000050;
ASL A                                ;C0887A|0A      |      ;
LDA.W $0003,X                        ;C0887B|BD0300  |8A0003;
BCC CODE_C08881                      ;C0887E|9001    |C08881;
db $EB                               ;C08880|        |      ;

CODE_C08881:
AND.W #$00FF                         ;C08881|29FF00  |      ;
CLC                                  ;C08884|18      |      ;
ADC.B $18                            ;C08885|6518    |000018;
CMP.W #$00F0                         ;C08887|C9F000  |      ;
BCC CODE_C0888F                      ;C0888A|9003    |C0888F;
db $82,$88,$00                       ;C0888C|        |C08917;

CODE_C0888F:
SBC.W #$0010                         ;C0888F|E91000  |      ;
STA.W $0493,Y                        ;C08892|999304  |8A0493;
LDA.W $0005,X                        ;C08895|BD0500  |8A0005;
EOR.B $50                            ;C08898|4550    |000050;
ORA.B $06                            ;C0889A|0506    |000006;
PHA                                  ;C0889C|48      |      ;
AND.W #$01FF                         ;C0889D|29FF01  |      ;
ASL A                                ;C088A0|0A      |      ;
ASL A                                ;C088A1|0A      |      ;
ASL A                                ;C088A2|0A      |      ;
ASL A                                ;C088A3|0A      |      ;
ASL A                                ;C088A4|0A      |      ;
ADC.W $1A02                          ;C088A5|6D021A  |8A1A02;
STA.B ($04)                          ;C088A8|9204    |000004;
INC.B $04                            ;C088AA|E604    |000004;
INC.B $04                            ;C088AC|E604    |000004;
LDA.W $1A04                          ;C088AE|AD041A  |8A1A04;
STA.B ($04)                          ;C088B1|9204    |000004;
INC.B $04                            ;C088B3|E604    |000004;
PLA                                  ;C088B5|68      |      ;
AND.W #$FE00                         ;C088B6|2900FE  |      ;
ORA.B $02                            ;C088B9|0502    |000002;
INC.B $02                            ;C088BB|E602    |000002;
INC.B $02                            ;C088BD|E602    |000002;
STA.W $0494,Y                        ;C088BF|999404  |8A0494;
LDA.B $50                            ;C088C2|A550    |000050;
ASL A                                ;C088C4|0A      |      ;
ASL A                                ;C088C5|0A      |      ;
LDA.W $0001,X                        ;C088C6|BD0100  |8A0001;
BCC CODE_C088CC                      ;C088C9|9001    |C088CC;
db $EB                               ;C088CB|        |      ;

CODE_C088CC:
AND.W #$00FF                         ;C088CC|29FF00  |      ;
CLC                                  ;C088CF|18      |      ;
ADC.B $16                            ;C088D0|6516    |000016;
CMP.W #$0110                         ;C088D2|C91001  |      ;
BCS UNREACH_C08917                   ;C088D5|B040    |C08917;
SBC.W #$000F                         ;C088D7|E90F00  |      ;
SEP #$20                             ;C088DA|E220    |      ;
STA.W oam_data,Y                        ;C088DC|999204  |8A0492;
XBA                                  ;C088DF|EB      |      ;
LSR A                                ;C088E0|4A      |      ;
ROR.B $00                            ;C088E1|6600    |000000;
LDA.W $0000,X                        ;C088E3|BD0000  |8A0000;
LSR A                                ;C088E6|4A      |      ;
ROR.B $00                            ;C088E7|6600    |000000;
DEC.B $4E                            ;C088E9|C64E    |00004E;
BNE CODE_C088F7                      ;C088EB|D00A    |C088F7;
LDA.B $00                            ;C088ED|A500    |000000;
STA.B ($4C)                          ;C088EF|924C    |00004C;
INC.B $4C                            ;C088F1|E64C    |00004C;
LDA.B #$04                           ;C088F3|A904    |      ;
STA.B $4E                            ;C088F5|854E    |00004E;

CODE_C088F7:
REP #$20                             ;C088F7|C220    |      ;
INY                                  ;C088F9|C8      |      ;
INY                                  ;C088FA|C8      |      ;
INY                                  ;C088FB|C8      |      ;
INY                                  ;C088FC|C8      |      ;
CPY.W #$0200                         ;C088FD|C00002  |      ;
BEQ CODE_C0890F                      ;C08900|F00D    |C0890F;
TXA                                  ;C08902|8A      |      ;
CLC                                  ;C08903|18      |      ;
ADC.W #$0007                         ;C08904|690700  |      ;
TAX                                  ;C08907|AA      |      ;
DEC.B $0C                            ;C08908|C60C    |00000C;
BEQ CODE_C0890F                      ;C0890A|F003    |C0890F;
BRL CODE_C08878                      ;C0890C|8269FF  |C08878;

CODE_C0890F:
LDA.W #$0000                         ;C0890F|A90000  |      ;
STA.B ($04)                          ;C08912|9204    |000004;
PLX                                  ;C08914|FA      |      ;
PLB                                  ;C08915|AB      |      ;
RTS                                  ;C08916|60      |      ;

UNREACH_C08917:
db $A9,$80,$E0,$99,$92,$04,$80,$E3   ;C08917|        |      ;

CODE_C0891F:
PHB                                  ;C0891F|8B      |      ;
SEP #$20                             ;C08920|E220    |      ;
LDA.W $0024,X                        ;C08922|BD2400  |810024;
PHA                                  ;C08925|48      |      ;
PLB                                  ;C08926|AB      |      ;
REP #$20                             ;C08927|C220    |      ;
LDA.W $001E,X                        ;C08929|BD1E00  |8C001E;
ASL A                                ;C0892C|0A      |      ;
CLC                                  ;C0892D|18      |      ;
ADC.W $0022,X                        ;C0892E|7D2200  |8C0022;
TAY                                  ;C08931|A8      |      ;
LDA.W $0020,X                        ;C08932|BD2000  |8C0020;
ASL A                                ;C08935|0A      |      ;
ASL A                                ;C08936|0A      |      ;
ASL A                                ;C08937|0A      |      ;
CLC                                  ;C08938|18      |      ;
ADC.W $0000,Y                        ;C08939|790000  |8C0000;
TAY                                  ;C0893C|A8      |      ;
LDA.W $0000,Y                        ;C0893D|B90000  |8C0000;
BPL CODE_C08945                      ;C08940|1003    |C08945;
BRL CODE_C089DC                      ;C08942|829700  |C089DC;

CODE_C08945:
STA.W $0014,X                        ;C08945|9D1400  |8C0014;
LDA.W $001C,X                        ;C08948|BD1C00  |8C001C;
ROL A                                ;C0894B|2A      |      ;
BPL CODE_C08957                      ;C0894C|1009    |C08957;
LDA.W #$0000                         ;C0894E|A90000  |      ;
SEC                                  ;C08951|38      |      ;
SBC.W $0002,Y                        ;C08952|F90200  |7E0002;
BRA CODE_C0895A                      ;C08955|8003    |C0895A;

CODE_C08957:
LDA.W $0002,Y                        ;C08957|B90200  |8C0002;

CODE_C0895A:
STA.W $0004,X                        ;C0895A|9D0400  |8C0004;
LDA.W $001C,X                        ;C0895D|BD1C00  |8C001C;
BPL CODE_C0896B                      ;C08960|1009    |C0896B;
LDA.W #$0000                         ;C08962|A90000  |      ;
SEC                                  ;C08965|38      |      ;
SBC.W $0004,Y                        ;C08966|F90400  |7E0004;
BRA CODE_C0896E                      ;C08969|8003    |C0896E;

CODE_C0896B:
LDA.W $0004,Y                        ;C0896B|B90400  |8C0004;

CODE_C0896E:
STA.W $0006,X                        ;C0896E|9D0600  |8C0006;
LDA.W $0006,Y                        ;C08971|B90600  |8C0006;
TAY                                  ;C08974|A8      |      ;
CLC                                  ;C08975|18      |      ;
ADC.W #$000C                         ;C08976|690C00  |      ;
STA.W $0028,X                        ;C08979|9D2800  |8C0028;
LDA.W $001C,X                        ;C0897C|BD1C00  |8C001C;
ROL A                                ;C0897F|2A      |      ;
PHP                                  ;C08980|08      |      ;
BPL CODE_C08999                      ;C08981|1016    |C08999;
LDA.W $0002,Y                        ;C08983|B90200  |7E0002;
SEC                                  ;C08986|38      |      ;
SBC.W $0008,Y                        ;C08987|F90800  |7E0008;
STA.W $0008,X                        ;C0898A|9D0800  |7E0008;
LDA.W $0000,Y                        ;C0898D|B90000  |7E0000;
CLC                                  ;C08990|18      |      ;
ADC.W $0008,Y                        ;C08991|790800  |7E0008;
STA.W $000C,X                        ;C08994|9D0C00  |7E000C;
BRA CODE_C089A5                      ;C08997|800C    |C089A5;

CODE_C08999:
LDA.W $0000,Y                        ;C08999|B90000  |8C0000;
STA.W $0008,X                        ;C0899C|9D0800  |8C0008;
LDA.W $0002,Y                        ;C0899F|B90200  |8C0002;
STA.W $000C,X                        ;C089A2|9D0C00  |8C000C;

CODE_C089A5:
PLP                                  ;C089A5|28      |      ;
BCC CODE_C089BE                      ;C089A6|9016    |C089BE;
LDA.W $0006,Y                        ;C089A8|B90600  |7E0006;
CLC                                  ;C089AB|18      |      ;
ADC.W $000A,Y                        ;C089AC|790A00  |7E000A;
STA.W $000A,X                        ;C089AF|9D0A00  |7E000A;
LDA.W $0004,Y                        ;C089B2|B90400  |7E0004;
SEC                                  ;C089B5|38      |      ;
SBC.W $000A,Y                        ;C089B6|F90A00  |7E000A;
STA.W $000E,X                        ;C089B9|9D0E00  |7E000E;
BRA CODE_C089CA                      ;C089BC|800C    |C089CA;

CODE_C089BE:
LDA.W $0004,Y                        ;C089BE|B90400  |8C0004;
STA.W $000A,X                        ;C089C1|9D0A00  |8C000A;
LDA.W $0006,Y                        ;C089C4|B90600  |8C0006;
STA.W $000E,X                        ;C089C7|9D0E00  |8C000E;

CODE_C089CA:
LDA.W $0008,Y                        ;C089CA|B90800  |8C0008;
STA.W $0010,X                        ;C089CD|9D1000  |8C0010;
LDA.W $000A,Y                        ;C089D0|B90A00  |8C000A;
STA.W $0012,X                        ;C089D3|9D1200  |8C0012;
INC.W $0020,X                        ;C089D6|FE2000  |8C0020;
CLC                                  ;C089D9|18      |      ;
PLB                                  ;C089DA|AB      |      ;
RTL                                  ;C089DB|6B      |      ;

CODE_C089DC:
STZ.W $0020,X                        ;C089DC|9E2000  |8E0020;
STZ.W $0004,X                        ;C089DF|9E0400  |8E0004;
STZ.W $0006,X                        ;C089E2|9E0600  |8E0006;
SEC                                  ;C089E5|38      |      ;
PLB                                  ;C089E6|AB      |      ;
RTL                                  ;C089E7|6B      |      ;

CODE_C089E8:
LDA.W $003E,X                        ;C089E8|BD3E00  |81003E;
TAX                                  ;C089EB|AA      |      ;
BEQ CODE_C08A5F                      ;C089EC|F071    |C08A5F;
INC.W $1F00                          ;C089EE|EE001F  |811F00;
LDA.W $0016,X                        ;C089F1|BD1600  |810016;
BIT.W #$0800                         ;C089F4|890008  |      ;
BEQ CODE_C08A25                      ;C089F7|F02C    |C08A25;
LDA.W $0026,X                        ;C089F9|BD2600  |810026;
BPL CODE_C08A0D                      ;C089FC|100F    |C08A0D;
INC.W $0026,X                        ;C089FE|FE2600  |810026;
BPL CODE_C08A1C                      ;C08A01|1019    |C08A1C;
LDA.W $001A,X                        ;C08A03|BD1A00  |81001A;
BIT.W #$0040                         ;C08A06|894000  |      ;
BEQ CODE_C08A25                      ;C08A09|F01A    |C08A25;
BRA CODE_C089E8                      ;C08A0B|80DB    |C089E8;

CODE_C08A0D:
DEC.W $0026,X                        ;C08A0D|DE2600  |810026;
BEQ CODE_C08A1C                      ;C08A10|F00A    |C08A1C;
LDA.W $001A,X                        ;C08A12|BD1A00  |81001A;
BIT.W #$0040                         ;C08A15|894000  |      ;
BEQ CODE_C08A25                      ;C08A18|F00B    |C08A25;
db $80,$CC                           ;C08A1A|        |C089E8;

CODE_C08A1C:
LDA.W $0016,X                        ;C08A1C|BD1600  |810016;
AND.W #$F7FF                         ;C08A1F|29FFF7  |      ;
STA.W $0016,X                        ;C08A22|9D1600  |810016;

CODE_C08A25:
LDA.W $03A8                          ;C08A25|ADA803  |8103A8;
BEQ CODE_C08A32                      ;C08A28|F008    |C08A32;
LDA.W $0016,X                        ;C08A2A|BD1600  |810016;
BIT.W #$0010                         ;C08A2D|891000  |      ;
BEQ CODE_C089E8                      ;C08A30|F0B6    |C089E8;

CODE_C08A32:
DEC.W $0014,X                        ;C08A32|DE1400  |810014;
BPL CODE_C08A4E                      ;C08A35|1017    |C08A4E;
STZ.W $0014,X                        ;C08A37|9E1400  |810014;
SEP #$20                             ;C08A3A|E220    |      ;
LDA.B #$80                           ;C08A3C|A980    |      ;
PHA                                  ;C08A3E|48      |      ;
PEA.W UNREACH_818A4D                 ;C08A3F|F44D8A  |818A4D;
LDA.W $0036,X                        ;C08A42|BD3600  |810036;
PHA                                  ;C08A45|48      |      ;
REP #$20                             ;C08A46|C220    |      ;
LDA.W $0018,X                        ;C08A48|BD1800  |810018;
DEC A                                ;C08A4B|3A      |      ;
PHA                                  ;C08A4C|48      |      ;
RTL                                  ;C08A4D|6B      |      ;

CODE_C08A4E:
LDA.W $0016,X                        ;C08A4E|BD1600  |810016;
BIT.W #$1000                         ;C08A51|890010  |      ;
BEQ CODE_C08A5A                      ;C08A54|F004    |C08A5A;
JSL.L CODE_C08F54                    ;C08A56|22548F80|808F54;

CODE_C08A5A:
JSR.W CODE_C092C6                    ;C08A5A|20C692  |C092C6;
BRA CODE_C089E8                      ;C08A5D|8089    |C089E8;

CODE_C08A5F:
RTS                                  ;C08A5F|60      |      ;

check_entity_collision:
PHP                                  ;C08A60|08      |      ;
PHB                                  ;C08A61|8B      |      ;
REP #$20                             ;C08A62|C220    |      ;
LDX.W _039E                          ;C08A64|AE9E03  |81039E;
LDA.W $0016,X                        ;C08A67|BD1600  |810016;
BIT.W #$0400                         ;C08A6A|890004  |      ;
BEQ CODE_C08A72                      ;C08A6D|F003    |C08A72;
BRL CODE_C08B1B                      ;C08A6F|82A900  |C08B1B;

CODE_C08A72:
LDX.W #$0000                         ;C08A72|A20000  |      ;

CODE_C08A75:
LDY.W $1900,X                        ;C08A75|BC0019  |811900;
BNE CODE_C08A7D                      ;C08A78|D003    |C08A7D;
BRL CODE_C08B1B                      ;C08A7A|829E00  |C08B1B;

CODE_C08A7D:
INX                                  ;C08A7D|E8      |      ;
INX                                  ;C08A7E|E8      |      ;
LDA.W $0016,Y                        ;C08A7F|B91600  |810016;
BIT.W #$0080                         ;C08A82|898000  |      ;
BEQ CODE_C08A75                      ;C08A85|F0EE    |C08A75;
BIT.W #$0D00                         ;C08A87|89000D  |      ;
BNE CODE_C08A75                      ;C08A8A|D0E9    |C08A75;
PHX                                  ;C08A8C|DA      |      ;
SEP #$20                             ;C08A8D|E220    |      ;
LDA.W $0024,Y                        ;C08A8F|B92400  |810024;
PHA                                  ;C08A92|48      |      ;
PLB                                  ;C08A93|AB      |      ;
REP #$20                             ;C08A94|C220    |      ;
LDX.W #$0000                         ;C08A96|A20000  |      ;
STY.B $3E                            ;C08A99|843E    |00003E;

CODE_C08A9B:
LDY.B $3E                            ;C08A9B|A43E    |00003E;
LDA.W $0002,Y                        ;C08A9D|B90200  |8C0002;
SEC                                  ;C08AA0|38      |      ;
SBC.W $000A,Y                        ;C08AA1|F90A00  |8C000A;
STA.B $00                            ;C08AA4|8500    |000000;
LDA.W $0002,Y                        ;C08AA6|B90200  |8C0002;
CLC                                  ;C08AA9|18      |      ;
ADC.W $000E,Y                        ;C08AAA|790E00  |8C000E;
STA.B $02                            ;C08AAD|8502    |000002;
LDA.W $0000,Y                        ;C08AAF|B90000  |8C0000;
SEC                                  ;C08AB2|38      |      ;
SBC.W $0008,Y                        ;C08AB3|F90800  |8C0008;
STA.B $04                            ;C08AB6|8504    |000004;
LDA.W $0000,Y                        ;C08AB8|B90000  |8C0000;
CLC                                  ;C08ABB|18      |      ;
ADC.W $000C,Y                        ;C08ABC|790C00  |8C000C;
STA.B $06                            ;C08ABF|8506    |000006;

CODE_C08AC1:
LDY.W $1900,X                        ;C08AC1|BC0019  |8C1900;
BEQ CODE_C08B17                      ;C08AC4|F051    |C08B17;
INX                                  ;C08AC6|E8      |      ;
INX                                  ;C08AC7|E8      |      ;
LDA.W $0016,Y                        ;C08AC8|B91600  |8C0016;
BIT.W #$EEC0                         ;C08ACB|89C0EE  |      ;
BNE CODE_C08AC1                      ;C08ACE|D0F1    |C08AC1;
LDA.W $0000,Y                        ;C08AD0|B90000  |8C0000;
SEC                                  ;C08AD3|38      |      ;
SBC.W $0008,Y                        ;C08AD4|F90800  |8C0008;
CMP.B $06                            ;C08AD7|C506    |000006;
BCS CODE_C08AC1                      ;C08AD9|B0E6    |C08AC1;
LDA.W $0000,Y                        ;C08ADB|B90000  |8C0000;
CLC                                  ;C08ADE|18      |      ;
ADC.W $000C,Y                        ;C08ADF|790C00  |8C000C;
CMP.B $04                            ;C08AE2|C504    |000004;
BCC CODE_C08AC1                      ;C08AE4|90DB    |C08AC1;
LDA.W $0002,Y                        ;C08AE6|B90200  |8C0002;
SEC                                  ;C08AE9|38      |      ;
SBC.W $000A,Y                        ;C08AEA|F90A00  |8C000A;
CMP.B $02                            ;C08AED|C502    |000002;
BCS CODE_C08AC1                      ;C08AEF|B0D0    |C08AC1;
LDA.W $0002,Y                        ;C08AF1|B90200  |8C0002;
CLC                                  ;C08AF4|18      |      ;
ADC.W $000E,Y                        ;C08AF5|790E00  |8C000E;
CMP.B $00                            ;C08AF8|C500    |000000;
BCC CODE_C08AC1                      ;C08AFA|90C5    |C08AC1;
JSR.W CODE_C08D81                    ;C08AFC|20818D  |C08D81;
BCC CODE_C08A9B                      ;C08AFF|909A    |C08A9B;
PHX                                  ;C08B01|DA      |      ;
LDX.B $3E                            ;C08B02|A63E    |00003E;
LDA.W $0016,X                        ;C08B04|BD1600  |8C0016;
BIT.W #$0020                         ;C08B07|892000  |      ;
BNE CODE_C08B11                      ;C08B0A|D005    |C08B11;
JSR.W CODE_C08B1E                    ;C08B0C|201E8B  |C08B1E;
BRA CODE_C08B14                      ;C08B0F|8003    |C08B14;

CODE_C08B11:
JSR.W CODE_C08C93                    ;C08B11|20938C  |C08C93;

CODE_C08B14:
PLX                                  ;C08B14|FA      |      ;
BRA CODE_C08A9B                      ;C08B15|8084    |C08A9B;

CODE_C08B17:
PLX                                  ;C08B17|FA      |      ;
BRL CODE_C08A75                      ;C08B18|825AFF  |C08A75;

CODE_C08B1B:
PLB                                  ;C08B1B|AB      |      ;
PLP                                  ;C08B1C|28      |      ;
RTL                                  ;C08B1D|6B      |      ;

CODE_C08B1E:
    LDX.W _039E
    LDA.W $001E,X                        ;C08B21|BD1E00  |8C001E;
    CMP.W #$0024                         ;C08B24|C92400  |      ;
    BCC + : RTS : +

    LDA.W LiveEntities.entity_id, Y
    BIT.W #2
    BEQ .over

.player_hits_metal:
    %PlaySound(!Sound_MetalEnemyHitWithNormalSword)
    RTS

.over:
    LDA.W Equipment.sword
    CMP.W #Items.SoulBlade
    BEQ .can_damage_enemy ; if it's the soul blade, skip all this and just damage the enemy
    LDA.W Equipment.sword
    CMP.W #Items.PsychoSword
    BNE .check_enemy_immunity ; if it's the psycho sword, go along with this
    CPY.W  _039C
    BEQ .check_enemy_immunity ; not sure what this branch does
    LDA.W LiveEntities._1a, Y
    BIT.W #$E00 ; if the enemy metal, soul or ??? (maybe stunned) ?
    BEQ .can_damage_enemy
    LDA.W LiveEntities._1a, Y
    ORA.W #$40
    STA.W LiveEntities._1a, Y
    LDA.W LiveEntities.entity_id, Y
    ORA.W #$800 ; make him stunned?!
    STA.W LiveEntities.entity_id, Y
    LDA.W #180 ; and invincible for 180 frames -> 3 seconds
    STA.W LiveEntities.invincibility_counter, Y

.check_enemy_immunity:
    LDA.W LiveEntities._1a, Y
    BIT.W #$800 ; is it a soul like enemy?
    BNE .is_soul
    BIT.W #$400 ; is it a metal like enemy?
    BNE .is_metal
    BIT.W #$200 ; nor this
    BEQ .can_damage_enemy
    RTS

.is_soul:
    LDA.W Equipment.sword
    CMP.W #Items.SpiritSword
    BEQ .can_damage_enemy
    RTS

.is_metal:
    LDA.W Equipment.sword
    CMP.W #Items.ZantetsuSword
    BNE .player_hits_metal

.can_damage_enemy:
    LDA.W Equipment.sword
    CMP.W #Items.CriticalSword
    BNE .calculate_damage
    CPY.W _039C
    BEQ .calculate_damage
    LDA.W _0312
    AND.W #$F
    BEQ .enemy_dead

.calculate_damage:
    SEP #$20
    LDX.W LiveEntities.entities_table_entry_offset, Y
    LDA.L Entity.defense, X ; load the defense of the enemy
    STA.B TempVar0
    LDA.W player_total_strength
    SEC
    SBC.B TempVar0 ; subtract the defense from our total strength
    BEQ + : BCS ++ : + ; clamp that value to at least 1, not less
    LDA.B #$01 : ++
    STA.B TempVar0

    ; next let's check if we have the bracelet equipped and double the attack power
    LDA.W Equipment.item
    CMP.B #Items.SuperBracelet
    BEQ .double_strength
    CMP.B #Items.PowerBracelet
    BNE .skip_double
.double_strength:
    ASL TempVar0
.skip_double:
    LDA.W LiveEntities.hp, Y
    SEC
    SBC.B TempVar0
    BCC .enemy_dead
    BEQ .enemy_dead

.store_enemy_hp:
    STA.W LiveEntities.hp, Y
    REP #$20

    CPY.W _039C
    BEQ .CODE_C08BEC
    LDX.W _039E
    LDA.W $001E, X
    SEC
    SBC.W #$0020
    CMP.W #$0004
    BCC .CODE_C08BF7

.CODE_C08BEC:
    LDA.W LiveEntities._1a, Y
    AND.W #$FFBF
    STA.W LiveEntities._1a, Y
    BRA .CODE_C08C00

.CODE_C08BF7:
    LDA.W LiveEntities._1a, Y
    ORA.W #$0040
    STA.W LiveEntities._1a, Y

.CODE_C08C00:
    LDA.W #$FFF8
    STA.W LiveEntities.invincibility_counter, Y
    LDA.W LiveEntities.entity_id, Y
    ORA.W #$0800
    STA.W LiveEntities.entity_id, Y
    %PlaySound($42)
    BRA .CODE_C08C70

.enemy_dead:
    REP #$20
    LDA.W LiveEntities._1a, Y
    BIT.W #$100                         ;C08C18|890001  |      ;
    SEP #$20                             ;C08C1B|E220    |      ;
    BEQ .CODE_C08C23                      ;C08C1D|F004    |C08C23;
    LDA.B #1
    BRA .store_enemy_hp

.CODE_C08C23:
    LDA.B #<:CODE_C0AA3C
    STA.W LiveEntities.script_ret_addr_bank, Y
    LDA.B #0
    STA.W LiveEntities.hp, Y
    REP #$20
    LDA.W #CODE_C0AA3C
    STA.W LiveEntities.script_ret_addr, Y
LDA.W #$0000                         ;C08C35|A90000  |      ;
STA.W $0014,Y                        ;C08C38|991400  |8C0014;
LDA.W $0016,Y                        ;C08C3B|B91600  |8C0016;
ORA.W #$0400                         ;C08C3E|090004  |      ;
STA.W $0016,Y                        ;C08C41|991600  |8C0016;
LDX.W $0038,Y                        ;C08C44|BE3800  |8C0038;
    LDA.L Entity.bcd_exp, X
    JSL.L AddExp
    LDA.W #UpdateHud.Exp
    TSB.W display_hud_bitfield
    LDA.W Equipment.sword
    CMP.W #Items.RecoverySword
    BNE .no_recovery_sword

    LDA.W player_current_health
    CMP.W player_max_health
    BEQ .no_recovery_sword ; we are at max health, skip this
    INC.W player_current_health
    LDA.W #UpdateHud.Health
    TSB.W display_hud_bitfield

.no_recovery_sword:
BRK #$43                             ;C08C6E|0043    |      ;

.CODE_C08C70:
LDA.W $0016,Y                        ;C08C70|B91600  |8C0016;
BIT.W #$0001                         ;C08C73|890100  |      ;
BEQ + : RTS : +
SEP #$20                             ;C08C79|E220    |      ;
LDA.W $0025,Y                        ;C08C7B|B92500  |8C0025;
STA.W enemy_current_health                          ;C08C7E|8D3603  |8C0336;
LDX.W $0038,Y                        ;C08C81|BE3800  |8C0038;
LDA.L Entity.hp,X               ;C08C84|BF028081|818002;
STA.W enemy_max_health                          ;C08C88|8D3803  |8C0338;
LDA.B #$80                           ;C08C8B|A980    |      ;
STA.W displayEnemeyHealthCounter                          ;C08C8D|8D3003  |8C0330;
REP #$20                             ;C08C90|C220    |      ;
RTS                                  ;C08C92|60      |      ;

; --------

CODE_C08C93:
LDA.W $0016,Y                        ;C08C93|B91600  |8F0016;
BIT.W #$0002                         ;C08C96|890200  |      ;
BEQ CODE_C08C9E                      ;C08C99|F003    |C08C9E;

UNREACH_C08C9B:
db $00,$4C,$60                       ;C08C9B|        |      ;

CODE_C08C9E:
LDA.W $0030,X                        ;C08C9E|BD3000  |8F0030;
CMP.W #$00FF                         ;C08CA1|C9FF00  |      ;
BEQ CODE_C08CC1                      ;C08CA4|F01B    |C08CC1;
LDA.W Equipment.magic                          ;C08CA6|AD621B  |8F1B62;
CMP.W #$0018                         ;C08CA9|C91800  |      ;
BEQ UNREACH_C08CD0                   ;C08CAC|F022    |C08CD0;
CPY.W $039C                          ;C08CAE|CC9C03  |8F039C;
BEQ UNREACH_C08C9B                   ;C08CB1|F0E8    |C08C9B;
LDA.W $001A,Y                        ;C08CB3|B91A00  |8F001A;
BIT.W #$0A00                         ;C08CB6|89000A  |      ;
BEQ CODE_C08CBC                      ;C08CB9|F001    |C08CBC;
db $60                               ;C08CBB|        |      ;

CODE_C08CBC:
BIT.W #$0400                         ;C08CBC|890004  |      ;
BNE UNREACH_C08C9B                   ;C08CBF|D0DA    |C08C9B;

CODE_C08CC1:
SEP #$20                             ;C08CC1|E220    |      ;
LDA.W $0025,Y                        ;C08CC3|B92500  |8F0025;
SEC                                  ;C08CC6|38      |      ;
SBC.W $0030,X                        ;C08CC7|FD3000  |8F0030;
BCC CODE_C08D18                      ;C08CCA|904C    |C08D18;
BEQ CODE_C08D18                      ;C08CCC|F04A    |C08D18;
BRA CODE_C08CF7                      ;C08CCE|8027    |C08CF7;

UNREACH_C08CD0:
db $E2,$20,$BE,$38,$00,$BF,$01,$80   ;C08CD0|        |      ;
db $81,$85,$00,$AD,$70,$1B,$18,$6D   ;C08CD8|        |000085;
db $72,$1B,$38,$E5,$00,$F0,$02,$B0   ;C08CE0|        |00001B;
db $02,$A9,$01,$85,$00,$B9,$25,$00   ;C08CE8|        |      ;
db $38,$E5,$00,$90,$23,$F0,$21       ;C08CF0|        |      ;

CODE_C08CF7:
STA.W $0025,Y                        ;C08CF7|992500  |8F0025;
REP #$20                             ;C08CFA|C220    |      ;
LDA.W #$FFF8                         ;C08CFC|A9F8FF  |      ;
STA.W $0026,Y                        ;C08CFF|992600  |8F0026;
LDA.W $0016,Y                        ;C08D02|B91600  |8F0016;
ORA.W #$0800                         ;C08D05|090008  |      ;
STA.W $0016,Y                        ;C08D08|991600  |8F0016;
LDA.W $001A,Y                        ;C08D0B|B91A00  |8F001A;
AND.W #$FFBF                         ;C08D0E|29BFFF  |      ;
STA.W $001A,Y                        ;C08D11|991A00  |8F001A;
BRK #$42                             ;C08D14|0042    |      ;
BRA CODE_C08D5E                      ;C08D16|8046    |C08D5E;

CODE_C08D18:
REP #$20                             ;C08D18|C220    |      ;
LDA.W $001A,Y                        ;C08D1A|B91A00  |8F001A;
BIT.W #$0100                         ;C08D1D|890001  |      ;
SEP #$20                             ;C08D20|E220    |      ;
BEQ CODE_C08D28                      ;C08D22|F004    |C08D28;
db $A9,$01,$80,$CF                   ;C08D24|        |      ;

CODE_C08D28:
SEP #$20                             ;C08D28|E220    |      ;
LDA.B #<:CODE_C0AA3C                           ;C08D2A|A980    |      ;
STA.W $0036,Y                        ;C08D2C|993600  |8F0036;
LDA.B #$00                           ;C08D2F|A900    |      ;
STA.W $0025,Y                        ;C08D31|992500  |8F0025;
REP #$20                             ;C08D34|C220    |      ;
LDA.W #CODE_C0AA3C                         ;C08D36|A93CAA  |      ;
STA.W $0018,Y                        ;C08D39|991800  |8F0018;
LDA.W #$0000                         ;C08D3C|A90000  |      ;
STA.W $0014,Y                        ;C08D3F|991400  |8F0014;
LDA.W $0016,Y                        ;C08D42|B91600  |8F0016;
ORA.W #$0400                         ;C08D45|090004  |      ;
STA.W $0016,Y                        ;C08D48|991600  |8F0016;
LDX.W $0038,Y                        ;C08D4B|BE3800  |8F0038;
LDA.L Entity.bcd_exp,X               ;C08D4E|BF038081|818003;
JSL.L AddExp                    ;C08D52|22BB8583|8385BB;
LDA.W #UpdateHud.Exp                         ;C08D56|A90200  |      ;
TSB.W display_hud_bitfield                          ;C08D59|0C3203  |8F0332;
BRK #$43                             ;C08D5C|0043    |      ;

CODE_C08D5E:
LDA.W $0016,Y                        ;C08D5E|B91600  |8F0016;
BIT.W #$0001                         ;C08D61|890100  |      ;
BEQ CODE_C08D67                      ;C08D64|F001    |C08D67;
db $60                               ;C08D66|        |      ;

CODE_C08D67:
SEP #$20                             ;C08D67|E220    |      ;
LDA.W $0025,Y                        ;C08D69|B92500  |8F0025;
STA.W enemy_current_health                          ;C08D6C|8D3603  |8F0336;
LDX.W $0038,Y                        ;C08D6F|BE3800  |8F0038;
LDA.L Entity.hp,X               ;C08D72|BF028081|818002;
STA.W enemy_max_health                          ;C08D76|8D3803  |8F0338;
LDA.B #$80                           ;C08D79|A980    |      ;
STA.W displayEnemeyHealthCounter                          ;C08D7B|8D3003  |8F0330;
REP #$20                             ;C08D7E|C220    |      ;
RTS                                  ;C08D80|60      |      ;

CODE_C08D81:
PHX                                  ;C08D81|DA      |      ;
PHY                                  ;C08D82|5A      |      ;
TYX                                  ;C08D83|BB      |      ;
LDY.B $3E                            ;C08D84|A43E    |00003E;
LDA.W $0002,X                        ;C08D86|BD0200  |8C0002;
SEC                                  ;C08D89|38      |      ;
SBC.W $000A,X                        ;C08D8A|FD0A00  |8C000A;
STA.B $00                            ;C08D8D|8500    |000000;
LDA.W $0002,X                        ;C08D8F|BD0200  |8C0002;
CLC                                  ;C08D92|18      |      ;
ADC.W $000E,X                        ;C08D93|7D0E00  |8C000E;
STA.B $02                            ;C08D96|8502    |000002;
LDA.W $0000,X                        ;C08D98|BD0000  |8C0000;
SEC                                  ;C08D9B|38      |      ;
SBC.W $0008,X                        ;C08D9C|FD0800  |8C0008;
STA.B $04                            ;C08D9F|8504    |000004;
LDA.W $0000,X                        ;C08DA1|BD0000  |8C0000;
CLC                                  ;C08DA4|18      |      ;
ADC.W $000C,X                        ;C08DA5|7D0C00  |8C000C;
STA.B $06                            ;C08DA8|8506    |000006;
LDA.W $0000,Y                        ;C08DAA|B90000  |8C0000;
SEC                                  ;C08DAD|38      |      ;
SBC.W $0008,Y                        ;C08DAE|F90800  |8C0008;
STA.B $08                            ;C08DB1|8508    |000008;
LDA.W $0002,Y                        ;C08DB3|B90200  |8C0002;
SEC                                  ;C08DB6|38      |      ;
SBC.W $000A,Y                        ;C08DB7|F90A00  |8C000A;
STA.B $0A                            ;C08DBA|850A    |00000A;
LDX.W $0028,Y                        ;C08DBC|BE2800  |8C0028;
LDA.W $0000,X                        ;C08DBF|BD0000  |8C0000;
STA.B $0C                            ;C08DC2|850C    |00000C;
INX                                  ;C08DC4|E8      |      ;
INX                                  ;C08DC5|E8      |      ;

CODE_C08DC6:
LDA.W $0000,X                        ;C08DC6|BD0000  |8C0000;
LSR A                                ;C08DC9|4A      |      ;
BCC CODE_C08DD1                      ;C08DCA|9005    |C08DD1;
LDA.W #$000F                         ;C08DCC|A90F00  |      ;
BRA CODE_C08DD4                      ;C08DCF|8003    |C08DD4;

CODE_C08DD1:
LDA.W #$0007                         ;C08DD1|A90700  |      ;

CODE_C08DD4:
PHA                                  ;C08DD4|48      |      ;
LDA.W $001C,Y                        ;C08DD5|B91C00  |8C001C;
ASL A                                ;C08DD8|0A      |      ;
ASL A                                ;C08DD9|0A      |      ;
LDA.W $0001,X                        ;C08DDA|BD0100  |8C0001;
BCC CODE_C08DE0                      ;C08DDD|9001    |C08DE0;
XBA                                  ;C08DDF|EB      |      ;

CODE_C08DE0:
AND.W #$00FF                         ;C08DE0|29FF00  |      ;
CLC                                  ;C08DE3|18      |      ;
ADC.B $08                            ;C08DE4|6508    |000008;
CMP.B $06                            ;C08DE6|C506    |000006;
BCS CODE_C08E11                      ;C08DE8|B027    |C08E11;
CLC                                  ;C08DEA|18      |      ;
ADC.B $01,S                          ;C08DEB|6301    |000001;
CMP.B $04                            ;C08DED|C504    |000004;
BCC CODE_C08E11                      ;C08DEF|9020    |C08E11;
LDA.W $001C,Y                        ;C08DF1|B91C00  |8C001C;
ASL A                                ;C08DF4|0A      |      ;
LDA.W $0003,X                        ;C08DF5|BD0300  |8C0003;
BCC CODE_C08DFB                      ;C08DF8|9001    |C08DFB;
XBA                                  ;C08DFA|EB      |      ;

CODE_C08DFB:
AND.W #$00FF                         ;C08DFB|29FF00  |      ;
CLC                                  ;C08DFE|18      |      ;
ADC.B $0A                            ;C08DFF|650A    |00000A;
CMP.B $02                            ;C08E01|C502    |000002;
BCS CODE_C08E11                      ;C08E03|B00C    |C08E11;
CLC                                  ;C08E05|18      |      ;
ADC.B $01,S                          ;C08E06|6301    |000001;
CMP.B $00                            ;C08E08|C500    |000000;
BCC CODE_C08E11                      ;C08E0A|9005    |C08E11;
PLA                                  ;C08E0C|68      |      ;
PLY                                  ;C08E0D|7A      |      ;
PLX                                  ;C08E0E|FA      |      ;
SEC                                  ;C08E0F|38      |      ;
RTS                                  ;C08E10|60      |      ;

CODE_C08E11:
PLA                                  ;C08E11|68      |      ;
TXA                                  ;C08E12|8A      |      ;
CLC                                  ;C08E13|18      |      ;
ADC.W #$0007                         ;C08E14|690700  |      ;
TAX                                  ;C08E17|AA      |      ;
DEC.B $0C                            ;C08E18|C60C    |00000C;
BNE CODE_C08DC6                      ;C08E1A|D0AA    |C08DC6;
PLY                                  ;C08E1C|7A      |      ;
PLX                                  ;C08E1D|FA      |      ;
CLC                                  ;C08E1E|18      |      ;
RTS                                  ;C08E1F|60      |      ;

CODE_C08E20:
PHP                                  ;C08E20|08      |      ;
REP #$30                             ;C08E21|C230    |      ;
LDA.W $0439                          ;C08E23|AD3904  |810439;
BNE CODE_C08E8B                      ;C08E26|D063    |C08E8B;
LDY.W _039E                          ;C08E28|AC9E03  |81039E;
LDA.W $0000,Y                        ;C08E2B|B90000  |810000;
CLC                                  ;C08E2E|18      |      ;
ADC.W #$0005                         ;C08E2F|690500  |      ;
STA.B $16                            ;C08E32|8516    |000016;
CLC                                  ;C08E34|18      |      ;
ADC.W #$0007                         ;C08E35|690700  |      ;
STA.B $1A                            ;C08E38|851A    |00001A;
LDA.W $0002,Y                        ;C08E3A|B90200  |810002;
SEC                                  ;C08E3D|38      |      ;
SBC.W #$0004                         ;C08E3E|E90400  |      ;
STA.B $1C                            ;C08E41|851C    |00001C;
SEC                                  ;C08E43|38      |      ;
SBC.W #$0008                         ;C08E44|E90800  |      ;
STA.B $18                            ;C08E47|8518    |000018;
LDA.W $0016,Y                        ;C08E49|B91600  |810016;
BIT.W #$0400                         ;C08E4C|890004  |      ;
BNE CODE_C08E8B                      ;C08E4F|D03A    |C08E8B;
BIT.W #$0800                         ;C08E51|890008  |      ;
BNE CODE_C08E8D                      ;C08E54|D037    |C08E8D;
LDY.W #$0000                         ;C08E56|A00000  |      ;

CODE_C08E59:
LDX.W $1900,Y                        ;C08E59|BE0019  |811900;
BEQ CODE_C08E8B                      ;C08E5C|F02D    |C08E8B;
INY                                  ;C08E5E|C8      |      ;
INY                                  ;C08E5F|C8      |      ;
LDA.W $0016,X                        ;C08E60|BD1600  |810016;
BIT.W #$25C0                         ;C08E63|89C025  |      ;
BNE CODE_C08E59                      ;C08E66|D0F1    |C08E59;
LDA.W $0000,X                        ;C08E68|BD0000  |810000;
CMP.B $1A                            ;C08E6B|C51A    |00001A;
BCS CODE_C08E59                      ;C08E6D|B0EA    |C08E59;
CLC                                  ;C08E6F|18      |      ;
ADC.W $0010,X                        ;C08E70|7D1000  |810010;
CMP.B $16                            ;C08E73|C516    |000016;
BCC CODE_C08E59                      ;C08E75|90E2    |C08E59;
LDA.W $0002,X                        ;C08E77|BD0200  |810002;
CMP.B $18                            ;C08E7A|C518    |000018;
BCC CODE_C08E59                      ;C08E7C|90DB    |C08E59;
SEC                                  ;C08E7E|38      |      ;
SBC.W $0012,X                        ;C08E7F|FD1200  |810012;
CMP.B $1C                            ;C08E82|C51C    |00001C;
BCS CODE_C08E59                      ;C08E84|B0D3    |C08E59;
JSR.W CODE_C08EC9                    ;C08E86|20C98E  |C08EC9;
BCS CODE_C08E59                      ;C08E89|B0CE    |C08E59;

CODE_C08E8B:
PLP                                  ;C08E8B|28      |      ;
RTL                                  ;C08E8C|6B      |      ;

CODE_C08E8D:
LDY.W #$0000                         ;C08E8D|A00000  |      ;

CODE_C08E90:
LDX.W $1900,Y                        ;C08E90|BE0019  |811900;
BEQ CODE_C08EC7                      ;C08E93|F032    |C08EC7;
INY                                  ;C08E95|C8      |      ;
INY                                  ;C08E96|C8      |      ;
LDA.W $0016,X                        ;C08E97|BD1600  |810016;
BIT.W #$25C0                         ;C08E9A|89C025  |      ;
BNE CODE_C08E90                      ;C08E9D|D0F1    |C08E90;
BIT.W #$4000                         ;C08E9F|890040  |      ;
BEQ CODE_C08E90                      ;C08EA2|F0EC    |C08E90;
LDA.W $0000,X                        ;C08EA4|BD0000  |810000;
CMP.B $1A                            ;C08EA7|C51A    |00001A;
BCS CODE_C08E90                      ;C08EA9|B0E5    |C08E90;
CLC                                  ;C08EAB|18      |      ;
ADC.W $0010,X                        ;C08EAC|7D1000  |810010;
CMP.B $16                            ;C08EAF|C516    |000016;
BCC CODE_C08E90                      ;C08EB1|90DD    |C08E90;
LDA.W $0002,X                        ;C08EB3|BD0200  |810002;
CMP.B $18                            ;C08EB6|C518    |000018;
BCC CODE_C08E90                      ;C08EB8|90D6    |C08E90;
SEC                                  ;C08EBA|38      |      ;
SBC.W $0012,X                        ;C08EBB|FD1200  |810012;
CMP.B $1C                            ;C08EBE|C51C    |00001C;
BCS CODE_C08E90                      ;C08EC0|B0CE    |C08E90;
JSR.W CODE_C08EC9                    ;C08EC2|20C98E  |C08EC9;
BCS CODE_C08E90                      ;C08EC5|B0C9    |C08E90;

CODE_C08EC7:
PLP                                  ;C08EC7|28      |      ;
RTL                                  ;C08EC8|6B      |      ;

CODE_C08EC9:
LDA.W $0016,X                        ;C08EC9|BD1600  |810016;
BIT.W #$4000                         ;C08ECC|890040  |      ;
BNE CODE_C08F4E                      ;C08ECF|D07D    |C08F4E;
LDA.W Equipment.armor                          ;C08ED1|AD601B  |811B60;
CMP.W #$000E                         ;C08ED4|C90E00  |      ;
BNE CODE_C08EEF                      ;C08ED7|D016    |C08EEF;
db $E2,$20,$BC,$38,$00,$B9,$00,$80   ;C08ED9|        |      ;
db $4A,$18,$79,$00,$80,$CD,$8E,$1B   ;C08EE1|        |      ;
db $B0,$04,$00,$0C,$80,$5D           ;C08EE9|        |C08EEF;

CODE_C08EEF:
SEP #$20                             ;C08EEF|E220    |      ;
LDY.W $0038,X                        ;C08EF1|BC3800  |810038;
LDA.W Entity.offense,Y               ;C08EF4|B90080  |818000;
DEC A                                ;C08EF7|3A      |      ;
SEC                                  ;C08EF8|38      |      ;
SBC.W $1B8E                          ;C08EF9|ED8E1B  |811B8E;
BCS CODE_C08F00                      ;C08EFC|B002    |C08F00;
LDA.B #$00                           ;C08EFE|A900    |      ;

CODE_C08F00:
STA.B $00                            ;C08F00|8500    |000000;
LDA.W Equipment.item                          ;C08F02|AD641B  |811B64;
CMP.B #$37                           ;C08F05|C937    |      ;
BEQ UNREACH_C08F0D                   ;C08F07|F004    |C08F0D;
CMP.B #$36                           ;C08F09|C936    |      ;
BNE CODE_C08F0F                      ;C08F0B|D002    |C08F0F;

UNREACH_C08F0D:
db $46,$00                           ;C08F0D|        |000000;

CODE_C08F0F:
LDA.B $00                            ;C08F0F|A500    |000000;
BNE CODE_C08F14                      ;C08F11|D001    |C08F14;
INC A                                ;C08F13|1A      |      ;

CODE_C08F14:
PHA                                  ;C08F14|48      |      ;
LDA.W player_current_health                          ;C08F15|AD881B  |811B88;
SEC                                  ;C08F18|38      |      ;
SBC.B $01,S                          ;C08F19|E301    |000001;
BPL CODE_C08F1F                      ;C08F1B|1002    |C08F1F;
LDA.B #$00                           ;C08F1D|A900    |      ;

CODE_C08F1F:
STA.W player_current_health                          ;C08F1F|8D881B  |811B88;
PLA                                  ;C08F22|68      |      ;
REP #$20                             ;C08F23|C220    |      ;
LDA.W #UpdateHud.Health                         ;C08F25|A90400  |      ;
TSB.W display_hud_bitfield                          ;C08F28|0C3203  |810332;
LDX.W _039E                          ;C08F2B|AE9E03  |81039E;
LDA.W Equipment.armor                          ;C08F2E|AD601B  |811B60;
CMP.W #Items.MysticArmor                         ;C08F31|C90D00  |      ;
BNE + : LDA.W #-64 : BRA ++
    + : LDA.W #-32 : ++

STA.W $0026,X                        ;C08F3E|9D2600  |810026;
BRK #$04                             ;C08F41|0004    |      ;
LDA.W $0016,X                        ;C08F43|BD1600  |810016;
ORA.W #$0800                         ;C08F46|090008  |      ;
STA.W $0016,X                        ;C08F49|9D1600  |810016;
CLC                                  ;C08F4C|18      |      ;
RTS                                  ;C08F4D|60      |      ;

CODE_C08F4E:
JSL.L CODE_C0AF42                    ;C08F4E|2242AF80|80AF42;
SEC                                  ;C08F52|38      |      ;
RTS                                  ;C08F53|60      |      ;

CODE_C08F54:
LDA.W $0010,X                        ;C08F54|BD1000  |810010;
ORA.W $0012,X                        ;C08F57|1D1200  |810012;
AND.W #$0008                         ;C08F5A|290800  |      ;
BNE UNREACH_C08F7E                   ;C08F5D|D01F    |C08F7E;
LDA.W $0004,X                        ;C08F5F|BD0400  |810004;
BEQ CODE_C08F6E                      ;C08F62|F00A    |C08F6E;
BMI CODE_C08F6B                      ;C08F64|3005    |C08F6B;
JSR.W CODE_C08F82                    ;C08F66|20828F  |C08F82;
BRA CODE_C08F6E                      ;C08F69|8003    |C08F6E;

CODE_C08F6B:
JSR.W CODE_C0902B                    ;C08F6B|202B90  |C0902B;

CODE_C08F6E:
LDA.W $0006,X                        ;C08F6E|BD0600  |810006;
BEQ CODE_C08F7D                      ;C08F71|F00A    |C08F7D;
BMI CODE_C08F7A                      ;C08F73|3005    |C08F7A;
JSR.W CODE_C090DB                    ;C08F75|20DB90  |C090DB;
BRA CODE_C08F7D                      ;C08F78|8003    |C08F7D;

CODE_C08F7A:
JSR.W CODE_C09180                    ;C08F7A|208091  |C09180;

CODE_C08F7D:
RTL                                  ;C08F7D|6B      |      ;

UNREACH_C08F7E:
db $20,$34,$92,$6B                   ;C08F7E|        |C09234;

CODE_C08F82:
PHP                                  ;C08F82|08      |      ;
LDA.W $0000,X                        ;C08F83|BD0000  |810000;
CLC                                  ;C08F86|18      |      ;
ADC.W $0010,X                        ;C08F87|7D1000  |810010;
SEC                                  ;C08F8A|38      |      ;
SBC.W #$0010                         ;C08F8B|E91000  |      ;
LSR A                                ;C08F8E|4A      |      ;
LSR A                                ;C08F8F|4A      |      ;
LSR A                                ;C08F90|4A      |      ;
LSR A                                ;C08F91|4A      |      ;
STA.B $16                            ;C08F92|8516    |000016;
LDA.W $0002,X                        ;C08F94|BD0200  |810002;
SEC                                  ;C08F97|38      |      ;
SBC.W $0012,X                        ;C08F98|FD1200  |810012;
LSR A                                ;C08F9B|4A      |      ;
LSR A                                ;C08F9C|4A      |      ;
LSR A                                ;C08F9D|4A      |      ;
LSR A                                ;C08F9E|4A      |      ;
STA.B $18                            ;C08F9F|8518    |000018;
STA.B $1C                            ;C08FA1|851C    |00001C;
LDA.W $0002,X                        ;C08FA3|BD0200  |810002;
DEC A                                ;C08FA6|3A      |      ;
LSR A                                ;C08FA7|4A      |      ;
LSR A                                ;C08FA8|4A      |      ;
LSR A                                ;C08FA9|4A      |      ;
LSR A                                ;C08FAA|4A      |      ;
STA.B $00                            ;C08FAB|8500    |000000;
LDA.W $0012,X                        ;C08FAD|BD1200  |810012;
LSR A                                ;C08FB0|4A      |      ;
LSR A                                ;C08FB1|4A      |      ;
LSR A                                ;C08FB2|4A      |      ;
LSR A                                ;C08FB3|4A      |      ;
STA.B $0C                            ;C08FB4|850C    |00000C;
STA.B $0E                            ;C08FB6|850E    |00000E;
SEP #$20                             ;C08FB8|E220    |      ;

CODE_C08FBA:
JSR.W CODE_C09282                    ;C08FBA|208292  |C09282;
CMP.B #$0A                           ;C08FBD|C90A    |      ;
BEQ CODE_C09010                      ;C08FBF|F04F    |C09010;
INC.B $18                            ;C08FC1|E618    |000018;
DEC.B $0C                            ;C08FC3|C60C    |00000C;
BNE CODE_C08FBA                      ;C08FC5|D0F3    |C08FBA;
LDA.B $00                            ;C08FC7|A500    |000000;
STA.B $18                            ;C08FC9|8518    |000018;
JSR.W CODE_C09282                    ;C08FCB|208292  |C09282;
CMP.B #$0A                           ;C08FCE|C90A    |      ;
BEQ CODE_C09010                      ;C08FD0|F03E    |C09010;
LDA.B $1C                            ;C08FD2|A51C    |00001C;
STA.B $18                            ;C08FD4|8518    |000018;
INC.B $16                            ;C08FD6|E616    |000016;

CODE_C08FD8:
JSR.W CODE_C09282                    ;C08FD8|208292  |C09282;
BCS CODE_C09028                      ;C08FDB|B04B    |C09028;
CMP.B #$0F                           ;C08FDD|C90F    |      ;
BEQ CODE_C09010                      ;C08FDF|F02F    |C09010;
CMP.B #$05                           ;C08FE1|C905    |      ;
BEQ CODE_C09010                      ;C08FE3|F02B    |C09010;
CMP.B #$06                           ;C08FE5|C906    |      ;
BEQ CODE_C09010                      ;C08FE7|F027    |C09010;
INC.B $18                            ;C08FE9|E618    |000018;
DEC.B $0E                            ;C08FEB|C60E    |00000E;
BNE CODE_C08FD8                      ;C08FED|D0E9    |C08FD8;
LDA.B $00                            ;C08FEF|A500    |000000;
STA.B $18                            ;C08FF1|8518    |000018;
JSR.W CODE_C09282                    ;C08FF3|208292  |C09282;
BCS CODE_C09028                      ;C08FF6|B030    |C09028;
CMP.B #$0F                           ;C08FF8|C90F    |      ;
BEQ CODE_C09010                      ;C08FFA|F014    |C09010;
CMP.B #$05                           ;C08FFC|C905    |      ;
BEQ CODE_C09010                      ;C08FFE|F010    |C09010;
CMP.B #$06                           ;C09000|C906    |      ;
BEQ CODE_C09010                      ;C09002|F00C    |C09010;
PLP                                  ;C09004|28      |      ;
LDA.W $0016,X                        ;C09005|BD1600  |810016;
AND.W #$FFFB                         ;C09008|29FBFF  |      ;
STA.W $0016,X                        ;C0900B|9D1600  |810016;
CLC                                  ;C0900E|18      |      ;
RTS                                  ;C0900F|60      |      ;

CODE_C09010:
PLP                                  ;C09010|28      |      ;
LDA.W $0016,X                        ;C09011|BD1600  |810016;
ORA.W #$0004                         ;C09014|090400  |      ;
STA.W $0016,X                        ;C09017|9D1600  |810016;

CODE_C0901A:
LDA.W $0000,X                        ;C0901A|BD0000  |810000;
AND.W #$FFF0                         ;C0901D|29F0FF  |      ;
STA.W $0000,X                        ;C09020|9D0000  |810000;
STZ.W $0004,X                        ;C09023|9E0400  |810004;
SEC                                  ;C09026|38      |      ;
RTS                                  ;C09027|60      |      ;

CODE_C09028:
PLP                                  ;C09028|28      |      ;
BRA CODE_C0901A                      ;C09029|80EF    |C0901A;

CODE_C0902B:
PHP                                  ;C0902B|08      |      ;
LDA.W $0004,X                        ;C0902C|BD0400  |810004;
CLC                                  ;C0902F|18      |      ;
ADC.W $0000,X                        ;C09030|7D0000  |810000;
EOR.W $0000,X                        ;C09033|5D0000  |810000;
AND.W #$FFF0                         ;C09036|29F0FF  |      ;
BEQ CODE_C090B4                      ;C09039|F079    |C090B4;
LDA.W $0000,X                        ;C0903B|BD0000  |810000;
LSR A                                ;C0903E|4A      |      ;
LSR A                                ;C0903F|4A      |      ;
LSR A                                ;C09040|4A      |      ;
LSR A                                ;C09041|4A      |      ;
STA.B $16                            ;C09042|8516    |000016;
LDA.W $0002,X                        ;C09044|BD0200  |810002;
SEC                                  ;C09047|38      |      ;
SBC.W $0012,X                        ;C09048|FD1200  |810012;
LSR A                                ;C0904B|4A      |      ;
LSR A                                ;C0904C|4A      |      ;
LSR A                                ;C0904D|4A      |      ;
LSR A                                ;C0904E|4A      |      ;
STA.B $18                            ;C0904F|8518    |000018;
STA.B $1C                            ;C09051|851C    |00001C;
LDA.W $0002,X                        ;C09053|BD0200  |810002;
DEC A                                ;C09056|3A      |      ;
LSR A                                ;C09057|4A      |      ;
LSR A                                ;C09058|4A      |      ;
LSR A                                ;C09059|4A      |      ;
LSR A                                ;C0905A|4A      |      ;
STA.B $00                            ;C0905B|8500    |000000;
LDA.W $0012,X                        ;C0905D|BD1200  |810012;
LSR A                                ;C09060|4A      |      ;
LSR A                                ;C09061|4A      |      ;
LSR A                                ;C09062|4A      |      ;
LSR A                                ;C09063|4A      |      ;
STA.B $0C                            ;C09064|850C    |00000C;
STA.B $0E                            ;C09066|850E    |00000E;
SEP #$20                             ;C09068|E220    |      ;

CODE_C0906A:
JSR.W CODE_C09282                    ;C0906A|208292  |C09282;
CMP.B #$05                           ;C0906D|C905    |      ;
BEQ CODE_C090C0                      ;C0906F|F04F    |C090C0;
INC.B $18                            ;C09071|E618    |000018;
DEC.B $0C                            ;C09073|C60C    |00000C;
BNE CODE_C0906A                      ;C09075|D0F3    |C0906A;
LDA.B $00                            ;C09077|A500    |000000;
STA.B $18                            ;C09079|8518    |000018;
JSR.W CODE_C09282                    ;C0907B|208292  |C09282;
CMP.B #$05                           ;C0907E|C905    |      ;
BEQ CODE_C090C0                      ;C09080|F03E    |C090C0;
LDA.B $1C                            ;C09082|A51C    |00001C;
STA.B $18                            ;C09084|8518    |000018;
DEC.B $16                            ;C09086|C616    |000016;

CODE_C09088:
JSR.W CODE_C09282                    ;C09088|208292  |C09282;
BCS CODE_C090D8                      ;C0908B|B04B    |C090D8;
CMP.B #$0F                           ;C0908D|C90F    |      ;
BEQ CODE_C090C0                      ;C0908F|F02F    |C090C0;
CMP.B #$0A                           ;C09091|C90A    |      ;
BEQ CODE_C090C0                      ;C09093|F02B    |C090C0;
CMP.B #$06                           ;C09095|C906    |      ;
BEQ CODE_C090C0                      ;C09097|F027    |C090C0;
INC.B $18                            ;C09099|E618    |000018;
DEC.B $0E                            ;C0909B|C60E    |00000E;
BNE CODE_C09088                      ;C0909D|D0E9    |C09088;
LDA.B $00                            ;C0909F|A500    |000000;
STA.B $18                            ;C090A1|8518    |000018;
JSR.W CODE_C09282                    ;C090A3|208292  |C09282;
BCS CODE_C090D8                      ;C090A6|B030    |C090D8;
CMP.B #$0F                           ;C090A8|C90F    |      ;
BEQ CODE_C090C0                      ;C090AA|F014    |C090C0;
CMP.B #$0A                           ;C090AC|C90A    |      ;
BEQ CODE_C090C0                      ;C090AE|F010    |C090C0;
CMP.B #$06                           ;C090B0|C906    |      ;
BEQ CODE_C090C0                      ;C090B2|F00C    |C090C0;

CODE_C090B4:
PLP                                  ;C090B4|28      |      ;
LDA.W $0016,X                        ;C090B5|BD1600  |810016;
AND.W #$FFFB                         ;C090B8|29FBFF  |      ;
STA.W $0016,X                        ;C090BB|9D1600  |810016;
CLC                                  ;C090BE|18      |      ;
RTS                                  ;C090BF|60      |      ;

CODE_C090C0:
PLP                                  ;C090C0|28      |      ;
LDA.W $0016,X                        ;C090C1|BD1600  |810016;
ORA.W #$0004                         ;C090C4|090400  |      ;
STA.W $0016,X                        ;C090C7|9D1600  |810016;

CODE_C090CA:
LDA.W $0000,X                        ;C090CA|BD0000  |810000;
AND.W #$FFF0                         ;C090CD|29F0FF  |      ;
STA.W $0000,X                        ;C090D0|9D0000  |810000;
STZ.W $0004,X                        ;C090D3|9E0400  |810004;
SEC                                  ;C090D6|38      |      ;
RTS                                  ;C090D7|60      |      ;

CODE_C090D8:
PLP                                  ;C090D8|28      |      ;
BRA CODE_C090CA                      ;C090D9|80EF    |C090CA;

CODE_C090DB:
PHP                                  ;C090DB|08      |      ;
LDA.W $0002,X                        ;C090DC|BD0200  |810002;
SEC                                  ;C090DF|38      |      ;
SBC.W #$0010                         ;C090E0|E91000  |      ;
LSR A                                ;C090E3|4A      |      ;
LSR A                                ;C090E4|4A      |      ;
LSR A                                ;C090E5|4A      |      ;
LSR A                                ;C090E6|4A      |      ;
STA.B $18                            ;C090E7|8518    |000018;
LDA.W $0000,X                        ;C090E9|BD0000  |810000;
LSR A                                ;C090EC|4A      |      ;
LSR A                                ;C090ED|4A      |      ;
LSR A                                ;C090EE|4A      |      ;
LSR A                                ;C090EF|4A      |      ;
STA.B $16                            ;C090F0|8516    |000016;
STA.B $1A                            ;C090F2|851A    |00001A;
LDA.W $0000,X                        ;C090F4|BD0000  |810000;
CLC                                  ;C090F7|18      |      ;
ADC.W $0010,X                        ;C090F8|7D1000  |810010;
DEC A                                ;C090FB|3A      |      ;
LSR A                                ;C090FC|4A      |      ;
LSR A                                ;C090FD|4A      |      ;
LSR A                                ;C090FE|4A      |      ;
LSR A                                ;C090FF|4A      |      ;
STA.B $00                            ;C09100|8500    |000000;
LDA.W $0010,X                        ;C09102|BD1000  |810010;
LSR A                                ;C09105|4A      |      ;
LSR A                                ;C09106|4A      |      ;
LSR A                                ;C09107|4A      |      ;
LSR A                                ;C09108|4A      |      ;
STA.B $0C                            ;C09109|850C    |00000C;
STA.B $0E                            ;C0910B|850E    |00000E;
SEP #$20                             ;C0910D|E220    |      ;

CODE_C0910F:
JSR.W CODE_C09282                    ;C0910F|208292  |C09282;
CMP.B #$0C                           ;C09112|C90C    |      ;
BEQ CODE_C09165                      ;C09114|F04F    |C09165;
INC.B $16                            ;C09116|E616    |000016;
DEC.B $0C                            ;C09118|C60C    |00000C;
BNE CODE_C0910F                      ;C0911A|D0F3    |C0910F;
LDA.B $00                            ;C0911C|A500    |000000;
STA.B $16                            ;C0911E|8516    |000016;
JSR.W CODE_C09282                    ;C09120|208292  |C09282;
CMP.B #$0C                           ;C09123|C90C    |      ;
BEQ CODE_C09165                      ;C09125|F03E    |C09165;
LDA.B $1A                            ;C09127|A51A    |00001A;
STA.B $16                            ;C09129|8516    |000016;
INC.B $18                            ;C0912B|E618    |000018;

CODE_C0912D:
JSR.W CODE_C09282                    ;C0912D|208292  |C09282;
BCS CODE_C0917D                      ;C09130|B04B    |C0917D;
CMP.B #$0F                           ;C09132|C90F    |      ;
BEQ CODE_C09165                      ;C09134|F02F    |C09165;
CMP.B #$03                           ;C09136|C903    |      ;
BEQ CODE_C09165                      ;C09138|F02B    |C09165;
CMP.B #$06                           ;C0913A|C906    |      ;
BEQ CODE_C09165                      ;C0913C|F027    |C09165;
INC.B $16                            ;C0913E|E616    |000016;
DEC.B $0E                            ;C09140|C60E    |00000E;
BNE CODE_C0912D                      ;C09142|D0E9    |C0912D;
LDA.B $00                            ;C09144|A500    |000000;
STA.B $16                            ;C09146|8516    |000016;
JSR.W CODE_C09282                    ;C09148|208292  |C09282;
BCS CODE_C0917D                      ;C0914B|B030    |C0917D;
CMP.B #$0F                           ;C0914D|C90F    |      ;
BEQ CODE_C09165                      ;C0914F|F014    |C09165;
CMP.B #$03                           ;C09151|C903    |      ;
BEQ CODE_C09165                      ;C09153|F010    |C09165;
CMP.B #$06                           ;C09155|C906    |      ;
BEQ CODE_C09165                      ;C09157|F00C    |C09165;
PLP                                  ;C09159|28      |      ;
LDA.W $0016,X                        ;C0915A|BD1600  |810016;
AND.W #$FFFB                         ;C0915D|29FBFF  |      ;
STA.W $0016,X                        ;C09160|9D1600  |810016;
CLC                                  ;C09163|18      |      ;
RTS                                  ;C09164|60      |      ;

CODE_C09165:
PLP                                  ;C09165|28      |      ;
LDA.W $0016,X                        ;C09166|BD1600  |810016;
ORA.W #$0004                         ;C09169|090400  |      ;
STA.W $0016,X                        ;C0916C|9D1600  |810016;

CODE_C0916F:
LDA.W $0002,X                        ;C0916F|BD0200  |810002;
AND.W #$FFF0                         ;C09172|29F0FF  |      ;
STA.W $0002,X                        ;C09175|9D0200  |810002;
STZ.W $0006,X                        ;C09178|9E0600  |810006;
SEC                                  ;C0917B|38      |      ;
RTS                                  ;C0917C|60      |      ;

CODE_C0917D:
PLP                                  ;C0917D|28      |      ;
BRA CODE_C0916F                      ;C0917E|80EF    |C0916F;

CODE_C09180:
PHP                                  ;C09180|08      |      ;
LDA.W $0006,X                        ;C09181|BD0600  |810006;
CLC                                  ;C09184|18      |      ;
ADC.W $0002,X                        ;C09185|7D0200  |810002;
EOR.W $0002,X                        ;C09188|5D0200  |810002;
AND.W #$FFF0                         ;C0918B|29F0FF  |      ;
BEQ CODE_C0920D                      ;C0918E|F07D    |C0920D;
LDA.W $0002,X                        ;C09190|BD0200  |810002;
SEC                                  ;C09193|38      |      ;
SBC.W $0012,X                        ;C09194|FD1200  |810012;
LSR A                                ;C09197|4A      |      ;
LSR A                                ;C09198|4A      |      ;
LSR A                                ;C09199|4A      |      ;
LSR A                                ;C0919A|4A      |      ;
STA.B $18                            ;C0919B|8518    |000018;
LDA.W $0000,X                        ;C0919D|BD0000  |810000;
LSR A                                ;C091A0|4A      |      ;
LSR A                                ;C091A1|4A      |      ;
LSR A                                ;C091A2|4A      |      ;
LSR A                                ;C091A3|4A      |      ;
STA.B $16                            ;C091A4|8516    |000016;
STA.B $1A                            ;C091A6|851A    |00001A;
LDA.W $0000,X                        ;C091A8|BD0000  |810000;
CLC                                  ;C091AB|18      |      ;
ADC.W $0010,X                        ;C091AC|7D1000  |810010;
DEC A                                ;C091AF|3A      |      ;
LSR A                                ;C091B0|4A      |      ;
LSR A                                ;C091B1|4A      |      ;
LSR A                                ;C091B2|4A      |      ;
LSR A                                ;C091B3|4A      |      ;
STA.B $00                            ;C091B4|8500    |000000;
LDA.W $0010,X                        ;C091B6|BD1000  |810010;
LSR A                                ;C091B9|4A      |      ;
LSR A                                ;C091BA|4A      |      ;
LSR A                                ;C091BB|4A      |      ;
LSR A                                ;C091BC|4A      |      ;
STA.B $0C                            ;C091BD|850C    |00000C;
STA.B $0E                            ;C091BF|850E    |00000E;
SEP #$20                             ;C091C1|E220    |      ;

CODE_C091C3:
JSR.W CODE_C09282                    ;C091C3|208292  |C09282;
CMP.B #$03                           ;C091C6|C903    |      ;
BEQ CODE_C09219                      ;C091C8|F04F    |C09219;
INC.B $16                            ;C091CA|E616    |000016;
DEC.B $0C                            ;C091CC|C60C    |00000C;
BNE CODE_C091C3                      ;C091CE|D0F3    |C091C3;
LDA.B $00                            ;C091D0|A500    |000000;
STA.B $16                            ;C091D2|8516    |000016;
JSR.W CODE_C09282                    ;C091D4|208292  |C09282;
CMP.B #$03                           ;C091D7|C903    |      ;
BEQ CODE_C09219                      ;C091D9|F03E    |C09219;
LDA.B $1A                            ;C091DB|A51A    |00001A;
STA.B $16                            ;C091DD|8516    |000016;
DEC.B $18                            ;C091DF|C618    |000018;

CODE_C091E1:
JSR.W CODE_C09282                    ;C091E1|208292  |C09282;
BCS CODE_C09231                      ;C091E4|B04B    |C09231;
CMP.B #$0F                           ;C091E6|C90F    |      ;
BEQ CODE_C09219                      ;C091E8|F02F    |C09219;
CMP.B #$0C                           ;C091EA|C90C    |      ;
BEQ CODE_C09219                      ;C091EC|F02B    |C09219;
CMP.B #$06                           ;C091EE|C906    |      ;
BEQ CODE_C09219                      ;C091F0|F027    |C09219;
INC.B $16                            ;C091F2|E616    |000016;
DEC.B $0E                            ;C091F4|C60E    |00000E;
BNE CODE_C091E1                      ;C091F6|D0E9    |C091E1;
LDA.B $00                            ;C091F8|A500    |000000;
STA.B $16                            ;C091FA|8516    |000016;
JSR.W CODE_C09282                    ;C091FC|208292  |C09282;
BCS CODE_C09231                      ;C091FF|B030    |C09231;
CMP.B #$0F                           ;C09201|C90F    |      ;
BEQ CODE_C09219                      ;C09203|F014    |C09219;
CMP.B #$0C                           ;C09205|C90C    |      ;
BEQ CODE_C09219                      ;C09207|F010    |C09219;
CMP.B #$06                           ;C09209|C906    |      ;
BEQ CODE_C09219                      ;C0920B|F00C    |C09219;

CODE_C0920D:
PLP                                  ;C0920D|28      |      ;
LDA.W $0016,X                        ;C0920E|BD1600  |810016;
AND.W #$FFFB                         ;C09211|29FBFF  |      ;
STA.W $0016,X                        ;C09214|9D1600  |810016;
CLC                                  ;C09217|18      |      ;
RTS                                  ;C09218|60      |      ;

CODE_C09219:
PLP                                  ;C09219|28      |      ;
LDA.W $0016,X                        ;C0921A|BD1600  |810016;
ORA.W #$0004                         ;C0921D|090400  |      ;
STA.W $0016,X                        ;C09220|9D1600  |810016;

CODE_C09223:
LDA.W $0002,X                        ;C09223|BD0200  |810002;
AND.W #$FFF0                         ;C09226|29F0FF  |      ;
STA.W $0002,X                        ;C09229|9D0200  |810002;
STZ.W $0006,X                        ;C0922C|9E0600  |810006;
SEC                                  ;C0922F|38      |      ;
RTS                                  ;C09230|60      |      ;

CODE_C09231:
PLP                                  ;C09231|28      |      ;
BRA CODE_C09223                      ;C09232|80EF    |C09223;
db $BD,$04,$00,$1D,$04,$00,$F0,$33   ;C09234|        |000004;
db $BD,$00,$00,$18,$7D,$04,$00,$38   ;C0923C|        |000000;
db $E9,$04,$00,$4A,$4A,$4A,$4A,$85   ;C09244|        |      ;
db $16,$BD,$02,$00,$18,$7D,$06,$00   ;C0924C|        |0000BD;
db $38,$E9,$04,$00,$4A,$4A,$4A,$4A   ;C09254|        |      ;
db $85,$18,$20,$82,$92,$C9,$0F,$00   ;C0925C|        |000018;
db $F0,$0B,$BD,$16,$00,$29,$FB,$FF   ;C09264|        |C09271;
db $9D,$16,$00,$18,$60,$9E,$04,$00   ;C0926C|        |000016;
db $9E,$06,$00,$BD,$16,$00,$09,$04   ;C09274|        |000006;
db $00,$9D,$16,$00,$38,$60           ;C0927C|        |      ;

CODE_C09282:
PHP                                  ;C09282|08      |      ;
PHX                                  ;C09283|DA      |      ;
REP #$20                             ;C09284|C220    |      ;
LDA.B $18                            ;C09286|A518    |000018;
ASL A                                ;C09288|0A      |      ;
ASL A                                ;C09289|0A      |      ;
ASL A                                ;C0928A|0A      |      ;
ASL A                                ;C0928B|0A      |      ;
PHA                                  ;C0928C|48      |      ;
SEP #$20                             ;C0928D|E220    |      ;
LDA.W $0343                          ;C0928F|AD4303  |810343;
JSL.L multiply                    ;C09292|22D1B182|82B1D1;
STA.B $02,S                          ;C09296|8302    |000002;
LDA.B $16                            ;C09298|A516    |000016;
AND.B #$0F                           ;C0929A|290F    |      ;
CLC                                  ;C0929C|18      |      ;
ADC.B $01,S                          ;C0929D|6301    |000001;
STA.B $01,S                          ;C0929F|8301    |000001;
LDA.B $16                            ;C092A1|A516    |000016;
LSR A                                ;C092A3|4A      |      ;
LSR A                                ;C092A4|4A      |      ;
LSR A                                ;C092A5|4A      |      ;
LSR A                                ;C092A6|4A      |      ;
CLC                                  ;C092A7|18      |      ;
ADC.B $02,S                          ;C092A8|6302    |000002;
STA.B $02,S                          ;C092AA|8302    |000002;
PLX                                  ;C092AC|FA      |      ;
CPX.W #$4000                         ;C092AD|E00040  |      ;
BCS CODE_C092C0                      ;C092B0|B00E    |C092C0;
LDA.L passable_map,X                      ;C092B2|BF00807F|7F8000;
BIT.B #$F0                           ;C092B6|89F0    |      ;
BNE CODE_C092C0                      ;C092B8|D006    |C092C0;
AND.B #$0F                           ;C092BA|290F    |      ;
PLX                                  ;C092BC|FA      |      ;
PLP                                  ;C092BD|28      |      ;
CLC                                  ;C092BE|18      |      ;
RTS                                  ;C092BF|60      |      ;

CODE_C092C0:
LDA.B #$0F                           ;C092C0|A90F    |      ;
PLX                                  ;C092C2|FA      |      ;
PLP                                  ;C092C3|28      |      ;
SEC                                  ;C092C4|38      |      ;
RTS                                  ;C092C5|60      |      ;

CODE_C092C6:
LDA.W $0000,X                        ;C092C6|BD0000  |810000;
CLC                                  ;C092C9|18      |      ;
ADC.W $0004,X                        ;C092CA|7D0400  |810004;
STA.W $0000,X                        ;C092CD|9D0000  |810000;
LDA.W $0002,X                        ;C092D0|BD0200  |810002;
CLC                                  ;C092D3|18      |      ;
ADC.W $0006,X                        ;C092D4|7D0600  |810006;
STA.W $0002,X                        ;C092D7|9D0200  |810002;
RTS                                  ;C092DA|60      |      ;

CODE_C092DB:
PHP                                  ;C092DB|08      |      ;
REP #$20                             ;C092DC|C220    |      ;
LDX.W #$1800                         ;C092DE|A20018  |      ;
STX.B $4A                            ;C092E1|864A    |00004A;
LDA.W #$0800                         ;C092E3|A90008  |      ;

CODE_C092E6:
STA.W $0000,X                        ;C092E6|9D0000  |810000;
INX                                  ;C092E9|E8      |      ;
INX                                  ;C092EA|E8      |      ;
CLC                                  ;C092EB|18      |      ;
ADC.W #$0040                         ;C092EC|694000  |      ;
CPX.W #$1880                         ;C092EF|E08018  |      ;
BNE CODE_C092E6                      ;C092F2|D0F2    |C092E6;
LDX.W #$0800                         ;C092F4|A20008  |      ;
STX.W $06B2                          ;C092F7|8EB206  |8106B2;
LDA.W #$0000                         ;C092FA|A90000  |      ;
TAX                                  ;C092FD|AA      |      ;

CODE_C092FE:
STA.W $0800,X                        ;C092FE|9D0008  |810800;
INX                                  ;C09301|E8      |      ;
INX                                  ;C09302|E8      |      ;
CPX.W #$1000                         ;C09303|E00010  |      ;
BNE CODE_C092FE                      ;C09306|D0F6    |C092FE;
PLP                                  ;C09308|28      |      ;
RTL                                  ;C09309|6B      |      ;

CODE_C0930A:
    PHP                                  ;C0930A|08      |      ;
    REP #$20                             ;C0930B|C220    |      ;
    LDA.W _03BC                          ;C0930D|ADBC03  |8103BC;
    ASL A                                ;C09310|0A      |      ;
    TAX                                  ;C09311|AA      |      ;
    LDA.W Entity.offense, X               ;C09312|BD0080  |818000;
    SEC                                  ;C09315|38      |      ;
    SBC.W #$8000                         ;C09316|E90080  |      ;
    STA.W $03B2                          ;C09319|8DB203  |8103B2;
    SEP #$20
    LDX.W #0

.loop:
    LDA.W UNREACH_8199B4,X               ;C09321|BDB499  |8199B4;
    BMI .end                      ;C09324|3018    |C0933E;
    CMP.W map_number                          ;C09326|CD1403  |810314;
    BNE .next                      ;C09329|D00D    |C09338;
    LDA.W UNREACH_8199B5,X               ;C0932B|BDB599  |8199B5;
    CMP.W map_sub_number                          ;C0932E|CD1603  |810316;
    BNE .next                      ;C09331|D005    |C09338;
    JSR.W CODE_C09340                    ;C09333|204093  |C09340;
    BRA .end                      ;C09336|8006    |C0933E;

.next:
    INX #4
    BRA .loop

.end:
    PLP                                  ;C0933E|28      |      ;
    RTL                                  ;C0933F|6B      |      ;

CODE_C09340:
LDA.B #$81                           ;C09340|A981    |      ;
STA.B $2B                            ;C09342|852B    |00002B;
REP #$20                             ;C09344|C220    |      ;
LDA.W UNREACH_8199B6,X               ;C09346|BDB699  |8199B6;
STA.B $29                            ;C09349|8529    |000029;
JSL.L TakeEntityPtr                    ;C0934B|2202E780|80E702;
BRA CODE_C09368                      ;C0934F|8017    |C09368;

CODE_C09351:
LDA.B [$29]                          ;C09351|A729    |000029;
AND.W #$00FF                         ;C09353|29FF00  |      ;
CMP.W #$00FF                         ;C09356|C9FF00  |      ;
BNE CODE_C0935C                      ;C09359|D001    |C0935C;
RTS                                  ;C0935B|60      |      ;

CODE_C0935C:
JSL.L TakeEntityPtr                    ;C0935C|2202E780|80E702;
TYA                                  ;C09360|98      |      ;
STA.W $003E,X                        ;C09361|9D3E00  |81003E;
TXA                                  ;C09364|8A      |      ;
STA.W $003C,Y                        ;C09365|993C00  |81003C;

CODE_C09368:
STY.W $06B4                          ;C09368|8CB406  |8106B4;
TYX                                  ;C0936B|BB      |      ;
LDA.B $29                            ;C0936C|A529    |000029;
STA.W $003A,X                        ;C0936E|9D3A00  |81003A;
CLC                                  ;C09371|18      |      ;
ADC.W #$0004                         ;C09372|690400  |      ;
STA.B $29                            ;C09375|8529    |000029;
JSL.L CODE_C093D7                    ;C09377|22D79380|8093D7;
LDA.W $0016,X                        ;C0937B|BD1600  |810016;
BIT.W #$0080                         ;C0937E|898000  |      ;
BEQ CODE_C09351                      ;C09381|F0CE    |C09351;
LDA.W TeleportPos.x                          ;C09383|AD7C03  |81037C;
ORA.W TeleportPos.y                          ;C09386|0D7E03  |81037E;
BEQ CODE_C093C5                      ;C09389|F03A    |C093C5;
LDA.W TeleportPos.x                          ;C0938B|AD7C03  |81037C;
STA.W $0000,X                        ;C0938E|9D0000  |810000;
LDA.W TeleportPos.y                          ;C09391|AD7E03  |81037E;
CLC                                  ;C09394|18      |      ;
ADC.W #$0010                         ;C09395|691000  |      ;
STA.W $0002,X                        ;C09398|9D0200  |810002;
LDA.W TeleportPos.facing                          ;C0939B|AD8003  |810380;
STA.W $001E,X                        ;C0939E|9D1E00  |81001E;
STZ.W $0020,X                        ;C093A1|9E2000  |810020;
JSL.L CODE_C0891F                    ;C093A4|221F8980|80891F;
STZ.W $0014,X                        ;C093A8|9E1400  |810014;
LDA.W TeleportPos.x                          ;C093AB|AD7C03  |81037C;
STZ.W TeleportPos.x                          ;C093AE|9C7C03  |81037C;
LSR A                                ;C093B1|4A      |      ;
LSR A                                ;C093B2|4A      |      ;
LSR A                                ;C093B3|4A      |      ;
LSR A                                ;C093B4|4A      |      ;
STA.W PlayerPosInt.x                          ;C093B5|8D7803  |810378;
LDA.W TeleportPos.y                          ;C093B8|AD7E03  |81037E;
STZ.W TeleportPos.y                          ;C093BB|9C7E03  |81037E;
LSR A                                ;C093BE|4A      |      ;
LSR A                                ;C093BF|4A      |      ;
LSR A                                ;C093C0|4A      |      ;
LSR A                                ;C093C1|4A      |      ;
STA.W PlayerPosInt.y                          ;C093C2|8D7A03  |81037A;

CODE_C093C5:
LDA.W $0000,X                        ;C093C5|BD0000  |810000;
STA.W PlayerPosReal.x                          ;C093C8|8D7403  |810374;
LDA.W $0002,X                        ;C093CB|BD0200  |810002;
STA.W PlayerPosReal.y                          ;C093CE|8D7603  |810376;
STX.W _039E                          ;C093D1|8E9E03  |81039E;
BRL CODE_C09351                      ;C093D4|827AFF  |C09351;

CODE_C093D7:
TXY                                  ;C093D7|9B      |      ;
LDX.W $003A,Y                        ;C093D8|BE3A00  |81003A;
LDA.L $810000,X                      ;C093DB|BF000081|810000;
AND.W #$00FF                         ;C093DF|29FF00  |      ;
ASL A                                ;C093E2|0A      |      ;
ASL A                                ;C093E3|0A      |      ;
ASL A                                ;C093E4|0A      |      ;
ASL A                                ;C093E5|0A      |      ;
STA.W $0000,Y                        ;C093E6|990000  |810000;
LDA.L $810001,X                      ;C093E9|BF010081|810001;
PHA                                  ;C093ED|48      |      ;
AND.W #$00FF                         ;C093EE|29FF00  |      ;
ASL A                                ;C093F1|0A      |      ;
ASL A                                ;C093F2|0A      |      ;
ASL A                                ;C093F3|0A      |      ;
ASL A                                ;C093F4|0A      |      ;
CLC                                  ;C093F5|18      |      ;
ADC.W #$0010                         ;C093F6|691000  |      ;
STA.W $0002,Y                        ;C093F9|990200  |810002;
PLA                                  ;C093FC|68      |      ;
AND.W #$C100                         ;C093FD|2900C1  |      ;
ORA.W $0372                          ;C09400|0D7203  |810372;
STA.W $001C,Y                        ;C09403|991C00  |81001C;
SEP #$20                             ;C09406|E220    |      ;
LDA.L $810003,X                      ;C09408|BF030081|810003;
XBA                                  ;C0940C|EB      |      ;
LDA.B #$0E                           ;C0940D|A90E    |      ;
JSL.L multiply                    ;C0940F|22D1B182|82B1D1;
REP #$20                             ;C09413|C220    |      ;
CLC                                  ;C09415|18      |      ;
ADC.W $03B2                          ;C09416|6DB203  |8103B2;
TAX                                  ;C09419|AA      |      ;
STA.W $0038,Y                        ;C0941A|993800  |810038;
SEP #$20                             ;C0941D|E220    |      ;
LDA.W Entity.hp,X               ;C0941F|BD0280  |818002;
STA.W $0025,Y                        ;C09422|992500  |810025;
LDA.W Entity.sprite_id,X               ;C09425|BD0580  |818005;
STA.W $001E,Y                        ;C09428|991E00  |81001E;
LDA.W Entity._unknown2,X               ;C0942B|BD0A80  |81800A;
STA.W $0024,Y                        ;C0942E|992400  |810024;
LDA.W Entity.behaviour_bank,X               ;C09431|BD0D80  |81800D;
STA.W $0036,Y                        ;C09434|993600  |810036;
REP #$20                             ;C09437|C220    |      ;
LDA.W Entity.facing,X               ;C09439|BD0680  |818006;
ORA.W #$8000                         ;C0943C|090080  |      ;
STA.W $0016,Y                        ;C0943F|991600  |810016;
LDA.W Entity._unknown1,X               ;C09442|BD0880  |818008;
STA.W $0022,Y                        ;C09445|992200  |810022;
LDA.W Entity.behaviour_addr,X               ;C09448|BD0B80  |81800B;
STA.W $0018,Y                        ;C0944B|991800  |810018;
TYX                                  ;C0944E|BB      |      ;
LDA.W $0016,X                        ;C0944F|BD1600  |810016;
BIT.W #$0040                         ;C09452|894000  |      ;
BNE CODE_C0946D                      ;C09455|D016    |C0946D;
BIT.W #$2000                         ;C09457|890020  |      ;
BEQ CODE_C0946D                      ;C0945A|F011    |C0946D;
LDA.W #$0010                         ;C0945C|A91000  |      ;
STA.W $000C,X                        ;C0945F|9D0C00  |81000C;
STA.W $000A,X                        ;C09462|9D0A00  |81000A;
STZ.W $0008,X                        ;C09465|9E0800  |810008;
STZ.W $000E,X                        ;C09468|9E0E00  |81000E;
BRA CODE_C09471                      ;C0946B|8004    |C09471;

CODE_C0946D:
JSL.L CODE_C0891F                    ;C0946D|221F8980|80891F;

CODE_C09471:
STZ.W $0014,X                        ;C09471|9E1400  |810014;
STZ.W $0004,X                        ;C09474|9E0400  |810004;
STZ.W $0006,X                        ;C09477|9E0600  |810006;
RTL                                  ;C0947A|6B      |      ;

CODE_C0947B:
    PHP                                  ;C0947B|08      |      ;
    PHX                                  ;C0947C|DA      |      ;
    PHY                                  ;C0947D|5A      |      ;
    REP #$20                             ;C0947E|C220    |      ;
    PHX                                  ;C09480|DA      |      ;
    LDA.L lair_spawn, X                      ;C09481|BF03027F|7F0203;
STA.B $00                            ;C09485|8500    |000000;
LDA.W UNREACH_81BA19,Y               ;C09487|B919BA  |81BA19;
AND.W #$00FF                         ;C0948A|29FF00  |      ;
ASL A                                ;C0948D|0A      |      ;
ASL A                                ;C0948E|0A      |      ;
ASL A                                ;C0948F|0A      |      ;
ASL A                                ;C09490|0A      |      ;
STA.B $16                            ;C09491|8516    |000016;
LDA.W UNREACH_81BA1A,Y               ;C09493|B91ABA  |81BA1A;
AND.W #$00FF                         ;C09496|29FF00  |      ;
INC A                                ;C09499|1A      |      ;
ASL A                                ;C0949A|0A      |      ;
ASL A                                ;C0949B|0A      |      ;
ASL A                                ;C0949C|0A      |      ;
ASL A                                ;C0949D|0A      |      ;
STA.B $18                            ;C0949E|8518    |000018;
TYX                                  ;C094A0|BB      |      ;
PHX                                  ;C094A1|DA      |      ;
LDX.W $06B4                          ;C094A2|AEB406  |8106B4;
JSR.W CODE_C0E6DA                    ;C094A5|20DAE6  |C0E6DA;
PLX                                  ;C094A8|FA      |      ;
LDA.W #$A000                         ;C094A9|A900A0  |      ;
STA.W $0016,Y                        ;C094AC|991600  |810016;
PLA                                  ;C094AF|68      |      ;
STA.W $0034,Y                        ;C094B0|993400  |810034;
LDA.B $16                            ;C094B3|A516    |000016;
STA.W $0000,Y                        ;C094B5|990000  |810000;
LDA.B $18                            ;C094B8|A518    |000018;
STA.W $0002,Y                        ;C094BA|990200  |810002;
LDA.W UNREACH_81BA23,X               ;C094BD|BD23BA  |81BA23;
ORA.W #$0100                         ;C094C0|090001  |      ;
ORA.W $0372                          ;C094C3|0D7203  |810372;
STA.W $001C,Y                        ;C094C6|991C00  |81001C;
STA.W $0030,Y                        ;C094C9|993000  |810030;
LDA.W UNREACH_81BA1D,X               ;C094CC|BD1DBA  |81BA1D;
STA.W $0018,Y                        ;C094CF|991800  |810018;
SEP #$20                             ;C094D2|E220    |      ;
LDA.W UNREACH_81BA1F,X               ;C094D4|BD1FBA  |81BA1F;
STA.W $0036,Y                        ;C094D7|993600  |810036;
LDA.B $00                            ;C094DA|A500    |000000;
STA.W $002E,Y                        ;C094DC|992E00  |81002E;
STA.W $002F,Y                        ;C094DF|992F00  |81002F;
REP #$20                             ;C094E2|C220    |      ;
LDA.W UNREACH_81BA21,X               ;C094E4|BD21BA  |81BA21;
AND.W #$00FF                         ;C094E7|29FF00  |      ;
STA.W $0026,Y                        ;C094EA|992600  |810026;
SEP #$20                             ;C094ED|E220    |      ;
LDA.W UNREACH_81BA22,X               ;C094EF|BD22BA  |81BA22;
XBA                                  ;C094F2|EB      |      ;
LDA.B #$0E                           ;C094F3|A90E    |      ;
JSL.L multiply                    ;C094F5|22D1B182|82B1D1;
REP #$20                             ;C094F9|C220    |      ;
CLC                                  ;C094FB|18      |      ;
ADC.W $03B2                          ;C094FC|6DB203  |8103B2;
STA.W $0038,Y                        ;C094FF|993800  |810038;
TAX                                  ;C09502|AA      |      ;
SEP #$20                             ;C09503|E220    |      ;
LDA.W Entity.hp,X               ;C09505|BD0280  |818002;
STA.W $0025,Y                        ;C09508|992500  |810025;
LDA.W Entity.sprite_id,X               ;C0950B|BD0580  |818005;
STA.W $001E,Y                        ;C0950E|991E00  |81001E;
LDA.W Entity._unknown2,X               ;C09511|BD0A80  |81800A;
STA.W $0024,Y                        ;C09514|992400  |810024;
REP #$20                             ;C09517|C220    |      ;
LDA.W Entity._unknown1,X               ;C09519|BD0880  |818008;
STA.W $0022,Y                        ;C0951C|992200  |810022;
LDA.W #$0010                         ;C0951F|A91000  |      ;
STA.W $0010,Y                        ;C09522|991000  |810010;
STA.W $0012,Y                        ;C09525|991200  |810012;
STA.W $000C,Y                        ;C09528|990C00  |81000C;
STA.W $000A,Y                        ;C0952B|990A00  |81000A;
LDA.W #$0000                         ;C0952E|A90000  |      ;
STA.W $0008,Y                        ;C09531|990800  |810008;
STA.W $000E,Y                        ;C09534|990E00  |81000E;
STA.W $0032,Y                        ;C09537|993200  |810032;
PLY                                  ;C0953A|7A      |      ;
PLX                                  ;C0953B|FA      |      ;
PLP                                  ;C0953C|28      |      ;
RTL                                  ;C0953D|6B      |      ;


LDA.W $0470                          ;C0953E|AD7004  |810470;
BEQ CODE_C09546                      ;C09541|F003    |C09546;
STZ.W buttons_pressed

CODE_C09546:
LDA.W $0445                          ;C09546|AD4504  |810445;
BNE CODE_C09550                      ;C09549|D005    |C09550;
LDA.W Equipment.sword                          ;C0954B|AD5E1B  |811B5E;
BNE CODE_C0955B                      ;C0954E|D00B    |C0955B;

CODE_C09550:
LDY.W _039E                          ;C09550|AC9E03  |81039E;
LDA.W #$C000                         ;C09553|A900C0  |      ;
TRB.W buttons_pressed                          ;C09556|1C2203  |810322;
BRA CODE_C0958B                      ;C09559|8030    |C0958B;

CODE_C0955B:
JSR.W CODE_C098CD                    ;C0955B|20CD98  |C098CD;
PHX                                  ;C0955E|DA      |      ;
DEC A                                ;C0955F|3A      |      ;
ASL A                                ;C09560|0A      |      ;
TAX                                  ;C09561|AA      |      ;
LDA.L WeaponLevelRequirement, X               ;C09562|BF9FE482|82E49F;
CMP.W player_level_ascii                          ;C09566|CD6A1B  |811B6A;
BEQ CODE_C09573                      ;C09569|F008    |C09573;
BCC CODE_C09573                      ;C0956B|9006    |C09573;
LDA.W #$8000
TRB.W $0322

CODE_C09573:
PLX                                  ;C09573|FA      |      ;
LDY.W _039E                          ;C09574|AC9E03  |81039E;
LDA.W $001E,Y                        ;C09577|B91E00  |81001E;
SEC                                  ;C0957A|38      |      ;
SBC.W #$0014                         ;C0957B|E91400  |      ;
CMP.W #$0010                         ;C0957E|C91000  |      ;
BCC CODE_C095A3                      ;C09581|9020    |C095A3;
LDA.W buttons_pressed                          ;C09583|AD2203  |810322;
AND.W #$8000                         ;C09586|290080  |      ;
BNE CODE_C095A4                      ;C09589|D019    |C095A4;

CODE_C0958B:
LDA.W $0016,Y                        ;C0958B|B91600  |810016;
BIT.W #$0400                         ;C0958E|890004  |      ;
BNE CODE_C095AB                      ;C09591|D018    |C095AB;
PHX                                  ;C09593|DA      |      ;
LDA.W $001E,Y                        ;C09594|B91E00  |81001E;
ASL A                                ;C09597|0A      |      ;
TAX                                  ;C09598|AA      |      ;
LDA.L DATA_C095B4,X               ;C09599|BFB49580|8095B4;
PLX                                  ;C0959D|FA      |      ;
AND.W buttons_pressed                          ;C0959E|2D2203  |810322;
BEQ CODE_C095A4                      ;C095A1|F001    |C095A4;

CODE_C095A3:
RTL                                  ;C095A3|6B      |      ;

CODE_C095A4:
LDA.W #$9A91                         ;C095A4|A9919A  |      ;
STA.W $0018,Y                        ;C095A7|991800  |810018;
RTL                                  ;C095AA|6B      |      ;

CODE_C095AB:
LDA.W #$9A91                         ;C095AB|A9919A  |      ;
STA.W $0018,Y                        ;C095AE|991800  |810018;
COP #$91                             ;C095B1|0291    |      ;
RTL                                  ;C095B3|6B      |      ;

DATA_C095B4:
dw $0400, $0800, $0200, $0100
dw $0400, $0800, $0800, $0400
dw $0200, $0100, $0100, $0200
dw $0100, $0200, $0200, $0100
dw $0400, $0800, $0800, $0400
dw $0000, $0000, $0000, $0000
dw $0000, $0000, $0000, $0000
dw $0000, $0000, $0000, $0000
dw $0000, $0000, $0000, $0000
dw $0100, $0100, $0200, $0200
dw $0400, $0400, $0800, $0800


LDA.W $0016,X                        ;C0960C|BD1600  |810016;
ORA.W #$0010                         ;C0960F|091000  |      ;
STA.W $0016,X                        ;C09612|9D1600  |810016;
COP #$91                             ;C09615|0291    |      ;
PHX                                  ;C09617|DA      |      ;
LDX.W _039E                          ;C09618|AE9E03  |81039E;
JSR.W CODE_C096C8                    ;C0961B|20C896  |C096C8;
BCC CODE_C0965C                      ;C0961E|903C    |C0965C;
LDA.W $0004,X                        ;C09620|BD0400  |810004;
PHA                                  ;C09623|48      |      ;
LDA.W $0006,X                        ;C09624|BD0600  |810006;
PHA                                  ;C09627|48      |      ;
LDA.W $03D6                          ;C09628|ADD603  |8103D6;
STA.W $0004,X                        ;C0962B|9D0400  |810004;
LDA.W $03D8                          ;C0962E|ADD803  |8103D8;
STA.W $0006,X                        ;C09631|9D0600  |810006;
JSL.L CODE_C08F54                    ;C09634|22548F80|808F54;
LDA.W $0004,X                        ;C09638|BD0400  |810004;
STA.W $03D6                          ;C0963B|8DD603  |8103D6;
CLC                                  ;C0963E|18      |      ;
ADC.W $0000,X                        ;C0963F|7D0000  |810000;
STA.W $0000,X                        ;C09642|9D0000  |810000;
LDA.W $0006,X                        ;C09645|BD0600  |810006;
STA.W $03D8                          ;C09648|8DD803  |8103D8;
CLC                                  ;C0964B|18      |      ;
ADC.W $0002,X                        ;C0964C|7D0200  |810002;
STA.W $0002,X                        ;C0964F|9D0200  |810002;
PLA                                  ;C09652|68      |      ;
STA.W $0006,X                        ;C09653|9D0600  |810006;
PLA                                  ;C09656|68      |      ;
STA.W $0004,X                        ;C09657|9D0400  |810004;
BRA CODE_C0965F                      ;C0965A|8003    |C0965F;

CODE_C0965C:
JSR.W CODE_C0975F                    ;C0965C|205F97  |C0975F;

CODE_C0965F:
LDA.W button_mask                          ;C0965F|AD2603  |810326;
BIT.W #$0F00                         ;C09662|89000F  |      ;
BNE CODE_C09683                      ;C09665|D01C    |C09683;
LDA.W $03D6                          ;C09667|ADD603  |8103D6;
BNE CODE_C09675                      ;C0966A|D009    |C09675;
LDA.W $0000,X                        ;C0966C|BD0000  |810000;
AND.W #$FFFE                         ;C0966F|29FEFF  |      ;
STA.W $0000,X                        ;C09672|9D0000  |810000;

CODE_C09675:
LDA.W $03D8                          ;C09675|ADD803  |8103D8;
BNE CODE_C09683                      ;C09678|D009    |C09683;
LDA.W $0002,X                        ;C0967A|BD0200  |810002;
AND.W #$FFFE                         ;C0967D|29FEFF  |      ;
STA.W $0002,X                        ;C09680|9D0200  |810002;

CODE_C09683:
STZ.W $03D6                          ;C09683|9CD603  |8103D6;
STZ.W $03D8                          ;C09686|9CD803  |8103D8;
LDA.W $0000,X                        ;C09689|BD0000  |810000;
STA.W PlayerPosReal.x                          ;C0968C|8D7403  |810374;
LSR A                                ;C0968F|4A      |      ;
LSR A                                ;C09690|4A      |      ;
LSR A                                ;C09691|4A      |      ;
LSR A                                ;C09692|4A      |      ;
STA.W PlayerPosInt.x                          ;C09693|8D7803  |810378;
LDA.W $0002,X                        ;C09696|BD0200  |810002;
STA.W PlayerPosReal.y                          ;C09699|8D7603  |810376;
LSR A                                ;C0969C|4A      |      ;
LSR A                                ;C0969D|4A      |      ;
LSR A                                ;C0969E|4A      |      ;
LSR A                                ;C0969F|4A      |      ;
DEC A                                ;C096A0|3A      |      ;
STA.W PlayerPosInt.y                          ;C096A1|8D7A03  |81037A;
LDY.W $03A0                          ;C096A4|ACA003  |8103A0;
LDA.W $0000,X                        ;C096A7|BD0000  |810000;
STA.W $0000,Y                        ;C096AA|990000  |810000;
LDA.W $0002,X                        ;C096AD|BD0200  |810002;
STA.W $0002,Y                        ;C096B0|990200  |810002;
LDA.W $001E,X                        ;C096B3|BD1E00  |81001E;
ASL A                                ;C096B6|0A      |      ;
TAX                                  ;C096B7|AA      |      ;
LDA.W UNREACH_81FAD7,X               ;C096B8|BDD7FA  |81FAD7;
CLC                                  ;C096BB|18      |      ;
ADC.W $0002,Y                        ;C096BC|790200  |810002;
STA.W $0002,Y                        ;C096BF|990200  |810002;
JSL.L CODE_C28000                    ;C096C2|22008082|828000;
PLX                                  ;C096C6|FA      |      ;
RTL                                  ;C096C7|6B      |      ;

CODE_C096C8:
LDA.W $0000,X                        ;C096C8|BD0000  |810000;
STA.W PlayerPosReal.x                          ;C096CB|8D7403  |810374;
LSR A                                ;C096CE|4A      |      ;
LSR A                                ;C096CF|4A      |      ;
LSR A                                ;C096D0|4A      |      ;
LSR A                                ;C096D1|4A      |      ;
STA.W PlayerPosInt.x                          ;C096D2|8D7803  |810378;
LDA.W $0002,X                        ;C096D5|BD0200  |810002;
STA.W PlayerPosReal.y                          ;C096D8|8D7603  |810376;
LSR A                                ;C096DB|4A      |      ;
LSR A                                ;C096DC|4A      |      ;
LSR A                                ;C096DD|4A      |      ;
LSR A                                ;C096DE|4A      |      ;
DEC A                                ;C096DF|3A      |      ;
STA.W PlayerPosInt.y                          ;C096E0|8D7A03  |81037A;
CLC                                  ;C096E3|18      |      ;
LDY.W $03DA                          ;C096E4|ACDA03  |8103DA;
BNE CODE_C096EA                      ;C096E7|D001    |C096EA;
RTS                                  ;C096E9|60      |      ;

CODE_C096EA:
LDA.W $03A8                          ;C096EA|ADA803  |8103A8;
BEQ CODE_C096F0                      ;C096ED|F001    |C096F0;
RTS                                  ;C096EF|60      |      ;

CODE_C096F0:
LDA.W $0000,X                        ;C096F0|BD0000  |810000;
CLC                                  ;C096F3|18      |      ;
ADC.W #$000F                         ;C096F4|690F00  |      ;
LSR A                                ;C096F7|4A      |      ;
LSR A                                ;C096F8|4A      |      ;
LSR A                                ;C096F9|4A      |      ;
LSR A                                ;C096FA|4A      |      ;
STA.B $16                            ;C096FB|8516    |000016;
LDA.W $0002,X                        ;C096FD|BD0200  |810002;
DEC A                                ;C09700|3A      |      ;
LSR A                                ;C09701|4A      |      ;
LSR A                                ;C09702|4A      |      ;
LSR A                                ;C09703|4A      |      ;
LSR A                                ;C09704|4A      |      ;
STA.B $18                            ;C09705|8518    |000018;
SEP #$20                             ;C09707|E220    |      ;
PHB                                  ;C09709|8B      |      ;
LDA.W $03DC                          ;C0970A|ADDC03  |8103DC;
PHA                                  ;C0970D|48      |      ;
PLB                                  ;C0970E|AB      |      ;

CODE_C0970F:
LDA.W $0000,Y                        ;C0970F|B90000  |830000;
INC A                                ;C09712|1A      |      ;
BEQ CODE_C09751                      ;C09713|F03C    |C09751;
LDA.B $16                            ;C09715|A516    |000016;
CMP.W $0000,Y                        ;C09717|D90000  |830000;
BCC CODE_C09745                      ;C0971A|9029    |C09745;
LDA.W PlayerPosInt.x                          ;C0971C|AD7803  |830378;
CMP.W $0001,Y                        ;C0971F|D90100  |830001;
BCS CODE_C09745                      ;C09722|B021    |C09745;
LDA.B $18                            ;C09724|A518    |000018;
CMP.W $0002,Y                        ;C09726|D90200  |830002;
BCC CODE_C09745                      ;C09729|901A    |C09745;
LDA.W PlayerPosInt.y                          ;C0972B|AD7A03  |83037A;
CMP.W $0003,Y                        ;C0972E|D90300  |830003;
BCS CODE_C09745                      ;C09731|B012    |C09745;
REP #$20                             ;C09733|C220    |      ;
LDA.W $0004,Y                        ;C09735|B90400  |830004;
BEQ CODE_C0973D                      ;C09738|F003    |C0973D;
STA.W $03D6                          ;C0973A|8DD603  |8303D6;

CODE_C0973D:
LDA.W $0006,Y                        ;C0973D|B90600  |830006;
BEQ CODE_C09745                      ;C09740|F003    |C09745;
STA.W $03D8                          ;C09742|8DD803  |8303D8;

CODE_C09745:
REP #$20                             ;C09745|C220    |      ;
TYA                                  ;C09747|98      |      ;
CLC                                  ;C09748|18      |      ;
ADC.W #$0008                         ;C09749|690800  |      ;
TAY                                  ;C0974C|A8      |      ;
SEP #$20                             ;C0974D|E220    |      ;
BRA CODE_C0970F                      ;C0974F|80BE    |C0970F;

CODE_C09751:
REP #$20                             ;C09751|C220    |      ;
PLB                                  ;C09753|AB      |      ;
SEC                                  ;C09754|38      |      ;
LDA.W $03D6                          ;C09755|ADD603  |8103D6;
ORA.W $03D8                          ;C09758|0DD803  |8103D8;
BNE CODE_C0975E                      ;C0975B|D001    |C0975E;
CLC                                  ;C0975D|18      |      ;

CODE_C0975E:
RTS                                  ;C0975E|60      |      ;

CODE_C0975F:
LDA.W $0016,X                        ;C0975F|BD1600  |810016;
BIT.W #$0004                         ;C09762|890400  |      ;
BNE CODE_C09768                      ;C09765|D001    |C09768;
RTS                                  ;C09767|60      |      ;

CODE_C09768:
JSR.W CODE_C098BE                    ;C09768|20BE98  |C098BE;
BCC CODE_C0976E                      ;C0976B|9001    |C0976E;
db $60                               ;C0976D|        |      ;

CODE_C0976E:
AND.W #$00FF                         ;C0976E|29FF00  |      ;
BEQ CODE_C09780                      ;C09771|F00D    |C09780;
DEC A                                ;C09773|3A      |      ;
BEQ CODE_C097CD                      ;C09774|F057    |C097CD;
DEC A                                ;C09776|3A      |      ;
BNE CODE_C0977C                      ;C09777|D003    |C0977C;
BRL CODE_C09816                      ;C09779|829A00  |C09816;

CODE_C0977C:
BRL CODE_C0986A                      ;C0977C|82EB00  |C0986A;
db $60                               ;C0977F|        |      ;

CODE_C09780:
LDA.W buttons_pressed                          ;C09780|AD2203  |810322;
BIT.W #$0800                         ;C09783|890008  |      ;
BNE CODE_C09789                      ;C09786|D001    |C09789;
RTS                                  ;C09788|60      |      ;

CODE_C09789:
TXY                                  ;C09789|9B      |      ;
LDA.W $0000,X                        ;C0978A|BD0000  |810000;
AND.W #$000F                         ;C0978D|290F00  |      ;
BEQ CODE_C097BA                      ;C09790|F028    |C097BA;
LDA.W $0000,X                        ;C09792|BD0000  |810000;
STA.B $16                            ;C09795|8516    |000016;
LDA.W $0002,X                        ;C09797|BD0200  |810002;
SEC                                  ;C0979A|38      |      ;
SBC.W #$0020                         ;C0979B|E92000  |      ;
STA.B $18                            ;C0979E|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C097A0|22E08183|8381E0;
LDA.L passable_map,X                      ;C097A4|BF00807F|7F8000;
AND.W #$00FC                         ;C097A8|29FC00  |      ;
BEQ CODE_C097BC                      ;C097AB|F00F    |C097BC;
JSL.L CODE_C38242                    ;C097AD|22428283|838242;
LDA.L passable_map,X                      ;C097B1|BF00807F|7F8000;
AND.W #$00FC                         ;C097B5|29FC00  |      ;
BEQ CODE_C097C1                      ;C097B8|F007    |C097C1;

CODE_C097BA:
TYX                                  ;C097BA|BB      |      ;
RTS                                  ;C097BB|60      |      ;

CODE_C097BC:
LDA.W #$FFFE                         ;C097BC|A9FEFF  |      ;
BRA CODE_C097C4                      ;C097BF|8003    |C097C4;

CODE_C097C1:
LDA.W #$0002                         ;C097C1|A90200  |      ;

CODE_C097C4:
TYX                                  ;C097C4|BB      |      ;
CLC                                  ;C097C5|18      |      ;
ADC.W $0000,X                        ;C097C6|7D0000  |810000;
STA.W $0000,X                        ;C097C9|9D0000  |810000;
RTS                                  ;C097CC|60      |      ;

CODE_C097CD:
LDA.W buttons_pressed                          ;C097CD|AD2203  |810322;
BIT.W #$0400                         ;C097D0|890004  |      ;
BNE CODE_C097D6                      ;C097D3|D001    |C097D6;
RTS                                  ;C097D5|60      |      ;

CODE_C097D6:
TXY                                  ;C097D6|9B      |      ;
LDA.W $0000,X                        ;C097D7|BD0000  |810000;
AND.W #$000F                         ;C097DA|290F00  |      ;
BEQ CODE_C09803                      ;C097DD|F024    |C09803;
LDA.W $0000,X                        ;C097DF|BD0000  |810000;
STA.B $16                            ;C097E2|8516    |000016;
LDA.W $0002,X                        ;C097E4|BD0200  |810002;
STA.B $18                            ;C097E7|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C097E9|22E08183|8381E0;
LDA.L passable_map,X                      ;C097ED|BF00807F|7F8000;
AND.W #$00F3                         ;C097F1|29F300  |      ;
BEQ CODE_C09805                      ;C097F4|F00F    |C09805;
JSL.L CODE_C38242                    ;C097F6|22428283|838242;
LDA.L passable_map,X                      ;C097FA|BF00807F|7F8000;
AND.W #$00F3                         ;C097FE|29F300  |      ;
BEQ CODE_C0980A                      ;C09801|F007    |C0980A;

CODE_C09803:
TYX                                  ;C09803|BB      |      ;
RTS                                  ;C09804|60      |      ;

CODE_C09805:
LDA.W #$FFFE                         ;C09805|A9FEFF  |      ;
BRA CODE_C0980D                      ;C09808|8003    |C0980D;

CODE_C0980A:
LDA.W #$0002                         ;C0980A|A90200  |      ;

CODE_C0980D:
TYX                                  ;C0980D|BB      |      ;
CLC                                  ;C0980E|18      |      ;
ADC.W $0000,X                        ;C0980F|7D0000  |810000;
STA.W $0000,X                        ;C09812|9D0000  |810000;
RTS                                  ;C09815|60      |      ;

CODE_C09816:
LDA.W buttons_pressed                          ;C09816|AD2203  |810322;
BIT.W #$0100                         ;C09819|890001  |      ;
BNE CODE_C0981F                      ;C0981C|D001    |C0981F;
RTS                                  ;C0981E|60      |      ;

CODE_C0981F:
TXY                                  ;C0981F|9B      |      ;
LDA.W $0002,X                        ;C09820|BD0200  |810002;
AND.W #$000F                         ;C09823|290F00  |      ;
BEQ CODE_C09857                      ;C09826|F02F    |C09857;
LDA.W $0000,X                        ;C09828|BD0000  |810000;
CLC                                  ;C0982B|18      |      ;
ADC.W #$0010                         ;C0982C|691000  |      ;
STA.B $16                            ;C0982F|8516    |000016;
LDA.W $0002,X                        ;C09831|BD0200  |810002;
AND.W #$FFF0                         ;C09834|29F0FF  |      ;
SEC                                  ;C09837|38      |      ;
SBC.W #$0010                         ;C09838|E91000  |      ;
STA.B $18                            ;C0983B|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C0983D|22E08183|8381E0;
LDA.L passable_map,X                      ;C09841|BF00807F|7F8000;
AND.W #$00F5                         ;C09845|29F500  |      ;
BEQ CODE_C09859                      ;C09848|F00F    |C09859;
JSL.L CODE_C38259                    ;C0984A|22598283|838259;
LDA.L passable_map,X                      ;C0984E|BF00807F|7F8000;
AND.W #$00F5                         ;C09852|29F500  |      ;
BEQ CODE_C0985E                      ;C09855|F007    |C0985E;

CODE_C09857:
TYX                                  ;C09857|BB      |      ;
RTS                                  ;C09858|60      |      ;

CODE_C09859:
LDA.W #$FFFE                         ;C09859|A9FEFF  |      ;
BRA CODE_C09861                      ;C0985C|8003    |C09861;

CODE_C0985E:
LDA.W #$0002                         ;C0985E|A90200  |      ;

CODE_C09861:
TYX                                  ;C09861|BB      |      ;
CLC                                  ;C09862|18      |      ;
ADC.W $0002,X                        ;C09863|7D0200  |810002;
STA.W $0002,X                        ;C09866|9D0200  |810002;
RTS                                  ;C09869|60      |      ;

CODE_C0986A:
LDA.W buttons_pressed                          ;C0986A|AD2203  |810322;
BIT.W #$0200                         ;C0986D|890002  |      ;
BNE CODE_C09873                      ;C09870|D001    |C09873;
RTS                                  ;C09872|60      |      ;

CODE_C09873:
TXY                                  ;C09873|9B      |      ;
LDA.W $0002,X                        ;C09874|BD0200  |810002;
AND.W #$000F                         ;C09877|290F00  |      ;
BEQ CODE_C098AB                      ;C0987A|F02F    |C098AB;
LDA.W $0000,X                        ;C0987C|BD0000  |810000;
SEC                                  ;C0987F|38      |      ;
SBC.W #$0010                         ;C09880|E91000  |      ;
STA.B $16                            ;C09883|8516    |000016;
LDA.W $0002,X                        ;C09885|BD0200  |810002;
AND.W #$FFF0                         ;C09888|29F0FF  |      ;
SEC                                  ;C0988B|38      |      ;
SBC.W #$0010                         ;C0988C|E91000  |      ;
STA.B $18                            ;C0988F|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C09891|22E08183|8381E0;
LDA.L passable_map,X                      ;C09895|BF00807F|7F8000;
AND.W #$00FA                         ;C09899|29FA00  |      ;
BEQ CODE_C098AD                      ;C0989C|F00F    |C098AD;
JSL.L CODE_C38259                    ;C0989E|22598283|838259;
LDA.L passable_map,X                      ;C098A2|BF00807F|7F8000;
AND.W #$00FA                         ;C098A6|29FA00  |      ;
BEQ CODE_C098B2                      ;C098A9|F007    |C098B2;

CODE_C098AB:
TYX                                  ;C098AB|BB      |      ;
RTS                                  ;C098AC|60      |      ;

CODE_C098AD:
LDA.W #$FFFE                         ;C098AD|A9FEFF  |      ;
BRA CODE_C098B5                      ;C098B0|8003    |C098B5;

CODE_C098B2:
LDA.W #$0002                         ;C098B2|A90200  |      ;

CODE_C098B5:
TYX                                  ;C098B5|BB      |      ;
CLC                                  ;C098B6|18      |      ;
ADC.W $0002,X                        ;C098B7|7D0200  |810002;
STA.W $0002,X                        ;C098BA|9D0200  |810002;
RTS                                  ;C098BD|60      |      ;

CODE_C098BE:
LDY.W $001E,X                        ;C098BE|BC1E00  |81001E;
CPY.W #$002C                         ;C098C1|C02C00  |      ;
BCS UNREACH_C098CB                   ;C098C4|B005    |C098CB;
LDA.W UNREACH_81FAAB,Y               ;C098C6|B9ABFA  |81FAAB;
CLC                                  ;C098C9|18      |      ;
RTS                                  ;C098CA|60      |      ;

UNREACH_C098CB:
db $38,$60                           ;C098CB|        |      ;

CODE_C098CD:
PHX                                  ;C098CD|DA      |      ;
PHA                                  ;C098CE|48      |      ;
LDY.W _039E                          ;C098CF|AC9E03  |81039E;
LDA.W $001E,Y                        ;C098D2|B91E00  |81001E;
CMP.W #$0004                         ;C098D5|C90400  |      ;
BCS CODE_C09914                      ;C098D8|B03A    |C09914;
STA.B $00                            ;C098DA|8500    |000000;
LDA.W $0000,Y                        ;C098DC|B90000  |810000;
CLC                                  ;C098DF|18      |      ;
ADC.W #$0008                         ;C098E0|690800  |      ;
STA.B $16                            ;C098E3|8516    |000016;
LDA.W $0002,Y                        ;C098E5|B90200  |810002;
CLC                                  ;C098E8|18      |      ;
ADC.W #$0008                         ;C098E9|690800  |      ;
STA.B $18                            ;C098EC|8518    |000018;
LDA.W $06B2                          ;C098EE|ADB206  |8106B2;
BRA CODE_C098F6                      ;C098F1|8003    |C098F6;

CODE_C098F3:
LDA.W $003E,X                        ;C098F3|BD3E00  |81003E;

CODE_C098F6:
TAX                                  ;C098F6|AA      |      ;
BEQ CODE_C09914                      ;C098F7|F01B    |C09914;
LDA.W $0016,X                        ;C098F9|BD1600  |810016;
BMI CODE_C098F3                      ;C098FC|30F5    |C098F3;
BIT.W #$4000                         ;C098FE|890040  |      ;
BEQ CODE_C098F3                      ;C09901|F0F0    |C098F3;
LDA.W $001E,X                        ;C09903|BD1E00  |81001E;
SEC                                  ;C09906|38      |      ;
SBC.W #$0004                         ;C09907|E90400  |      ;
CMP.W #$0003                         ;C0990A|C90300  |      ;
BCS CODE_C098F3                      ;C0990D|B0E4    |C098F3;
JSR.W CODE_C09917                    ;C0990F|201799  |C09917;
BRA CODE_C098F3                      ;C09912|80DF    |C098F3;

CODE_C09914:
PLA                                  ;C09914|68      |      ;
PLX                                  ;C09915|FA      |      ;
RTS                                  ;C09916|60      |      ;

CODE_C09917:
LDA.B $00                            ;C09917|A500    |000000;
BEQ CODE_C0994F                      ;C09919|F034    |C0994F;
DEC A                                ;C0991B|3A      |      ;
BEQ CODE_C09924                      ;C0991C|F006    |C09924;
DEC A                                ;C0991E|3A      |      ;
BEQ CODE_C0997A                      ;C0991F|F059    |C0997A;
BRL CODE_C099A5                      ;C09921|828100  |C099A5;

CODE_C09924:
LDA.W $0002,X                        ;C09924|BD0200  |810002;
CMP.B $18                            ;C09927|C518    |000018;
BCC CODE_C0992C                      ;C09929|9001    |C0992C;
RTS                                  ;C0992B|60      |      ;

CODE_C0992C:
LDA.B $16                            ;C0992C|A516    |000016;
SEC                                  ;C0992E|38      |      ;
SBC.W $0000,X                        ;C0992F|FD0000  |810000;
CMP.W #$0011                         ;C09932|C91100  |      ;
BCC CODE_C09938                      ;C09935|9001    |C09938;
RTS                                  ;C09937|60      |      ;

CODE_C09938:
LDA.W $001E,X                        ;C09938|BD1E00  |81001E;
CMP.W #$0006                         ;C0993B|C90600  |      ;
BEQ CODE_C0994B                      ;C0993E|F00B    |C0994B;
CMP.W #$0005                         ;C09940|C90500  |      ;
BEQ CODE_C09948                      ;C09943|F003    |C09948;
INC.W $0002,X                        ;C09945|FE0200  |810002;

CODE_C09948:
INC.W $0002,X                        ;C09948|FE0200  |810002;

CODE_C0994B:
INC.W $0002,X                        ;C0994B|FE0200  |810002;
RTS                                  ;C0994E|60      |      ;

CODE_C0994F:
LDA.W $0002,X                        ;C0994F|BD0200  |810002;
CMP.B $18                            ;C09952|C518    |000018;
BCS CODE_C09957                      ;C09954|B001    |C09957;
RTS                                  ;C09956|60      |      ;

CODE_C09957:
LDA.B $16                            ;C09957|A516    |000016;
SEC                                  ;C09959|38      |      ;
SBC.W $0000,X                        ;C0995A|FD0000  |810000;
CMP.W #$0011                         ;C0995D|C91100  |      ;
BCC CODE_C09963                      ;C09960|9001    |C09963;
RTS                                  ;C09962|60      |      ;

CODE_C09963:
LDA.W $001E,X                        ;C09963|BD1E00  |81001E;
CMP.W #$0006                         ;C09966|C90600  |      ;
BEQ CODE_C09976                      ;C09969|F00B    |C09976;
CMP.W #$0005                         ;C0996B|C90500  |      ;
BEQ CODE_C09973                      ;C0996E|F003    |C09973;
DEC.W $0002,X                        ;C09970|DE0200  |810002;

CODE_C09973:
DEC.W $0002,X                        ;C09973|DE0200  |810002;

CODE_C09976:
DEC.W $0002,X                        ;C09976|DE0200  |810002;
RTS                                  ;C09979|60      |      ;

CODE_C0997A:
LDA.W $0000,X                        ;C0997A|BD0000  |810000;
CMP.B $16                            ;C0997D|C516    |000016;
BCC CODE_C09982                      ;C0997F|9001    |C09982;
RTS                                  ;C09981|60      |      ;

CODE_C09982:
LDA.B $18                            ;C09982|A518    |000018;
SEC                                  ;C09984|38      |      ;
SBC.W $0002,X                        ;C09985|FD0200  |810002;
CMP.W #$0011                         ;C09988|C91100  |      ;
BCC CODE_C0998E                      ;C0998B|9001    |C0998E;
RTS                                  ;C0998D|60      |      ;

CODE_C0998E:
LDA.W $001E,X                        ;C0998E|BD1E00  |81001E;
CMP.W #$0006                         ;C09991|C90600  |      ;
BEQ CODE_C099A1                      ;C09994|F00B    |C099A1;
CMP.W #$0005                         ;C09996|C90500  |      ;
BEQ CODE_C0999E                      ;C09999|F003    |C0999E;
INC.W $0000,X                        ;C0999B|FE0000  |810000;

CODE_C0999E:
INC.W $0000,X                        ;C0999E|FE0000  |810000;

CODE_C099A1:
INC.W $0000,X                        ;C099A1|FE0000  |810000;
RTS                                  ;C099A4|60      |      ;

CODE_C099A5:
LDA.W $0000,X                        ;C099A5|BD0000  |810000;
CMP.B $16                            ;C099A8|C516    |000016;
BCS CODE_C099AD                      ;C099AA|B001    |C099AD;
RTS                                  ;C099AC|60      |      ;

CODE_C099AD:
LDA.B $18                            ;C099AD|A518    |000018;
SEC                                  ;C099AF|38      |      ;
SBC.W $0002,X                        ;C099B0|FD0200  |810002;
CMP.W #$0011                         ;C099B3|C91100  |      ;
BCC CODE_C099B9                      ;C099B6|9001    |C099B9;
RTS                                  ;C099B8|60      |      ;

CODE_C099B9:
LDA.W $001E,X                        ;C099B9|BD1E00  |81001E;
CMP.W #$0006                         ;C099BC|C90600  |      ;
BEQ CODE_C099CC                      ;C099BF|F00B    |C099CC;
CMP.W #$0005                         ;C099C1|C90500  |      ;
BEQ CODE_C099C9                      ;C099C4|F003    |C099C9;
DEC.W $0000,X                        ;C099C6|DE0000  |810000;

CODE_C099C9:
DEC.W $0000,X                        ;C099C9|DE0000  |810000;

CODE_C099CC:
DEC.W $0000,X                        ;C099CC|DE0000  |810000;
RTS                                  ;C099CF|60      |      ;

CODE_C099D0:
COP #$91                             ;C099D0|0291    |      ;
LDA.W TeleportPos.facing                          ;C099D2|AD8003  |810380;
BEQ CODE_C099D8                      ;C099D5|F001    |C099D8;
RTL                                  ;C099D7|6B      |      ;

CODE_C099D8:
PHX                                  ;C099D8|DA      |      ;
LDA.W revealing_lair_id                          ;C099D9|AD0704  |810407;
ASL                                  ;C099DC|0A      |      ;
TAX                                  ;C099DD|AA      |      ;
LDA.L _7F0483, X                      ;C099DE|BF83047F|7F0483;
PLX                                  ;C099E2|FA      |      ;
TAY                                  ;C099E3|A8      |      ;
BNE CODE_C099E7                      ;C099E4|D001    |C099E7;
RTL                                  ;C099E6|6B      |      ;

CODE_C099E7:
LDA.W $0000,X                        ;C099E7|BD0000  |810000;
SEC                                  ;C099EA|38      |      ;
SBC.W $0000,Y                        ;C099EB|F90000  |810000;
BMI CODE_C09A0F                      ;C099EE|301F    |C09A0F;
STA.B $16                            ;C099F0|8516    |000016;
LDA.W $0002,X                        ;C099F2|BD0200  |810002;
SEC                                  ;C099F5|38      |      ;
SBC.W $0002,Y                        ;C099F6|F90200  |810002;
BMI UNREACH_C09A03                   ;C099F9|3008    |C09A03;
STA.B $18                            ;C099FB|8518    |000018;
CMP.B $16                            ;C099FD|C516    |000016;
BCS CODE_C09A3C                      ;C099FF|B03B    |C09A3C;
BRA CODE_C09A37                      ;C09A01|8034    |C09A37;

UNREACH_C09A03:
db $49,$FF,$FF,$1A,$85,$18,$C5,$16   ;C09A03|        |      ;
db $B0,$25,$80,$28                   ;C09A0B|        |C09A32;

CODE_C09A0F:
EOR.W #$FFFF                         ;C09A0F|49FFFF  |      ;
INC A                                ;C09A12|1A      |      ;
STA.B $16                            ;C09A13|8516    |000016;
LDA.W $0002,X                        ;C09A15|BD0200  |810002;
SEC                                  ;C09A18|38      |      ;
SBC.W $0002,Y                        ;C09A19|F90200  |810002;
BMI UNREACH_C09A26                   ;C09A1C|3008    |C09A26;
STA.B $18                            ;C09A1E|8518    |000018;
CMP.B $16                            ;C09A20|C516    |000016;
BCS CODE_C09A3C                      ;C09A22|B018    |C09A3C;
BRA CODE_C09A41                      ;C09A24|801B    |C09A41;

UNREACH_C09A26:
db $49,$FF,$FF,$1A,$85,$18,$C5,$16   ;C09A26|        |      ;
db $B0,$02,$80,$0F,$A9,$00,$00,$80   ;C09A2E|        |C09A32;
db $0D                               ;C09A36|        |0002A9;

CODE_C09A37:
LDA.W #$0002                         ;C09A37|A90200  |      ;
BRA CODE_C09A44                      ;C09A3A|8008    |C09A44;

CODE_C09A3C:
LDA.W #$0001                         ;C09A3C|A90100  |      ;
BRA CODE_C09A44                      ;C09A3F|8003    |C09A44;

CODE_C09A41:
LDA.W #$0003                         ;C09A41|A90300  |      ;

CODE_C09A44:
STA.W $001E,X                        ;C09A44|9D1E00  |81001E;
STZ.W $0020,X                        ;C09A47|9E2000  |810020;
JSL.L CODE_C0891F                    ;C09A4A|221F8980|80891F;
STZ.W $0014,X                        ;C09A4E|9E1400  |810014;
COP #$91                             ;C09A51|0291    |      ;
RTL                                  ;C09A53|6B      |      ;

CODE_C09A54:
STX.W _039E                          ;C09A54|8E9E03  |81039E;
COP #$A9                             ;C09A57|02A9    |      ;
db $00,$30,$7F                       ;C09A59|        |      ;
COP #$84                             ;C09A5C|0284    |      ;
db $8E,$AF,$80                       ;C09A5E|        |0080AF;
LDA.W lair_reveal_in_progress                          ;C09A61|ADFD03  |8103FD;
BEQ CODE_C09A69                      ;C09A64|F003    |C09A69;
BRL CODE_C099D0                      ;C09A66|8267FF  |C099D0;

CODE_C09A69:
COP #$84                             ;C09A69|0284    |      ;
db $0C,$A0,$80                       ;C09A6B|        |0080A0;
LDA.W $0016,Y                        ;C09A6E|B91600  |810016;
AND.W #$CF7F                         ;C09A71|297FCF  |      ;
ORA.W #$0310                         ;C09A74|091003  |      ;
STA.W $0016,Y                        ;C09A77|991600  |810016;
STY.W $03A2                          ;C09A7A|8CA203  |8103A2;
COP #$84                             ;C09A7D|0284    |      ;
db $3E,$95,$80                       ;C09A7F|        |008095;
COP #$85                             ;C09A82|0285    |      ;
db $0C,$96,$80                       ;C09A84|        |008096;
COP #$85                             ;C09A87|0285    |      ;
db $FB,$9F,$80                       ;C09A89|        |      ;
STY.W $03A0                          ;C09A8C|8CA003  |8103A0;
COP #$91                             ;C09A8F|0291    |      ;

CODE_C09A91:
LDA.W $0016,X                        ;C09A91|BD1600  |810016;
BIT.W #$0400                         ;C09A94|890004  |      ;
BEQ CODE_C09A9C                      ;C09A97|F003    |C09A9C;
BRL CODE_C09EFF                      ;C09A99|826304  |C09EFF;

CODE_C09A9C:
LDA.W $0445                          ;C09A9C|AD4504  |810445;
BNE CODE_C09AA6                      ;C09A9F|D005    |C09AA6;
LDA.W Equipment.sword                          ;C09AA1|AD5E1B  |811B5E;
BNE CODE_C09AF9                      ;C09AA4|D053    |C09AF9;

CODE_C09AA6:
LDA.W buttons_pressed                          ;C09AA6|AD2203  |810322;
BIT.W #$0030                         ;C09AA9|893000  |      ;
BNE CODE_C09ACA                      ;C09AAC|D01C    |C09ACA;
EOR.W #$FFFF                         ;C09AAE|49FFFF  |      ;
XBA                                  ;C09AB1|EB      |      ;
LSR A                                ;C09AB2|4A      |      ;
BCS CODE_C09AB8                      ;C09AB3|B003    |C09AB8;
BRL CODE_C09E39                      ;C09AB5|828103  |C09E39;

CODE_C09AB8:
LSR A                                ;C09AB8|4A      |      ;
BCS CODE_C09ABE                      ;C09AB9|B003    |C09ABE;
BRL CODE_C09E1B                      ;C09ABB|825D03  |C09E1B;

CODE_C09ABE:
LSR A                                ;C09ABE|4A      |      ;
BCS CODE_C09AC4                      ;C09ABF|B003    |C09AC4;
BRL CODE_C09DFD                      ;C09AC1|823903  |C09DFD;

CODE_C09AC4:
LSR A                                ;C09AC4|4A      |      ;
BCS CODE_C09ACA                      ;C09AC5|B003    |C09ACA;
BRL CODE_C09DDF                      ;C09AC7|821503  |C09DDF;

CODE_C09ACA:
PHX                                  ;C09ACA|DA      |      ;
LDA.W $001E,X                        ;C09ACB|BD1E00  |81001E;
ASL A                                ;C09ACE|0A      |      ;
CLC                                  ;C09ACF|18      |      ;
ADC.W $001E,X                        ;C09AD0|7D1E00  |81001E;
ASL A                                ;C09AD3|0A      |      ;
ASL A                                ;C09AD4|0A      |      ;
TAX                                  ;C09AD5|AA      |      ;
LDA.W buttons_pressed                          ;C09AD6|AD2203  |810322;
INX                                  ;C09AD9|E8      |      ;
INX                                  ;C09ADA|E8      |      ;
XBA                                  ;C09ADB|EB      |      ;
LSR A                                ;C09ADC|4A      |      ;
BCS CODE_C09AF0                      ;C09ADD|B011    |C09AF0;
INX                                  ;C09ADF|E8      |      ;
INX                                  ;C09AE0|E8      |      ;
LSR A                                ;C09AE1|4A      |      ;
BCS CODE_C09AF0                      ;C09AE2|B00C    |C09AF0;
INX                                  ;C09AE4|E8      |      ;
INX                                  ;C09AE5|E8      |      ;
LSR A                                ;C09AE6|4A      |      ;
BCS CODE_C09AF0                      ;C09AE7|B007    |C09AF0;
INX                                  ;C09AE9|E8      |      ;
INX                                  ;C09AEA|E8      |      ;
LSR A                                ;C09AEB|4A      |      ;
BCS CODE_C09AF0                      ;C09AEC|B002    |C09AF0;
INX                                  ;C09AEE|E8      |      ;
INX                                  ;C09AEF|E8      |      ;

CODE_C09AF0:
LDA.L TABLE_C09B57,X               ;C09AF0|BF579B80|809B57;
PLX                                  ;C09AF4|FA      |      ;
DEC A                                ;C09AF5|3A      |      ;
PHA                                  ;C09AF6|48      |      ;
CLC                                  ;C09AF7|18      |      ;
RTS                                  ;C09AF8|60      |      ;

CODE_C09AF9:
LDA.W buttons_pressed                          ;C09AF9|AD2203  |810322;
BIT.W #$8030                         ;C09AFC|893080  |      ;
BNE CODE_C09B1A                      ;C09AFF|D019    |C09B1A;
XBA                                  ;C09B01|EB      |      ;
LSR A                                ;C09B02|4A      |      ;
BCC CODE_C09B08                      ;C09B03|9003    |C09B08;
BRL CODE_C09E39                      ;C09B05|823103  |C09E39;

CODE_C09B08:
LSR A                                ;C09B08|4A      |      ;
BCC CODE_C09B0E                      ;C09B09|9003    |C09B0E;
BRL CODE_C09E1B                      ;C09B0B|820D03  |C09E1B;

CODE_C09B0E:
LSR A                                ;C09B0E|4A      |      ;
BCC CODE_C09B14                      ;C09B0F|9003    |C09B14;
BRL CODE_C09DFD                      ;C09B11|82E902  |C09DFD;

CODE_C09B14:
LSR A                                ;C09B14|4A      |      ;
BCC CODE_C09B1A                      ;C09B15|9003    |C09B1A;
BRL CODE_C09DDF                      ;C09B17|82C502  |C09DDF;

CODE_C09B1A:
PHX                                  ;C09B1A|DA      |      ;
LDA.W $001E,X                        ;C09B1B|BD1E00  |81001E;
ASL A                                ;C09B1E|0A      |      ;
CLC                                  ;C09B1F|18      |      ;
ADC.W $001E,X                        ;C09B20|7D1E00  |81001E;
ASL A                                ;C09B23|0A      |      ;
ASL A                                ;C09B24|0A      |      ;
TAX                                  ;C09B25|AA      |      ;
LDA.W buttons_pressed                          ;C09B26|AD2203  |810322;
BIT.W #$8000                         ;C09B29|890080  |      ;
BNE CODE_C09B45                      ;C09B2C|D017    |C09B45;
INX                                  ;C09B2E|E8      |      ;
INX                                  ;C09B2F|E8      |      ;
XBA                                  ;C09B30|EB      |      ;
LSR A                                ;C09B31|4A      |      ;
BCS CODE_C09B45                      ;C09B32|B011    |C09B45;
INX                                  ;C09B34|E8      |      ;
INX                                  ;C09B35|E8      |      ;
LSR A                                ;C09B36|4A      |      ;
BCS CODE_C09B45                      ;C09B37|B00C    |C09B45;
INX                                  ;C09B39|E8      |      ;
INX                                  ;C09B3A|E8      |      ;
LSR A                                ;C09B3B|4A      |      ;
BCS CODE_C09B45                      ;C09B3C|B007    |C09B45;
INX                                  ;C09B3E|E8      |      ;
INX                                  ;C09B3F|E8      |      ;
LSR A                                ;C09B40|4A      |      ;
BCS CODE_C09B45                      ;C09B41|B002    |C09B45;
INX                                  ;C09B43|E8      |      ;
INX                                  ;C09B44|E8      |      ;

CODE_C09B45:
CLC                                  ;C09B45|18      |      ;
LDA.W buttons_pressed                          ;C09B46|AD2203  |810322;
BIT.W #$0030                         ;C09B49|893000  |      ;
BNE CODE_C09B4F                      ;C09B4C|D001    |C09B4F;
SEC                                  ;C09B4E|38      |      ;

CODE_C09B4F:
LDA.L TABLE_C09B57,X               ;C09B4F|BF579B80|809B57;
PLX                                  ;C09B53|FA      |      ;
DEC A                                ;C09B54|3A      |      ;
PHA                                  ;C09B55|48      |      ;
RTS                                  ;C09B56|60      |      ;

TABLE_C09B57:
db $47,$9F,$E3,$9E,$B9,$9E,$FD,$9D   ;C09B57|        |00009F;
db $57,$9E,$85,$9D,$27,$9F,$D5,$9E   ;C09B5F|        |00009E;
db $AB,$9E,$81,$9E,$DF,$9D,$67,$9D   ;C09B67|        |      ;
db $67,$9F,$F1,$9E,$1B,$9E,$8F,$9E   ;C09B6F|        |00009F;
db $65,$9E,$A3,$9D,$87,$9F,$39,$9E   ;C09B77|        |00009E;
db $C7,$9E,$9D,$9E,$73,$9E,$C1,$9D   ;C09B7F|        |00009E;
db $47,$9F,$E3,$9E,$B9,$9E,$FD,$9D   ;C09B87|        |00009F;
db $57,$9E,$85,$9D,$47,$9F,$E3,$9E   ;C09B8F|        |00009E;
db $B9,$9E,$FD,$9D,$57,$9E,$85,$9D   ;C09B97|        |00FD9E;
db $27,$9F,$D5,$9E,$AB,$9E,$81,$9E   ;C09B9F|        |00009F;
db $DF,$9D,$67,$9D,$27,$9F,$D5,$9E   ;C09BA7|        |9D679D;
db $AB,$9E,$81,$9E,$DF,$9D,$67,$9D   ;C09BAF|        |      ;
db $67,$9F,$F1,$9E,$1B,$9E,$8F,$9E   ;C09BB7|        |00009F;
db $65,$9E,$A3,$9D,$67,$9F,$F1,$9E   ;C09BBF|        |00009E;
db $1B,$9E,$8F,$9E,$65,$9E,$A3,$9D   ;C09BC7|        |      ;
db $87,$9F,$39,$9E,$C7,$9E,$9D,$9E   ;C09BCF|        |00009F;
db $73,$9E,$C1,$9D,$87,$9F,$39,$9E   ;C09BD7|        |00009E;
db $C7,$9E,$9D,$9E,$73,$9E,$C1,$9D   ;C09BDF|        |00009E;
db $47,$9F,$E3,$9E,$B9,$9E,$FD,$9D   ;C09BE7|        |00009F;
db $57,$9E,$85,$9D,$47,$9F,$E3,$9E   ;C09BEF|        |00009E;
db $B9,$9E,$FD,$9D,$57,$9E,$85,$9D   ;C09BF7|        |00FD9E;
db $27,$9F,$D5,$9E,$AB,$9E,$81,$9E   ;C09BFF|        |00009F;
db $DF,$9D,$67,$9D,$27,$9F,$D5,$9E   ;C09C07|        |9D679D;
db $AB,$9E,$81,$9E,$DF,$9D,$67,$9D   ;C09C0F|        |      ;
db $67,$9F,$F1,$9E,$1B,$9E,$8F,$9E   ;C09C17|        |00009F;
db $65,$9E,$A3,$9D,$67,$9F,$F1,$9E   ;C09C1F|        |00009E;
db $1B,$9E,$8F,$9E,$65,$9E,$A3,$9D   ;C09C27|        |      ;
db $87,$9F,$39,$9E,$C7,$9E,$9D,$9E   ;C09C2F|        |00009F;
db $73,$9E,$C1,$9D,$87,$9F,$39,$9E   ;C09C37|        |00009E;
db $C7,$9E,$9D,$9E,$73,$9E,$C1,$9D   ;C09C3F|        |00009E;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C47|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C4F|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C57|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C5F|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C67|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C6F|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C77|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C7F|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C87|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C8F|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C97|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09C9F|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09CA7|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09CAF|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09CB7|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09CBF|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09CC7|        |00009D;
db $67,$9D,$67,$9D,$67,$9D,$67,$9D   ;C09CCF|        |00009D;
db $47,$9F,$E3,$9E,$B9,$9E,$FD,$9D   ;C09CD7|        |00009F;
db $57,$9E,$85,$9D,$27,$9F,$D5,$9E   ;C09CDF|        |00009E;
db $AB,$9E,$81,$9E,$DF,$9D,$67,$9D   ;C09CE7|        |      ;
db $67,$9F,$F1,$9E,$1B,$9E,$8F,$9E   ;C09CEF|        |00009F;
db $65,$9E,$A3,$9D,$87,$9F,$39,$9E   ;C09CF7|        |00009E;
db $C7,$9E,$9D,$9E,$73,$9E,$C1,$9D   ;C09CFF|        |00009E;
db $87,$9F,$39,$9E,$C7,$9E,$9D,$9E   ;C09D07|        |00009F;
db $73,$9E,$C1,$9D,$87,$9F,$39,$9E   ;C09D0F|        |00009E;
db $C7,$9E,$9D,$9E,$73,$9E,$C1,$9D   ;C09D17|        |00009E;
db $67,$9F,$F1,$9E,$1B,$9E,$8F,$9E   ;C09D1F|        |00009F;
db $65,$9E,$A3,$9D,$67,$9F,$F1,$9E   ;C09D27|        |00009E;
db $1B,$9E,$8F,$9E,$65,$9E,$A3,$9D   ;C09D2F|        |      ;
db $47,$9F,$E3,$9E,$B9,$9E,$FD,$9D   ;C09D37|        |00009F;
db $57,$9E,$85,$9D,$47,$9F,$E3,$9E   ;C09D3F|        |00009E;
db $B9,$9E,$FD,$9D,$57,$9E,$85,$9D   ;C09D47|        |00FD9E;
db $27,$9F,$D5,$9E,$AB,$9E,$81,$9E   ;C09D4F|        |00009F;
db $DF,$9D,$67,$9D,$27,$9F,$D5,$9E   ;C09D57|        |9D679D;
db $AB,$9E,$81,$9E,$DF,$9D,$67,$9D   ;C09D5F|        |      ;
BCS CODE_C09D77                      ;C09D67|B00E    |C09D77;
LDA.W #$0001                         ;C09D69|A90100  |      ;
JSR.W CODE_C09FC9                    ;C09D6C|20C99F  |C09FC9;
%CopPlayAnimation(1)
%Cop82()
BRL CODE_C09A91                      ;C09D74|821AFD  |C09A91;

CODE_C09D77:
LDA.W #$002B                         ;C09D77|A92B00  |      ;
JSR.W CODE_C09FC9                    ;C09D7A|20C99F  |C09FC9;
COP #$80                             ;C09D7D|0280    |      ;
db $2B                               ;C09D7F|        |      ;
COP #$82                             ;C09D80|0282    |      ;
BRL CODE_C09A91                      ;C09D82|820CFD  |C09A91;
BCS CODE_C09D95                      ;C09D85|B00E    |C09D95;
LDA.W #$0000                         ;C09D87|A90000  |      ;
JSR.W CODE_C09FC9                    ;C09D8A|20C99F  |C09FC9;
COP #$80                             ;C09D8D|0280    |      ;
db $00                               ;C09D8F|        |      ;
COP #$82                             ;C09D90|0282    |      ;
BRL CODE_C09A91                      ;C09D92|82FCFC  |C09A91;

CODE_C09D95:
LDA.W #$0029                         ;C09D95|A92900  |      ;
JSR.W CODE_C09FC9                    ;C09D98|20C99F  |C09FC9;
COP #$80                             ;C09D9B|0280    |      ;
db $29                               ;C09D9D|        |      ;
COP #$82                             ;C09D9E|0282    |      ;
BRL CODE_C09A91                      ;C09DA0|82EEFC  |C09A91;
BCS CODE_C09DB3                      ;C09DA3|B00E    |C09DB3;
LDA.W #$0002                         ;C09DA5|A90200  |      ;
JSR.W CODE_C09FC9                    ;C09DA8|20C99F  |C09FC9;
COP #$80                             ;C09DAB|0280    |      ;
db $02                               ;C09DAD|        |      ;
COP #$82                             ;C09DAE|0282    |      ;
BRL CODE_C09A91                      ;C09DB0|82DEFC  |C09A91;

CODE_C09DB3:
LDA.W #$0027                         ;C09DB3|A92700  |      ;
JSR.W CODE_C09FC9                    ;C09DB6|20C99F  |C09FC9;
COP #$80                             ;C09DB9|0280    |      ;
db $27                               ;C09DBB|        |000002;
COP #$82                             ;C09DBC|0282    |      ;
BRL CODE_C09A91                      ;C09DBE|82D0FC  |C09A91;
BCS CODE_C09DD1                      ;C09DC1|B00E    |C09DD1;
LDA.W #$0003                         ;C09DC3|A90300  |      ;
JSR.W CODE_C09FC9                    ;C09DC6|20C99F  |C09FC9;
COP #$80                             ;C09DC9|0280    |      ;
db $03                               ;C09DCB|        |000002;
COP #$82                             ;C09DCC|0282    |      ;
BRL CODE_C09A91                      ;C09DCE|82C0FC  |C09A91;

CODE_C09DD1:
LDA.W #$0024                         ;C09DD1|A92400  |      ;
JSR.W CODE_C09FC9                    ;C09DD4|20C99F  |C09FC9;
COP #$80                             ;C09DD7|0280    |      ;
db $24                               ;C09DD9|        |000002;
COP #$82                             ;C09DDA|0282    |      ;
BRL CODE_C09A91                      ;C09DDC|82B2FC  |C09A91;

CODE_C09DDF:
BCS CODE_C09DEF                      ;C09DDF|B00E    |C09DEF;
LDA.W #$0006                         ;C09DE1|A90600  |      ;
JSR.W CODE_C09FC9                    ;C09DE4|20C99F  |C09FC9;
COP #$80                             ;C09DE7|0280    |      ;
db $06                               ;C09DE9|        |000002;
COP #$82                             ;C09DEA|0282    |      ;
BRL CODE_C09A91                      ;C09DEC|82A2FC  |C09A91;

CODE_C09DEF:
LDA.W #$002A                         ;C09DEF|A92A00  |      ;
JSR.W CODE_C09FC9                    ;C09DF2|20C99F  |C09FC9;
COP #$80                             ;C09DF5|0280    |      ;
db $2A                               ;C09DF7|        |      ;
COP #$82                             ;C09DF8|0282    |      ;
BRL CODE_C09A91                      ;C09DFA|8294FC  |C09A91;

CODE_C09DFD:
BCS CODE_C09E0D                      ;C09DFD|B00E    |C09E0D;
LDA.W #$0004                         ;C09DFF|A90400  |      ;
JSR.W CODE_C09FC9                    ;C09E02|20C99F  |C09FC9;
COP #$80                             ;C09E05|0280    |      ;
db $04                               ;C09E07|        |000002;
COP #$82                             ;C09E08|0282    |      ;
BRL CODE_C09A91                      ;C09E0A|8284FC  |C09A91;

CODE_C09E0D:
LDA.W #$0028                         ;C09E0D|A92800  |      ;
JSR.W CODE_C09FC9                    ;C09E10|20C99F  |C09FC9;
COP #$80                             ;C09E13|0280    |      ;
db $28                               ;C09E15|        |      ;
COP #$82                             ;C09E16|0282    |      ;
BRL CODE_C09A91                      ;C09E18|8276FC  |C09A91;

CODE_C09E1B:
BCS CODE_C09E2B                      ;C09E1B|B00E    |C09E2B;
LDA.W #$0008                         ;C09E1D|A90800  |      ;
JSR.W CODE_C09FC9                    ;C09E20|20C99F  |C09FC9;
COP #$80                             ;C09E23|0280    |      ;
db $08                               ;C09E25|        |      ;
COP #$82                             ;C09E26|0282    |      ;
BRL CODE_C09A91                      ;C09E28|8266FC  |C09A91;

CODE_C09E2B:
LDA.W #$0026                         ;C09E2B|A92600  |      ;
JSR.W CODE_C09FC9                    ;C09E2E|20C99F  |C09FC9;
COP #$80                             ;C09E31|0280    |      ;
db $26                               ;C09E33|        |000002;
COP #$82                             ;C09E34|0282    |      ;
BRL CODE_C09A91                      ;C09E36|8258FC  |C09A91;

CODE_C09E39:
BCS CODE_C09E49                      ;C09E39|B00E    |C09E49;
LDA.W #$000A                         ;C09E3B|A90A00  |      ;
JSR.W CODE_C09FC9                    ;C09E3E|20C99F  |C09FC9;
COP #$80                             ;C09E41|0280    |      ;
db $0A                               ;C09E43|        |      ;
COP #$82                             ;C09E44|0282    |      ;
BRL CODE_C09A91                      ;C09E46|8248FC  |C09A91;

CODE_C09E49:
LDA.W #$0025                         ;C09E49|A92500  |      ;
JSR.W CODE_C09FC9                    ;C09E4C|20C99F  |C09FC9;
COP #$80                             ;C09E4F|0280    |      ;
db $25                               ;C09E51|        |000002;
COP #$82                             ;C09E52|0282    |      ;
BRL CODE_C09A91                      ;C09E54|823AFC  |C09A91;
LDA.W #$0005                         ;C09E57|A90500  |      ;
JSR.W CODE_C09FC9                    ;C09E5A|20C99F  |C09FC9;
COP #$80                             ;C09E5D|0280    |      ;
db $05                               ;C09E5F|        |000002;
COP #$82                             ;C09E60|0282    |      ;
BRL CODE_C09A91                      ;C09E62|822CFC  |C09A91;
LDA.W #$0011                         ;C09E65|A91100  |      ;
JSR.W CODE_C09FC9                    ;C09E68|20C99F  |C09FC9;
COP #$80                             ;C09E6B|0280    |      ;
db $11                               ;C09E6D|        |000002;
COP #$82                             ;C09E6E|0282    |      ;
BRL CODE_C09A91                      ;C09E70|821EFC  |C09A91;
LDA.W #$0012                         ;C09E73|A91200  |      ;
JSR.W CODE_C09FC9                    ;C09E76|20C99F  |C09FC9;
COP #$80                             ;C09E79|0280    |      ;
db $12                               ;C09E7B|        |000002;
COP #$82                             ;C09E7C|0282    |      ;
BRL CODE_C09A91                      ;C09E7E|8210FC  |C09A91;
LDA.W #$0007                         ;C09E81|A90700  |      ;
JSR.W CODE_C09FC9                    ;C09E84|20C99F  |C09FC9;
COP #$80                             ;C09E87|0280    |      ;
db $07                               ;C09E89|        |000002;
COP #$82                             ;C09E8A|0282    |      ;
BRL CODE_C09A91                      ;C09E8C|8202FC  |C09A91;
LDA.W #$0010                         ;C09E8F|A91000  |      ;
JSR.W CODE_C09FC9                    ;C09E92|20C99F  |C09FC9;
COP #$80                             ;C09E95|0280    |      ;
db $10                               ;C09E97|        |C09E9B;
COP #$82                             ;C09E98|0282    |      ;
BRL CODE_C09A91                      ;C09E9A|82F4FB  |C09A91;
LDA.W #$0013                         ;C09E9D|A91300  |      ;
JSR.W CODE_C09FC9                    ;C09EA0|20C99F  |C09FC9;
COP #$80                             ;C09EA3|0280    |      ;
db $13                               ;C09EA5|        |000002;
COP #$82                             ;C09EA6|0282    |      ;
BRL CODE_C09A91                      ;C09EA8|82E6FB  |C09A91;
LDA.W #$000E                         ;C09EAB|A90E00  |      ;
JSR.W CODE_C09FC9                    ;C09EAE|20C99F  |C09FC9;
COP #$80                             ;C09EB1|0280    |      ;
db $0E                               ;C09EB3|        |008202;
COP #$82                             ;C09EB4|0282    |      ;
BRL CODE_C09A91                      ;C09EB6|82D8FB  |C09A91;
LDA.W #$000D                         ;C09EB9|A90D00  |      ;
JSR.W CODE_C09FC9                    ;C09EBC|20C99F  |C09FC9;
COP #$80                             ;C09EBF|0280    |      ;
db $0D                               ;C09EC1|        |008202;
COP #$82                             ;C09EC2|0282    |      ;
BRL CODE_C09A91                      ;C09EC4|82CAFB  |C09A91;
LDA.W #$000B                         ;C09EC7|A90B00  |      ;
JSR.W CODE_C09FC9                    ;C09ECA|20C99F  |C09FC9;
COP #$80                             ;C09ECD|0280    |      ;
db $0B                               ;C09ECF|        |      ;
COP #$82                             ;C09ED0|0282    |      ;
BRL CODE_C09A91                      ;C09ED2|82BCFB  |C09A91;
LDA.W #$000F                         ;C09ED5|A90F00  |      ;
JSR.W CODE_C09FC9                    ;C09ED8|20C99F  |C09FC9;
COP #$80                             ;C09EDB|0280    |      ;
db $0F                               ;C09EDD|        |828202;
COP #$82                             ;C09EDE|0282    |      ;
BRL CODE_C09A91                      ;C09EE0|82AEFB  |C09A91;
LDA.W #$000C                         ;C09EE3|A90C00  |      ;
JSR.W CODE_C09FC9                    ;C09EE6|20C99F  |C09FC9;
COP #$80                             ;C09EE9|0280    |      ;
db $0C                               ;C09EEB|        |008202;
COP #$82                             ;C09EEC|0282    |      ;
BRL CODE_C09A91                      ;C09EEE|82A0FB  |C09A91;
LDA.W #$0009                         ;C09EF1|A90900  |      ;
JSR.W CODE_C09FC9                    ;C09EF4|20C99F  |C09FC9;
COP #$80                             ;C09EF7|0280    |      ;
db $09                               ;C09EF9|        |      ;
COP #$82                             ;C09EFA|0282    |      ;
BRL CODE_C09A91                      ;C09EFC|8292FB  |C09A91;

CODE_C09EFF:
SEP #$20                             ;C09EFF|E220    |      ;
LDA.B #$8B                           ;C09F01|A98B    |      ;
STA.W $0024,X                        ;C09F03|9D2400  |810024;
LDY.W $03A0                          ;C09F06|ACA003  |8103A0;
LDA.B #$8C                           ;C09F09|A98C    |      ;
STA.W $0024,Y                        ;C09F0B|992400  |810024;
REP #$20                             ;C09F0E|C220    |      ;
BRK #$84                             ;C09F10|0084    |      ;
LDA.W #$001C                         ;C09F12|A91C00  |      ;
JSR.W CODE_C09FC9                    ;C09F15|20C99F  |C09FC9;
COP #$80                             ;C09F18|0280    |      ;
db $1C                               ;C09F1A|        |008202;
COP #$82                             ;C09F1B|0282    |      ;
LDA.W _03BC                          ;C09F1D|ADBC03  |8103BC;
INC A                                ;C09F20|1A      |      ;
STA.W sceneId                          ;C09F21|8D1803  |810318;
COP #$91                             ;C09F24|0291    |      ;
RTL                                  ;C09F26|6B      |      ;
BRK #$01                             ;C09F27|0001    |      ;
JSR.W CastPhoenixOnSwing                    ;C09F29|20A79F  |C09FA7;
BCS CODE_C09F33                      ;C09F2C|B005    |C09F33;
db $02,$84,$A4,$A6,$80               ;C09F2E|        |      ;

CODE_C09F33:
LDA.W #$8000                         ;C09F33|A90080  |      ;
TRB.W _032A                          ;C09F36|1C2A03  |81032A;
LDA.W #$0021                         ;C09F39|A92100  |      ;
JSR.W CODE_C09FC9                    ;C09F3C|20C99F  |C09FC9;
COP #$80                             ;C09F3F|0280    |      ;
db $21                               ;C09F41|        |000002;
COP #$82                             ;C09F42|0282    |      ;
BRL CODE_C09A91                      ;C09F44|824AFB  |C09A91;
BRK #$01                             ;C09F47|0001    |      ;
JSR.W CastPhoenixOnSwing                    ;C09F49|20A79F  |C09FA7;
BCS CODE_C09F53                      ;C09F4C|B005    |C09F53;
db $02,$84,$B9,$A6,$80               ;C09F4E|        |      ;

CODE_C09F53:
LDA.W #$8000                         ;C09F53|A90080  |      ;
TRB.W _032A                          ;C09F56|1C2A03  |81032A;
LDA.W #$0020                         ;C09F59|A92000  |      ;
JSR.W CODE_C09FC9                    ;C09F5C|20C99F  |C09FC9;
COP #$80                             ;C09F5F|0280    |      ;
db $20                               ;C09F61|        |C08202;
COP #$82                             ;C09F62|0282    |      ;
BRL CODE_C09A91                      ;C09F64|822AFB  |C09A91;
BRK #$01                             ;C09F67|0001    |      ;
JSR.W CastPhoenixOnSwing                    ;C09F69|20A79F  |C09FA7;
BCS CODE_C09F73                      ;C09F6C|B005    |C09F73;
db $02,$84,$D0,$A6,$80               ;C09F6E|        |      ;

CODE_C09F73:
LDA.W #$8000                         ;C09F73|A90080  |      ;
TRB.W _032A                          ;C09F76|1C2A03  |81032A;
LDA.W #$0022                         ;C09F79|A92200  |      ;
JSR.W CODE_C09FC9                    ;C09F7C|20C99F  |C09FC9;
COP #$80                             ;C09F7F|0280    |      ;
db $22                               ;C09F81|        |828202;
COP #$82                             ;C09F82|0282    |      ;
BRL CODE_C09A91                      ;C09F84|820AFB  |C09A91;
BRK #$01                             ;C09F87|0001    |      ;
JSR.W CastPhoenixOnSwing                    ;C09F89|20A79F  |C09FA7;
BCS CODE_C09F93                      ;C09F8C|B005    |C09F93;
db $02,$84,$E5,$A6,$80               ;C09F8E|        |      ;

CODE_C09F93:
LDA.W #$8000                         ;C09F93|A90080  |      ;
TRB.W _032A                          ;C09F96|1C2A03  |81032A;
LDA.W #$0023                         ;C09F99|A92300  |      ;
JSR.W CODE_C09FC9                    ;C09F9C|20C99F  |C09FC9;
COP #$80                             ;C09F9F|0280    |      ;
db $23                               ;C09FA1|        |000002;
COP #$82                             ;C09FA2|0282    |      ;
BRL CODE_C09A91                      ;C09FA4|82EAFA  |C09A91;

;;; Checks whether all three necessary items are equipped and casts the phoenix
;;;
;;; The necessary items are soulblade, soularmor and phoenix
;;; Clears carry if the cast was successful, else carry is set
CastPhoenixOnSwing:
    LDA.W Equipment.sword
    CMP.W #Items.SoulBlade
    BNE .ret
    LDA.W Equipment.armor
    CMP.W #Items.SoulArmor
    BNE .ret
    LDA.W Equipment.magic
    CMP.W #Items.Phoenix
    BNE .ret
    %CopCastMagic(2, .ret) ; phoenix costs 2 gem
    CLC
    RTS
.ret:
    SEC
    RTS

CODE_C09FC9:
LDY.W $003E,X                        ;C09FC9|BC3E00  |81003E;
STA.W $001E,Y                        ;C09FCC|991E00  |81001E;
SEC                                  ;C09FCF|38      |      ;
SBC.W #$0020                         ;C09FD0|E92000  |      ;
CMP.W #$0004                         ;C09FD3|C90400  |      ;
BCS CODE_C09FE1                      ;C09FD6|B009    |C09FE1;
LDA.W player_strength_from_item                          ;C09FD8|AD701B  |811B70;
CLC                                  ;C09FDB|18      |      ;
ADC.W player_strength_from_level                          ;C09FDC|6D721B  |811B72;
BRA CODE_C09FE4                      ;C09FDF|8003    |C09FE4;

CODE_C09FE1:
LDA.W player_strength_from_item                          ;C09FE1|AD701B  |811B70;

CODE_C09FE4:
STA.W player_total_strength                          ;C09FE4|8D8C1B  |811B8C;
LDA.W player_defense_from_item                          ;C09FE7|AD741B  |811B74;
CLC                                  ;C09FEA|18      |      ;
ADC.W player_defense_from_level                          ;C09FEB|6D761B  |811B76;
STA.W $1B8E                          ;C09FEE|8D8E1B  |811B8E;
LDA.W #$0000                         ;C09FF1|A90000  |      ;
STA.W $0020,Y                        ;C09FF4|992000  |810020;
STA.W $0014,Y                        ;C09FF7|991400  |810014;
RTS                                  ;C09FFA|60      |      ;


LDA.W $0016,X                        ;C09FFB|BD1600  |810016;
AND.W #$CEFF                         ;C09FFE|29FFCE  |      ;
STA.W $0016,X                        ;C0A001|9D1600  |810016;
INC.W $0024,X                        ;C0A004|FE2400  |810024;
COP #$91                             ;C0A007|0291    |      ;
COP #$82                             ;C0A009|0282    |      ;
RTL                                  ;C0A00B|6B      |      ;
LDA.W $0016,X                        ;C0A00C|BD1600  |810016;
ORA.W #$2000                         ;C0A00F|090020  |      ;
STA.W $0016,X                        ;C0A012|9D1600  |810016;
LDA.W lair_reveal_in_progress                          ;C0A015|ADFD03  |8103FD;
BNE UNREACH_C0A03F                   ;C0A018|D025    |C0A03F;
LDA.W $1B82                          ;C0A01A|AD821B  |811B82;
BEQ CODE_C0A042                      ;C0A01D|F023    |C0A042;

CODE_C0A01F:
LDA.W $0016,X                        ;C0A01F|BD1600  |810016;
AND.W #$DFFF                         ;C0A022|29FFDF  |      ;
STA.W $0016,X                        ;C0A025|9D1600  |810016;
COP #$85                             ;C0A028|0285    |      ;
db $52,$A0,$80                       ;C0A02A|        |0000A0;
COP #$A8                             ;C0A02D|02A8    |      ;
db $00,$80,$8E                       ;C0A02F|        |      ;
COP #$A3                             ;C0A032|02A3    |      ;
COP #$A2                             ;C0A034|02A2    |      ;
db $30                               ;C0A036|        |C0A03A;

CODE_C0A037:
COP #$81                             ;C0A037|0281    |      ;
db $08,$10                           ;C0A039|        |      ;
COP #$83                             ;C0A03B|0283    |      ;
BRA CODE_C0A037                      ;C0A03D|80F8    |C0A037;

UNREACH_C0A03F:
db $02,$91,$6B                       ;C0A03F|        |      ;

CODE_C0A042:
COP #$91                             ;C0A042|0291    |      ;
LDA.W $1B82                          ;C0A044|AD821B  |811B82;
BNE CODE_C0A04A                      ;C0A047|D001    |C0A04A;
RTL                                  ;C0A049|6B      |      ;

CODE_C0A04A:
STZ.W $0000,X                        ;C0A04A|9E0000  |810000;
STZ.W $0002,X                        ;C0A04D|9E0200  |810002;
BRA CODE_C0A01F                      ;C0A050|80CD    |C0A01F;
LDA.W $0016,X                        ;C0A052|BD1600  |810016;
ORA.W #$0010                         ;C0A055|091000  |      ;
STA.W $0016,X                        ;C0A058|9D1600  |810016;
COP #$91                             ;C0A05B|0291    |      ;
PHX                                  ;C0A05D|DA      |      ;
JSR.W CODE_C0A136                    ;C0A05E|2036A1  |C0A136;
BCC CODE_C0A066                      ;C0A061|9003    |C0A066;
BRL CODE_C0A134                      ;C0A063|82CE00  |C0A134;

CODE_C0A066:
LDA.W buttons_pressed                          ;C0A066|AD2203  |810322;
LDY.W #$0002                         ;C0A069|A00200  |      ;
BIT.W #$0100                         ;C0A06C|890001  |      ;
BNE CODE_C0A07C                      ;C0A06F|D00B    |C0A07C;
LDY.W #$FFFE                         ;C0A071|A0FEFF  |      ;
BIT.W #$0200                         ;C0A074|890002  |      ;
BNE CODE_C0A07C                      ;C0A077|D003    |C0A07C;
LDY.W #$0000                         ;C0A079|A00000  |      ;

CODE_C0A07C:
STY.B $16                            ;C0A07C|8416    |000016;
LDY.W #$0002                         ;C0A07E|A00200  |      ;
BIT.W #$0400                         ;C0A081|890004  |      ;
BNE CODE_C0A091                      ;C0A084|D00B    |C0A091;
LDY.W #$FFFE                         ;C0A086|A0FEFF  |      ;
BIT.W #$0800                         ;C0A089|890008  |      ;
BNE CODE_C0A091                      ;C0A08C|D003    |C0A091;
LDY.W #$0000                         ;C0A08E|A00000  |      ;

CODE_C0A091:
STY.B $18                            ;C0A091|8418    |000018;
LDA.W PlayerPosReal.x                          ;C0A093|AD7403  |810374;
SEC                                  ;C0A096|38      |      ;
SBC.W $0000,X                        ;C0A097|FD0000  |810000;
BEQ CODE_C0A0B6                      ;C0A09A|F01A    |C0A0B6;
BPL CODE_C0A0AD                      ;C0A09C|100F    |C0A0AD;
EOR.W #$FFFF                         ;C0A09E|49FFFF  |      ;
INC A                                ;C0A0A1|1A      |      ;
DEC.B $16                            ;C0A0A2|C616    |000016;
CMP.W #$0060                         ;C0A0A4|C96000  |      ;
BCC CODE_C0A0B6                      ;C0A0A7|900D    |C0A0B6;
DEC.B $16                            ;C0A0A9|C616    |000016;
BRA CODE_C0A0B6                      ;C0A0AB|8009    |C0A0B6;

CODE_C0A0AD:
INC.B $16                            ;C0A0AD|E616    |000016;
CMP.W #$0050                         ;C0A0AF|C95000  |      ;
BCC CODE_C0A0B6                      ;C0A0B2|9002    |C0A0B6;
INC.B $16                            ;C0A0B4|E616    |000016;

CODE_C0A0B6:
LDA.W $0000,X                        ;C0A0B6|BD0000  |810000;
CLC                                  ;C0A0B9|18      |      ;
ADC.B $16                            ;C0A0BA|6516    |000016;
STA.W $0000,X                        ;C0A0BC|9D0000  |810000;
STA.B $16                            ;C0A0BF|8516    |000016;
LDA.W PlayerPosReal.y                          ;C0A0C1|AD7603  |810376;
SEC                                  ;C0A0C4|38      |      ;
SBC.W $0002,X                        ;C0A0C5|FD0200  |810002;
BEQ CODE_C0A0E4                      ;C0A0C8|F01A    |C0A0E4;
BPL CODE_C0A0DB                      ;C0A0CA|100F    |C0A0DB;
EOR.W #$FFFF                         ;C0A0CC|49FFFF  |      ;
INC A                                ;C0A0CF|1A      |      ;
DEC.B $18                            ;C0A0D0|C618    |000018;
CMP.W #$0040                         ;C0A0D2|C94000  |      ;
BCC CODE_C0A0E4                      ;C0A0D5|900D    |C0A0E4;
DEC.B $18                            ;C0A0D7|C618    |000018;
BRA CODE_C0A0E4                      ;C0A0D9|8009    |C0A0E4;

CODE_C0A0DB:
INC.B $18                            ;C0A0DB|E618    |000018;
CMP.W #$0050                         ;C0A0DD|C95000  |      ;
BCC CODE_C0A0E4                      ;C0A0E0|9002    |C0A0E4;
INC.B $18                            ;C0A0E2|E618    |000018;

CODE_C0A0E4:
LDA.W $0002,X                        ;C0A0E4|BD0200  |810002;
CLC                                  ;C0A0E7|18      |      ;
ADC.B $18                            ;C0A0E8|6518    |000018;
STA.W $0002,X                        ;C0A0EA|9D0200  |810002;
STA.B $18                            ;C0A0ED|8518    |000018;
LDY.W $003C,X                        ;C0A0EF|BC3C00  |81003C;
LDA.W $043D                          ;C0A0F2|AD3D04  |81043D;
ASL A                                ;C0A0F5|0A      |      ;
AND.W #$00FF                         ;C0A0F6|29FF00  |      ;
TAX                                  ;C0A0F9|AA      |      ;
SEP #$20                             ;C0A0FA|E220    |      ;
LDA.B #$00                           ;C0A0FC|A900    |      ;
XBA                                  ;C0A0FE|EB      |      ;
LDA.W SineWave, X               ;C0A0FF|BD84FC  |81FC84;
BPL CODE_C0A10D                      ;C0A102|1009    |C0A10D;
XBA                                  ;C0A104|EB      |      ;
DEC A                                ;C0A105|3A      |      ;
XBA                                  ;C0A106|EB      |      ;
SEC                                  ;C0A107|38      |      ;
ROR A                                ;C0A108|6A      |      ;
SEC                                  ;C0A109|38      |      ;
ROR A                                ;C0A10A|6A      |      ;
BRA CODE_C0A10F                      ;C0A10B|8002    |C0A10F;

CODE_C0A10D:
LSR A                                ;C0A10D|4A      |      ;
LSR A                                ;C0A10E|4A      |      ;

CODE_C0A10F:
REP #$20                             ;C0A10F|C220    |      ;
CLC                                  ;C0A111|18      |      ;
ADC.B $16                            ;C0A112|6516    |000016;
STA.W $0000,Y                        ;C0A114|990000  |810000;
SEP #$20                             ;C0A117|E220    |      ;
LDA.B #$00                           ;C0A119|A900    |      ;
XBA                                  ;C0A11B|EB      |      ;
LDA.W UNREACH_81FCC4,X               ;C0A11C|BDC4FC  |81FCC4;
BPL CODE_C0A12A                      ;C0A11F|1009    |C0A12A;
XBA                                  ;C0A121|EB      |      ;
DEC A                                ;C0A122|3A      |      ;
XBA                                  ;C0A123|EB      |      ;
SEC                                  ;C0A124|38      |      ;
ROR A                                ;C0A125|6A      |      ;
SEC                                  ;C0A126|38      |      ;
ROR A                                ;C0A127|6A      |      ;
BRA CODE_C0A12C                      ;C0A128|8002    |C0A12C;

CODE_C0A12A:
LSR A                                ;C0A12A|4A      |      ;
LSR A                                ;C0A12B|4A      |      ;

CODE_C0A12C:
REP #$20                             ;C0A12C|C220    |      ;
CLC                                  ;C0A12E|18      |      ;
ADC.B $18                            ;C0A12F|6518    |000018;
STA.W $0002,Y                        ;C0A131|990200  |810002;

CODE_C0A134:
PLX                                  ;C0A134|FA      |      ;
RTL                                  ;C0A135|6B      |      ;

CODE_C0A136:
LDA.W $0445                          ;C0A136|AD4504  |810445;
BNE CODE_C0A18F                      ;C0A139|D054    |C0A18F;
LDA.W $03A8                          ;C0A13B|ADA803  |8103A8;
BNE CODE_C0A18F                      ;C0A13E|D04F    |C0A18F;
LDA.W Equipment.magic                          ;C0A140|AD621B  |811B62;
BEQ CODE_C0A18F                      ;C0A143|F04A    |C0A18F;
LDA.B ($4A)                          ;C0A145|B24A    |00004A;
BEQ CODE_C0A18F                      ;C0A147|F046    |C0A18F;
LDA.W $043F                          ;C0A149|AD3F04  |81043F;
BEQ CODE_C0A16C                      ;C0A14C|F01E    |C0A16C;
LDA.W Equipment.magic                          ;C0A14E|AD621B  |811B62;
SEC                                  ;C0A151|38      |      ;
SBC.W #$0011                         ;C0A152|E91100  |      ;
BEQ CODE_C0A1A2                      ;C0A155|F04B    |C0A1A2;
db $3A,$F0,$58,$3A,$F0,$32,$3A,$F0   ;C0A157|        |      ;
db $6C,$3A,$F0,$2C,$3A,$F0,$29,$3A   ;C0A15F|        |00F03A;
db $F0,$26,$82,$23,$00               ;C0A167|        |C0A18F;

CODE_C0A16C:
LDA.W buttons_pressed                          ;C0A16C|AD2203  |810322;
BIT.W #$4000                         ;C0A16F|890040  |      ;
BEQ CODE_C0A18F                      ;C0A172|F01B    |C0A18F;
LDA.W Equipment.magic                          ;C0A174|AD621B  |811B62;
SEC                                  ;C0A177|38      |      ;
SBC.W #$0011                         ;C0A178|E91100  |      ;
BEQ CODE_C0A194                      ;C0A17B|F017    |C0A194;
db $3A,$F0,$24,$3A,$F0,$31,$3A,$F0   ;C0A17D|        |      ;
db $3E,$3A,$F0,$48,$3A,$F0,$55,$3A   ;C0A185|        |00F03A;
db $F0,$62                           ;C0A18D|        |C0A1F1;

CODE_C0A18F:
INC.W $043D                          ;C0A18F|EE3D04  |81043D;
CLC                                  ;C0A192|18      |      ;
RTS                                  ;C0A193|60      |      ;

CODE_C0A194:
COP #$26                             ;C0A194|0226    |      ;
db $04,$00,$8F,$A1                   ;C0A196|        |000000;
INC.W $043F                          ;C0A19A|EE3F04  |81043F;
COP #$85                             ;C0A19D|0285    |      ;
db $01,$A2,$80                       ;C0A19F|        |0000A2;

CODE_C0A1A2:
SEC                                  ;C0A1A2|38      |      ;
RTS                                  ;C0A1A3|60      |      ;
db $02,$26,$08,$00,$8F,$A1,$EE,$3F   ;C0A1A4|        |      ;
db $04,$02,$85,$72,$A2,$80,$38,$60   ;C0A1AC|        |000002;
db $02,$26,$08,$00,$8F,$A1,$EE,$3F   ;C0A1B4|        |      ;
db $04,$02,$85,$1D,$A3,$80,$80,$CB   ;C0A1BC|        |000002;
db $EE,$3F,$04,$02,$85,$09,$A4,$80   ;C0A1C4|        |00043F;
db $EE,$3D,$04,$80,$BE,$02,$26,$08   ;C0A1CC|        |00043D;
db $00,$8F,$A1,$EE,$3F,$04,$02,$85   ;C0A1D4|        |      ;
db $65,$A4,$80,$80,$AE,$02,$26,$20   ;C0A1DC|        |0000A4;
db $00,$8F,$A1,$EE,$3F,$04,$02,$85   ;C0A1E4|        |      ;
db $C9,$A4,$80,$80,$9E,$02,$26,$08   ;C0A1EC|        |      ;
db $00,$8F,$A1,$EE,$3F,$04,$02,$85   ;C0A1F4|        |      ;
db $24,$A5,$80,$80,$8E               ;C0A1FC|        |0000A5;
LDA.W #$03A0                         ;C0A201|A9A003  |      ;
STA.W $0016,X                        ;C0A204|9D1600  |810016;
LDA.W #$0005                         ;C0A207|A90500  |      ;
STA.W $0030,X                        ;C0A20A|9D3000  |810030;
LDY.W $03A2                          ;C0A20D|ACA203  |8103A2;
LDA.W $0000,Y                        ;C0A210|B90000  |810000;
STA.W $0000,X                        ;C0A213|9D0000  |810000;
LDA.W $0002,Y                        ;C0A216|B90200  |810002;
STA.W $0002,X                        ;C0A219|9D0200  |810002;
COP #$A3                             ;C0A21C|02A3    |      ;
COP #$A2                             ;C0A21E|02A2    |      ;
db $30                               ;C0A220|        |C0A224;
COP #$A8                             ;C0A221|02A8    |      ;
db $00,$80,$8F                       ;C0A223|        |      ;
COP #$80                             ;C0A226|0280    |      ;
db $00                               ;C0A228|        |      ;
COP #$82                             ;C0A229|0282    |      ;
BRK #$1B                             ;C0A22B|001B    |      ;
LDA.W #$02A0                         ;C0A22D|A9A002  |      ;
STA.W $0016,X                        ;C0A230|9D1600  |810016;
LDY.W _039E                          ;C0A233|AC9E03  |81039E;
LDA.W $001E,Y                        ;C0A236|B91E00  |81001E;
TAY                                  ;C0A239|A8      |      ;
LDA.W UNREACH_81FA7F,Y               ;C0A23A|B97FFA  |81FA7F;
AND.W #$00FF                         ;C0A23D|29FF00  |      ;
BEQ CODE_C0A24A                      ;C0A240|F008    |C0A24A;
DEC A                                ;C0A242|3A      |      ;
BEQ CODE_C0A24C                      ;C0A243|F007    |C0A24C;
DEC A                                ;C0A245|3A      |      ;
BEQ CODE_C0A251                      ;C0A246|F009    |C0A251;
BRA CODE_C0A253                      ;C0A248|8009    |C0A253;

CODE_C0A24A:
COP #$98                             ;C0A24A|0298    |      ;

CODE_C0A24C:
LDA.W #$0002                         ;C0A24C|A90200  |      ;
BRA CODE_C0A256                      ;C0A24F|8005    |C0A256;

CODE_C0A251:
COP #$96                             ;C0A251|0296    |      ;

CODE_C0A253:
LDA.W #$0001                         ;C0A253|A90100  |      ;

CODE_C0A256:
STA.W $001E,X                        ;C0A256|9D1E00  |81001E;
STZ.W $0020,X                        ;C0A259|9E2000  |810020;
LDA.W #$0008                         ;C0A25C|A90800  |      ;
STA.W $002A,X                        ;C0A25F|9D2A00  |81002A;
LDA.W #$4000                         ;C0A262|A90040  |      ;
TRB.W _032A                          ;C0A265|1C2A03  |81032A;
STZ.W $043F                          ;C0A268|9C3F04  |81043F;
COP #$91                             ;C0A26B|0291    |      ;
COP #$83                             ;C0A26D|0283    |      ;
COP #$86                             ;C0A26F|0286    |      ;
RTL                                  ;C0A271|6B      |      ;
db $A9,$A0,$03,$9D,$16,$00,$AC,$A2   ;C0A272|        |      ;
db $03,$B9,$00,$00,$9D,$00,$00,$B9   ;C0A27A|        |0000B9;
db $02,$00,$9D,$02,$00,$02,$A3,$02   ;C0A282|        |      ;
db $A2,$30,$02,$A8,$00,$80,$8F,$02   ;C0A28A|        |      ;
db $80,$03,$02,$82,$00,$12,$02,$B2   ;C0A292|        |C0A297;
db $CC,$A2,$80,$00,$00,$F8,$FF,$A0   ;C0A29A|        |0080A2;
db $02,$02,$B2,$E1,$A2,$80,$00,$00   ;C0A2A2|        |      ;
db $08,$00,$A0,$02,$02,$B2,$F4,$A2   ;C0A2AA|        |      ;
db $80,$F8,$FF,$00,$00,$A0,$02,$02   ;C0A2B2|        |C0A2AC;
db $B2,$07,$A3,$80,$08,$00,$00,$00   ;C0A2BA|        |000007;
db $A0,$02,$02,$80,$04,$02,$82,$82   ;C0A2C2|        |      ;
db $47,$04,$A9,$0A,$00,$9D,$30,$00   ;C0A2CA|        |000004;
db $02,$98,$02,$80,$07,$02,$82,$02   ;C0A2D2|        |      ;
db $81,$08,$08,$02,$83,$80,$39,$A9   ;C0A2DA|        |000008;
db $0A,$00,$9D,$30,$00,$02,$80,$07   ;C0A2E2|        |      ;
db $02,$82,$02,$81,$08,$08,$02,$83   ;C0A2EA|        |      ;
db $80,$26,$A9,$0A,$00,$9D,$30,$00   ;C0A2F2|        |C0A31A;
db $02,$80,$05,$02,$82,$02,$81,$06   ;C0A2FA|        |      ;
db $08,$02,$83,$80,$13,$A9,$0A,$00   ;C0A302|        |      ;
db $9D,$30,$00,$02,$96,$02,$80,$05   ;C0A30A|        |000030;
db $02,$82,$02,$81,$06,$08,$02,$83   ;C0A312|        |      ;
db $02,$86,$6B,$A9,$A0,$03,$9D,$16   ;C0A31A|        |      ;
db $00,$A9,$14,$00,$9D,$30,$00,$02   ;C0A322|        |      ;
db $85,$DD,$A3,$80,$02,$A3,$02,$A2   ;C0A32A|        |0000DD;
db $30,$02,$A8,$00,$80,$8F,$02,$03   ;C0A332|        |C0A336;
db $05,$02,$80,$09,$02,$82,$AD,$22   ;C0A33A|        |000002;
db $03,$89,$00,$40,$F0,$35,$02,$04   ;C0A342|        |000089;
db $02,$03,$05,$02,$80,$0A,$02,$82   ;C0A34A|        |      ;
db $AD,$22,$03,$89,$00,$40,$F0,$3B   ;C0A352|        |000322;
db $02,$04,$02,$03,$05,$02,$80,$0B   ;C0A35A|        |      ;
db $02,$82,$AD,$22,$03,$89,$00,$40   ;C0A362|        |      ;
db $F0,$41,$02,$04,$02,$80,$0C,$02   ;C0A36A|        |C0A3AD;
db $82,$AD,$22,$03,$89,$00,$40,$F0   ;C0A372|        |C0C622;
db $4A,$80,$F1,$A9,$A0,$02,$9D,$16   ;C0A37A|        |      ;
db $00,$02,$A3,$02,$81,$0D,$03,$02   ;C0A382|        |      ;
db $83,$00,$21,$02,$80,$10,$02,$82   ;C0A38A|        |000000;
db $82,$7E,$03,$A9,$A0,$02,$9D,$16   ;C0A392|        |C0A713;
db $00,$02,$A3,$02,$81,$0E,$03,$02   ;C0A39A|        |      ;
db $83,$00,$21,$02,$80,$11,$02,$82   ;C0A3A2|        |000000;
db $82,$66,$03,$A9,$A0,$02,$9D,$16   ;C0A3AA|        |C0A713;
db $00,$02,$A3,$02,$81,$0E,$03,$02   ;C0A3B2|        |      ;
db $83,$00,$21,$02,$80,$12,$02,$82   ;C0A3BA|        |000000;
db $82,$4E,$03,$A9,$A0,$02,$9D,$16   ;C0A3C2|        |C0A713;
db $00,$02,$A3,$02,$81,$0E,$03,$02   ;C0A3CA|        |      ;
db $83,$00,$21,$02,$80,$13,$02,$82   ;C0A3D2|        |000000;
db $82,$36,$03,$BD,$16,$00,$09,$10   ;C0A3DA|        |C0A713;
db $00,$9D,$16,$00,$02,$91,$AD,$22   ;C0A3E2|        |      ;
db $03,$89,$00,$40,$F0,$16,$DA,$AC   ;C0A3EA|        |000089;
db $A2,$03,$BD,$3C,$00,$AA,$B9,$00   ;C0A3F2|        |      ;
db $00,$9D,$00,$00,$B9,$02,$00,$9D   ;C0A3FA|        |      ;
db $02,$00,$FA,$6B,$02,$86,$6B,$A9   ;C0A402|        |      ;
db $20,$20,$9D,$16,$00,$AD,$22,$03   ;C0A40A|        |C09D20;
db $89,$00,$40,$D0,$03,$82,$F9,$02   ;C0A412|        |      ;
db $02,$26,$01,$00,$13,$A7,$02,$B0   ;C0A41A|        |      ;
db $2D,$A4,$80,$B0,$02,$02,$1B,$0F   ;C0A422|        |0080A4;
db $A4,$04,$00,$AC,$A2,$03,$B9,$00   ;C0A42A|        |000004;
db $00,$9D,$00,$00,$B9,$02,$00,$9D   ;C0A432|        |      ;
db $02,$00,$A9,$05,$00,$9D,$30,$00   ;C0A43A|        |      ;
db $02,$A3,$02,$A2,$30,$02,$A8,$00   ;C0A442|        |      ;
db $80,$8F,$00,$24,$02,$80,$14,$02   ;C0A44A|        |C0A3DB;
db $82,$02,$80,$15,$02,$82,$02,$80   ;C0A452|        |C02457;
db $16,$02,$82,$02,$80,$17,$02,$82   ;C0A45A|        |000002;
db $02,$86,$6B,$A9,$20,$20,$9D,$16   ;C0A462|        |      ;
db $00,$9C,$3F,$04,$02,$03,$04,$02   ;C0A46A|        |      ;
db $B0,$83,$A4,$80,$A0,$03,$02,$1B   ;C0A472|        |C0A3F7;
db $7E,$A4,$10,$00,$02,$04,$02,$86   ;C0A47A|        |0010A4;
db $6B,$EE,$3F,$04,$A9,$1E,$00,$9D   ;C0A482|        |      ;
db $30,$00,$AC,$A2,$03,$B9,$00,$00   ;C0A48A|        |C0A48C;
db $9D,$00,$00,$B9,$02,$00,$9D,$02   ;C0A492|        |000000;
db $00,$02,$A4,$02,$A8,$00,$80,$8F   ;C0A49A|        |      ;
db $02,$81,$18,$04,$02,$83,$02,$81   ;C0A4A2|        |      ;
db $19,$04,$02,$83,$A9,$A0,$02,$9D   ;C0A4AA|        |000204;
db $16,$00,$00,$21,$02,$80,$1A,$02   ;C0A4B2|        |000000;
db $82,$CE,$3F,$04,$D0,$06,$A9,$00   ;C0A4BA|        |C0E48B;
db $40,$1C,$2A,$03,$02,$86,$6B,$A9   ;C0A4C2|        |      ;
db $20,$20,$9D,$16,$00,$9C,$3F,$04   ;C0A4CA|        |C09D20;
db $02,$03,$04,$02,$B0,$E7,$A4,$80   ;C0A4D2|        |      ;
db $A0,$02,$02,$1B,$E2,$A4,$10,$00   ;C0A4DA|        |      ;
db $02,$04,$02,$86,$6B,$EE,$3F,$04   ;C0A4E2|        |      ;
db $A9,$06,$00,$9D,$30,$00,$AC,$A2   ;C0A4EA|        |      ;
db $03,$B9,$00,$00,$9D,$00,$00,$B9   ;C0A4F2|        |0000B9;
db $02,$00,$9D,$02,$00,$02,$A8,$00   ;C0A4FA|        |      ;
db $80,$8F,$00,$0B,$02,$80,$1C,$02   ;C0A502|        |C0A493;
db $82,$02,$81,$1B,$14,$02,$83,$02   ;C0A50A|        |C0260F;
db $80,$1D,$02,$82,$CE,$3F,$04,$D0   ;C0A512|        |C0A531;
db $06,$A9,$00,$40,$1C,$2A,$03,$02   ;C0A51A|        |0000A9;
db $86,$6B,$A9,$A0,$02,$9D,$16,$00   ;C0A522|        |00006B;
db $02,$85,$92,$A6,$80,$AC,$A2,$03   ;C0A52A|        |      ;
db $B9,$00,$00,$9D,$00,$00,$B9,$02   ;C0A532|        |000000;
db $00,$38,$E9,$10,$00,$9D,$02,$00   ;C0A53A|        |      ;
db $02,$A8,$00,$80,$8F,$02,$A2,$30   ;C0A542|        |      ;
db $02,$81,$24,$04,$02,$83,$00,$16   ;C0A54A|        |      ;
db $02,$80,$25,$02,$82,$A9,$0F,$00   ;C0A552|        |      ;
db $9D,$30,$00,$02,$03,$3C,$02,$80   ;C0A55A|        |000030;
db $27,$02,$82,$02,$1F,$A9,$02,$03   ;C0A562|        |000002;
db $29,$03,$00,$D0,$03,$82,$67,$00   ;C0A56A|        |      ;
db $3A,$D0,$03,$82,$8D,$00,$3A,$D0   ;C0A572|        |      ;
db $03,$82,$B0,$00,$82,$D6,$00,$02   ;C0A57A|        |000082;
db $80,$28,$02,$82,$80,$51,$02,$80   ;C0A582|        |C0A5AC;
db $1F,$02,$82,$82,$C7,$00,$02,$80   ;C0A58A|        |828202;
db $1E,$02,$82,$82,$96,$00,$02,$80   ;C0A592|        |008202;
db $29,$02,$82,$80,$66,$02,$80,$2B   ;C0A59A|        |      ;
db $02,$82,$80,$33,$02,$80,$2D,$02   ;C0A5A2|        |      ;
db $82,$82,$A9,$00,$02,$80,$20,$02   ;C0A5AA|        |C04F2F;
db $82,$80,$79,$02,$80,$22,$02,$82   ;C0A5B2|        |C01F35;
db $80,$49,$02,$80,$21,$02,$82,$82   ;C0A5BA|        |C0A605;
db $93,$00,$02,$80,$23,$02,$82,$80   ;C0A5C2|        |000000;
db $0E,$02,$80,$2A,$02,$82,$80,$33   ;C0A5CA|        |008002;
db $02,$80,$2C,$02,$82,$80,$55,$DE   ;C0A5D2|        |      ;
db $2E,$00,$D0,$03,$82,$9F,$00,$BD   ;C0A5DA|        |00D000;
db $16,$00,$89,$00,$80,$F0,$03,$82   ;C0A5E2|        |000000;
db $94,$00,$02,$1F,$AD,$02,$03,$29   ;C0A5EA|        |000000;
db $03,$00,$F0,$8B,$3A,$D0,$03,$82   ;C0A5F2|        |000000;
db $AA,$FF,$3A,$D0,$03,$82,$C9,$FF   ;C0A5FA|        |      ;
db $82,$5B,$FF,$DE,$2E,$00,$F0,$76   ;C0A602|        |C0A560;
db $BD,$16,$00,$89,$00,$80,$D0,$6E   ;C0A60A|        |000016;
db $02,$1F,$AD,$02,$03,$29,$03,$00   ;C0A612|        |      ;
db $D0,$03,$82,$79,$FF,$3A,$D0,$03   ;C0A61A|        |C0A61F;
db $82,$7A,$FF,$3A,$D0,$03,$82,$A7   ;C0A622|        |C0A59F;
db $FF,$82,$32,$FF,$DE,$2E,$00,$F0   ;C0A62A|        |FF3282;
db $4D,$BD,$16,$00,$89,$00,$80,$D0   ;C0A632|        |0016BD;
db $45,$02,$1F,$AD,$02,$03,$29,$03   ;C0A63A|        |000002;
db $00,$D0,$03,$82,$48,$FF,$3A,$D0   ;C0A642|        |      ;
db $03,$82,$67,$FF,$3A,$D0,$03,$82   ;C0A64A|        |000082;
db $68,$FF,$82,$09,$FF,$DE,$2E,$00   ;C0A652|        |      ;
db $F0,$24,$BD,$16,$00,$89,$00,$80   ;C0A65A|        |C0A680;
db $D0,$1C,$02,$1F,$AD,$02,$03,$29   ;C0A662|        |C0A680;
db $03,$00,$D0,$03,$82,$17,$FF,$3A   ;C0A66A|        |000000;
db $D0,$03,$82,$37,$FF,$3A,$D0,$03   ;C0A672|        |C0A677;
db $82,$47,$FF,$82,$E0,$FE,$02,$81   ;C0A67A|        |C0A5C4;
db $26,$02,$02,$83,$A9,$00,$40,$1C   ;C0A682|        |000002;
db $2A,$03,$9C,$3F,$04,$02,$86,$6B   ;C0A68A|        |      ;
db $02,$A8,$00,$80,$8D,$02,$92,$42   ;C0A692|        |      ;
db $02,$94,$AD,$3F,$04,$D0,$F6,$02   ;C0A69A|        |      ;
db $86,$6B,$20,$FC,$A6,$02,$A0,$F0   ;C0A6A2|        |00006B;
db $FF,$02,$80,$30,$02,$82,$02,$81   ;C0A6AA|        |308002;
db $31,$08,$02,$83,$02,$86,$6B,$20   ;C0A6B2|        |000008;
db $FC,$A6,$02,$A0,$10,$00,$02,$98   ;C0A6BA|        |C002A6;
db $02,$80,$30,$02,$82,$02,$81,$31   ;C0A6C2|        |      ;
db $08,$02,$83,$02,$86,$6B,$20,$FC   ;C0A6CA|        |      ;
db $A6,$02,$A0,$F0,$FF,$02,$80,$2E   ;C0A6D2|        |000002;
db $02,$82,$02,$81,$2F,$08,$02,$83   ;C0A6DA|        |      ;
db $02,$86,$6B,$20,$FC,$A6,$02,$96   ;C0A6E2|        |      ;
db $02,$A0,$F0,$FF,$02,$80,$2E,$02   ;C0A6EA|        |      ;
db $82,$02,$81,$2F,$08,$02,$83,$02   ;C0A6F2|        |C027F7;
db $86,$6B,$A9,$A0,$02,$9D,$16,$00   ;C0A6FA|        |00006B;
db $A9,$14,$00,$9D,$30,$00,$02,$A3   ;C0A702|        |      ;
db $02,$A2,$30,$02,$A8,$00,$80,$8F   ;C0A70A|        |      ;
db $60,$A9,$00,$40,$1C,$2A,$03,$9C   ;C0A712|        |      ;
db $3F,$04,$02,$86,$6B               ;C0A71A|        |860204;
JSR.W CODE_C0A86E                    ;C0A71F|206EA8  |C0A86E;

CODE_C0A722:
COP #$91                             ;C0A722|0291    |      ;
LDA.W $0016,X                        ;C0A724|BD1600  |810016;
BIT.W #$8000                         ;C0A727|890080  |      ;
BEQ CODE_C0A72D                      ;C0A72A|F001    |C0A72D;
RTL                                  ;C0A72C|6B      |      ;

CODE_C0A72D:
LDA.B ($4A)                          ;C0A72D|B24A    |00004A;
BNE CODE_C0A735                      ;C0A72F|D004    |C0A735;
db $02,$27,$24,$A7                   ;C0A731|        |      ;

CODE_C0A735:
BRK #$53                             ;C0A735|0053    |      ;
JSR.W CODE_C0A919                    ;C0A737|2019A9  |C0A919;
JSR.W CODE_C0A93F                    ;C0A73A|203FA9  |C0A93F;
COP #$91                             ;C0A73D|0291    |      ;
JSR.W CODE_C0A8F2                    ;C0A73F|20F2A8  |C0A8F2;
BCC CODE_C0A722                      ;C0A742|90DE    |C0A722;
JMP.W CODE_C0A89D                    ;C0A744|4C9DA8  |C0A89D;
JSR.W CODE_C0A86E                    ;C0A747|206EA8  |C0A86E;
LDA.W $002E,X                        ;C0A74A|BD2E00  |81002E;
AND.W #$00FF                         ;C0A74D|29FF00  |      ;
STA.W $002C,X                        ;C0A750|9D2C00  |81002C;

CODE_C0A753:
COP #$91                             ;C0A753|0291    |      ;
LDA.W $0016,X                        ;C0A755|BD1600  |810016;
BIT.W #$8000                         ;C0A758|890080  |      ;
BEQ CODE_C0A75E                      ;C0A75B|F001    |C0A75E;
RTL                                  ;C0A75D|6B      |      ;

CODE_C0A75E:
LDA.B ($4A)                          ;C0A75E|B24A    |00004A;
BNE CODE_C0A766                      ;C0A760|D004    |C0A766;
db $02,$27,$55,$A7                   ;C0A762|        |      ;

CODE_C0A766:
BRK #$53                             ;C0A766|0053    |      ;
JSR.W CODE_C0A919                    ;C0A768|2019A9  |C0A919;
JSR.W CODE_C0A93F                    ;C0A76B|203FA9  |C0A93F;
DEC.W $002C,X                        ;C0A76E|DE2C00  |81002C;
BNE CODE_C0A753                      ;C0A771|D0E0    |C0A753;
COP #$91                             ;C0A773|0291    |      ;
JSR.W CODE_C0A8F2                    ;C0A775|20F2A8  |C0A8F2;
BCS CODE_C0A77B                      ;C0A778|B001    |C0A77B;
RTL                                  ;C0A77A|6B      |      ;

CODE_C0A77B:
JMP.W CODE_C0A89D                    ;C0A77B|4C9DA8  |C0A89D;
JSR.W CODE_C0A86E                    ;C0A77E|206EA8  |C0A86E;
LDA.W $002E,X                        ;C0A781|BD2E00  |81002E;
AND.W #$00FF                         ;C0A784|29FF00  |      ;
STA.B $0C                            ;C0A787|850C    |00000C;
LDA.W $0026,X                        ;C0A789|BD2600  |810026;
ASL A                                ;C0A78C|0A      |      ;
TAY                                  ;C0A78D|A8      |      ;
LDA.W UNREACH_81EE8E,Y               ;C0A78E|B98EEE  |81EE8E;
STA.B $00                            ;C0A791|8500    |000000;

CODE_C0A793:
JSR.W CODE_C0A919                    ;C0A793|2019A9  |C0A919;
LDA.W #$A98A                         ;C0A796|A98AA9  |      ;
STA.W $0018,Y                        ;C0A799|991800  |810018;
LDA.B ($00)                          ;C0A79C|B200    |000000;
INC.B $00                            ;C0A79E|E600    |000000;
INC.B $00                            ;C0A7A0|E600    |000000;
STA.W $0000,Y                        ;C0A7A2|990000  |810000;
LDA.B ($00)                          ;C0A7A5|B200    |000000;
INC.B $00                            ;C0A7A7|E600    |000000;
INC.B $00                            ;C0A7A9|E600    |000000;
STA.W $0002,Y                        ;C0A7AB|990200  |810002;
LDA.W $001C,Y                        ;C0A7AE|B91C00  |81001C;
AND.W #$3FFF                         ;C0A7B1|29FF3F  |      ;
ORA.B ($00)                          ;C0A7B4|1200    |000000;
INC.B $00                            ;C0A7B6|E600    |000000;
INC.B $00                            ;C0A7B8|E600    |000000;
STA.W $001C,Y                        ;C0A7BA|991C00  |81001C;
DEC.B $0C                            ;C0A7BD|C60C    |00000C;
BNE CODE_C0A793                      ;C0A7BF|D0D2    |C0A793;
COP #$91                             ;C0A7C1|0291    |      ;
JSR.W CODE_C0A8F2                    ;C0A7C3|20F2A8  |C0A8F2;
BCS CODE_C0A7C9                      ;C0A7C6|B001    |C0A7C9;
RTL                                  ;C0A7C8|6B      |      ;

CODE_C0A7C9:
JMP.W CODE_C0A89D                    ;C0A7C9|4C9DA8  |C0A89D;
db $20,$6E,$A8,$02,$91,$BD,$16,$00   ;C0A7CC|        |C0A86E;
db $89,$00,$80,$F0,$01,$6B,$B2,$4A   ;C0A7D4|        |      ;
db $D0,$04,$02,$27,$D1,$A7,$00,$53   ;C0A7DC|        |C0A7E2;
db $20,$19,$A9,$BD,$1C,$00,$18,$69   ;C0A7E4|        |C0A919;
db $00,$40,$9D,$1C,$00,$20,$3F,$A9   ;C0A7EC|        |      ;
db $02,$91,$20,$F2,$A8,$90,$D4,$4C   ;C0A7F4|        |      ;
db $9D,$A8,$20,$6E,$A8,$BD,$2E,$00   ;C0A7FC|        |0020A8;
db $29,$FF,$00,$9D,$2C,$00,$02,$91   ;C0A804|        |      ;
db $BD,$16,$00,$89,$00,$80,$F0,$01   ;C0A80C|        |000016;
db $6B,$B2,$4A,$D0,$04,$02,$27,$0C   ;C0A814|        |      ;
db $A8,$00,$53,$20,$19,$A9,$BD,$1C   ;C0A81C|        |      ;
db $00,$18,$69,$00,$40,$9D,$1C,$00   ;C0A824|        |      ;
db $20,$3F,$A9,$DE,$2C,$00,$D0,$D6   ;C0A82C|        |C0A93F;
db $02,$91,$20,$F2,$A8,$B0,$01,$6B   ;C0A834|        |      ;
db $4C,$9D,$A8,$20,$6E,$A8,$02,$91   ;C0A83C|        |C0A89D;
db $BD,$16,$00,$89,$00,$80,$F0,$01   ;C0A844|        |000016;
db $6B,$02,$0C,$00,$02,$54,$A8,$6B   ;C0A84C|        |      ;
db $B2,$4A,$D0,$04,$02,$27,$44,$A8   ;C0A854|        |00004A;
db $00,$53,$20,$19,$A9,$20,$3F,$A9   ;C0A85C|        |      ;
db $02,$91,$20,$F2,$A8,$90,$D7,$4C   ;C0A864|        |      ;
db $9D,$A8                           ;C0A86C|        |009BA8;

CODE_C0A86E:
TXY                                  ;C0A86E|9B      |      ;
LDA.W $002C,X                        ;C0A86F|BD2C00  |81002C;
BNE CODE_C0A88A                      ;C0A872|D016    |C0A88A;
LDA.W $0000,X                        ;C0A874|BD0000  |810000;
STA.B $16                            ;C0A877|8516    |000016;
LDA.W $0002,X                        ;C0A879|BD0200  |810002;
SEC                                  ;C0A87C|38      |      ;
SBC.W #$0010                         ;C0A87D|E91000  |      ;
STA.B $18                            ;C0A880|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C0A882|22E08183|8381E0;
TXA                                  ;C0A886|8A      |      ;
STA.W $002C,Y                        ;C0A887|992C00  |81002C;

CODE_C0A88A:
LDX.W $002C,Y                        ;C0A88A|BE2C00  |81002C;
LDA.L tilemap,X                      ;C0A88D|BF00807E|7E8000;
TYX                                  ;C0A891|BB      |      ;
AND.W #$00FF                         ;C0A892|29FF00  |      ;
CMP.W #$00FD                         ;C0A895|C9FD00  |      ;
BEQ CODE_C0A89C                      ;C0A898|F002    |C0A89C;
PLA                                  ;C0A89A|68      |      ;
RTL                                  ;C0A89B|6B      |      ;

CODE_C0A89C:
RTS                                  ;C0A89C|60      |      ;

CODE_C0A89D:
COP #$91                             ;C0A89D|0291    |      ;
LDA.W $1C7B                          ;C0A89F|AD7B1C  |811C7B;
BEQ CODE_C0A8A5                      ;C0A8A2|F001    |C0A8A5;
db $6B                               ;C0A8A4|        |      ;

CODE_C0A8A5:
PHX                                  ;C0A8A5|DA      |      ;
LDA.W $0000,X                        ;C0A8A6|BD0000  |810000;
STA.B $16                            ;C0A8A9|8516    |000016;
LDA.W $0002,X                        ;C0A8AB|BD0200  |810002;
SEC                                  ;C0A8AE|38      |      ;
SBC.W #$0010                         ;C0A8AF|E91000  |      ;
STA.B $18                            ;C0A8B2|8518    |000018;
LDA.W $0034,X                        ;C0A8B4|BD3400  |810034;
ASL A                                ;C0A8B7|0A      |      ;
ASL A                                ;C0A8B8|0A      |      ;
ASL A                                ;C0A8B9|0A      |      ;
ASL A                                ;C0A8BA|0A      |      ;
ASL A                                ;C0A8BB|0A      |      ;
TAX                                  ;C0A8BC|AA      |      ;
SEP #$20                             ;C0A8BD|E220    |      ;
LDA.W UNREACH_81BA15,X               ;C0A8BF|BD15BA  |81BA15;
BEQ CODE_C0A8CC                      ;C0A8C2|F008    |C0A8CC;
db $A9,$FE,$22,$AC,$87,$82,$80,$06   ;C0A8C4|        |      ;

CODE_C0A8CC:
LDA.B #$FE                           ;C0A8CC|A9FE    |      ;
JSL.L CODE_C286F1                    ;C0A8CE|22F18682|8286F1;
PLX                                  ;C0A8D2|FA      |      ;
REP #$20                             ;C0A8D3|C220    |      ;
COP #$A8                             ;C0A8D5|02A8    |      ;
db $00,$80,$8E                       ;C0A8D7|        |      ;
LDA.W #$0310                         ;C0A8DA|A91003  |      ;
STA.W $0016,X                        ;C0A8DD|9D1600  |810016;
STZ.W $001C,X                        ;C0A8E0|9E1C00  |81001C;
COP #$A3                             ;C0A8E3|02A3    |      ;
COP #$A2                             ;C0A8E5|02A2    |      ;
db $30                               ;C0A8E7|        |C0A8E9;
BRK #$83                             ;C0A8E8|0083    |      ;
COP #$80                             ;C0A8EA|0280    |      ;
db $01                               ;C0A8EC|        |000002;
COP #$82                             ;C0A8ED|0282    |      ;
COP #$86                             ;C0A8EF|0286    |      ;
RTL                                  ;C0A8F1|6B      |      ;

CODE_C0A8F2:
SEP #$20                             ;C0A8F2|E220    |      ;
LDA.W $002E,X                        ;C0A8F4|BD2E00  |81002E;
CMP.W $002F,X                        ;C0A8F7|DD2F00  |81002F;
REP #$20                             ;C0A8FA|C220    |      ;
BNE CODE_C0A900                      ;C0A8FC|D002    |C0A900;
PLA                                  ;C0A8FE|68      |      ;
RTL                                  ;C0A8FF|6B      |      ;

CODE_C0A900:
TXY                                  ;C0A900|9B      |      ;
LDA.W $0034,X                        ;C0A901|BD3400  |810034;
TAX                                  ;C0A904|AA      |      ;
SEP #$20                             ;C0A905|E220    |      ;
LDA.W $002E,Y                        ;C0A907|B92E00  |81002E;
STA.W $002F,Y                        ;C0A90A|992F00  |81002F;
CLC                                  ;C0A90D|18      |      ;
BNE CODE_C0A915                      ;C0A90E|D005    |C0A915;
SEC                                  ;C0A910|38      |      ;
STA.L lair_spawn,X                      ;C0A911|9F03027F|7F0203;

CODE_C0A915:
REP #$20                             ;C0A915|C220    |      ;
TYX                                  ;C0A917|BB      |      ;
RTS                                  ;C0A918|60      |      ;

CODE_C0A919:
PHX                                  ;C0A919|DA      |      ;
JSR.W CODE_C0E6DA                    ;C0A91A|20DAE6  |C0E6DA;
LDA.W $0038,X                        ;C0A91D|BD3800  |810038;
TAX                                  ;C0A920|AA      |      ;
LDA.W Entity.facing,X               ;C0A921|BD0680  |818006;
ORA.W #$8000                         ;C0A924|090080  |      ;
STA.W $0016,Y                        ;C0A927|991600  |810016;
LDA.W #$A954                         ;C0A92A|A954A9  |      ;
STA.W $0018,Y                        ;C0A92D|991800  |810018;
SEP #$20                             ;C0A930|E220    |      ;
LDA.B #$80                           ;C0A932|A980    |      ;
STA.W $0036,Y                        ;C0A934|993600  |810036;
REP #$20                             ;C0A937|C220    |      ;
PLX                                  ;C0A939|FA      |      ;
TXA                                  ;C0A93A|8A      |      ;
STA.W $0032,Y                        ;C0A93B|993200  |810032;
RTS                                  ;C0A93E|60      |      ;

CODE_C0A93F:
LDA.W $0026,X                        ;C0A93F|BD2600  |810026;
BEQ CODE_C0A953                      ;C0A942|F00F    |C0A953;
ASL A                                ;C0A944|0A      |      ;
CLC                                  ;C0A945|18      |      ;
ADC.W $0026,X                        ;C0A946|7D2600  |810026;
DEC A                                ;C0A949|3A      |      ;
STA.W $0014,X                        ;C0A94A|9D1400  |810014;
PLA                                  ;C0A94D|68      |      ;
INC A                                ;C0A94E|1A      |      ;
STA.W $0018,X                        ;C0A94F|9D1800  |810018;
RTL                                  ;C0A952|6B      |      ;

CODE_C0A953:
RTS                                  ;C0A953|60      |      ;
COP #$A8                             ;C0A954|02A8    |      ;
db $00,$80,$8E                       ;C0A956|        |      ;
LDA.W #$0300                         ;C0A959|A90003  |      ;
STA.W $0016,X                        ;C0A95C|9D1600  |810016;
LDA.W $001C,X                        ;C0A95F|BD1C00  |81001C;
STA.W $0030,X                        ;C0A962|9D3000  |810030;
LDA.W $0372                          ;C0A965|AD7203  |810372;
STA.W $001C,X                        ;C0A968|9D1C00  |81001C;
COP #$80                             ;C0A96B|0280    |      ;
db $00                               ;C0A96D|        |      ;
COP #$82                             ;C0A96E|0282    |      ;
LDA.W $0030,X                        ;C0A970|BD3000  |810030;
STA.W $001C,X                        ;C0A973|9D1C00  |81001C;
LDA.W #$003C                         ;C0A976|A93C00  |      ;
STA.W $0026,X                        ;C0A979|9D2600  |810026;
LDY.W $0038,X                        ;C0A97C|BC3800  |810038;
LDA.W Entity.facing,Y               ;C0A97F|B90680  |818006;
ORA.W #$8800                         ;C0A982|090088  |      ;
STA.W $0016,X                        ;C0A985|9D1600  |810016;
BRA CODE_C0A996                      ;C0A988|800C    |C0A996;
LDY.W $0038,X                        ;C0A98A|BC3800  |810038;
LDA.W Entity.facing,Y               ;C0A98D|B90680  |818006;
ORA.W #$8000                         ;C0A990|090080  |      ;
STA.W $0016,X                        ;C0A993|9D1600  |810016;

CODE_C0A996:
SEP #$20                             ;C0A996|E220    |      ;
LDA.W Entity._unknown2,Y               ;C0A998|B90A80  |81800A;
STA.W $0024,X                        ;C0A99B|9D2400  |810024;
LDA.W Entity.behaviour_bank,Y               ;C0A99E|B90D80  |81800D;
STA.W $0036,X                        ;C0A9A1|9D3600  |810036;
PHA                                  ;C0A9A4|48      |      ;
REP #$20                             ;C0A9A5|C220    |      ;
LDA.W Entity.sprite_id,Y               ;C0A9A7|B90580  |818005;
STA.W $001E,X                        ;C0A9AA|9D1E00  |81001E;
STZ.W $0020,X                        ;C0A9AD|9E2000  |810020;
LDA.W Entity._unknown1,Y               ;C0A9B0|B90880  |818008;
STA.W $0022,X                        ;C0A9B3|9D2200  |810022;
LDA.W Entity.behaviour_addr,Y               ;C0A9B6|B90B80  |81800B;
STA.W $0018,X                        ;C0A9B9|9D1800  |810018;
DEC A                                ;C0A9BC|3A      |      ;
PHA                                  ;C0A9BD|48      |      ;
JSL.L CODE_C0891F                    ;C0A9BE|221F8980|80891F;
STZ.W $0004,X                        ;C0A9C2|9E0400  |810004;
STZ.W $0006,X                        ;C0A9C5|9E0600  |810006;
RTL                                  ;C0A9C8|6B      |      ;
CODE_C0A9C9:
LDA.W $032E                          ;C0A9C9|AD2E03  |81032E;
BEQ CODE_C0AA11                      ;C0A9CC|F043    |C0AA11;
COP #$A8                             ;C0A9CE|02A8    |      ;
db $00,$80,$8E                       ;C0A9D0|        |      ;
LDA.W $0016,X                        ;C0A9D3|BD1600  |810016;
AND.W #$DFFF                         ;C0A9D6|29FFDF  |      ;
ORA.W #$0010                         ;C0A9D9|091000  |      ;
STA.W $0016,X                        ;C0A9DC|9D1600  |810016;
LDA.W $0372                          ;C0A9DF|AD7203  |810372;
STA.W $001C,X                        ;C0A9E2|9D1C00  |81001C;
COP #$A3                             ;C0A9E5|02A3    |      ;
COP #$A2                             ;C0A9E7|02A2    |      ;
db $30                               ;C0A9E9|        |C0A9A8;
LDA.W $0010,X                        ;C0A9EA|BD1000  |810010;
SEC                                  ;C0A9ED|38      |      ;
SBC.W #$0010                         ;C0A9EE|E91000  |      ;
LSR A                                ;C0A9F1|4A      |      ;
CLC                                  ;C0A9F2|18      |      ;
ADC.W $0000,X                        ;C0A9F3|7D0000  |810000;
STA.W $0000,X                        ;C0A9F6|9D0000  |810000;
LDA.W $0012,X                        ;C0A9F9|BD1200  |810012;
SEC                                  ;C0A9FC|38      |      ;
SBC.W #$0010                         ;C0A9FD|E91000  |      ;
LSR A                                ;C0AA00|4A      |      ;
EOR.W #$FFFF                         ;C0AA01|49FFFF  |      ;
INC A                                ;C0AA04|1A      |      ;
CLC                                  ;C0AA05|18      |      ;
ADC.W $0002,X                        ;C0AA06|7D0200  |810002;
STA.W $0002,X                        ;C0AA09|9D0200  |810002;
COP #$80                             ;C0AA0C|0280    |      ;
db $02                               ;C0AA0E|        |      ;
COP #$82                             ;C0AA0F|0282    |      ;

CODE_C0AA11:
COP #$86                             ;C0AA11|0286    |      ;
RTL                                  ;C0AA13|6B      |      ;

Call_Cop94:
    COP #$94
    BRA Call_Cop94

db $E2,$20,$A9,$80,$9D,$36,$00,$C2   ;C0AA18|        |      ;
db $20,$A9,$00,$03,$9D,$16,$00,$02   ;C0AA20|        |C000A9;
db $A3,$AD,$72,$03,$9D,$1C,$00,$02   ;C0AA28|        |0000AD;
db $A8,$00,$80,$8E,$02,$80,$10,$02   ;C0AA30|        |      ;
db $82,$02,$86,$6B                   ;C0AA38|        |C0303D;

CODE_C0AA3C:
CPX.W $039C                          ;C0AA3C|EC9C03  |81039C;
BNE CODE_C0AA44                      ;C0AA3F|D003    |C0AA44;
BRL CODE_C0ABC2                      ;C0AA41|827E01  |C0ABC2;

CODE_C0AA44:
COP #$A8                             ;C0AA44|02A8    |      ;
db $00,$80,$8E                       ;C0AA46|        |      ;
LDA.W #$0300                         ;C0AA49|A90003  |      ;
STA.W $0016,X                        ;C0AA4C|9D1600  |810016;
STZ.W $001A,X                        ;C0AA4F|9E1A00  |81001A;
LDA.W $0372                          ;C0AA52|AD7203  |810372;
STA.W $001C,X                        ;C0AA55|9D1C00  |81001C;
LDA.W $0010,X                        ;C0AA58|BD1000  |810010;
SEC                                  ;C0AA5B|38      |      ;
SBC.W #$0010                         ;C0AA5C|E91000  |      ;
LSR A                                ;C0AA5F|4A      |      ;
CLC                                  ;C0AA60|18      |      ;
ADC.W $0000,X                        ;C0AA61|7D0000  |810000;
STA.W $0000,X                        ;C0AA64|9D0000  |810000;
LDA.W $0012,X                        ;C0AA67|BD1200  |810012;
SEC                                  ;C0AA6A|38      |      ;
SBC.W #$0010                         ;C0AA6B|E91000  |      ;
LSR A                                ;C0AA6E|4A      |      ;
EOR.W #$FFFF                         ;C0AA6F|49FFFF  |      ;
INC A                                ;C0AA72|1A      |      ;
CLC                                  ;C0AA73|18      |      ;
ADC.W $0002,X                        ;C0AA74|7D0200  |810002;
STA.W $0002,X                        ;C0AA77|9D0200  |810002;
LDA.W _03BC                          ;C0AA7A|ADBC03  |8103BC;
CMP.W #$0006                         ;C0AA7D|C90600  |      ;
BNE CODE_C0AA85                      ;C0AA80|D003    |C0AA85;
db $A9,$19,$00                       ;C0AA82|        |      ;

CODE_C0AA85:
ASL A                                ;C0AA85|0A      |      ;
PHA                                  ;C0AA86|48      |      ;
INC A                                ;C0AA87|1A      |      ;
STA.B $16                            ;C0AA88|8516    |000016;
PLA                                  ;C0AA8A|68      |      ;
ASL A                                ;C0AA8B|0A      |      ;
CLC                                  ;C0AA8C|18      |      ;
ADC.W #$0004                         ;C0AA8D|690400  |      ;
STA.B $18                            ;C0AA90|8518    |000018;
LDA.W Equipment.sword                          ;C0AA92|AD5E1B  |811B5E;
CMP.W #$0004                         ;C0AA95|C90400  |      ;
BNE CODE_C0AA9E                      ;C0AA98|D004    |C0AA9E;
db $06,$16,$06,$18                   ;C0AA9A|        |000016;

CODE_C0AA9E:
COP #$1F                             ;C0AA9E|021F    |      ;
COP #$35                             ;C0AAA0|0235    |      ;
db $64                               ;C0AAA2|        |0000AD;
LDA.W $0443                          ;C0AAA3|AD4304  |810443;
CMP.B $18                            ;C0AAA6|C518    |000018;
BCS CODE_C0AAC0                      ;C0AAA8|B016    |C0AAC0;
CMP.B $16                            ;C0AAAA|C516    |000016;
BCS CODE_C0AAB7                      ;C0AAAC|B009    |C0AAB7;
COP #$B0                             ;C0AAAE|02B0    |      ;
db $32,$AF,$80,$00,$40               ;C0AAB0|        |0000AF;
BRA CODE_C0AAC7                      ;C0AAB5|8010    |C0AAC7;

CODE_C0AAB7:
COP #$B0                             ;C0AAB7|02B0    |      ;
db $22,$AF,$80,$00,$40               ;C0AAB9|        |0080AF;
BRA CODE_C0AAC7                      ;C0AABE|8007    |C0AAC7;

CODE_C0AAC0:
COP #$B0                             ;C0AAC0|02B0    |      ;
db $12,$AF,$80,$00,$40               ;C0AAC2|        |0000AF;

CODE_C0AAC7:
COP #$80                             ;C0AAC7|0280    |      ;
db $03                               ;C0AAC9|        |000002;
COP #$82                             ;C0AACA|0282    |      ;
COP #$A3                             ;C0AACC|02A3    |      ;
COP #$A2                             ;C0AACE|02A2    |      ;
db $30                               ;C0AAD0|        |C0AAD4;
COP #$A8                             ;C0AAD1|02A8    |      ;
db $00,$F0,$7E                       ;C0AAD3|        |      ;
COP #$A0                             ;C0AAD6|02A0    |      ;
db $F0,$FF                           ;C0AAD8|        |C0AAD9;
PHX                                  ;C0AADA|DA      |      ;
LDY.W $0038,X                        ;C0AADB|BC3800  |810038;
LDA.W Entity.bcd_exp,Y               ;C0AADE|B90380  |818003;
STA.B $00                            ;C0AAE1|8500    |000000;
TXY                                  ;C0AAE3|9B      |      ;
TXA                                  ;C0AAE4|8A      |      ;
SEC                                  ;C0AAE5|38      |      ;
SBC.W #$0800                         ;C0AAE6|E90008  |      ;
LSR A                                ;C0AAE9|4A      |      ;
LSR A                                ;C0AAEA|4A      |      ;
LSR A                                ;C0AAEB|4A      |      ;
LSR A                                ;C0AAEC|4A      |      ;
LSR A                                ;C0AAED|4A      |      ;
LSR A                                ;C0AAEE|4A      |      ;
STA.W $001E,X                        ;C0AAEF|9D1E00  |81001E;
STZ.W $0020,X                        ;C0AAF2|9E2000  |810020;
ASL A                                ;C0AAF5|0A      |      ;
TAX                                  ;C0AAF6|AA      |      ;
LDA.L $7EF000,X                      ;C0AAF7|BF00F07E|7EF000;
TAX                                  ;C0AAFB|AA      |      ;
LDA.L $7E0006,X                      ;C0AAFC|BF06007E|7E0006;
CLC                                  ;C0AB00|18      |      ;
ADC.W #$000E                         ;C0AB01|690E00  |      ;
SEC                                  ;C0AB04|38      |      ;
SBC.W #$F000                         ;C0AB05|E900F0  |      ;
TAX                                  ;C0AB08|AA      |      ;
LDA.B $00                            ;C0AB09|A500    |000000;
CMP.W #$1000                         ;C0AB0B|C90010  |      ;
BCS UNREACH_C0AB53                   ;C0AB0E|B043    |C0AB53;
CMP.W #$0100                         ;C0AB10|C90001  |      ;
BCS UNREACH_C0AB40                   ;C0AB13|B02B    |C0AB40;
CMP.W #$0010                         ;C0AB15|C91000  |      ;
BCS CODE_C0AB2D                      ;C0AB18|B013    |C0AB2D;
LDA.W #$0001                         ;C0AB1A|A90100  |      ;
STA.L $7EEFFE,X                      ;C0AB1D|9FFEEF7E|7EEFFE;
LDA.W $0000,Y                        ;C0AB21|B90000  |810000;
CLC                                  ;C0AB24|18      |      ;
ADC.W #$0005                         ;C0AB25|690500  |      ;
STA.W $0000,Y                        ;C0AB28|990000  |810000;
BRA CODE_C0AB73                      ;C0AB2B|8046    |C0AB73;

CODE_C0AB2D:
LDA.W #$0002                         ;C0AB2D|A90200  |      ;
STA.L $7EEFFE,X                      ;C0AB30|9FFEEF7E|7EEFFE;
LDA.W $0000,Y                        ;C0AB34|B90000  |810000;
CLC                                  ;C0AB37|18      |      ;
ADC.W #$0003                         ;C0AB38|690300  |      ;
STA.W $0000,Y                        ;C0AB3B|990000  |810000;
BRA CODE_C0AB6E                      ;C0AB3E|802E    |C0AB6E;

UNREACH_C0AB40:
db $A9,$03,$00,$9F,$FE,$EF,$7E,$B9   ;C0AB40|        |      ;
db $00,$00,$18,$69,$01,$00,$99,$00   ;C0AB48|        |      ;
db $00,$80,$16                       ;C0AB50|        |      ;

UNREACH_C0AB53:
db $A9,$04,$00,$9F,$FE,$EF,$7E,$B9   ;C0AB53|        |      ;
db $00,$00,$18,$69,$FF,$FF,$99,$00   ;C0AB5B|        |      ;
db $00,$A5,$01,$20,$83,$AB,$A5,$01   ;C0AB63|        |      ;
db $20,$87,$AB                       ;C0AB6B|        |C0AB87;

CODE_C0AB6E:
LDA.B $00                            ;C0AB6E|A500    |000000;
JSR.W CODE_C0AB83                    ;C0AB70|2083AB  |C0AB83;

CODE_C0AB73:
LDA.B $00                            ;C0AB73|A500    |000000;
JSR.W CODE_C0AB87                    ;C0AB75|2087AB  |C0AB87;
PLX                                  ;C0AB78|FA      |      ;
COP #$91                             ;C0AB79|0291    |      ;
COP #$82                             ;C0AB7B|0282    |      ;
COP #$1B                             ;C0AB7D|021B    |      ;
db $AA,$AB,$10,$00                   ;C0AB7F|        |      ;

CODE_C0AB83:
LSR A                                ;C0AB83|4A      |      ;
LSR A                                ;C0AB84|4A      |      ;
LSR A                                ;C0AB85|4A      |      ;
LSR A                                ;C0AB86|4A      |      ;

CODE_C0AB87:
AND.W #$000F                         ;C0AB87|290F00  |      ;
PHX                                  ;C0AB8A|DA      |      ;
TAX                                  ;C0AB8B|AA      |      ;
LDA.L .data, X               ;C0AB8C|BFA0AB80|80ABA0;
PLX                                  ;C0AB90|FA      |      ;
SEP #$20                             ;C0AB91|E220    |      ;
STA.L $7EF005,X                      ;C0AB93|9F05F07E|7EF005;
REP #$20                             ;C0AB97|C220    |      ;
TXA                                  ;C0AB99|8A      |      ;
CLC                                  ;C0AB9A|18      |      ;
ADC.W #$0007                         ;C0AB9B|690700  |      ;
TAX                                  ;C0AB9E|AA      |      ;
RTS                                  ;C0AB9F|60      |      ;

.data:
    dw $C8B7, $D8C9, $CED9, $DECF, $A7DF

CODE_C0ABAA:
LDY.W $0032,X                        ;C0ABAA|BC3200  |810032;
BNE CODE_C0ABB2                      ;C0ABAD|D003    |C0ABB2;
BRL CODE_C0AD78                      ;C0ABAF|82C601  |C0AD78;

CODE_C0ABB2:
SEP #$20                             ;C0ABB2|E220    |      ;
LDA.W $002E,Y                        ;C0ABB4|B92E00  |81002E;
BEQ CODE_C0ABBD                      ;C0ABB7|F004    |C0ABBD;
DEC A                                ;C0ABB9|3A      |      ;
STA.W $002E,Y                        ;C0ABBA|992E00  |81002E;

CODE_C0ABBD:
REP #$20                             ;C0ABBD|C220    |      ;
COP #$86                             ;C0ABBF|0286    |      ;
RTL                                  ;C0ABC1|6B      |      ;

CODE_C0ABC2:
LDA.W #$0700                         ;C0ABC2|A90007  |      ;
STA.W $0016,X                        ;C0ABC5|9D1600  |810016;
STZ.W $0004,X                        ;C0ABC8|9E0400  |810004;
STZ.W $0006,X                        ;C0ABCB|9E0600  |810006;
INC.W $0439                          ;C0ABCE|EE3904  |810439;
LDA.W $0000,X                        ;C0ABD1|BD0000  |810000;
SEC                                  ;C0ABD4|38      |      ;
SBC.W $0008,X                        ;C0ABD5|FD0800  |810008;
STA.W $0431                          ;C0ABD8|8D3104  |810431;
LDA.W $0002,X                        ;C0ABDB|BD0200  |810002;
SEC                                  ;C0ABDE|38      |      ;
SBC.W $000A,X                        ;C0ABDF|FD0A00  |81000A;
STA.W $0433                          ;C0ABE2|8D3304  |810433;
LDA.W $0008,X                        ;C0ABE5|BD0800  |810008;
CLC                                  ;C0ABE8|18      |      ;
ADC.W $000C,X                        ;C0ABE9|7D0C00  |81000C;
STA.W $0435                          ;C0ABEC|8D3504  |810435;
LDA.W $000A,X                        ;C0ABEF|BD0A00  |81000A;
CLC                                  ;C0ABF2|18      |      ;
ADC.W $000E,X                        ;C0ABF3|7D0E00  |81000E;
STA.W $0437                          ;C0ABF6|8D3704  |810437;
COP #$03                             ;C0ABF9|0203    |      ;
db $20                               ;C0ABFB|        |C08402;
COP #$84                             ;C0ABFC|0284    |      ;
db $2A,$AC,$80                       ;C0ABFE|        |      ;
LDA.W #$0003                         ;C0AC01|A90300  |      ;
STA.W $0014,X                        ;C0AC04|9D1400  |810014;
COP #$04                             ;C0AC07|0204    |      ;
CPX.W $039C                          ;C0AC09|EC9C03  |81039C;
BNE CODE_C0ABAA                      ;C0AC0C|D09C    |C0ABAA;
JSR.W CODE_C0AC8F                    ;C0AC0E|208FAC  |C0AC8F;
LDA.W current_map_number                          ;C0AC11|AD6A1C  |811C6A;
CMP.W #$007D                         ;C0AC14|C97D00  |      ;
BNE CODE_C0AC25                      ;C0AC17|D00C    |C0AC25;
db $E2,$20,$A9,$80,$48,$C2,$20,$A9   ;C0AC19|        |      ;
db $9F,$D3,$48,$6B                   ;C0AC21|        |6B48D3;

CODE_C0AC25:
COP #$31                             ;C0AC25|0231    |      ;
db $02                               ;C0AC27|        |      ;
BRA CODE_C0ABAA                      ;C0AC28|8080    |C0ABAA;
COP #$A8                             ;C0AC2A|02A8    |      ;
db $00,$80,$8E                       ;C0AC2C|        |      ;
COP #$A3                             ;C0AC2F|02A3    |      ;
LDA.W $0372                          ;C0AC31|AD7203  |810372;
STA.W $001C,X                        ;C0AC34|9D1C00  |81001C;
LDA.W $0016,X                        ;C0AC37|BD1600  |810016;
AND.W #$DFFF                         ;C0AC3A|29FFDF  |      ;
STA.W $0016,X                        ;C0AC3D|9D1600  |810016;
COP #$1F                             ;C0AC40|021F    |      ;
SEP #$20                             ;C0AC42|E220    |      ;
LDA.W _0302                          ;C0AC44|AD0203  |810302;
AND.B #$7F                           ;C0AC47|297F    |      ;

CODE_C0AC49:
SEC                                  ;C0AC49|38      |      ;
SBC.W $0435                          ;C0AC4A|ED3504  |810435;
BPL CODE_C0AC49                      ;C0AC4D|10FA    |C0AC49;
CLC                                  ;C0AC4F|18      |      ;
ADC.W $0435                          ;C0AC50|6D3504  |810435;
REP #$20                             ;C0AC53|C220    |      ;
AND.W #$00FF                         ;C0AC55|29FF00  |      ;
CLC                                  ;C0AC58|18      |      ;
ADC.W $0431                          ;C0AC59|6D3104  |810431;
STA.W $0000,X                        ;C0AC5C|9D0000  |810000;
COP #$1F                             ;C0AC5F|021F    |      ;
SEP #$20                             ;C0AC61|E220    |      ;
LDA.W _0302                          ;C0AC63|AD0203  |810302;
AND.B #$7F                           ;C0AC66|297F    |      ;

CODE_C0AC68:
SEC                                  ;C0AC68|38      |      ;
SBC.W $0437                          ;C0AC69|ED3704  |810437;
BPL CODE_C0AC68                      ;C0AC6C|10FA    |C0AC68;
CLC                                  ;C0AC6E|18      |      ;
ADC.W $0437                          ;C0AC6F|6D3704  |810437;
REP #$20                             ;C0AC72|C220    |      ;
PHA                                  ;C0AC74|48      |      ;
AND.W #$00FF                         ;C0AC75|29FF00  |      ;
CLC                                  ;C0AC78|18      |      ;
ADC.W $0433                          ;C0AC79|6D3304  |810433;
STA.W $0002,X                        ;C0AC7C|9D0200  |810002;
PLA                                  ;C0AC7F|68      |      ;
AND.W #$0001                         ;C0AC80|290100  |      ;
BNE CODE_C0AC87                      ;C0AC83|D002    |C0AC87;
BRK #$85                             ;C0AC85|0085    |      ;

CODE_C0AC87:
COP #$80                             ;C0AC87|0280    |      ;
db $00                               ;C0AC89|        |      ;
COP #$82                             ;C0AC8A|0282    |      ;
COP #$86                             ;C0AC8C|0286    |      ;
RTL                                  ;C0AC8E|6B      |      ;

CODE_C0AC8F:
PHX                                  ;C0AC8F|DA      |      ;
LDA.W $06B2                          ;C0AC90|ADB206  |8106B2;
BRA CODE_C0AC98                      ;C0AC93|8003    |C0AC98;

CODE_C0AC95:
LDA.W $003E,X                        ;C0AC95|BD3E00  |81003E;

CODE_C0AC98:
TAX                                  ;C0AC98|AA      |      ;
BEQ CODE_C0ACA7                      ;C0AC99|F00C    |C0ACA7;
LDA.W $0016,X                        ;C0AC9B|BD1600  |810016;
BIT.W #$24D0                         ;C0AC9E|89D024  |      ;
BNE CODE_C0AC95                      ;C0ACA1|D0F2    |C0AC95;
db $02,$86,$80,$EE                   ;C0ACA3|        |      ;

CODE_C0ACA7:
PLX                                  ;C0ACA7|FA      |      ;
RTS                                  ;C0ACA8|60      |      ;

CODE_C0ACA9:
PHP                                  ;C0ACA9|08      |      ;
PHX                                  ;C0ACAA|DA      |      ;
REP #$20                             ;C0ACAB|C220    |      ;
LDA.W $06B2                          ;C0ACAD|ADB206  |8106B2;
BRA CODE_C0ACB5                      ;C0ACB0|8003    |C0ACB5;

CODE_C0ACB2:
LDA.W $003E,X                        ;C0ACB2|BD3E00  |81003E;

CODE_C0ACB5:
TAX                                  ;C0ACB5|AA      |      ;
BEQ CODE_C0ACC4                      ;C0ACB6|F00C    |C0ACC4;
LDA.W $0016,X                        ;C0ACB8|BD1600  |810016;
BIT.W #$0020                         ;C0ACBB|892000  |      ;
BEQ CODE_C0ACB2                      ;C0ACBE|F0F2    |C0ACB2;
db $02,$86,$80,$EE                   ;C0ACC0|        |      ;

CODE_C0ACC4:
PLX                                  ;C0ACC4|FA      |      ;
PLP                                  ;C0ACC5|28      |      ;
RTL                                  ;C0ACC6|6B      |      ;

CODE_C0ACC7:
INC.W $039A                          ;C0ACC7|EE9A03  |81039A;
SEP #$20                             ;C0ACCA|E220    |      ;
LDA.B #$F1                           ;C0ACCC|A9F1    |      ;
STA.W APUIO0                          ;C0ACCE|8D4021  |812140;
REP #$20                             ;C0ACD1|C220    |      ;
COP #$27                             ;C0ACD3|0227    |      ;
db $D7,$AC                           ;C0ACD5|        |0000AC;
LDA.W APUIO0                          ;C0ACD7|AD4021  |812140;
AND.W #$00FF                         ;C0ACDA|29FF00  |      ;
CMP.W #$00F1                         ;C0ACDD|C9F100  |      ;
BEQ CODE_C0ACE3                      ;C0ACE0|F001    |C0ACE3;
RTL                                  ;C0ACE2|6B      |      ;

CODE_C0ACE3:
SEP #$20                             ;C0ACE3|E220    |      ;
LDA.B #$01                           ;C0ACE5|A901    |      ;
STA.W APUIO0                          ;C0ACE7|8D4021  |812140;
REP #$20                             ;C0ACEA|C220    |      ;
COP #$27                             ;C0ACEC|0227    |      ;
db $F0,$AC                           ;C0ACEE|        |C0AC9C;
SEP #$20                             ;C0ACF0|E220    |      ;
LDA.W APUIO0                          ;C0ACF2|AD4021  |812140;
REP #$20                             ;C0ACF5|C220    |      ;
BEQ CODE_C0ACFA                      ;C0ACF7|F001    |C0ACFA;
RTL                                  ;C0ACF9|6B      |      ;

CODE_C0ACFA:
INC.W $039A                          ;C0ACFA|EE9A03  |81039A;
SEP #$20                             ;C0ACFD|E220    |      ;
LDA.B #$F0                           ;C0ACFF|A9F0    |      ;
STA.W APUIO0                          ;C0AD01|8D4021  |812140;
REP #$20                             ;C0AD04|C220    |      ;
COP #$27                             ;C0AD06|0227    |      ;
db $0A,$AD                           ;C0AD08|        |      ;
SEP #$20                             ;C0AD0A|E220    |      ;
LDA.W APUIO0                          ;C0AD0C|AD4021  |812140;
REP #$20                             ;C0AD0F|C220    |      ;
BEQ CODE_C0AD14                      ;C0AD11|F001    |C0AD14;
RTL                                  ;C0AD13|6B      |      ;

CODE_C0AD14:
COP #$1B                             ;C0AD14|021B    |      ;
db $1A,$AD,$02,$00                   ;C0AD16|        |      ;
SEP #$20                             ;C0AD1A|E220    |      ;
LDA.B #$FF                           ;C0AD1C|A9FF    |      ;
STA.W APUIO0                          ;C0AD1E|8D4021  |812140;
REP #$20                             ;C0AD21|C220    |      ;
LDA.W $0030,X                        ;C0AD23|BD3000  |810030;
ASL A                                ;C0AD26|0A      |      ;
CLC                                  ;C0AD27|18      |      ;
ADC.W $0030,X                        ;C0AD28|7D3000  |810030;
TAY                                  ;C0AD2B|A8      |      ;
STZ.W $0030,X                        ;C0AD2C|9E3000  |810030;
LDA.W UNREACH_81FB49,Y               ;C0AD2F|B949FB  |81FB49;
STA.B $29                            ;C0AD32|8529    |000029;
STA.W $042D                          ;C0AD34|8D2D04  |81042D;
SEP #$20                             ;C0AD37|E220    |      ;
LDA.W UNREACH_81FB4B,Y               ;C0AD39|B94BFB  |81FB4B;
STA.B $2B                            ;C0AD3C|852B    |00002B;
STA.W $042F                          ;C0AD3E|8D2F04  |81042F;
REP #$20                             ;C0AD41|C220    |      ;
PHX                                  ;C0AD43|DA      |      ;
SEP #$20                             ;C0AD44|E220    |      ;
JSL.L wait_vblank                    ;C0AD46|22B7B182|82B1B7;
JSL.L disable_vblank_interrupt                    ;C0AD4A|22AEB182|82B1AE;
JSL.L CODE_C5C5AC                    ;C0AD4E|22ACC585|85C5AC;
JSL.L wait_vblank                    ;C0AD52|22B7B182|82B1B7;
JSL.L enable_interrupts                    ;C0AD56|22A2B182|82B1A2;
REP #$20                             ;C0AD5A|C220    |      ;
PLX                                  ;C0AD5C|FA      |      ;
COP #$1B                             ;C0AD5D|021B    |      ;
db $63,$AD,$02,$00                   ;C0AD5F|        |0000AD;
SEP #$20                             ;C0AD63|E220    |      ;
LDA.B #$01                           ;C0AD65|A901    |      ;
STA.W APUIO0                          ;C0AD67|8D4021  |812140;
REP #$20                             ;C0AD6A|C220    |      ;
STZ.W $039A                          ;C0AD6C|9C9A03  |81039A;
STZ.W $0398                          ;C0AD6F|9C9803  |810398;
STZ.W $0464                          ;C0AD72|9C6404  |810464;
COP #$86                             ;C0AD75|0286    |      ;
RTL                                  ;C0AD77|6B      |      ;

CODE_C0AD78:
LDA.W $001A,X                        ;C0AD78|BD1A00  |81001A;
BIT.W #$1000                         ;C0AD7B|890010  |      ;
BEQ CODE_C0AD9C                      ;C0AD7E|F01C    |C0AD9C;
db $A9,$58,$02,$9D,$26,$00,$02,$91   ;C0AD80|        |      ;
db $BD,$16,$00,$89,$00,$80,$D0,$01   ;C0AD88|        |000016;
db $6B,$DE,$26,$00,$30,$01,$6B,$22   ;C0AD90|        |      ;
db $D7,$93,$80,$6B                   ;C0AD98|        |000093;

CODE_C0AD9C:
COP #$86                             ;C0AD9C|0286    |      ;
RTL                                  ;C0AD9E|6B      |      ;
TYA                                  ;C0AD9F|98      |      ;
STA.W $001E,X                        ;C0ADA0|9D1E00  |81001E;
STZ.W $0020,X                        ;C0ADA3|9E2000  |810020;
COP #$85                             ;C0ADA6|0285    |      ;
db $CE,$AD,$80                       ;C0ADA8|        |0080AD;
CPY.W #$06B6                         ;C0ADAB|C0B606  |      ;
BEQ CODE_C0ADCB                      ;C0ADAE|F01B    |C0ADCB;
SEP #$20                             ;C0ADB0|E220    |      ;
LDA.B #$80                           ;C0ADB2|A980    |      ;
STA.W $0036,X                        ;C0ADB4|9D3600  |810036;
REP #$20                             ;C0ADB7|C220    |      ;
COP #$91                             ;C0ADB9|0291    |      ;

CODE_C0ADBB:
COP #$82                             ;C0ADBB|0282    |      ;
LDA.W $0016,X                        ;C0ADBD|BD1600  |810016;
BIT.W #$8000                         ;C0ADC0|890080  |      ;
BEQ CODE_C0ADBB                      ;C0ADC3|F0F6    |C0ADBB;
LDY.W $003E,X                        ;C0ADC5|BC3E00  |81003E;
STA.W $0030,Y                        ;C0ADC8|993000  |810030;

CODE_C0ADCB:
COP #$86                             ;C0ADCB|0286    |      ;
RTL                                  ;C0ADCD|6B      |      ;
LDA.W $003C,X                        ;C0ADCE|BD3C00  |81003C;
STA.W $0030,X                        ;C0ADD1|9D3000  |810030;
LDA.W PlayerPosReal.x                          ;C0ADD4|AD7403  |810374;
SEC                                  ;C0ADD7|38      |      ;
SBC.W $0000,X                        ;C0ADD8|FD0000  |810000;
BMI CODE_C0ADFC                      ;C0ADDB|301F    |C0ADFC;
STA.B $16                            ;C0ADDD|8516    |000016;
LDA.W PlayerPosReal.y                          ;C0ADDF|AD7603  |810376;
SEC                                  ;C0ADE2|38      |      ;
SBC.W $0002,X                        ;C0ADE3|FD0200  |810002;
BMI CODE_C0ADF0                      ;C0ADE6|3008    |C0ADF0;
STA.B $18                            ;C0ADE8|8518    |000018;
CMP.B $16                            ;C0ADEA|C516    |000016;
BCS CODE_C0AE5B                      ;C0ADEC|B06D    |C0AE5B;
BRA CODE_C0AE49                      ;C0ADEE|8059    |C0AE49;

CODE_C0ADF0:
EOR.W #$FFFF                         ;C0ADF0|49FFFF  |      ;
INC A                                ;C0ADF3|1A      |      ;
STA.B $18                            ;C0ADF4|8518    |000018;
CMP.B $16                            ;C0ADF6|C516    |000016;
BCS CODE_C0AE22                      ;C0ADF8|B028    |C0AE22;
BRA CODE_C0AE37                      ;C0ADFA|803B    |C0AE37;

CODE_C0ADFC:
EOR.W #$FFFF                         ;C0ADFC|49FFFF  |      ;
INC A                                ;C0ADFF|1A      |      ;
STA.B $16                            ;C0AE00|8516    |000016;
LDA.W PlayerPosReal.y                          ;C0AE02|AD7603  |810376;
SEC                                  ;C0AE05|38      |      ;
SBC.W $0002,X                        ;C0AE06|FD0200  |810002;
BMI CODE_C0AE13                      ;C0AE09|3008    |C0AE13;
STA.B $18                            ;C0AE0B|8518    |000018;
CMP.B $16                            ;C0AE0D|C516    |000016;
BCS CODE_C0AE6D                      ;C0AE0F|B05C    |C0AE6D;
BRA CODE_C0AE7F                      ;C0AE11|806C    |C0AE7F;

CODE_C0AE13:
EOR.W #$FFFF                         ;C0AE13|49FFFF  |      ;
INC A                                ;C0AE16|1A      |      ;
STA.B $18                            ;C0AE17|8518    |000018;
CMP.B $16                            ;C0AE19|C516    |000016;
BCC CODE_C0AE20                      ;C0AE1B|9003    |C0AE20;
BRL CODE_C0AEA3                      ;C0AE1D|828300  |C0AEA3;

CODE_C0AE20:
BRA CODE_C0AE91                      ;C0AE20|806F    |C0AE91;

CODE_C0AE22:
JSR.W CODE_C0AED4                    ;C0AE22|20D4AE  |C0AED4;
COP #$91                             ;C0AE25|0291    |      ;
DEC.W $0002,X                        ;C0AE27|DE0200  |810002;
DEC.W $0010,X                        ;C0AE2A|DE1000  |810010;
BEQ CODE_C0AE32                      ;C0AE2D|F003    |C0AE32;
BRL CODE_C0AEBB                      ;C0AE2F|828900  |C0AEBB;

CODE_C0AE32:
INC.W $0000,X                        ;C0AE32|FE0000  |810000;
BRA CODE_C0AEB5                      ;C0AE35|807E    |C0AEB5;

CODE_C0AE37:
JSR.W CODE_C0AEDC                    ;C0AE37|20DCAE  |C0AEDC;
COP #$91                             ;C0AE3A|0291    |      ;
INC.W $0000,X                        ;C0AE3C|FE0000  |810000;
DEC.W $0010,X                        ;C0AE3F|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AE42|D077    |C0AEBB;
DEC.W $0002,X                        ;C0AE44|DE0200  |810002;
BRA CODE_C0AEB5                      ;C0AE47|806C    |C0AEB5;

CODE_C0AE49:
JSR.W CODE_C0AEDC                    ;C0AE49|20DCAE  |C0AEDC;
COP #$91                             ;C0AE4C|0291    |      ;
INC.W $0000,X                        ;C0AE4E|FE0000  |810000;
DEC.W $0010,X                        ;C0AE51|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AE54|D065    |C0AEBB;
INC.W $0002,X                        ;C0AE56|FE0200  |810002;
BRA CODE_C0AEB5                      ;C0AE59|805A    |C0AEB5;

CODE_C0AE5B:
JSR.W CODE_C0AED4                    ;C0AE5B|20D4AE  |C0AED4;
COP #$91                             ;C0AE5E|0291    |      ;
INC.W $0002,X                        ;C0AE60|FE0200  |810002;
DEC.W $0010,X                        ;C0AE63|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AE66|D053    |C0AEBB;
INC.W $0000,X                        ;C0AE68|FE0000  |810000;
BRA CODE_C0AEB5                      ;C0AE6B|8048    |C0AEB5;

CODE_C0AE6D:
JSR.W CODE_C0AED4                    ;C0AE6D|20D4AE  |C0AED4;
COP #$91                             ;C0AE70|0291    |      ;
INC.W $0002,X                        ;C0AE72|FE0200  |810002;
DEC.W $0010,X                        ;C0AE75|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AE78|D041    |C0AEBB;
DEC.W $0000,X                        ;C0AE7A|DE0000  |810000;
BRA CODE_C0AEB5                      ;C0AE7D|8036    |C0AEB5;

CODE_C0AE7F:
JSR.W CODE_C0AEDC                    ;C0AE7F|20DCAE  |C0AEDC;
COP #$91                             ;C0AE82|0291    |      ;
DEC.W $0000,X                        ;C0AE84|DE0000  |810000;
DEC.W $0010,X                        ;C0AE87|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AE8A|D02F    |C0AEBB;
INC.W $0002,X                        ;C0AE8C|FE0200  |810002;
BRA CODE_C0AEB5                      ;C0AE8F|8024    |C0AEB5;

CODE_C0AE91:
JSR.W CODE_C0AEDC                    ;C0AE91|20DCAE  |C0AEDC;
COP #$91                             ;C0AE94|0291    |      ;
DEC.W $0000,X                        ;C0AE96|DE0000  |810000;
DEC.W $0010,X                        ;C0AE99|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AE9C|D01D    |C0AEBB;
DEC.W $0002,X                        ;C0AE9E|DE0200  |810002;
BRA CODE_C0AEB5                      ;C0AEA1|8012    |C0AEB5;

CODE_C0AEA3:
JSR.W CODE_C0AED4                    ;C0AEA3|20D4AE  |C0AED4;
COP #$91                             ;C0AEA6|0291    |      ;
DEC.W $0002,X                        ;C0AEA8|DE0200  |810002;
DEC.W $0010,X                        ;C0AEAB|DE1000  |810010;
BNE CODE_C0AEBB                      ;C0AEAE|D00B    |C0AEBB;
DEC.W $0000,X                        ;C0AEB0|DE0000  |810000;
BRA CODE_C0AEB5                      ;C0AEB3|8000    |C0AEB5;

CODE_C0AEB5:
LDA.W $0012,X                        ;C0AEB5|BD1200  |810012;
STA.W $0010,X                        ;C0AEB8|9D1000  |810010;

CODE_C0AEBB:
LDA.W $003C,X                        ;C0AEBB|BD3C00  |81003C;
CMP.W $0030,X                        ;C0AEBE|DD3000  |810030;
BNE CODE_C0AED1                      ;C0AEC1|D00E    |C0AED1;
TAY                                  ;C0AEC3|A8      |      ;
LDA.W $0000,X                        ;C0AEC4|BD0000  |810000;
STA.W $0000,Y                        ;C0AEC7|990000  |810000;
LDA.W $0002,X                        ;C0AECA|BD0200  |810002;
STA.W $0002,Y                        ;C0AECD|990200  |810002;
RTL                                  ;C0AED0|6B      |      ;

CODE_C0AED1:
COP #$86                             ;C0AED1|0286    |      ;
RTL                                  ;C0AED3|6B      |      ;

CODE_C0AED4:
SEP #$20                             ;C0AED4|E220    |      ;
LDY.B $18                            ;C0AED6|A418    |000018;
LDA.B $16                            ;C0AED8|A516    |000016;
BRA CODE_C0AEE2                      ;C0AEDA|8006    |C0AEE2;

CODE_C0AEDC:
SEP #$20                             ;C0AEDC|E220    |      ;
LDY.B $16                            ;C0AEDE|A416    |000016;
LDA.B $18                            ;C0AEE0|A518    |000018;

CODE_C0AEE2:
BNE CODE_C0AEE5                      ;C0AEE2|D001    |C0AEE5;
INC A                                ;C0AEE4|1A      |      ;

CODE_C0AEE5:
JSL.L divide                    ;C0AEE5|22E8B182|82B1E8;
REP #$20                             ;C0AEE9|C220    |      ;
AND.W #$00FF                         ;C0AEEB|29FF00  |      ;
BNE CODE_C0AEF1                      ;C0AEEE|D001    |C0AEF1;
db $1A                               ;C0AEF0|        |      ;

CODE_C0AEF1:
STA.W $0010,X                        ;C0AEF1|9D1000  |810010;
STA.W $0012,X                        ;C0AEF4|9D1200  |810012;
RTS                                  ;C0AEF7|60      |      ;
db $02,$A8,$00,$80,$8E,$A9,$00,$40   ;C0AEF8|        |      ;
db $9D,$16,$00,$02,$A4,$AD,$72,$03   ;C0AF00|        |000016;
db $9D,$1C,$00,$02,$80,$07,$02,$82   ;C0AF08|        |00001C;
db $80,$F9                           ;C0AF10|        |C0AF0B;
COP #$A4                             ;C0AF12|02A4    |      ;
COP #$80                             ;C0AF14|0280    |      ;
db $04                               ;C0AF16|        |000002;
COP #$82                             ;C0AF17|0282    |      ;
COP #$81                             ;C0AF19|0281    |      ;
db $09,$04                           ;C0AF1B|        |      ;
COP #$83                             ;C0AF1D|0283    |      ;
COP #$86                             ;C0AF1F|0286    |      ;
RTL                                  ;C0AF21|6B      |      ;
COP #$A4                             ;C0AF22|02A4    |      ;
COP #$80                             ;C0AF24|0280    |      ;
db $05                               ;C0AF26|        |000002;
COP #$82                             ;C0AF27|0282    |      ;
COP #$81                             ;C0AF29|0281    |      ;
db $0A,$04                           ;C0AF2B|        |      ;
COP #$83                             ;C0AF2D|0283    |      ;
COP #$86                             ;C0AF2F|0286    |      ;
RTL                                  ;C0AF31|6B      |      ;
COP #$A4                             ;C0AF32|02A4    |      ;
COP #$80                             ;C0AF34|0280    |      ;
db $06                               ;C0AF36|        |000002;
COP #$82                             ;C0AF37|0282    |      ;
db $02,$81,$0B,$04,$02,$83,$02,$86   ;C0AF39|        |      ;
db $6B                               ;C0AF41|        |      ;

CODE_C0AF42:
PHP                                  ;C0AF42|08      |      ;
PHY                                  ;C0AF43|5A      |      ;
REP #$20                             ;C0AF44|C220    |      ;
BRK #$4D                             ;C0AF46|004D    |      ;
LDA.W $001E,X                        ;C0AF48|BD1E00  |81001E;
CMP.W #$0006                         ;C0AF4B|C90600  |      ;
BEQ CODE_C0AF69                      ;C0AF4E|F019    |C0AF69;
CMP.W #$0005                         ;C0AF50|C90500  |      ;
BEQ CODE_C0AF6E                      ;C0AF53|F019    |C0AF6E;
CMP.W #$0004                         ;C0AF55|C90400  |      ;
BEQ CODE_C0AF73                      ;C0AF58|F019    |C0AF73;
db $C9,$0B,$00,$F0,$0A,$C9,$0A,$00   ;C0AF5A|        |      ;
db $F0,$0A,$C9,$09,$00,$F0,$0A       ;C0AF62|        |C0AF6E;

CODE_C0AF69:
LDA.W #$0010                         ;C0AF69|A91000  |      ;
BRA CODE_C0AF76                      ;C0AF6C|8008    |C0AF76;

CODE_C0AF6E:
LDA.W #$0005                         ;C0AF6E|A90500  |      ;
BRA CODE_C0AF76                      ;C0AF71|8003    |C0AF76;

CODE_C0AF73:
LDA.W #$0001                         ;C0AF73|A90100  |      ;

CODE_C0AF76:
JSL.L AddGold                    ;C0AF76|22D98583|8385D9;
LDA.W #UpdateHud.Gold                         ;C0AF7A|A91000  |      ;
TSB.W display_hud_bitfield                          ;C0AF7D|0C3203  |810332;
LDA.W $0016,X                        ;C0AF80|BD1600  |810016;
ORA.W #$2000                         ;C0AF83|090020  |      ;
STA.W $0016,X                        ;C0AF86|9D1600  |810016;
COP #$86                             ;C0AF89|0286    |      ;
PLY                                  ;C0AF8B|7A      |      ;
PLP                                  ;C0AF8C|28      |      ;
RTL                                  ;C0AF8D|6B      |      ;

Player_LevelUp:
    LDA.W player_level
    CMP.W #!PlayerMaxLevel
    BCC + : BRL .end : +

    ASL #2
    TAY
    LDA.W ExpTable.lower10k, Y
    STA.W ExpNeededForNextLevel.upper10k
    LDA.W ExpTable.upper10k, Y
    STA.W ExpNeededForNextLevel.lower10k
    %CopSetScriptAddrToNextInstruction()
    LDA.W PlayerExp.lower10k
    SEC
    SBC.W ExpNeededForNextLevel.lower10k
    LDA.W PlayerExp.upper10k
    SBC.W ExpNeededForNextLevel.upper10k
    BCS + : RTL : +

; next level reached
; increase max health
    LDA.W player_max_health
    CLC
    ADC.W #!HealthGainPerLvl
    CMP.W #!PlayerMaxHealth+1
    BCC + : LDA.W #!PlayerMaxHealth : +
    STA.W player_max_health
    LDA.W player_current_health
    CLC
    ADC.W #!HealthGainPerLvl
    CMP.W #!PlayerMaxHealth+1
    BCC + : LDA.W #!PlayerMaxHealth : +
    STA.W player_current_health
    %CopRestoreToFullHealth()
; increase player level and also ascii representation
    INC.W player_level
    SED
    LDA.W player_level_ascii
    CLC
    ADC.W #1
    STA.W player_level_ascii
    CLD
; on every even level increase strength, on every odd level increase defense
    LSR
    BCS .inc_def
    INC.W player_strength_from_level
    BRA +
.inc_def:
    INC.W player_defense_from_level
+
; update HUD
    LDA.W #!UpdateHud_All
    TSB.W display_hud_bitfield
; get next exp needed and store it
    LDA.W player_level
    ASL #2
    TAY
    LDA.W ExpTable.lower10k, Y
    STA.W ExpNeededForNextLevel.upper10k
    LDA.W ExpTable.upper10k, Y
    STA.W ExpNeededForNextLevel.lower10k
; play sound and display message on screen three times
    %PlaySound(!Sound_NextLevel)
    %CopLoopStart(3)
        PHX
        LDY.W #txt_next_level
        JSL.L printOsdStringFromBank2
        PLX
        %CopJumpAfterNoFramesPassed(+, 20) : +
        PHX
        LDY.W #txt_delete_next_level
        JSL.L printOsdStringFromBank2
        PLX
        %CopJumpAfterNoFramesPassed(+, 10) : +
    %CopLoopEnd()
; do loop to the start of the function to increase the level further if needed
    BRL Player_LevelUp

.end:
    %Cop86()
    RTL

check_player_dead:
    PHP
    REP #$20
    LDX.W _039E
    LDA.W $0016, X
    BIT.W #$0400
    BNE .end
; Load current health as well has health to restore and check if we're dead
    LDA.W player_current_health
    ORA.W player_health_restore
    BNE .end
    %CopJumpIfItemIsNotEquipped(Items.MedicalHerb, .no_herbs)
    ; revive player if herbs are equipped
    LDA.W player_max_health
    STA.W player_health_restore
    %CopRemoveItem(Items.MedicalHerb)
    BRA .end
.no_herbs:
    %CopJumpIfItemIsNotEquipped(Items.StrangeBottle, .no_bottle)
    %CopRemoveItem(Items.StrangeBottle)
    BRA .kill_player
.no_bottle:
    %CopJumpIfItemIsNotEquipped(Items.MagicBell, +)
    BRA .kill_player
+
; if neither herbs, bottle nor bell is equipped, remove all gold and kill the player
    STZ.W PlayerGold.lower10k
    STZ.W PlayerGold.upper10k
.kill_player: ; jump here if you want to kill the player, but keep his gold
    LDA.W $0016, X
    AND.W #$F7FF
    STA.W $0016, X
    LDA.W $0016, X
    ORA.W #$0400
    STA.W $0016, X
    LDA.W #Key16.A|Key16.Select
    STA.W button_mask
    INC.W player_died
.end:
    PLP

Ax_Script_locret:
    RTL                                  ;C0B096|6B      |      ;

CODE_C0B097:
    SEP #$20
    LDA.B #$80
    STA.W $36, X
    REP #$20
    LDA.W $16, X
    AND.W #$DFF7
    STA.W $16, X
    %CopA8($8E8000)
    LDA.W $1C, X
    STA.W $32, X
    AND.W #$FEFF
    STA.W $1C, X
    %CopMakeNpcUnpassable()

db $02,$80,$0D   ;C0B0B7|        |00001C;
db $02,$82,$BD,$34,$00,$0A,$0A,$0A   ;C0B0BF|        |      ;
db $0A,$0A,$A8,$B9,$2B,$BA,$A0,$DE   ;C0B0C7|        |      ;
db $1A,$22,$CA,$82,$83,$90,$E6,$02   ;C0B0CF|        |      ;
db $16,$BD,$34,$00,$A0,$9E,$1A,$22   ;C0B0D7|        |0000BD;
db $70,$82,$83,$A0,$DE,$1A,$22,$70   ;C0B0DF|        |C0B063;
db $82,$83,$DA,$AA,$BF,$03,$02,$7F   ;C0B0E7|        |C08B6D;
db $29,$BF,$FF,$9F,$03,$02,$7F,$FA   ;C0B0EF|        |      ;
db $02,$A8,$00,$38,$7E,$BD,$32,$00   ;C0B0F7|        |      ;
db $9D,$1C,$00,$BC,$38,$00,$E2,$20   ;C0B0FF|        |00001C;
db $B9,$05,$80,$9D,$1E,$00,$B9,$0A   ;C0B107|        |008005;
db $80,$9D,$24,$00,$B9,$0D,$80,$9D   ;C0B10F|        |C0B0AE;
db $36,$00,$C2,$20,$B9,$06,$80,$09   ;C0B117|        |000000;
db $00,$80,$29,$FF,$DF,$9D,$16,$00   ;C0B11F|        |      ;
db $B9,$08,$80,$9D,$22,$00,$B9,$0B   ;C0B127|        |008008;
db $80,$9D,$18,$00,$9E,$30,$00,$9E   ;C0B12F|        |C0B0CE;
db $20,$00,$22,$1F,$89,$80,$9E,$14   ;C0B137|        |C02200;
db $00,$9E,$04,$00,$9E,$06,$00,$6B   ;C0B13F|        |      ;
db $DA,$AE,$A2,$03,$BD,$00,$00,$38   ;C0B147|        |      ;
db $E9,$30,$00,$10,$03,$A9,$00,$00   ;C0B14F|        |      ;
db $85,$16,$BD,$00,$00,$18,$69,$30   ;C0B157|        |000016;
db $00,$38,$E5,$16,$85,$1A,$30,$57   ;C0B15F|        |      ;
db $BD,$02,$00,$38,$E9,$30,$00,$10   ;C0B167|        |000002;
db $03,$A9,$00,$00,$85,$18,$BD,$02   ;C0B16F|        |0000A9;
db $00,$18,$69,$30,$00,$38,$E5,$18   ;C0B177|        |      ;
db $85,$1C,$30,$3B,$AD,$B2,$06,$80   ;C0B17F|        |00001C;
db $03,$BD,$3E,$00,$AA,$F0,$30,$BD   ;C0B187|        |0000BD;
db $16,$00,$C9,$01,$03,$D0,$F2,$BD   ;C0B18F|        |000000;
db $00,$00,$38,$E5,$16,$C5,$1A,$B0   ;C0B197|        |      ;
db $E8,$BD,$02,$00,$38,$E5,$18,$C5   ;C0B19F|        |      ;
db $1C,$B0,$DE,$E2,$20,$A9,$80,$9D   ;C0B1A7|        |00DEB0;
db $36,$00,$C2,$20,$A9,$18,$AA,$9D   ;C0B1AF|        |000000;
db $18,$00,$9E,$14,$00,$80,$CA,$FA   ;C0B1B7|        |      ;
db $6B                               ;C0B1BF|        |      ;

CODE_C0B1C0:
LDA.W #$FFFF                         ;C0B1C0|A9FFFF  |      ;
STA.W button_mask                          ;C0B1C3|8D2603  |810326;
COP #$1B                             ;C0B1C6|021B    |      ;
db $CC,$B1,$01,$00                   ;C0B1C8|        |0001B1;
LDA.W $1C7B                          ;C0B1CC|AD7B1C  |811C7B;
BEQ CODE_C0B1D2                      ;C0B1CF|F001    |C0B1D2;
db $6B                               ;C0B1D1|        |      ;

CODE_C0B1D2:
BRK #$83                             ;C0B1D2|0083    |      ;
LDA.W $0030,X                        ;C0B1D4|BD3000  |810030;
JSL.L CODE_C288BB                    ;C0B1D7|22BB8882|8288BB;
COP #$27                             ;C0B1DB|0227    |      ;
db $DF,$B1                           ;C0B1DD|        |269CB1;
STZ.W button_mask                          ;C0B1DF|9C2603  |810326;
COP #$86                             ;C0B1E2|0286    |      ;
RTL                                  ;C0B1E4|6B      |      ;
CODE_C0B1E5:
STZ.W $03B4                          ;C0B1E5|9CB403  |8103B4;
INC.W $0464                          ;C0B1E8|EE6404  |810464;
STX.W $039C                          ;C0B1EB|8E9C03  |81039C;
COP #$85                             ;C0B1EE|0285    |      ;
db $C0,$B1,$80                       ;C0B1F0|        |      ;
LDA.W #$0000                         ;C0B1F3|A90000  |      ;
STA.W $0030,Y                        ;C0B1F6|993000  |810030;

CODE_C0B1F9:
COP #$80                             ;C0B1F9|0280    |      ;
db $00                               ;C0B1FB|        |      ;
COP #$82                             ;C0B1FC|0282    |      ;

CODE_C0B1FE:
LDA.W PlayerPosReal.y                          ;C0B1FE|AD7603  |810376;
CMP.W #$0070                         ;C0B201|C97000  |      ;
BCS CODE_C0B209                      ;C0B204|B003    |C0B209;
BRL CODE_C0B2EA                      ;C0B206|82E100  |C0B2EA;

CODE_C0B209:
COP #$9F                             ;C0B209|029F    |      ;
db $10,$00                           ;C0B20B|        |C0B20D;
COP #$9A                             ;C0B20D|029A    |      ;
db $10,$00,$48,$B2,$17,$B2,$48,$B2   ;C0B20F|        |C0B211;
COP #$9F                             ;C0B217|029F    |      ;
db $F0,$FF                           ;C0B219|        |C0B21A;
COP #$80                             ;C0B21B|0280    |      ;
db $0E                               ;C0B21D|        |008202;
COP #$82                             ;C0B21E|0282    |      ;
COP #$B2                             ;C0B220|02B2    |      ;
db $80,$B3,$80,$08,$00,$E8,$FF,$00   ;C0B222|        |C0B1D7;
db $02                               ;C0B22A|        |      ;
COP #$B2                             ;C0B22B|02B2    |      ;
db $91,$B3,$80,$08,$00,$E8,$FF,$00   ;C0B22D|        |0000B3;
db $02                               ;C0B235|        |      ;
COP #$B2                             ;C0B236|02B2    |      ;
db $9F,$B3,$80,$08,$00,$E8,$FF,$00   ;C0B238|        |0880B3;
db $02                               ;C0B240|        |      ;
COP #$80                             ;C0B241|0280    |      ;
db $16                               ;C0B243|        |000002;
COP #$82                             ;C0B244|0282    |      ;
BRA CODE_C0B1F9                      ;C0B246|80B1    |C0B1F9;
COP #$9A                             ;C0B248|029A    |      ;
db $50,$00,$52,$B2,$C8,$B2,$52,$B2   ;C0B24A|        |C0B24C;
db $02,$9A,$70,$00,$C8,$B2,$5C,$B2   ;C0B252|        |      ;
db $C8,$B2,$02,$9A,$00,$00,$66,$B2   ;C0B25A|        |      ;
db $97,$B2,$97,$B2,$02,$9F,$F0,$FF   ;C0B262|        |0000B2;
db $02,$80,$0D,$02,$82,$02,$B2,$B7   ;C0B26A|        |      ;
db $B3,$80,$FC,$FF,$E6,$FF,$00,$02   ;C0B272|        |000080;
db $02,$80,$17,$02,$82,$02,$80,$0D   ;C0B27A|        |      ;
db $02,$82,$02,$B2,$B7,$B3,$80,$FC   ;C0B282|        |      ;
db $FF,$E6,$FF,$00,$02,$02,$80,$17   ;C0B28A|        |00FFE6;
db $02,$82,$82,$67,$FF,$02,$9F,$F0   ;C0B292|        |      ;
db $FF,$02,$80,$0F,$02,$82,$02,$B2   ;C0B29A|        |0F8002;
db $CC,$B3,$80,$14,$00,$E6,$FF,$00   ;C0B2A2|        |0080B3;
db $02,$02,$80,$18,$02,$82,$02,$80   ;C0B2AA|        |      ;
db $0F,$02,$82,$02,$B2,$CC,$B3,$80   ;C0B2B2|        |028202;
db $14,$00,$E6,$FF,$00,$02,$02,$80   ;C0B2BA|        |000000;
db $18,$02,$82,$82,$36,$FF           ;C0B2C2|        |      ;
COP #$9A                             ;C0B2C8|029A    |      ;
db $00,$00,$D2,$B2,$DE,$B2,$DE,$B2   ;C0B2CA|        |      ;
COP #$9F                             ;C0B2D2|029F    |      ;
db $F0,$FF                           ;C0B2D4|        |C0B2D5;
COP #$80                             ;C0B2D6|0280    |      ;
db $07                               ;C0B2D8|        |000002;
COP #$82                             ;C0B2D9|0282    |      ;
BRL CODE_C0B1FE                      ;C0B2DB|8220FF  |C0B1FE;
db $02,$9F,$F0,$FF,$02,$80,$05,$02   ;C0B2DE|        |      ;
db $82,$82,$14,$FF                   ;C0B2E6|        |C0C76B;

CODE_C0B2EA:
COP #$9F                             ;C0B2EA|029F    |      ;
db $10,$00                           ;C0B2EC|        |C0B2EE;
COP #$9A                             ;C0B2EE|029A    |      ;
db $40,$00,$68,$B3,$F8,$B2,$74,$B3   ;C0B2F0|        |      ;
COP #$9A                             ;C0B2F8|029A    |      ;
db $00,$00,$02,$B3,$35,$B3,$35,$B3   ;C0B2FA|        |      ;
COP #$9F                             ;C0B302|029F    |      ;
db $F0,$FF                           ;C0B304|        |C0B305;
LDA.W $0016,X                        ;C0B306|BD1600  |810016;
ORA.W #$0002                         ;C0B309|090200  |      ;
STA.W $0016,X                        ;C0B30C|9D1600  |810016;
COP #$85                             ;C0B30F|0285    |      ;
db $F1,$B3,$80                       ;C0B311|        |0000B3;
COP #$80                             ;C0B314|0280    |      ;
db $09                               ;C0B316|        |      ;
COP #$82                             ;C0B317|0282    |      ;
COP #$B2                             ;C0B319|02B2    |      ;
db $E1,$B3,$80,$D8,$FF,$E8,$FF,$00   ;C0B31B|        |0000B3;
db $02                               ;C0B323|        |      ;
COP #$80                             ;C0B324|0280    |      ;
db $0A                               ;C0B326|        |      ;
COP #$82                             ;C0B327|0282    |      ;
LDA.W $0016,X                        ;C0B329|BD1600  |810016;
AND.W #$FFFD                         ;C0B32C|29FDFF  |      ;
STA.W $0016,X                        ;C0B32F|9D1600  |810016;
BRL CODE_C0B1FE                      ;C0B332|82C9FE  |C0B1FE;
db $02,$9F,$F0,$FF,$BD,$16,$00,$09   ;C0B335|        |      ;
db $02,$00,$9D,$16,$00,$02,$85,$F1   ;C0B33D|        |      ;
db $B3,$80,$02,$80,$0B,$02,$82,$02   ;C0B345|        |000080;
db $B2,$E9,$B3,$80,$28,$00,$E8,$FF   ;C0B34D|        |0000E9;
db $00,$02,$02,$80,$0C,$02,$82,$BD   ;C0B355|        |      ;
db $16,$00,$29,$FD,$FF,$9D,$16,$00   ;C0B35D|        |000000;
db $82,$96,$FE                       ;C0B365|        |C0B1FE;
COP #$9F                             ;C0B368|029F    |      ;
db $F0,$FF                           ;C0B36A|        |C0B36B;
COP #$80                             ;C0B36C|0280    |      ;
db $08                               ;C0B36E|        |      ;
COP #$82                             ;C0B36F|0282    |      ;
BRL CODE_C0B1FE                      ;C0B371|828AFE  |C0B1FE;
db $02,$9F,$F0,$FF,$02,$80,$06,$02   ;C0B374|        |      ;
db $82,$82,$7E,$FE                   ;C0B37C|        |C03201;
COP #$A3                             ;C0B380|02A3    |      ;
COP #$A2                             ;C0B382|02A2    |      ;
db $30                               ;C0B384|        |C0B388;
COP #$80                             ;C0B385|0280    |      ;
db $10                               ;C0B387|        |C0B38B;
COP #$82                             ;C0B388|0282    |      ;
COP #$80                             ;C0B38A|0280    |      ;
db $1B                               ;C0B38C|        |      ;
COP #$82                             ;C0B38D|0282    |      ;
BRA CODE_C0B3AE                      ;C0B38F|801D    |C0B3AE;
COP #$A3                             ;C0B391|02A3    |      ;
COP #$A2                             ;C0B393|02A2    |      ;
db $30                               ;C0B395|        |C0B397;
BRK #$61                             ;C0B396|0061    |      ;
COP #$80                             ;C0B398|0280    |      ;
db $10                               ;C0B39A|        |C0B39E;
COP #$82                             ;C0B39B|0282    |      ;
BRA CODE_C0B3AE                      ;C0B39D|800F    |C0B3AE;
COP #$A3                             ;C0B39F|02A3    |      ;
COP #$A2                             ;C0B3A1|02A2    |      ;
db $30                               ;C0B3A3|        |C0B3A7;
COP #$80                             ;C0B3A4|0280    |      ;
db $10                               ;C0B3A6|        |C0B3AA;
COP #$82                             ;C0B3A7|0282    |      ;
COP #$80                             ;C0B3A9|0280    |      ;
db $1C                               ;C0B3AB|        |008202;
COP #$82                             ;C0B3AC|0282    |      ;

CODE_C0B3AE:
COP #$81                             ;C0B3AE|0281    |      ;
db $13,$0C                           ;C0B3B0|        |00000C;
COP #$83                             ;C0B3B2|0283    |      ;
COP #$86                             ;C0B3B4|0286    |      ;
RTL                                  ;C0B3B6|6B      |      ;
db $02,$A3,$02,$A2,$30,$00,$61,$02   ;C0B3B7|        |      ;
db $80,$11,$02,$82,$02,$81,$14,$0C   ;C0B3BF|        |C0B3D2;
db $02,$83,$02,$86,$6B,$02,$A3,$02   ;C0B3C7|        |      ;
db $A2,$30,$00,$61,$02,$80,$12,$02   ;C0B3CF|        |      ;
db $82,$02,$81,$15,$0C,$02,$83,$02   ;C0B3D7|        |C034DC;
db $86,$6B                           ;C0B3DF|        |00006B;
COP #$80                             ;C0B3E1|0280    |      ;
db $19                               ;C0B3E3|        |008202;
COP #$82                             ;C0B3E4|0282    |      ;
COP #$86                             ;C0B3E6|0286    |      ;
RTL                                  ;C0B3E8|6B      |      ;
db $02,$80,$1A,$02,$82,$02,$86,$6B   ;C0B3E9|        |      ;
COP #$A8                             ;C0B3F1|02A8    |      ;
db $00,$80,$8D                       ;C0B3F3|        |      ;
COP #$92                             ;C0B3F6|0292    |      ;
db $4E                               ;C0B3F8|        |009402;
COP #$94                             ;C0B3F9|0294    |      ;
COP #$86                             ;C0B3FB|0286    |      ;
RTL                                  ;C0B3FD|6B      |      ;
db $9C,$B4,$03,$EE,$64,$04,$BD,$16   ;C0B3FE|        |0003B4;
db $00,$09,$00,$02,$9D,$16,$00,$02   ;C0B406|        |      ;
db $85,$C0,$B1,$80,$A9,$01,$00,$99   ;C0B40E|        |0000C0;
db $30,$00,$02,$A5,$22,$B4,$6A,$B7   ;C0B416|        |C0B418;
db $75,$BA,$75,$BA,$02,$80,$21,$02   ;C0B41E|        |0000BA;
db $82,$02,$91,$8A,$18,$69,$80,$00   ;C0B426|        |C0452B;
db $CD,$9C,$03,$F0,$01,$6B,$02,$91   ;C0B42E|        |00039C;
db $AC,$9C,$03,$B9,$16,$00,$89,$00   ;C0B436|        |00039C;
db $04,$D0,$01,$6B,$02,$1B,$48,$B4   ;C0B43E|        |0000D0;
db $08,$00,$8E,$9C,$03,$02,$91,$02   ;C0B446|        |      ;
db $0C,$00,$04,$54,$B4,$6B,$02,$85   ;C0B44E|        |000400;
db $54,$BE,$80,$02,$09,$05,$19,$E2   ;C0B456|        |      ;
db $20,$9C,$5E,$1A,$C2,$20,$BD,$16   ;C0B45E|        |C05E9C;
db $00,$29,$FF,$FC,$9D,$16,$00,$9C   ;C0B466|        |      ;
db $39,$04,$02,$1B,$B7,$B4,$3C,$00   ;C0B46E|        |000204;
db $02,$9B,$60,$00,$80,$B4,$80,$B4   ;C0B476|        |      ;
db $2C,$B6,$02,$9A,$20,$00,$22,$B6   ;C0B47E|        |0002B6;
db $F8,$B4,$39,$B5,$02,$07,$05,$99   ;C0B486|        |      ;
db $A3,$B4,$02,$24,$A3,$B4,$02,$09   ;C0B48E|        |0000B4;
db $05,$99,$02,$85,$99,$B6,$80,$02   ;C0B496|        |000099;
db $1B,$A3,$B4,$28,$00,$02,$9A,$60   ;C0B49E|        |      ;
db $00,$59,$B6,$AD,$B4,$AD,$B4,$02   ;C0B4A6|        |      ;
db $9B,$10,$00,$43,$B5,$4D,$B5,$8B   ;C0B4AE|        |      ;
db $B5,$02,$9B,$60,$00,$3B,$B6,$C1   ;C0B4B6|        |000002;
db $B4,$C1,$B4,$02,$9A,$20,$00,$EA   ;C0B4BE|        |0000C1;
db $B5,$9F,$B5,$95,$B5,$02,$07,$05   ;C0B4C6|        |00009F;
db $99,$E4,$B4,$02,$23,$E4,$B4,$02   ;C0B4CE|        |00B4E4;
db $09,$05,$99,$02,$85,$F7,$B6,$80   ;C0B4D6|        |      ;
db $02,$1B,$E4,$B4,$28,$00,$02,$9A   ;C0B4DE|        |      ;
db $60,$00,$EE,$B4,$EE,$B4,$4A,$B6   ;C0B4E6|        |      ;
db $02,$9B,$10,$00,$18,$B6,$F4,$B5   ;C0B4EE|        |      ;
db $E0,$B5,$02,$97,$02,$80,$2C,$02   ;C0B4F6|        |      ;
db $82,$02,$9B,$00,$00,$09,$B5,$12   ;C0B4FE|        |C05003;
db $B5,$12,$B5,$02,$9D,$1D,$02,$9E   ;C0B506|        |000012;
db $1C,$B5,$80,$ED,$02,$9D,$2D,$02   ;C0B50E|        |0080B5;
db $9E,$1C,$B5,$82,$5A,$FF,$02,$9A   ;C0B516|        |00B51C;
db $00,$00,$26,$B5,$26,$B5,$30,$B5   ;C0B51E|        |      ;
db $02,$97,$02,$80,$0B,$02,$82,$82   ;C0B526|        |      ;
db $C4,$00,$02,$96,$02,$80,$0B,$02   ;C0B52E|        |000000;
db $82,$80,$14,$02,$96,$02,$80,$0B   ;C0B536|        |C0C9B9;
db $02,$82,$82,$0A,$00,$02,$96,$02   ;C0B53E|        |      ;
db $80,$09,$02,$82,$82,$AB,$FF,$02   ;C0B546|        |C0B551;
db $96,$02,$80,$2A,$02,$82,$02,$9A   ;C0B54E|        |000002;
db $00,$00,$68,$B5,$68,$B5,$5E,$B5   ;C0B556|        |      ;
db $02,$9D,$1C,$02,$9E,$72,$B5,$82   ;C0B55E|        |      ;
db $EC,$FF,$02,$9D,$2B,$02,$9E,$72   ;C0B566|        |0002FF;
db $B5,$82,$18,$FF,$02,$9B,$00,$00   ;C0B56E|        |000082;
db $7C,$B5,$7C,$B5,$84,$B5,$02,$80   ;C0B576|        |C07CB5;
db $09,$02,$82,$82,$74,$FF,$02,$80   ;C0B57E|        |      ;
db $0A,$02,$82,$80,$14,$02,$96,$02   ;C0B586|        |      ;
db $80,$0A,$02,$82,$82,$0A,$00,$02   ;C0B58E|        |C0B59A;
db $96,$02,$80,$08,$02,$82,$82,$AE   ;C0B596|        |000002;
db $FF,$02,$97,$02,$80,$2E,$02,$82   ;C0B59E|        |029702;
db $02,$9B,$00,$00,$B9,$B5,$B9,$B5   ;C0B5A6|        |      ;
db $B0,$B5,$02,$9D,$1E,$02,$9E,$C3   ;C0B5AE|        |C0B565;
db $B5,$80,$ED,$02,$9D,$2F,$02,$9E   ;C0B5B6|        |000080;
db $C3,$B5,$82,$F4,$FE,$02,$9A,$00   ;C0B5BE|        |0000B5;
db $00,$CD,$B5,$CD,$B5,$D6,$B5,$02   ;C0B5C6|        |      ;
db $97,$02,$80,$08,$02,$82,$80,$1E   ;C0B5CE|        |000002;
db $02,$96,$02,$80,$08,$02,$82,$82   ;C0B5D6|        |      ;
db $6D,$FF,$02,$97,$02,$80,$0A,$02   ;C0B5DE|        |0002FF;
db $82,$82,$B5,$FF,$02,$97,$02,$80   ;C0B5E6|        |C06B6B;
db $08,$02,$82,$82,$00,$00,$02,$97   ;C0B5EE|        |      ;
db $02,$80,$2A,$02,$82,$02,$9A,$00   ;C0B5F6|        |      ;
db $00,$05,$B6,$0E,$B6,$0E,$B6,$02   ;C0B5FE|        |      ;
db $9D,$1C,$02,$9E,$72,$B5,$80,$ED   ;C0B606|        |00021C;
db $02,$9D,$2B,$02,$9E,$72,$B5,$82   ;C0B60E|        |      ;
db $B3,$FE,$02,$97,$02,$80,$09,$02   ;C0B616|        |0000FE;
db $82,$82,$D6,$FE,$02,$97,$02,$80   ;C0B61E|        |C08CA3;
db $0B,$02,$82,$82,$C8,$FF,$02,$97   ;C0B626|        |      ;
db $02,$80,$0B,$02,$82,$02,$80,$0A   ;C0B62E|        |      ;
db $02,$82,$82,$64,$FF,$02,$97,$02   ;C0B636|        |      ;
db $80,$08,$02,$82,$02,$80,$09,$02   ;C0B63E|        |C0B648;
db $82,$82,$AE,$FE,$02,$80,$09,$02   ;C0B646|        |C064CB;
db $82,$02,$96,$02,$80,$0B,$02,$82   ;C0B64E|        |C04C53;
db $82,$F4,$FE,$02,$80,$09,$02,$82   ;C0B656|        |C0B54D;
db $02,$97,$02,$80,$0B,$02,$82,$82   ;C0B65E|        |      ;
db $8C,$FF,$20,$63,$B7,$02,$A0,$F0   ;C0B666|        |0020FF;
db $FF,$02,$80,$27,$02,$82,$AD,$5E   ;C0B66E|        |278002;
db $1A,$29,$FF,$00,$C9,$04,$00,$90   ;C0B676|        |      ;
db $03,$82,$B5,$00,$02,$9C,$88,$B6   ;C0B67E|        |000082;
db $37,$B7,$E2,$20,$EE,$5E,$1A,$C2   ;C0B686|        |0000B7;
db $20,$02,$9A,$00,$00,$58,$B7,$58   ;C0B68E|        |C09A02;
db $B7,$42,$B7,$20,$63,$B7,$02,$9F   ;C0B696|        |000042;
db $20,$00,$00,$5D,$02,$80,$29,$02   ;C0B69E|        |C00000;
db $82,$80,$07,$20,$63,$B7,$02,$9F   ;C0B6A6|        |C0BE29;
db $10,$00,$02,$80,$27,$02,$82,$AD   ;C0B6AE|        |C0B6B0;
db $5E,$1A,$29,$FF,$00,$C9,$04,$00   ;C0B6B6|        |00291A;
db $90,$03,$82,$7F,$00,$02,$9C,$42   ;C0B6BE|        |C0B6C3;
db $B7,$C9,$B6,$E2,$20,$EE,$5E,$1A   ;C0B6C6|        |0000C9;
db $C2,$20,$02,$9B,$00,$00,$37,$B7   ;C0B6CE|        |      ;
db $37,$B7,$4D,$B7,$20,$63,$B7,$02   ;C0B6D6|        |0000B7;
db $A0,$10,$00,$02,$80,$27,$02,$82   ;C0B6DE|        |      ;
db $AD,$5E,$1A,$29,$FF,$00,$C9,$04   ;C0B6E6|        |001A5E;
db $00,$B0,$5C,$02,$9C,$88,$B6,$4D   ;C0B6EE|        |      ;
db $B7,$20,$63,$B7,$02,$9F,$F0,$FF   ;C0B6F6|        |000020;
db $00,$5D,$02,$80,$29,$02,$82,$80   ;C0B6FE|        |      ;
db $07,$20,$63,$B7,$02,$9F,$F0,$FF   ;C0B706|        |000020;
db $02,$80,$27,$02,$82,$AD,$5E,$1A   ;C0B70E|        |      ;
db $29,$FF,$00,$C9,$04,$00,$B0,$3A   ;C0B716|        |      ;
db $02,$9C,$58,$B7,$C9,$B6,$02,$09   ;C0B71E|        |      ;
db $05,$19,$E2,$20,$9C,$5E,$1A,$C2   ;C0B726|        |000019;
db $20,$02,$80,$28,$02,$82,$02,$86   ;C0B72E|        |C08002;
db $6B,$02,$21,$24,$B7,$02,$85,$68   ;C0B736|        |      ;
db $B6,$80,$80,$ED,$02,$24,$24,$B7   ;C0B73E|        |000080;
db $02,$85,$A9,$B6,$80,$80,$E2,$02   ;C0B746|        |      ;
db $22,$24,$B7,$02,$85,$DA,$B6,$80   ;C0B74E|        |02B724;
db $80,$D7,$02,$23,$24,$B7,$02,$85   ;C0B756|        |C0B72F;
db $07,$B7,$80,$80,$CC,$A9,$00,$02   ;C0B75E|        |0000B7;
db $9D,$16,$00,$60,$8E,$9C,$03,$02   ;C0B766|        |000016;
db $80,$19,$02,$82,$02,$91,$02,$0C   ;C0B76E|        |C0B789;
db $00,$04,$7B,$B7,$6B,$02,$85,$61   ;C0B776|        |      ;
db $BE,$80,$BD,$16,$00,$29,$FF,$FC   ;C0B77E|        |00BD80;
db $9D,$16,$00,$9C,$39,$04,$02,$1B   ;C0B786|        |000016;
db $DB,$B7,$3C,$00,$02,$0C,$00,$04   ;C0B78E|        |      ;
db $AC,$B7,$02,$9B,$60,$00,$A2,$B7   ;C0B796|        |0002B7;
db $A2,$B7,$AA,$B9,$02,$9A,$20,$00   ;C0B79E|        |      ;
db $A0,$B9,$6E,$B8,$B1,$B8,$02,$97   ;C0B7A6|        |      ;
db $02,$80,$06,$02,$82,$02,$80,$07   ;C0B7AE|        |      ;
db $02,$82,$80,$55,$02,$0C,$00,$04   ;C0B7B6|        |      ;
db $D4,$B7,$02,$9A,$60,$00,$D7,$B9   ;C0B7BE|        |0000B7;
db $CA,$B7,$CA,$B7,$02,$9B,$20,$00   ;C0B7C6|        |      ;
db $BB,$B8,$C5,$B8,$05,$B9,$02,$80   ;C0B7CE|        |      ;
db $07,$02,$82,$80,$34,$02,$0C,$00   ;C0B7D6|        |000002;
db $04,$0F,$B8,$02,$9B,$60,$00,$B9   ;C0B7DE|        |00000F;
db $B9,$EB,$B7,$EB,$B7,$02,$9A,$20   ;C0B7E6|        |00B7EB;
db $00,$66,$B9,$19,$B9,$0F,$B9,$02   ;C0B7EE|        |      ;
db $0C,$00,$04,$D4,$B7,$02,$9A,$60   ;C0B7F6|        |000400;
db $00,$05,$B8,$05,$B8,$C8,$B9,$02   ;C0B7FE|        |      ;
db $9B,$20,$00,$96,$B9,$70,$B9,$5C   ;C0B806|        |      ;
db $B9,$02,$81,$19,$02,$02,$83,$02   ;C0B80E|        |008102;
db $85,$E6,$B9,$80,$02,$85,$F5,$B9   ;C0B816|        |0000E6;
db $80,$02,$80,$19,$02,$82,$02,$97   ;C0B81E|        |C0B822;
db $02,$80,$04,$02,$82,$02,$85,$02   ;C0B826|        |      ;
db $BA,$80,$02,$85,$11,$BA,$80,$02   ;C0B82E|        |      ;
db $80,$1A,$02,$82,$02,$80,$05,$02   ;C0B836|        |C0B852;
db $82,$02,$85,$1E,$BA,$80,$02,$85   ;C0B83E|        |C03D43;
db $2D,$BA,$80,$02,$80,$1B,$02,$82   ;C0B846|        |0080BA;
db $02,$96,$02,$80,$06,$02,$82,$02   ;C0B84E|        |      ;
db $85,$3C,$BA,$80,$02,$85,$4D,$BA   ;C0B856|        |00003C;
db $80,$02,$81,$1A,$05,$02,$83,$02   ;C0B85E|        |C0B862;
db $80,$07,$02,$82,$02,$27,$E1,$B7   ;C0B866|        |C0B86F;
db $02,$97,$02,$80,$32,$02,$82,$02   ;C0B86E|        |      ;
db $9B,$00,$00,$7F,$B8,$88,$B8,$88   ;C0B876|        |      ;
db $B8,$02,$9D,$18,$02,$9E,$94,$B8   ;C0B87E|        |      ;
db $80,$ED,$02,$21,$94,$B8,$02,$80   ;C0B886|        |C0B875;
db $33,$02,$82,$82,$FE,$FE,$02,$9A   ;C0B88E|        |000002;
db $00,$00,$9E,$B8,$9E,$B8,$A8,$B8   ;C0B896|        |      ;
db $02,$97,$02,$80,$06,$02,$82,$82   ;C0B89E|        |      ;
db $C8,$00,$02,$96,$02,$80,$06,$02   ;C0B8A6|        |      ;
db $82,$80,$14,$02,$96,$02,$80,$06   ;C0B8AE|        |C0CD31;
db $02,$82,$82,$0A,$00,$02,$96,$02   ;C0B8B6|        |      ;
db $80,$05,$02,$82,$82,$A9,$FF,$02   ;C0B8BE|        |C0B8C5;
db $96,$02,$80,$30,$02,$82,$02,$9A   ;C0B8C6|        |000002;
db $00,$00,$E0,$B8,$E0,$B8,$D6,$B8   ;C0B8CE|        |      ;
db $02,$9D,$17,$02,$9E,$EC,$B8,$82   ;C0B8D6|        |      ;
db $EC,$FF,$02,$24,$EC,$B8,$02,$80   ;C0B8DE|        |0002FF;
db $31,$02,$82,$82,$CE,$FE,$02,$9B   ;C0B8E6|        |000002;
db $00,$00,$F6,$B8,$F6,$B8,$FE,$B8   ;C0B8EE|        |      ;
db $02,$80,$05,$02,$82,$82,$70,$FF   ;C0B8F6|        |      ;
db $02,$80,$07,$02,$82,$80,$14,$02   ;C0B8FE|        |      ;
db $96,$02,$80,$07,$02,$82,$82,$0A   ;C0B906|        |000002;
db $00,$02,$96,$02,$80,$04,$02,$82   ;C0B90E|        |      ;
db $82,$AC,$FF,$02,$97,$02,$80,$34   ;C0B916|        |C0B8C5;
db $02,$82,$02,$9B,$00,$00,$33,$B9   ;C0B91E|        |      ;
db $33,$B9,$2A,$B9,$02,$9D,$16,$02   ;C0B926|        |0000B9;
db $9E,$3F,$B9,$80,$ED,$02,$22,$3F   ;C0B92E|        |00B93F;
db $B9,$02,$80,$35,$02,$82,$82,$9C   ;C0B936|        |008002;
db $FE,$02,$9A,$00,$00,$49,$B9,$49   ;C0B93E|        |009A02;
db $B9,$52,$B9,$02,$97,$02,$80,$04   ;C0B946|        |00B952;
db $02,$82,$80,$1E,$02,$96,$02,$80   ;C0B94E|        |      ;
db $04,$02,$82,$82,$69,$FF,$02,$97   ;C0B956|        |000002;
db $02,$80,$07,$02,$82,$82,$B3,$FF   ;C0B95E|        |      ;
db $02,$97,$02,$80,$04,$02,$82,$82   ;C0B966|        |      ;
db $00,$00,$02,$97,$02,$80,$30,$02   ;C0B96E|        |      ;
db $82,$02,$9A,$00,$00,$81,$B9,$8A   ;C0B976|        |C0537B;
db $B9,$8A,$B9,$02,$9D,$17,$02,$9E   ;C0B97E|        |00B98A;
db $EC,$B8,$80,$ED,$02,$23,$EC,$B8   ;C0B986|        |0080B8;
db $02,$80,$31,$02,$82,$82,$5F,$FE   ;C0B98E|        |      ;
db $02,$97,$02,$80,$05,$02,$82,$82   ;C0B996|        |      ;
db $CE,$FE,$02,$97,$02,$80,$06,$02   ;C0B99E|        |0002FE;
db $82,$82,$C6,$FF,$02,$97,$02,$80   ;C0B9A6|        |C0802B;
db $06,$02,$82,$02,$80,$07,$02,$82   ;C0B9AE|        |000002;
db $82,$60,$FF,$02,$97,$02,$80,$04   ;C0B9B6|        |C0B919;
db $02,$82,$02,$80,$05,$02,$82,$82   ;C0B9BE|        |      ;
db $A6,$FE,$02,$80,$05,$02,$82,$02   ;C0B9C6|        |0000FE;
db $96,$02,$80,$06,$02,$82,$82,$EE   ;C0B9CE|        |000002;
db $FE,$02,$80,$05,$02,$82,$02,$97   ;C0B9D6|        |008002;
db $02,$80,$06,$02,$82,$82,$8A,$FF   ;C0B9DE|        |      ;
db $00,$5A,$02,$A3,$02,$A1,$08,$00   ;C0B9E6|        |      ;
db $48,$00,$A9,$00,$00,$80,$67,$02   ;C0B9EE|        |      ;
db $A3,$02,$A1,$E8,$FF,$48,$00,$A9   ;C0B9F6|        |000002;
db $03,$00,$80,$5A,$00,$5A,$02,$A3   ;C0B9FE|        |000000;
db $02,$A1,$C0,$FF,$F8,$FF,$A9,$02   ;C0BA06|        |      ;
db $00,$80,$4B,$02,$A3,$02,$A1,$C8   ;C0BA0E|        |      ;
db $FF,$18,$00,$A9,$01,$00,$80,$3E   ;C0BA16|        |A90018;
db $00,$5A,$02,$A1,$08,$00,$E8,$FF   ;C0BA1E|        |      ;
db $02,$88,$A9,$00,$00,$80,$2F,$02   ;C0BA26|        |      ;
db $A3,$02,$A1,$E8,$FF,$B0,$FF,$02   ;C0BA2E|        |000002;
db $88,$A9,$03,$00,$80,$20,$00,$5A   ;C0BA36|        |      ;
db $02,$A3,$02,$A1,$20,$00,$F8,$FF   ;C0BA3E|        |      ;
db $02,$96,$A9,$02,$00,$80,$0F,$02   ;C0BA46|        |      ;
db $A3,$02,$A1,$50,$00,$18,$00,$02   ;C0BA4E|        |000002;
db $96,$A9,$01,$00,$80,$00,$9D,$1E   ;C0BA56|        |0000A9;
db $00,$9E,$20,$00,$A9,$00,$02,$9D   ;C0BA5E|        |      ;
db $16,$00,$A9,$04,$00,$9D,$2A,$00   ;C0BA66|        |000000;
db $02,$91,$02,$83,$02,$86,$6B,$02   ;C0BA6E|        |      ;
db $80,$13,$02,$82,$02,$91,$AC,$9C   ;C0BA76|        |C0BA8B;
db $03,$B9,$16,$00,$89,$00,$04,$D0   ;C0BA7E|        |0000B9;
db $01,$6B,$02,$1B,$8E,$BA,$08,$00   ;C0BA86|        |00006B;
db $8E,$9C,$03,$02,$91,$02,$0C,$00   ;C0BA8E|        |00039C;
db $04,$9A,$BA,$6B,$02,$85,$6E,$BE   ;C0BA96|        |00009A;
db $80,$BD,$16,$00,$29,$FF,$FC,$9D   ;C0BA9E|        |C0BA5D;
db $16,$00,$9C,$39,$04,$02,$1B,$43   ;C0BAA6|        |000000;
db $BB,$3C,$00,$02,$0C,$00,$04,$CB   ;C0BAAE|        |      ;
db $BA,$02,$9B,$60,$00,$C1,$BA,$C1   ;C0BAB6|        |      ;
db $BA,$09,$BD,$02,$9A,$10,$00,$FF   ;C0BABE|        |      ;
db $BC,$D5,$BB,$16,$BC,$02,$21,$B7   ;C0BAC6|        |00BBD5;
db $BA,$02,$AE,$00,$00,$C0,$FF,$B7   ;C0BACE|        |      ;
db $BA,$02,$AE,$00,$00,$B0,$FF,$B7   ;C0BAD6|        |      ;
db $BA,$02,$AE,$10,$00,$C0,$FF,$B7   ;C0BADE|        |      ;
db $BA,$02,$AE,$10,$00,$B0,$FF,$B7   ;C0BAE6|        |      ;
db $BA,$02,$85,$74,$BD,$80,$02,$1B   ;C0BAEE|        |      ;
db $B7,$BA,$1E,$00,$02,$0C,$00,$04   ;C0BAF6|        |0000BA;
db $14,$BB,$02,$9A,$60,$00,$36,$BD   ;C0BAFE|        |0000BB;
db $0A,$BB,$0A,$BB,$02,$9B,$10,$00   ;C0BB06|        |      ;
db $20,$BC,$2A,$BC,$68,$BC,$02,$24   ;C0BB0E|        |C02ABC;
db $00,$BB,$02,$AE,$50,$00,$00,$00   ;C0BB16|        |      ;
db $00,$BB,$02,$AE,$50,$00,$F0,$FF   ;C0BB1E|        |      ;
db $00,$BB,$02,$AE,$60,$00,$00,$00   ;C0BB26|        |      ;
db $00,$BB,$02,$AE,$60,$00,$F0,$FF   ;C0BB2E|        |      ;
db $00,$BB,$02,$85,$D9,$BD,$80,$02   ;C0BB36|        |      ;
db $1B,$00,$BB,$1E,$00,$02,$0C,$00   ;C0BB3E|        |      ;
db $04,$5D,$BB,$02,$9B,$60,$00,$18   ;C0BB46|        |00005D;
db $BD,$53,$BB,$53,$BB,$02,$9A,$10   ;C0BB4E|        |00BB53;
db $00,$C7,$BC,$7C,$BC,$72,$BC,$02   ;C0BB56|        |      ;
db $22,$49,$BB,$02,$AE,$00,$00,$30   ;C0BB5E|        |02BB49;
db $00,$49,$BB,$02,$AE,$00,$00,$40   ;C0BB66|        |      ;
db $00,$49,$BB,$02,$AE,$10,$00,$30   ;C0BB6E|        |      ;
db $00,$49,$BB,$02,$AE,$10,$00,$40   ;C0BB76|        |      ;
db $00,$49,$BB,$02,$85,$45,$BD,$80   ;C0BB7E|        |      ;
db $02,$1B,$49,$BB,$1E,$00,$02,$0C   ;C0BB86|        |      ;
db $00,$04,$A6,$BB,$02,$9A,$60,$00   ;C0BB8E|        |      ;
db $9C,$BB,$9C,$BB,$27,$BD,$02,$9B   ;C0BB96|        |009CBB;
db $10,$00,$F5,$BC,$D1,$BC,$BD,$BC   ;C0BB9E|        |C0BBA0;
db $02,$23,$92,$BB,$02,$AE,$C0,$FF   ;C0BBA6|        |      ;
db $00,$00,$92,$BB,$02,$AE,$C0,$FF   ;C0BBAE|        |      ;
db $F0,$FF,$92,$BB,$02,$AE,$B0,$FF   ;C0BBB6|        |C0BBB7;
db $00,$00,$92,$BB,$02,$AE,$B0,$FF   ;C0BBBE|        |      ;
db $F0,$FF,$92,$BB,$02,$85,$A7,$BD   ;C0BBC6|        |C0BBC7;
db $80,$02,$1B,$92,$BB,$1E,$00,$02   ;C0BBCE|        |C0BBD2;
db $97,$02,$80,$38,$02,$82,$02,$9B   ;C0BBD6|        |000002;
db $00,$00,$E6,$BB,$EF,$BB,$EF,$BB   ;C0BBDE|        |      ;
db $02,$9D,$11,$02,$9E,$F9,$BB,$80   ;C0BBE6|        |      ;
db $ED,$02,$9D,$39,$02,$9E,$F9,$BB   ;C0BBEE|        |009D02;
db $82,$B8,$FE,$02,$9A,$00,$00,$03   ;C0BBF6|        |C0BAB1;
db $BC,$03,$BC,$0D,$BC,$02,$97,$02   ;C0BBFE|        |00BC03;
db $80,$0F,$02,$82,$82,$C4,$00,$02   ;C0BC06|        |C0BC17;
db $96,$02,$80,$0F,$02,$82,$80,$14   ;C0BC0E|        |000002;
db $02,$96,$02,$80,$0F,$02,$82,$82   ;C0BC16|        |      ;
db $0A,$00,$02,$96,$02,$80,$0D,$02   ;C0BC1E|        |      ;
db $82,$82,$AB,$FF,$02,$96,$02,$80   ;C0BC26|        |C067AB;
db $36,$02,$82,$02,$9A,$00,$00,$45   ;C0BC2E|        |000002;
db $BC,$45,$BC,$3B,$BC,$02,$9D,$12   ;C0BC36|        |00BC45;
db $02,$9E,$4F,$BC,$82,$EC,$FF,$02   ;C0BC3E|        |      ;
db $9D,$37,$02,$9E,$4F,$BC,$82,$AB   ;C0BC46|        |000237;
db $FE,$02,$9B,$00,$00,$59,$BC,$59   ;C0BC4E|        |009B02;
db $BC,$61,$BC,$02,$80,$0D,$02,$82   ;C0BC56|        |00BC61;
db $82,$74,$FF,$02,$80,$0E,$02,$82   ;C0BC5E|        |C0BBD5;
db $80,$14,$02,$96,$02,$80,$0E,$02   ;C0BC66|        |C0BC7C;
db $82,$82,$0A,$00,$02,$96,$02,$80   ;C0BC6E|        |C0C6F3;
db $0C,$02,$82,$82,$AE,$FF,$02,$97   ;C0BC76|        |008202;
db $02,$80,$3A,$02,$82,$02,$9B,$00   ;C0BC7E|        |      ;
db $00,$96,$BC,$96,$BC,$8D,$BC,$02   ;C0BC86|        |      ;
db $9D,$10,$02,$9E,$A0,$BC,$80,$ED   ;C0BC8E|        |000210;
db $02,$9D,$3B,$02,$9E,$A0,$BC,$82   ;C0BC96|        |      ;
db $A3,$FE,$02,$9A,$00,$00,$AA,$BC   ;C0BC9E|        |0000FE;
db $AA,$BC,$B3,$BC,$02,$97,$02,$80   ;C0BCA6|        |      ;
db $0C,$02,$82,$80,$1E,$02,$96,$02   ;C0BCAE|        |008202;
db $80,$0C,$02,$82,$82,$6D,$FF,$02   ;C0BCB6|        |C0BCC4;
db $97,$02,$80,$0E,$02,$82,$82,$B5   ;C0BCBE|        |000002;
db $FF,$02,$97,$02,$80,$0C,$02,$82   ;C0BCC6|        |029702;
db $82,$00,$00,$02,$97,$02,$80,$36   ;C0BCCE|        |C0BCD1;
db $02,$82,$02,$9A,$00,$00,$E2,$BC   ;C0BCD6|        |      ;
db $EB,$BC,$EB,$BC,$02,$9D,$12,$02   ;C0BCDE|        |      ;
db $9E,$4F,$BC,$80,$ED,$02,$9D,$37   ;C0BCE6|        |00BC4F;
db $02,$9E,$4F,$BC,$82,$97,$FE,$02   ;C0BCEE|        |      ;
db $97,$02,$80,$0D,$02,$82,$82,$D6   ;C0BCF6|        |000002;
db $FE,$02,$97,$02,$80,$0F,$02,$82   ;C0BCFE|        |009702;
db $82,$C8,$FF,$02,$97,$02,$80,$0F   ;C0BD06|        |C0BCD1;
db $02,$82,$02,$80,$0E,$02,$82,$82   ;C0BD0E|        |      ;
db $64,$FF,$02,$97,$02,$80,$0C,$02   ;C0BD16|        |0000FF;
db $82,$02,$80,$0D,$02,$82,$82,$AE   ;C0BD1E|        |C03D23;
db $FE,$02,$80,$0D,$02,$82,$02,$96   ;C0BD26|        |008002;
db $02,$80,$0F,$02,$82,$82,$F4,$FE   ;C0BD2E|        |      ;
db $02,$80,$0D,$02,$82,$02,$97,$02   ;C0BD36|        |      ;
db $80,$0F,$02,$82,$82,$8C,$FF,$20   ;C0BD3E|        |C0BD4F;
db $3A,$BE,$02,$9F,$08,$00,$02,$80   ;C0BD46|        |      ;
db $3C,$02,$82,$02,$85,$64,$BD,$80   ;C0BD4E|        |008202;
db $02,$80,$25,$02,$82,$02,$A1,$F8   ;C0BD56|        |      ;
db $FF,$10,$00,$82,$E1,$00,$A9,$00   ;C0BD5E|        |820010;
db $02,$9D,$16,$00,$02,$A3,$02,$80   ;C0BD66|        |      ;
db $3E,$02,$82,$02,$86,$6B,$A9,$00   ;C0BD6E|        |008202;
db $02,$9D,$16,$00,$02,$A1,$08,$00   ;C0BD76|        |      ;
db $E8,$FF,$02,$98,$02,$80,$3C,$02   ;C0BD7E|        |      ;
db $82,$00,$5B,$02,$80,$25,$02,$82   ;C0BD86|        |C01889;
db $02,$A1,$F8,$FF,$F8,$FF,$02,$85   ;C0BD8E|        |      ;
db $1C,$BE,$80,$02,$A0,$E0,$FF,$02   ;C0BD96|        |0080BE;
db $A4,$02,$80,$26,$02,$82,$02,$86   ;C0BD9E|        |000002;
db $6B,$20,$3A,$BE,$02,$A1,$F8,$FF   ;C0BDA6|        |      ;
db $F4,$FF,$02,$80,$3C,$02,$82,$02   ;C0BDAE|        |0002FF;
db $85,$C7,$BD,$80,$02,$80,$24,$02   ;C0BDB6|        |0000C7;
db $82,$02,$A1,$F0,$FF,$08,$00,$80   ;C0BDBE|        |C05EC3;
db $7E,$A9,$00,$02,$9D,$16,$00,$02   ;C0BDC6|        |0000A9;
db $A3,$02,$97,$02,$80,$3D,$02,$82   ;C0BDCE|        |000002;
db $02,$86,$6B,$20,$3A,$BE,$02,$A1   ;C0BDD6|        |      ;
db $20,$00,$F4,$FF,$02,$80,$3C,$02   ;C0BDDE|        |C0F400;
db $82,$02,$85,$0A,$BE,$80,$02,$96   ;C0BDE6|        |C042EB;
db $02,$80,$24,$02,$82,$02,$A0,$08   ;C0BDEE|        |      ;
db $00,$02,$85,$1C,$BE,$80,$02,$9F   ;C0BDF6|        |      ;
db $18,$00,$02,$A4,$02,$80,$26,$02   ;C0BDFE|        |      ;
db $82,$02,$86,$6B,$A9,$00,$02,$9D   ;C0BE06|        |C0440B;
db $16,$00,$02,$A3,$02,$96,$02,$80   ;C0BE0E|        |000000;
db $3D,$02,$82,$02,$86,$6B,$A9,$00   ;C0BE16|        |008202;
db $02,$9D,$16,$00,$02,$A4,$02,$99   ;C0BE1E|        |      ;
db $02,$80,$22,$02,$82,$02,$81,$40   ;C0BE26|        |      ;
db $14,$02,$83,$02,$81,$3F,$14,$02   ;C0BE2E|        |000002;
db $83,$02,$86,$6B,$A9,$00,$02,$9D   ;C0BE36|        |000002;
db $16,$00,$02,$A3,$00,$5B,$60,$02   ;C0BE3E|        |000000;
db $85,$1C,$BE,$80,$02,$A4,$02,$80   ;C0BE46|        |00001C;
db $26,$02,$82,$02,$86,$6B,$02,$A8   ;C0BE4E|        |000002;
db $00,$80,$8D,$02,$92,$3A,$02,$94   ;C0BE56|        |      ;
db $02,$86,$6B,$02,$A8,$00,$80,$8D   ;C0BE5E|        |      ;
db $02,$92,$3C,$02,$94,$02,$86,$6B   ;C0BE66|        |      ;
db $02,$A8,$00,$80,$8D,$02,$92,$3E   ;C0BE6E|        |      ;
db $02,$94,$02,$86,$6B,$EE,$64,$04   ;C0BE76|        |      ;
db $8E,$9C,$03,$02,$A3,$02,$AD,$08   ;C0BE7E|        |00039C;
db $02,$0C,$00,$04,$92,$BE,$02,$1B   ;C0BE86|        |      ;
db $81,$BE,$08,$00,$02,$80,$00,$02   ;C0BE8E|        |0000BE;
db $82,$02,$85,$D3,$C0,$80,$02,$B0   ;C0BE96|        |C0439B;
db $F8,$BE,$80,$00,$02,$02,$AF,$77   ;C0BE9E|        |      ;
db $BF,$80,$01,$02,$02,$AF,$24,$C0   ;C0BEA6|        |020180;
db $80,$01,$02,$02,$03,$04,$02,$97   ;C0BEAE|        |C0BEB1;
db $02,$80,$01,$02,$82,$02,$96,$02   ;C0BEB6|        |      ;
db $80,$01,$02,$82,$02,$04,$02,$80   ;C0BEBE|        |C0BEC1;
db $20,$02,$82,$02,$80,$1E,$02,$82   ;C0BEC6|        |C08202;
db $02,$09,$00,$80,$02,$05,$00,$80   ;C0BECE|        |      ;
db $02,$80,$1F,$02,$82,$AC,$9E,$03   ;C0BED6|        |      ;
db $B9,$00,$00,$C9,$80,$00,$B0,$09   ;C0BEDE|        |000000;
db $02,$97,$02,$80,$21,$02,$82,$80   ;C0BEE6|        |      ;
db $C2,$02,$96,$02,$80,$21,$02,$82   ;C0BEEE|        |      ;
db $80,$B9,$02,$A3,$02,$80,$22,$02   ;C0BEF6|        |C0BEB1;
db $82,$02,$05,$00,$00,$02,$80,$03   ;C0BEFE|        |C0C403;
db $02,$82,$02,$AF,$20,$BF,$80,$00   ;C0BF06|        |      ;
db $02,$02,$1B,$15,$BF,$18,$00,$02   ;C0BF0E|        |      ;
db $80,$04,$02,$82,$02,$09,$00,$00   ;C0BF16|        |C0BF1C;
db $80,$DA,$02,$A3,$02,$A1,$08,$00   ;C0BF1E|        |C0BEFA;
db $FC,$FF,$02,$80,$18,$02,$82,$00   ;C0BF26|        |C002FF;
db $51,$02,$B0,$4C,$BF,$80,$00,$02   ;C0BF2E|        |000002;
db $02,$B0,$55,$BF,$80,$00,$02,$02   ;C0BF36|        |      ;
db $B0,$5E,$BF,$80,$00,$02,$02,$80   ;C0BF3E|        |C0BF9E;
db $17,$02,$82,$02,$86,$6B,$02,$A3   ;C0BF46|        |000002;
db $02,$80,$16,$02,$82,$80,$12,$02   ;C0BF4E|        |      ;
db $A3,$02,$80,$15,$02,$82,$80,$09   ;C0BF56|        |000002;
db $02,$A3,$02,$96,$02,$80,$15,$02   ;C0BF5E|        |      ;
db $82,$02,$80,$14,$02,$82,$02,$1C   ;C0BF66|        |C03F6B;
db $00,$80,$74,$BF,$80,$F3,$02,$86   ;C0BF6E|        |      ;
db $6B,$02,$A3,$BD,$1A,$00,$09,$00   ;C0BF76|        |      ;
db $01,$9D,$1A,$00,$02,$99,$02,$97   ;C0BF7E|        |00009D;
db $A9,$30,$00,$9D,$00,$00,$A9,$70   ;C0BF86|        |      ;
db $00,$9D,$02,$00,$02,$81,$25,$14   ;C0BF8E|        |      ;
db $02,$83,$E2,$20,$A9,$63,$9D,$25   ;C0BF96|        |      ;
db $00,$C2,$20,$BD,$16,$00,$29,$FF   ;C0BF9E|        |      ;
db $FC,$9D,$16,$00,$BD,$25,$00,$29   ;C0BFA6|        |C0169D;
db $FF,$00,$C9,$5A,$00,$90,$5A,$02   ;C0BFAE|        |5AC900;
db $9C,$BB,$BF,$E5,$BF,$02,$9A,$00   ;C0BFB6|        |00BFBB;
db $00,$C5,$BF,$D5,$BF,$D5,$BF,$02   ;C0BFBE|        |      ;
db $97,$02,$99,$02,$80,$27,$02,$82   ;C0BFC6|        |000002;
db $02,$80,$29,$02,$82,$80,$D5,$02   ;C0BFCE|        |      ;
db $96,$02,$99,$02,$80,$10,$02,$82   ;C0BFD6|        |000002;
db $02,$80,$12,$02,$82,$80,$C5,$02   ;C0BFDE|        |      ;
db $9B,$00,$00,$EF,$BF,$FF,$BF,$FF   ;C0BFE6|        |      ;
db $BF,$02,$97,$02,$98,$02,$80,$0F   ;C0BFEE|        |029702;
db $02,$82,$02,$80,$11,$02,$82,$80   ;C0BFF6|        |      ;
db $AB,$02,$97,$02,$99,$02,$80,$26   ;C0BFFE|        |      ;
db $02,$82,$02,$80,$28,$02,$82,$80   ;C0C006|        |      ;
db $9B,$BD,$16,$00,$09,$00,$03,$9D   ;C0C00E|        |      ;
db $16,$00,$02,$81,$25,$14,$02,$83   ;C0C016|        |000000;
db $02,$1B,$82,$BF,$2C,$01,$02,$A3   ;C0C01E|        |      ;
db $02,$96,$BD,$1A,$00,$09,$00,$01   ;C0C026|        |      ;
db $9D,$1A,$00,$02,$99,$02,$97,$A9   ;C0C02E|        |00001A;
db $B0,$00,$9D,$00,$00,$A9,$70,$00   ;C0C036|        |C0C038;
db $9D,$02,$00,$02,$81,$0E,$14,$02   ;C0C03E|        |000002;
db $83,$E2,$20,$A9,$63,$9D,$25,$00   ;C0C046|        |0000E2;
db $C2,$20,$BD,$16,$00,$29,$FF,$FC   ;C0C04E|        |      ;
db $9D,$16,$00,$BD,$25,$00,$29,$FF   ;C0C056|        |000016;
db $00,$C9,$5A,$00,$90,$5A,$02,$9C   ;C0C05E|        |      ;
db $6A,$C0,$94,$C0,$02,$9A,$00,$00   ;C0C066|        |      ;
db $74,$C0,$84,$C0,$84,$C0,$02,$97   ;C0C06E|        |0000C0;
db $02,$99,$02,$80,$10,$02,$82,$02   ;C0C076|        |      ;
db $80,$12,$02,$82,$80,$D5,$02,$96   ;C0C07E|        |C0C092;
db $02,$99,$02,$80,$27,$02,$82,$02   ;C0C086|        |      ;
db $80,$29,$02,$82,$80,$C5,$02,$9B   ;C0C08E|        |C0C0B9;
db $00,$00,$9E,$C0,$AE,$C0,$AE,$C0   ;C0C096|        |      ;
db $02,$97,$02,$98,$02,$80,$26,$02   ;C0C09E|        |      ;
db $82,$02,$80,$28,$02,$82,$80,$AB   ;C0C0A6|        |C040AB;
db $02,$97,$02,$99,$02,$80,$0F,$02   ;C0C0AE|        |      ;
db $82,$02,$80,$11,$02,$82,$80,$9B   ;C0C0B6|        |C040BB;
db $BD,$16,$00,$09,$00,$03,$9D,$16   ;C0C0BE|        |000016;
db $00,$02,$81,$0E,$14,$02,$83,$02   ;C0C0C6|        |      ;
db $1B,$31,$C0,$2C,$01,$BD,$3C,$00   ;C0C0CE|        |      ;
db $9D,$02,$00,$A8,$B9,$3C,$00,$9D   ;C0C0D6|        |000002;
db $00,$00,$02,$91,$DA,$02,$07,$00   ;C0C0DE|        |      ;
db $80,$FC,$C0,$BD,$00,$00,$BC,$02   ;C0C0E6|        |C0C0E4;
db $00,$AA,$BD,$00,$00,$99,$00,$00   ;C0C0EE|        |      ;
db $BD,$02,$00,$99,$02,$00,$FA,$DA   ;C0C0F6|        |000002;
db $BD,$00,$00,$BC,$02,$00,$AA,$BD   ;C0C0FE|        |000000;
db $26,$00,$99,$26,$00,$BD,$16,$00   ;C0C106|        |000000;
db $89,$00,$04,$D0,$12,$29,$00,$08   ;C0C10E|        |      ;
db $48,$B9,$16,$00,$29,$FF,$F7,$03   ;C0C116|        |      ;
db $01,$99,$16,$00,$68,$FA,$6B,$BB   ;C0C11E|        |000099;
db $A9,$33,$C1,$9D,$18,$00,$9E,$14   ;C0C126|        |      ;
db $00,$FA,$02,$86,$6B,$9E,$04,$00   ;C0C12E|        |      ;
db $9E,$06,$00,$6B,$02,$14,$B6,$00   ;C0C136|        |000006;
db $D5,$C1,$02,$AD,$08,$02,$0C,$00   ;C0C13E|        |0000C1;
db $03,$50,$C1,$02,$80,$1A,$02,$82   ;C0C146|        |000050;
db $80,$F0,$00,$A1,$02,$B0,$B9,$C2   ;C0C14E|        |C0C140;
db $80,$00,$02,$02,$B0,$C1,$C2,$80   ;C0C156|        |C0C158;
db $00,$02,$02,$B0,$C9,$C2,$80,$00   ;C0C15E|        |      ;
db $02,$9E,$16,$00,$02,$80,$0B,$02   ;C0C166|        |      ;
db $82,$02,$AD,$08,$02,$0C,$00,$04   ;C0C16E|        |C06E73;
db $7F,$C1,$02,$80,$2A,$02,$82,$80   ;C0C176|        |8002C1;
db $F0,$02,$9C,$85,$C1,$AD,$C1,$02   ;C0C17E|        |C0C182;
db $9A,$10,$00,$8F,$C1,$9E,$C1,$9E   ;C0C186|        |      ;
db $C1,$02,$23,$78,$C1,$02,$97,$02   ;C0C18E|        |000002;
db $99,$02,$80,$0D,$02,$82,$80,$DA   ;C0C196|        |008002;
db $02,$24,$78,$C1,$02,$96,$02,$99   ;C0C19E|        |      ;
db $02,$80,$0D,$02,$82,$80,$CB,$02   ;C0C1A6|        |      ;
db $9B,$10,$00,$B7,$C1,$C6,$C1,$C6   ;C0C1AE|        |      ;
db $C1,$02,$21,$78,$C1,$02,$97,$02   ;C0C1B6|        |000002;
db $98,$02,$80,$0C,$02,$82,$80,$B2   ;C0C1BE|        |      ;
db $02,$22,$78,$C1,$02,$97,$02,$99   ;C0C1C6|        |      ;
db $02,$80,$0C,$02,$82,$80,$A3,$02   ;C0C1CE|        |      ;
db $86,$6B,$02,$14,$B6,$00,$7D,$C2   ;C0C1D6|        |00006B;
db $02,$A0,$F8,$FF,$BD,$1A,$00,$09   ;C0C1DE|        |      ;
db $00,$01,$9D,$1A,$00,$02,$AD,$08   ;C0C1E6|        |      ;
db $02,$9B,$40,$00,$F8,$C1,$FF,$C1   ;C0C1EE|        |      ;
db $F8,$C1,$02,$80,$23,$02,$82,$80   ;C0C1F6|        |      ;
db $EC,$02,$AD,$08,$02,$80,$05,$02   ;C0C1FE|        |00AD02;
db $82,$E2,$20,$A9,$63,$9D,$25,$00   ;C0C206|        |C0E2EB;
db $C2,$20,$BD,$16,$00,$29,$FF,$FD   ;C0C20E|        |      ;
db $9D,$16,$00,$02,$03,$0F,$BD,$25   ;C0C216|        |000016;
db $00,$29,$FF,$00,$C9,$63,$00,$90   ;C0C21E|        |      ;
db $29,$02,$9B,$10,$00,$31,$C2,$38   ;C0C226|        |      ;
db $C2,$31,$C2,$02,$80,$06,$02,$82   ;C0C22E|        |      ;
db $02,$04,$02,$80,$07,$02,$82,$02   ;C0C236|        |      ;
db $B0,$69,$C2,$80,$00,$02,$02,$80   ;C0C23E|        |C0C2A9;
db $08,$02,$82,$02,$80,$06,$02,$82   ;C0C246|        |      ;
db $80,$C9,$BD,$16,$00,$09,$00,$02   ;C0C24E|        |C0C219;
db $9D,$16,$00,$02,$80,$09,$02,$82   ;C0C256|        |000016;
db $02,$80,$23,$02,$82,$02,$1B,$FF   ;C0C25E|        |      ;
db $C1,$2C,$01,$02,$8F,$00,$5B,$02   ;C0C266|        |00002C;
db $80,$13,$02,$82,$02,$1C,$00,$80   ;C0C26E|        |C0C283;
db $7A,$C2,$80,$F3,$02,$86,$6B,$02   ;C0C276|        |      ;
db $86,$6B,$02,$A4,$02,$16,$02,$14   ;C0C27E|        |00006B;
db $B6,$00,$B6,$C2,$02,$9B,$30,$00   ;C0C286|        |000000;
db $9A,$C2,$94,$C2,$94,$C2,$02,$1B   ;C0C28E|        |      ;
db $8A,$C2,$08,$00,$00,$A1,$02,$B0   ;C0C296|        |      ;
db $B9,$C2,$80,$00,$02,$02,$B0,$C1   ;C0C29E|        |0080C2;
db $C2,$80,$00,$02,$02,$B0,$C9,$C2   ;C0C2A6|        |      ;
db $80,$00,$02,$02,$15,$02,$86,$6B   ;C0C2AE|        |C0C2B0;
db $02,$91,$6B,$02,$80,$1B,$02,$82   ;C0C2B6|        |      ;
db $02,$86,$6B,$02,$80,$1C,$02,$82   ;C0C2BE|        |      ;
db $02,$86,$6B,$02,$80,$1D,$02,$82   ;C0C2C6|        |      ;
db $02,$86,$6B,$9C,$B4,$03,$EE,$64   ;C0C2CE|        |      ;
db $04,$8E,$9C,$03,$02,$9F,$08,$00   ;C0C2D6|        |00008E;
db $02,$85,$C0,$B1,$80,$A9,$02,$00   ;C0C2DE|        |      ;
db $99,$30,$00,$A9,$02,$00,$9D,$30   ;C0C2E6|        |000030;
db $00,$02,$97,$BD,$16,$00,$09,$00   ;C0C2EE|        |      ;
db $03,$9D,$16,$00,$02,$B2,$60,$C5   ;C0C2F6|        |00009D;
db $80,$10,$00,$F0,$FF,$00,$03,$02   ;C0C2FE|        |C0C310;
db $03,$15,$02,$04,$02,$B2,$60,$C5   ;C0C306|        |000015;
db $80,$08,$00,$FA,$FF,$00,$03,$02   ;C0C30E|        |C0C318;
db $03,$15,$02,$04,$02,$B2,$60,$C5   ;C0C316|        |000015;
db $80,$14,$00,$F6,$FF,$00,$03,$02   ;C0C31E|        |C0C334;
db $03,$15,$02,$04,$02,$85,$2D,$C6   ;C0C326|        |000015;
db $80,$02,$80,$0A,$02,$82,$BD,$16   ;C0C32E|        |C0C332;
db $00,$29,$FF,$FC,$9D,$16,$00,$02   ;C0C336|        |      ;
db $1F,$AD,$02,$03,$30,$31,$02,$80   ;C0C33E|        |0302AD;
db $01,$02,$82,$02,$B2,$CF,$C4,$80   ;C0C346|        |000002;
db $EA,$FF,$0D,$00,$00,$02,$02,$03   ;C0C34E|        |      ;
db $1F,$02,$04,$02,$80,$0D,$02,$82   ;C0C356|        |020402;
db $02,$80,$05,$02,$82,$02,$B2,$BF   ;C0C35E|        |      ;
db $C4,$80,$ED,$FF,$10,$00,$00,$02   ;C0C366|        |000080;
db $02,$80,$06,$02,$82,$80,$2F,$02   ;C0C36E|        |      ;
db $80,$00,$02,$82,$02,$B2,$CF,$C4   ;C0C376|        |C0C378;
db $80,$15,$00,$0F,$00,$00,$03,$02   ;C0C37E|        |C0C395;
db $03,$1F,$02,$04,$02,$80,$0B,$02   ;C0C386|        |00001F;
db $82,$02,$80,$02,$02,$82,$02,$B2   ;C0C38E|        |C04393;
db $C7,$C4,$80,$12,$00,$10,$00,$00   ;C0C396|        |0000C4;
db $02,$02,$80,$03,$02,$82,$02,$1F   ;C0C39E|        |      ;
db $AD,$02,$03,$30,$53,$02,$80,$05   ;C0C3A6|        |000302;
db $02,$82,$02,$B2,$BF,$C4,$80,$ED   ;C0C3AE|        |      ;
db $FF,$10,$00,$00,$02,$02,$80,$06   ;C0C3B6|        |000010;
db $02,$82,$02,$80,$0E,$02,$82,$BD   ;C0C3BE|        |      ;
db $16,$00,$09,$00,$02,$9D,$16,$00   ;C0C3C6|        |000000;
db $02,$B2,$6A,$C5,$80,$E4,$FF,$CD   ;C0C3CE|        |      ;
db $FF,$00,$02,$02,$B2,$7E,$C5,$80   ;C0C3D6|        |020200;
db $E4,$FF,$CD,$FF,$00,$02,$02,$03   ;C0C3DE|        |0000FF;
db $29,$02,$04,$BD,$16,$00,$09,$00   ;C0C3E6|        |      ;
db $03,$9D,$16,$00,$02,$85,$2D,$C6   ;C0C3EE|        |00009D;
db $80,$02,$80,$08,$02,$82,$80,$51   ;C0C3F6|        |C0C3FA;
db $02,$80,$02,$02,$82,$02,$B2,$C7   ;C0C3FE|        |      ;
db $C4,$80,$12,$00,$10,$00,$00,$02   ;C0C406|        |000080;
db $02,$80,$03,$02,$82,$02,$80,$0C   ;C0C40E|        |      ;
db $02,$82,$BD,$16,$00,$09,$00,$02   ;C0C416|        |      ;
db $9D,$16,$00,$02,$B2,$6A,$C5,$80   ;C0C41E|        |000016;
db $1B,$00,$CD,$FF,$00,$02,$02,$B2   ;C0C426|        |      ;
db $7E,$C5,$80,$1B,$00,$CD,$FF,$00   ;C0C42E|        |0080C5;
db $02,$02,$03,$29,$02,$04,$BD,$16   ;C0C436|        |      ;
db $00,$09,$00,$03,$9D,$16,$00,$02   ;C0C43E|        |      ;
db $85,$2D,$C6,$80,$02,$80,$09,$02   ;C0C446|        |00002D;
db $82,$BD,$30,$00,$C9,$01,$00,$F0   ;C0C44E|        |C0F50E;
db $36,$02,$1F,$AD,$02,$03,$30,$04   ;C0C456|        |000002;
db $02,$97,$80,$02,$02,$96,$02,$AF   ;C0C45E|        |      ;
db $0B,$C5,$80,$00,$03,$02,$AF,$0B   ;C0C466|        |      ;
db $C5,$80,$00,$03,$02,$AF,$0B,$C5   ;C0C46E|        |000080;
db $80,$00,$03,$02,$AF,$37,$C5,$80   ;C0C476|        |C0C478;
db $00,$03,$02,$80,$14,$02,$82,$DE   ;C0C47E|        |      ;
db $30,$00,$F0,$03,$82,$62,$FE,$BD   ;C0C486|        |C0C488;
db $00,$00,$C9,$F0,$00,$B0,$04,$02   ;C0C48E|        |      ;
db $97,$80,$02,$02,$96,$02,$AF,$0B   ;C0C496|        |000080;
db $C5,$80,$00,$03,$02,$AF,$0B,$C5   ;C0C49E|        |000080;
db $80,$00,$03,$02,$AF,$0B,$C5,$80   ;C0C4A6|        |C0C4A8;
db $00,$03,$02,$AF,$37,$C5,$80,$00   ;C0C4AE|        |      ;
db $03,$02,$80,$15,$02,$82,$82,$2A   ;C0C4B6|        |000002;
db $FE,$02,$80,$07,$02,$82,$02,$86   ;C0C4BE|        |008002;
db $6B,$02,$80,$04,$02,$82,$02,$86   ;C0C4C6|        |      ;
db $6B,$02,$A3,$02,$81,$16,$06,$02   ;C0C4CE|        |      ;
db $83,$00,$4B,$02,$B0,$F7,$C4,$80   ;C0C4D6|        |000000;
db $00,$02,$02,$B0,$F9,$C4,$80,$00   ;C0C4DE|        |      ;
db $02,$02,$80,$12,$02,$82,$BD,$16   ;C0C4E6|        |      ;
db $00,$89,$00,$80,$F0,$F3,$02,$86   ;C0C4EE|        |      ;
db $6B,$02,$96,$02,$A3,$02,$80,$13   ;C0C4F6|        |      ;
db $02,$82,$BD,$16,$00,$89,$00,$80   ;C0C4FE|        |      ;
db $F0,$F3,$02,$86,$6B,$02,$A4,$02   ;C0C506|        |C0C4FB;
db $80,$1D,$02,$82,$02,$91,$AC,$9C   ;C0C50E|        |C0C52D;
db $03,$B9,$1E,$00,$C9,$14,$00,$F0   ;C0C516|        |0000B9;
db $05,$C9,$15,$00,$D0,$10,$BC,$3E   ;C0C51E|        |0000C9;
db $00,$B9,$00,$00,$9D,$00,$00,$B9   ;C0C526|        |      ;
db $02,$00,$9D,$02,$00,$6B,$02,$86   ;C0C52E|        |      ;
db $6B,$02,$A4,$02,$80,$1D,$02,$82   ;C0C536|        |      ;
db $02,$91,$AC,$9C,$03,$B9,$1E,$00   ;C0C53E|        |      ;
db $C9,$14,$00,$F0,$05,$C9,$15,$00   ;C0C546|        |      ;
db $D0,$0D,$B9,$00,$00,$9D,$00,$00   ;C0C54E|        |C0C55D;
db $B9,$02,$00,$9D,$02,$00,$6B,$02   ;C0C556|        |000002;
db $86,$6B,$02,$A3,$02,$80,$0F,$02   ;C0C55E|        |00006B;
db $82,$02,$86,$6B,$02,$A3,$02,$81   ;C0C566|        |C04B6B;
db $16,$06,$02,$83,$00,$4B,$02,$97   ;C0C56E|        |000006;
db $02,$81,$19,$02,$02,$83,$80,$15   ;C0C576|        |      ;
db $02,$A3,$02,$81,$16,$06,$02,$83   ;C0C57E|        |      ;
db $00,$4B,$02,$96,$02,$81,$19,$02   ;C0C586|        |      ;
db $02,$83,$82,$4D,$00,$02,$97,$02   ;C0C58E|        |      ;
db $9B,$20,$00,$C0,$C5,$9F,$C5,$C0   ;C0C596|        |      ;
db $C5,$02,$9A,$00,$00,$A9,$C5,$B0   ;C0C59E|        |000002;
db $C5,$B0,$C5,$02,$80,$1B,$02,$82   ;C0C5A6|        |0000B0;
db $80,$07,$02,$80,$1C,$02,$82,$02   ;C0C5AE|        |C0C5B7;
db $96,$02,$81,$17,$2A,$02,$83,$02   ;C0C5B6|        |000002;
db $86,$6B,$02,$9A,$18,$00,$D8,$C5   ;C0C5BE|        |00006B;
db $CA,$C5,$D8,$C5,$02,$80,$1A,$02   ;C0C5C6|        |      ;
db $82,$02,$81,$18,$0A,$02,$83,$02   ;C0C5CE|        |C046D3;
db $86,$6B,$02,$80,$19,$02,$82,$82   ;C0C5D6|        |00006B;
db $B5,$FF,$02,$96,$02,$9B,$20,$00   ;C0C5DE|        |0000FF;
db $0D,$C6,$EC,$C5,$0D,$C6,$02,$9A   ;C0C5E6|        |00ECC6;
db $00,$00,$F6,$C5,$FF,$C5,$FF,$C5   ;C0C5EE|        |      ;
db $02,$80,$1C,$02,$82,$02,$97,$80   ;C0C5F6|        |      ;
db $05,$02,$80,$1B,$02,$82,$02,$81   ;C0C5FE|        |000002;
db $17,$2A,$02,$83,$02,$86,$6B,$02   ;C0C606|        |00002A;
db $9A,$18,$00,$25,$C6,$17,$C6,$25   ;C0C60E|        |      ;
db $C6,$02,$80,$1A,$02,$82,$02,$81   ;C0C616|        |000002;
db $18,$0A,$02,$83,$02,$86,$6B,$02   ;C0C61E|        |      ;
db $80,$19,$02,$82,$82,$B5,$FF,$02   ;C0C626|        |C0C641;
db $03,$10,$02,$B0,$4F,$C6,$80,$00   ;C0C62E|        |000010;
db $03,$02,$1B,$3D,$C6,$02,$00,$02   ;C0C636|        |000002;
db $B0,$5A,$C6,$80,$00,$03,$02,$1B   ;C0C63E|        |C0C69A;
db $4A,$C6,$02,$00,$02,$04,$02,$86   ;C0C646|        |      ;
db $6B,$20,$65,$C6,$02,$80,$10,$02   ;C0C64E|        |      ;
db $82,$02,$86,$6B,$20,$65,$C6,$02   ;C0C656|        |C04C5B;
db $80,$11,$02,$82,$02,$86,$6B,$AC   ;C0C65E|        |C0C671;
db $9C,$03,$02,$1F,$02,$35,$20,$AD   ;C0C666|        |000203;
db $43,$04,$38,$E9,$08,$00,$18,$79   ;C0C66E|        |000004;
db $00,$00,$9D,$00,$00,$02,$1F,$02   ;C0C676|        |      ;
db $35,$10,$AD,$43,$04,$38,$E9,$0C   ;C0C67E|        |000010;
db $00,$18,$79,$02,$00,$9D,$02,$00   ;C0C686|        |      ;
db $02,$A3,$60,$9C,$B4,$03,$EE,$64   ;C0C68E|        |      ;
db $04,$8E,$9C,$03,$BD,$1A,$00,$09   ;C0C696|        |00008E;
db $00,$04,$9D,$1A,$00,$02,$85,$C0   ;C0C69E|        |      ;
db $B1,$80,$A9,$03,$00,$99,$30,$00   ;C0C6A6|        |000080;
db $82,$04,$01,$BD,$25,$00,$29,$FF   ;C0C6AE|        |C0C7B5;
db $00,$DD,$30,$00,$F0,$04,$02,$09   ;C0C6B6|        |      ;
db $00,$80,$02,$0C,$00,$02,$E0,$C6   ;C0C6BE|        |      ;
db $02,$9A,$28,$00,$D0,$C6,$B5,$C7   ;C0C6C6|        |      ;
db $D8,$C6,$02,$80,$10,$02,$82,$82   ;C0C6CE|        |      ;
db $6B,$01,$02,$80,$0D,$02,$82,$82   ;C0C6D6|        |      ;
db $9A,$01,$02,$07,$01,$80,$B1,$C8   ;C0C6DE|        |      ;
db $02,$80,$10,$02,$82,$02,$80,$11   ;C0C6E6|        |      ;
db $02,$82,$02,$09,$01,$80,$82,$42   ;C0C6EE|        |      ;
db $03,$BD,$25,$00,$29,$FF,$00,$DD   ;C0C6F6|        |0000BD;
db $30,$00,$F0,$04,$02,$09,$00,$80   ;C0C6FE|        |C0C700;
db $02,$0C,$00,$02,$26,$C7,$02,$9B   ;C0C706|        |      ;
db $28,$00,$16,$C7,$43,$C8,$1E,$C7   ;C0C70E|        |      ;
db $02,$80,$0C,$02,$82,$82,$97,$00   ;C0C716|        |      ;
db $02,$80,$11,$02,$82,$82,$D6,$00   ;C0C71E|        |      ;
db $02,$07,$01,$80,$13,$C9,$02,$80   ;C0C726|        |      ;
db $11,$02,$82,$02,$09,$01,$80,$82   ;C0C72E|        |000002;
db $01,$03,$BD,$25,$00,$29,$FF,$00   ;C0C736|        |000003;
db $DD,$30,$00,$F0,$04,$02,$09,$00   ;C0C73E|        |000030;
db $80,$02,$0C,$00,$02,$67,$C7,$02   ;C0C746|        |C0C74A;
db $9B,$28,$00,$57,$C7,$7A,$C8,$5F   ;C0C74E|        |      ;
db $C7,$02,$80,$0F,$02,$82,$82,$56   ;C0C756|        |000002;
db $00,$02,$80,$12,$02,$82,$82,$95   ;C0C75E|        |      ;
db $00,$02,$07,$01,$80,$75,$C9,$02   ;C0C766|        |      ;
db $80,$12,$02,$82,$02,$09,$01,$80   ;C0C76E|        |C0C782;
db $82,$C0,$02,$BD,$25,$00,$29,$FF   ;C0C776|        |C0CA39;
db $00,$DD,$30,$00,$F0,$04,$02,$09   ;C0C77E|        |      ;
db $00,$80,$02,$0C,$00,$02,$A8,$C7   ;C0C786|        |      ;
db $02,$9A,$28,$00,$98,$C7,$FC,$C7   ;C0C78E|        |      ;
db $A0,$C7,$02,$80,$13,$02,$82,$82   ;C0C796|        |      ;
db $A3,$00,$02,$80,$0E,$02,$82,$82   ;C0C79E|        |000000;
db $D2,$00,$02,$07,$01,$80,$D7,$C9   ;C0C7A6|        |000000;
db $02,$09,$01,$80,$82,$84,$02,$BD   ;C0C7AE|        |      ;
db $02,$00,$C9,$A0,$00,$F0,$18,$02   ;C0C7B6|        |      ;
db $07,$00,$80,$CC,$C7,$02,$81,$0A   ;C0C7BE|        |000000;
db $04,$02,$83,$82,$E5,$FE,$02,$81   ;C0C7C6|        |000002;
db $0B,$04,$02,$83,$82,$DC,$FE,$02   ;C0C7CE|        |      ;
db $9A,$20,$00,$DF,$C7,$E7,$C7,$F4   ;C0C7D6|        |      ;
db $C7,$02,$80,$10,$02,$82,$82,$10   ;C0C7DE|        |000002;
db $FF,$02,$80,$10,$02,$82,$02,$80   ;C0C7E6|        |108002;
db $11,$02,$82,$82,$85,$FF,$02,$80   ;C0C7EE|        |000002;
db $0D,$02,$82,$82,$3C,$FF,$BD,$02   ;C0C7F6|        |008202;
db $00,$C9,$A0,$01,$F0,$18,$02,$07   ;C0C7FE|        |      ;
db $00,$80,$13,$C8,$02,$81,$08,$04   ;C0C806|        |      ;
db $02,$83,$82,$66,$FF,$02,$81,$09   ;C0C80E|        |      ;
db $04,$02,$83,$82,$5D,$FF,$02,$9A   ;C0C816|        |000002;
db $20,$00,$26,$C8,$2E,$C8,$3B,$C8   ;C0C81E|        |C02600;
db $02,$80,$13,$02,$82,$82,$C9,$FE   ;C0C826|        |      ;
db $02,$80,$0E,$02,$82,$02,$80,$0F   ;C0C82E|        |      ;
db $02,$82,$82,$76,$FE,$02,$80,$0E   ;C0C836|        |      ;
db $02,$82,$82,$F5,$FE,$02,$07,$00   ;C0C83E|        |      ;
db $80,$59,$C8,$BD,$00,$00,$C9,$70   ;C0C846|        |C0C8A1;
db $00,$F0,$17,$02,$80,$06,$02,$82   ;C0C84E|        |      ;
db $82,$9E,$FE,$BD,$00,$00,$C9,$70   ;C0C856|        |C0C6F7;
db $00,$F0,$07,$02,$80,$07,$02,$82   ;C0C85E|        |      ;
db $80,$F1,$BD,$16,$00,$09,$00,$03   ;C0C866|        |C0C859;
db $9D,$16,$00,$02,$81,$07,$04,$02   ;C0C86E|        |000016;
db $83,$82,$EF,$01,$02,$07,$00,$80   ;C0C876|        |000082;
db $90,$C8,$BD,$00,$00,$C9,$60,$01   ;C0C87E|        |C0C848;
db $F0,$17,$02,$80,$04,$02,$82,$82   ;C0C886|        |C0C89F;
db $A8,$FE,$BD,$00,$00,$C9,$60,$01   ;C0C88E|        |      ;
db $F0,$07,$02,$80,$05,$02,$82,$80   ;C0C896|        |C0C89F;
db $F1,$BD,$16,$00,$09,$00,$03,$9D   ;C0C89E|        |0000BD;
db $16,$00,$02,$81,$05,$04,$02,$83   ;C0C8A6|        |000000;
db $82,$D3,$01,$02,$80,$1A,$02,$82   ;C0C8AE|        |C0CA84;
db $02,$B2,$E3,$CB,$80,$08,$00,$E0   ;C0C8B6|        |      ;
db $FF,$00,$02,$02,$03,$11,$02,$04   ;C0C8BE|        |020200;
db $02,$9A,$20,$00,$D0,$C8,$E8,$C8   ;C0C8C6|        |      ;
db $FB,$C8,$02,$80,$10,$02,$82,$02   ;C0C8CE|        |      ;
db $80,$19,$02,$82,$02,$B2,$F9,$CB   ;C0C8D6|        |C0C8F1;
db $80,$FE,$FF,$E0,$FF,$00,$02,$82   ;C0C8DE|        |C0C8DE;
db $5B,$FF,$02,$80,$1A,$02,$82,$02   ;C0C8E6|        |      ;
db $B2,$E3,$CB,$80,$08,$00,$E0,$FF   ;C0C8EE|        |0000E3;
db $00,$02,$82,$BA,$FE,$02,$80,$0D   ;C0C8F6|        |      ;
db $02,$82,$02,$80,$18,$02,$82,$02   ;C0C8FE|        |      ;
db $B2,$EE,$CB,$80,$12,$00,$E0,$FF   ;C0C906|        |0000EE;
db $00,$02,$82,$67,$FF,$02,$80,$19   ;C0C90E|        |      ;
db $02,$82,$02,$B2,$F9,$CB,$80,$FE   ;C0C916|        |      ;
db $FF,$E0,$FF,$00,$02,$02,$03,$11   ;C0C91E|        |00FFE0;
db $02,$04,$02,$9B,$20,$00,$32,$C9   ;C0C926|        |      ;
db $4A,$C9,$5D,$C9,$02,$80,$0C,$02   ;C0C92E|        |      ;
db $82,$02,$80,$1A,$02,$82,$02,$B2   ;C0C936|        |C0493B;
db $E3,$CB,$80,$08,$00,$E0,$FF,$00   ;C0C93E|        |0000CB;
db $02,$82,$6B,$FE,$02,$80,$19,$02   ;C0C946|        |      ;
db $82,$02,$B2,$F9,$CB,$80,$FE,$FF   ;C0C94E|        |C07B53;
db $E0,$FF,$00,$02,$82,$E6,$FE,$02   ;C0C956|        |      ;
db $80,$12,$02,$82,$02,$80,$1B,$02   ;C0C95E|        |C0C972;
db $82,$02,$B2,$04,$CC,$80,$08,$00   ;C0C966|        |C07B6B;
db $E2,$FF,$00,$02,$82,$87,$FE,$02   ;C0C96E|        |      ;
db $80,$18,$02,$82,$02,$B2,$EE,$CB   ;C0C976|        |C0C990;
db $80,$12,$00,$E0,$FF,$00,$02,$02   ;C0C97E|        |C0C992;
db $03,$11,$02,$04,$02,$9B,$20,$00   ;C0C986|        |000011;
db $94,$C9,$AC,$C9,$BF,$C9,$02,$80   ;C0C98E|        |0000C9;
db $0F,$02,$82,$02,$80,$1A,$02,$82   ;C0C996|        |028202;
db $02,$B2,$E3,$CB,$80,$08,$00,$E0   ;C0C99E|        |      ;
db $FF,$00,$02,$82,$09,$FE,$02,$80   ;C0C9A6|        |820200;
db $18,$02,$82,$02,$B2,$EE,$CB,$80   ;C0C9AE|        |      ;
db $12,$00,$E0,$FF,$00,$02,$82,$BB   ;C0C9B6|        |000000;
db $FE,$02,$80,$12,$02,$82,$02,$80   ;C0C9BE|        |008002;
db $1B,$02,$82,$02,$B2,$04,$CC,$80   ;C0C9C6|        |      ;
db $08,$00,$E2,$FF,$00,$02,$82,$25   ;C0C9CE|        |      ;
db $FE,$02,$80,$1B,$02,$82,$02,$B2   ;C0C9D6|        |008002;
db $04,$CC,$80,$08,$00,$E2,$FF,$00   ;C0C9DE|        |0000CC;
db $02,$02,$03,$11,$02,$04,$02,$9A   ;C0C9E6|        |      ;
db $20,$00,$F6,$C9,$0E,$CA,$21,$CA   ;C0C9EE|        |C0F600;
db $02,$80,$13,$02,$82,$02,$80,$19   ;C0C9F6|        |      ;
db $02,$82,$02,$B2,$F9,$CB,$80,$FE   ;C0C9FE|        |      ;
db $FF,$E0,$FF,$00,$02,$82,$35,$FE   ;C0CA06|        |00FFE0;
db $02,$80,$1B,$02,$82,$02,$B2,$04   ;C0CA0E|        |      ;
db $CC,$80,$08,$00,$E2,$FF,$00,$02   ;C0CA16|        |000880;
db $82,$DB,$FD,$02,$80,$0E,$02,$82   ;C0CA1E|        |C0C7FC;
db $02,$80,$18,$02,$82,$02,$B2,$EE   ;C0CA26|        |      ;
db $CB,$80,$12,$00,$E0,$FF,$00,$02   ;C0CA2E|        |      ;
db $82,$41,$FE,$BD,$16,$00,$09,$00   ;C0CA36|        |C0C87A;
db $02,$9D,$16,$00,$02,$80,$16,$02   ;C0CA3E|        |      ;
db $82,$02,$B2,$54,$CB,$80,$00,$00   ;C0CA46|        |C07C4B;
db $F0,$FF,$00,$02,$02,$80,$17,$02   ;C0CA4E|        |C0CA4F;
db $82,$02,$81,$14,$02,$02,$83,$BD   ;C0CA56|        |C04B5B;
db $16,$00,$29,$FF,$FD,$9D,$16,$00   ;C0CA5E|        |000000;
db $82,$10,$FD,$02,$80,$11,$02,$82   ;C0CA66|        |C0C779;
db $00,$5F,$02,$81,$22,$10,$02,$83   ;C0CA6E|        |      ;
db $02,$81,$23,$08,$02,$83,$02,$03   ;C0CA76|        |      ;
db $3D,$02,$04,$82,$1B,$00,$02,$80   ;C0CA7E|        |000402;
db $12,$02,$82,$00,$5F,$02,$81,$22   ;C0CA86|        |000002;
db $10,$02,$83,$02,$81,$23,$08,$02   ;C0CA8E|        |C0CA92;
db $83,$02,$03,$3D,$02,$04,$82,$42   ;C0CA96|        |000002;
db $00,$20,$23,$CB,$9D,$02,$00,$A9   ;C0CA9E|        |      ;
db $30,$00,$9D,$00,$00,$00,$5F,$02   ;C0CAA6|        |C0CAA8;
db $81,$23,$08,$02,$83,$02,$81,$22   ;C0CAAE|        |000023;
db $10,$02,$83,$BD,$25,$00,$29,$FF   ;C0CAB6|        |C0CABA;
db $00,$9D,$30,$00,$02,$09,$00,$00   ;C0CABE|        |      ;
db $02,$09,$01,$00,$BD,$16,$00,$29   ;C0CAC6|        |      ;
db $FF,$FC,$9D,$16,$00,$02,$80,$0E   ;C0CACE|        |169DFC;
db $02,$82,$02,$81,$04,$04,$02,$83   ;C0CAD6|        |      ;
db $82,$57,$FC,$20,$23,$CB,$9D,$02   ;C0CADE|        |C0C738;
db $00,$A9,$A0,$01,$9D,$00,$00,$00   ;C0CAE6|        |      ;
db $5F,$02,$81,$23,$08,$02,$83,$02   ;C0CAEE|        |238102;
db $81,$22,$10,$02,$83,$BD,$25,$00   ;C0CAF6|        |000022;
db $29,$FF,$00,$9D,$30,$00,$02,$09   ;C0CAFE|        |      ;
db $00,$00,$02,$09,$01,$00,$BD,$16   ;C0CB06|        |      ;
db $00,$29,$FF,$FC,$9D,$16,$00,$02   ;C0CB0E|        |      ;
db $80,$13,$02,$82,$02,$81,$06,$04   ;C0CB16|        |C0CB2B;
db $02,$83,$82,$D4,$FB,$02,$1F,$AD   ;C0CB1E|        |      ;
db $02,$03,$29,$FF,$00,$A0,$A0,$00   ;C0CB26|        |      ;
db $38,$E9,$33,$00,$30,$1E,$A0,$E0   ;C0CB2E|        |      ;
db $00,$38,$E9,$33,$00,$30,$15,$A0   ;C0CB36|        |      ;
db $20,$01,$38,$E9,$33,$00,$30,$0C   ;C0CB3E|        |C03801;
db $A0,$60,$01,$38,$E9,$33,$00,$30   ;C0CB46|        |      ;
db $03,$A0,$A0,$01,$98,$60,$02,$A3   ;C0CB4E|        |0000A0;
db $02,$80,$20,$02,$82,$02,$B2,$6E   ;C0CB56|        |      ;
db $CB,$80,$08,$00,$F8,$FF,$00,$03   ;C0CB5E|        |      ;
db $02,$80,$21,$02,$82,$02,$86,$6B   ;C0CB66|        |      ;
db $00,$61,$02,$80,$1C,$02,$82,$02   ;C0CB6E|        |      ;
db $80,$1D,$02,$82,$BD,$02,$00,$10   ;C0CB76|        |C0CB95;
db $F6,$02,$80,$1D,$02,$82,$02,$03   ;C0CB7E|        |000002;
db $0C,$00,$52,$02,$B0,$9B,$CB,$80   ;C0CB86|        |005200;
db $00,$03,$02,$1B,$96,$CB,$0C,$00   ;C0CB8E|        |      ;
db $02,$04,$02,$86,$6B,$02,$1F,$AD   ;C0CB96|        |      ;
db $02,$03,$29,$7F,$00,$38,$E9,$40   ;C0CB9E|        |      ;
db $00,$18,$6D,$74,$03,$9D,$00,$00   ;C0CBA6|        |      ;
db $02,$1F,$AD,$02,$03,$29,$7F,$00   ;C0CBAE|        |      ;
db $38,$E9,$40,$00,$18,$6D,$76,$03   ;C0CBB6|        |      ;
db $38,$E9,$FF,$00,$9D,$02,$00,$02   ;C0CBBE|        |      ;
db $81,$1E,$10,$02,$83,$A9,$00,$02   ;C0CBC6|        |00001E;
db $9D,$16,$00,$00,$5A,$02,$A4,$02   ;C0CBCE|        |000016;
db $A1,$F8,$FF,$F8,$FF,$02,$80,$1F   ;C0CBD6|        |0000F8;
db $02,$82,$02,$86,$6B,$00,$5D,$02   ;C0CBDE|        |      ;
db $97,$02,$80,$02,$02,$82,$80,$21   ;C0CBE6|        |000002;
db $00,$5D,$02,$96,$02,$80,$00,$02   ;C0CBEE|        |      ;
db $82,$80,$16,$00,$5D,$02,$97,$02   ;C0CBF6|        |C0E279;
db $80,$00,$02,$82,$80,$0B,$00,$5D   ;C0CBFE|        |C0CC00;
db $02,$A3,$02,$97,$02,$80,$01,$02   ;C0CC06|        |      ;
db $82,$02,$A3,$02,$81,$03,$03,$02   ;C0CC0E|        |C06F13;
db $83,$A0,$03,$00,$E2,$20,$A9,$80   ;C0CC16|        |0000A0;
db $48,$C2,$20,$A9,$9E,$AD,$48,$6B   ;C0CC1E|        |      ;
db $EE,$64,$04,$8E,$9C,$03,$02,$85   ;C0CC26|        |000464;
db $41,$CD,$80,$02,$80,$08,$02,$82   ;C0CC2E|        |0000CD;
db $02,$9B,$70,$00,$40,$CC,$40,$CC   ;C0CC36|        |      ;
db $47,$CC,$02,$80,$09,$02,$82,$80   ;C0CC3E|        |0000CC;
db $EF,$02,$80,$0A,$02,$82,$02,$87   ;C0CC46|        |0A8002;
db $02,$80,$03,$02,$82,$02,$80,$04   ;C0CC4E|        |      ;
db $02,$82,$02,$81,$00,$02,$02,$83   ;C0CC56|        |      ;
db $02,$1F,$AD,$02,$03,$29,$07,$00   ;C0CC5E|        |      ;
db $C9,$05,$00,$B0,$1A,$02,$80,$0E   ;C0CC66|        |      ;
db $02,$82,$00,$56,$02,$81,$0F,$0D   ;C0CC6E|        |      ;
db $02,$83,$02,$80,$10,$02,$82,$02   ;C0CC76|        |      ;
db $80,$02,$02,$82,$82,$AC,$FF,$02   ;C0CC7E|        |C0CC82;
db $80,$01,$02,$82,$02,$80,$1B,$02   ;C0CC86|        |C0CC89;
db $82,$BD,$00,$00,$C9,$F0,$00,$F0   ;C0CC8E|        |C0CD4E;
db $41,$C9,$E0,$01,$F0,$3C,$02,$9A   ;C0CC96|        |0000C9;
db $18,$00,$A6,$CC,$AD,$CC,$A6,$CC   ;C0CC9E|        |      ;
db $02,$80,$1B,$02,$82,$80,$E2,$02   ;C0CCA6|        |      ;
db $80,$04,$02,$82,$02,$B2,$E2,$CC   ;C0CCAE|        |C0CCB4;
db $80,$08,$00,$08,$00,$00,$02,$02   ;C0CCB6|        |C0CCC0;
db $80,$00,$02,$82,$80,$E2,$BD,$00   ;C0CCBE|        |C0CCC0;
db $00,$C9,$F0,$00,$F0,$0C,$C9,$E0   ;C0CCC6|        |      ;
db $01,$F0,$07,$02,$80,$1B,$02,$82   ;C0CCCE|        |0000F0;
db $80,$EC,$02,$80,$04,$02,$82,$02   ;C0CCD6|        |C0CCC4;
db $87,$82,$76,$FF,$02,$80,$18,$02   ;C0CCDE|        |000082;
db $82,$02,$80,$19,$02,$82,$02,$80   ;C0CCE6|        |C04CEB;
db $1A,$02,$82,$00,$65,$02,$B0,$07   ;C0CCEE|        |      ;
db $CD,$80,$00,$02,$02,$80,$19,$02   ;C0CCF6|        |000080;
db $82,$02,$80,$18,$02,$82,$02,$86   ;C0CCFE|        |C04D03;
db $6B,$02,$81,$17,$02,$02,$83,$02   ;C0CD06|        |      ;
db $B0,$17,$CD,$80,$00,$02,$02,$86   ;C0CD0E|        |C0CD27;
db $6B,$02,$80,$16,$02,$82,$02,$9B   ;C0CD16|        |      ;
db $00,$00,$26,$CD,$2E,$CD,$2E,$CD   ;C0CD1E|        |      ;
db $BD,$16,$00,$89,$00,$80,$D0,$10   ;C0CD26|        |000016;
db $02,$B2,$17,$CD,$80,$00,$00,$10   ;C0CD2E|        |      ;
db $00,$00,$02,$02,$80,$1C,$02,$82   ;C0CD36|        |      ;
db $02,$86,$6B,$AC,$9C,$03,$B9,$25   ;C0CD3E|        |      ;
db $00,$29,$FF,$00,$9D,$30,$00,$02   ;C0CD46|        |      ;
db $91,$AC,$9C,$03,$B9,$16,$00,$89   ;C0CD4E|        |0000AC;
db $00,$04,$D0,$3A,$B9,$25,$00,$29   ;C0CD56|        |      ;
db $FF,$00,$DD,$30,$00,$D0,$01,$6B   ;C0CD5E|        |30DD00;
db $B9,$00,$00,$9D,$00,$00,$B9,$02   ;C0CD66|        |000000;
db $00,$38,$E9,$08,$00,$9D,$02,$00   ;C0CD6E|        |      ;
db $02,$B0,$97,$CD,$80,$00,$03,$02   ;C0CD76|        |      ;
db $B0,$97,$CD,$80,$00,$03,$02,$B0   ;C0CD7E|        |C0CD17;
db $A3,$CD,$80,$00,$03,$02,$B0,$A3   ;C0CD86|        |0000CD;
db $CD,$80,$00,$03,$80,$AD,$02,$86   ;C0CD8E|        |000080;
db $6B,$20,$AF,$CD,$02,$81,$14,$04   ;C0CD96|        |      ;
db $02,$83,$02,$86,$6B,$20,$AF,$CD   ;C0CD9E|        |      ;
db $02,$81,$15,$04,$02,$83,$02,$86   ;C0CDA6|        |      ;
db $6B,$02,$1F,$02,$35,$30,$AD,$43   ;C0CDAE|        |      ;
db $04,$38,$E9,$10,$00,$18,$6D,$00   ;C0CDB6|        |000038;
db $00,$9D,$00,$00,$60

Script_A7_FirstDeathtollPhase:
db $8E,$9C,$03   ;C0CDBE|        |      ;
db $BD,$1A,$00,$09,$00,$02,$9D,$1A   ;C0CDC6|        |00001A;
db $00,$02,$9F,$08,$00,$02,$91,$AC   ;C0CDCE|        |      ;
db $9E,$03,$B9,$02,$00,$C9,$80,$00   ;C0CDD6|        |00B903;
db $90,$01,$6B,$02,$85,$C0,$B1,$80   ;C0CDDE|        |C0CDE1;
db $A9,$04,$00,$99,$30,$00,$02,$1B   ;C0CDE6|        |      ;
db $F2,$CD,$04,$00,$A9,$C0,$2F,$0C   ;C0CDEE|        |0000CD;
db $26,$03,$00,$A0,$02,$80,$01,$02   ;C0CDF6|        |000003;
db $82,$A9,$00,$01,$8D,$44,$03,$02   ;C0CDFE|        |C0CEAA;
db $01,$30,$CF,$A9,$C0,$2F,$1C,$26   ;C0CE06|        |000030;
db $03,$BD,$16,$00,$29,$FF,$FD,$9D   ;C0CE0E|        |0000BD;
db $16,$00,$02,$32,$0D,$80,$5F,$02   ;C0CE16|        |000000;
db $1F,$02,$35,$A0,$AD,$43,$04,$18   ;C0CE1E|        |A03502;
db $69,$28,$00,$9D,$00,$00,$A9,$60   ;C0CE26|        |      ;
db $00,$9D,$02,$00,$02,$80,$01,$02   ;C0CE2E|        |      ;
db $82,$BD,$16,$00,$29,$FF,$FD,$9D   ;C0CE36|        |C0E4F6;
db $16,$00,$02,$80,$02,$02,$82,$00   ;C0CE3E|        |000000;
db $4B,$02,$B2,$83,$CE,$80,$00,$00   ;C0CE46|        |      ;
db $EE,$FF,$00,$02,$02,$B2,$C2,$CE   ;C0CE4E|        |0000FF;
db $80,$00,$00,$EE,$FF,$00,$02,$02   ;C0CE56|        |C0CE58;
db $B2,$01,$CF,$80,$00,$00,$EE,$FF   ;C0CE5E|        |000001;
db $00,$02,$02,$80,$03,$02,$82,$02   ;C0CE66|        |      ;
db $1B,$73,$CE,$50,$00,$BD,$16,$00   ;C0CE6E|        |      ;
db $09,$00,$02,$9D,$16,$00,$02,$80   ;C0CE76|        |      ;
db $04,$02,$82,$80,$9A,$02,$A3,$02   ;C0CE7E|        |000002;
db $97,$02,$90,$02,$88,$02,$9A,$20   ;C0CE86|        |000002;
db $00,$95,$CE,$9C,$CE,$9C,$CE,$02   ;C0CE8E|        |      ;
db $80,$0A,$02,$82,$80,$EF,$02,$80   ;C0CE96|        |C0CEA2;
db $05,$02,$82,$02,$9B,$20,$00,$AB   ;C0CE9E|        |000002;
db $CE,$B2,$CE,$AB,$CE,$02,$80,$09   ;C0CEA6|        |00CEB2;
db $02,$82,$80,$EF,$02,$96,$02,$80   ;C0CEAE|        |      ;
db $06,$02,$82,$02,$81,$0A,$10,$02   ;C0CEB6|        |000002;
db $83,$02,$86,$6B,$02,$A3,$02,$96   ;C0CEBE|        |000002;
db $02,$90,$02,$88,$02,$9A,$20,$00   ;C0CEC6|        |      ;
db $DB,$CE,$DB,$CE,$D4,$CE,$02,$80   ;C0CECE|        |      ;
db $0A,$02,$82,$80,$EF,$02,$80,$05   ;C0CED6|        |      ;
db $02,$82,$02,$9B,$20,$00,$EA,$CE   ;C0CEDE|        |      ;
db $F1,$CE,$EA,$CE,$02,$80,$09,$02   ;C0CEE6|        |0000CE;
db $82,$80,$EF,$02,$97,$02,$80,$06   ;C0CEEE|        |C0BE71;
db $02,$82,$02,$81,$0A,$10,$02,$83   ;C0CEF6|        |      ;
db $02,$86,$6B,$02,$A3,$02,$97,$02   ;C0CEFE|        |      ;
db $9B,$20,$00,$16,$CF,$16,$CF,$0F   ;C0CF06|        |      ;
db $CF,$02,$80,$08,$02,$82,$80,$EF   ;C0CF0E|        |088002;
db $02,$9A,$00,$00,$22,$CF,$22,$CF   ;C0CF16|        |      ;
db $20,$CF,$02,$96,$02,$80,$07,$02   ;C0CF1E|        |C002CF;
db $82,$02,$81,$0B,$08,$02,$83,$02   ;C0CF26|        |C0502B;
db $86,$6B,$10,$45,$69,$6E,$65,$20   ;C0CF2E|        |00006B;
db $61,$72,$6D,$65,$20,$4B,$72,$65   ;C0CF36|        |000072;
db $61,$74,$75,$72,$2C,$20,$B5,$0D   ;C0CF3E|        |000074;
db $DF,$73,$74,$65,$72,$62,$65,$6E   ;C0CF46|        |657473;
db $20,$D7,$0D,$77,$65,$69,$6C,$20   ;C0CF4E|        |C00DD7;
db $69,$68,$72,$20,$47,$65,$69,$73   ;C0CF56|        |      ;
db $74,$20,$75,$6E,$2D,$0D,$73,$74   ;C0CF5E|        |000020;
db $65,$72,$62,$6C,$69,$63,$68,$20   ;C0CF66|        |000072;
db $69,$73,$74,$2E,$11,$8F,$F2,$85   ;C0CF6E|        |      ;
db $D3,$0D,$74,$69,$65,$66,$65,$6E   ;C0CF76|        |00000D;
db $20,$53,$63,$68,$6C,$61,$66,$20   ;C0CF7E|        |C06353;
db $0D,$76,$65,$72,$73,$65,$74,$7A   ;C0CF86|        |006576;
db $65,$6E,$2E,$12,$08,$06,$04,$0C   ;C0CF8E|        |00006E;

Script_A7_FirstDeathtollPhaseDead:
db $AC,$9C,$03,$B9,$16,$00,$89,$00   ;C0CF96|        |00039C;
db $04,$D0,$01,$6B,$8E,$9C,$03,$B9   ;C0CF9E|        |0000D0;
db $00,$00,$9D,$00,$00,$B9,$02,$00   ;C0CFA6|        |      ;
db $9D,$02,$00,$02,$1B,$B7,$CF,$B4   ;C0CFAE|        |000002;
db $00,$BD,$16,$00,$29,$FF,$DF,$9D   ;C0CFB6|        |      ;
db $16,$00,$02,$85,$E7,$CF,$80,$02   ;C0CFBE|        |000000;
db $80,$1F,$02,$82,$02,$08,$00,$80   ;C0CFC6|        |C0CFE7;
db $C5,$CF,$02,$85,$F2,$CF,$80,$02   ;C0CFCE|        |0000CF;
db $81,$1F,$03,$02,$83,$02,$10,$15   ;C0CFD6|        |00001F;
db $02,$01,$78,$00,$C8,$00,$02,$91   ;C0CFDE|        |      ;
db $6B,$02,$01,$FF,$CF,$02,$09,$00   ;C0CFE6|        |      ;
db $80,$02,$86,$6B,$02,$A8,$00,$80   ;C0CFEE|        |C0CFF2;
db $8D,$02,$92,$48,$02,$94,$02,$86   ;C0CFF6|        |009202;
db $6B

; @DEFAULT_TEXTBOX@
; "Es gibt Leute, die "
; "glauben , daß immer-"
; "währende Reinkarnation "
; "ewiges Leiden bedeutet" WFE
; "Leben bedeutet "
; "Schmerz für einige "
; "Lebewesen." WFE
; "Du wirst noch sehen,"
; "was ich meine." WFAK
; CLEARBOX 6 4
; CONT
db $10
db $8C,$CB,'L','e','u','t','e',',',' ',$B5,$0D
db 'g','l','a','u','b','e','n',' ',',',' ',$BA,'i','m','m','e','r','-',$0D
db 'w','ä','h','r','e','n','d','e',' ','R','e','i','n','k','a','r','n','a','t','i','o','n',' ',$0D
db 'e','w','i','g','e','s',' ','L','e','i','d','e','n',' ','b','e','d','e','u','t','e','t',$11
db 'L','e','b','e','n',' ','b','e','d','e','u','t','e','t',' ',$0D
db 'S','c','h','m','e','r','z',' ',$C9,'e','i','n','i','g','e',' ',$0D
db 'L','e','b','e','w','e','s','e','n','.',$11
db $83,$FA,$E0,'s','e','h','e','n',',',$0D
db $F9,$D1,'m','e','i','n','e','.',$12
db $08,$06,$04
db $0C
; @END@

incsrc "scripts/a7/deathtoll_final_battle.asm"

incsrc "bankC0/brk.asm"
incsrc "bankC0/cop.asm"

; This function is used to manipulate the Gamestate
;
; Each Gamestate is described by a offset into the table `game_state` and a bit shift
; `AB` contains the information.
; If the highbit is set `0x8000`, then the state is set, else it will be reset
SetResetGameStateBit:
    PHX
    STA.B $00
    AND.W #$FF
    TAX
    LDA.B $01
    AND.W #$7F
    TAY
    SEP #$20
    LDA.B $01
    BPL .reset
    LDA.L BitMask, X
    ORA.W game_state, Y
    BRA .store
.reset:
    LDA.L BitMask, X
    EOR.B #$FF
    AND.W game_state, Y
.store:
    STA.W game_state, Y
    PLX
    REP #$20
    RTS

; Checks wether the gamestatebit in `AB` is set or clear
;
; If it's set, the carry bit is set, else it's cleared
CheckGameStateBit:
    PHX
    STA.B $00
    AND.W #$00FF
    TAX
    LDA.B $01
    AND.W #$7F
    TAY
    SEP #$20
    LDA.L BitMask, X
    AND.W game_state, Y
    SEC
    BNE + : CLC : +
    PLX
    REP #$20
    RTS

BitMask:
    db $01,$02,$04,$08,$10,$20,$40,$80

; A(8) contains the item id to check
; The carry bit is clear if the item is in the inventory of the player, it is set if not
; Also A(8) contains the value of that slot afterwards
CheckIfItemIsObtained:
    SEP #$20
    PHA
    TAY
    DEY
    LDA.W Inventory, Y
    AND.B #~$80
    BNE .not
    PLA
    REP #$20
    SEC
    RTS
.not:
    PLA
    LDA.W Inventory, Y
    REP #$20
    CLC
    RTS

make_npc_unpassable:
    LDA.W $0010, X
    CLC                                  ;C0E5B2|18      |      ;
    ADC.W $0012,X                        ;C0E5B3|7D1200  |810012;
    CMP.W #$0021                         ;C0E5B6|C92100  |      ;
    BCS .do_it                      ;C0E5B9|B020    |C0E5DB;
    PHX                                  ;C0E5BB|DA      |      ;
    LDA.W $0000,X                        ;C0E5BC|BD0000  |810000;
    STA.B $16                            ;C0E5BF|8516    |000016;
    LDA.W $0002,X                        ;C0E5C1|BD0200  |810002;
    SEC                                  ;C0E5C4|38      |      ;
    SBC.W #$0010                         ;C0E5C5|E91000  |      ;
    STA.B $18                            ;C0E5C8|8518    |000018;
    JSL.L ConvPosToArrayIdx                    ;C0E5CA|22E08183|8381E0;
    LDA.L passable_map,X                      ;C0E5CE|BF00807F|7F8000;
    ORA.W #$00F0                         ;C0E5D2|09F000  |      ;
    STA.L passable_map,X                      ;C0E5D5|9F00807F|7F8000;
    PLX                                  ;C0E5D9|FA      |      ;
    RTS                                  ;C0E5DA|60      |      ;

.do_it:
    TXY                                  ;C0E5DB|9B      |      ;
    LDA.W $0012,Y                        ;C0E5DC|B91200  |810012;
    LSR A                                ;C0E5DF|4A      |      ;
    LSR A                                ;C0E5E0|4A      |      ;
    LSR A                                ;C0E5E1|4A      |      ;
    LSR A                                ;C0E5E2|4A      |      ;
    STA.B $0C                            ;C0E5E3|850C    |00000C;
    LDA.W $0000,X                        ;C0E5E5|BD0000  |810000;
    STA.B $16                            ;C0E5E8|8516    |000016;
    LDA.W $0002,X                        ;C0E5EA|BD0200  |810002;
    SEC                                  ;C0E5ED|38      |      ;
    SBC.W $0012,X                        ;C0E5EE|FD1200  |810012;

.outer_loop:
    STA.B $18                            ;C0E5F1|8518    |000018;
    JSL.L ConvPosToArrayIdx                    ;C0E5F3|22E08183|8381E0;
    LDA.W $0010,Y                        ;C0E5F7|B91000  |810010;
    LSR A                                ;C0E5FA|4A      |      ;
    LSR A                                ;C0E5FB|4A      |      ;
    LSR A                                ;C0E5FC|4A      |      ;
    LSR A                                ;C0E5FD|4A      |      ;
    STA.B $0E                            ;C0E5FE|850E    |00000E;

.inner_loop:
    LDA.L passable_map,X
    ORA.W #$00F0
    STA.L passable_map,X
    JSL.L CODE_C38242
    DEC.B $0E
    BNE .inner_loop
    LDA.B $18
    CLC
    ADC.W #$0010
    DEC.B $0C
    BNE .outer_loop
    TYX
    RTS

make_npc_passable:
LDA.W LiveEntities._10, X
CLC                                  ;C0E622|18      |      ;
ADC.W LiveEntities._12, X
CMP.W #$0021                         ;C0E626|C92100  |      ;
BCS CODE_C0E64B                      ;C0E629|B020    |C0E64B;
PHX                                  ;C0E62B|DA      |      ;
LDA.W LiveEntities.pos_x, X
STA.B $16                            ;C0E62F|8516    |000016;
LDA.W LiveEntities.pos_y, X
SEC                                  ;C0E634|38      |      ;
SBC.W #$0010                         ;C0E635|E91000  |      ;
STA.B $18                            ;C0E638|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C0E63A|22E08183|8381E0;
LDA.L passable_map, X
AND.W #$FF00                         ;C0E642|2900FF  |      ;
STA.L passable_map, X
PLX                                  ;C0E649|FA      |      ;
RTS                                  ;C0E64A|60      |      ;

CODE_C0E64B:
TXY                                  ;C0E64B|9B      |      ;
LDA.W LiveEntities._12, Y                        ;C0E64C|B91200  |810012;
LSR #4
STA.B $0C                            ;C0E653|850C    |00000C;
LDA.W LiveEntities.pos_x, X
STA.B $16                            ;C0E658|8516    |000016;
LDA.W LiveEntities.pos_y, X
SEC                                  ;C0E65D|38      |      ;
SBC.W LiveEntities._12, X

CODE_C0E661:
STA.B $18                            ;C0E661|8518    |000018;
JSL.L ConvPosToArrayIdx                    ;C0E663|22E08183|8381E0;
LDA.W $0010,Y                        ;C0E667|B91000  |810010;
LSR A                                ;C0E66A|4A      |      ;
LSR A                                ;C0E66B|4A      |      ;
LSR A                                ;C0E66C|4A      |      ;
LSR A                                ;C0E66D|4A      |      ;
STA.B $0E                            ;C0E66E|850E    |00000E;

CODE_C0E670:
LDA.L passable_map,X                      ;C0E670|BF00807F|7F8000;
AND.W #$FF00                         ;C0E674|2900FF  |      ;
STA.L passable_map,X                      ;C0E677|9F00807F|7F8000;
JSL.L CODE_C38242                    ;C0E67B|22428283|838242;
DEC.B $0E                            ;C0E67F|C60E    |00000E;
BNE CODE_C0E670                      ;C0E681|D0ED    |C0E670;
LDA.B $18                            ;C0E683|A518    |000018;
CLC                                  ;C0E685|18      |      ;
ADC.W #$0010                         ;C0E686|691000  |      ;
DEC.B $0C                            ;C0E689|C60C    |00000C;
BNE CODE_C0E661                      ;C0E68B|D0D4    |C0E661;
TYX                                  ;C0E68D|BB      |      ;
RTS                                  ;C0E68E|60      |      ;

; Store in Y the index into the `entities_table` derived from A(8)
MakeLiveEntitiesIndex:
    SEP #$20
    XBA
    LDA.B #objectsize(LiveEntities)
    ; multiply A times the objectsize of `LiveEntities`
    JSL.L multiply
    REP #$20
    CLC
    ADC.W #entities_table
    TAY
    RTS

A_times_16:
    ASL #4
    RTS

CODE_C0E6A5:
    PHA
    PHX
    ASL
    TAX
    LDA.B 1, S
    STA.L _7F0483, X
    PLX
    PLA
    RTS

CODE_C0E6B2:
JSL.L TakeEntityPtr                    ;C0E6B2|2202E780|80E702;
BCS CODE_C0E6D9                      ;C0E6B6|B021    |C0E6D9;
TXA                                  ;C0E6B8|8A      |      ;
STA.W $003E,Y                        ;C0E6B9|993E00  |81003E;
LDA.W $003C,X                        ;C0E6BC|BD3C00  |81003C;
STA.W $003C,Y                        ;C0E6BF|993C00  |81003C;
TYA                                  ;C0E6C2|98      |      ;
STA.W $003C,X                        ;C0E6C3|9D3C00  |81003C;
PHX                                  ;C0E6C6|DA      |      ;
LDX.W $003C,Y                        ;C0E6C7|BE3C00  |81003C;
BNE CODE_C0E6D1                      ;C0E6CA|D005    |C0E6D1;
STY.W $06B2                          ;C0E6CC|8CB206  |8106B2;
BRA CODE_C0E6D5                      ;C0E6CF|8004    |C0E6D5;

CODE_C0E6D1:
TYA                                  ;C0E6D1|98      |      ;
STA.W $003E,X                        ;C0E6D2|9D3E00  |81003E;

CODE_C0E6D5:
PLX                                  ;C0E6D5|FA      |      ;
JSR.W CODE_C0E71B                    ;C0E6D6|201BE7  |C0E71B;

CODE_C0E6D9:
RTS                                  ;C0E6D9|60      |      ;

CODE_C0E6DA:
JSL.L TakeEntityPtr                    ;C0E6DA|2202E780|80E702;
BCS CODE_C0E701                      ;C0E6DE|B021    |C0E701;
TXA                                  ;C0E6E0|8A      |      ;
STA.W $003C,Y                        ;C0E6E1|993C00  |81003C;
LDA.W $003E,X                        ;C0E6E4|BD3E00  |81003E;
STA.W $003E,Y                        ;C0E6E7|993E00  |81003E;
TYA                                  ;C0E6EA|98      |      ;
STA.W $003E,X                        ;C0E6EB|9D3E00  |81003E;
PHX                                  ;C0E6EE|DA      |      ;
LDX.W $003E,Y                        ;C0E6EF|BE3E00  |81003E;
BEQ CODE_C0E6FA                      ;C0E6F2|F006    |C0E6FA;
TYA                                  ;C0E6F4|98      |      ;
STA.W $003C,X                        ;C0E6F5|9D3C00  |81003C;
BRA CODE_C0E6FD                      ;C0E6F8|8003    |C0E6FD;

CODE_C0E6FA:
STY.W $06B4                          ;C0E6FA|8CB406  |8106B4;

CODE_C0E6FD:
PLX                                  ;C0E6FD|FA      |      ;
JSR.W CODE_C0E71B                    ;C0E6FE|201BE7  |C0E71B;

CODE_C0E701:
RTS                                  ;C0E701|60      |      ;


;;; Loads an entity pointer from $4A and zeros it afterwards
;;;
;;; If an entity pointer could be loaded, the carry bit is cleared
;;; else the default entity pointer $6B6 will be loaded and the carry bit is set
TakeEntityPtr:
    LDA.B ($4A)
    BEQ .load_default

    TAY ; transfer pointer to Y and place zero into that point
    LDA.W #$0000
    STA.B ($4A)
    SEP #$20
    INC.B $4A
    INC.B $4A
    REP #$20
    CLC
    RTL

.load_default:
    SEC
    LDY.W #$6B6
    RTL

CODE_C0E71B:
PHX                                  ;C0E71B|DA      |      ;
PHY                                  ;C0E71C|5A      |      ;
LDA.W #$003B                         ;C0E71D|A93B00  |      ;
MVN $81,$81                          ;C0E720|548181  |      ;
PLY                                  ;C0E723|7A      |      ;
PLX                                  ;C0E724|FA      |      ;
LDA.W $0016,Y                        ;C0E725|B91600  |810016;
ORA.W #$2000                         ;C0E728|090020  |      ;
AND.W #$FFEF                         ;C0E72B|29EFFF  |      ;
STA.W $0016,Y                        ;C0E72E|991600  |810016;
LDA.W #$0000                         ;C0E731|A90000  |      ;
STA.W $001A,Y                        ;C0E734|991A00  |81001A;
STA.W $0030,Y                        ;C0E737|993000  |810030;
STA.W $0014,Y                        ;C0E73A|991400  |810014;
RTS                                  ;C0E73D|60      |      ;
LDA.W #$3080                         ;C0E73E|A98030  |      ;
TSB.W button_mask                          ;C0E741|0C2603  |810326;
STX.W _039E                          ;C0E744|8E9E03  |81039E;
SEP #$20                             ;C0E747|E220    |      ;
LDA.W STAT78                          ;C0E749|AD3F21  |81213F;
BIT.B #$10                           ;C0E74C|8910    |      ;
REP #$20                             ;C0E74E|C220    |      ;
BEQ UNREACH_C0E761                   ;C0E750|F00F    |C0E761;
PHX                                  ;C0E752|DA      |      ;
LDY.W #Txt_Ubisoft_Presents                         ;C0E753|A0ABBB  |      ;
JSL.L printOsdStringFromBank2                    ;C0E756|2254A782|82A754;
PLX                                  ;C0E75A|FA      |      ;
COP #$1B                             ;C0E75B|021B    |      ;
db $70,$E7,$01,$00                   ;C0E75D|        |C0E746;

UNREACH_C0E761:
db $DA,$A0,$4E,$BB,$22,$54,$A7,$82   ;C0E761|        |      ;
db $FA,$02,$1B,$6A,$E7,$01,$00       ;C0E769|        |      ;
SEP #$20                             ;C0E770|E220    |      ;
PHX                                  ;C0E772|DA      |      ;
JSL.L CODE_C5C573                    ;C0E773|2273C585|85C573;
JSL.L CODE_C2A468                    ;C0E777|2268A482|82A468;
JSL.L CODE_C380C7                    ;C0E77B|22C78083|8380C7;
PLX                                  ;C0E77F|FA      |      ;

REP #$20                             ;C0E780|C220    |      ;
COP #$10                             ;C0E782|0210    |      ;
db $00,$0A,$01,$00,$00,$00,$00       ;C0E784|        |      ;
COP #$91                             ;C0E78B|0291    |      ;
RTL                                  ;C0E78D|6B      |      ;
CODE_C0E78E:
LDA.W #Key16.Start | Key16.Select                         ;C0E78E|A90030  |      ;
TSB.W button_mask                          ;C0E791|0C2603  |810326;
STZ.W buttons_pressed                          ;C0E794|9C2203  |810322;
STX.W _039E                          ;C0E797|8E9E03  |81039E;
LDA.W $0451                          ;C0E79A|AD5104  |810451;
BEQ CODE_C0E7A2                      ;C0E79D|F003    |C0E7A2;
BRL CODE_C0ED53                      ;C0E79F|82B105  |C0ED53;

CODE_C0E7A2:
COP #$85                             ;C0E7A2|0285    |      ;
db $F3,$EB,$80                       ;C0E7A4|        |0000EB;
STZ.W $048E                          ;C0E7A7|9C8E04  |81048E;
SEP #$20                             ;C0E7AA|E220    |      ;
LDA.B #$E0                           ;C0E7AC|A9E0    |      ;
STA.L $7F0200                        ;C0E7AE|8F00027F|7F0200;
LDA.B #$0F                           ;C0E7B2|A90F    |      ;
STA.W BGMODE                          ;C0E7B4|8D0521  |812105;
LDA.B #$11                           ;C0E7B7|A911    |      ;
STA.W TM                          ;C0E7B9|8D2C21  |81212C;
REP #$20                             ;C0E7BC|C220    |      ;
LDA.W #$FFC8                         ;C0E7BE|A9C8FF  |      ;
STA.W $0476                          ;C0E7C1|8D7604  |810476;
LDA.W #$003E                         ;C0E7C4|A93E00  |      ;
STA.W $0478                          ;C0E7C7|8D7804  |810478;
LDA.W #$0083                         ;C0E7CA|A98300  |      ;
STA.W $048C                          ;C0E7CD|8D8C04  |81048C;
COP #$91                             ;C0E7D0|0291    |      ;
INC.W $0476                          ;C0E7D2|EE7604  |810476;
LDA.W $0476                          ;C0E7D5|AD7604  |810476;
CMP.W #$013E                         ;C0E7D8|C93E01  |      ;
BEQ CODE_C0E7DE                      ;C0E7DB|F001    |C0E7DE;
RTL                                  ;C0E7DD|6B      |      ;

CODE_C0E7DE:
LDA.W #$0002                         ;C0E7DE|A90200  |      ;
STA.W $048C                          ;C0E7E1|8D8C04  |81048C;
COP #$03                             ;C0E7E4|0203    |      ;
db $1F                               ;C0E7E6|        |A90402;
COP #$04                             ;C0E7E7|0204    |      ;
LDA.W #$0080                         ;C0E7E9|A98000  |      ;
STA.W $0476                          ;C0E7EC|8D7604  |810476;
COP #$91                             ;C0E7EF|0291    |      ;
LDA.W $048C                          ;C0E7F1|AD8C04  |81048C;
CLC                                  ;C0E7F4|18      |      ;
ADC.W #$0004                         ;C0E7F5|690400  |      ;
STA.W $048C                          ;C0E7F8|8D8C04  |81048C;
CMP.W #$0206                         ;C0E7FB|C90602  |      ;
BEQ CODE_C0E801                      ;C0E7FE|F001    |C0E801;
RTL                                  ;C0E800|6B      |      ;

CODE_C0E801:
COP #$03                             ;C0E801|0203    |      ;
db $1F                               ;C0E803|        |DA0402;
COP #$04                             ;C0E804|0204    |      ;
PHX                                  ;C0E806|DA      |      ;
LDY.W #Txt_Rights_Reserved                         ;C0E807|A0D6BB  |      ;
JSL.L printOsdStringFromBank2                    ;C0E80A|2254A782|82A754;
PLX                                  ;C0E80E|FA      |      ;
COP #$85                             ;C0E80F|0285    |      ;
db $F0,$EA,$80                       ;C0E811|        |C0E7FD;
COP #$03                             ;C0E814|0203    |      ;
db $1F                               ;C0E816|        |020402;
COP #$04                             ;C0E817|0204    |      ;
COP #$AC                             ;C0E819|02AC    |      ;
db $E3,$EB,$80,$50,$FF,$80,$00,$00   ;C0E81B|        |0000EB;
db $23                               ;C0E823|        |000002;
COP #$AC                             ;C0E824|02AC    |      ;
db $BB,$EB,$80,$98,$01,$78,$00,$00   ;C0E826|        |      ;
db $03                               ;C0E82E|        |000002;
COP #$AC                             ;C0E82F|02AC    |      ;
db $93,$EB,$80,$98,$01,$78,$00,$00   ;C0E831|        |0000EB;
db $03                               ;C0E839|        |000002;
COP #$85                             ;C0E83A|0285    |      ;
db $22,$EB,$80                       ;C0E83C|        |0280EB;
COP #$03                             ;C0E83F|0203    |      ;
db $F1                               ;C0E841|        |000002;
COP #$04                             ;C0E842|0204    |      ;
PHX                                  ;C0E844|DA      |      ;
LDY.W #Txt_Press_Start                         ;C0E845|A0C5BB  |      ;
JSL.L printOsdStringFromBank2                    ;C0E848|2254A782|82A754;
PLX                                  ;C0E84C|FA      |      ;
LDA.W #$3000                         ;C0E84D|A90030  |      ;
TRB.W button_mask                          ;C0E850|1C2603  |810326;
COP #$03                             ;C0E853|0203    |      ;
db $F1                               ;C0E855|        |000002;
COP #$04                             ;C0E856|0204    |      ;
COP #$03                             ;C0E858|0203    |      ;
db $79                               ;C0E85A|        |000402;
COP #$04                             ;C0E85B|0204    |      ;
COP #$85                             ;C0E85D|0285    |      ;
db $B7,$EA,$80                       ;C0E85F|        |0000EA;
COP #$03                             ;C0E862|0203    |      ;
db $3D                               ;C0E864|        |000402;
COP #$04                             ;C0E865|0204    |      ;
INC.W $048E                          ;C0E867|EE8E04  |81048E;
COP #$03                             ;C0E86A|0203    |      ;
db $79                               ;C0E86C|        |000402;
COP #$04                             ;C0E86D|0204    |      ;
db $DA,$22,$22,$86,$83,$A0,$3C,$BC   ;C0E86F|        |      ;
db $22,$54,$A7,$82,$FA,$02,$85,$D2   ;C0E877|        |82A754;
db $EA,$80,$02,$03,$F1,$02,$04,$02   ;C0E87F|        |      ;
db $03,$F1,$02,$04,$02,$85,$B7,$EA   ;C0E887|        |0000F1;
db $80,$02,$03,$21,$02,$04,$DA,$22   ;C0E88F|        |C0E893;
db $22,$86,$83,$A0,$AE,$BC,$22,$54   ;C0E897|        |A08386;
db $A7,$82,$FA,$02,$85,$D2,$EA,$80   ;C0E89F|        |000082;
db $02,$03,$F1,$02,$04,$02,$03,$F1   ;C0E8A7|        |      ;
db $02,$04,$02,$85,$B7,$EA,$80,$02   ;C0E8AF|        |      ;
db $03,$21,$02,$04,$DA,$22,$22,$86   ;C0E8B7|        |000021;
db $83,$A0,$07,$BD,$22,$54,$A7,$82   ;C0E8BF|        |0000A0;
db $FA,$02,$85,$D2,$EA,$80,$02,$03   ;C0E8C7|        |      ;
db $F1,$02,$04,$02,$03,$F1,$02,$04   ;C0E8CF|        |000002;
db $02,$85,$B7,$EA,$80,$02,$03,$21   ;C0E8D7|        |      ;
db $02,$04,$DA,$22,$22,$86,$83,$A0   ;C0E8DF|        |      ;
db $8E,$BD,$22,$54,$A7,$82,$FA,$02   ;C0E8E7|        |0022BD;
db $85,$D2,$EA,$80,$02,$03,$F1,$02   ;C0E8EF|        |0000D2;
db $04,$02,$03,$F1,$02,$04,$02,$85   ;C0E8F7|        |000002;
db $B7,$EA,$80,$02,$03,$21,$02,$04   ;C0E8FF|        |0000EA;
db $DA,$22,$22,$86,$83,$A0,$19,$BE   ;C0E907|        |      ;
db $22,$54,$A7,$82,$FA,$02,$85,$D2   ;C0E90F|        |82A754;
db $EA,$80,$02,$03,$F1,$02,$04,$02   ;C0E917|        |      ;
db $03,$F1,$02,$04,$02,$85,$B7,$EA   ;C0E91F|        |0000F1;
db $80,$02,$03,$21,$02,$04,$DA,$22   ;C0E927|        |C0E92B;
db $22,$86,$83,$A0,$A9,$BE,$22,$54   ;C0E92F|        |A08386;
db $A7,$82,$FA,$02,$85,$D2,$EA,$80   ;C0E937|        |000082;
db $02,$03,$F1,$02,$04,$02,$03,$F1   ;C0E93F|        |      ;
db $02,$04,$02,$85,$B7,$EA,$80,$02   ;C0E947|        |      ;
db $03,$21,$02,$04,$DA,$22,$22,$86   ;C0E94F|        |000021;
db $83,$A0,$22,$BF,$22,$54,$A7,$82   ;C0E957|        |0000A0;
db $FA,$02,$85,$D2,$EA,$80,$02,$03   ;C0E95F|        |      ;
db $F1,$02,$04,$02,$03,$F1,$02,$04   ;C0E967|        |000002;
db $02,$85,$B7,$EA,$80,$02,$03,$21   ;C0E96F|        |      ;
db $02,$04,$DA,$22,$22,$86,$83,$A0   ;C0E977|        |      ;
db $4D,$BF,$22,$54,$A7,$82,$FA,$02   ;C0E97F|        |0022BF;
db $85,$D2,$EA,$80,$02,$03,$F1,$02   ;C0E987|        |0000D2;
db $04,$02,$03,$F1,$02,$04,$02,$85   ;C0E98F|        |000002;
db $B7,$EA,$80,$02,$03,$21,$02,$04   ;C0E997|        |0000EA;
db $DA,$22,$22,$86,$83,$A0,$E3,$BF   ;C0E99F|        |      ;
db $22,$54,$A7,$82,$FA,$02,$85,$D2   ;C0E9A7|        |82A754;
db $EA,$80,$02,$03,$F1,$02,$04,$02   ;C0E9AF|        |      ;
db $03,$F1,$02,$04,$02,$85,$B7,$EA   ;C0E9B7|        |0000F1;
db $80,$02,$03,$21,$02,$04,$DA,$22   ;C0E9BF|        |C0E9C3;
db $22,$86,$83,$A0,$79,$C0,$22,$54   ;C0E9C7|        |A08386;
db $A7,$82,$FA,$02,$85,$D2,$EA,$80   ;C0E9CF|        |000082;
db $02,$03,$F1,$02,$04,$02,$03,$F1   ;C0E9D7|        |      ;
db $02,$04,$02,$85,$B7,$EA,$80,$02   ;C0E9DF|        |      ;
db $03,$21,$02,$04,$DA,$22,$22,$86   ;C0E9E7|        |000021;
db $83,$A0,$0F,$C1,$22,$54,$A7,$82   ;C0E9EF|        |0000A0;
db $FA,$02,$85,$D2,$EA,$80,$02,$03   ;C0E9F7|        |      ;
db $F1,$02,$04,$02,$03,$F1,$02,$04   ;C0E9FF|        |000002;
db $02,$85,$B7,$EA,$80,$02,$03,$21   ;C0EA07|        |      ;
db $02,$04,$DA,$22,$22,$86,$83,$A0   ;C0EA0F|        |      ;
db $72,$C1,$22,$54,$A7,$82,$FA,$02   ;C0EA17|        |0000C1;
db $85,$D2,$EA,$80,$02,$03,$F1,$02   ;C0EA1F|        |0000D2;
db $04,$02,$03,$F1,$02,$04,$02,$85   ;C0EA27|        |000002;
db $B7,$EA,$80,$02,$03,$21,$02,$04   ;C0EA2F|        |0000EA;
db $DA,$22,$22,$86,$83,$A0,$D1,$C1   ;C0EA37|        |      ;
db $22,$54,$A7,$82,$FA,$02,$85,$D2   ;C0EA3F|        |82A754;
db $EA,$80,$02,$03,$F1,$02,$04,$02   ;C0EA47|        |      ;
db $03,$F1,$02,$04,$02,$85,$B7,$EA   ;C0EA4F|        |0000F1;
db $80,$02,$03,$21,$02,$04,$DA,$22   ;C0EA57|        |C0EA5B;
db $22,$86,$83,$A0,$51,$C2,$22,$54   ;C0EA5F|        |A08386;
db $A7,$82,$FA,$02,$85,$D2,$EA,$80   ;C0EA67|        |000082;
db $02,$03,$F1,$02,$04,$02,$03,$F1   ;C0EA6F|        |      ;
db $02,$04,$02,$03,$F1,$02,$04,$02   ;C0EA77|        |      ;
db $85,$B7,$EA,$80,$02,$03,$21,$02   ;C0EA7F|        |0000B7;
db $04,$22,$22,$86,$83,$02,$03,$1F   ;C0EA87|        |000022;
db $02,$04,$9C,$8E,$04,$02,$03,$81   ;C0EA8F|        |      ;
db $02,$04,$A9,$FF,$FF,$8D,$8E,$04   ;C0EA97|        |      ;
db $A9,$C8,$FF,$8D,$76,$04,$A9,$3E   ;C0EA9F|        |      ;
db $00,$8D,$78,$04,$A9,$83,$00,$8D   ;C0EAA7|        |      ;
db $8C,$04,$02,$1B,$A7,$E7,$01,$00   ;C0EAAF|        |000204;
STZ.W $0030,X                        ;C0EAB7|9E3000  |810030;
COP #$03                             ;C0EABA|0203    |      ;
db $20                               ;C0EABC|        |C020E2;
SEP #$20                             ;C0EABD|E220    |      ;
LDA.W $0030,X                        ;C0EABF|BD3000  |810030;
ORA.B #$E0                           ;C0EAC2|09E0    |      ;
STA.L $7F0200                        ;C0EAC4|8F00027F|7F0200;
REP #$20                             ;C0EAC8|C220    |      ;
INC.W $0030,X                        ;C0EACA|FE3000  |810030;
COP #$04                             ;C0EACD|0204    |      ;
COP #$86                             ;C0EACF|0286    |      ;
RTL                                  ;C0EAD1|6B      |      ;
db $A9,$1F,$00,$9D,$30,$00,$02,$03   ;C0EAD2|        |      ;
db $20,$E2,$20,$BD,$30,$00,$09,$E0   ;C0EADA|        |C020E2;
db $8F,$00,$02,$7F,$C2,$20,$DE,$30   ;C0EAE2|        |7F0200;
db $00,$02,$04,$02,$86,$6B           ;C0EAEA|        |      ;
SEP #$20                             ;C0EAF0|E220    |      ;
LDA.B #$05                           ;C0EAF2|A905    |      ;
XBA                                  ;C0EAF4|EB      |      ;
LDA.B #<:.data1                           ;C0EAF5|A980    |      ;
LDY.W #.data1                         ;C0EAF7|A018EB  |      ;
JSL.L CODE_C2988F                    ;C0EAFA|228F9882|82988F;
LDA.B #$2C                           ;C0EAFE|A92C    |      ;
XBA                                  ;C0EB00|EB      |      ;
LDA.B #<:.data2                           ;C0EB01|A980    |      ;
LDY.W #.data2                         ;C0EB03|A01DEB  |      ;
JSL.L CODE_C2988F                    ;C0EB06|228F9882|82988F;
REP #$20                             ;C0EB0A|C220    |      ;
LDA.W $048E                          ;C0EB0C|AD8E04  |81048E;
BNE .CODE_C0EB12                      ;C0EB0F|D001    |C0EB12;
RTL                                  ;C0EB11|6B      |      ;

.CODE_C0EB12:
STZ.W $0042                          ;C0EB12|9C4200  |810042;
COP #$86                             ;C0EB15|0286    |      ;
RTL                                  ;C0EB17|6B      |      ;
.data1:
db $7F,$0F,$60,$09,$00
.data2:
db $7F,$11,$60,$14,$00                           ;C0EB20|        |000000;
COP #$03                             ;C0EB22|0203    |      ;
db $80                               ;C0EB24|        |C0EAE2;
LDY.W $003E,X                        ;C0EB25|BC3E00  |81003E;
LDA.W $0000,Y                        ;C0EB28|B90000  |810000;
DEC A                                ;C0EB2B|3A      |      ;
DEC A                                ;C0EB2C|3A      |      ;
STA.W $0000,Y                        ;C0EB2D|990000  |810000;
LDA.W $003E,Y                        ;C0EB30|B93E00  |81003E;
TAY                                  ;C0EB33|A8      |      ;
LDA.W $0000,Y                        ;C0EB34|B90000  |810000;
DEC A                                ;C0EB37|3A      |      ;
DEC A                                ;C0EB38|3A      |      ;
STA.W $0000,Y                        ;C0EB39|990000  |810000;
LDA.W $003E,Y                        ;C0EB3C|B93E00  |81003E;
TAY                                  ;C0EB3F|A8      |      ;
LDA.W $0000,Y                        ;C0EB40|B90000  |810000;
INC A                                ;C0EB43|1A      |      ;
INC A                                ;C0EB44|1A      |      ;
STA.W $0000,Y                        ;C0EB45|990000  |810000;
COP #$04                             ;C0EB48|0204    |      ;
COP #$91                             ;C0EB4A|0291    |      ;
LDA.W $048E                          ;C0EB4C|AD8E04  |81048E;
BNE CODE_C0EB52                      ;C0EB4F|D001    |C0EB52;
RTL                                  ;C0EB51|6B      |      ;

CODE_C0EB52:
COP #$03                             ;C0EB52|0203    |      ;
db $40                               ;C0EB54|        |      ;
LDY.W $003E,X                        ;C0EB55|BC3E00  |81003E;
LDA.W $0002,Y                        ;C0EB58|B90200  |810002;
DEC A                                ;C0EB5B|3A      |      ;
STA.W $0002,Y                        ;C0EB5C|990200  |810002;
LDA.W $003E,Y                        ;C0EB5F|B93E00  |81003E;
TAY                                  ;C0EB62|A8      |      ;
LDA.W $0002,Y                        ;C0EB63|B90200  |810002;
DEC A                                ;C0EB66|3A      |      ;
STA.W $0002,Y                        ;C0EB67|990200  |810002;
COP #$04                             ;C0EB6A|0204    |      ;
db $02,$91,$AD,$8E,$04,$F0,$01,$6B   ;C0EB6C|        |      ;
db $02,$03,$80,$BC,$3E,$00,$B9,$00   ;C0EB74|        |      ;
db $00,$3A,$3A,$99,$00,$00,$B9,$3E   ;C0EB7C|        |      ;
db $00,$A8,$B9,$00,$00,$3A,$3A,$99   ;C0EB84|        |      ;
db $00,$00,$02,$04,$02,$86,$6B       ;C0EB8C|        |      ;
COP #$80                             ;C0EB93|0280    |      ;
db $00                               ;C0EB95|        |      ;
COP #$82                             ;C0EB96|0282    |      ;
COP #$91                             ;C0EB98|0291    |      ;
LDA.W $048E                          ;C0EB9A|AD8E04  |81048E;
BMI UNREACH_C0EBB8                   ;C0EB9D|3019    |C0EBB8;
LDA.W $0000,X                        ;C0EB9F|BD0000  |810000;
CMP.W #$0098                         ;C0EBA2|C99800  |      ;
BEQ CODE_C0EBA8                      ;C0EBA5|F001    |C0EBA8;
RTL                                  ;C0EBA7|6B      |      ;

CODE_C0EBA8:
COP #$80                             ;C0EBA8|0280    |      ;
db $03                               ;C0EBAA|        |000002;
COP #$82                             ;C0EBAB|0282    |      ;
COP #$80                             ;C0EBAD|0280    |      ;
db $00                               ;C0EBAF|        |      ;
COP #$82                             ;C0EBB0|0282    |      ;
COP #$1B                             ;C0EBB2|021B    |      ;
db $93,$EB,$2C,$01                   ;C0EBB4|        |0000EB;

UNREACH_C0EBB8:
db $02,$86,$6B                       ;C0EBB8|        |      ;
COP #$80                             ;C0EBBB|0280    |      ;
db $01                               ;C0EBBD|        |000002;
COP #$82                             ;C0EBBE|0282    |      ;
COP #$91                             ;C0EBC0|0291    |      ;
LDA.W $048E                          ;C0EBC2|AD8E04  |81048E;
BMI UNREACH_C0EBE0                   ;C0EBC5|3019    |C0EBE0;
LDA.W $0000,X                        ;C0EBC7|BD0000  |810000;
CMP.W #$0098                         ;C0EBCA|C99800  |      ;
BEQ CODE_C0EBD0                      ;C0EBCD|F001    |C0EBD0;
RTL                                  ;C0EBCF|6B      |      ;

CODE_C0EBD0:
COP #$80                             ;C0EBD0|0280    |      ;
db $04                               ;C0EBD2|        |000002;
COP #$82                             ;C0EBD3|0282    |      ;
COP #$80                             ;C0EBD5|0280    |      ;
db $01                               ;C0EBD7|        |000002;
COP #$82                             ;C0EBD8|0282    |      ;
COP #$1B                             ;C0EBDA|021B    |      ;
db $BB,$EB,$2C,$01                   ;C0EBDC|        |      ;

UNREACH_C0EBE0:
db $02,$86,$6B                       ;C0EBE0|        |      ;
COP #$80                             ;C0EBE3|0280    |      ;
db $02                               ;C0EBE5|        |      ;
COP #$82                             ;C0EBE6|0282    |      ;
COP #$91                             ;C0EBE8|0291    |      ;
LDA.W $048E                          ;C0EBEA|AD8E04  |81048E;
BNE CODE_C0EBF0                      ;C0EBED|D001    |C0EBF0;
RTL                                  ;C0EBEF|6B      |      ;

CODE_C0EBF0:
COP #$86                             ;C0EBF0|0286    |      ;
RTL                                  ;C0EBF2|6B      |      ;
LDA.W buttons_pressed                          ;C0EBF3|AD2203  |810322;
BIT.W #$1000                         ;C0EBF6|890010  |      ;
BNE CODE_C0EBFC                      ;C0EBF9|D001    |C0EBFC;
RTL                                  ;C0EBFB|6B      |      ;

CODE_C0EBFC:
COP #$10                             ;C0EBFC|0210    |      ;
db $00,$0A,$01,$00,$00,$00,$00       ;C0EBFE|        |      ;
LDA.W #$0001                         ;C0EC05|A90100  |      ;
STA.W _031E                          ;C0EC08|8D1E03  |81031E;
STA.W $0451                          ;C0EC0B|8D5104  |810451;
COP #$86                             ;C0EC0E|0286    |      ;
RTL                                  ;C0EC10|6B      |      ;

CODE_C0EC11:
LDA.W current_map_number                          ;C0EC11|AD6A1C  |811C6A;
CMP.B #$10                           ;C0EC14|C910    |      ;
BNE .CODE_C0EC36                      ;C0EC16|D01E    |C0EC36;
JSR.W CODE_C0EC83                    ;C0EC18|2083EC  |C0EC83;
JSR.W CODE_C0EC3A                    ;C0EC1B|203AEC  |C0EC3A;
LDX.W $0482                          ;C0EC1E|AE8204  |810482;
STX.W $047A                          ;C0EC21|8E7A04  |81047A;
LDX.W $0484                          ;C0EC24|AE8404  |810484;
STX.W $047C                          ;C0EC27|8E7C04  |81047C;
LDX.W $0486                          ;C0EC2A|AE8604  |810486;
STX.W $047E                          ;C0EC2D|8E7E04  |81047E;
LDX.W $0488                          ;C0EC30|AE8804  |810488;
STX.W $0480                          ;C0EC33|8E8004  |810480;

.CODE_C0EC36:
RTL                                  ;C0EC36|6B      |      ;
db $20,$E2,$EC                       ;C0EC37|        |C0ECE2;

CODE_C0EC3A:
LDA.W $047A                          ;C0EC3A|AD7A04  |81047A;
STA.W M7A                          ;C0EC3D|8D1B21  |81211B;
LDA.W $047B                          ;C0EC40|AD7B04  |81047B;
STA.W M7A                          ;C0EC43|8D1B21  |81211B;
LDA.W $047C                          ;C0EC46|AD7C04  |81047C;
STA.W M7B                          ;C0EC49|8D1C21  |81211C;
LDA.W $047D                          ;C0EC4C|AD7D04  |81047D;
STA.W M7B                          ;C0EC4F|8D1C21  |81211C;
LDA.W $047E                          ;C0EC52|AD7E04  |81047E;
STA.W M7C                          ;C0EC55|8D1D21  |81211D;
LDA.W $047F                          ;C0EC58|AD7F04  |81047F;
STA.W M7C                          ;C0EC5B|8D1D21  |81211D;
LDA.W $0480                          ;C0EC5E|AD8004  |810480;
STA.W M7D                          ;C0EC61|8D1E21  |81211E;
LDA.W $0481                          ;C0EC64|AD8104  |810481;
STA.W M7D                          ;C0EC67|8D1E21  |81211E;
LDA.W $0476                          ;C0EC6A|AD7604  |810476;
STA.W M7X                          ;C0EC6D|8D1F21  |81211F;
LDA.W $0477                          ;C0EC70|AD7704  |810477;
STA.W M7X                          ;C0EC73|8D1F21  |81211F;
LDA.W $0478                          ;C0EC76|AD7804  |810478;
STA.W M7Y                          ;C0EC79|8D2021  |812120;
LDA.W $0479                          ;C0EC7C|AD7904  |810479;
STA.W M7Y                          ;C0EC7F|8D2021  |812120;
RTS                                  ;C0EC82|60      |      ;

CODE_C0EC83:
SEP #$10                             ;C0EC83|E210    |      ;
LDX.W $048A                          ;C0EC85|AE8A04  |81048A;
REP #$10                             ;C0EC88|C210    |      ;
LDY.W $048C                          ;C0EC8A|AC8C04  |81048C;
STY.B $00                            ;C0EC8D|8400    |000000;
XBA                                  ;C0EC8F|EB      |      ;
LDA.L UNREACH_81FCC4,X               ;C0EC90|BFC4FC81|81FCC4;
STA.B $02                            ;C0EC94|8502    |000002;
JSR.W CODE_C0ED32                    ;C0EC96|2032ED  |C0ED32;
LDY.W MPYM                          ;C0EC99|AC3521  |812135;
STY.W $0482                          ;C0EC9C|8C8204  |810482;
LDY.W $048C                          ;C0EC9F|AC8C04  |81048C;
STY.B $00                            ;C0ECA2|8400    |000000;
XBA                                  ;C0ECA4|EB      |      ;
LDA.L SineWave, X               ;C0ECA5|BF84FC81|81FC84;
STA.B $02                            ;C0ECA9|8502    |000002;
JSR.W CODE_C0ED32                    ;C0ECAB|2032ED  |C0ED32;
LDY.W MPYM                          ;C0ECAE|AC3521  |812135;
STY.W $0484                          ;C0ECB1|8C8404  |810484;
LDY.W $048C                          ;C0ECB4|AC8C04  |81048C;
STY.B $00                            ;C0ECB7|8400    |000000;
XBA                                  ;C0ECB9|EB      |      ;
LDA.L SineWave, X               ;C0ECBA|BF84FC81|81FC84;
EOR.B #$FF                           ;C0ECBE|49FF    |      ;
INC A                                ;C0ECC0|1A      |      ;
STA.B $02                            ;C0ECC1|8502    |000002;
JSR.W CODE_C0ED32                    ;C0ECC3|2032ED  |C0ED32;
LDY.W MPYM                          ;C0ECC6|AC3521  |812135;
STY.W $0486                          ;C0ECC9|8C8604  |810486;
LDY.W $048C                          ;C0ECCC|AC8C04  |81048C;
STY.B $00                            ;C0ECCF|8400    |000000;
XBA                                  ;C0ECD1|EB      |      ;
LDA.L UNREACH_81FCC4,X               ;C0ECD2|BFC4FC81|81FCC4;
STA.B $02                            ;C0ECD6|8502    |000002;
JSR.W CODE_C0ED32                    ;C0ECD8|2032ED  |C0ED32;
LDY.W MPYM                          ;C0ECDB|AC3521  |812135;
STY.W $0488                          ;C0ECDE|8C8804  |810488;
RTS                                  ;C0ECE1|60      |      ;
db $C2,$20,$8A,$EB,$4A,$4A,$18,$69   ;C0ECE2|        |      ;
db $41,$00,$0A,$48,$E2,$20,$8D,$1B   ;C0ECEA|        |000000;
db $21,$EB,$8D,$1B,$21,$BF,$C4,$FC   ;C0ECF2|        |0000EB;
db $81,$8D,$1C,$21,$8D,$1C,$21,$C2   ;C0ECFA|        |00008D;
db $20,$AD,$35,$21,$8D,$7A,$04,$8D   ;C0ED02|        |C035AD;
db $80,$04,$68,$E2,$20,$8D,$1B,$21   ;C0ED0A|        |C0ED10;
db $EB,$8D,$1B,$21,$BF,$84,$FC,$81   ;C0ED12|        |      ;
db $8D,$1C,$21,$8D,$1C,$21,$C2,$20   ;C0ED1A|        |00211C;
db $AD,$35,$21,$8D,$7C,$04,$49,$FF   ;C0ED22|        |002135;
db $FF,$1A,$8D,$7E,$04,$E2,$20,$60   ;C0ED2A|        |7E8D1A;

CODE_C0ED32:
PHP                                  ;C0ED32|08      |      ;
SEP #$20                             ;C0ED33|E220    |      ;
LDA.B $00                            ;C0ED35|A500    |000000;
STA.W M7A                          ;C0ED37|8D1B21  |81211B;
LDA.B $01                            ;C0ED3A|A501    |000001;
STA.W M7A                          ;C0ED3C|8D1B21  |81211B;
LDA.B $02                            ;C0ED3F|A502    |000002;
STA.W M7B                          ;C0ED41|8D1C21  |81211C;
STA.W M7B                          ;C0ED44|8D1C21  |81211C;
LDA.W MPYL                          ;C0ED47|AD3421  |812134;
STA.B $00                            ;C0ED4A|8500    |000000;
LDA.W MPYM                          ;C0ED4C|AD3521  |812135;
STA.B $01                            ;C0ED4F|8501    |000001;
PLP                                  ;C0ED51|28      |      ;
RTS                                  ;C0ED52|60      |      ;

CODE_C0ED53:
PHX                                  ;C0ED53|DA      |      ;
JSL.L CODE_C2A330                    ;C0ED54|2230A382|82A330;
JSR.W CODE_C0EDE0                    ;C0ED58|20E0ED  |C0EDE0;
PLX                                  ;C0ED5B|FA      |      ;
COP #$1B                             ;C0ED5C|021B    |      ;
db $62,$ED,$01,$00                   ;C0ED5E|        |C0EF4E;
PHX                                  ;C0ED62|DA      |      ;
LDA.L $307FFE                        ;C0ED63|AFFE7F30|307FFE;
CMP.W #$0004                         ;C0ED67|C90400  |      ;
BCC CODE_C0ED6F                      ;C0ED6A|9003    |C0ED6F;
db $A9,$00,$00                       ;C0ED6C|        |      ;

CODE_C0ED6F:
XBA                                  ;C0ED6F|EB      |      ;
CLC                                  ;C0ED70|18      |      ;
ADC.W #$0005                         ;C0ED71|690500  |      ;
BRA CODE_C0ED79                      ;C0ED74|8003    |C0ED79;

CODE_C0ED76:
LDA.W #$0005                         ;C0ED76|A90500  |      ;

CODE_C0ED79:
JSL.L CODE_C2A1ED                    ;C0ED79|22EDA182|82A1ED;
BCS CODE_C0ED76                      ;C0ED7D|B0F7    |C0ED76;
AND.W #$00FF                         ;C0ED7F|29FF00  |      ;
CMP.W #$0004                         ;C0ED82|C90400  |      ;
BNE CODE_C0EDB2                      ;C0ED85|D02B    |C0EDB2;
LDA.W #$03FF                         ;C0ED87|A9FF03  |      ;
STA.L $7F0006                        ;C0ED8A|8F06007F|7F0006;
LDA.W #$0004                         ;C0ED8E|A90400  |      ;
JSL.L CODE_C2A1ED                    ;C0ED91|22EDA182|82A1ED;
BCS CODE_C0EDA6                      ;C0ED95|B00F    |C0EDA6;
AND.W #$00FF                         ;C0ED97|29FF00  |      ;
XBA                                  ;C0ED9A|EB      |      ;
ASL A                                ;C0ED9B|0A      |      ;
ASL A                                ;C0ED9C|0A      |      ;
TAX                                  ;C0ED9D|AA      |      ;
STA.L $306000,X                      ;C0ED9E|9F006030|306000;
STA.L $307000,X                      ;C0EDA2|9F007030|307000;

CODE_C0EDA6:
LDA.W #$7FFF                         ;C0EDA6|A9FF7F  |      ;
STA.L $7F0006                        ;C0EDA9|8F06007F|7F0006;
JSR.W CODE_C0EDE0                    ;C0EDAD|20E0ED  |C0EDE0;
BRA CODE_C0ED76                      ;C0EDB0|80C4    |C0ED76;

CODE_C0EDB2:
STA.W $03A6                          ;C0EDB2|8DA603  |8103A6;
JSL.L CODE_C38052                    ;C0EDB5|22528083|838052;
PLX                                  ;C0EDB9|FA      |      ;
LDA.W #$0001                         ;C0EDBA|A90100  |      ;
BCS CODE_C0EDC2                      ;C0EDBD|B003    |C0EDC2;
LDA.W $1B90                          ;C0EDBF|AD901B  |811B90;

CODE_C0EDC2:
STA.W sceneId                          ;C0EDC2|8D1803  |810318;
LDA.W #$0001                         ;C0EDC5|A90100  |      ;
STA.W TeleportPos.facing                          ;C0EDC8|8D8003  |810380;
LDA.W #$0070                         ;C0EDCB|A97000  |      ;
STA.W TeleportPos.x                          ;C0EDCE|8D7C03  |81037C;
LDA.W #$0060                         ;C0EDD1|A96000  |      ;
STA.W TeleportPos.y                          ;C0EDD4|8D7E03  |81037E;
STZ.W $0451                          ;C0EDD7|9C5104  |810451;
INC.W $0460                          ;C0EDDA|EE6004  |810460;
COP #$91                             ;C0EDDD|0291    |      ;
RTL                                  ;C0EDDF|6B      |      ;

CODE_C0EDE0:
    LDY.W #txt_main_menu
    JSL.L printOsdStringFromBank2
    STZ.W $03A6
    LDX.W #$6000
    LDY.W #txt_save1_stats
    LDA.W #0 ; set default position
    PHA

CODE_C0EDF4:
JSL.L CODE_C38092                    ;C0EDF4|22928083|838092;
LDA.B $16                            ;C0EDF8|A516    |000016;
CMP.L $3003FA,X                      ;C0EDFA|DFFA0330|3003FA;
BNE CODE_C0EE1D                      ;C0EDFE|D01D    |C0EE1D;
LDA.B $18                            ;C0EE00|A518    |000018;
CMP.L $3003FC,X                      ;C0EE02|DFFC0330|3003FC;
BNE CODE_C0EE1D                      ;C0EE06|D015    |C0EE1D;
PHX                                  ;C0EE08|DA      |      ;
PHY                                  ;C0EE09|5A      |      ;
PHB                                  ;C0EE0A|8B      |      ;
TXY                                  ;C0EE0B|9B      |      ;
TYA                                  ;C0EE0C|98      |      ;
CLC                                  ;C0EE0D|18      |      ;
ADC.W #$1000                         ;C0EE0E|690010  |      ;
TAY                                  ;C0EE11|A8      |      ;
LDA.W #lair_reveal_in_progress                         ;C0EE12|A9FD03  |      ;
MVN $30,$30                          ;C0EE15|543030  |      ;
PLB                                  ;C0EE18|AB      |      ;
PLY                                  ;C0EE19|7A      |      ;
PLX                                  ;C0EE1A|FA      |      ;
BRA CODE_C0EE44                      ;C0EE1B|8027    |C0EE44;

CODE_C0EE1D:
PHX                                  ;C0EE1D|DA      |      ;
PHY                                  ;C0EE1E|5A      |      ;
PHB                                  ;C0EE1F|8B      |      ;
TXY                                  ;C0EE20|9B      |      ;
TXA                                  ;C0EE21|8A      |      ;
CLC                                  ;C0EE22|18      |      ;
ADC.W #$1000                         ;C0EE23|690010  |      ;
TAX                                  ;C0EE26|AA      |      ;
LDA.W #lair_reveal_in_progress                         ;C0EE27|A9FD03  |      ;
MVN $30,$30                          ;C0EE2A|543030  |      ;
PLB                                  ;C0EE2D|AB      |      ;
PLY                                  ;C0EE2E|7A      |      ;
PLX                                  ;C0EE2F|FA      |      ;
JSL.L CODE_C38092                    ;C0EE30|22928083|838092;
LDA.B $16                            ;C0EE34|A516    |000016;
CMP.L $3003FA,X                      ;C0EE36|DFFA0330|3003FA;
BNE CODE_C0EE98                      ;C0EE3A|D05C    |C0EE98;
db $A5,$18,$DF,$FC,$03,$30,$D0,$54   ;C0EE3C|        |000018;

CODE_C0EE44:
PHY                                  ;C0EE44|5A      |      ;
PHX                                  ;C0EE45|DA      |      ;
TXA                                  ;C0EE46|8A      |      ;
SEC                                  ;C0EE47|38      |      ;
SBC.W #$1A5E                         ;C0EE48|E95E1A  |      ;
PHA                                  ;C0EE4B|48      |      ;
CLC                                  ;C0EE4C|18      |      ;
ADC.W #player_name                         ;C0EE4D|69921B  |      ;
TAX                                  ;C0EE50|AA      |      ;
LDA.L $300200,X                      ;C0EE51|BF000230|300200;
STA.W $0453                          ;C0EE55|8D5304  |810453;
LDA.L $300202,X                      ;C0EE58|BF020230|300202;
STA.W $0455                          ;C0EE5C|8D5504  |810455;
LDA.L $300204,X                      ;C0EE5F|BF040230|300204;
STA.W $0457                          ;C0EE63|8D5704  |810457;
LDA.L $300206,X                      ;C0EE66|BF060230|300206;
STA.W $0459                          ;C0EE6A|8D5904  |810459;
LDA.L $300207,X                      ;C0EE6D|BF070230|300207;
STA.W $045A                          ;C0EE71|8D5A04  |81045A;
LDA.B $01,S                          ;C0EE74|A301    |000001;
CLC                                  ;C0EE76|18      |      ;
ADC.W #player_level_ascii                         ;C0EE77|696A1B  |      ;
TAX                                  ;C0EE7A|AA      |      ;
LDA.L $300200,X                      ;C0EE7B|BF000230|300200;
STA.W $045C                          ;C0EE7F|8D5C04  |81045C;
PLA                                  ;C0EE82|68      |      ;
CLC                                  ;C0EE83|18      |      ;
ADC.W #$1B90                         ;C0EE84|69901B  |      ;
TAX                                  ;C0EE87|AA      |      ;
LDA.L $300200,X                      ;C0EE88|BF000230|300200;
STA.W $045E                          ;C0EE8C|8D5E04  |81045E;
JSL.L printOsdStringFromBank2                    ;C0EE8F|2254A782|82A754;
PLX                                  ;C0EE93|FA      |      ;
PLY                                  ;C0EE94|7A      |      ;
PLA                                  ;C0EE95|68      |      ;
INC A                                ;C0EE96|1A      |      ;
PHA                                  ;C0EE97|48      |      ;

CODE_C0EE98:
INC.W $03A6                          ;C0EE98|EEA603  |8103A6;
TXA                                  ;C0EE9B|8A      |      ;
CLC                                  ;C0EE9C|18      |      ;
ADC.W #$0400                         ;C0EE9D|690004  |      ;
TAX                                  ;C0EEA0|AA      |      ;
TYA                                  ;C0EEA1|98      |      ;
CLC                                  ;C0EEA2|18      |      ;
ADC.W #$0014                         ;C0EEA3|691400  |      ;
TAY                                  ;C0EEA6|A8      |      ;
CPX.W #$7000                         ;C0EEA7|E00070  |      ;
BEQ CODE_C0EEAF                      ;C0EEAA|F003    |C0EEAF;
BRL CODE_C0EDF4                      ;C0EEAC|8245FF  |C0EDF4;

CODE_C0EEAF:
STZ.W $03A6                          ;C0EEAF|9CA603  |8103A6;
PLA                                  ;C0EEB2|68      |      ;
BNE CODE_C0EEB9                      ;C0EEB3|D004    |C0EEB9;
STA.L $307FFE                        ;C0EEB5|8FFE7F30|307FFE;

CODE_C0EEB9:
RTS                                  ;C0EEB9|60      |      ;


COP #$07                             ;C0EEBA|0207    |      ;
db $05,$9F,$C6,$EE                   ;C0EEBC|        |00009F;
COP #$07                             ;C0EEC0|0207    |      ;
db $04,$9F,$F6,$F2                   ;C0EEC2|        |00009F;
INC.W $0460                          ;C0EEC6|EE6004  |810460;
COP #$85                             ;C0EEC9|0285    |      ;
db $D3,$F1,$80                       ;C0EECB|        |0000F1;
LDA.W #$3080                         ;C0EECE|A98030  |      ;
TSB.W button_mask                          ;C0EED1|0C2603  |810326;
COP #$A3                             ;C0EED4|02A3    |      ;
STX.W _039E                          ;C0EED6|8E9E03  |81039E;
STZ.W $0413                          ;C0EED9|9C1304  |810413;
STZ.W $0417                          ;C0EEDC|9C1704  |810417;
COP #$85                             ;C0EEDF|0285    |      ;
db $20,$F1,$80                       ;C0EEE1|        |C080F1;
LDA.W $0000,X                        ;C0EEE4|BD0000  |810000;
CMP.W #$0070                         ;C0EEE7|C97000  |      ;
BEQ CODE_C0EF32                      ;C0EEEA|F046    |C0EF32;
db $C9,$30,$00,$D0,$03,$82,$7C,$00   ;C0EEEC|        |      ;
db $C9,$B0,$01,$D0,$03,$82,$6A,$01   ;C0EEF4|        |      ;
db $C9,$70,$01,$D0,$03,$82,$B4,$01   ;C0EEFC|        |      ;
db $BD,$02,$00,$C9,$70,$01,$D0,$03   ;C0EF04|        |000002;
db $82,$B3,$00,$C9,$70,$00,$D0,$03   ;C0EF0C|        |C0EFC2;
db $82,$FD,$00,$82,$EB,$01           ;C0EF14|        |C0F014;

CODE_C0EF1A:
LDA.W buttons_pressed                          ;C0EF1A|AD2203  |810322;
BIT.W #$0400                         ;C0EF1D|890004  |      ;
BNE CODE_C0EF39                      ;C0EF20|D017    |C0EF39;
BIT.W #$8000                         ;C0EF22|890080  |      ;
BEQ CODE_C0EF32                      ;C0EF25|F00B    |C0EF32;
db $00,$98,$02,$10,$00,$01,$00,$70   ;C0EF27|        |      ;
db $00,$50,$00                       ;C0EF2F|        |      ;

CODE_C0EF32:
COP #$80                             ;C0EF32|0280    |      ;
db $10                               ;C0EF34|        |C0EF38;
COP #$82                             ;C0EF35|0282    |      ;
BRA CODE_C0EF1A                      ;C0EF37|80E1    |C0EF1A;

CODE_C0EF39:
COP #$08                             ;C0EF39|0208    |      ;
db $00,$9B,$32,$EF                   ;C0EF3B|        |      ;
COP #$80                             ;C0EF3F|0280    |      ;
db $01                               ;C0EF41|        |000002;
COP #$82                             ;C0EF42|0282    |      ;
BRK #$16                             ;C0EF44|0016    |      ;
COP #$80                             ;C0EF46|0280    |      ;
db $24                               ;C0EF48|        |000002;
COP #$82                             ;C0EF49|0282    |      ;
COP #$80                             ;C0EF4B|0280    |      ;
db $2F                               ;C0EF4D|        |828202;
COP #$82                             ;C0EF4E|0282    |      ;
BRL CODE_C0EF70                      ;C0EF50|821D00  |C0EF70;

CODE_C0EF53:
LDA.W buttons_pressed                          ;C0EF53|AD2203  |810322;
BIT.W #$0800                         ;C0EF56|890008  |      ;
BNE UNREACH_C0EF77                   ;C0EF59|D01C    |C0EF77;
BIT.W #$0100                         ;C0EF5B|890001  |      ;
BNE UNREACH_C0EF8B                   ;C0EF5E|D02B    |C0EF8B;
BIT.W #$8000                         ;C0EF60|890080  |      ;
BEQ CODE_C0EF70                      ;C0EF63|F00B    |C0EF70;
BRK #$98                             ;C0EF65|0098    |      ;
COP #$10                             ;C0EF67|0210    |      ;
db $00,$02,$00,$70,$00,$50,$00       ;C0EF69|        |      ;

CODE_C0EF70:
COP #$80                             ;C0EF70|0280    |      ;
db $02                               ;C0EF72|        |      ;
COP #$82                             ;C0EF73|0282    |      ;
BRA CODE_C0EF53                      ;C0EF75|80DC    |C0EF53;

UNREACH_C0EF77:
db $02,$80,$03,$02,$82,$00,$16,$02   ;C0EF77|        |      ;
db $80,$25,$02,$82,$02,$80,$2E,$02   ;C0EF7F|        |C0EFA6;
db $82,$82,$A7,$FF                   ;C0EF87|        |C0970C;

UNREACH_C0EF8B:
db $02,$08,$01,$9B,$70,$EF,$02,$80   ;C0EF8B|        |      ;
db $03,$02,$82,$00,$16,$02,$80,$26   ;C0EF93|        |000002;
db $02,$82,$02,$80,$2F,$02,$82,$82   ;C0EF9B|        |      ;
db $1D,$00,$AD,$22,$03,$89,$00,$02   ;C0EFA3|        |00AD00;
db $D0,$1C,$89,$00,$08,$D0,$2B,$89   ;C0EFAB|        |C0EFC9;
db $00,$80,$F0,$0B,$00,$98,$02,$10   ;C0EFB3|        |      ;
db $00,$03,$00,$70,$00,$50,$00,$02   ;C0EFBB|        |      ;
db $80,$02,$02,$82,$80,$DC,$02,$80   ;C0EFC3|        |C0EFC7;
db $03,$02,$82,$00,$16,$02,$80,$27   ;C0EFCB|        |000002;
db $02,$82,$02,$80,$2F,$02,$82,$82   ;C0EFD3|        |      ;
db $76,$FF,$02,$08,$02,$9B,$C2,$EF   ;C0EFDB|        |0000FF;
db $02,$80,$03,$02,$82,$00,$16,$02   ;C0EFE3|        |      ;
db $80,$29,$02,$82,$02,$80,$2E,$02   ;C0EFEB|        |C0F016;
db $82,$82,$00,$00,$AD,$22,$03,$89   ;C0EFF3|        |C0F078;
db $00,$04,$D0,$1C,$89,$00,$01,$D0   ;C0EFFB|        |      ;
db $2B,$89,$00,$80,$F0,$0B,$00,$98   ;C0F003|        |      ;
db $02,$10,$00,$04,$00,$70,$00,$50   ;C0F00B|        |      ;
db $00,$02,$80,$10,$02,$82,$80,$DC   ;C0F013|        |      ;
db $02,$80,$01,$02,$82,$00,$16,$02   ;C0F01B|        |      ;
db $80,$28,$02,$82,$02,$80,$2F,$02   ;C0F023|        |C0F04D;
db $82,$82,$76,$FF,$02,$08,$03,$9B   ;C0F02B|        |C066B0;
db $14,$F0,$02,$80,$01,$02,$82,$00   ;C0F033|        |0000F0;
db $16,$02,$80,$2A,$02,$82,$02,$80   ;C0F03B|        |000002;
db $2F,$02,$82,$82,$00,$00,$AD,$22   ;C0F043|        |828202;
db $03,$89,$00,$02,$D0,$1C,$89,$00   ;C0F04B|        |000089;
db $08,$D0,$2B,$89,$00,$80,$F0,$0B   ;C0F053|        |      ;
db $00,$98,$02,$10,$00,$05,$00,$70   ;C0F05B|        |      ;
db $00,$50,$00,$02,$80,$02,$02,$82   ;C0F063|        |      ;
db $80,$DC,$02,$80,$03,$02,$82,$00   ;C0F06B|        |C0F049;
db $16,$02,$80,$2B,$02,$82,$02,$80   ;C0F073|        |000002;
db $2E,$02,$82,$82,$76,$FF,$02,$08   ;C0F07B|        |008202;
db $04,$9B,$66,$F0,$02,$80,$03,$02   ;C0F083|        |00009B;
db $82,$00,$16,$02,$80,$2C,$02,$82   ;C0F08B|        |C0068E;
db $02,$80,$2E,$02,$82,$82,$00,$00   ;C0F093|        |      ;
db $AD,$22,$03,$89,$00,$04,$D0,$1C   ;C0F09B|        |000322;
db $89,$00,$08,$D0,$2B,$89,$00,$80   ;C0F0A3|        |      ;
db $F0,$0B,$00,$98,$02,$10,$00,$06   ;C0F0AB|        |C0F0B8;
db $00,$70,$00,$50,$00,$02,$80,$10   ;C0F0B3|        |      ;
db $02,$82,$80,$DC,$02,$80,$01,$02   ;C0F0BB|        |      ;
db $82,$00,$16,$02,$80,$2D,$02,$82   ;C0F0C3|        |C006C6;
db $02,$80,$2F,$02,$82,$82,$76,$FF   ;C0F0CB|        |      ;
db $02,$08,$05,$9B,$B8,$F0,$02,$80   ;C0F0D3|        |      ;
db $01,$02,$82,$00,$16,$02,$80,$1F   ;C0F0DB|        |000002;
db $02,$82,$02,$80,$2E,$02,$82,$82   ;C0F0E3|        |      ;
db $00,$00,$AD,$22,$03,$89,$00,$01   ;C0F0EB|        |      ;
db $D0,$17,$89,$00,$80,$F0,$0B,$00   ;C0F0F3|        |C0F10C;
db $98,$02,$10,$00,$07,$00,$70,$00   ;C0F0FB|        |      ;
db $50,$00,$02,$80,$10,$02,$82,$80   ;C0F103|        |C0F105;
db $E1,$02,$80,$01,$02,$82,$00,$16   ;C0F10B|        |000002;
db $02,$80,$1E,$02,$82,$02,$80,$2E   ;C0F113|        |      ;
db $02,$82,$82,$7B,$FF               ;C0F11B|        |      ;
LDY.W _039E                          ;C0F120|AC9E03  |81039E;
LDA.W $0000,Y                        ;C0F123|B90000  |810000;
STA.W PlayerPosReal.x                          ;C0F126|8D7403  |810374;
LSR A                                ;C0F129|4A      |      ;
LSR A                                ;C0F12A|4A      |      ;
LSR A                                ;C0F12B|4A      |      ;
LSR A                                ;C0F12C|4A      |      ;
STA.W PlayerPosInt.x                          ;C0F12D|8D7803  |810378;
LDA.W $0002,Y                        ;C0F130|B90200  |810002;
STA.W PlayerPosReal.y                          ;C0F133|8D7603  |810376;
LSR A                                ;C0F136|4A      |      ;
LSR A                                ;C0F137|4A      |      ;
LSR A                                ;C0F138|4A      |      ;
LSR A                                ;C0F139|4A      |      ;
DEC A                                ;C0F13A|3A      |      ;
STA.W PlayerPosInt.y                          ;C0F13B|8D7A03  |81037A;
PHX                                  ;C0F13E|DA      |      ;
JSL.L CODE_C28000                    ;C0F13F|22008082|828000;
PLX                                  ;C0F143|FA      |      ;
RTL                                  ;C0F144|6B      |      ;

CODE_C0F145:
COP #$07                             ;C0F145|0207    |      ;
db $05,$9F,$51,$F1                   ;C0F147|        |00009F;
COP #$07                             ;C0F14B|0207    |      ;
db $04,$9F,$54,$F1                   ;C0F14D|        |00009F;
COP #$91                             ;C0F151|0291    |      ;
RTL                                  ;C0F153|6B      |      ;
db $02,$86,$6B                       ;C0F154|        |      ;
RTL                                  ;C0F157|6B      |      ;
COP #$A3                             ;C0F158|02A3    |      ;
RTL                                  ;C0F15A|6B      |      ;
BRA CODE_C0F145                      ;C0F15B|80E8    |C0F145;
RTL                                  ;C0F15D|6B      |      ;
RTL                                  ;C0F15E|6B      |      ;
BRA CODE_C0F145                      ;C0F15F|80E4    |C0F145;
COP #$80                             ;C0F161|0280    |      ;
db $04                               ;C0F163|        |000002;
COP #$82                             ;C0F164|0282    |      ;
RTL                                  ;C0F166|6B      |      ;
COP #$80                             ;C0F167|0280    |      ;
db $05                               ;C0F169|        |000002;
COP #$82                             ;C0F16A|0282    |      ;
RTL                                  ;C0F16C|6B      |      ;
COP #$80                             ;C0F16D|0280    |      ;
db $30                               ;C0F16F|        |C0F173;
COP #$82                             ;C0F170|0282    |      ;
db $6B                               ;C0F172|        |      ;
RTL                                  ;C0F173|6B      |      ;
RTL                                  ;C0F174|6B      |      ;
COP #$14                             ;C0F175|0214    |      ;
db $B6,$00,$7E,$F1                   ;C0F177|        |000000;
COP #$91                             ;C0F17B|0291    |      ;
RTL                                  ;C0F17D|6B      |      ;
db $02,$80,$18,$02,$82,$02,$91,$6B   ;C0F17E|        |      ;
COP #$14                             ;C0F186|0214    |      ;
db $09,$00,$8D,$F1,$6B               ;C0F188|        |      ;
COP #$80                             ;C0F18D|0280    |      ;
db $14                               ;C0F18F|        |000002;
COP #$82                             ;C0F190|0282    |      ;
COP #$91                             ;C0F192|0291    |      ;
RTL                                  ;C0F194|6B      |      ;
RTL                                  ;C0F195|6B      |      ;
COP #$14                             ;C0F196|0214    |      ;
db $2F,$01,$9F,$F1                   ;C0F198|        |F19F01;
COP #$91                             ;C0F19C|0291    |      ;
RTL                                  ;C0F19E|6B      |      ;
db $02,$80,$12,$02,$82,$02,$91,$6B   ;C0F19F|        |      ;
COP #$80                             ;C0F1A7|0280    |      ;
db $31                               ;C0F1A9|        |000002;
COP #$82                             ;C0F1AA|0282    |      ;
db $6B                               ;C0F1AC|        |      ;
COP #$80                             ;C0F1AD|0280    |      ;
db $32                               ;C0F1AF|        |000002;
COP #$82                             ;C0F1B0|0282    |      ;
RTL                                  ;C0F1B2|6B      |      ;
COP #$80                             ;C0F1B3|0280    |      ;
db $33                               ;C0F1B5|        |000002;
COP #$82                             ;C0F1B6|0282    |      ;
RTL                                  ;C0F1B8|6B      |      ;
COP #$07                             ;C0F1B9|0207    |      ;
db $05,$9F,$C5,$F1                   ;C0F1BB|        |00009F;
COP #$07                             ;C0F1BF|0207    |      ;
db $04,$9F,$CC,$F1                   ;C0F1C1|        |00009F;

CODE_C0F1C5:
COP #$92                             ;C0F1C5|0292    |      ;
db $2D                               ;C0F1C7|        |009402;
COP #$94                             ;C0F1C8|0294    |      ;
BRA CODE_C0F1C5                      ;C0F1CA|80F9    |C0F1C5;
db $02,$92,$4B,$02,$94,$80,$F9       ;C0F1CC|        |      ;
COP #$07                             ;C0F1D3|0207    |      ;
db $00,$9B,$DB,$F1,$80,$26           ;C0F1D5|        |      ;
COP #$AC                             ;C0F1DB|02AC    |      ;
db $F3,$F1,$80,$70,$00,$D0,$00,$40   ;C0F1DD|        |0000F1;
db $00                               ;C0F1E5|        |      ;
COP #$AC                             ;C0F1E6|02AC    |      ;
db $FB,$F1,$80,$30,$00,$50,$01,$40   ;C0F1E8|        |      ;
db $00                               ;C0F1F0|        |      ;
BRA CODE_C0F201                      ;C0F1F1|800E    |C0F201;
COP #$96                             ;C0F1F3|0296    |      ;
LDA.W #$000E                         ;C0F1F5|A90E00  |      ;
BRL CODE_C0F2E6                      ;C0F1F8|82EB00  |C0F2E6;
LDA.W #$000B                         ;C0F1FB|A90B00  |      ;
BRL CODE_C0F2E6                      ;C0F1FE|82E500  |C0F2E6;

CODE_C0F201:
COP #$07                             ;C0F201|0207    |      ;
db $01,$9B,$09,$F2                   ;C0F203|        |00009B;
BRA CODE_C0F22F                      ;C0F207|8026    |C0F22F;
db $02,$AC,$21,$F2,$80,$40,$00,$60   ;C0F209|        |      ;
db $01,$40,$00,$02,$AC,$27,$F2,$80   ;C0F211|        |000040;
db $E0,$00,$60,$01,$40,$00,$80,$0E   ;C0F219|        |      ;
db $A9,$08,$00,$82,$BF,$00,$02,$96   ;C0F221|        |      ;
db $A9,$08,$00,$82,$B7,$00           ;C0F229|        |      ;

CODE_C0F22F:
COP #$07                             ;C0F22F|0207    |      ;
db $02,$9B,$37,$F2                   ;C0F231|        |      ;
BRA CODE_C0F25D                      ;C0F235|8026    |C0F25D;
db $02,$AC,$4F,$F2,$80,$F0,$00,$50   ;C0F237|        |      ;
db $01,$40,$00,$02,$AC,$55,$F2,$80   ;C0F23F|        |000040;
db $F0,$00,$80,$00,$40,$00,$80,$0E   ;C0F247|        |C0F249;
db $A9,$07,$00,$82,$91,$00,$02,$98   ;C0F24F|        |      ;
db $A9,$07,$00,$82,$89,$00           ;C0F257|        |      ;

CODE_C0F25D:
COP #$07                             ;C0F25D|0207    |      ;
db $03,$9B,$65,$F2                   ;C0F25F|        |00009B;
BRA CODE_C0F289                      ;C0F263|8024    |C0F289;
db $02,$AC,$7D,$F2,$80,$00,$01,$70   ;C0F265|        |      ;
db $00,$40,$00,$02,$AC,$83,$F2,$80   ;C0F26D|        |      ;
db $A0,$01,$40,$01,$40,$00,$80,$0C   ;C0F275|        |      ;
db $A9,$0C,$00,$82,$63,$00,$A9,$0F   ;C0F27D|        |      ;
db $00,$82,$5D,$00                   ;C0F285|        |      ;

CODE_C0F289:
COP #$07                             ;C0F289|0207    |      ;
db $04,$9B,$91,$F2                   ;C0F28B|        |00009B;
BRA CODE_C0F2B7                      ;C0F28F|8026    |C0F2B7;
db $02,$AC,$A9,$F2,$80,$B0,$01,$30   ;C0F291|        |      ;
db $01,$40,$00,$02,$AC,$B1,$F2,$80   ;C0F299|        |000040;
db $70,$01,$90,$00,$40,$00,$80,$0E   ;C0F2A1|        |C0F2A4;
db $02,$96,$A9,$0B,$00,$82,$35,$00   ;C0F2A9|        |      ;
db $A9,$0E,$00,$82,$2F,$00           ;C0F2B1|        |      ;

CODE_C0F2B7:
COP #$07                             ;C0F2B7|0207    |      ;
db $05,$9B,$BF,$F2                   ;C0F2B9|        |00009B;
BRA CODE_C0F2D5                      ;C0F2BD|8016    |C0F2D5;
db $02,$AC,$D8,$F2,$80,$70,$01,$50   ;C0F2BF|        |      ;
db $00,$40,$00,$02,$AC,$E0,$F2,$80   ;C0F2C7|        |      ;
db $00,$01,$30,$00,$40,$00           ;C0F2CF|        |      ;

CODE_C0F2D5:
COP #$86                             ;C0F2D5|0286    |      ;
RTL                                  ;C0F2D7|6B      |      ;
db $02,$96,$A9,$0A,$00,$82,$06,$00   ;C0F2D8|        |      ;
db $A9,$09,$00,$82,$00,$00           ;C0F2E0|        |      ;

CODE_C0F2E6:
STA.W $001E,X                        ;C0F2E6|9D1E00  |81001E;
STZ.W $0020,X                        ;C0F2E9|9E2000  |810020;
COP #$91                             ;C0F2EC|0291    |      ;
COP #$82                             ;C0F2EE|0282    |      ;
COP #$1B                             ;C0F2F0|021B    |      ;
db $F0,$F2,$FF,$00,$A9,$80,$BF,$0C   ;C0F2F2|        |C0F2E6;
db $26,$03,$02,$85,$22,$F3,$80,$02   ;C0F2FA|        |000003;
db $34,$00,$86,$02,$1B,$0B,$F3,$A4   ;C0F302|        |000000;
db $01,$EE,$60,$04,$9C,$13,$04,$9C   ;C0F30A|        |0000EE;
db $17,$04,$02,$09,$05,$9F,$02,$10   ;C0F312|        |000004;
db $00,$07,$00,$70,$00,$60,$00,$6B   ;C0F31A|        |      ;
db $02,$A8,$00,$80,$8D,$02,$92,$44   ;C0F322|        |      ;
db $02,$94,$02,$86,$6B,$BD,$16,$00   ;C0F32A|        |      ;
db $09,$10,$20,$9D,$16,$00,$8E,$9E   ;C0F332|        |      ;
db $03,$9C,$86,$03,$A9,$FF,$00,$8D   ;C0F33A|        |00009C;
db $88,$03,$9C,$76,$04,$9C,$72,$04   ;C0F342|        |      ;
db $9C,$8E,$04,$E2,$20,$A9,$93,$8D   ;C0F34A|        |00048E;
db $31,$21,$A9,$FF,$8F,$00,$02,$7F   ;C0F352|        |000021;
db $C2,$20,$A9,$FF,$FF,$0C,$26,$03   ;C0F35A|        |      ;
db $02,$85,$1E,$F6,$80,$02,$85,$7A   ;C0F362|        |      ;
db $F5,$80,$02,$1B,$72,$F3,$02,$00   ;C0F36A|        |000080;
db $A9,$1F,$00,$9D,$30,$00,$02,$03   ;C0F372|        |      ;
db $20,$E2,$20,$BD,$30,$00,$09,$E0   ;C0F37A|        |C020E2;
db $8F,$00,$02,$7F,$C2,$20,$DE,$30   ;C0F382|        |7F0200;
db $00,$02,$1B,$91,$F3,$04,$00,$02   ;C0F38A|        |      ;
db $04,$02,$1B,$99,$F3,$78,$00,$DA   ;C0F392|        |000002;
db $A0,$17,$C3,$22,$54,$A7,$82,$FA   ;C0F39A|        |      ;
db $EE,$72,$04,$02,$1B,$AB,$F3,$D0   ;C0F3A2|        |000472;
db $02,$9C,$72,$04,$22,$22,$86,$83   ;C0F3AA|        |      ;
db $02,$1B,$B8,$F3,$70,$00,$DA,$A0   ;C0F3B2|        |      ;
db $80,$C3,$22,$54,$A7,$82,$FA,$EE   ;C0F3BA|        |C0F37F;
db $72,$04,$02,$1B,$CA,$F3,$D0,$02   ;C0F3C2|        |000004;
db $9C,$72,$04,$22,$22,$86,$83,$02   ;C0F3CA|        |000472;
db $1B,$D7,$F3,$70,$00,$DA,$A0,$C9   ;C0F3D2|        |      ;
db $C3,$22,$54,$A7,$82,$FA,$EE,$72   ;C0F3DA|        |000022;
db $04,$02,$1B,$E9,$F3,$D0,$02,$9C   ;C0F3E2|        |000002;
db $72,$04,$22,$22,$86,$83,$02,$1B   ;C0F3EA|        |000004;
db $F6,$F3,$70,$00,$DA,$A0,$34,$C4   ;C0F3F2|        |0000F3;
db $22,$54,$A7,$82,$FA,$EE,$72,$04   ;C0F3FA|        |82A754;
db $02,$1B,$08,$F4,$D0,$02,$9C,$72   ;C0F402|        |      ;
db $04,$22,$22,$86,$83,$02,$1B,$15   ;C0F40A|        |000022;
db $F4,$70,$00,$02,$1B,$1B,$F4,$78   ;C0F412|        |000070;
db $00,$02,$B0,$65,$F5,$80,$10,$20   ;C0F41A|        |      ;
db $02,$AC,$21,$F5,$80,$90,$01,$80   ;C0F422|        |      ;
db $00,$50,$00,$02,$AC,$F2,$F4,$80   ;C0F42A|        |      ;
db $90,$01,$70,$00,$50,$00,$02,$91   ;C0F432|        |C0F435;
db $AD,$8E,$04,$D0,$01,$6B,$02,$1B   ;C0F43A|        |00048E;
db $46,$F4,$78,$00,$DA,$A0,$83,$C4   ;C0F442|        |0000F4;
db $22,$54,$A7,$82,$FA,$EE,$72,$04   ;C0F44A|        |82A754;
db $02,$1B,$58,$F4,$38,$04,$9C,$72   ;C0F452|        |      ;
db $04,$22,$22,$86,$83,$02,$1B,$65   ;C0F45A|        |000022;
db $F4,$70,$00,$DA,$A0,$A7,$C4,$22   ;C0F462|        |000070;
db $54,$A7,$82,$FA,$EE,$72,$04,$02   ;C0F46A|        |      ;
db $1B,$77,$F4,$38,$04,$9C,$72,$04   ;C0F472|        |      ;
db $22,$22,$86,$83,$02,$1B,$84,$F4   ;C0F47A|        |838622;
db $70,$00,$DA,$A0,$FE,$C4,$22,$54   ;C0F482|        |C0F484;
db $A7,$82,$FA,$EE,$72,$04,$02,$1B   ;C0F48A|        |000082;
db $96,$F4,$38,$04,$9C,$72,$04,$22   ;C0F492|        |0000F4;
db $22,$86,$83,$02,$1B,$A3,$F4,$70   ;C0F49A|        |028386;
db $00,$A9,$01,$00,$0C,$BA,$03,$02   ;C0F4A2|        |      ;
db $1B,$AF,$F4,$78,$00,$EE,$8E,$04   ;C0F4AA|        |      ;
db $02,$91,$AD,$8E,$04,$C9,$04,$00   ;C0F4B2|        |      ;
db $F0,$01,$6B,$02,$1B,$C3,$F4,$78   ;C0F4BA|        |C0F4BD;
db $00,$CE,$72,$04,$02,$85,$CA,$F6   ;C0F4C2|        |      ;
db $80,$02,$1B,$D1,$F4,$F0,$00,$9E   ;C0F4CA|        |C0F4CE;
db $30,$00,$02,$03,$20,$E2,$20,$BD   ;C0F4D2|        |C0F4D4;
db $30,$00,$09,$E0,$8F,$00,$02,$7F   ;C0F4DA|        |C0F4DC;
db $C2,$20,$FE,$30,$00,$02,$1B,$ED   ;C0F4E2|        |      ;
db $F4,$10,$00,$02,$04,$02,$91,$6B   ;C0F4EA|        |000010;
db $02,$80,$00,$02,$82,$AD,$8E,$04   ;C0F4F2|        |      ;
db $C9,$01,$00,$D0,$F3,$02,$80,$02   ;C0F4FA|        |      ;
db $02,$82,$AD,$8E,$04,$C9,$02,$00   ;C0F502|        |      ;
db $D0,$E6,$02,$80,$00,$02,$82,$02   ;C0F50A|        |C0F4F2;
db $80,$03,$02,$82,$02,$80,$01,$02   ;C0F512|        |C0F517;
db $82,$EE,$8E,$04,$02,$91,$6B,$02   ;C0F51A|        |C0840B;
db $80,$04,$02,$82,$AD,$8E,$04,$C9   ;C0F522|        |C0F528;
db $03,$00,$D0,$F3,$02,$80,$04,$02   ;C0F52A|        |000000;
db $82,$02,$80,$06,$02,$82,$02,$80   ;C0F532|        |C07537;
db $05,$02,$82,$EE,$8E,$04,$02,$91   ;C0F53A|        |000002;
db $6B,$02,$80,$07,$02,$82,$AD,$8E   ;C0F542|        |      ;
db $04,$C9,$04,$00,$D0,$F3,$02,$80   ;C0F54A|        |0000C9;
db $07,$02,$82,$02,$80,$08,$02,$82   ;C0F552|        |000002;
db $02,$80,$09,$02,$82,$EE,$8E,$04   ;C0F55A|        |      ;
db $02,$91,$6B,$EE,$76,$04,$AD,$76   ;C0F562|        |      ;
db $04,$8D,$3A,$03,$C9,$00,$01,$F0   ;C0F56A|        |00008D;
db $01,$6B,$EE,$8E,$04,$02,$91,$6B   ;C0F572|        |00006B;
db $BD,$16,$00,$09,$10,$00,$9D,$16   ;C0F57A|        |000016;
db $00,$9E,$30,$00,$DA,$A2,$00,$00   ;C0F582|        |      ;
db $A9,$70,$00,$9F,$00,$78,$7E,$A9   ;C0F58A|        |      ;
db $30,$00,$9F,$03,$78,$7E,$A9,$10   ;C0F592|        |C0F594;
db $00,$9F,$06,$78,$7E,$A9,$10,$00   ;C0F59A|        |      ;
db $9F,$09,$78,$7E,$A9,$10,$00,$9F   ;C0F5A2|        |7E7809;
db $0C,$78,$7E,$A9,$08,$00,$9F,$0F   ;C0F5AA|        |007E78;
db $78,$7E,$A9,$01,$00,$9F,$12,$78   ;C0F5B2|        |      ;
db $7E,$A9,$00,$00,$9F,$15,$78,$7E   ;C0F5BA|        |0000A9;
db $9F,$01,$78,$7E,$FA,$02,$91,$DA   ;C0F5C2|        |7E7801;
db $9B,$A2,$00,$00,$AD,$76,$04,$4A   ;C0F5CA|        |      ;
db $85,$16,$9F,$0A,$78,$7E,$B9,$30   ;C0F5D2|        |000016;
db $00,$4A,$48,$4A,$18,$63,$01,$4A   ;C0F5DA|        |      ;
db $18,$65,$16,$9F,$10,$78,$7E,$68   ;C0F5E2|        |      ;
db $B9,$30,$00,$4A,$18,$65,$16,$9F   ;C0F5EA|        |000030;
db $04,$78,$7E,$9F,$13,$78,$7E,$B9   ;C0F5F2|        |000078;
db $30,$00,$4A,$4A,$18,$65,$16,$9F   ;C0F5FA|        |C0F5FC;
db $07,$78,$7E,$9F,$0D,$78,$7E,$E2   ;C0F602|        |000078;
db $20,$A9,$0F,$EB,$A9,$7E,$A0,$00   ;C0F60A|        |C00FA9;
db $78,$22,$8F,$98,$82,$C2,$20,$FA   ;C0F612|        |      ;
db $FE,$30,$00,$6B,$BD,$16,$00,$09   ;C0F61A|        |000030;
db $10,$00,$9D,$16,$00,$02,$91,$AD   ;C0F622|        |C0F624;
db $72,$04,$30,$42,$D0,$04,$20,$79   ;C0F62A|        |000004;
db $F6,$6B,$9E,$30,$00,$02,$03,$E0   ;C0F632|        |00006B;
db $BD,$30,$00,$20,$79,$F6,$02,$27   ;C0F63A|        |000030;
db $44,$F6,$BD,$30,$00,$20,$79,$F6   ;C0F642|        |      ;
db $FE,$30,$00,$02,$04,$02,$91,$AD   ;C0F64A|        |000030;
db $72,$04,$F0,$07,$A9,$E0,$00,$20   ;C0F652|        |000004;
db $79,$F6,$6B,$02,$03,$70,$BD,$30   ;C0F65A|        |006BF6;
db $00,$20,$79,$F6,$DE,$30,$00,$DE   ;C0F662|        |      ;
db $30,$00,$02,$04,$80,$B7,$02,$91   ;C0F66A|        |C0F66C;
db $A9,$E0,$00,$20,$79,$F6,$6B,$DA   ;C0F672|        |      ;
db $E2,$20,$A2,$00,$00,$C9,$00,$F0   ;C0F67A|        |      ;
db $23,$C9,$80,$90,$13,$38,$E9,$7F   ;C0F682|        |0000C9;
db $48,$A9,$7F,$9F,$00,$70,$7E,$A9   ;C0F68A|        |      ;
db $17,$9F,$01,$70,$7E,$E8,$E8,$68   ;C0F692|        |00009F;
db $9F,$00,$70,$7E,$A9,$17,$9F,$01   ;C0F69A|        |7E7000;
db $70,$7E,$E8,$E8,$A9,$01,$9F,$00   ;C0F6A2|        |C0F722;
db $70,$7E,$A9,$13,$9F,$01,$70,$7E   ;C0F6AA|        |C0F72A;
db $E8,$E8,$A9,$00,$9F,$00,$70,$7E   ;C0F6B2|        |      ;
db $A9,$2C,$EB,$A9,$7E,$A0,$00,$70   ;C0F6BA|        |      ;
db $22,$8F,$98,$82,$C2,$20,$FA,$60   ;C0F6C2|        |82988F;
db $DA,$A0,$26,$E5,$22,$D4,$A6,$82   ;C0F6CA|        |      ;
db $FA,$02,$1B,$D9,$F6,$F0,$00,$02   ;C0F6D2|        |      ;
db $31,$00,$02,$1B,$E2,$F6,$F0,$00   ;C0F6DA|        |000000;
db $02,$10,$00,$0D,$02,$00,$00,$00   ;C0F6E2|        |      ;
db $00,$E2,$20,$9C,$82,$1B,$C2,$20   ;C0F6EA|        |      ;
db $A9,$20,$00,$8D,$B6,$03,$EE,$60   ;C0F6F2|        |      ;
db $04,$02,$91,$6B                   ;C0F6FA|        |000002;


incsrc "scripts/sh/middle_plate.asm"
incsrc "scripts/sh/new_game.asm"

txt_shrine_clear_box:
; @NEW_TEXT@
; WFAK CLEARBOX $06 $04 CONT
db $12,$08,$06,$04,$0C
; @END@

if defined("DEBUG")
enable_debug:
    JSR DebugMenu
    JSL.L check_buttons
    RTL
endif

padbyte $FF : pad $C10000
