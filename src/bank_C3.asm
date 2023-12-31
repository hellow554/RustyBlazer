ORG  $C30000
BASE $830000

incsrc "bankC3/_data.asm"

PHP                                  ;C38000|08      |      ;
PHX                                  ;C38001|DA      |      ;
PHB                                  ;C38002|8B      |      ;
REP #$20                             ;C38003|C220    |      ;
LDA.W $03BC                          ;C38005|ADBC03  |8103BC;
INC A                                ;C38008|1A      |      ;
STA.W $1B90                          ;C38009|8D901B  |811B90;
LDA.W $03A6                          ;C3800C|ADA603  |8103A6;
STA.L $307FFE                        ;C3800F|8FFE7F30|307FFE;
XBA                                  ;C38013|EB      |      ;
ASL A                                ;C38014|0A      |      ;
ASL A                                ;C38015|0A      |      ;
CLC                                  ;C38016|18      |      ;
ADC.W #$6000                         ;C38017|690060  |      ;
TAY                                  ;C3801A|A8      |      ;
PHY                                  ;C3801B|5A      |      ;
LDX.W #$0203                         ;C3801C|A20302  |      ;
LDA.W #$01FF                         ;C3801F|A9FF01  |      ;
MVN $30,$7F                          ;C38022|54307F  |      ;
LDX.W #$1A5E                         ;C38025|A25E1A  |      ;
LDA.W #$01F9                         ;C38028|A9F901  |      ;
MVN $30,$81                          ;C3802B|543081  |      ;
PLX                                  ;C3802E|FA      |      ;
PLB                                  ;C3802F|AB      |      ;
JSL.L CODE_C38092                    ;C38030|22928083|838092;
LDA.B $16                            ;C38034|A516    |000016;
STA.L $3003FA,X                      ;C38036|9FFA0330|3003FA;
LDA.B $18                            ;C3803A|A518    |000018;
STA.L $3003FC,X                      ;C3803C|9FFC0330|3003FC;
PHB                                  ;C38040|8B      |      ;
TXY                                  ;C38041|9B      |      ;
TYA                                  ;C38042|98      |      ;
CLC                                  ;C38043|18      |      ;
ADC.W #$1000                         ;C38044|690010  |      ;
TAY                                  ;C38047|A8      |      ;
LDA.W #lair_reveal_in_progress                         ;C38048|A9FD03  |      ;
MVN $30,$30                          ;C3804B|543030  |      ;
PLB                                  ;C3804E|AB      |      ;
PLX                                  ;C3804F|FA      |      ;
PLP                                  ;C38050|28      |      ;
RTL                                  ;C38051|6B      |      ;
PHP                                  ;C38052|08      |      ;
PHB                                  ;C38053|8B      |      ;
PHX                                  ;C38054|DA      |      ;
REP #$20                             ;C38055|C220    |      ;
LDA.W $03A6                          ;C38057|ADA603  |8103A6;
XBA                                  ;C3805A|EB      |      ;
ASL A                                ;C3805B|0A      |      ;
ASL A                                ;C3805C|0A      |      ;
CLC                                  ;C3805D|18      |      ;
ADC.W #$6000                         ;C3805E|690060  |      ;
TAX                                  ;C38061|AA      |      ;
JSL.L CODE_C38092                    ;C38062|22928083|838092;
LDA.B $16                            ;C38066|A516    |000016;
CMP.L $3003FA,X                      ;C38068|DFFA0330|3003FA;
BNE CODE_C3808D                      ;C3806C|D01F    |C3808D;
LDA.B $18                            ;C3806E|A518    |000018;
CMP.L $3003FC,X                      ;C38070|DFFC0330|3003FC;
BNE CODE_C3808D                      ;C38074|D017    |C3808D;
LDY.W #$0203                         ;C38076|A00302  |      ;
LDA.W #$01FF                         ;C38079|A9FF01  |      ;
MVN $7F,$30                          ;C3807C|547F30  |      ;
LDY.W #$1A5E                         ;C3807F|A05E1A  |      ;
LDA.W #$01F9                         ;C38082|A9F901  |      ;
MVN $81,$30                          ;C38085|548130  |      ;
PLX                                  ;C38088|FA      |      ;
PLB                                  ;C38089|AB      |      ;
PLP                                  ;C3808A|28      |      ;
CLC                                  ;C3808B|18      |      ;
RTL                                  ;C3808C|6B      |      ;

CODE_C3808D:
PLX                                  ;C3808D|FA      |      ;
PLB                                  ;C3808E|AB      |      ;
PLP                                  ;C3808F|28      |      ;
SEC                                  ;C38090|38      |      ;
RTL                                  ;C38091|6B      |      ;
PHP                                  ;C38092|08      |      ;
PHX                                  ;C38093|DA      |      ;
PHY                                  ;C38094|5A      |      ;
REP #$20                             ;C38095|C220    |      ;
LDA.W $03A6                          ;C38097|ADA603  |8103A6;
XBA                                  ;C3809A|EB      |      ;
ASL A                                ;C3809B|0A      |      ;
ASL A                                ;C3809C|0A      |      ;
CLC                                  ;C3809D|18      |      ;
ADC.W #$6000                         ;C3809E|690060  |      ;
TAX                                  ;C380A1|AA      |      ;
LDA.W #$3652                         ;C380A2|A95236  |      ;
STA.B $16                            ;C380A5|8516    |000016;
STA.B $18                            ;C380A7|8518    |000018;
LDA.W #$01FD                         ;C380A9|A9FD01  |      ;
STA.B $0C                            ;C380AC|850C    |00000C;

CODE_C380AE:
LDA.L $300000,X                      ;C380AE|BF000030|300000;
PHA                                  ;C380B2|48      |      ;
CLC                                  ;C380B3|18      |      ;
ADC.B $16                            ;C380B4|6516    |000016;
STA.B $16                            ;C380B6|8516    |000016;
PLA                                  ;C380B8|68      |      ;
EOR.B $18                            ;C380B9|4518    |000018;
STA.B $18                            ;C380BB|8518    |000018;
INX                                  ;C380BD|E8      |      ;
INX                                  ;C380BE|E8      |      ;
DEC.B $0C                            ;C380BF|C60C    |00000C;
BNE CODE_C380AE                      ;C380C1|D0EB    |C380AE;
PLY                                  ;C380C3|7A      |      ;
PLX                                  ;C380C4|FA      |      ;
PLP                                  ;C380C5|28      |      ;
RTL                                  ;C380C6|6B      |      ;
PHP                                  ;C380C7|08      |      ;
REP #$20                             ;C380C8|C220    |      ;
LDA.W #$C002                         ;C380CA|A902C0  |      ;
STA.B $29                            ;C380CD|8529    |000029;
SEP #$20                             ;C380CF|E220    |      ;
LDA.B #$8A                           ;C380D1|A98A    |      ;
STA.B $2B                            ;C380D3|852B    |00002B;
REP #$20                             ;C380D5|C220    |      ;
LDA.W #$4000                         ;C380D7|A90040  |      ;
STA.B $23                            ;C380DA|8523    |000023;
LDX.W #$8000                         ;C380DC|A20080  |      ;
STX.B $25                            ;C380DF|8625    |000025;
JSL.L CODE_C2B272                    ;C380E1|2272B282|82B272;
PHB                                  ;C380E5|8B      |      ;
LDX.W #$8000                         ;C380E6|A20080  |      ;
LDY.W #$3000                         ;C380E9|A00030  |      ;
LDA.W #$3FFF                         ;C380EC|A9FF3F  |      ;
MVN $7F,$7E                          ;C380EF|547F7E  |      ;
PLB                                  ;C380F2|AB      |      ;
LDA.W #$C002                         ;C380F3|A902C0  |      ;
STA.B $29                            ;C380F6|8529    |000029;
SEP #$20                             ;C380F8|E220    |      ;
LDA.B #$8B                           ;C380FA|A98B    |      ;
STA.B $2B                            ;C380FC|852B    |00002B;
REP #$20                             ;C380FE|C220    |      ;
LDA.W #$2000                         ;C38100|A90020  |      ;
STA.B $23                            ;C38103|8523    |000023;
LDX.W #$8000                         ;C38105|A20080  |      ;
STX.B $25                            ;C38108|8625    |000025;
JSL.L CODE_C2B272                    ;C3810A|2272B282|82B272;
PHB                                  ;C3810E|8B      |      ;
LDX.W #$8000                         ;C3810F|A20080  |      ;
LDY.W #$1000                         ;C38112|A00010  |      ;
LDA.W #$1FFF                         ;C38115|A9FF1F  |      ;
MVN $7F,$7E                          ;C38118|547F7E  |      ;
PLB                                  ;C3811B|AB      |      ;
LDA.W #$D002                         ;C3811C|A902D0  |      ;
STA.B $29                            ;C3811F|8529    |000029;
SEP #$20                             ;C38121|E220    |      ;
LDA.B #$89                           ;C38123|A989    |      ;
STA.B $2B                            ;C38125|852B    |00002B;
REP #$20                             ;C38127|C220    |      ;
LDA.W #$2000                         ;C38129|A90020  |      ;
STA.B $23                            ;C3812C|8523    |000023;
LDX.W #$8000                         ;C3812E|A20080  |      ;
STX.B $25                            ;C38131|8625    |000025;
JSL.L CODE_C2B272                    ;C38133|2272B282|82B272;
PHB                                  ;C38137|8B      |      ;
LDX.W #$8000                         ;C38138|A20080  |      ;
LDY.W #$C000                         ;C3813B|A000C0  |      ;
LDA.W #$1FFF                         ;C3813E|A9FF1F  |      ;
MVN $7F,$7E                          ;C38141|547F7E  |      ;
PLB                                  ;C38144|AB      |      ;
JSL.L CODE_C38188                    ;C38145|22888183|838188;
PLP                                  ;C38149|28      |      ;
RTL                                  ;C3814A|6B      |      ;
PHP                                  ;C3814B|08      |      ;
REP #$20                             ;C3814C|C220    |      ;
LDA.W current_map_number                          ;C3814E|AD6A1C  |811C6A;
SEC                                  ;C38151|38      |      ;
SBC.W #$000F                         ;C38152|E90F00  |      ;
CMP.W #$0004                         ;C38155|C90400  |      ;
BCS CODE_C3815D                      ;C38158|B003    |C3815D;
BRL CODE_C3817E                      ;C3815A|822100  |C3817E;

CODE_C3815D:
LDA.W $0312                          ;C3815D|AD1203  |810312;
AND.W #$001F                         ;C38160|291F00  |      ;
XBA                                  ;C38163|EB      |      ;
LSR A                                ;C38164|4A      |      ;
CLC                                  ;C38165|18      |      ;
ADC.W #$1000                         ;C38166|690010  |      ;
STA.W $03DF                          ;C38169|8DDF03  |8103DF;
LDA.W $0312                          ;C3816C|AD1203  |810312;
AND.W #$0003                         ;C3816F|290300  |      ;
ASL A                                ;C38172|0A      |      ;
TAX                                  ;C38173|AA      |      ;
LDA.L UNREACH_838180,X               ;C38174|BF808183|838180;
STA.W $03E1                          ;C38178|8DE103  |8103E1;
INC.W $03E3                          ;C3817B|EEE303  |8103E3;

CODE_C3817E:
PLP                                  ;C3817E|28      |      ;
RTL                                  ;C3817F|6B      |      ;
db $60,$20,$80,$20,$A0,$20,$C0,$20   ;C38180|        |      ;
PHP                                  ;C38188|08      |      ;
REP #$20                             ;C38189|C220    |      ;
LDX.W #$0000                         ;C3818B|A20000  |      ;
TXA                                  ;C3818E|8A      |      ;

CODE_C3818F:
STA.W $0100,X                        ;C3818F|9D0001  |810100;
INX                                  ;C38192|E8      |      ;
INX                                  ;C38193|E8      |      ;
CPX.W #$0200                         ;C38194|E00002  |      ;
BNE CODE_C3818F                      ;C38197|D0F6    |C3818F;
DEC A                                ;C38199|3A      |      ;
STA.W $0100,X                        ;C3819A|9D0001  |810100;
PLP                                  ;C3819D|28      |      ;
RTL                                  ;C3819E|6B      |      ;
db $08,$DA,$E2,$20,$AD,$CF,$03,$F0   ;C3819F|        |      ;
db $35,$9C,$CF,$03,$A2,$00,$00,$9B   ;C381A7|        |00009C;
db $AD,$CE,$03,$8D,$1B,$21,$9C,$1B   ;C381AF|        |0003CE;
db $21,$B9,$84,$FC,$8D,$1C,$21,$8D   ;C381B7|        |0000B9;
db $1C,$21,$C2,$20,$AD,$35,$21,$9F   ;C381BF|        |00C221;
db $00,$79,$7E,$9F,$00,$7B,$7E,$98   ;C381C7|        |      ;
db $E2,$20,$18,$6D,$D0,$03,$A8,$E8   ;C381CF|        |      ;
db $E8,$E0,$00,$02,$D0,$DB,$FA,$28   ;C381D7|        |      ;
db $6B                               ;C381DF|        |      ;


; Calculate PassableMap offset
;
; This function takes two words at position $16 and $18 and calculates the
; offset in the `passable_map` table.
; The offset is return in the `X` register
CalcPassablemapOffset:
LDA.B $18                            ;C381E0|A518    |000018;
PHA                                  ;C381E2|48      |      ;
SEP #$20                             ;C381E3|E220    |      ;
LDA.W $0343                          ;C381E5|AD4303  |810343;
JSL.L multiply                    ;C381E8|22D1B182|82B1D1;
STA.B $02,S                          ;C381EC|8302    |000002;
LDA.B $16                            ;C381EE|A516    |000016;
LSR A                                ;C381F0|4A      |      ;
LSR A                                ;C381F1|4A      |      ;
LSR A                                ;C381F2|4A      |      ;
LSR A                                ;C381F3|4A      |      ;
AND.B #$0F                           ;C381F4|290F    |      ;
CLC                                  ;C381F6|18      |      ;
ADC.B $01,S                          ;C381F7|6301    |000001;
STA.B $01,S                          ;C381F9|8301    |000001;
LDA.B $17                            ;C381FB|A517    |000017;
CLC                                  ;C381FD|18      |      ;
ADC.B $02,S                          ;C381FE|6302    |000002;
STA.B $02,S                          ;C38200|8302    |000002;
REP #$20                             ;C38202|C220    |      ;
PLX                                  ;C38204|FA      |      ;
CPX.W #$4000                         ;C38205|E00040  |      ;
BCC CODE_C3820D                      ;C38208|9003    |C3820D;
db $A2,$00,$00                       ;C3820A|        |      ;

CODE_C3820D:
RTL                                  ;C3820D|6B      |      ;
LDA.B $18                            ;C3820E|A518    |000018;
AND.W #$00F8                         ;C38210|29F800  |      ;
ASL A                                ;C38213|0A      |      ;
ASL A                                ;C38214|0A      |      ;
PHA                                  ;C38215|48      |      ;
LDA.B $16                            ;C38216|A516    |000016;
AND.W #$00F8                         ;C38218|29F800  |      ;
LSR A                                ;C3821B|4A      |      ;
LSR A                                ;C3821C|4A      |      ;
LSR A                                ;C3821D|4A      |      ;
CLC                                  ;C3821E|18      |      ;
ADC.B $01,S                          ;C3821F|6301    |000001;
STA.B $01,S                          ;C38221|8301    |000001;
LDA.B $16                            ;C38223|A516    |000016;
AND.W #$0100                         ;C38225|290001  |      ;
ASL A                                ;C38228|0A      |      ;
ASL A                                ;C38229|0A      |      ;
CLC                                  ;C3822A|18      |      ;
ADC.B $01,S                          ;C3822B|6301    |000001;
STA.B $01,S                          ;C3822D|8301    |000001;
LDA.B $18                            ;C3822F|A518    |000018;
AND.W #$0100                         ;C38231|290001  |      ;
ASL A                                ;C38234|0A      |      ;
ASL A                                ;C38235|0A      |      ;
ASL A                                ;C38236|0A      |      ;
CLC                                  ;C38237|18      |      ;
ADC.B $01,S                          ;C38238|6301    |000001;
STA.B $01,S                          ;C3823A|8301    |000001;
PLA                                  ;C3823C|68      |      ;
CLC                                  ;C3823D|18      |      ;
ADC.W #$6000                         ;C3823E|690060  |      ;
RTL                                  ;C38241|6B      |      ;

CODE_C38242:
PHP                                  ;C38242|08      |      ;
SEP #$20                             ;C38243|E220    |      ;
TXA                                  ;C38245|8A      |      ;
AND.B #$0F                           ;C38246|290F    |      ;
CMP.B #$0F                           ;C38248|C90F    |      ;
REP #$20                             ;C3824A|C220    |      ;
BEQ CODE_C38251                      ;C3824C|F003    |C38251;
INX                                  ;C3824E|E8      |      ;
PLP                                  ;C3824F|28      |      ;
RTL                                  ;C38250|6B      |      ;

CODE_C38251:
TXA                                  ;C38251|8A      |      ;
CLC                                  ;C38252|18      |      ;
ADC.W #$00F1                         ;C38253|69F100  |      ;
TAX                                  ;C38256|AA      |      ;
PLP                                  ;C38257|28      |      ;
RTL                                  ;C38258|6B      |      ;

CODE_C38259:
PHP                                  ;C38259|08      |      ;
REP #$20                             ;C3825A|C220    |      ;
TXA                                  ;C3825C|8A      |      ;
SEP #$20                             ;C3825D|E220    |      ;
CLC                                  ;C3825F|18      |      ;
ADC.B #$10                           ;C38260|6910    |      ;
REP #$20                             ;C38262|C220    |      ;
BCS CODE_C38269                      ;C38264|B003    |C38269;
TAX                                  ;C38266|AA      |      ;
PLP                                  ;C38267|28      |      ;
RTL                                  ;C38268|6B      |      ;

CODE_C38269:
CLC                                  ;C38269|18      |      ;
ADC.W $0342                          ;C3826A|6D4203  |810342;
TAX                                  ;C3826D|AA      |      ;
PLP                                  ;C3826E|28      |      ;
RTL                                  ;C3826F|6B      |      ;

;;; A contains the bit position to set
;;; Y contains the pointer to a table where `A` is the offset to
setBit:
    PHP
    REP #$20
    PHA
    PHX
    PHY
    PHA
    PHY
    AND.W #$03F8    ; calculate the offset relative to the table start
    LSR A           ; divide it by 8 (bits)
    LSR A
    LSR A
    CLC             ; and add that to the original Y start
    ADC.B 1, S
    STA.B 1, S
    PLY             ; pull the new, calculated offset to Y
    PLA             ; and the old index A
    AND.W #7        ; make sure it is bound to a byte
    TAX
    SEP #$20
    LDA.L bitmask2, X ; load the bitmask for the check
    ORA.W 0, Y        ; or that with the original value (e.g. %0110 | %0001 = %0111)
    STA.W 0, Y        ; and write it back
    REP #$20
    PLY
    PLX
    PLA
    PLP
    RTL

;;; A contains the bit position to clear
;;; Y contains the pointer to a table where `A` is the offset to
clearBit:
    PHP
    REP #$20
    PHA
    PHX
    PHY
    PHA
    PHY
    AND.W #$03F8    ; calculate the offset relative to the table start
    LSR A           ; divide it by 8 (bits)
    LSR A
    LSR A
    CLC             ; and add that to the original Y start
    ADC.B 1, S
    STA.B 1, S
    PLY             ; pull the new, calculated offset to Y
    PLA             ; and the old index A
    AND.W #7        ; make sure it is bound to a byte
    TAX
    SEP #$20
    ; effectliy this does `*Y &= ~bitmask`, which is a classic bit clear
    LDA.L bitmask2, X ; load the bitmask for the check
    EOR.B #$FF        ; invert the bitmask
    AND.W 0, Y        ; and that with the original value
    STA.W 0, Y        ; and write it back
    REP #$20
    PLY
    PLX
    PLA
    PLP
    RTL

; A contains the bit position to check (0-$3F8?)
; Y contains the pointer to the start of a table to check
; returns the result in the carry bit: it's clear if the bit is clear and the carry bit is set if the bit is set
checkIfBitIsSet:
    PHP
    REP #$20
    PHA
    PHX
    PHY
    PHA
    PHY
    AND.W #$03F8 ; calculate the offset to the table start
    LSR A        ; divide it by 8 (bits)
    LSR A
    LSR A
    CLC          ; and add that to the original Y start
    ADC.B 1, S
    STA.B 1, S
    PLY         ; pull the new, calculated offset to Y
    PLA         ; and the old index A
    AND.W #7    ; make sure it is bound to a byte
    TAX
    SEP #$20
    LDA.L bitmask2, X ; load the bitmask for the check
    AND.W $0000, Y    ; check it by anding the bitmask with the real value
    REP #$20
    BNE .set          ; and checking it against 0
    PLY
    PLX
    PLA
    PLP
    CLC
    RTL

.set:
    PLY
    PLX
    PLA
    PLP
    SEC
    RTL


PHP                                  ;C382FC|08      |      ;
SEP #$20                             ;C382FD|E220    |      ;
LDY.W $039E                          ;C382FF|AC9E03  |81039E;
LDX.W $001E,Y                        ;C38302|BE1E00  |81001E;
CPX.W #$002C                         ;C38305|E02C00  |      ;
BCS CODE_C38310                      ;C38308|B006    |C38310;
LDA.W UNREACH_81FA7F,X               ;C3830A|BD7FFA  |81FA7F;
PLP                                  ;C3830D|28      |      ;
CLC                                  ;C3830E|18      |      ;
RTL                                  ;C3830F|6B      |      ;

CODE_C38310:
PLP                                  ;C38310|28      |      ;
SEC                                  ;C38311|38      |      ;
RTL                                  ;C38312|6B      |      ;
PHP                                  ;C38313|08      |      ;
REP #$20                             ;C38314|C220    |      ;
LDA.W $001C,X                        ;C38316|BD1C00  |81001C;
EOR.W #$4000                         ;C38319|490040  |      ;
STA.W $001C,X                        ;C3831C|9D1C00  |81001C;
PLP                                  ;C3831F|28      |      ;
RTL                                  ;C38320|6B      |      ;

SUB_C38321:
    PHP                                  ;C38321|08      |      ;
    PHX                                  ;C38322|DA      |      ;
    SEP #$20                             ;C38323|E220    |      ;
    LDA.W current_map_number                          ;C38325|AD6A1C  |811C6A;
    SEC                                  ;C38328|38      |      ;
    SBC.B #$0F                           ;C38329|E90F    |      ;
    CMP.B #$04                           ;C3832B|C904    |      ;
    BCS .CODE_C38332                      ;C3832D|B003    |C38332;
    BRL .ret                      ;C3832F|825500  |C38387;

.CODE_C38332:
    LDA.W $0445                          ;C38332|AD4504  |810445;
    BNE .CODE_C3833C                      ;C38335|D005    |C3833C;
    LDA.W Equipment.sword                          ;C38337|AD5E1B  |811B5E;
    BNE .CODE_C38368                      ;C3833A|D02C    |C38368;

.CODE_C3833C:
    LDX.W $039E                          ;C3833C|AE9E03  |81039E;
    LDA.B #$8A                           ;C3833F|A98A    |      ;
    STA.W $0024,X                        ;C38341|9D2400  |810024;
    LDY.W $001E,X                        ;C38344|BC1E00  |81001E;
    LDA.W UNREACH_81FA7F,Y               ;C38347|B97FFA  |81FA7F;
    EOR.B #$01                           ;C3834A|4901    |      ;
    STA.W $001E,X                        ;C3834C|9D1E00  |81001E;
    REP #$20                             ;C3834F|C220    |      ;
    STZ.W $0020,X                        ;C38351|9E2000  |810020;
    JSL.L CODE_C0891F                    ;C38354|221F8980|80891F;
    LDX.W $03A0                          ;C38358|AEA003  |8103A0;
    LDA.W $0016,X                        ;C3835B|BD1600  |810016;
    ORA.W #$2000                         ;C3835E|090020  |      ;
    STA.W $0016,X                        ;C38361|9D1600  |810016;
    SEP #$20                             ;C38364|E220    |      ;
    BRA .ret                      ;C38366|801F    |C38387;

.CODE_C38368:
    LDX.W $039E                          ;C38368|AE9E03  |81039E;
    LDA.B #$8B                           ;C3836B|A98B    |      ;
    STA.W $0024,X                        ;C3836D|9D2400  |810024;
    REP #$20                             ;C38370|C220    |      ;
    STZ.W $0020,X                        ;C38372|9E2000  |810020;
    JSL.L CODE_C0891F                    ;C38375|221F8980|80891F;
    LDX.W $03A0                          ;C38379|AEA003  |8103A0;
    LDA.W $0016,X                        ;C3837C|BD1600  |810016;
    AND.W #$DFFF                         ;C3837F|29FFDF  |      ;
    STA.W $0016,X                        ;C38382|9D1600  |810016;
    SEP #$20                             ;C38385|E220    |      ;

.ret:
    PLX                                  ;C38387|FA      |      ;
    PLP                                  ;C38388|28      |      ;
    RTL                                  ;C38389|6B      |      ;

db $85,$00,$AC,$9E,$03,$B9,$16,$00   ;C3838A|        |000000;
db $89,$00,$0C,$F0,$02,$18,$6B,$DA   ;C38392|        |      ;
db $AD,$74,$03,$29,$0F,$00,$F0,$0B   ;C3839A|        |000374;
db $AD,$76,$03,$29,$0F,$00,$F0,$2E   ;C383A2|        |000376;
db $82,$95,$00,$AD,$76,$03,$29,$0F   ;C383AA|        |C38442;
db $00,$D0,$5B,$AD,$74,$03,$85,$16   ;C383B2|        |      ;
db $AD,$76,$03,$38,$E9,$10,$00,$85   ;C383BA|        |000376;
db $18,$22,$E0,$81,$83,$BF,$00,$80   ;C383C2|        |      ;
db $7E,$29,$FF,$00,$C5,$00,$D0,$03   ;C383CA|        |00FF29;
db $82,$C2,$00,$FA,$18,$6B,$AD,$74   ;C383D2|        |C38497;
db $03,$29,$F0,$FF,$85,$16,$AD,$76   ;C383DA|        |000029;
db $03,$38,$E9,$10,$00,$85,$18,$22   ;C383E2|        |000038;
db $E0,$81,$83,$BF,$00,$80,$7E,$29   ;C383EA|        |      ;
db $FF,$00,$C5,$00,$D0,$03,$82,$9C   ;C383F2|        |00C500;
db $00,$22,$42,$82,$83,$BF,$00,$80   ;C383FA|        |      ;
db $7E,$29,$FF,$00,$C5,$00,$D0,$03   ;C38402|        |00FF29;
db $82,$8A,$00,$FA,$18,$6B,$AD,$74   ;C3840A|        |C38497;
db $03,$85,$16,$AD,$76,$03,$29,$F0   ;C38412|        |000085;
db $FF,$38,$E9,$10,$00,$85,$18,$22   ;C3841A|        |10E938;
db $E0,$81,$83,$BF,$00,$80,$7E,$29   ;C38422|        |      ;
db $FF,$00,$C5,$00,$F0,$67,$22,$59   ;C3842A|        |00C500;
db $82,$83,$BF,$00,$80,$7E,$29,$FF   ;C38432|        |C343B8;
db $00,$C5,$00,$F0,$58,$FA,$18,$6B   ;C3843A|        |      ;
db $AD,$74,$03,$29,$F0,$FF,$85,$16   ;C38442|        |000374;
db $AD,$76,$03,$29,$F0,$FF,$38,$E9   ;C3844A|        |000376;
db $10,$00,$85,$18,$22,$E0,$81,$83   ;C38452|        |C38454;
db $BF,$00,$80,$7E,$29,$FF,$00,$C5   ;C3845A|        |7E8000;
db $00,$F0,$32,$DA,$22,$42,$82,$83   ;C38462|        |      ;
db $BF,$00,$80,$7E,$29,$FF,$00,$FA   ;C3846A|        |7E8000;
db $C5,$00,$F0,$21,$22,$59,$82,$83   ;C38472|        |000000;
db $BF,$00,$80,$7E,$29,$FF,$00,$C5   ;C3847A|        |7E8000;
db $00,$F0,$12,$22,$42,$82,$83,$BF   ;C38482|        |      ;
db $00,$80,$7E,$29,$FF,$00,$C5,$00   ;C3848A|        |      ;
db $F0,$03,$FA,$18,$6B,$FA,$38,$6B   ;C38492|        |C38497;

CODE_C3849A:
LDA.W $03A4                          ;C3849A|ADA403  |8103A4;
BMI CODE_C3850F                      ;C3849D|3070    |C3850F;
BNE CODE_C38505                      ;C3849F|D064    |C38505;
LDA.W $0323                          ;C384A1|AD2303  |810323;
BIT.B #$10                           ;C384A4|8910    |      ;
BEQ CODE_C3850F                      ;C384A6|F067    |C3850F;
INC.W $03A4                          ;C384A8|EEA403  |8103A4;
LDA.B #$F2                           ;C384AB|A9F2    |      ;
STA.W APUI00                          ;C384AD|8D4021  |812140;
LDA.W $4218                          ;C384B0|AD1842  |814218;
BIT.B #$80                           ;C384B3|8980    |      ;
BNE CODE_C384D9                      ;C384B5|D022    |C384D9;
LDY.W #$C6FD                         ;C384B7|A0FDC6  |      ;
JSL.L printOsdStringFromBank2                    ;C384BA|2254A782|82A754;
LDA.W $0445                          ;C384BE|AD4504  |810445;
BNE CODE_C384D4                      ;C384C1|D011    |C384D4;
LDA.W remaining_lair                          ;C384C3|AD6204  |810462;
LDX.W #$1B80                         ;C384C6|A2801B  |      ;
JSL.L CODE_C2B215                    ;C384C9|2215B282|82B215;
LDY.W #$C70E                         ;C384CD|A00EC7  |      ;
JSL.L printOsdStringFromBank2                    ;C384D0|2254A782|82A754;

CODE_C384D4:
LDA.B #$01                           ;C384D4|A901    |      ;
STA.W $03BA                          ;C384D6|8DBA03  |8103BA;

CODE_C384D9:
JSR.W CODE_C38510                    ;C384D9|201085  |C38510;
BNE CODE_C384D9                      ;C384DC|D0FB    |C384D9;

CODE_C384DE:
JSR.W CODE_C38510                    ;C384DE|201085  |C38510;
BEQ CODE_C384DE                      ;C384E1|F0FB    |C384DE;
LDY.W #$C730                         ;C384E3|A030C7  |      ;
JSL.L printOsdStringFromBank2                    ;C384E6|2254A782|82A754;
LDA.B #$01                           ;C384EA|A901    |      ;
STA.W $03BA                          ;C384EC|8DBA03  |8103BA;
LDA.B #$01                           ;C384EF|A901    |      ;
STA.W APUI00                          ;C384F1|8D4021  |812140;
JSR.W CODE_C38510                    ;C384F4|201085  |C38510;
JSR.W CODE_C38510                    ;C384F7|201085  |C38510;
JSR.W CODE_C38510                    ;C384FA|201085  |C38510;
JSR.W CODE_C38510                    ;C384FD|201085  |C38510;
JSL.L wait_vblank                    ;C38500|22B7B182|82B1B7;
RTL                                  ;C38504|6B      |      ;

CODE_C38505:
LDA.W $0323                          ;C38505|AD2303  |810323;
BIT.B #$10                           ;C38508|8910    |      ;
BNE CODE_C3850F                      ;C3850A|D003    |C3850F;
STZ.W $03A4                          ;C3850C|9CA403  |8103A4;

CODE_C3850F:
RTL                                  ;C3850F|6B      |      ;

CODE_C38510:
LDX.W $0312                          ;C38510|AE1203  |810312;
DEX                                  ;C38513|CA      |      ;
STX.W $0312                          ;C38514|8E1203  |810312;
JSL.L wait_vblank                    ;C38517|22B7B182|82B1B7;
LDA.W $0323                          ;C3851B|AD2303  |810323;
BIT.B #$10                           ;C3851E|8910    |      ;
RTS                                  ;C38520|60      |      ;
LDA.W player_health_restore                          ;C38521|AD4704  |810447;
BEQ CODE_C38547                      ;C38524|F021    |C38547;
LDA.W $0312                          ;C38526|AD1203  |810312;
AND.B #$03                           ;C38529|2903    |      ;
BNE CODE_C38547                      ;C3852B|D01A    |C38547;
DEC.W player_health_restore                          ;C3852D|CE4704  |810447;
LDA.W player_current_health                          ;C38530|AD881B  |811B88;
CMP.W player_max_health                          ;C38533|CD8A1B  |811B8A;
BCS CODE_C3853F                      ;C38536|B007    |C3853F;
INC.W player_current_health                          ;C38538|EE881B  |811B88;
BRK #$48                             ;C3853B|0048    |      ;
BRA CODE_C38542                      ;C3853D|8003    |C38542;

CODE_C3853F:
STZ.W player_health_restore                          ;C3853F|9C4704  |810447;

CODE_C38542:
LDA.B #$04                           ;C38542|A904    |      ;
TSB.W display_hud_bitfield                          ;C38544|0C3203  |810332;

CODE_C38547:
RTL                                  ;C38547|6B      |      ;

IncrementExpPerTick:
    LDA.W exp_to_give
    ORA.W exp_to_give+1
    BEQ .end
    LDA.W $0312
    AND.B #%111
    BNE .end
    REP #$20
    BRK #$48
    SED
    LDA.W exp_to_give : AND.W #$000F : BNE .less_than_10
    LDA.W exp_to_give : AND.W #$00F0 : BNE .less_than_100
    LDA.W exp_to_give : AND.W #$0F00 : BNE .less_than_1000
    LDA.W exp_to_give
    SEC
    SBC.W #$1000
    STA.W exp_to_give
    LDA.W #$1000
    BRA  .actual_give

.less_than_1000:
    LDA.W exp_to_give
    SEC
    SBC.W #$100
    STA.W exp_to_give
    LDA.W #$100
    BRA .actual_give
.less_than_100:
    LDA.W exp_to_give
    SEC
    SBC.W #$10
    STA.W exp_to_give
    LDA.W #$10
    BRA .actual_give
.less_than_10:
    LDA.W exp_to_give
    SEC
    SBC.W #$1
    STA.W exp_to_give
    LDA.W #$1

.actual_give:
    CLD
    JSL.L AddExp
    SEP #$20
    LDA.B #!UpdateHud_Exp
    TSB.W display_hud_bitfield

.end:
    RTL

;;; `A` contains the amount to add
AddExp:
    SED
    CLC
    ADC.W PlayerExp.lower10k
    STA.W PlayerExp.lower10k
    LDA.W PlayerExp.upper10k
    ADC.W #0
    STA.W PlayerExp.upper10k
    BCC .end
    LDA.W #$9999
    STA.W PlayerExp.lower10k
    STA.W PlayerExp.upper10k
.end:
    CLD
    RTL

;;; `A` contains the amount to add
AddGold:
    SED
    CLC
    ADC.W PlayerGold.lower10k
    STA.W PlayerGold.lower10k
    LDA.W PlayerGold.upper10k
    ADC.W #0
    STA.W PlayerGold.upper10k
    CMP.W #154
    BCC .end
    LDA.W #$9999
    STA.W PlayerGold.lower10k
    LDA.W #$99
    STA.W PlayerGold.upper10k
.end
    CLD
    RTL

;;; `A` contains the amount to subtract
SubtractGold:
    SED
    STA.B $04
    LDA.W PlayerGold.lower10k
    SEC
    SBC.B $04
    STA.B $00
    LDA.W PlayerGold.upper10k
    SBC.W #0
    STA.B $02
    BCS .hundreds
    CLD
    SEC
    RTL

.hundreds:
    LDA.B $00
    STA.W PlayerGold.lower10k
    LDA.B $02
    STA.W PlayerGold.upper10k
    CLD
    CLC
    RTL

ClearL3:
    PHX
    PHP
    REP #$20
    LDA.W #$2000
    LDX.W #$0000

.loop:
    STA.L L3_Text, X
    INX
    INX
    CPX.W #$1000
    BNE .loop
    PLP
    PLX
    RTL

LDA.W lair_reveal_in_progress                          ;C3863A|ADFD03  |8103FD;
BEQ CODE_C38656                      ;C3863D|F017    |C38656;
PHB                                  ;C3863F|8B      |      ;
LDA.B #$7F                           ;C38640|A97F    |      ;
PHA                                  ;C38642|48      |      ;
PLB                                  ;C38643|AB      |      ;
REP #$20                             ;C38644|C220    |      ;
LDX.W #$0000                         ;C38646|A20000  |      ;

CODE_C38649:
STZ.W $0483,X                        ;C38649|9E8304  |7F0483;
INX                                  ;C3864C|E8      |      ;
INX                                  ;C3864D|E8      |      ;
CPX.W #$0400                         ;C3864E|E00004  |      ;
BNE CODE_C38649                      ;C38651|D0F6    |C38649;
SEP #$20                             ;C38653|E220    |      ;
PLB                                  ;C38655|AB      |      ;

CODE_C38656:
RTL                                  ;C38656|6B      |      ;
LDA.B #$02                           ;C38657|A902    |      ;
STA.B $2A                            ;C38659|852A    |00002A;
LDA.W $0343                          ;C3865B|AD4303  |810343;
XBA                                  ;C3865E|EB      |      ;
LDA.W $0345                          ;C3865F|AD4503  |810345;
JSL.L multiply                    ;C38662|22D1B182|82B1D1;
XBA                                  ;C38666|EB      |      ;
TAY                                  ;C38667|A8      |      ;
BEQ CODE_C38670                      ;C38668|F006    |C38670;
LDX.W #$8000                         ;C3866A|A20080  |      ;
JSR.W CODE_C38671                    ;C3866D|207186  |C38671;

CODE_C38670:
RTL                                  ;C38670|6B      |      ;

CODE_C38671:
PHX                                  ;C38671|DA      |      ;
PHY                                  ;C38672|5A      |      ;
LDX.W #$0000                         ;C38673|A20000  |      ;
TXY                                  ;C38676|9B      |      ;
LDA.B #$00                           ;C38677|A900    |      ;
STA.B $0C                            ;C38679|850C    |00000C;

CODE_C3867B:
LDA.B #$04                           ;C3867B|A904    |      ;
STA.B $0E                            ;C3867D|850E    |00000E;

CODE_C3867F:
LDA.L $7E2001,X                      ;C3867F|BF01207E|7E2001;
INX                                  ;C38683|E8      |      ;
INX                                  ;C38684|E8      |      ;
AND.B #$02                           ;C38685|2902    |      ;
PHA                                  ;C38687|48      |      ;
DEC.B $0E                            ;C38688|C60E    |00000E;
BNE CODE_C3867F                      ;C3868A|D0F3    |C3867F;
PLA                                  ;C3868C|68      |      ;
ASL A                                ;C3868D|0A      |      ;
ORA.B $01,S                          ;C3868E|0301    |000001;
ASL A                                ;C38690|0A      |      ;
ORA.B $02,S                          ;C38691|0302    |000002;
ASL A                                ;C38693|0A      |      ;
ORA.B $03,S                          ;C38694|0303    |000003;
LSR A                                ;C38696|4A      |      ;
STA.W $0200,Y                        ;C38697|990002  |810200;
INY                                  ;C3869A|C8      |      ;
PLA                                  ;C3869B|68      |      ;
PLA                                  ;C3869C|68      |      ;
PLA                                  ;C3869D|68      |      ;
DEC.B $0C                            ;C3869E|C60C    |00000C;
BNE CODE_C3867B                      ;C386A0|D0D9    |C3867B;
PLY                                  ;C386A2|7A      |      ;
PLX                                  ;C386A3|FA      |      ;

CODE_C386A4:
LDA.L $7E0000,X                      ;C386A4|BF00007E|7E0000;
STA.B $29                            ;C386A8|8529    |000029;
LDA.B ($29)                          ;C386AA|B229    |000029;
STA.L $7F0000,X                      ;C386AC|9F00007F|7F0000;
INX                                  ;C386B0|E8      |      ;
DEY                                  ;C386B1|88      |      ;
BNE CODE_C386A4                      ;C386B2|D0F0    |C386A4;
RTS                                  ;C386B4|60      |      ;

check_map_change:
LDA.W $0318                          ;C386B5|AD1803  |810318;
BEQ CODE_C38708                      ;C386B8|F04E    |C38708;
LDA.W $032E                          ;C386BA|AD2E03  |81032E;
BEQ CODE_C386CC                      ;C386BD|F00D    |C386CC;
LDA.B #$1E                           ;C386BF|A91E    |      ;
STA.W $03E7                          ;C386C1|8DE703  |8103E7;
LDA.B #$FF                           ;C386C4|A9FF    |      ;
STA.W $03E9                          ;C386C6|8DE903  |8103E9;
JSR.W CODE_C38709                    ;C386C9|200987  |C38709;

CODE_C386CC:
STZ.W $032E                          ;C386CC|9C2E03  |81032E;
STZ.B $42                            ;C386CF|6442    |000042;
JSL.L CODE_C2B18C                    ;C386D1|228CB182|82B18C;
LDA.W $0318                          ;C386D5|AD1803  |810318;
STA.W $0316                          ;C386D8|8D1603  |810316;
LDA.W $0319                          ;C386DB|AD1903  |810319;
STA.W $0314                          ;C386DE|8D1403  |810314;
STZ.W $0318                          ;C386E1|9C1803  |810318;
JSL.L CODE_C388E9                    ;C386E4|22E98883|8388E9;
JSL.L CODE_C0814E                    ;C386E8|224E8180|80814E;
JSL.L enable_interrupts                    ;C386EC|22A2B182|82B1A2;
STZ.W $03E7                          ;C386F0|9CE703  |8103E7;
LDA.B #$01                           ;C386F3|A901    |      ;
STA.W $03E9                          ;C386F5|8DE903  |8103E9;
JSR.W CODE_C3875B                    ;C386F8|205B87  |C3875B;
INC.W $032E                          ;C386FB|EE2E03  |81032E;
STZ.W $03E5                          ;C386FE|9CE503  |8103E5;
STZ.W $046E                          ;C38701|9C6E04  |81046E;
JSL.L CODE_C0814E                    ;C38704|224E8180|80814E;

CODE_C38708:
RTL                                  ;C38708|6B      |      ;

CODE_C38709:
LDA.W $03E5                          ;C38709|ADE503  |8103E5;
BPL CODE_C38711                      ;C3870C|1003    |C38711;
BRL CODE_C387B0                      ;C3870E|829F00  |C387B0;

CODE_C38711:
BEQ CODE_C38728                      ;C38711|F015    |C38728;
DEC A                                ;C38713|3A      |      ;
BEQ CODE_C38728                      ;C38714|F012    |C38728;
DEC A                                ;C38716|3A      |      ;
BEQ UNREACH_C38735                   ;C38717|F01C    |C38735;
DEC A                                ;C38719|3A      |      ;
BEQ UNREACH_C38735                   ;C3871A|F019    |C38735;
DEC A                                ;C3871C|3A      |      ;
BEQ CODE_C3873D                      ;C3871D|F01E    |C3873D;
db $3A,$F0,$1B,$3A,$F0,$10,$3A,$F0   ;C3871F|        |      ;
db $0D                               ;C38727|        |000FA9;

CODE_C38728:
LDA.B #$0F                           ;C38728|A90F    |      ;

CODE_C3872A:
JSL.L CODE_C0814E                    ;C3872A|224E8180|80814E;
STA.W $2100                          ;C3872E|8D0021  |812100;
DEC A                                ;C38731|3A      |      ;
BPL CODE_C3872A                      ;C38732|10F6    |C3872A;
RTS                                  ;C38734|60      |      ;

UNREACH_C38735:
db $22,$4E,$81,$80,$9C,$00,$21,$60   ;C38735|        |80814E;

CODE_C3873D:
LDA.B #$0F                           ;C3873D|A90F    |      ;

CODE_C3873F:
JSL.L CODE_C0814E                    ;C3873F|224E8180|80814E;
JSL.L CODE_C0814E                    ;C38743|224E8180|80814E;
STA.W $2100                          ;C38747|8D0021  |812100;
PHA                                  ;C3874A|48      |      ;
EOR.B #$0F                           ;C3874B|490F    |      ;
ASL A                                ;C3874D|0A      |      ;
ASL A                                ;C3874E|0A      |      ;
ASL A                                ;C3874F|0A      |      ;
ASL A                                ;C38750|0A      |      ;
ORA.B #$03                           ;C38751|0903    |      ;
STA.W $2106                          ;C38753|8D0621  |812106;
PLA                                  ;C38756|68      |      ;
DEC A                                ;C38757|3A      |      ;
BPL CODE_C3873F                      ;C38758|10E5    |C3873F;
RTS                                  ;C3875A|60      |      ;

CODE_C3875B:
LDA.W $03E5                          ;C3875B|ADE503  |8103E5;
BMI CODE_C387B0                      ;C3875E|3050    |C387B0;
BEQ CODE_C38777                      ;C38760|F015    |C38777;
DEC A                                ;C38762|3A      |      ;
BEQ UNREACH_C38786                   ;C38763|F021    |C38786;
DEC A                                ;C38765|3A      |      ;
BEQ CODE_C38777                      ;C38766|F00F    |C38777;
DEC A                                ;C38768|3A      |      ;
BEQ UNREACH_C38786                   ;C38769|F01B    |C38786;
DEC A                                ;C3876B|3A      |      ;
BEQ CODE_C38790                      ;C3876C|F022    |C38790;
db $3A,$F0,$15,$3A,$F0,$1C,$3A,$F0   ;C3876E|        |      ;
db $0F                               ;C38776|        |2200A9;

CODE_C38777:
LDA.B #$00                           ;C38777|A900    |      ;

CODE_C38779:
JSL.L CODE_C0814E                    ;C38779|224E8180|80814E;
STA.W $2100                          ;C3877D|8D0021  |812100;
INC A                                ;C38780|1A      |      ;
CMP.B #$10                           ;C38781|C910    |      ;
BCC CODE_C38779                      ;C38783|90F4    |C38779;
RTS                                  ;C38785|60      |      ;

UNREACH_C38786:
db $22,$4E,$81,$80,$A9,$0F,$8D,$00   ;C38786|        |80814E;
db $21,$60                           ;C3878E|        |000060;

CODE_C38790:
LDA.B #$00                           ;C38790|A900    |      ;

CODE_C38792:
JSL.L CODE_C0814E                    ;C38792|224E8180|80814E;
JSL.L CODE_C0814E                    ;C38796|224E8180|80814E;
STA.W $2100                          ;C3879A|8D0021  |812100;
PHA                                  ;C3879D|48      |      ;
EOR.B #$0F                           ;C3879E|490F    |      ;
ASL A                                ;C387A0|0A      |      ;
ASL A                                ;C387A1|0A      |      ;
ASL A                                ;C387A2|0A      |      ;
ASL A                                ;C387A3|0A      |      ;
ORA.B #$03                           ;C387A4|0903    |      ;
STA.W $2106                          ;C387A6|8D0621  |812106;
PLA                                  ;C387A9|68      |      ;
INC A                                ;C387AA|1A      |      ;
CMP.B #$10                           ;C387AB|C910    |      ;
BCC CODE_C38792                      ;C387AD|90E3    |C38792;
RTS                                  ;C387AF|60      |      ;

CODE_C387B0:
LDA.W $03E9                          ;C387B0|ADE903  |8103E9;
BPL CODE_C387C3                      ;C387B3|100E    |C387C3;
INC.W $046E                          ;C387B5|EE6E04  |81046E;
JSL.L ClearL3                    ;C387B8|22228683|838622;
LDA.B #$01                           ;C387BC|A901    |      ;
TSB.W $03BA                          ;C387BE|0CBA03  |8103BA;
BRA CODE_C387C8                      ;C387C1|8005    |C387C8;

CODE_C387C3:
LDA.B #$0F                           ;C387C3|A90F    |      ;
STA.W $2100                          ;C387C5|8D0021  |812100;

CODE_C387C8:
JSL.L CODE_C0814E                    ;C387C8|224E8180|80814E;
JSL.L CODE_C0814E                    ;C387CC|224E8180|80814E;
LDA.W $03E7                          ;C387D0|ADE703  |8103E7;
ASL A                                ;C387D3|0A      |      ;
ASL A                                ;C387D4|0A      |      ;
ASL A                                ;C387D5|0A      |      ;
ASL A                                ;C387D6|0A      |      ;
XBA                                  ;C387D7|EB      |      ;
LDA.W $03E5                          ;C387D8|ADE503  |8103E5;
ADC.W $03E5                          ;C387DB|6DE503  |8103E5;
XBA                                  ;C387DE|EB      |      ;
TAX                                  ;C387DF|AA      |      ;
REP #$20                             ;C387E0|C220    |      ;
LDA.W #$4000                         ;C387E2|A90040  |      ;
STA.W VMADDL                          ;C387E5|8D1621  |812116;
LDA.L UNREACH_898000,X               ;C387E8|BF008089|898000;
STA.W $2118                          ;C387EC|8D1821  |812118;
LDA.L UNREACH_898002,X               ;C387EF|BF028089|898002;
STA.W $2118                          ;C387F3|8D1821  |812118;
LDA.L UNREACH_898004,X               ;C387F6|BF048089|898004;
STA.W $2118                          ;C387FA|8D1821  |812118;
LDA.L UNREACH_898006,X               ;C387FD|BF068089|898006;
STA.W $2118                          ;C38801|8D1821  |812118;
LDA.L UNREACH_898008,X               ;C38804|BF088089|898008;
STA.W $2118                          ;C38808|8D1821  |812118;
LDA.L UNREACH_89800A,X               ;C3880B|BF0A8089|89800A;
STA.W $2118                          ;C3880F|8D1821  |812118;
LDA.L UNREACH_89800C,X               ;C38812|BF0C8089|89800C;
STA.W $2118                          ;C38816|8D1821  |812118;
LDA.L UNREACH_89800E,X               ;C38819|BF0E8089|89800E;
STA.W $2118                          ;C3881D|8D1821  |812118;
SEP #$20                             ;C38820|E220    |      ;
LDA.W $03E9                          ;C38822|ADE903  |8103E9;
BPL CODE_C38834                      ;C38825|100D    |C38834;
LDA.W $03E7                          ;C38827|ADE703  |8103E7;
CLC                                  ;C3882A|18      |      ;
ADC.W $03E9                          ;C3882B|6DE903  |8103E9;
STA.W $03E7                          ;C3882E|8DE703  |8103E7;
BPL CODE_C387C8                      ;C38831|1095    |C387C8;
RTS                                  ;C38833|60      |      ;

CODE_C38834:
LDA.W $03E7                          ;C38834|ADE703  |8103E7;
CLC                                  ;C38837|18      |      ;
ADC.W $03E9                          ;C38838|6DE903  |8103E9;
STA.W $03E7                          ;C3883B|8DE703  |8103E7;
CMP.B #$20                           ;C3883E|C920    |      ;
BEQ CODE_C38845                      ;C38840|F003    |C38845;
BRL CODE_C387C8                      ;C38842|8283FF  |C387C8;

CODE_C38845:
RTS                                  ;C38845|60      |      ;

init_game_variables:
LDX.W #$8000                         ;C38846|A20080  |      ;
STX.W $0352                          ;C38849|8E5203  |810352;
LDX.W #$C000                         ;C3884C|A200C0  |      ;
STX.W $0356                          ;C3884F|8E5603  |810356;
LDX.W #$6000                         ;C38852|A20060  |      ;
STX.W $0354                          ;C38855|8E5403  |810354;
LDX.W #$7000                         ;C38858|A20070  |      ;
STX.W $0358                          ;C3885B|8E5803  |810358;
LDX.W #$2000                         ;C3885E|A20020  |      ;
STX.W $035A                          ;C38861|8E5A03  |81035A;
LDX.W #$2800                         ;C38864|A20028  |      ;
STX.W $035E                          ;C38867|8E5E03  |81035E;
LDX.W #$3000                         ;C3886A|A20030  |      ;
STX.W $0362                          ;C3886D|8E6203  |810362;
LDX.W #$3102                         ;C38870|A20231  |      ;
STX.W $0364                          ;C38873|8E6403  |810364;
LDX.W #$3204                         ;C38876|A20432  |      ;
STX.W $0366                          ;C38879|8E6603  |810366;
LDX.W #$3306                         ;C3887C|A20633  |      ;
STX.W $0368                          ;C3887F|8E6803  |810368;
LDA.B #$7E                           ;C38882|A97E    |      ;
STA.B $34                            ;C38884|8534    |000034;
STA.B $37                            ;C38886|8537    |000037;
STA.W $002E                          ;C38888|8D2E00  |81002E;
LDA.B #$8B                           ;C3888B|A98B    |      ;
STA.W $1C5C                          ;C3888D|8D5C1C  |811C5C;
LDA.B #$54                           ;C38890|A954    |      ;
STA.W $1C5D                          ;C38892|8D5D1C  |811C5D;
LDA.B #$AB                           ;C38895|A9AB    |      ;
STA.W $1C60                          ;C38897|8D601C  |811C60;
LDA.B #$60                           ;C3889A|A960    |      ;
STA.W $1C61                          ;C3889C|8D611C  |811C61;
LDA.B #$02                           ;C3889F|A902    |      ;
STA.W $1B84                          ;C388A1|8D841B  |811B84;
LDX.W #$3000                         ;C388A4|A20030  |      ;
STX.W $1A02                          ;C388A7|8E021A  |811A02;
LDA.B #$7F                           ;C388AA|A97F    |      ;
STA.W $1A04                          ;C388AC|8D041A  |811A04;
REP #$20                             ;C388AF|C220    |      ;
LDA.W #$0080                         ;C388B1|A98000  |      ;
STA.W $1A7D                          ;C388B4|8D7D1A  |811A7D;
SEP #$20                             ;C388B7|E220    |      ;
LDA.B #$08                           ;C388B9|A908    |      ;
STA.W player_max_health                          ;C388BB|8D8A1B  |811B8A;
STA.W player_current_health                          ;C388BE|8D881B  |811B88;
LDA.B #$01                           ;C388C1|A901    |      ;
STA.W player_level                          ;C388C3|8D861B  |811B86;
STA.W player_level_ascii                          ;C388C6|8D6A1B  |811B6A;
LDX.W #$0000                         ;C388C9|A20000  |      ;
TXY                                  ;C388CC|9B      |      ;

CODE_C388CD:
LDA.W UNREACH_81BA0D,Y               ;C388CD|B90DBA  |81BA0D;
CMP.B #$FF                           ;C388D0|C9FF    |      ;
BEQ CODE_C388E8                      ;C388D2|F014    |C388E8;
LDA.W UNREACH_81BA20,Y               ;C388D4|B920BA  |81BA20;
STA.L $7F0203,X                      ;C388D7|9F03027F|7F0203;
REP #$20                             ;C388DB|C220    |      ;
INX                                  ;C388DD|E8      |      ;
TYA                                  ;C388DE|98      |      ;
CLC                                  ;C388DF|18      |      ;
ADC.W #$0020                         ;C388E0|692000  |      ;
TAY                                  ;C388E3|A8      |      ;
SEP #$20                             ;C388E4|E220    |      ;
BRA CODE_C388CD                      ;C388E6|80E5    |C388CD;

CODE_C388E8:
RTL                                  ;C388E8|6B      |      ;
LDX.W #$0000                         ;C388E9|A20000  |      ;
STX.W PlayerPosReal.x                          ;C388EC|8E7403  |810374;
STX.W PlayerPosReal.y                          ;C388EF|8E7603  |810376;
STX.W $0382                          ;C388F2|8E8203  |810382;
STX.W $0384                          ;C388F5|8E8403  |810384;
STX.W buttons_pressed                          ;C388F8|8E2203  |810322;
STX.W $03D6                          ;C388FB|8ED603  |8103D6;
STX.W $03D8                          ;C388FE|8ED803  |8103D8;
STX.W $03DA                          ;C38901|8EDA03  |8103DA;
STX.W $038A                          ;C38904|8E8A03  |81038A;
STX.W $038C                          ;C38907|8E8C03  |81038C;
STX.W button_mask                          ;C3890A|8E2603  |810326;
STX.W $043F                          ;C3890D|8E3F04  |81043F;
STX.W $043F                          ;C38910|8E3F04  |81043F;
STX.W $0464                          ;C38913|8E6404  |810464;
STX.W $0470                          ;C38916|8E7004  |810470;
STX.W $0474                          ;C38919|8E7404  |810474;
STX.W $039A                          ;C3891C|8E9A03  |81039A;
STX.W $0398                          ;C3891F|8E9803  |810398;
LDX.W #$06B6                         ;C38922|A2B606  |      ;
STX.W $03A0                          ;C38925|8EA003  |8103A0;
STX.W $03A2                          ;C38928|8EA203  |8103A2;
STX.W $039C                          ;C3892B|8E9C03  |81039C;
STZ.W $1A5E                          ;C3892E|9C5E1A  |811A5E;
STZ.W $0439                          ;C38931|9C3904  |810439;
STZ.W $0445                          ;C38934|9C4504  |810445;
STZ.W $210B                          ;C38937|9C0B21  |81210B;
STZ.W $03BA                          ;C3893A|9CBA03  |8103BA;
STZ.W $2123                          ;C3893D|9C2321  |812123;
STZ.W $03C5                          ;C38940|9CC503  |8103C5;
STZ.W $2124                          ;C38943|9C2421  |812124;
STZ.W $2125                          ;C38946|9C2521  |812125;
STZ.W $2106                          ;C38949|9C0621  |812106;
LDA.B #$E0                           ;C3894C|A9E0    |      ;
STA.W COLDATA                          ;C3894E|8D3221  |812132;
LDA.B #$00                           ;C38951|A900    |      ;
STA.L $7F0200                        ;C38953|8F00027F|7F0200;
STA.L $7F0201                        ;C38957|8F01027F|7F0201;
STA.L $7F0202                        ;C3895B|8F02027F|7F0202;
STA.L $7F0000                        ;C3895F|8F00007F|7F0000;
STA.L $7F0001                        ;C38963|8F01007F|7F0001;
JSL.L CODE_C2B3A6                    ;C38967|22A6B382|82B3A6;
LDA.W $0460                          ;C3896B|AD6004  |810460;
BEQ CODE_C3897B                      ;C3896E|F00B    |C3897B;
STZ.W $0460                          ;C38970|9C6004  |810460;
JSL.L CODE_C2A468                    ;C38973|2268A482|82A468;
JSL.L CODE_C2A4A1                    ;C38977|22A1A482|82A4A1;

CODE_C3897B:
JSL.L CODE_C38657                    ;C3897B|22578683|838657;
REP #$20                             ;C3897F|C220    |      ;
LDA.W current_map_number                          ;C38981|AD6A1C  |811C6A;
ASL A                                ;C38984|0A      |      ;
TAX                                  ;C38985|AA      |      ;
SEP #$20                             ;C38986|E220    |      ;
LDA.L UNREACH_82FB39,X               ;C38988|BF39FB82|82FB39;
STA.W $0343                          ;C3898C|8D4303  |810343;
LDA.L UNREACH_82FB3A,X               ;C3898F|BF3AFB82|82FB3A;
STA.W $0345                          ;C38993|8D4503  |810345;
JSL.L CODE_C092DB                    ;C38996|22DB9280|8092DB;
JSL.L CODE_C0930A                    ;C3899A|220A9380|80930A;
JSL.L CODE_C29395                    ;C3899E|22959382|829395;
JSL.L CODE_C292F5                    ;C389A2|22F59282|8292F5;
JSL.L CODE_C2957E                    ;C389A6|227E9582|82957E;
JSL.L CODE_C29445                    ;C389AA|22459482|829445;
JSL.L CODE_C294D0                    ;C389AE|22D09482|8294D0;
JSL.L CODE_C294E4                    ;C389B2|22E49482|8294E4;
JSL.L CODE_C295F1                    ;C389B6|22F19582|8295F1;
JSL.L ClearL3                    ;C389BA|22228683|838622;
JSL.L CODE_C3863A                    ;C389BE|223A8683|83863A;
JSL.L CODE_C085D2                    ;C389C2|22D28580|8085D2;
JSL.L CODE_C085D2                    ;C389C6|22D28580|8085D2;
JSL.L CODE_C38321                    ;C389CA|22218383|838321;
LDA.W current_map_number                          ;C389CE|AD6A1C  |811C6A;
CMP.B #$10                           ;C389D1|C910    |      ;
BEQ CODE_C389D9                      ;C389D3|F004    |C389D9;
JSL.L CODE_C2820E                    ;C389D5|220E8282|82820E;

CODE_C389D9:
LDA.B #$01                           ;C389D9|A901    |      ;
TSB.W $03BA                          ;C389DB|0CBA03  |8103BA;
STZ.W $031E                          ;C389DE|9C1E03  |81031E;
STZ.W $03B6                          ;C389E1|9CB603  |8103B6;
LDX.W $0312                          ;C389E4|AE1203  |810312;
STX.W $0302                          ;C389E7|8E0203  |810302;
LDX.W #$FFFF                         ;C389EA|A2FFFF  |      ;
STX.W $032A                          ;C389ED|8E2A03  |81032A;
STX.W $0312                          ;C389F0|8E1203  |810312;
LDA.B #$00                           ;C389F3|A900    |      ;
STA.W $2126                          ;C389F5|8D2621  |812126;
DEC A                                ;C389F8|3A      |      ;
STA.W $2127                          ;C389F9|8D2721  |812127;
JSL.L CODE_C38188                    ;C389FC|22888183|838188;
LDA.W $1A7D                          ;C38A00|AD7D1A  |811A7D;
BIT.B #$04                           ;C38A03|8904    |      ;
BNE CODE_C38A0C                      ;C38A05|D005    |C38A0C;
LDA.B #$1F                           ;C38A07|A91F    |      ;
STA.W display_hud_bitfield                          ;C38A09|8D3203  |810332;

CODE_C38A0C:
RTL                                  ;C38A0C|6B      |      ;

incsrc "a1/crabwalkguy.asm"
incsrc "a1/chiefswife.asm"
incsrc "a1/shopowner.asm"
incsrc "a1/chiefs_house_tulip.asm"
incsrc "a1/bridge_guard.asm"
incsrc "a1/mill_keeper.asm"
incsrc "a1/goat_with_fence.asm"
incsrc "a1/lisa.asm"
incsrc "a1/tulip_above_entrance.asm"
incsrc "a1/architect.asm"
incsrc "a1/son_shop_owner.asm"
incsrc "a1/tulip_before_painter_house.asm"
incsrc "a1/painter.asm"
incsrc "a1/watermillwheels.asm"
incsrc "a1/secret_shack_kid.asm"
incsrc "a1/sleeping_tulip.asm"
incsrc "a1/secret_cave_kid.asm"
incsrc "a1/walking_goat.asm"
incsrc "a1/gourmet_goat.asm"
incsrc "a1/old_man_with_goat.asm"
incsrc "a1/old_man_goat.asm"
incsrc "a1/snitch_tulip.asm"
incsrc "a1/chief.asm"
incsrc "a1/chief_chair.asm"
incsrc "a1/dreaming_tulip.asm"


COP #$14                             ;C3B1BE|0214    |      ;
db $10,$00,$C5,$B1,$6B               ;C3B1C0|        |C3B1C2;
COP #$07                             ;C3B1C5|0207    |      ;
db $02,$9F,$0F,$B2                   ;C3B1C7|        |      ;
COP #$17                             ;C3B1CB|0217    |      ;
db $5D,$B2                           ;C3B1CD|        |0002B2;
COP #$15                             ;C3B1CF|0215    |      ;
COP #$91                             ;C3B1D1|0291    |      ;
COP #$14                             ;C3B1D3|0214    |      ;
db $32,$00,$DA,$B1                   ;C3B1D5|        |000000;
RTL                                  ;C3B1D9|6B      |      ;
COP #$01                             ;C3B1DA|0201    |      ;
db $96,$B2                           ;C3B1DC|        |0000B2;
LDA.W #$2F80                         ;C3B1DE|A9802F  |      ;
TSB.W button_mask                          ;C3B1E1|0C2603  |810326;
COP #$81                             ;C3B1E4|0281    |      ;
db $21,$02                           ;C3B1E6|        |000002;
COP #$83                             ;C3B1E8|0283    |      ;
COP #$80                             ;C3B1EA|0280    |      ;
db $22                               ;C3B1EC|        |A98202;
COP #$82                             ;C3B1ED|0282    |      ;
LDA.W #$2F80                         ;C3B1EF|A9802F  |      ;
TRB.W button_mask                          ;C3B1F2|1C2603  |810326;
COP #$01                             ;C3B1F5|0201    |      ;
db $3B,$B3                           ;C3B1F7|        |      ;
COP #$17                             ;C3B1F9|0217    |      ;
db $62,$B2                           ;C3B1FB|        |C3B4B0;
COP #$91                             ;C3B1FD|0291    |      ;
COP #$0D                             ;C3B1FF|020D    |      ;
db $00,$12,$35,$07,$B2               ;C3B201|        |      ;
RTL                                  ;C3B206|6B      |      ;
COP #$80                             ;C3B207|0280    |      ;
db $1F                               ;C3B209|        |028202;
COP #$82                             ;C3B20A|0282    |      ;
COP #$91                             ;C3B20C|0291    |      ;
RTL                                  ;C3B20E|6B      |      ;
db $A9,$C0,$BF,$0C,$26,$03,$02,$9F   ;C3B20F|        |      ;
db $18,$00,$02,$03,$29,$02,$04,$02   ;C3B217|        |      ;
db $01,$9C,$B3,$A9,$C0,$BF,$1C,$26   ;C3B21F|        |00009C;
db $03,$02,$1A,$CF,$D0,$01,$2F,$B2   ;C3B227|        |000002;
db $A9,$C0,$BF,$0C,$26,$03,$02,$01   ;C3B22F|        |      ;
db $79,$B5,$02,$03,$B5,$02,$04,$02   ;C3B237|        |0002B5;
db $09,$01,$9F,$A9,$03,$00,$8D,$1E   ;C3B23F|        |      ;
db $03,$02,$3C,$04,$02,$10,$01,$01   ;C3B247|        |000002;
db $01,$B0,$03,$D8,$01,$A9,$C0,$BF   ;C3B24F|        |0000B0;
db $1C,$26,$03,$02,$91,$6B           ;C3B257|        |000326;
COP #$01                             ;C3B25D|0201    |      ;
db $84,$B2                           ;C3B25F|        |0000B2;
RTL                                  ;C3B261|6B      |      ;
COP #$01                             ;C3B262|0201    |      ;
db $81,$B3                           ;C3B264|        |0000B3;
COP #$09                             ;C3B266|0209    |      ;
db $04,$81                           ;C3B268|        |000081;
COP #$3C                             ;C3B26A|023C    |      ;
db $04                               ;C3B26C|        |000002;
COP #$10                             ;C3B26D|0210    |      ;
db $01,$01,$03,$B0,$03,$E0,$01       ;C3B26F|        |000001;
RTL                                  ;C3B276|6B      |      ;
db $10,$8F,$74,$72,$7B,$75,$6D,$65   ;C3B277|        |C3B208;
db $2E,$0D,$13,$F0,$C8,$10,$50,$61   ;C3B27F|        |00130D;
db $70,$61,$2C,$20,$77,$6F,$20,$B4   ;C3B287|        |C3B2EA;
db $44,$75,$3F,$21,$13,$F0,$C8,$10   ;C3B28F|        |      ;
db $45,$69,$6E,$65,$20,$74,$72,$61   ;C3B297|        |000069;
db $75,$72,$69,$67,$65,$20,$A0,$0D   ;C3B29F|        |000072;
db $65,$72,$6B,$6C,$69,$6E,$67,$74   ;C3B2A7|        |000072;
db $20,$EE,$69,$72,$67,$65,$6E,$64   ;C3B2AF|        |C369EE;
db $77,$6F,$2D,$0D,$68,$65,$72,$2E   ;C3B2B7|        |00006F;
db $11,$3C,$4C,$69,$73,$61,$2C,$20   ;C3B2BF|        |00003C;
db $64,$75,$20,$6D,$75,$25,$74,$20   ;C3B2C7|        |000075;
db $61,$6C,$6C,$65,$73,$20,$0D,$F9   ;C3B2CF|        |00006C;
db $64,$75,$20,$77,$65,$69,$25,$74   ;C3B2D7|        |000075;
db $20,$B6,$50,$65,$72,$2D,$0D,$73   ;C3B2DF|        |C350B6;
db $6F,$6E,$20,$76,$6F,$72,$20,$84   ;C3B2E7|        |76206E;
db $65,$72,$7A,$7B,$68,$6C,$65,$6E   ;C3B2EF|        |000072;
db $2E,$11,$9F,$F7,$61,$75,$25,$65   ;C3B2F7|        |009F11;
db $72,$64,$65,$6D,$20,$B0,$0D,$6D   ;C3B2FF|        |000064;
db $65,$69,$6E,$65,$6E,$20,$46,$61   ;C3B307|        |000069;
db $72,$62,$70,$69,$6E,$73,$65,$6C   ;C3B30F|        |000062;
db $20,$62,$65,$2D,$0D,$6E,$2A,$74   ;C3B317|        |C36562;
db $69,$67,$65,$6E,$2C,$20,$EC,$77   ;C3B31F|        |      ;
db $65,$69,$74,$65,$72,$20,$FD,$0D   ;C3B327|        |000069;
db $6B,$6F,$6D,$6D,$65,$6E,$2E,$3E   ;C3B32F|        |      ;
db $20,$13,$F0,$C8,$10,$50,$61,$70   ;C3B337|        |C3F013;
db $61,$21,$20,$42,$69,$73,$74,$20   ;C3B33F|        |000021;
db $64,$75,$20,$65,$73,$3F,$11,$57   ;C3B347|        |000075;
db $6F,$20,$B4,$64,$75,$20,$50,$61   ;C3B34F|        |64B420;
db $70,$61,$3F,$21,$20,$8F,$0D,$76   ;C3B357|        |C3B3BA;
db $65,$72,$6D,$69,$73,$73,$65,$20   ;C3B35F|        |000072;
db $85,$E9,$73,$65,$68,$72,$2E,$11   ;C3B367|        |0000E9;
db $0F,$8C,$6B,$61,$6D,$20,$D8,$41   ;C3B36F|        |616B8C;
db $6E,$74,$77,$6F,$72,$74,$2E,$13   ;C3B377|        |007774;
db $F0,$C8,$10,$57,$65,$72,$20,$B4   ;C3B37F|        |C3B349;
db $64,$75,$3F,$0D,$57,$61,$73,$20   ;C3B387|        |000075;
db $74,$75,$65,$20,$D1,$68,$69,$65   ;C3B38F|        |000075;
db $72,$3F,$13,$F0,$C8,$10,$0F,$02   ;C3B397|        |00003F;
db $02,$2C,$0D,$0E,$3C,$8F,$CC,$67   ;C3B39F|        |      ;
db $65,$64,$61,$63,$68,$74,$20,$D1   ;C3B3A7|        |000064;
db $0D,$77,$5B,$72,$64,$65,$20,$85   ;C3B3AF|        |005B77;
db $CE,$74,$72,$65,$66,$2D,$0D,$66   ;C3B3B7|        |007274;
db $65,$6E,$2E,$0D,$0E,$78,$8F,$B1   ;C3B3BF|        |00006E;
db $E9,$61,$6C,$6C,$65,$69,$6E,$2E   ;C3B3C7|        |      ;
db $0D,$0E,$1E,$8F,$77,$65,$69,$25   ;C3B3CF|        |001E0E;
db $2C,$20,$BA,$D1,$0D,$D9,$D5,$4C   ;C3B3D7|        |00BA20;
db $61,$75,$66,$65,$20,$B6,$5A,$65   ;C3B3DF|        |000075;
db $69,$74,$20,$0D,$DF,$6D,$65,$68   ;C3B3E7|        |      ;
db $72,$20,$E9,$65,$69,$6E,$73,$61   ;C3B3EF|        |000020;
db $6D,$20,$0D,$66,$5B,$68,$6C,$65   ;C3B3F7|        |000D20;
db $6E,$20,$77,$65,$72,$64,$65,$2E   ;C3B3FF|        |007720;
db $0D,$0E,$5A,$98,$56,$61,$74,$65   ;C3B407|        |005A0E;
db $72,$20,$CF,$DB,$0D,$D4,$65,$72   ;C3B40F|        |000020;
db $7A,$7B,$68,$6C,$74,$2C,$20,$BA   ;C3B417|        |      ;
db $B6,$0D,$A1,$FE,$47,$6C,$5B,$63   ;C3B41F|        |00000D;
db $6B,$20,$D3,$0D,$B6,$52,$75,$68   ;C3B427|        |      ;
db $65,$20,$FD,$66,$69,$6E,$64,$65   ;C3B42F|        |000020;
db $6E,$20,$D2,$0D,$0E,$5A,$EB,$DF   ;C3B437|        |00D220;
db $D3,$B6,$48,$61,$73,$74,$2E,$0D   ;C3B43F|        |0000B6;
db $8F,$77,$65,$69,$25,$20,$6E,$69   ;C3B447|        |696577;
db $63,$68,$74,$2C,$20,$6F,$62,$20   ;C3B44F|        |000068;
db $83,$0D,$BE,$4D,$65,$6E,$73,$63   ;C3B457|        |00000D;
db $68,$20,$6F,$64,$65,$72,$20,$BE   ;C3B45F|        |      ;
db $0D,$45,$6E,$67,$65,$6C,$20,$62   ;C3B467|        |006E45;
db $69,$73,$74,$2C,$20,$AB,$D1,$0D   ;C3B46F|        |      ;
db $0E,$5A,$6D,$75,$25,$20,$85,$EC   ;C3B477|        |006D5A;
db $C0,$47,$65,$2D,$0D,$66,$61,$6C   ;C3B47F|        |      ;
db $6C,$65,$6E,$20,$62,$69,$74,$74   ;C3B487|        |006E65;
db $65,$6E,$2E,$0D,$0E,$5A,$8F,$F2   ;C3B48F|        |00006E;
db $85,$DF,$0D,$66,$72,$61,$67,$65   ;C3B497|        |0000DF;
db $6E,$2C,$20,$6F,$62,$20,$83,$62   ;C3B49F|        |00202C;
db $65,$69,$20,$DB,$0D,$0E,$5A,$62   ;C3B4A7|        |000069;
db $6C,$65,$69,$62,$65,$6E,$20,$77   ;C3B4AF|        |006965;
db $69,$6C,$6C,$73,$74,$2C,$76,$65   ;C3B4B7|        |      ;
db $72,$2D,$0D,$73,$70,$72,$65,$63   ;C3B4BF|        |00002D;
db $68,$65,$20,$DB,$6E,$75,$72,$2C   ;C3B4C7|        |      ;
db $20,$BA,$0D,$83,$C5,$A6,$7A,$75   ;C3B4CF|        |C30DBA;
db $72,$5B,$63,$6B,$2D,$0D,$6B,$65   ;C3B4D7|        |00005B;
db $68,$72,$65,$6E,$20,$77,$69,$72   ;C3B4DF|        |      ;
db $73,$74,$2E,$0D,$0E,$5A,$83,$6B   ;C3B4E7|        |000074;
db $2A,$6E,$6E,$74,$65,$73,$74,$20   ;C3B4EF|        |      ;
db $DB,$D6,$0D,$C2,$76,$6F,$72,$6C   ;C3B4F7|        |      ;
db $5B,$67,$65,$6E,$2C,$20,$AB,$0D   ;C3B4FF|        |      ;
db $0E,$1E,$D1,$CC,$B9,$47,$65,$66   ;C3B507|        |00D11E;
db $5B,$68,$6C,$2C,$0D,$BA,$75,$6E   ;C3B50F|        |      ;
db $73,$65,$72,$20,$56,$65,$72,$73   ;C3B517|        |000065;
db $70,$72,$65,$63,$68,$65,$6E,$20   ;C3B51F|        |C3B593;
db $0D,$DB,$48,$6F,$66,$66,$6E,$75   ;C3B527|        |0048DB;
db $6E,$67,$20,$C9,$B5,$0D,$5A,$75   ;C3B52F|        |002067;
db $6B,$75,$6E,$66,$74,$20,$67,$69   ;C3B537|        |      ;
db $62,$74,$2E,$0D,$0E,$5A,$42,$69   ;C3B53F|        |C3E3B6;
db $74,$74,$65,$21,$0E,$28,$0D,$81   ;C3B547|        |000074;
db $76,$65,$72,$73,$70,$72,$69,$63   ;C3B54F|        |000065;
db $68,$60,$20,$6D,$69,$72,$2C,$0D   ;C3B557|        |      ;
db $BA,$83,$C5,$A6,$7A,$75,$2D,$0D   ;C3B55F|        |      ;
db $72,$5B,$63,$6B,$6B,$65,$68,$72   ;C3B567|        |00005B;
db $65,$6E,$20,$77,$69,$72,$73,$74   ;C3B56F|        |00006E;
db $2E,$0C,$0F,$44,$61,$6E,$6B,$65   ;C3B577|        |000F0C;
db $21,$0D,$0E,$5A,$8F,$77,$5B,$6E   ;C3B57F|        |00000D;
db $73,$63,$68,$74,$65,$2C,$BA,$0D   ;C3B587|        |000063;
db $BD,$A5,$6E,$69,$65,$20,$FD,$0D   ;C3B58F|        |006EA5;
db $45,$6E,$64,$65,$20,$67,$65,$68   ;C3B597|        |00006E;
db $65,$6E,$20,$77,$5B,$72,$64,$65   ;C3B59F|        |00006E;
db $2E,$0E,$78,$13,$F1,$C8           ;C3B5A7|        |00780E;
COP #$14                             ;C3B5AD|0214    |      ;
db $00,$00,$B4,$B5                   ;C3B5AF|        |      ;
RTL                                  ;C3B5B3|6B      |      ;
COP #$9F                             ;C3B5B4|029F    |      ;
db $08,$00                           ;C3B5B6|        |      ;
COP #$85                             ;C3B5B8|0285    |      ;
db $C9,$A9,$80                       ;C3B5BA|        |      ;
COP #$17                             ;C3B5BD|0217    |      ;
db $DD,$B5                           ;C3B5BF|        |0002B5;
COP #$15                             ;C3B5C1|0215    |      ;
COP #$2A                             ;C3B5C3|022A    |      ;
db $10,$00,$00,$00                   ;C3B5C5|        |C3B5C7;
COP #$05                             ;C3B5C9|0205    |      ;
db $04,$05                           ;C3B5CB|        |000005;
COP #$16                             ;C3B5CD|0216    |      ;
COP #$2B                             ;C3B5CF|022B    |      ;
db $10,$00,$00,$00                   ;C3B5D1|        |C3B5D3;
COP #$85                             ;C3B5D5|0285    |      ;
db $C9,$A9,$80                       ;C3B5D7|        |      ;
COP #$86                             ;C3B5DA|0286    |      ;
RTL                                  ;C3B5DC|6B      |      ;
COP #$01                             ;C3B5DD|0201    |      ;
db $FA,$B5                           ;C3B5DF|        |      ;
BRK #$5E                             ;C3B5E1|005E    |      ;
COP #$0A                             ;C3B5E3|020A    |      ;
db $11                               ;C3B5E5|        |000002;
COP #$01                             ;C3B5E6|0201    |      ;
db $4C,$B7                           ;C3B5E8|        |C3E2B7;
SEP #$20                             ;C3B5EA|E220    |      ;
LDA.B #$01                           ;C3B5EC|A901    |      ;
STA.W $1B82                          ;C3B5EE|8D821B  |811B82;
REP #$20                             ;C3B5F1|C220    |      ;
COP #$09                             ;C3B5F3|0209    |      ;
db $04,$85                           ;C3B5F5|        |000085;
BRK #$0E                             ;C3B5F7|000E    |      ;
RTL                                  ;C3B5F9|6B      |      ;
db $10,$8F,$CC,$66,$72,$5B,$68,$65   ;C3B5FA|        |C3B58B;
db $72,$20,$B0,$0D,$5B,$62,$65,$72   ;C3B602|        |000020;
db $20,$B7,$57,$6F,$6C,$6B,$65,$6E   ;C3B60A|        |C357B7;
db $20,$67,$65,$2D,$0D,$77,$6F,$68   ;C3B612|        |C36567;
db $6E,$74,$2C,$20,$67,$65,$6E,$61   ;C3B61A|        |002C74;
db $75,$20,$F6,$44,$75,$2E,$11,$4A   ;C3B622|        |000020;
db $65,$74,$7A,$74,$20,$6C,$65,$62   ;C3B62A|        |000074;
db $65,$20,$D1,$AC,$B6,$0D,$45,$72   ;C3B632|        |000020;
db $64,$65,$20,$EB,$77,$65,$69,$74   ;C3B63A|        |000065;
db $20,$77,$65,$67,$20,$F1,$0D,$4D   ;C3B642|        |C36577;
db $65,$69,$73,$74,$65,$72,$2E,$11   ;C3B64A|        |000069;
db $41,$6C,$6C,$65,$20,$4B,$72,$65   ;C3B652|        |00006C;
db $61,$74,$75,$72,$65,$6E,$2C,$20   ;C3B65A|        |000074;
db $B5,$0D,$86,$67,$65,$66,$61,$6E   ;C3B662|        |00000D;
db $67,$65,$6E,$20,$68,$61,$74,$2C   ;C3B66A|        |000065;
db $20,$0D,$E7,$D3,$4D,$6F,$6E,$73   ;C3B672|        |C3E70D;
db $74,$65,$72,$68,$2A,$68,$6C,$65   ;C3B67A|        |000065;
db $6E,$20,$0D,$66,$65,$73,$74,$67   ;C3B682|        |000D20;
db $65,$68,$61,$6C,$74,$65,$6E,$2E   ;C3B68A|        |000068;
db $11,$53,$6F,$20,$F6,$83,$D9,$62   ;C3B692|        |000053;
db $65,$66,$72,$65,$69,$74,$20,$0D   ;C3B69A|        |000066;
db $68,$61,$73,$74,$2C,$20,$6D,$75   ;C3B6A2|        |      ;
db $25,$74,$20,$83,$B0,$61,$6C,$6C   ;C3B6AA|        |000074;
db $20,$0D,$B5,$61,$6E,$64,$65,$72   ;C3B6B2|        |C3B50D;
db $65,$6E,$20,$62,$65,$66,$72,$65   ;C3B6BA|        |00006E;
db $69,$65,$6E,$2E,$11,$53,$6F,$67   ;C3B6C2|        |      ;
db $61,$72,$20,$B5,$42,$65,$66,$72   ;C3B6CA|        |000072;
db $65,$69,$75,$6E,$67,$20,$0D,$C5   ;C3B6D2|        |000069;
db $6B,$6C,$65,$69,$6E,$65,$6E,$20   ;C3B6DA|        |      ;
db $42,$61,$75,$6D,$65,$73,$20,$0D   ;C3B6E2|        |      ;
db $6F,$64,$65,$72,$20,$4B,$72,$65   ;C3B6EA|        |726564;
db $61,$74,$75,$72,$20,$D7,$84,$0D   ;C3B6F2|        |000074;
db $62,$65,$69,$20,$44,$65,$69,$6E   ;C3B6FA|        |C32062;
db $65,$72,$20,$41,$75,$66,$67,$61   ;C3B702|        |000072;
db $62,$65,$20,$11,$62,$65,$68,$69   ;C3B70A|        |C3D772;
db $6C,$66,$6C,$69,$63,$68,$20,$73   ;C3B712|        |006C66;
db $65,$69,$6E,$2E,$0D,$48,$69,$65   ;C3B71A|        |000069;
db $72,$2C,$20,$6E,$69,$6D,$6D,$20   ;C3B722|        |00002C;
db $64,$69,$65,$73,$2E,$11,$02,$02   ;C3B72A|        |000069;
db $20,$C1,$0D,$03,$24,$B5,$9A,$B8   ;C3B732|        |C30DC1;
db $46,$6C,$61,$6D,$6D,$65,$6E,$20   ;C3B73A|        |00006C;
db $0D,$42,$61,$6C,$6C,$03,$20,$2E   ;C3B742|        |006142;
db $11,$0C,$10,$4A,$65,$74,$7A,$74   ;C3B74A|        |00000C;
db $20,$F2,$D1,$85,$0D,$62,$65,$67   ;C3B752|        |C3D1F2;
db $6C,$65,$69,$74,$65,$6E,$2E,$20   ;C3B75A|        |006965;
db $8F,$B1,$BE,$0D,$4D,$61,$67,$69   ;C3B762|        |0DBEB1;
db $65,$72,$2C,$61,$6C,$73,$6F,$20   ;C3B76A|        |000072;
db $D7,$D1,$0D,$AE,$41,$72,$74,$65   ;C3B772|        |0000D1;
db $6E,$20,$EE,$9A,$11,$76,$65,$72   ;C3B77A|        |00EE20;
db $77,$65,$6E,$64,$65,$6E,$2E,$20   ;C3B782|        |000065;
db $8F,$F2,$0D,$DC,$46,$7B,$68,$69   ;C3B78A|        |DC0DF2;
db $67,$6B,$65,$69,$74,$65,$6E,$20   ;C3B792|        |00006B;
db $62,$65,$2D,$0D,$6E,$75,$74,$7A   ;C3B79A|        |C3E502;
db $65,$6E,$2C,$20,$EC,$84,$FD,$0D   ;C3B7A2|        |00006E;
db $68,$65,$6C,$66,$65,$6E,$2E,$11   ;C3B7AA|        |      ;
db $41,$63,$68,$74,$65,$20,$AB,$D4   ;C3B7B2|        |000063;
db $64,$61,$2D,$0D,$72,$61,$75,$66   ;C3B7BA|        |000061;
db $2C,$20,$BA,$D1,$67,$65,$6E,$5B   ;C3B7C2|        |00BA20;
db $67,$65,$6E,$64,$20,$0D,$4A,$55   ;C3B7CA|        |000065;
db $57,$45,$4C,$45,$4E,$20,$68,$61   ;C3B7D2|        |000045;
db $62,$65,$2C,$20,$EC,$DC,$0D,$9A   ;C3B7DA|        |C3E442;
db $FD,$62,$65,$6E,$75,$74,$7A,$65   ;C3B7E2|        |006562;
db $6E,$2E,$11,$41,$6C,$73,$20,$83   ;C3B7EA|        |00112E;
db $D9,$62,$65,$66,$72,$65,$69,$74   ;C3B7F2|        |006562;
db $20,$0D,$68,$61,$73,$74,$2C,$20   ;C3B7FA|        |C3680D;
db $68,$69,$6E,$74,$65,$72,$6C,$69   ;C3B802|        |      ;
db $65,$25,$65,$6E,$20,$0D,$B5,$95   ;C3B80A|        |000025;
db $BE,$E4,$0D,$67,$6F,$6C,$64,$65   ;C3B812|        |000DE4;
db $6E,$65,$20,$53,$74,$65,$69,$6E   ;C3B81A|        |002065;
db $65,$2E,$11,$53,$6F,$20,$73,$65   ;C3B822|        |00002E;
db $68,$65,$6E,$20,$4A,$55,$57,$45   ;C3B82A|        |      ;
db $4C,$45,$4E,$20,$61,$75,$73,$2E   ;C3B832|        |C34E45;
db $0D,$4C,$61,$25,$20,$ED,$FF,$B5   ;C3B83A|        |00614C;
db $0D,$A9,$77,$69,$65,$64,$65,$72   ;C3B842|        |0077A9;
db $62,$65,$6C,$65,$62,$65,$6E,$21   ;C3B84A|        |C324B2;
db $11,$AA,$6D,$5B,$73,$73,$65,$6E   ;C3B852|        |0000AA;
db $20,$FE,$54,$65,$6D,$70,$65,$6C   ;C3B85A|        |C354FE;
db $20,$0D,$D3,$47,$72,$61,$73,$73   ;C3B862|        |C3D30D;
db $20,$56,$61,$6C,$6C,$65,$79,$20   ;C3B86A|        |C36156;
db $67,$65,$68,$65,$6E,$2E,$13,$F0   ;C3B872|        |000065;
db $C8                               ;C3B87A|        |      ;
COP #$07                             ;C3B87B|0207    |      ;
db $05,$89,$88,$B8,$02,$B0,$A1,$B8   ;C3B87D|        |000089;
db $83,$00,$20                       ;C3B885|        |000000;
COP #$15                             ;C3B888|0215    |      ;
COP #$14                             ;C3B88A|0214    |      ;
db $09,$00,$96,$B8                   ;C3B88C|        |      ;
COP #$17                             ;C3B890|0217    |      ;
db $B5,$B8                           ;C3B892|        |0000B8;
BRA CODE_C3B89A                      ;C3B894|8004    |C3B89A;
COP #$17                             ;C3B896|0217    |      ;
db $BA,$B8                           ;C3B898|        |      ;

CODE_C3B89A:
COP #$80                             ;C3B89A|0280    |      ;
db $1E                               ;C3B89C|        |008202;
COP #$82                             ;C3B89D|0282    |      ;
BRA CODE_C3B89A                      ;C3B89F|80F9    |C3B89A;
db $02,$91,$02,$0C,$00,$02,$AA,$B8   ;C3B8A1|        |      ;
db $6B,$02,$01,$21,$B9,$02,$09,$05   ;C3B8A9|        |      ;
db $89,$02,$86,$6B                   ;C3B8B1|        |      ;
COP #$01                             ;C3B8B5|0201    |      ;
db $BF,$B8                           ;C3B8B7|        |026BB8;
RTL                                  ;C3B8B9|6B      |      ;
db $02,$01,$3D,$B9,$6B,$10,$49,$6D   ;C3B8BA|        |      ;
db $20,$75,$6E,$74,$65,$72,$69,$72   ;C3B8C2|        |C36E75;
db $64,$69,$73,$63,$68,$65,$6E,$20   ;C3B8CA|        |000069;
db $0D,$9E,$E7,$EF,$0D,$4B,$72,$65   ;C3B8D2|        |00E79E;
db $61,$74,$75,$72,$65,$6E,$20,$67   ;C3B8DA|        |000074;
db $65,$66,$61,$6E,$67,$65,$6E,$2D   ;C3B8E2|        |000066;
db $0D,$67,$65,$68,$61,$6C,$74,$65   ;C3B8EA|        |006567;
db $6E,$2E,$11,$A8,$83,$BC,$57,$65   ;C3B8F2|        |00112E;
db $73,$65,$6E,$20,$0D,$62,$65,$66   ;C3B8FA|        |000065;
db $72,$65,$69,$73,$74,$2C,$20,$F5   ;C3B902|        |000065;
db $9F,$0D,$B5,$53,$74,$61,$64,$74   ;C3B90A|        |53B50D;
db $20,$F4,$0D,$61,$75,$66,$62,$61   ;C3B912|        |C30DF4;
db $75,$65,$6E,$2E,$13,$F0,$C8,$10   ;C3B91A|        |000065;
db $02,$02,$20,$68,$2A,$72,$74,$20   ;C3B922|        |      ;
db $BF,$0D,$6C,$65,$69,$73,$65,$20   ;C3B92A|        |656C0D;
db $53,$74,$69,$6D,$6D,$65,$2E,$11   ;C3B932|        |000074;
db $13,$C0,$B8,$10,$44,$61,$6E,$6B   ;C3B93A|        |0000C0;
db $65,$2C,$20,$BA,$83,$B5,$0D,$44   ;C3B942|        |00002C;
db $6F,$72,$66,$62,$65,$77,$6F,$68   ;C3B94A|        |626672;
db $6E,$65,$72,$20,$67,$65,$72,$65   ;C3B952|        |007265;
db $74,$74,$65,$74,$20,$0D,$68,$61   ;C3B95A|        |000074;
db $73,$74,$2E,$11,$9F,$F5,$E5,$6E   ;C3B962|        |000074;
db $75,$6E,$20,$0D,$EC,$D9,$6B,$5B   ;C3B96A|        |00006E;
db $6D,$6D,$65,$72,$6E,$2E,$11,$4E   ;C3B972|        |00656D;
db $69,$65,$6D,$61,$6E,$64,$20,$6C   ;C3B97A|        |      ;
db $65,$62,$74,$20,$67,$65,$72,$6E   ;C3B982|        |000062;
db $20,$0D,$61,$6C,$6C,$65,$69,$6E   ;C3B98A|        |C3610D;
db $2E,$20,$AA,$6D,$5B,$73,$73,$65   ;C3B992|        |00AA20;
db $6E,$20,$ED,$0D,$67,$65,$67,$65   ;C3B99A|        |00ED20;
db $6E,$73,$65,$69,$74,$69,$67,$20   ;C3B9A2|        |006573;
db $68,$65,$6C,$66,$65,$6E,$2E,$13   ;C3B9AA|        |      ;
db $F0,$C8                           ;C3B9B2|        |C3B97C;
COP #$14                             ;C3B9B4|0214    |      ;
db $2C,$00,$BB,$B9                   ;C3B9B6|        |00BB00;
RTL                                  ;C3B9BA|6B      |      ;
db $22,$40,$C0,$83,$02,$17,$CF,$B9   ;C3B9BB|        |83C040;
db $E2,$20,$A9,$83,$48,$C2,$20,$A9   ;C3B9C3|        |      ;
db $5A,$C0,$48,$6B,$02,$07,$00,$9C   ;C3B9CB|        |      ;
db $E3,$B9,$02,$01,$E8,$B9,$00,$5E   ;C3B9D3|        |0000B9;
db $02,$0A,$07,$02,$09,$00,$9C,$6B   ;C3B9DB|        |      ;
db $02,$01,$47,$BA,$6B,$10,$8F,$B3   ;C3B9E3|        |      ;
db $BC,$0D,$57,$65,$6C,$74,$2E,$20   ;C3B9EB|        |00570D;
db $81,$6E,$69,$6D,$6D,$60,$0D,$64   ;C3B9F3|        |00006E;
db $69,$65,$73,$65,$73,$20,$53,$63   ;C3B9FB|        |      ;
db $68,$77,$65,$72,$74,$2E,$11,$02   ;C3BA03|        |      ;
db $02,$20,$C1,$0D,$03,$24,$B9,$48   ;C3BA0B|        |      ;
db $65,$69,$6C,$20,$53,$63,$68,$77   ;C3BA13|        |000069;
db $65,$72,$74,$03,$20,$2E,$13,$F0   ;C3BA1B|        |000072;
db $C8

Text_Jewel_Give_Exp:
; @DEFAULT_TEXTBOX@
; "Ich bewache diese "
; "Welt."
; "Bitte nimm` dies." WFE
db $10
db $8F,$B3,$BC,$0D
db $57,$65,$6C,$74,$2E,$0D
db $81,$6E,$69,$6D,$6D,$60,$20,$64,$69,$65,$73,$2E,$11
; @END@

Text_Player_Gets_Exp:
; @NEW_TEXT@
; PLAYER_NAME " erhielt EXP!" -> Default_Text_End
db $02,$02,$20,$C1,$45,$58,$50,$21,$13 : dw Default_Text_End
; @END@

Text_Wish_Luck:
; @DEFAULT_TEXTBOX@
; "Sehr gut. Mach`"
; "weiter so. Viel Glück!" -> Default_Text_End
db $10
db $53,$65,$68,$72,$20,$67,$75,$74,$2E,$20,$4D,$61,$63,$68,$60,$0D
db $77,$65,$69,$74,$65,$72,$20,$73,$6F,$2E,$20,$56,$69,$65,$6C,$20,$47,$6C,$5B,$63,$6B,$21,$13 : dw Default_Text_End
; @END@

incsrc "a1/highground_jewel.asm"

Jewel_Return_to_GrassValley:
    %CopShowText(Text_Return_To_GrassValley)
    %CopShowMenu(choice_stay_go_back, 2, .abort)
    LDA.L choice_idx
    BEQ .abort
    %CopShowText(Text_Ok_Continue)
    INC.W $0439
    %CopTeleportPlayerToMap($101, !Facing_Down, $138, $3A0)
    RTL

.abort:
    %CopShowText(Text_Come_Back)
    RTL


CODE_C3BBB6:
db $22,$40,$C0   ;C3BBB1|        |      ;
db $83,$02,$17,$CA,$BB,$E2,$20,$A9   ;C3BBB9|        |000002;
db $83,$48,$C2,$20,$A9,$5A,$C0,$48   ;C3BBC1|        |000048;
db $6B,$02,$01,$D1,$BB,$82,$BE,$FF   ;C3BBC9|        |      ;
db $10,$56,$65,$72,$77,$65,$6E,$64   ;C3BBD1|        |C3BC29;
db $65,$20,$68,$69,$65,$72,$7A,$75   ;C3BBD9|        |000020;
db $20,$B7,$0D,$42,$65,$66,$65,$68   ;C3BBE1|        |C30DB7;
db $6C,$3A,$20,$42,$45,$4E,$55,$54   ;C3BBE9|        |00203A;
db $5A,$45,$2E,$0D,$87,$4D,$6F,$6E   ;C3BBF1|        |      ;
db $73,$74,$65,$72,$2C,$20,$FB,$D3   ;C3BBF9|        |000074;
db $0D,$44,$72,$2E,$4C,$65,$6F,$60   ;C3BC01|        |007244;
db $73,$20,$47,$65,$6D,$7B,$6C,$64   ;C3BC09|        |000020;
db $65,$20,$69,$68,$72,$20,$11,$55   ;C3BC11|        |000020;
db $6E,$77,$65,$73,$65,$6E,$20,$74   ;C3BC19|        |006577;
db $72,$65,$69,$62,$65,$6E,$2C,$6B   ;C3BC21|        |000065;
db $2A,$6E,$6E,$65,$6E,$20,$0D,$DF   ;C3BC29|        |      ;
db $DA,$C7,$6E,$6F,$72,$2D,$0D,$6D   ;C3BC31|        |      ;
db $61,$6C,$65,$6E,$20,$A3,$67,$65   ;C3BC39|        |00006C;
db $74,$2A,$74,$65,$74,$20,$0D,$77   ;C3BC41|        |00002A;
db $65,$72,$64,$65,$6E,$2E,$11,$48   ;C3BC49|        |000072;
db $69,$65,$72,$7A,$75,$20,$6D,$75   ;C3BC51|        |      ;
db $25,$74,$20,$83,$7A,$75,$65,$72   ;C3BC59|        |000074;
db $73,$74,$20,$0D,$BE,$A3,$66,$69   ;C3BC61|        |000074;
db $6E,$64,$65,$6E,$2C,$DA,$0D,$BB   ;C3BC69|        |006564;
db $83,$4D,$65,$74,$61,$6C,$6C,$20   ;C3BC71|        |00004D;
db $7A,$65,$72,$73,$74,$2A,$72,$65   ;C3BC79|        |      ;
db $6E,$20,$0D,$6B,$61,$6E,$6E,$73   ;C3BC81|        |000D20;
db $74,$2E,$11,$4B,$65,$68,$72,$65   ;C3BC89|        |00002E;
db $20,$68,$69,$65,$72,$68,$65,$72   ;C3BC91|        |C36968;
db $20,$7A,$75,$72,$5B,$63,$6B,$2C   ;C3BC99|        |C3757A;
db $0D,$F3,$83,$B9,$A3,$0D,$67,$65   ;C3BCA1|        |0083F3;
db $66,$75,$6E,$64,$65,$6E,$20,$68   ;C3BCA9|        |000075;
db $61,$73,$74,$2E,$11,$0C           ;C3BCB1|        |000073;
JSL.L CODE_C3C040                    ;C3BCB7|2240C083|83C040;
COP #$17                             ;C3BCBB|0217    |      ;
db $CB,$BC                           ;C3BCBD|        |      ;
SEP #$20                             ;C3BCBF|E220    |      ;
LDA.B #$83                           ;C3BCC1|A983    |      ;
PHA                                  ;C3BCC3|48      |      ;
REP #$20                             ;C3BCC4|C220    |      ;
LDA.W #$C05A                         ;C3BCC6|A95AC0  |      ;
PHA                                  ;C3BCC9|48      |      ;
RTL                                  ;C3BCCA|6B      |      ;
COP #$01                             ;C3BCCB|0201    |      ;
db $D2,$BC                           ;C3BCCD|        |0000BC;
BRL Jewel_Return_to_GrassValley                      ;C3BCCF|82BDFE  |C3BB8F;
db $10,$83,$62,$65,$66,$69,$6E,$64   ;C3BCD2|        |C3BC57;
db $65,$73,$74,$20,$85,$D5,$0D,$5A   ;C3BCDA|        |000073;
db $65,$6E,$74,$72,$75,$6D,$20,$B8   ;C3BCE2|        |00006E;
db $75,$6E,$74,$65,$72,$69,$72,$2D   ;C3BCEA|        |00006E;
db $0D,$64,$69,$73,$63,$68,$65,$6E   ;C3BCF2|        |006964;
db $20,$53,$63,$68,$6C,$6F,$73,$73   ;C3BCFA|        |C36353;
db $65,$73,$2E,$11,$83,$FA,$AC,$65   ;C3BD02|        |000073;
db $69,$6E,$69,$67,$65,$20,$0D,$95   ;C3BD0A|        |      ;
db $74,$72,$65,$66,$66,$65,$6E,$2C   ;C3BD12|        |000072;
db $FB,$0D,$DF,$DA,$64,$69,$65,$73   ;C3BD1A|        |      ;
db $65,$6D,$20,$0D,$A3,$76,$65,$72   ;C3BD22|        |00006D;
db $6E,$69,$63,$68,$74,$65,$74,$20   ;C3BD2A|        |006369;
db $11,$F5,$6B,$2A,$6E,$6E,$65,$6E   ;C3BD32|        |0000F5;
db $2E,$83,$FA,$0D,$BC,$95,$6A,$65   ;C3BD3A|        |00FA83;
db $64,$6F,$63,$68,$20,$0D,$DA,$BB   ;C3BD42|        |00006F;
db $72,$69,$63,$68,$74,$69,$67,$65   ;C3BD4A|        |000069;
db $6E,$20,$0D,$A3,$62,$65,$73,$65   ;C3BD52|        |000D20;
db $69,$74,$69,$67,$65,$6E,$20,$11   ;C3BD5A|        |      ;
db $6B,$2A,$6E,$6E,$65,$6E,$2E,$11   ;C3BD62|        |      ;
db $0C                               ;C3BD6A|        |00A002;
COP #$A0                             ;C3BD6B|02A0    |      ;
db $02,$00                           ;C3BD6D|        |      ;
COP #$91                             ;C3BD6F|0291    |      ;
COP #$07                             ;C3BD71|0207    |      ;
db $04,$84,$7F,$BD                   ;C3BD73|        |000084;
COP #$0D                             ;C3BD77|020D    |      ;
db $00,$47,$38,$CC,$BD               ;C3BD79|        |      ;
RTL                                  ;C3BD7E|6B      |      ;
LDY.W $039E                          ;C3BD7F|AC9E03  |81039E;
LDA.W $0000,Y                        ;C3BD82|B90000  |810000;
CMP.W #$04B0                         ;C3BD85|C9B004  |      ;
BCC CODE_C3BD92                      ;C3BD88|9008    |C3BD92;
COP #$A0                             ;C3BD8A|02A0    |      ;
db $B0,$FF                           ;C3BD8C|        |C3BD8D;
COP #$27                             ;C3BD8E|0227    |      ;
db $AF,$BD                           ;C3BD90|        |9102BD;

CODE_C3BD92:
COP #$91                             ;C3BD92|0291    |      ;
COP #$0D                             ;C3BD94|020D    |      ;
db $00,$47,$38,$9C,$BD               ;C3BD96|        |      ;
RTL                                  ;C3BD9B|6B      |      ;
LDA.W buttons_pressed                          ;C3BD9C|AD2203  |810322;
AND.W #$0800                         ;C3BD9F|290008  |      ;
BNE CODE_C3BDA5                      ;C3BDA2|D001    |C3BDA5;
db $6B                               ;C3BDA4|        |      ;

CODE_C3BDA5:
COP #$81                             ;C3BDA5|0281    |      ;
db $2A,$14                           ;C3BDA7|        |      ;
COP #$83                             ;C3BDA9|0283    |      ;
COP #$27                             ;C3BDAB|0227    |      ;
db $AF,$BD                           ;C3BDAD|        |9102BD;
COP #$91                             ;C3BDAF|0291    |      ;
COP #$0D                             ;C3BDB1|020D    |      ;
db $00,$47,$33,$B9,$BD               ;C3BDB3|        |      ;
RTL                                  ;C3BDB8|6B      |      ;
LDA.W buttons_pressed                          ;C3BDB9|AD2203  |810322;
AND.W #$0400                         ;C3BDBC|290004  |      ;
BNE CODE_C3BDC2                      ;C3BDBF|D001    |C3BDC2;
db $6B                               ;C3BDC1|        |      ;

CODE_C3BDC2:
COP #$81                             ;C3BDC2|0281    |      ;
db $2C,$14                           ;C3BDC4|        |000214;
COP #$83                             ;C3BDC6|0283    |      ;
COP #$27                             ;C3BDC8|0227    |      ;
db $92,$BD,$02,$01,$DC,$BD,$02,$91   ;C3BDCA|        |0000BD;
db $02,$0D,$00,$47,$38,$DB,$BD,$80   ;C3BDD2|        |      ;
db $94,$6B,$10,$8F,$B1,$BE,$46,$61   ;C3BDDA|        |00006B;
db $68,$72,$73,$74,$75,$68,$6C,$2C   ;C3BDE2|        |      ;
db $0D,$77,$65,$6C,$63,$68,$65,$72   ;C3BDEA|        |006577;
db $20,$EE,$44,$72,$2E,$93,$0D,$65   ;C3BDF2|        |C344EE;
db $72,$66,$75,$6E,$64,$65,$6E,$20   ;C3BDFA|        |000066;
db $77,$75,$72,$64,$65,$2E,$11,$55   ;C3BE02|        |000075;
db $6D,$20,$D9,$62,$65,$77,$65,$67   ;C3BE0A|        |00D920;
db $65,$6E,$20,$FD,$0D,$6B,$2A,$6E   ;C3BE12|        |00006E;
db $6E,$65,$6E,$2C,$20,$6D,$75,$25   ;C3BE1A|        |006E65;
db $20,$B5,$0D,$57,$61,$73,$73,$65   ;C3BE22|        |C30DB5;
db $72,$6D,$5B,$68,$6C,$65,$20,$6C   ;C3BE2A|        |00006D;
db $61,$75,$66,$65,$6E,$2E,$13,$F0   ;C3BE32|        |000075;
db $C8                               ;C3BE3A|        |      ;
COP #$A4                             ;C3BE3B|02A4    |      ;
COP #$05                             ;C3BE3D|0205    |      ;
db $04,$04                           ;C3BE3F|        |000004;
LDY.W $039E                          ;C3BE41|AC9E03  |81039E;
LDA.W $0000,Y                        ;C3BE44|B90000  |810000;
CMP.W #$04B0                         ;C3BE47|C9B004  |      ;
BCC CODE_C3BE54                      ;C3BE4A|9008    |C3BE54;
COP #$A0                             ;C3BE4C|02A0    |      ;
db $B0,$FF                           ;C3BE4E|        |C3BE4F;
COP #$27                             ;C3BE50|0227    |      ;
db $76,$BE                           ;C3BE52|        |0000BE;

CODE_C3BE54:
COP #$91                             ;C3BE54|0291    |      ;
COP #$0D                             ;C3BE56|020D    |      ;
db $00,$47,$38,$5E,$BE               ;C3BE58|        |      ;
RTL                                  ;C3BE5D|6B      |      ;
LDA.W buttons_pressed                          ;C3BE5E|AD2203  |810322;
AND.W #$0800                         ;C3BE61|290008  |      ;
BNE CODE_C3BE67                      ;C3BE64|D001    |C3BE67;
db $6B                               ;C3BE66|        |      ;

CODE_C3BE67:
COP #$85                             ;C3BE67|0285    |      ;
db $98,$BE,$83                       ;C3BE69|        |      ;
COP #$81                             ;C3BE6C|0281    |      ;
db $2B,$14                           ;C3BE6E|        |      ;
COP #$83                             ;C3BE70|0283    |      ;
COP #$27                             ;C3BE72|0227    |      ;
db $76,$BE                           ;C3BE74|        |0000BE;
COP #$91                             ;C3BE76|0291    |      ;
COP #$0D                             ;C3BE78|020D    |      ;
db $00,$47,$33,$80,$BE               ;C3BE7A|        |      ;
RTL                                  ;C3BE7F|6B      |      ;
LDA.W buttons_pressed                          ;C3BE80|AD2203  |810322;
AND.W #$0400                         ;C3BE83|290004  |      ;
BNE CODE_C3BE89                      ;C3BE86|D001    |C3BE89;
db $6B                               ;C3BE88|        |      ;

CODE_C3BE89:
COP #$85                             ;C3BE89|0285    |      ;
db $98,$BE,$83                       ;C3BE8B|        |      ;
COP #$81                             ;C3BE8E|0281    |      ;
db $2D,$14                           ;C3BE90|        |000214;
COP #$83                             ;C3BE92|0283    |      ;
COP #$27                             ;C3BE94|0227    |      ;
db $54,$BE                           ;C3BE96|        |      ;
LDA.W #$2F80                         ;C3BE98|A9802F  |      ;
TSB.W button_mask                          ;C3BE9B|0C2603  |810326;
COP #$03                             ;C3BE9E|0203    |      ;
db $51                               ;C3BEA0|        |0000BC;
LDY.W $003C,X                        ;C3BEA1|BC3C00  |81003C;
LDA.W $0002,Y                        ;C3BEA4|B90200  |810002;
LDY.W $039E                          ;C3BEA7|AC9E03  |81039E;
STA.W $0002,Y                        ;C3BEAA|990200  |810002;
LDY.W $03A0                          ;C3BEAD|ACA003  |8103A0;
STA.W $0002,Y                        ;C3BEB0|990200  |810002;
PHX                                  ;C3BEB3|DA      |      ;
LDX.W $039E                          ;C3BEB4|AE9E03  |81039E;
LDA.W $001E,X                        ;C3BEB7|BD1E00  |81001E;
ASL A                                ;C3BEBA|0A      |      ;
TAX                                  ;C3BEBB|AA      |      ;
LDA.W UNREACH_81FAD7,X               ;C3BEBC|BDD7FA  |81FAD7;
CLC                                  ;C3BEBF|18      |      ;
ADC.W $0002,Y                        ;C3BEC0|790200  |810002;
STA.W $0002,Y                        ;C3BEC3|990200  |810002;
PLX                                  ;C3BEC6|FA      |      ;
LDA.W $0312                          ;C3BEC7|AD1203  |810312;
AND.W #$0003                         ;C3BECA|290300  |      ;
BNE CODE_C3BED1                      ;C3BECD|D002    |C3BED1;
BRK #$63                             ;C3BECF|0063    |      ;

CODE_C3BED1:
COP #$04                             ;C3BED1|0204    |      ;
LDA.W #$2F80                         ;C3BED3|A9802F  |      ;
TRB.W button_mask                          ;C3BED6|1C2603  |810326;
COP #$86                             ;C3BED9|0286    |      ;
RTL                                  ;C3BEDB|6B      |      ;
SEP #$20                             ;C3BEDC|E220    |      ;
LDA.W current_map_number                          ;C3BEDE|AD6A1C  |811C6A;
LDY.W #$BF21                         ;C3BEE1|A021BF  |      ;
CMP.B #$05                           ;C3BEE4|C905    |      ;
BEQ CODE_C3BF14                      ;C3BEE6|F02C    |C3BF14;
LDY.W #$BF42                         ;C3BEE8|A042BF  |      ;
CMP.B #$06                           ;C3BEEB|C906    |      ;
BEQ CODE_C3BF14                      ;C3BEED|F025    |C3BF14;
LDY.W #$BF83                         ;C3BEEF|A083BF  |      ;
CMP.B #$07                           ;C3BEF2|C907    |      ;
BEQ CODE_C3BF14                      ;C3BEF4|F01E    |C3BF14;
LDY.W #$BF94                         ;C3BEF6|A094BF  |      ;
CMP.B #$08                           ;C3BEF9|C908    |      ;
BEQ CODE_C3BF14                      ;C3BEFB|F017    |C3BF14;
LDY.W #$BFE5                         ;C3BEFD|A0E5BF  |      ;
CMP.B #$09                           ;C3BF00|C909    |      ;
BEQ CODE_C3BF14                      ;C3BF02|F010    |C3BF14;
LDY.W #$C01E                         ;C3BF04|A01EC0  |      ;
CMP.B #$0B                           ;C3BF07|C90B    |      ;
BEQ CODE_C3BF14                      ;C3BF09|F009    |C3BF14;
LDY.W #$C027                         ;C3BF0B|A027C0  |      ;
CMP.B #$0C                           ;C3BF0E|C90C    |      ;
BEQ CODE_C3BF14                      ;C3BF10|F002    |C3BF14;
db $80,$08                           ;C3BF12|        |C3BF1C;

CODE_C3BF14:
STY.W $03DA                          ;C3BF14|8CDA03  |8103DA;
LDA.B #$83                           ;C3BF17|A983    |      ;
STA.W $03DC                          ;C3BF19|8DDC03  |8103DC;
REP #$20                             ;C3BF1C|C220    |      ;
COP #$86                             ;C3BF1E|0286    |      ;
RTL                                  ;C3BF20|6B      |      ;
db $27,$37,$08,$0A,$01,$00,$00,$00   ;C3BF21|        |000037;
db $49,$4B,$0C,$1C,$00,$00,$FF,$FF   ;C3BF29|        |      ;
db $3A,$3B,$1E,$2E,$00,$00,$01,$00   ;C3BF31|        |      ;
db $26,$36,$2E,$30,$01,$00,$00,$00   ;C3BF39|        |000036;
db $FF,$21,$31,$25,$27,$FF,$FF,$00   ;C3BF41|        |253121;
db $00,$28,$2A,$05,$25,$00,$00,$FF   ;C3BF49|        |      ;
db $FF,$2A,$3A,$13,$15,$FF,$FF,$00   ;C3BF51|        |133A2A;
db $00,$28,$38,$03,$05,$01,$00,$00   ;C3BF59|        |      ;
db $00,$38,$3A,$03,$13,$00,$00,$01   ;C3BF61|        |      ;
db $00,$3A,$3C,$13,$34,$00,$00,$01   ;C3BF69|        |      ;
db $00,$28,$38,$38,$3A,$FF,$FF,$00   ;C3BF71|        |      ;
db $00,$1E,$2E,$3A,$3C,$FF,$FF,$00   ;C3BF79|        |      ;
db $00,$FF,$03,$05,$12,$20,$00,$00   ;C3BF81|        |      ;
db $FF,$FF,$06,$08,$12,$20,$00,$00   ;C3BF89|        |0806FF;
db $01,$00,$FF,$1D,$1F,$04,$07,$00   ;C3BF91|        |000000;
db $00,$FF,$FF,$1D,$1F,$09,$0C,$00   ;C3BF99|        |      ;
db $00,$FF,$FF,$1F,$21,$03,$06,$00   ;C3BFA1|        |      ;
db $00,$01,$00,$1F,$21,$08,$0B,$00   ;C3BFA9|        |      ;
db $00,$01,$00,$21,$23,$04,$07,$00   ;C3BFB1|        |      ;
db $00,$FF,$FF,$21,$23,$09,$0C,$00   ;C3BFB9|        |      ;
db $00,$FF,$FF,$26,$28,$03,$0C,$00   ;C3BFC1|        |      ;
db $00,$01,$00,$28,$2A,$03,$0C,$00   ;C3BFC9|        |      ;
db $00,$FF,$FF,$2A,$2C,$03,$0C,$00   ;C3BFD1|        |      ;
db $00,$01,$00,$2C,$3B,$09,$0B,$01   ;C3BFD9|        |      ;
db $00,$00,$00,$FF,$05,$07,$11,$17   ;C3BFE1|        |      ;
db $00,$00,$01,$00,$07,$0D,$15,$17   ;C3BFE9|        |      ;
db $01,$00,$00,$00,$0D,$0F,$12,$17   ;C3BFF1|        |000000;
db $00,$00,$FF,$FF,$0D,$0F,$09,$0F   ;C3BFF9|        |      ;
db $00,$00,$01,$00,$0F,$15,$07,$09   ;C3C001|        |      ;
db $01,$00,$00,$00,$0F,$15,$11,$13   ;C3C009|        |000000;
db $01,$00,$00,$00,$0F,$15,$1A,$1C   ;C3C011|        |000000;
db $FF,$FF,$00,$00,$FF,$07,$09,$0E   ;C3C019|        |0000FF;
db $3E,$00,$00,$FF,$FF,$FF,$03,$05   ;C3C021|        |000000;
db $06,$0A,$00,$00,$FF,$FF,$0B,$0D   ;C3C029|        |00000A;
db $06,$0A,$00,$00,$FF,$FF,$07,$09   ;C3C031|        |00000A;
db $06,$0A,$00,$00,$01,$00,$FF       ;C3C039|        |00000A;
COP #$A8                             ;C3C040|02A8    |      ;
db $00,$80,$8E                       ;C3C042|        |      ;
LDA.W #$0007                         ;C3C045|A90700  |      ;
STA.W $001E,X                        ;C3C048|9D1E00  |81001E;
STZ.W $0020,X                        ;C3C04B|9E2000  |810020;
JSL.L CODE_C0891F                    ;C3C04E|221F8980|80891F;
LDA.W $0372                          ;C3C052|AD7203  |810372;
STA.W $001C,X                        ;C3C055|9D1C00  |81001C;
COP #$15                             ;C3C058|0215    |      ;

TEMP_LOCRET:
RTL                                  ;C3C05A|6B      |      ;

CODE_C3C05B:
COP #$2E                             ;C3C05B|022E    |      ;
db $00,$18,$00,$69,$C0               ;C3C05D|        |      ;
COP #$80                             ;C3C062|0280    |      ;
db $07                               ;C3C064|        |000002;
COP #$82                             ;C3C065|0282    |      ;
BRA CODE_C3C05B                      ;C3C067|80F2    |C3C05B;
COP #$80                             ;C3C069|0280    |      ;
db $0C                               ;C3C06B|        |008202;
COP #$82                             ;C3C06C|0282    |      ;
BRA CODE_C3C05B                      ;C3C06E|80EB    |C3C05B;
SomeTalk:
db $02,$1F,$AD,$02,$03,$29,$03,$00   ;C3C070|        |      ;
db $F0,$08,$3A,$F0,$0A,$02,$01,$8C   ;C3C078|        |C3C082;
db $C0,$6B,$02,$01,$A3,$C0,$6B,$02   ;C3C080|        |      ;
db $01,$CC,$C0,$6B,$10,$48,$69,$6C   ;C3C088|        |0000CC;
db $66,$65,$20,$21,$20,$5A,$75,$20   ;C3C090|        |000065;
db $48,$69,$6C,$66,$65,$20,$21,$21   ;C3C098|        |      ;
db $13,$F0,$C8,$10,$48,$69,$6C,$66   ;C3C0A0|        |0000F0;
db $65,$20,$21,$20,$48,$2A,$72,$74   ;C3C0A8|        |000020;
db $20,$D9,$64,$65,$6E,$6E,$20,$0D   ;C3C0B0|        |C364D9;
db $6E,$69,$65,$6D,$61,$6E,$64,$2E   ;C3C0B8|        |006569;
db $2E,$2E,$48,$49,$4C,$46,$45,$20   ;C3C0C0|        |00482E;
db $21,$13,$F0,$C8,$10,$5A,$75,$20   ;C3C0C8|        |000013;
db $48,$69,$6C,$66,$65,$2E,$2E,$2E   ;C3C0D0|        |      ;
db $2E,$81,$21,$13,$F0,$C8           ;C3C0D8|        |002181;

CODE_C3C0DE:
LDA.W $0000,X                        ;C3C0DE|BD0000  |810000;
CLC                                  ;C3C0E1|18      |      ;
ADC.W #$0001                         ;C3C0E2|690100  |      ;
CLC                                  ;C3C0E5|18      |      ;
ADC.W $0382                          ;C3C0E6|6D8203  |810382;
STA.W $0000,X                        ;C3C0E9|9D0000  |810000;
STA.W $033E                          ;C3C0EC|8D3E03  |81033E;
LDA.W $0002,X                        ;C3C0EF|BD0200  |810002;
SEC                                  ;C3C0F2|38      |      ;
SBC.W #$0001                         ;C3C0F3|E90100  |      ;
CLC                                  ;C3C0F6|18      |      ;
ADC.W $0384                          ;C3C0F7|6D8403  |810384;
STA.W $0002,X                        ;C3C0FA|9D0200  |810002;
STA.W $0340                          ;C3C0FD|8D4003  |810340;
RTL                                  ;C3C100|6B      |      ;

CODE_C3C101:
LDA.W $0000,X                        ;C3C101|BD0000  |810000;
SEC                                  ;C3C104|38      |      ;
SBC.W #$0008                         ;C3C105|E90800  |      ;
CLC                                  ;C3C108|18      |      ;
ADC.W $0382                          ;C3C109|6D8203  |810382;
STA.W $0000,X                        ;C3C10C|9D0000  |810000;
STA.W $033E                          ;C3C10F|8D3E03  |81033E;
LDA.W $0002,X                        ;C3C112|BD0200  |810002;
SEC                                  ;C3C115|38      |      ;
SBC.W #$0008                         ;C3C116|E90800  |      ;
CLC                                  ;C3C119|18      |      ;
ADC.W $0384                          ;C3C11A|6D8403  |810384;
STA.W $0002,X                        ;C3C11D|9D0200  |810002;
STA.W $0340                          ;C3C120|8D4003  |810340;
RTL                                  ;C3C123|6B      |      ;
PHP                                  ;C3C124|08      |      ;
SEP #$20                             ;C3C125|E220    |      ;
LDA.B #$32                           ;C3C127|A932    |      ;
XBA                                  ;C3C129|EB      |      ;
LDA.B #$83                           ;C3C12A|A983    |      ;
LDY.W #$C135                         ;C3C12C|A035C1  |      ;
JSL.L CODE_C2988F                    ;C3C12F|228F9882|82988F;
PLP                                  ;C3C133|28      |      ;
RTL                                  ;C3C134|6B      |      ;
db $7F,$E0,$20,$E0,$04,$E1,$04,$E2   ;C3C135|        |E020E0;
db $04,$E3,$04,$E4,$04,$E5,$04,$E6   ;C3C13D|        |0000E3;
db $04,$E7,$04,$E8,$04,$E9,$04,$EA   ;C3C145|        |0000E7;
db $04,$EB,$04,$EC,$04,$ED,$04,$EE   ;C3C14D|        |0000EB;
db $04,$EF,$04,$F0,$00               ;C3C155|        |0000EF;

CODE_C3C15A:
PHP                                  ;C3C15A|08      |      ;
SEP #$20                             ;C3C15B|E220    |      ;
LDA.B #$32                           ;C3C15D|A932    |      ;
XBA                                  ;C3C15F|EB      |      ;
LDA.B #$83                           ;C3C160|A983    |      ;
LDY.W #$C16B                         ;C3C162|A06BC1  |      ;
JSL.L CODE_C2988F                    ;C3C165|228F9882|82988F;
PLP                                  ;C3C169|28      |      ;
RTL                                  ;C3C16A|6B      |      ;
db $07,$F2,$0C,$F1,$0C,$F0,$0C,$EF   ;C3C16B|        |0000F2;
db $0C,$EE,$0C,$ED,$0C,$EC,$0C,$EB   ;C3C173|        |000CEE;
db $0C,$EA,$0C,$E9,$0C,$E8,$0C,$E7   ;C3C17B|        |000CEA;
db $0C,$E6,$0C,$E5,$0C,$E4,$0C,$E3   ;C3C183|        |000CE6;
db $0C,$E2,$0C,$E1,$0C,$E0,$00,$10   ;C3C18B|        |000CE2;
db $8F,$B3,$BC,$0D,$57,$65,$6C,$74   ;C3C193|        |0DBCB3;
db $2E,$0D,$81,$6E,$69,$6D,$6D,$60   ;C3C19B|        |00810D;
db $20,$64,$69,$65,$73,$2E,$11,$02   ;C3C1A3|        |C36964;
db $02,$20,$C1,$45,$58,$50,$21,$11   ;C3C1AB|        |      ;
db $0C

Text_Return_To_GrassValley:
db $10,$96,$83,$E3,$47,$72,$61
db $73,$73,$20,$0D,$56,$61,$6C,$6C
db $65,$79,$20,$7A,$75,$72,$5B,$63
db $6B,$6B,$65,$68,$72,$65,$6E,$3F
db $0C

Text_Ok_Continue:
    db $4E,$75,$6E,$20,$67,$75,$74
    db $2C,$20,$66,$61,$68,$72,$65,$20
    db $66,$6F,$72,$74,$2E,$13,$F0,$C8

Text_Come_Back:
db $4B,$6F,$6D,$6D,$20,$77,$69,$65   ;C3C1EB|        |      ;
db $64,$65,$72,$2C,$20,$F3,$83,$0D   ;C3C1F3|        |000065;
db $E3,$47,$72,$61,$73,$73,$20,$56   ;C3C1FB|        |000047;
db $61,$6C,$6C,$65,$79,$20,$7A,$75   ;C3C203|        |00006C;
db $2D,$0D,$72,$5B,$63,$6B,$6B,$65   ;C3C20B|        |00720D;
db $68,$72,$65,$6E,$20,$77,$69,$6C   ;C3C213|        |      ;
db $6C,$73,$74,$2E,$13,$F0,$C8

db $C2   ;C3C21B|        |007473;
db $20,$A9,$59,$00,$8D,$09,$21,$9C   ;C3C223|        |C359A9;
db $86,$03,$9C,$88,$03,$A9,$C0,$3F   ;C3C22B|        |000003;
db $0C,$26,$03,$02,$0D,$00,$2F,$29   ;C3C233|        |000326;
db $72,$C2,$A9,$06,$00,$8D,$84,$1B   ;C3C23B|        |0000C2;
db $E2,$20,$A9,$04,$8D,$2C,$21,$C2   ;C3C243|        |      ;
db $20,$02,$03,$3D,$02,$04,$02,$01   ;C3C24B|        |C30302;
db $15,$C4,$02,$03,$79,$02,$04,$9C   ;C3C253|        |0000C4;
db $23,$04,$A9,$20,$00,$8D,$B6,$03   ;C3C25B|        |000004;
db $02,$3C,$04,$02,$10,$00,$0D,$02   ;C3C263|        |      ;
db $F0,$02,$90,$02,$02,$91,$6B,$02   ;C3C26B|        |C3C26F;
db $91,$02,$34,$A9,$04,$00,$8D,$84   ;C3C273|        |000002;
db $1B,$02,$03,$3D,$02,$04,$02,$01   ;C3C27B|        |      ;
db $8B,$C5,$02,$03,$79,$02,$04,$02   ;C3C283|        |      ;
db $AC,$C9,$A9,$80,$F0,$02,$A0,$02   ;C3C28B|        |00A9C9;
db $40,$00,$00,$96,$02,$33,$A9,$C0   ;C3C293|        |      ;
db $3F,$0C,$26,$03,$02,$03,$1F,$02   ;C3C29B|        |03260C;
db $04,$02,$03,$02,$A9,$03,$00,$AC   ;C3C2A3|        |000002;
db $9E,$03,$99,$1E,$00,$02,$1B,$B6   ;C3C2AB|        |009903;
db $C2,$10,$00,$A9,$02,$00,$AC,$9E   ;C3C2B3|        |      ;
db $03,$99,$1E,$00,$02,$1B,$C5,$C2   ;C3C2BB|        |000099;
db $10,$00,$02,$04,$02,$03,$5B,$02   ;C3C2C3|        |C3C2C5;
db $04,$02,$96,$02,$80,$25,$02,$82   ;C3C2CB|        |000002;
db $02,$03,$3D,$02,$04,$02,$32,$11   ;C3C2D3|        |      ;
db $02,$03,$3D,$02,$04,$02,$01,$CF   ;C3C2DB|        |      ;
db $C5,$A9,$01,$00,$8D,$84,$1B,$02   ;C3C2E3|        |0000A9;
db $01,$D6,$C5,$A9,$04,$00,$8D,$84   ;C3C2EB|        |0000D6;
db $1B,$02,$01,$E1,$C5,$02,$03,$5B   ;C3C2F3|        |      ;
db $02,$04,$02,$01,$16,$C6,$A9,$C0   ;C3C2FB|        |      ;
db $3F,$1C,$26,$03,$02,$1A,$BB,$D0   ;C3C303|        |03261C;
db $02,$20,$C3,$A9,$C0,$3F,$0C,$26   ;C3C30B|        |      ;
db $03,$AF,$D2,$03,$00,$D0,$06,$02   ;C3C313|        |0000AF;
db $01,$3A,$C6,$80,$0A,$A9,$C0,$3F   ;C3C31B|        |00003A;
db $0C,$26,$03,$02,$01,$53,$C6,$02   ;C3C323|        |000326;
db $03,$3D,$02,$04,$02,$01,$CD,$C7   ;C3C32B|        |00003D;
db $02,$97,$02,$80,$25,$02,$82,$02   ;C3C333|        |      ;
db $03,$29,$02,$04,$02,$01,$12,$C8   ;C3C33B|        |000029;
db $A9,$01,$00,$8D,$84,$1B,$02,$01   ;C3C343|        |      ;
db $38,$C8,$A9,$04,$00,$8D,$84,$1B   ;C3C34B|        |      ;
db $02,$96,$02,$80,$25,$02,$82,$02   ;C3C353|        |      ;
db $03,$29,$02,$04,$02,$01,$47,$C8   ;C3C35B|        |000029;
db $A9,$80,$03,$8D,$42,$03,$02,$81   ;C3C363|        |      ;
db $26,$04,$02,$83,$02,$97,$02,$80   ;C3C36B|        |000004;
db $25,$02,$82,$02,$03,$1F,$02,$04   ;C3C373|        |000002;
db $02,$01,$B8,$C8,$02,$96,$02,$80   ;C3C37B|        |      ;
db $25,$02,$82,$AC,$9E,$03,$B9,$16   ;C3C383|        |000002;
db $00,$29,$FF,$EF,$99,$16,$00,$A9   ;C3C38B|        |      ;
db $00,$01,$8D,$74,$04,$02,$09,$00   ;C3C393|        |      ;
db $80,$02,$80,$26,$02,$82,$A9,$00   ;C3C39B|        |C3C39F;
db $00,$8D,$74,$04,$02,$81,$26,$02   ;C3C3A3|        |      ;
db $02,$83,$A9,$00,$01,$8D,$74,$04   ;C3C3AB|        |      ;
db $02,$81,$26,$08,$02,$83,$02,$1B   ;C3C3B3|        |      ;
db $BF,$C3,$4A,$01,$A9,$00,$00,$8D   ;C3C3BB|        |014AC3;
db $74,$04,$02,$85,$F0,$C3,$83,$02   ;C3C3C3|        |000004;
db $03,$BF,$02,$04,$9E,$30,$00,$02   ;C3C3CB|        |0000BF;
db $03,$20,$E2,$20,$BD,$30,$00,$09   ;C3C3D3|        |000020;
db $E0,$8F,$00,$02,$7F,$C2,$20,$FE   ;C3C3DB|        |      ;
db $30,$00,$02,$1B,$EB,$C3,$02,$00   ;C3C3E3|        |C3C3E5;
db $02,$04,$02,$91,$6B,$A9,$02,$00   ;C3C3EB|        |      ;
db $0C,$BA,$03,$02,$03,$02,$02,$04   ;C3C3F3|        |0003BA;
db $A9,$FF,$00,$8D,$86,$03,$DA,$A0   ;C3C3FB|        |      ;
db $4C,$C5,$22,$54,$A7,$82,$FA,$02   ;C3C403|        |C322C5;
db $03,$FF,$CE,$86,$03,$02,$04,$02   ;C3C40B|        |0000FF;
db $91,$6B,$10,$98,$53,$63,$68,$5B   ;C3C413|        |00006B;
db $6C,$65,$72,$2C,$0D,$0E,$28,$65   ;C3C41B|        |007265;
db $72,$7A,$7B,$68,$6C,$65,$20,$DB   ;C3C423|        |00007A;
db $F9,$85,$0D,$62,$65,$73,$63,$68   ;C3C42B|        |000D85;
db $7B,$66,$74,$69,$67,$74,$2E,$0D   ;C3C433|        |      ;
db $0E,$5A,$8F,$77,$65,$69,$25,$20   ;C3C43B|        |008F5A;
db $6E,$69,$63,$68,$74,$2C,$20,$F9   ;C3C443|        |006369;
db $0D,$7A,$77,$69,$73,$63,$68,$65   ;C3C44B|        |00777A;
db $6E,$20,$84,$EB,$BB,$0D,$4D,$7B   ;C3C453|        |008420;
db $64,$63,$68,$65,$6E,$20,$70,$61   ;C3C45B|        |000063;
db $73,$73,$69,$65,$72,$74,$20,$69   ;C3C463|        |000073;
db $73,$74,$2E,$0D,$0E,$5A,$57,$69   ;C3C46B|        |000074;
db $65,$20,$B0,$69,$6D,$6D,$65,$72   ;C3C473|        |000020;
db $2E,$2E,$C9,$0D,$D9,$62,$65,$64   ;C3C47B|        |00C92E;
db $65,$75,$74,$65,$74,$20,$65,$73   ;C3C483|        |000075;
db $2C,$20,$BA,$0D,$83,$85,$E0,$DF   ;C3C48B|        |00BA20;
db $AF,$0D,$68,$69,$6D,$6D,$6C,$69   ;C3C493|        |69680D;
db $73,$63,$68,$65,$20,$4B,$72,$65   ;C3C49B|        |000063;
db $61,$74,$75,$72,$20,$0D,$0E,$5A   ;C3C4A3|        |000074;
db $66,$5B,$68,$6C,$73,$74,$2E,$20   ;C3C4AB|        |00005B;
db $8C,$D2,$62,$65,$72,$65,$69,$74   ;C3C4B3|        |0062D2;
db $73,$20,$0D,$BE,$4A,$61,$68,$72   ;C3C4BB|        |000020;
db $20,$76,$65,$72,$67,$61,$6E,$67   ;C3C4C3|        |C36576;
db $65,$6E,$2C,$0D,$AB,$44,$65,$69   ;C3C4CB|        |00006E;
db $6E,$65,$20,$47,$65,$66,$5B,$68   ;C3C4D3|        |002065;
db $6C,$65,$20,$FD,$0D,$69,$68,$72   ;C3C4DB|        |002065;
db $20,$D0,$E5,$DF,$0D,$76,$65,$72   ;C3C4E3|        |C3E5D0;
db $7B,$6E,$64,$65,$72,$74,$2E,$0D   ;C3C4EB|        |      ;
db $0E,$5A,$A7,$0D,$73,$6F,$6C,$6C   ;C3C4F3|        |00A75A;
db $74,$65,$73,$74,$20,$83,$76,$65   ;C3C4FB|        |000065;
db $72,$73,$75,$63,$68,$65,$6E,$20   ;C3C503|        |000073;
db $0D,$AF,$6D,$65,$6E,$73,$63,$68   ;C3C50B|        |006DAF;
db $6C,$69,$63,$68,$65,$73,$20,$4C   ;C3C513|        |006369;
db $65,$62,$65,$2D,$0D,$77,$65,$73   ;C3C51B|        |000062;
db $65,$6E,$20,$AC,$B6,$45,$72,$64   ;C3C523|        |00006E;
db $65,$20,$0D,$0E,$5A,$FD,$6C,$65   ;C3C52B|        |000020;
db $62,$65,$6E,$2E,$20,$42,$65,$61   ;C3C533|        |C3339B;
db $63,$68,$74,$65,$20,$AB,$0D,$62   ;C3C53B|        |000068;
db $69,$74,$74,$65,$2C,$20,$BA,$83   ;C3C543|        |      ;
db $AE,$45,$72,$2D,$0D,$69,$6E,$6E   ;C3C54B|        |007245;
db $65,$72,$75,$6E,$67,$65,$6E,$20   ;C3C553|        |000072;
db $61,$6E,$20,$D9,$0D,$76,$65,$72   ;C3C55B|        |00006E;
db $6C,$69,$65,$72,$65,$6E,$20,$77   ;C3C563|        |006569;
db $69,$72,$73,$74,$2C,$73,$6F,$62   ;C3C56B|        |      ;
db $61,$6C,$64,$20,$0D,$83,$AC,$B6   ;C3C573|        |00006C;
db $45,$72,$64,$65,$20,$62,$69,$73   ;C3C57B|        |000072;
db $74,$2E,$0D,$0E,$78,$13,$F1,$C8   ;C3C583|        |00002E;
db $10,$48,$65,$79,$2C,$0E,$28,$54   ;C3C58B|        |C3C5D5;
db $75,$72,$62,$6F,$2C,$0D,$0E,$5A   ;C3C593|        |000072;
db $8F,$66,$5B,$68,$6C,$65,$20,$C2   ;C3C59B|        |685B66;
db $73,$65,$6C,$74,$2D,$0D,$73,$61   ;C3C5A3|        |000065;
db $6D,$65,$73,$20,$D3,$B6,$4C,$75   ;C3C5AB|        |007365;
db $66,$74,$2E,$0D,$0E,$3C,$57,$61   ;C3C5B3|        |000074;
db $73,$20,$D2,$E1,$6C,$6F,$73,$20   ;C3C5BB|        |000020;
db $DA,$0D,$6D,$69,$72,$3F,$0D,$0E   ;C3C5C3|        |      ;
db $5A,$13,$F1,$C8,$10,$02,$02,$3F   ;C3C5CB|        |      ;
db $0E,$5A,$0C,$42,$69,$73,$74,$20   ;C3C5D3|        |000C5A;
db $83,$B9,$3F,$0E,$B4,$0C,$48,$75   ;C3C5DB|        |0000B9;
db $63,$68,$2E,$2E,$2E,$2E,$2E,$21   ;C3C5E3|        |000068;
db $0D,$0E,$5A,$8F,$CC,$67,$65,$77   ;C3C5EB|        |005A0E;
db $75,$25,$74,$2C,$BA,$0D,$83,$7A   ;C3C5F3|        |000025;
db $75,$72,$5B,$63,$6B,$6B,$6F,$6D   ;C3C5FB|        |000072;
db $6D,$65,$6E,$20,$0D,$77,$5B,$72   ;C3C603|        |006E65;
db $64,$65,$73,$74,$2E,$0D,$0E,$5A   ;C3C60B|        |000065;
db $13,$F1,$C8,$10,$57,$61,$73,$20   ;C3C613|        |0000F1;
db $D2,$6C,$6F,$73,$3F,$0D,$0E,$28   ;C3C61B|        |00006C;
db $45,$72,$69,$6E,$6E,$65,$72,$73   ;C3C623|        |000072;
db $74,$20,$83,$85,$0D,$DF,$61,$6E   ;C3C62B|        |000020;
db $20,$6D,$69,$63,$68,$3F,$0C,$4E   ;C3C633|        |C3696D;
db $65,$69,$6E,$2C,$20,$D1,$D7,$C3   ;C3C63B|        |000069;
db $0D,$DF,$67,$6C,$61,$75,$62,$65   ;C3C643|        |0067DF;
db $6E,$2E,$0D,$0E,$78,$13,$9B,$C6   ;C3C64B|        |000D2E;
db $8C,$D2,$6F,$6B,$61,$79,$2E,$0D   ;C3C653|        |006FD2;
db $0E,$28,$83,$62,$72,$61,$75,$63   ;C3C65B|        |008328;
db $68,$73,$74,$20,$84,$D8,$0D,$53   ;C3C663|        |      ;
db $6F,$72,$67,$65,$6E,$20,$FD,$6D   ;C3C66B|        |656772;
db $61,$63,$68,$65,$6E,$2E,$0D,$0E   ;C3C673|        |000063;
db $3C,$8F,$D7,$C3,$61,$6E,$20,$44   ;C3C67B|        |00D78F;
db $65,$69,$6E,$65,$6E,$20,$0D,$41   ;C3C683|        |000069;
db $75,$67,$65,$6E,$20,$61,$62,$6C   ;C3C68B|        |000067;
db $65,$73,$65,$6E,$2E,$0D,$0E,$5A   ;C3C693|        |000073;
db $8F,$B1,$65,$73,$2C,$0D,$4C,$69   ;C3C69B|        |7365B1;
db $73,$61,$2E,$2E,$2E,$2E,$0D,$0E   ;C3C6A3|        |000061;
db $28,$87,$54,$6F,$63,$68,$74,$65   ;C3C6AB|        |      ;
db $72,$20,$B8,$45,$72,$2D,$0D,$66   ;C3C6B3|        |000020;
db $69,$6E,$64,$65,$72,$73,$20,$44   ;C3C6BB|        |      ;
db $72,$2E,$93,$21,$0D,$0E,$5A,$42   ;C3C6C3|        |00002E;
db $69,$74,$74,$65,$21,$0D,$0E,$28   ;C3C6CB|        |      ;
db $45,$72,$69,$6E,$6E,$65,$72,$73   ;C3C6D3|        |000072;
db $74,$20,$83,$85,$0D,$DF,$61,$6E   ;C3C6DB|        |000020;
db $20,$6D,$69,$63,$68,$3F,$0D,$0E   ;C3C6E3|        |C3696D;
db $B4,$4E,$75,$6E,$20,$67,$75,$74   ;C3C6EB|        |00004E;
db $2E,$0D,$0E,$5A,$83,$CD,$D9,$E0   ;C3C6F3|        |000E0D;
db $6E,$69,$65,$20,$0D,$62,$65,$6C   ;C3C6FB|        |006569;
db $6F,$67,$65,$6E,$2E,$0D,$0E,$5A   ;C3C703|        |6E6567;
db $8F,$D7,$E1,$DF,$0D,$67,$6C,$61   ;C3C70B|        |DFE1D7;
db $75,$62,$65,$6E,$2C,$20,$BA,$83   ;C3C713|        |000062;
db $44,$65,$69,$6E,$20,$0D,$67,$65   ;C3C71B|        |      ;
db $73,$61,$6D,$74,$65,$73,$20,$47   ;C3C723|        |000061;
db $65,$64,$7B,$63,$68,$74,$6E,$69   ;C3C72B|        |000064;
db $73,$20,$0D,$76,$65,$72,$6C,$6F   ;C3C733|        |000020;
db $72,$65,$6E,$20,$68,$61,$73,$74   ;C3C73B|        |000065;
db $2E,$0D,$0E,$5A,$4F,$6B,$61,$79   ;C3C743|        |000E0D;
db $2C,$20,$D1,$F2,$DF,$0D,$6E,$6F   ;C3C74B|        |00D120;
db $63,$68,$6D,$61,$6C,$20,$66,$72   ;C3C753|        |000068;
db $61,$67,$65,$6E,$2E,$0D,$0E,$5A   ;C3C75B|        |000067;
db $8F,$F2,$61,$6E,$73,$63,$68,$65   ;C3C763|        |6E61F2;
db $69,$6E,$65,$6E,$64,$20,$0D,$DC   ;C3C76B|        |      ;
db $44,$65,$6E,$6B,$77,$65,$69,$73   ;C3C773|        |      ;
db $65,$20,$7B,$6E,$64,$65,$72,$6E   ;C3C77B|        |000020;
db $20,$0D,$6D,$5B,$73,$73,$65,$6E   ;C3C783|        |C36D0D;
db $2E,$0D,$0E,$5A,$AA,$6B,$2A,$6E   ;C3C78B|        |000E0D;
db $6E,$65,$6E,$20,$ED,$73,$63,$68   ;C3C793|        |006E65;
db $2A,$6E,$65,$20,$0D,$EB,$77,$75   ;C3C79B|        |      ;
db $6E,$64,$65,$72,$76,$6F,$6C,$6C   ;C3C7A3|        |006564;
db $65,$20,$45,$72,$2D,$0D,$69,$6E   ;C3C7AB|        |000020;
db $6E,$65,$72,$75,$6E,$67,$65,$6E   ;C3C7B3|        |007265;
db $20,$65,$72,$73,$63,$68,$61,$66   ;C3C7BB|        |C37265;
db $66,$65,$6E,$21,$0D,$0E,$78,$13   ;C3C7C3|        |000065;
db $F1,$C8,$10,$41,$6C,$73,$6F,$2C   ;C3C7CB|        |0000C8;
db $20,$6E,$6F,$63,$68,$6D,$61,$6C   ;C3C7D3|        |C36F6E;
db $20,$EE,$0D,$76,$6F,$72,$6E,$65   ;C3C7DB|        |C30DEE;
db $2E,$0D,$0E,$5A,$8F,$B1,$4C,$69   ;C3C7E3|        |000E0D;
db $73,$61,$2E,$0D,$0E,$5A,$55,$6E   ;C3C7EB|        |000061;
db $64,$20,$B5,$5A,$69,$65,$67,$65   ;C3C7F3|        |000020;
db $20,$68,$69,$6E,$74,$65,$72,$20   ;C3C7FB|        |C36968;
db $0D,$DB,$D2,$54,$75,$72,$62,$6F   ;C3C803|        |00D2DB;
db $2E,$0D,$0E,$5A,$13,$F1,$C8,$10   ;C3C80B|        |000E0D;
db $4B,$6F,$6D,$6D,$60,$20,$EA,$54   ;C3C813|        |      ;
db $75,$72,$62,$6F,$2C,$0D,$0E,$28   ;C3C81B|        |000072;
db $73,$61,$67,$60,$20,$3C,$47,$75   ;C3C823|        |000061;
db $74,$65,$6E,$20,$54,$61,$67,$3E   ;C3C82B|        |000065;
db $2E,$0D,$0E,$5A,$0C,$10,$4D,$7B   ;C3C833|        |000E0D;
db $7B,$7B,$7B,$7B,$68,$21,$0D,$0E   ;C3C83B|        |      ;
db $5A,$13,$F1,$C8,$10,$9F,$73,$69   ;C3C843|        |      ;
db $65,$68,$74,$20,$E9,$AD,$F6,$0D   ;C3C84B|        |000068;
db $BE,$48,$75,$6E,$64,$20,$B7,$D1   ;C3C853|        |007548;
db $65,$69,$6E,$2D,$0D,$6D,$61,$6C   ;C3C85B|        |000069;
db $20,$67,$65,$68,$61,$62,$74,$20   ;C3C863|        |C36567;
db $68,$61,$62,$65,$2E,$0D,$0E,$5A   ;C3C86B|        |      ;
db $41,$75,$73,$20,$64,$69,$65,$73   ;C3C873|        |000075;
db $65,$6D,$20,$47,$72,$75,$6E,$64   ;C3C87B|        |00006D;
db $20,$68,$65,$69,$25,$74,$20,$0D   ;C3C883|        |C36568;
db $E6,$54,$75,$72,$62,$6F,$2E,$0D   ;C3C88B|        |000054;
db $0E,$5A,$4E,$61,$20,$6B,$6F,$6D   ;C3C893|        |004E5A;
db $6D,$60,$2E,$20,$8F,$F2,$0D,$84   ;C3C89B|        |002E60;
db $B5,$47,$65,$67,$65,$6E,$64,$20   ;C3C8A3|        |000047;
db $7A,$65,$69,$67,$65,$6E,$2E,$0D   ;C3C8AB|        |      ;
db $0E,$78,$13,$F1,$C8,$10,$42,$65   ;C3C8B3|        |001378;
db $65,$69,$6C,$20,$64,$69,$63,$68   ;C3C8BB|        |000069;
db $20,$54,$75,$72,$62,$6F,$21,$0E   ;C3C8C3|        |C37554;
db $78,$13,$F1,$C8,$02,$07,$00,$80   ;C3C8CB|        |      ;
db $DC,$C8,$02,$80,$24,$02,$82,$80   ;C3C8D3|        |0002C8;
db $F3,$02,$81,$1B,$04,$02,$83,$02   ;C3C8DB|        |000002;
db $80,$24,$02,$82,$02,$81,$1B,$08   ;C3C8E3|        |C3C909;
db $02,$83,$02,$91,$6B

Default_Text_End:
    db $12, $08, $06, $04, $0C

COP #$14                             ;C3C8F5|0214    |      ;
db $56,$00,$FC,$C8                   ;C3C8F7|        |000000;
RTL                                  ;C3C8FB|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$90   ;C3C8FC|        |      ;
db $C9,$02,$80,$0E,$02,$82,$02,$15   ;C3C904|        |      ;
db $02,$1B,$12,$C9,$78,$00,$02,$16   ;C3C90C|        |      ;
db $02,$9F,$08,$00,$02,$1E,$FF,$EF   ;C3C914|        |      ;
db $02,$81,$0F,$04,$02,$83,$02,$1D   ;C3C91C|        |      ;
db $00,$10,$02,$9F,$F8,$FF,$02,$81   ;C3C924|        |      ;
db $11,$03,$02,$83,$02,$9D,$11,$02   ;C3C92C|        |000003;
db $9E,$37,$C9,$02,$15,$02,$1B,$3F   ;C3C934|        |00C937;
db $C9,$78,$00,$02,$16,$02,$9F,$08   ;C3C93C|        |      ;
db $00,$02,$81,$10,$02,$02,$83,$02   ;C3C944|        |      ;
db $9F,$F8,$FF,$02,$80,$0E,$02,$82   ;C3C94C|        |02FFF8;
db $02,$15,$02,$1B,$5C,$C9,$78,$00   ;C3C954|        |      ;
db $02,$16,$02,$9F,$08,$00,$02,$81   ;C3C95C|        |      ;
db $10,$03,$02,$83,$02,$87,$02,$9F   ;C3C964|        |C3C969;
db $F8,$FF,$02,$81,$11,$03,$02,$83   ;C3C96C|        |      ;
db $02,$9D,$11,$02,$9E,$7B,$C9,$02   ;C3C974|        |      ;
db $87,$02,$9F,$08,$00,$02,$80,$0F   ;C3C97C|        |000002;
db $02,$82,$02,$9F,$F8,$FF,$82,$78   ;C3C984|        |      ;
db $FF,$02,$91,$6B,$02,$01,$D3,$C9   ;C3C98C|        |6B9102;
db $02,$1A,$BB,$D0,$02,$CC,$C9,$AF   ;C3C994|        |      ;
db $D2,$03,$00,$D0,$2B,$02,$01,$2E   ;C3C99C|        |000003;
db $CA,$A9,$00,$00,$8D,$40,$21,$AD   ;C3C9A4|        |      ;
db $84,$1B,$48,$A9,$04,$00,$8D,$84   ;C3C9AC|        |00001B;
db $1B,$02,$01,$63,$CA,$68,$8D,$84   ;C3C9B4|        |      ;
db $1B,$02,$01,$6B,$CA,$A9,$01,$00   ;C3C9BC|        |      ;
db $8D,$40,$21,$02,$01,$94,$CA,$6B   ;C3C9C4|        |002140;
db $02,$01,$F6,$C9,$82,$C1,$FF,$10   ;C3C9CC|        |      ;
db $89,$D2,$BE,$52,$65,$73,$74,$61   ;C3C9D4|        |      ;
db $75,$2D,$0D,$72,$61,$6E,$74,$2E   ;C3C9DC|        |00002D;
db $0D,$96,$83,$B5,$4B,$61,$72,$74   ;C3C9E4|        |008396;
db $65,$20,$0D,$73,$65,$68,$65,$6E   ;C3C9EC|        |000020;
db $3F,$0C,$41,$63,$68,$20,$6B,$6F   ;C3C9F4|        |63410C;
db $6D,$6D,$20,$73,$63,$68,$6F,$6E   ;C3C9FC|        |00206D;
db $2E,$57,$69,$72,$66,$60,$20,$0D   ;C3CA04|        |006957;
db $77,$65,$6E,$69,$67,$73,$74,$65   ;C3CA0C|        |000065;
db $6E,$73,$20,$6D,$61,$6C,$20,$C0   ;C3CA14|        |002073;
db $0D,$42,$6C,$69,$63,$6B,$20,$68   ;C3CA1C|        |006C42;
db $69,$6E,$65,$69,$6E,$2E,$11,$13   ;C3CA24|        |      ;
db $E5,$C9,$57,$75,$6E,$64,$65,$72   ;C3CA2C|        |0000C9;
db $62,$61,$72,$21,$20,$55,$6E,$73   ;C3CA34|        |C33C98;
db $65,$72,$20,$0D,$54,$61,$67,$65   ;C3CA3C|        |000072;
db $73,$6D,$65,$6E,$5B,$20,$62,$65   ;C3CA44|        |00006D;
db $73,$74,$65,$68,$74,$20,$AD,$0D   ;C3CA4C|        |000074;
db $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E   ;C3CA54|        |002E2E;
db $2E,$2E,$2E,$2E,$0E,$78,$0C,$10   ;C3CA5C|        |002E2E;
db $44,$49,$52,$21,$0E,$78,$0C,$8F   ;C3CA64|        |      ;
db $68,$61,$62,$20,$E1,$53,$70,$61   ;C3CA6C|        |      ;
db $25,$20,$67,$65,$2D,$0D,$6D,$61   ;C3CA74|        |000020;
db $63,$68,$74,$2E,$20,$53,$65,$69   ;C3CA7C|        |000068;
db $20,$B2,$DF,$0D,$62,$65,$6C,$65   ;C3CA84|        |C3DFB2;
db $69,$64,$69,$67,$74,$2E,$11,$0C   ;C3CA8C|        |      ;
db $10,$44,$69,$65,$73,$65,$73,$20   ;C3CA94|        |C3CADA;
db $52,$65,$73,$74,$61,$75,$72,$61   ;C3CA9C|        |000065;
db $6E,$74,$20,$D2,$0D,$62,$65,$6B   ;C3CAA4|        |002074;
db $61,$6E,$6E,$74,$20,$C9,$73,$65   ;C3CAAC|        |00006E;
db $69,$6E,$20,$0D,$6B,$2A,$73,$74   ;C3CAB4|        |      ;
db $6C,$69,$63,$68,$65,$73,$20,$45   ;C3CABC|        |006369;
db $73,$73,$65,$6E,$20,$EB,$0D,$73   ;C3CAC4|        |000073;
db $65,$69,$6E,$65,$20,$46,$72,$75   ;C3CACC|        |000069;
db $63,$68,$74,$73,$7B,$66,$74,$65   ;C3CAD4|        |000068;
db $21,$13,$40,$FF                   ;C3CADC|        |000013;
COP #$14                             ;C3CAE0|0214    |      ;
db $4A,$00,$E7,$CA                   ;C3CAE2|        |      ;
RTL                                  ;C3CAE6|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$BD   ;C3CAE7|        |      ;
db $CB,$02,$15,$02,$91,$02,$14,$5D   ;C3CAEF|        |      ;
db $00,$FB,$CA,$6B,$02,$14,$3F,$00   ;C3CAF7|        |      ;
db $02,$CB,$6B,$02,$17,$C2,$CB,$02   ;C3CAFF|        |      ;
db $05,$03,$00,$02,$16,$02,$17,$00   ;C3CB07|        |000003;
db $00,$02,$A1,$08,$00,$08,$00,$02   ;C3CB0F|        |      ;
db $81,$12,$03,$02,$83,$02,$A1,$F8   ;C3CB17|        |000012;
db $FF,$F8,$FF,$02,$87,$02,$81,$14   ;C3CB1F|        |02FFF8;
db $03,$02,$83,$02,$87,$02,$A1,$08   ;C3CB27|        |000002;
db $00,$08,$00,$02,$81,$13,$03,$02   ;C3CB2F|        |      ;
db $83,$02,$A1,$F8,$FF,$F8,$FF,$02   ;C3CB37|        |000002;
db $81,$14,$03,$02,$83,$02,$85,$C9   ;C3CB3F|        |000014;
db $A9,$80,$00,$4E,$02,$80,$02,$02   ;C3CB47|        |      ;
db $82,$02,$1B,$56,$CB,$3C,$00,$02   ;C3CB4F|        |C3E654;
db $09,$04,$80,$02,$80,$00,$02,$82   ;C3CB57|        |      ;
db $02,$15,$02,$17,$C2,$CB,$02,$05   ;C3CB5F|        |      ;
db $06,$00,$02,$16,$02,$17,$00,$00   ;C3CB67|        |000000;
db $02,$81,$05,$03,$02,$83,$02,$80   ;C3CB6F|        |      ;
db $03,$02,$82,$02,$87,$02,$80,$05   ;C3CB77|        |000002;
db $02,$82,$02,$87,$02,$80,$05,$02   ;C3CB7F|        |      ;
db $82,$02,$80,$04,$02,$82,$02,$81   ;C3CB87|        |C34B8C;
db $05,$03,$02,$83,$02,$87,$02,$81   ;C3CB8F|        |000003;
db $05,$06,$02,$83,$02,$80,$00,$02   ;C3CB97|        |000006;
db $82,$02,$15,$02,$17,$C7,$CB,$02   ;C3CB9F|        |C3E0A4;
db $05,$07,$00,$02,$85,$C9,$A9,$80   ;C3CBA7|        |000007;
db $00,$4E,$02,$80,$12,$02,$82,$02   ;C3CBAF|        |      ;
db $17,$D4,$CB,$02,$91,$6B,$02,$01   ;C3CBB7|        |0000D4;
db $E8,$CB,$6B,$02,$01,$5B,$CC,$6B   ;C3CBBF|        |      ;
db $02,$01,$BC,$E5,$02,$09,$06,$80   ;C3CBC7|        |      ;
db $02,$09,$07,$80,$6B,$02,$07,$00   ;C3CBCF|        |      ;
db $80,$E3,$CB,$02,$01,$EC,$E5,$02   ;C3CBD7|        |C3CBBC;
db $17,$E3,$CB,$6B,$02,$01,$02,$E6   ;C3CBDF|        |0000E3;
db $6B,$10,$48,$61,$6C,$6C,$6F,$2C   ;C3CBE7|        |      ;
db $20,$D1,$B1,$BE,$0D,$4D,$69,$74   ;C3CBEF|        |C3B1D1;
db $67,$6C,$69,$65,$64,$20,$B8,$62   ;C3CBF7|        |00006C;
db $65,$2D,$0D,$72,$5B,$68,$6D,$74   ;C3CBFF|        |00002D;
db $65,$6E,$20,$0D,$3C,$57,$6F,$6F   ;C3CC07|        |00006E;
db $64,$73,$74,$69,$6E,$2D,$54,$72   ;C3CC0F|        |000073;
db $69,$6F,$73,$3E,$20,$11,$4E,$6F   ;C3CC17|        |      ;
db $72,$6D,$61,$6C,$65,$72,$77,$65   ;C3CC1F|        |00006D;
db $69,$73,$65,$20,$D0,$0D,$77,$69   ;C3CC27|        |      ;
db $72,$20,$CE,$D4,$BF,$0D,$53,$68   ;C3CC2F|        |000020;
db $6F,$77,$20,$6C,$61,$75,$66,$65   ;C3CC37|        |6C2077;
db $6E,$2C,$20,$AB,$11,$D1,$D7,$DC   ;C3CC3F|        |00202C;
db $50,$61,$72,$74,$6E,$65,$72,$20   ;C3CC47|        |C3CCAA;
db $0D,$DF,$66,$69,$6E,$64,$65,$6E   ;C3CC4F|        |0066DF;
db $2E,$13,$40,$FF,$10,$48,$65,$79   ;C3CC57|        |004013;
db $2C,$20,$6C,$61,$75,$66,$60,$20   ;C3CC5F|        |006C20;
db $CE,$DF,$0D,$72,$75,$6D,$2E,$20   ;C3CC67|        |000DDF;
db $83,$6D,$61,$63,$68,$73,$74,$20   ;C3CC6F|        |00006D;
db $D9,$0D,$6E,$65,$72,$76,$2A,$73   ;C3CC77|        |006E0D;
db $2E,$13,$40,$FF                   ;C3CC7F|        |004013;
COP #$14                             ;C3CC83|0214    |      ;
db $5A,$00,$8A,$CC                   ;C3CC85|        |      ;
RTL                                  ;C3CC89|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$A8   ;C3CC8A|        |      ;
db $CC,$02,$81,$11,$03,$02,$83,$02   ;C3CC92|        |008102;
db $15,$02,$1B,$A1,$CC,$28,$00,$02   ;C3CC9A|        |000002;
db $16,$02,$87,$82,$EB,$FF,$02,$07   ;C3CCA2|        |000002;
db $02,$84,$B4,$CC,$02,$14,$61,$00   ;C3CCAA|        |      ;
db $B9,$CC,$02,$01,$BE,$CC,$6B,$02   ;C3CCB2|        |0002CC;
db $01,$0F,$CD,$6B,$10,$8F,$B3,$B7   ;C3CCBA|        |00000F;
db $46,$72,$69,$65,$64,$2D,$0D,$68   ;C3CCC2|        |000072;
db $6F,$66,$2E,$11,$8F,$68,$2A,$72   ;C3CCCA|        |112E66;
db $65,$20,$6A,$65,$6D,$61,$6E,$64   ;C3CCD2|        |000020;
db $65,$6E,$20,$0D,$73,$63,$68,$6E   ;C3CCDA|        |00006E;
db $61,$72,$63,$68,$65,$6E,$2C,$20   ;C3CCE2|        |000072;
db $D7,$AB,$0D,$DF,$67,$65,$6E,$61   ;C3CCEA|        |0000AB;
db $75,$20,$B5,$52,$69,$63,$68,$2D   ;C3CCF2|        |000020;
db $0D,$74,$75,$6E,$67,$20,$66,$65   ;C3CCFA|        |007574;
db $73,$74,$73,$74,$65,$6C,$6C,$65   ;C3CD02|        |000074;
db $6E,$2E,$13,$40,$FF,$10,$8F,$B3   ;C3CD0A|        |00132E;
db $B7,$46,$72,$69,$65,$64,$2D,$0D   ;C3CD12|        |000046;
db $68,$6F,$66,$2E,$11,$8F,$68,$2A   ;C3CD1A|        |      ;
db $72,$65,$20,$6A,$65,$6D,$61,$6E   ;C3CD22|        |000065;
db $64,$65,$6E,$20,$0D,$73,$63,$68   ;C3CD2A|        |000065;
db $6E,$61,$72,$63,$68,$65,$6E,$2C   ;C3CD32|        |007261;
db $20,$D7,$AB,$0D,$DF,$67,$65,$6E   ;C3CD3A|        |C3ABD7;
db $61,$75,$20,$B5,$52,$69,$63,$68   ;C3CD42|        |000075;
db $2D,$0D,$74,$75,$6E,$67,$20,$66   ;C3CD4A|        |00740D;
db $65,$73,$74,$73,$74,$65,$6C,$6C   ;C3CD52|        |000073;
db $65,$6E,$2E,$13,$40,$FF           ;C3CD5A|        |00006E;
COP #$14                             ;C3CD60|0214    |      ;
db $37,$00,$67,$CD                   ;C3CD62|        |000000;
RTL                                  ;C3CD66|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$AC,$6C   ;C3CD67|        |      ;
db $CE,$83,$30,$00,$10,$01,$40,$20   ;C3CD6F|        |003083;
db $02,$15,$02,$0C,$00,$04,$87,$CD   ;C3CD77|        |      ;
db $02,$80,$18,$02,$82,$82,$F2,$FF   ;C3CD7F|        |      ;
db $02,$9B,$10,$00,$7F,$CD,$91,$CD   ;C3CD87|        |      ;
db $91,$CD,$02,$17,$00,$00,$02,$16   ;C3CD8F|        |0000CD;
db $02,$A3,$02,$80,$1E,$02,$82,$02   ;C3CD97|        |      ;
db $81,$1F,$05,$02,$83,$02,$80,$20   ;C3CD9F|        |00001F;
db $02,$82,$02,$87,$02,$A6,$02,$15   ;C3CDA7|        |      ;
db $02,$17,$B6,$CD,$82,$C3,$FF,$02   ;C3CDAF|        |      ;
db $18,$18,$BD,$CD,$80,$05,$02,$18   ;C3CDB7|        |      ;
db $32,$C7,$CD,$02,$01,$50,$CE,$6B   ;C3CDBF|        |0000C7;
db $02,$01,$D1,$CD,$00,$5E,$02,$0A   ;C3CDC7|        |      ;
db $32,$6B,$10,$41,$41,$41,$48,$48   ;C3CDCF|        |00006B;
db $21,$0D,$83,$CD,$D9,$65,$72,$2D   ;C3CDD7|        |00000D;
db $0D,$73,$63,$68,$72,$65,$63,$6B   ;C3CDDF|        |006373;
db $74,$21,$20,$53,$63,$68,$6C,$65   ;C3CDE7|        |000021;
db $69,$63,$68,$65,$20,$0D,$85,$64   ;C3CDEF|        |      ;
db $6F,$63,$68,$20,$DF,$E9,$0D,$68   ;C3CDF7|        |206863;
db $65,$72,$61,$6E,$2E,$11,$4E,$75   ;C3CDFF|        |000072;
db $6E,$2C,$20,$D1,$6E,$65,$68,$6D   ;C3CE07|        |00202C;
db $65,$20,$61,$6E,$2C,$0D,$C3,$D2   ;C3CE0F|        |000020;
db $6F,$6B,$61,$79,$2E,$20,$8F,$CC   ;C3CE17|        |79616B;
db $0D,$C2,$73,$70,$65,$7A,$69,$65   ;C3CE1F|        |0073C2;
db $6C,$6C,$65,$73,$20,$0D,$C9,$44   ;C3CE27|        |00656C;
db $69,$63,$68,$2E,$11,$02,$02,$20   ;C3CE2F|        |      ;
db $C1,$0D,$03,$24,$B7,$68,$65,$69   ;C3CE37|        |00000D;
db $25,$65,$6E,$20,$53,$70,$69,$65   ;C3CE3F|        |000065;
db $67,$65,$6C,$2E,$03,$20,$13,$40   ;C3CE47|        |000065;
db $FF,$10,$41,$41,$41,$48,$48,$21   ;C3CE4F|        |414110;
db $0D,$83,$CD,$D9,$65,$72,$2D,$0D   ;C3CE57|        |00CD83;
db $73,$63,$68,$72,$65,$63,$6B,$74   ;C3CE5F|        |000063;
db $21,$0D,$13,$40,$FF,$02,$17,$78   ;C3CE67|        |00000D;
db $CE,$02,$91,$02,$80,$23,$02,$82   ;C3CE6F|        |009102;
db $6B,$02,$01,$7D,$CE,$6B,$10,$0A   ;C3CE77|        |      ;
db $42,$65,$69,$40,$73,$63,$68,$65   ;C3CE7F|        |      ;
db $75,$65,$6E,$40,$56,$2A,$67,$65   ;C3CE87|        |000065;
db $6C,$6E,$20,$0D,$73,$6F,$6C,$6C   ;C3CE8F|        |00206E;
db $74,$65,$73,$74,$40,$44,$75,$40   ;C3CE97|        |000065;
db $44,$69,$63,$68,$40,$6C,$65,$69   ;C3CE9F|        |      ;
db $73,$65,$20,$0D,$76,$6F,$6E,$40   ;C3CEA7|        |000065;
db $68,$69,$6E,$74,$65,$6E,$40,$6E   ;C3CEAF|        |      ;
db $7B,$68,$65,$72,$6E,$2E,$13,$40   ;C3CEB7|        |      ;
db $FF                               ;C3CEBF|        |631402;
COP #$14                             ;C3CEC0|0214    |      ;
db $63,$00,$C7,$CE                   ;C3CEC2|        |000000;
RTL                                  ;C3CEC6|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$AC,$69   ;C3CEC7|        |      ;
db $D2,$83,$30,$00,$00,$02,$40,$20   ;C3CECF|        |000083;
db $02,$17,$7B,$CF,$02,$07,$06,$03   ;C3CED7|        |      ;
db $F0,$CE,$02,$17,$A3,$CF,$02,$AC   ;C3CEDF|        |C3CEAF;
db $5A,$D0,$83,$A0,$00,$B0,$00,$50   ;C3CEE7|        |      ;
db $00,$02,$15,$02,$91,$6B,$02,$16   ;C3CEEF|        |      ;
db $02,$81,$16,$09,$02,$83,$02,$9F   ;C3CEF7|        |      ;
db $F8,$FF,$02,$87,$02,$80,$17,$02   ;C3CEFF|        |      ;
db $82,$02,$9F,$08,$00,$02,$80,$16   ;C3CF07|        |C36E0C;
db $02,$82,$02,$15,$02,$17,$97,$CF   ;C3CF0F|        |      ;
db $02,$91,$6B,$02,$09,$02,$80,$02   ;C3CF17|        |      ;
db $16,$02,$80,$25,$02,$82,$02,$80   ;C3CF1F|        |000002;
db $26,$02,$82,$00,$4A,$A9,$80,$2F   ;C3CF27|        |000002;
db $0C,$26,$03,$02,$03,$08,$BD,$2E   ;C3CF2F|        |000326;
db $00,$18,$6D,$3C,$03,$8D,$3C,$03   ;C3CF37|        |      ;
db $02,$1B,$45,$CF,$02,$00,$02,$04   ;C3CF3F|        |      ;
db $A9,$80,$2F,$1C,$26,$03,$02,$07   ;C3CF47|        |      ;
db $02,$00,$1A,$CF,$02,$AC,$32,$D0   ;C3CF4F|        |      ;
db $83,$A0,$00,$10,$00,$50,$00,$02   ;C3CF57|        |0000A0;
db $1B,$64,$CF,$5A,$00,$02,$80,$12   ;C3CF5F|        |      ;
db $02,$82,$02,$80,$15,$02,$82,$02   ;C3CF67|        |      ;
db $15,$02,$17,$A3,$CF,$02,$09,$06   ;C3CF6F|        |000002;
db $83,$02,$91,$6B,$02,$14,$6F,$00   ;C3CF77|        |000002;
db $86,$CF,$02,$01,$A8,$CF,$6B,$02   ;C3CF7F|        |0000CF;
db $01,$D5,$CF,$02,$17,$92,$CF,$02   ;C3CF87|        |0000D5;
db $27,$F5,$CE,$02,$01,$D5,$CF,$6B   ;C3CF8F|        |0000F5;
db $02,$01,$E3,$CF,$02,$17,$00,$00   ;C3CF97|        |      ;
db $02,$27,$1E,$CF,$02,$01,$09,$D0   ;C3CF9F|        |      ;
db $6B,$10,$A8,$83,$DB,$68,$69,$6C   ;C3CFA7|        |      ;
db $66,$73,$74,$20,$B7,$0D,$46,$6C   ;C3CFAF|        |000073;
db $75,$25,$20,$FD,$5B,$62,$65,$72   ;C3CFB7|        |000025;
db $71,$75,$65,$72,$65,$6E,$2C,$0D   ;C3CFBF|        |000075;
db $F2,$D1,$84,$C2,$0D,$67,$65,$62   ;C3CFC7|        |0000D1;
db $65,$6E,$2E,$13,$40,$FF,$10,$46   ;C3CFCF|        |00006E;
db $6F,$6C,$67,$65,$20,$6D,$69,$72   ;C3CFD7|        |65676C;
db $2E,$13,$40,$FF,$10,$47,$65,$68   ;C3CFDF|        |004013;
db $20,$C0,$53,$63,$68,$72,$69,$74   ;C3CFE7|        |C353C0;
db $74,$20,$7A,$75,$2D,$0D,$72,$5B   ;C3CFEF|        |000020;
db $63,$6B,$2C,$20,$EB,$70,$61,$73   ;C3CFF7|        |00006B;
db $73,$60,$20,$61,$75,$66,$21,$13   ;C3CFFF|        |000060;
db $40,$FF,$10,$57,$61,$73,$20,$68   ;C3D007|        |      ;
db $7B,$6C,$73,$74,$20,$83,$64,$61   ;C3D00F|        |      ;
db $76,$6F,$6E,$3F,$0D,$8F,$68,$6F   ;C3D017|        |00006F;
db $66,$66,$65,$20,$C3,$68,$69,$6C   ;C3D01F|        |000066;
db $66,$74,$20,$0D,$44,$69,$72,$2E   ;C3D027|        |000074;
db $13,$40,$FF,$22,$40,$C0,$83,$9E   ;C3D02F|        |000040;
db $14,$00,$02,$03,$28,$BD,$02,$00   ;C3D037|        |000000;
db $18,$69,$04,$00,$9D,$02,$00,$02   ;C3D03F|        |      ;
db $04,$02,$17,$6E,$D0,$02,$15,$E2   ;C3D047|        |000002;
db $20,$A9,$83,$48,$C2,$20,$A9,$5A   ;C3D04F|        |C383A9;
db $C0,$48,$6B,$22,$40,$C0,$83,$02   ;C3D057|        |      ;
db $17,$6E,$D0,$E2,$20,$A9,$83,$48   ;C3D05F|        |00006E;
db $C2,$20,$A9,$5A,$C0,$48,$6B,$02   ;C3D067|        |      ;
db $18,$40,$78,$D0,$02,$01,$12,$D2   ;C3D06F|        |      ;
db $6B,$02,$18,$2A,$C2,$D0,$02,$18   ;C3D077|        |      ;
db $2B,$C2,$D0,$02,$18,$2C,$C2,$D0   ;C3D07F|        |      ;
db $02,$18,$2D,$C2,$D0,$02,$18,$2E   ;C3D087|        |      ;
db $C2,$D0,$02,$18,$2F,$C2,$D0,$02   ;C3D08F|        |      ;
db $18,$30,$C2,$D0,$02,$18,$31,$C2   ;C3D097|        |      ;
db $D0,$02,$01,$BF,$D1,$02,$0B,$2A   ;C3D09F|        |C3D0A3;
db $02,$0B,$2B,$02,$0B,$2C,$02,$0B   ;C3D0A7|        |      ;
db $2D,$02,$0B,$2E,$02,$0B,$2F,$02   ;C3D0AF|        |000B02;
db $0B,$30,$02,$0B,$31,$00,$5E,$02   ;C3D0B7|        |      ;
db $0A,$40,$6B,$02,$01,$C7,$D0,$6B   ;C3D0BF|        |      ;
db $10,$87,$45,$6D,$62,$6C,$65,$6D   ;C3D0C7|        |C3D050;
db $65,$20,$B8,$0D,$4D,$65,$69,$73   ;C3D0CF|        |000020;
db $74,$65,$72,$73,$20,$E7,$5B,$62   ;C3D0D7|        |000065;
db $65,$72,$20,$B5,$0D,$67,$61,$6E   ;C3D0DF|        |000072;
db $7A,$65,$20,$A9,$76,$65,$72,$2D   ;C3D0E7|        |      ;
db $0D,$73,$74,$72,$65,$75,$74,$2E   ;C3D0EF|        |007473;
db $2E,$2E,$2E,$2E,$2E,$11,$9F,$E7   ;C3D0F7|        |002E2E;
db $7A,$69,$65,$6D,$6C,$69,$63,$68   ;C3D0FF|        |      ;
db $20,$0D,$73,$63,$68,$77,$69,$65   ;C3D107|        |C3730D;
db $72,$69,$67,$20,$FD,$66,$69,$6E   ;C3D10F|        |000069;
db $64,$65,$6E,$2E,$11,$4E,$61,$63   ;C3D117|        |000065;
db $68,$64,$65,$6D,$20,$83,$AE,$38   ;C3D11F|        |      ;
db $20,$45,$6D,$2D,$0D,$62,$6C,$65   ;C3D127|        |C36D45;
db $6D,$65,$20,$65,$69,$6E,$67,$65   ;C3D12F|        |002065;
db $73,$61,$6D,$6D,$65,$6C,$74,$20   ;C3D137|        |000061;
db $0D,$68,$61,$73,$74,$2C,$20,$F7   ;C3D13F|        |006168;
db $84,$62,$65,$69,$20,$42,$65,$2D   ;C3D147|        |000062;
db $0D,$6E,$75,$74,$7A,$75,$6E,$67   ;C3D14F|        |00756E;
db $20,$EE,$9A,$11,$D8,$45,$6E,$65   ;C3D157|        |C39AEE;
db $72,$67,$69,$65,$20,$6D,$65,$68   ;C3D15F|        |000067;
db $72,$20,$61,$62,$2D,$0D,$67,$65   ;C3D167|        |000020;
db $7A,$6F,$67,$65,$6E,$2E,$20,$89   ;C3D16F|        |      ;
db $F7,$84,$0D,$44,$65,$69,$6E,$65   ;C3D177|        |000084;
db $6E,$20,$4B,$61,$6D,$70,$66,$20   ;C3D17F|        |004B20;
db $65,$72,$6C,$65,$69,$63,$68,$2D   ;C3D187|        |000072;
db $0D,$74,$65,$72,$6E,$2E,$20,$A8   ;C3D18F|        |006574;
db $83,$AE,$38,$20,$11,$67,$65,$73   ;C3D197|        |0000AE;
db $61,$6D,$6D,$65,$6C,$74,$20,$68   ;C3D19F|        |00006D;
db $61,$73,$74,$2C,$20,$6B,$65,$68   ;C3D1A7|        |000073;
db $72,$65,$20,$0D,$FD,$DB,$7A,$75   ;C3D1AF|        |000065;
db $72,$5B,$63,$6B,$2E,$13,$40,$FF   ;C3D1B7|        |00005B;
db $10,$02,$02,$2C,$0D,$83,$CD,$AE   ;C3D1BF|        |C3D1C3;
db $38,$20,$45,$6D,$62,$6C,$65,$6D   ;C3D1C7|        |      ;
db $65,$20,$0D,$67,$65,$66,$75,$6E   ;C3D1CF|        |000020;
db $64,$65,$6E,$2E,$11,$8F,$F2,$84   ;C3D1D7|        |000065;
db $6E,$75,$6E,$20,$B5,$0D,$03,$24   ;C3D1DF|        |006E75;
db $6D,$61,$67,$69,$73,$63,$68,$65   ;C3D1E7|        |006761;
db $20,$47,$6C,$6F,$63,$6B,$65,$20   ;C3D1EF|        |C36C47;
db $67,$65,$62,$65,$6E,$2E,$0D,$03   ;C3D1F7|        |000065;
db $20,$83,$CD,$67,$75,$74,$20,$67   ;C3D1FF|        |C3CD83;
db $65,$6B,$7B,$6D,$70,$66,$74,$21   ;C3D207|        |00006B;
db $13,$40,$FF,$10,$87,$6D,$61,$67   ;C3D20F|        |000040;
db $69,$73,$63,$68,$65,$20,$47,$6C   ;C3D217|        |      ;
db $6F,$63,$6B,$65,$20,$0D,$65,$72   ;C3D21F|        |656B63;
db $6C,$61,$75,$62,$74,$20,$84,$B5   ;C3D227|        |007561;
db $42,$65,$2D,$0D,$6E,$75,$74,$7A   ;C3D22F|        |      ;
db $75,$6E,$67,$20,$EE,$9A,$6F,$68   ;C3D237|        |00006E;
db $6E,$65,$20,$0D,$4A,$55,$57,$45   ;C3D23F|        |002065;
db $4C,$45,$4E,$20,$FD,$76,$65,$72   ;C3D247|        |C34E45;
db $6C,$69,$65,$72,$65,$6E,$2E,$11   ;C3D24F|        |006569;
db $02,$02,$2C,$20,$76,$69,$65,$6C   ;C3D257|        |      ;
db $20,$47,$6C,$5B,$63,$6B,$21,$13   ;C3D25F|        |C36C47;
db $40,$FF,$02,$17,$75,$D2,$02,$91   ;C3D267|        |      ;
db $02,$80,$23,$02,$82,$6B,$02,$01   ;C3D26F|        |      ;
db $7A,$D2,$6B,$10,$0A,$45,$73,$40   ;C3D277|        |      ;
db $67,$61,$62,$40,$65,$69,$6E,$6D   ;C3D27F|        |000061;
db $61,$6C,$40,$65,$69,$6E,$40,$46   ;C3D287|        |00006C;
db $6C,$6F,$25,$20,$0D,$77,$65,$6C   ;C3D28F|        |00256F;
db $63,$68,$65,$73,$40,$61,$75,$73   ;C3D297|        |000068;
db $40,$6D,$65,$69,$6E,$65,$6E,$40   ;C3D29F|        |      ;
db $20,$0D,$7D,$73,$74,$65,$6E,$40   ;C3D2A7|        |C37D0D;
db $67,$65,$66,$65,$72,$74,$69,$67   ;C3D2AF|        |000065;
db $74,$40,$77,$61,$72,$2E,$11,$44   ;C3D2B7|        |000040;
db $75,$40,$6D,$75,$25,$74,$40,$64   ;C3D2BF|        |000040;
db $69,$65,$73,$65,$73,$40,$46,$6C   ;C3D2C7|        |      ;
db $6F,$25,$40,$20,$0D,$66,$69,$6E   ;C3D2CF|        |204025;
db $64,$65,$6E,$2C,$40,$F0,$0D,$6B   ;C3D2D7|        |000065;
db $61,$6E,$6E,$40,$65,$73,$40,$44   ;C3D2DF|        |00006E;
db $69,$72,$40,$68,$65,$6C,$66,$65   ;C3D2E7|        |      ;
db $6E,$2E,$40,$20,$13,$40,$FF       ;C3D2EF|        |00402E;
COP #$14                             ;C3D2F6|0214    |      ;
db $58,$00,$FD,$D2                   ;C3D2F8|        |      ;
RTL                                  ;C3D2FC|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$AC,$6D   ;C3D2FD|        |      ;
db $D3,$83,$70,$00,$D0,$02,$40,$20   ;C3D305|        |000083;
db $02,$17,$32,$D3,$02,$91,$02,$81   ;C3D30D|        |      ;
db $05,$03,$02,$83,$02,$81,$03,$03   ;C3D315|        |000003;
db $02,$83,$02,$87,$02,$81,$05,$03   ;C3D31D|        |      ;
db $02,$83,$02,$81,$04,$03,$02,$83   ;C3D325|        |      ;
db $02,$87,$82,$E1,$FF,$02,$01,$37   ;C3D32D|        |      ;
db $D3,$6B,$10,$8F,$68,$2A,$72,$65   ;C3D335|        |00006B;
db $20,$6A,$65,$6D,$61,$6E,$64,$65   ;C3D33D|        |C3656A;
db $6E,$20,$0D,$73,$63,$68,$6E,$61   ;C3D345|        |000D20;
db $72,$63,$68,$65,$6E,$2E,$0D,$8F   ;C3D34D|        |000063;
db $77,$65,$69,$25,$20,$E1,$DF,$0D   ;C3D355|        |000065;
db $77,$6F,$68,$65,$72,$20,$C3,$6B   ;C3D35D|        |00006F;
db $6F,$6D,$6D,$74,$2E,$13,$40,$FF   ;C3D365|        |746D6D;
db $02,$17,$79,$D3,$02,$91,$02,$80   ;C3D36D|        |      ;
db $23,$02,$82,$6B,$02,$19,$1C,$92   ;C3D375|        |000002;
db $D3,$02,$01,$A4,$D3,$9C,$23,$04   ;C3D37D|        |000002;
db $02,$3C,$04,$02,$10,$04,$06,$02   ;C3D385|        |      ;
db $20,$01,$40,$00,$6B,$02,$01,$97   ;C3D38D|        |C34001;
db $D3,$6B,$10,$0A,$5A,$7A,$7A,$7A   ;C3D395|        |00006B;
db $7A,$2E,$2E,$2E,$13,$40,$FF,$10   ;C3D39D|        |      ;
db $02,$02,$0D,$6C,$65,$67,$74,$20   ;C3D3A5|        |      ;
db $B7,$A4,$0D,$AC,$B7,$42,$61,$75   ;C3D3AD|        |0000A4;
db $6D,$73,$74,$75,$6D,$70,$66,$2E   ;C3D3B5|        |007473;
db $13,$40,$FF                       ;C3D3BD|        |000040;
COP #$14                             ;C3D3C0|0214    |      ;
db $46,$00,$C7,$D3                   ;C3D3C2|        |000000;
RTL                                  ;C3D3C6|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$AC,$88   ;C3D3C7|        |      ;
db $D4,$83,$20,$02,$E0,$02,$40,$20   ;C3D3CF|        |000083;
db $02,$17,$12,$D4,$02,$80,$1D,$02   ;C3D3D7|        |      ;
db $82,$02,$1B,$E6,$D3,$28,$00,$02   ;C3D3DF|        |C3EEE4;
db $87,$02,$80,$1D,$02,$82,$02,$1B   ;C3D3E7|        |000002;
db $F3,$D3,$3C,$00,$02,$A3,$02,$80   ;C3D3EF|        |0000D3;
db $1E,$02,$82,$02,$81,$1F,$04,$02   ;C3D3F7|        |008202;
db $83,$02,$87,$02,$81,$1F,$04,$02   ;C3D3FF|        |000002;
db $83,$02,$80,$20,$02,$82,$02,$A6   ;C3D407|        |000002;
db $82,$C9,$FF,$02,$01,$17,$D4,$6B   ;C3D40F|        |C3D3DB;
db $10,$AA,$73,$61,$67,$65,$6E,$20   ;C3D417|        |C3D3C3;
db $B7,$42,$7B,$75,$6D,$65,$6E,$20   ;C3D41F|        |000042;
db $0D,$F9,$D3,$B6,$47,$65,$67,$65   ;C3D427|        |00D3F9;
db $6E,$64,$20,$70,$61,$73,$2D,$0D   ;C3D42F|        |002064;
db $73,$69,$65,$72,$74,$2C,$20,$EB   ;C3D437|        |000069;
db $64,$61,$66,$5B,$72,$20,$67,$65   ;C3D43F|        |000061;
db $62,$65,$6E,$20,$0D,$E6,$ED,$46   ;C3D447|        |C342AF;
db $75,$74,$74,$65,$72,$2E,$11,$8F   ;C3D44F|        |000074;
db $77,$5B,$72,$64,$65,$20,$C3,$BF   ;C3D457|        |00005B;
db $41,$72,$74,$20,$0D,$4E,$75,$74   ;C3D45F|        |000072;
db $7A,$6E,$69,$65,$25,$65,$72,$2D   ;C3D467|        |      ;
db $46,$72,$65,$75,$6E,$64,$2D,$0D   ;C3D46F|        |000072;
db $73,$63,$68,$61,$66,$74,$20,$6E   ;C3D477|        |000063;
db $65,$6E,$6E,$65,$6E,$2E,$13,$40   ;C3D47F|        |00006E;
db $FF,$02,$17,$94,$D4,$02,$91,$02   ;C3D487|        |941702;
db $80,$23,$02,$82,$6B,$02,$01,$99   ;C3D48F|        |C3D4B4;
db $D4,$6B,$10,$0A,$44,$69,$65,$40   ;C3D497|        |00006B;
db $56,$2A,$67,$65,$6C,$40,$65,$72   ;C3D49F|        |00002A;
db $7A,$7B,$68,$6C,$65,$6E,$20,$0D   ;C3D4A7|        |      ;
db $76,$69,$65,$6C,$65,$40,$47,$65   ;C3D4AF|        |000069;
db $73,$63,$68,$69,$63,$68,$74,$65   ;C3D4B7|        |000063;
db $6E,$2E,$11,$49,$63,$68,$40,$62   ;C3D4BF|        |00112E;
db $69,$6E,$40,$69,$68,$6E,$65,$6E   ;C3D4C7|        |      ;
db $40,$64,$61,$6E,$6B,$2D,$0D,$62   ;C3D4CF|        |      ;
db $61,$72,$2C,$40,$77,$65,$69,$6C   ;C3D4D7|        |000072;
db $40,$69,$63,$68,$40,$D9,$0D,$6A   ;C3D4DF|        |      ;
db $61,$40,$6E,$69,$63,$68,$74,$40   ;C3D4E7|        |000040;
db $62,$65,$77,$65,$67,$65,$6E,$40   ;C3D4EF|        |C34C57;
db $6B,$61,$6E,$6E,$2E,$11,$44,$69   ;C3D4F7|        |      ;
db $65,$40,$56,$2A,$67,$65,$6C,$40   ;C3D4FF|        |000040;
db $65,$72,$7A,$7B,$68,$6C,$65,$6E   ;C3D507|        |000072;
db $40,$DB,$0D,$64,$61,$25,$40,$4C   ;C3D50F|        |      ;
db $6F,$73,$74,$73,$69,$64,$65,$40   ;C3D517|        |737473;
db $33,$40,$54,$65,$6D,$70,$65,$6C   ;C3D51F|        |000040;
db $20,$0D,$68,$61,$74,$2E,$11,$45   ;C3D527|        |C3680D;
db $69,$6E,$65,$72,$40,$68,$65,$69   ;C3D52F|        |      ;
db $25,$74,$40,$57,$61,$73,$73,$65   ;C3D537|        |000074;
db $72,$2C,$11,$65,$69,$6E,$65,$72   ;C3D53F|        |00002C;
db $40,$46,$65,$75,$65,$72,$2C,$11   ;C3D547|        |      ;
db $75,$6E,$64,$40,$64,$65,$72,$40   ;C3D54F|        |00006E;
db $64,$72,$69,$74,$74,$65,$0D,$4C   ;C3D557|        |000072;
db $69,$63,$68,$74,$2E,$13,$40,$FF   ;C3D55F|        |      ;
COP #$14                             ;C3D567|0214    |      ;
db $3C,$00,$6E,$D5                   ;C3D569|        |006E00;
RTL                                  ;C3D56D|6B      |      ;
COP #$85                             ;C3D56E|0285    |      ;
db $C9,$A9,$80                       ;C3D570|        |      ;
COP #$AC                             ;C3D573|02AC    |      ;
db $59,$D8,$83,$B0,$02,$00,$02,$40   ;C3D575|        |0083D8;
db $20                               ;C3D57D|        |C31702;
COP #$17                             ;C3D57E|0217    |      ;
db $F6,$D5                           ;C3D580|        |0000D5;
COP #$15                             ;C3D582|0215    |      ;
COP #$91                             ;C3D584|0291    |      ;
RTL                                  ;C3D586|6B      |      ;
db $02,$16,$02,$81,$11,$06,$02,$83   ;C3D587|        |      ;
db $02,$9F,$08,$00,$02,$81,$0F,$04   ;C3D58F|        |      ;
db $02,$83,$02,$9F,$F8,$FF,$02,$80   ;C3D597|        |      ;
db $0E,$02,$82,$02,$17,$1D,$D6,$02   ;C3D59F|        |008202;
db $15,$02,$91,$6B,$02,$16,$02,$17   ;C3D5A7|        |000002;
db $18,$D6,$02,$81,$10,$07,$02,$83   ;C3D5AF|        |      ;
db $02,$17,$25,$D6,$02,$15,$02,$91   ;C3D5B7|        |      ;
db $6B,$02,$17,$00,$00,$A9,$80,$2F   ;C3D5BF|        |      ;
db $0C,$26,$03,$02,$1B,$D0,$D5,$3C   ;C3D5C7|        |000326;
db $00,$02,$01,$9A,$D7,$02,$80,$0C   ;C3D5CF|        |      ;
db $02,$82,$02,$1B,$DF,$D5,$1E,$00   ;C3D5D7|        |      ;
db $02,$81,$24,$04,$02,$83,$02,$01   ;C3D5DF|        |      ;
db $11,$D8,$A9,$80,$2F,$1C,$26,$03   ;C3D5E7|        |0000D8;
db $02,$17,$18,$D6,$02,$91,$6B,$02   ;C3D5EF|        |      ;
db $01,$39,$D6,$02,$1A,$BB,$D0,$02   ;C3D5F7|        |000039;
db $13,$D6,$AF,$D2,$03,$00,$D0,$0C   ;C3D5FF|        |0000D6;
db $02,$01,$46,$D6,$02,$17,$18,$D6   ;C3D607|        |      ;
db $02,$27,$87,$D5,$02,$01,$5A,$D6   ;C3D60F|        |      ;
db $6B,$02,$01,$6B,$D6,$6B,$02,$01   ;C3D617|        |      ;
db $B8,$D6,$02,$27,$AB,$D5,$02,$14   ;C3D61F|        |      ;
db $4A,$00,$31,$D6,$02,$01,$4F,$D7   ;C3D627|        |      ;
db $80,$04,$02,$01,$FE,$D6,$02,$27   ;C3D62F|        |C3D635;
db $C0,$D5,$10,$4B,$6F,$6D,$6D,$20   ;C3D637|        |      ;
db $B2,$DA,$6D,$69,$72,$2E,$0C,$4F   ;C3D63F|        |0000DA;
db $6B,$61,$79,$2C,$20,$6C,$6F,$73   ;C3D647|        |      ;
db $20,$67,$65,$68,$74,$60,$73,$21   ;C3D64F|        |C36567;
db $13,$40,$FF,$57,$61,$72,$75,$6D   ;C3D657|        |000040;
db $20,$6E,$69,$63,$68,$74,$21,$3F   ;C3D65F|        |C3696E;
db $0D,$13,$40,$FF,$10,$4D,$69,$72   ;C3D667|        |004013;
db $20,$6D,$61,$63,$68,$74,$20,$C3   ;C3D66F|        |C3616D;
db $67,$65,$6E,$61,$75,$73,$6F,$20   ;C3D677|        |000065;
db $0D,$76,$69,$65,$6C,$20,$53,$70   ;C3D67F|        |006976;
db $61,$25,$20,$B5,$4C,$65,$75,$74   ;C3D687|        |000025;
db $65,$20,$0D,$47,$61,$73,$73,$69   ;C3D68F|        |000020;
db $20,$FD,$66,$5B,$68,$72,$65,$6E   ;C3D697|        |C366FD;
db $2C,$20,$F6,$0D,$C3,$69,$68,$6E   ;C3D69F|        |00F620;
db $65,$6E,$20,$53,$70,$61,$25,$20   ;C3D6A7|        |00006E;
db $6D,$61,$63,$68,$74,$2E,$13,$40   ;C3D6AF|        |006361;
db $FF,$10,$87,$49,$6E,$73,$65,$6C   ;C3D6B7|        |498710;
db $20,$64,$6F,$72,$74,$20,$64,$72   ;C3D6BF|        |C36F64;
db $5B,$62,$65,$6E,$20,$0D,$D2,$BE   ;C3D6C7|        |      ;
db $46,$72,$69,$65,$64,$68,$6F,$66   ;C3D6CF|        |000072;
db $2E,$0D,$98,$5A,$77,$69,$6C,$6C   ;C3D6D7|        |00980D;
db $69,$6E,$67,$73,$62,$72,$75,$64   ;C3D6DF|        |      ;
db $65,$72,$20,$0D,$68,$7B,$6C,$74   ;C3D6E7|        |000072;
db $20,$64,$6F,$72,$74,$20,$57,$61   ;C3D6EF|        |C36F64;
db $63,$68,$65,$2E,$13,$40,$FF,$10   ;C3D6F7|        |000068;
db $89,$D2,$B9,$47,$72,$5B,$6E,$65   ;C3D6FF|        |      ;
db $20,$0D,$54,$68,$65,$61,$74,$65   ;C3D707|        |C3540D;
db $72,$2E,$20,$45,$69,$6E,$65,$20   ;C3D70F|        |00002E;
db $47,$72,$75,$70,$70,$65,$20,$0D   ;C3D717|        |000072;
db $E2,$3C,$57,$6F,$6F,$64,$73,$74   ;C3D71F|        |      ;
db $69,$6E,$2D,$54,$72,$69,$6F,$3E   ;C3D727|        |      ;
db $20,$0D,$E7,$73,$6F,$77,$61,$73   ;C3D72F|        |C3E70D;
db $20,$F6,$B5,$11,$4C,$6F,$6B,$61   ;C3D737|        |C3B5F6;
db $6C,$68,$65,$6C,$64,$65,$6E,$20   ;C3D73F|        |006568;
db $68,$69,$65,$72,$2E,$13,$40,$FF   ;C3D747|        |      ;
db $10,$89,$CE,$FC,$C4,$0D,$B9,$47   ;C3D74F|        |C3D6DA;
db $72,$5B,$6E,$65,$20,$54,$68,$65   ;C3D757|        |00005B;
db $61,$74,$65,$72,$2E,$11,$45,$69   ;C3D75F|        |000074;
db $6E,$65,$20,$47,$72,$75,$70,$70   ;C3D767|        |002065;
db $65,$20,$E2,$0D,$3C,$57,$6F,$6F   ;C3D76F|        |000020;
db $64,$73,$74,$69,$6E,$2D,$54,$72   ;C3D777|        |000073;
db $69,$6F,$3E,$20,$FC,$0D,$6D,$61   ;C3D77F|        |      ;
db $6C,$20,$E8,$62,$65,$6C,$69,$65   ;C3D787|        |00E820;
db $62,$74,$20,$68,$69,$65,$72,$2E   ;C3D78F|        |C3F806;
db $13,$40,$FF,$10,$44,$61,$6E,$6B   ;C3D797|        |000040;
db $65,$2C,$20,$BA,$83,$DA,$DB,$0D   ;C3D79F|        |00002C;
db $73,$70,$61,$7A,$69,$65,$72,$65   ;C3D7A7|        |000070;
db $6E,$20,$67,$65,$67,$61,$6E,$67   ;C3D7AF|        |006720;
db $65,$6E,$20,$0D,$62,$69,$73,$74   ;C3D7B7|        |00006E;
db $2E,$0D,$4F,$68,$2C,$20,$E0,$BF   ;C3D7BF|        |004F0D;
db $53,$61,$63,$68,$65,$2E,$2E,$2E   ;C3D7C7|        |000061;
db $11,$AA,$54,$69,$65,$72,$65,$20   ;C3D7CF|        |0000AA;
db $72,$65,$64,$65,$6E,$20,$DF,$0D   ;C3D7D7|        |000065;
db $E1,$DA,$75,$6E,$73,$65,$72,$65   ;C3D7DF|        |0000DA;
db $6E,$20,$0D,$53,$74,$69,$6D,$6D   ;C3D7E7|        |000D20;
db $65,$6E,$2C,$20,$73,$6F,$6E,$64   ;C3D7EF|        |00006E;
db $65,$72,$6E,$20,$B0,$0D,$DA,$75   ;C3D7F7|        |000072;
db $6E,$73,$65,$72,$65,$6E,$20,$4B   ;C3D7FF|        |006573;
db $2A,$72,$70,$65,$72,$6E,$2E,$13   ;C3D807|        |      ;
db $40,$FF,$10,$A8,$D1,$D9,$E9,$62   ;C3D80F|        |      ;
db $65,$77,$65,$2D,$0D,$67,$65,$2C   ;C3D817|        |000077;
db $20,$EB,$DA,$BB,$0D,$53,$63,$68   ;C3D81F|        |C3DAEB;
db $77,$61,$6E,$7A,$20,$77,$65,$64   ;C3D827|        |000061;
db $65,$6C,$65,$2C,$20,$68,$65,$69   ;C3D82F|        |00006C;
db $25,$74,$20,$0D,$B9,$3C,$44,$61   ;C3D837|        |000074;
db $6E,$6B,$65,$3E,$2E,$11,$48,$61   ;C3D83F|        |00656B;
db $73,$74,$20,$83,$B9,$EA,$67,$65   ;C3D847|        |000074;
db $2D,$0D,$77,$75,$25,$74,$3F,$13   ;C3D84F|        |00770D;
db $40,$FF                           ;C3D857|        |      ;
COP #$17                             ;C3D859|0217    |      ;
db $65,$D8                           ;C3D85B|        |0000D8;
COP #$91                             ;C3D85D|0291    |      ;
COP #$80                             ;C3D85F|0280    |      ;
db $23                               ;C3D861|        |000002;
COP #$82                             ;C3D862|0282    |      ;
db $6B,$02,$01,$6A,$D8,$6B,$10,$0A   ;C3D864|        |      ;
db $57,$65,$6E,$6E,$40,$44,$75,$40   ;C3D86C|        |000065;
db $65,$69,$6E,$65,$6E,$40,$62,$65   ;C3D874|        |000069;
db $2D,$0D,$73,$74,$69,$6D,$6D,$74   ;C3D87C|        |00730D;
db $65,$6E,$40,$4D,$61,$75,$6C,$77   ;C3D884|        |00006E;
db $75,$72,$66,$20,$0D,$66,$69,$6E   ;C3D88C|        |000072;
db $64,$65,$73,$74,$2C,$40,$6B,$61   ;C3D894|        |000065;
db $6E,$6E,$73,$74,$40,$83,$0D,$69   ;C3D89C|        |00736E;
db $6D,$40,$44,$75,$6E,$6B,$65,$6C   ;C3D8A4|        |004440;
db $6E,$40,$73,$65,$68,$65,$6E,$2E   ;C3D8AC|        |007340;
db $11,$53,$70,$72,$69,$63,$68,$40   ;C3D8B4|        |000053;
db $61,$6D,$40,$62,$65,$73,$74,$65   ;C3D8BC|        |00006D;
db $6E,$40,$DA,$0D,$61,$6C,$6C,$65   ;C3D8C4|        |00DA40;
db $6E,$40,$4D,$61,$75,$6C,$77,$5B   ;C3D8CC|        |004D40;
db $72,$66,$65,$6E,$2E,$13,$40,$FF   ;C3D8D4|        |000066;
COP #$14                             ;C3D8DC|0214    |      ;
db $38,$00,$E3,$D8                   ;C3D8DE|        |      ;
RTL                                  ;C3D8E2|6B      |      ;
COP #$85                             ;C3D8E3|0285    |      ;
db $C9,$A9,$80                       ;C3D8E5|        |      ;
COP #$AC                             ;C3D8E8|02AC    |      ;
db $31,$D9,$83,$A0,$02,$60,$01,$40   ;C3D8EA|        |0000D9;
db $20                               ;C3D8F2|        |C31702;
COP #$17                             ;C3D8F3|0217    |      ;
db $01,$D9                           ;C3D8F5|        |0000D9;
COP #$15                             ;C3D8F7|0215    |      ;
COP #$91                             ;C3D8F9|0291    |      ;
COP #$80                             ;C3D8FB|0280    |      ;
db $18                               ;C3D8FD|        |      ;
COP #$82                             ;C3D8FE|0282    |      ;
db $6B,$02,$01,$06,$D9,$6B,$10,$52   ;C3D900|        |      ;
db $65,$64,$65,$20,$DA,$BB,$42,$61   ;C3D908|        |000064;
db $75,$6D,$2D,$0D,$73,$74,$75,$6D   ;C3D910|        |00006D;
db $70,$66,$2C,$20,$EB,$68,$2A,$72   ;C3D918|        |C3D980;
db $65,$20,$69,$68,$6D,$20,$0D,$67   ;C3D920|        |000020;
db $75,$74,$20,$7A,$75,$2E,$13,$40   ;C3D928|        |000074;
db $FF                               ;C3D930|        |3D1702;
COP #$17                             ;C3D931|0217    |      ;
db $3D,$D9                           ;C3D933|        |0002D9;
COP #$91                             ;C3D935|0291    |      ;
COP #$80                             ;C3D937|0280    |      ;
db $23                               ;C3D939|        |000002;
COP #$82                             ;C3D93A|0282    |      ;
db $6B,$02,$01,$42,$D9,$6B,$10,$0A   ;C3D93C|        |      ;
db $48,$69,$65,$72,$40,$69,$73,$74   ;C3D944|        |      ;
db $40,$47,$72,$65,$65,$6E,$20,$57   ;C3D94C|        |      ;
db $6F,$6F,$64,$2E,$0D,$44,$69,$65   ;C3D954|        |2E646F;
db $73,$65,$73,$40,$4C,$61,$6E,$64   ;C3D95C|        |000065;
db $40,$77,$75,$72,$64,$65,$40,$EE   ;C3D964|        |      ;
db $0D,$65,$69,$6E,$65,$6D,$40,$48   ;C3D96C|        |006965;
db $75,$6E,$64,$40,$E2,$0D,$54,$75   ;C3D974|        |00006E;
db $72,$62,$6F,$40,$65,$72,$72,$69   ;C3D97C|        |000062;
db $63,$68,$74,$65,$74,$2E,$11,$45   ;C3D984|        |000068;
db $72,$40,$68,$61,$74,$40,$64,$69   ;C3D98C|        |000040;
db $65,$73,$65,$40,$53,$74,$61,$64   ;C3D994|        |000073;
db $74,$40,$65,$72,$2D,$0D,$73,$63   ;C3D99C|        |000040;
db $68,$61,$66,$66,$65,$6E,$2C,$40   ;C3D9A4|        |      ;
db $75,$6D,$40,$B7,$0D,$54,$69,$65   ;C3D9AC|        |00006D;
db $72,$65,$6E,$40,$65,$69,$6E,$65   ;C3D9B4|        |000065;
db $6E,$40,$50,$6C,$61,$74,$7A,$40   ;C3D9BC|        |005040;
db $D3,$0D,$53,$69,$63,$68,$65,$72   ;C3D9C4|        |00000D;
db $68,$65,$69,$74,$40,$7A,$75,$40   ;C3D9CC|        |      ;
db $67,$65,$62,$65,$6E,$2E,$13,$40   ;C3D9D4|        |000065;
db $FF                               ;C3D9DC|        |611402;
COP #$14                             ;C3D9DD|0214    |      ;
db $61,$00,$E4,$D9                   ;C3D9DF|        |000000;
RTL                                  ;C3D9E3|6B      |      ;
db $02,$30,$61,$00,$D1,$DA,$83,$02   ;C3D9E4|        |      ;
db $07,$02,$9F,$13,$DA,$02,$85,$C9   ;C3D9EC|        |000002;
db $A9,$80,$02,$85,$B6,$DA,$83,$02   ;C3D9F4|        |      ;
db $17,$96,$DA,$02,$15,$02,$91,$02   ;C3D9FC|        |000096;
db $07,$02,$04,$12,$DA,$02,$17,$B1   ;C3DA04|        |000002;
db $DA,$02,$80,$1A,$02,$82,$6B,$A9   ;C3DA0C|        |      ;
db $C0,$BF,$0C,$26,$03,$BD,$16,$00   ;C3DA14|        |      ;
db $09,$00,$20,$9D,$16,$00,$02,$03   ;C3DA1C|        |      ;
db $65,$02,$04,$02,$01,$05,$DC,$02   ;C3DA24|        |000002;
db $03,$79,$02,$04,$02,$A1,$10,$00   ;C3DA2C|        |000079;
db $F0,$FF,$BD,$16,$00,$29,$FF,$DF   ;C3DA34|        |C3DA35;
db $9D,$16,$00,$02,$81,$28,$08,$02   ;C3DA3C|        |000016;
db $83,$02,$81,$27,$10,$02,$83,$02   ;C3DA44|        |000002;
db $03,$5B,$02,$04,$02,$01,$6B,$DC   ;C3DA4C|        |00005B;
db $02,$03,$79,$02,$04,$02,$81,$24   ;C3DA54|        |      ;
db $04,$02,$83,$02,$03,$29,$02,$04   ;C3DA5C|        |000002;
db $02,$81,$27,$10,$02,$83,$02,$81   ;C3DA64|        |      ;
db $28,$08,$02,$83,$BD,$16,$00,$09   ;C3DA6C|        |      ;
db $00,$20,$9D,$16,$00,$02,$03,$79   ;C3DA74|        |      ;
db $02,$04,$A9,$20,$00,$8D,$B6,$03   ;C3DA7C|        |      ;
db $02,$10,$01,$01,$03,$B0,$03,$D8   ;C3DA84|        |      ;
db $01,$A9,$C0,$BF,$1C,$26,$03,$02   ;C3DA8C|        |0000A9;
db $91,$6B,$02,$19,$1C,$AC,$DA,$02   ;C3DA94|        |00006B;
db $01,$0E,$DB,$02,$3C,$04,$02,$10   ;C3DA9C|        |00000E;
db $04,$05,$03,$60,$01,$C0,$01,$6B   ;C3DAA4|        |000005;
db $02,$01,$04,$DB,$6B,$02,$01,$3A   ;C3DAAC|        |      ;
db $DB,$6B,$02,$91,$02,$0D,$00,$12   ;C3DAB4|        |      ;
db $2C,$C0,$DA,$6B,$02,$01,$D8,$DA   ;C3DABC|        |00DAC0;
db $02,$91,$02,$0D,$00,$12,$2C,$D0   ;C3DAC4|        |      ;
db $DA,$82,$E6,$FF,$6B,$02,$01,$D2   ;C3DACC|        |      ;
db $DB,$02,$86,$6B,$10,$48,$69,$65   ;C3DAD4|        |      ;
db $72,$20,$6C,$69,$65,$67,$74,$20   ;C3DADC|        |000020;
db $54,$75,$72,$62,$6F,$2C,$20,$B6   ;C3DAE4|        |      ;
db $0D,$45,$72,$62,$61,$75,$65,$72   ;C3DAEC|        |007245;
db $20,$EE,$47,$72,$65,$65,$6E,$20   ;C3DAF4|        |C347EE;
db $57,$6F,$6F,$64,$2E,$13,$40,$FF   ;C3DAFC|        |00006F;
db $10,$5A,$7A,$7A,$7A,$7A,$20,$13   ;C3DB04|        |C3DB60;
db $40,$FF,$10,$02,$02,$20,$62,$65   ;C3DB0C|        |      ;
db $72,$5B,$68,$72,$74,$20,$0D,$B7   ;C3DB14|        |00005B;
db $6B,$6C,$65,$69,$6E,$65,$6E,$20   ;C3DB1C|        |      ;
db $56,$6F,$67,$65,$6C,$20,$DA,$0D   ;C3DB24|        |00006F;
db $BB,$54,$72,$61,$75,$6D,$73,$74   ;C3DB2C|        |      ;
db $61,$62,$2E,$13,$40,$FF,$10,$87   ;C3DB34|        |000062;
db $46,$6C,$2A,$25,$65,$20,$F5,$E1   ;C3DB3C|        |00006C;
db $0D,$B5,$42,$65,$77,$6F,$68,$6E   ;C3DB44|        |0042B5;
db $65,$72,$20,$EE,$0D,$47,$72,$65   ;C3DB4C|        |000072;
db $65,$6E,$20,$57,$6F,$6F,$64,$20   ;C3DB54|        |00006E;
db $74,$72,$61,$67,$65,$6E,$2E,$11   ;C3DB5C|        |000072;
db $A8,$83,$ED,$C2,$0D,$62,$72,$69   ;C3DB64|        |      ;
db $6E,$67,$73,$74,$2C,$20,$F9,$C4   ;C3DB6C|        |007367;
db $0D,$54,$75,$72,$62,$6F,$20,$67   ;C3DB74|        |007554;
db $65,$68,$2A,$72,$74,$20,$68,$61   ;C3DB7C|        |000068;
db $74,$2C,$68,$65,$6C,$2D,$0D,$66   ;C3DB84|        |00002C;
db $65,$6E,$20,$77,$69,$72,$20,$84   ;C3DB8C|        |00006E;
db $76,$69,$65,$6C,$6C,$65,$69,$63   ;C3DB94|        |000069;
db $68,$74,$11,$4D,$61,$6E,$20,$CF   ;C3DB9C|        |      ;
db $BE,$E4,$0D,$42,$6C,$7B,$74,$74   ;C3DBA4|        |000DE4;
db $65,$72,$20,$EE,$47,$72,$65,$65   ;C3DBAC|        |000072;
db $6E,$20,$57,$6F,$6F,$64,$20,$0D   ;C3DBB4|        |005720;
db $FF,$DA,$54,$75,$72,$62,$6F,$20   ;C3DBBC|        |7554DA;
db $62,$65,$2D,$0D,$67,$72,$61,$62   ;C3DBC4|        |C3092C;
db $65,$6E,$2E,$13,$40,$FF,$10,$0E   ;C3DBCC|        |00006E;
db $3C,$44,$61,$20,$D2,$BE,$56,$6F   ;C3DBD4|        |006144;
db $67,$65,$6C,$2C,$20,$B6,$0D,$76   ;C3DBDC|        |000065;
db $6F,$72,$20,$54,$75,$72,$62,$6F   ;C3DBE4|        |542072;
db $60,$73,$20,$47,$72,$61,$62,$73   ;C3DBEC|        |      ;
db $74,$65,$69,$6E,$20,$0D,$73,$63   ;C3DBF4|        |000065;
db $68,$6C,$7B,$66,$74,$2E,$13,$40   ;C3DBFC|        |      ;
db $FF,$10,$0F,$54,$75,$72,$62,$6F   ;C3DC04|        |540F10;
db $60,$73,$20,$47,$72,$61,$62,$20   ;C3DC0C|        |      ;
db $6C,$69,$65,$67,$74,$20,$0D,$C2   ;C3DC14|        |006569;
db $41,$62,$73,$65,$69,$74,$73,$2E   ;C3DC1C|        |000062;
db $0D,$0E,$5A,$41,$6C,$73,$20,$02   ;C3DC24|        |005A0E;
db $02,$20,$73,$65,$69,$6E,$65,$20   ;C3DC2C|        |      ;
db $0D,$41,$75,$67,$65,$6E,$20,$73   ;C3DC34|        |007541;
db $63,$68,$6C,$69,$65,$25,$74,$2C   ;C3DC3C|        |000068;
db $20,$76,$65,$72,$2D,$0D,$73,$75   ;C3DC44|        |C36576;
db $63,$68,$74,$20,$C8,$E5,$54,$75   ;C3DC4C|        |000068;
db $72,$62,$6F,$20,$0D,$76,$6F,$72   ;C3DC54|        |000062;
db $7A,$75,$73,$74,$65,$6C,$6C,$65   ;C3DC5C|        |      ;
db $6E,$2E,$0E,$78,$13,$41,$FF,$10   ;C3DC64|        |000E2E;
db $0F,$47,$65,$6E,$61,$75,$20,$F6   ;C3DC6C|        |6E6547;
db $65,$72,$68,$6F,$6C,$73,$61,$6D   ;C3DC74|        |000072;
db $65,$72,$20,$0D,$53,$63,$68,$6C   ;C3DC7C|        |000072;
db $61,$66,$20,$E3,$68,$61,$72,$74   ;C3DC84|        |000066;
db $65,$72,$20,$41,$72,$2D,$0D,$62   ;C3DC8C|        |000072;
db $65,$69,$74,$20,$6B,$6F,$6D,$6D   ;C3DC94|        |000069;
db $74,$2C,$20,$6B,$6F,$6D,$6D,$74   ;C3DC9C|        |00002C;
db $20,$65,$72,$2D,$0D,$68,$6F,$6C   ;C3DCA4|        |C37265;
db $73,$61,$6D,$65,$20,$52,$75,$68   ;C3DCAC|        |000061;
db $65,$20,$E3,$0D,$0E,$5A,$65,$68   ;C3DCB4|        |000020;
db $72,$6C,$69,$63,$68,$65,$6D,$20   ;C3DCBC|        |00006C;
db $4C,$65,$62,$65,$6E,$2E,$0D,$0E   ;C3DCC4|        |C36265;
db $5A,$8F,$F2,$67,$75,$74,$20,$72   ;C3DCCC|        |      ;
db $75,$68,$65,$6E,$20,$0D,$DA,$44   ;C3DCD4|        |000068;
db $72,$2E,$4C,$65,$6F,$2E,$0E,$78   ;C3DCDC|        |00002E;
db $13,$41,$FF                       ;C3DCE4|        |000041;
COP #$14                             ;C3DCE7|0214    |      ;
db $4E,$00,$EE,$DC                   ;C3DCE9|        |00EE00;
RTL                                  ;C3DCED|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$27   ;C3DCEE|        |      ;
db $DD,$02,$A4,$02,$07,$05,$83,$07   ;C3DCF6|        |00A402;
db $DD,$02,$91,$02,$80,$21,$02,$82   ;C3DCFE|        |009102;
db $6B,$02,$16,$02,$17,$00,$00,$02   ;C3DD06|        |      ;
db $03,$0A,$02,$80,$21,$02,$82,$02   ;C3DD0E|        |00000A;
db $0C,$00,$00,$1E,$DD,$82,$EF,$FF   ;C3DD16|        |000000;
db $02,$04,$02,$01,$AA,$DD,$82,$E6   ;C3DD1E|        |      ;
db $FF,$02,$01,$4F,$DD,$02,$1A,$BB   ;C3DD26|        |4F0102;
db $D0,$02,$4A,$DD,$AF,$D2,$03,$00   ;C3DD2E|        |C3DD32;
db $D0,$12,$02,$01,$7C,$DD,$02,$09   ;C3DD36|        |C3DD4A;
db $05,$83,$02,$16,$02,$17,$00,$00   ;C3DD3E|        |000083;
db $02,$27,$0D,$DD,$02,$01,$9C,$DD   ;C3DD46|        |      ;
db $6B,$10,$57,$65,$72,$20,$B4,$44   ;C3DD4E|        |      ;
db $75,$3F,$0D,$56,$65,$72,$73,$75   ;C3DD56|        |00003F;
db $63,$68,$73,$74,$20,$83,$5B,$62   ;C3DD5E|        |000068;
db $65,$72,$20,$D9,$0D,$64,$72,$5B   ;C3DD66|        |000072;
db $62,$65,$72,$7A,$75,$6C,$61,$75   ;C3DD6E|        |C34FD6;
db $66,$65,$6E,$21,$3F,$0C,$83,$CD   ;C3DD76|        |000065;
db $4E,$65,$72,$76,$65,$6E,$21,$0D   ;C3DD7E|        |007265;
db $4F,$6B,$61,$79,$2C,$20,$AB,$74   ;C3DD86|        |79616B;
db $75,$60,$20,$DB,$0D,$DF,$77,$65   ;C3DD8E|        |000060;
db $68,$60,$2E,$13,$40,$FF,$83,$57   ;C3DD96|        |      ;
db $65,$69,$63,$68,$6C,$69,$6E,$67   ;C3DD9E|        |000069;
db $21,$13,$40,$FF,$10,$48,$65,$79   ;C3DDA6|        |000013;
db $2C,$20,$83,$74,$75,$73,$74,$20   ;C3DDAE|        |008320;
db $DB,$77,$65,$68,$60,$2E,$13,$40   ;C3DDB6|        |      ;
db $FF                               ;C3DDBE|        |5B1402;
COP #$14                             ;C3DDBF|0214    |      ;
db $5B,$00,$C6,$DD                   ;C3DDC1|        |      ;
RTL                                  ;C3DDC5|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$A4,$02   ;C3DDC6|        |      ;
db $16,$02,$91,$02,$80,$21,$02,$82   ;C3DDCE|        |000002;
db $6B                               ;C3DDD6|        |      ;
COP #$14                             ;C3DDD7|0214    |      ;
db $6F,$00,$DE,$DD                   ;C3DDD9|        |DDDE00;
RTL                                  ;C3DDDD|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$A4,$02   ;C3DDDE|        |      ;
db $16,$02,$91,$02,$80,$21,$02,$82   ;C3DDE6|        |000002;
db $6B                               ;C3DDEE|        |      ;
COP #$14                             ;C3DDEF|0214    |      ;
db $3D,$00,$F6,$DD                   ;C3DDF1|        |00F600;
RTL                                  ;C3DDF5|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$63   ;C3DDF6|        |      ;
db $DE,$02,$15,$02,$91,$6B,$02,$17   ;C3DDFE|        |001502;
db $6B,$DE,$02,$16,$02,$80,$0F,$02   ;C3DE06|        |      ;
db $82,$02,$9D,$0F,$02,$9E,$16,$DE   ;C3DE0E|        |C37B13;
db $02,$87,$02,$81,$11,$08,$02,$83   ;C3DE16|        |      ;
db $02,$80,$0E,$02,$82,$02,$17,$70   ;C3DE1E|        |      ;
db $DE,$02,$15,$02,$91,$6B,$02,$16   ;C3DE26|        |001502;
db $02,$17,$78,$DE,$02,$81,$10,$06   ;C3DE2E|        |      ;
db $02,$83,$02,$81,$11,$02,$02,$83   ;C3DE36|        |      ;
db $02,$80,$10,$02,$82,$02,$80,$0D   ;C3DE3E|        |      ;
db $02,$82,$02,$17,$7D,$DE,$02,$15   ;C3DE46|        |      ;
db $02,$91,$02,$0D,$00,$1D,$09,$58   ;C3DE4E|        |      ;
db $DE,$6B,$02,$01,$72,$DF,$02,$09   ;C3DE56|        |00026B;
db $01,$80,$02,$91,$6B,$02,$01,$8D   ;C3DE5E|        |000080;
db $DE,$02,$27,$04,$DE,$02,$01,$8D   ;C3DE66|        |002702;
db $DE,$6B,$02,$01,$C9,$DE,$02,$27   ;C3DE6E|        |00026B;
db $2C,$DE,$02,$01,$3D,$DF,$6B,$02   ;C3DE76|        |0002DE;
db $07,$01,$80,$88,$DE,$02,$01,$41   ;C3DE7E|        |000001;
db $DF,$6B,$02,$01,$87,$DF,$6B,$10   ;C3DE86|        |01026B;
db $8F,$D7,$C2,$61,$6D,$20,$47,$65   ;C3DE8E|        |61C2D7;
db $2D,$0D,$72,$75,$63,$68,$20,$65   ;C3DE96|        |00720D;
db $72,$6B,$65,$6E,$6E,$65,$6E,$2E   ;C3DE9E|        |00006B;
db $11,$4E,$61,$20,$67,$75,$74,$2C   ;C3DEA6|        |00004E;
db $20,$6C,$61,$25,$20,$D9,$61,$6E   ;C3DEAE|        |C3616C;
db $20,$0D,$B5,$41,$72,$62,$65,$69   ;C3DEB6|        |C3B50D;
db $74,$20,$67,$65,$68,$65,$6E,$2E   ;C3DEBE|        |000020;
db $13,$40,$FF,$10,$56,$6F,$6E,$20   ;C3DEC6|        |000040;
db $5E,$2C,$0D,$0E,$3C,$72,$69,$65   ;C3DECE|        |000D2C;
db $63,$68,$65,$20,$D1,$66,$72,$69   ;C3DED6|        |000068;
db $73,$63,$68,$65,$20,$0D,$4C,$75   ;C3DEDE|        |000063;
db $66,$74,$2E,$11,$56,$6F,$6E,$20   ;C3DEE6|        |000074;
db $7C,$2C,$0E,$3C,$72,$69,$65,$63   ;C3DEEE|        |C30E2C;
db $68,$65,$20,$D1,$C0,$0D,$4D,$61   ;C3DEF6|        |      ;
db $75,$6C,$77,$75,$72,$66,$2E,$11   ;C3DEFE|        |00006C;
db $57,$61,$73,$20,$D2,$B9,$C9,$BE   ;C3DF06|        |000061;
db $0D,$47,$65,$72,$75,$63,$68,$21   ;C3DF0E|        |006547;
db $21,$20,$8F,$0D,$72,$69,$65,$63   ;C3DF16|        |000020;
db $68,$65,$20,$C2,$73,$65,$6C,$74   ;C3DF1E|        |      ;
db $73,$61,$6D,$65,$73,$20,$0D,$AD   ;C3DF26|        |000061;
db $B6,$5C,$20,$52,$69,$63,$68,$74   ;C3DF2E|        |00005C;
db $75,$6E,$67,$2E,$13,$40,$FF,$10   ;C3DF36|        |00006E;
db $13,$0F,$DF,$10,$8C,$D2,$CE,$69   ;C3DF3E|        |00000F;
db $72,$67,$65,$6E,$64,$77,$6F,$2E   ;C3DF46|        |000067;
db $0D,$8F,$72,$69,$65,$63,$68,$65   ;C3DF4E|        |00728F;
db $20,$C2,$77,$69,$72,$6B,$2D,$0D   ;C3DF56|        |C377C2;
db $6C,$69,$63,$68,$20,$73,$6F,$6E   ;C3DF5E|        |006369;
db $64,$65,$72,$62,$61,$72,$65,$73   ;C3DF66|        |000065;
db $21,$13,$40,$FF,$10,$48,$69,$65   ;C3DF6E|        |000013;
db $72,$20,$D2,$BF,$0D,$54,$6F,$69   ;C3DF76|        |000020;
db $6C,$65,$74,$74,$65,$2E,$13,$40   ;C3DF7E|        |007465;
db $FF,$10,$4F,$68,$2C,$20,$64,$69   ;C3DF86|        |684F10;
db $65,$73,$20,$D2,$75,$6E,$73,$65   ;C3DF8E|        |000073;
db $72,$20,$0D,$42,$61,$64,$65,$7A   ;C3DF96|        |000020;
db $69,$6D,$6D,$65,$72,$2E,$11,$44   ;C3DF9E|        |      ;
db $61,$6E,$6B,$65,$2C,$BA,$83,$DA   ;C3DFA6|        |00006E;
db $DB,$0D,$67,$65,$6C,$61,$75,$66   ;C3DFAE|        |      ;
db $65,$6E,$20,$62,$69,$73,$74,$2E   ;C3DFB6|        |00006E;
db $20,$8F,$0D,$F2,$84,$BE,$47,$65   ;C3DFBE|        |C30D8F;
db $68,$65,$69,$6D,$2D,$0D,$6E,$69   ;C3DFC6|        |      ;
db $25,$20,$65,$72,$7A,$7B,$68,$6C   ;C3DFCE|        |000020;
db $65,$6E,$2E,$11,$8F,$D7,$BF,$9D   ;C3DFD6|        |00006E;
db $0D,$6E,$2A,$72,$64,$6C,$69,$63   ;C3DFDE|        |002A6E;
db $68,$20,$EE,$CE,$0D,$72,$69,$65   ;C3DFE6|        |      ;
db $63,$68,$65,$6E,$2E,$13,$40,$FF   ;C3DFEE|        |000068;
COP #$14                             ;C3DFF6|0214    |      ;
db $59,$00,$FD,$DF                   ;C3DFF8|        |00FD00;
RTL                                  ;C3DFFC|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$69   ;C3DFFD|        |      ;
db $E0,$02,$15,$02,$91,$02,$14,$56   ;C3E005|        |      ;
db $00,$11,$E0,$6B,$02,$17,$5C,$E0   ;C3E00D|        |      ;
db $02,$91,$6B,$02,$16,$02,$17,$64   ;C3E015|        |      ;
db $E0,$02,$9C,$24,$E0,$40,$E0,$02   ;C3E01D|        |      ;
db $9A,$10,$00,$2E,$E0,$40,$E0,$37   ;C3E025|        |      ;
db $E0,$02,$97,$02,$80,$05,$02,$82   ;C3E02D|        |      ;
db $80,$E7,$02,$96,$02,$80,$05,$02   ;C3E035|        |C3E01E;
db $82,$80,$DE,$02,$9B,$10,$00,$4A   ;C3E03D|        |C3BEC0;
db $E0,$58,$E0,$51,$E0,$02,$80,$04   ;C3E045|        |      ;
db $02,$82,$80,$CD,$02,$80,$03,$02   ;C3E04D|        |      ;
db $82,$80,$C6,$02,$27,$1E,$E0,$02   ;C3E055|        |C3A6D8;
db $01,$6E,$E0,$02,$27,$18,$E0,$02   ;C3E05D|        |00006E;
db $01,$9C,$E0,$6B,$02,$01,$C9,$E0   ;C3E065|        |00009C;
db $6B,$10,$8F,$6D,$75,$25,$20,$C0   ;C3E06D|        |      ;
db $53,$70,$61,$7A,$69,$65,$72,$2D   ;C3E075|        |000070;
db $0D,$67,$61,$6E,$67,$20,$6D,$61   ;C3E07D|        |006167;
db $63,$68,$65,$6E,$2C,$20,$EC,$C2   ;C3E085|        |000068;
db $0D,$61,$62,$7A,$75,$6E,$65,$68   ;C3E08D|        |006261;
db $6D,$65,$6E,$2E,$13,$40,$FF,$10   ;C3E095|        |006E65;
db $3C,$57,$61,$72,$75,$6D,$20,$D1   ;C3E09D|        |006157;
db $84,$66,$6F,$6C,$67,$65,$3F,$3E   ;C3E0A5|        |000066;
db $20,$0D,$4E,$75,$6E,$2E,$2E,$2E   ;C3E0AD|        |C34E0D;
db $C3,$D2,$70,$75,$72,$65,$72,$20   ;C3E0B5|        |0000D2;
db $5A,$75,$2D,$0D,$66,$61,$6C,$6C   ;C3E0BD|        |      ;
db $2E,$13,$40,$FF,$10,$8F,$76,$65   ;C3E0C5|        |004013;
db $72,$68,$75,$6E,$67,$65,$72,$65   ;C3E0CD|        |000068;
db $21,$20,$48,$69,$65,$72,$20,$0D   ;C3E0D5|        |000020;
db $FC,$C4,$BE,$52,$65,$73,$74,$61   ;C3E0DD|        |C3BEC4;
db $75,$2D,$0D,$72,$61,$6E,$74,$2E   ;C3E0E5|        |00002D;
db $13,$40,$FF                       ;C3E0ED|        |000040;
COP #$3B                             ;C3E0F0|023B    |      ;
db $5D,$00,$06,$E1,$02,$17,$70,$C0   ;C3E0F2|        |000600;
db $E2,$20,$A9,$80,$48,$C2,$20,$A9   ;C3E0FA|        |      ;
db $96,$B0,$48,$6B,$02,$85,$C9,$A9   ;C3E102|        |0000B0;
db $80,$02,$15,$02,$17,$89,$E1,$02   ;C3E10A|        |C3E10E;
db $91,$02,$14,$4A,$00,$1A,$E1,$6B   ;C3E112|        |000002;
db $02,$14,$3F,$00,$21,$E1,$6B,$02   ;C3E11A|        |      ;
db $17,$8E,$E1,$02,$05,$05,$00,$02   ;C3E122|        |00008E;
db $09,$05,$00,$02,$16,$02,$81,$04   ;C3E12A|        |      ;
db $02,$02,$83,$02,$80,$00,$02,$82   ;C3E132|        |      ;
db $02,$17,$9B,$E1,$02,$15,$6B,$02   ;C3E13A|        |      ;
db $16,$02,$17,$00,$00,$02,$81,$05   ;C3E142|        |000002;
db $03,$02,$83,$02,$80,$03,$02,$82   ;C3E14A|        |000002;
db $02,$09,$06,$00,$02,$87,$02,$81   ;C3E152|        |      ;
db $05,$06,$02,$83,$02,$80,$04,$02   ;C3E15A|        |000006;
db $82,$02,$87,$02,$81,$05,$03,$02   ;C3E162|        |C36867;
db $83,$02,$87,$02,$81,$05,$03,$02   ;C3E16A|        |000002;
db $83,$02,$80,$00,$02,$82,$02,$15   ;C3E172|        |000002;
db $02,$17,$AC,$E1,$02,$05,$07,$00   ;C3E17A|        |      ;
db $02,$17,$B9,$E1,$02,$91,$6B,$02   ;C3E182|        |      ;
db $01,$DF,$E1,$6B,$02,$01,$27,$E2   ;C3E18A|        |0000DF;
db $02,$17,$00,$00,$02,$09,$03,$80   ;C3E192|        |      ;
db $6B,$02,$01,$B7,$E2,$02,$09,$06   ;C3E19A|        |      ;
db $80,$02,$27,$41,$E1,$02,$01,$9E   ;C3E1A2|        |C3E1A6;
db $E3,$6B,$02,$01,$BC,$E5,$02,$09   ;C3E1AA|        |00006B;
db $00,$80,$02,$09,$07,$80,$6B,$02   ;C3E1B2|        |      ;
db $07,$06,$80,$D1,$E1,$02,$09,$06   ;C3E1BA|        |000006;
db $80,$02,$01,$9E,$E3,$00,$5E,$02   ;C3E1C2|        |C3E1C6;
db $0A,$38,$02,$17,$DA,$E1,$6B,$02   ;C3E1CA|        |      ;
db $01,$DE,$E3,$02,$17,$DA,$E1,$6B   ;C3E1D2|        |0000DE;
db $02,$01,$02,$E6,$6B,$10,$8F,$B1   ;C3E1DA|        |      ;
db $41,$6C,$65,$78,$2C,$20,$B6,$42   ;C3E1E2|        |00006C;
db $6F,$73,$73,$20,$0D,$B8,$3C,$57   ;C3E1EA|        |207373;
db $6F,$6F,$64,$73,$74,$69,$6E,$2D   ;C3E1F2|        |73646F;
db $54,$72,$69,$6F,$73,$3E,$2E,$0D   ;C3E1FA|        |      ;
db $55,$6E,$73,$65,$72,$65,$20,$53   ;C3E202|        |00006E;
db $68,$6F,$77,$20,$D2,$77,$69,$72   ;C3E20A|        |      ;
db $6B,$2D,$0D,$6C,$69,$63,$68,$20   ;C3E212|        |      ;
db $61,$75,$66,$72,$65,$67,$65,$6E   ;C3E21A|        |000075;
db $64,$21,$13,$40,$FF,$10,$87,$42   ;C3E222|        |000021;
db $61,$6E,$64,$20,$D2,$F4,$0D,$7A   ;C3E22A|        |00006E;
db $75,$73,$61,$6D,$6D,$65,$6E,$2C   ;C3E232|        |000073;
db $20,$61,$6C,$73,$6F,$20,$6C,$61   ;C3E23A|        |C36C61;
db $25,$74,$20,$0D,$ED,$61,$6E,$66   ;C3E242|        |000074;
db $61,$6E,$67,$65,$6E,$21,$11,$41   ;C3E24A|        |00006E;
db $75,$63,$68,$20,$F3,$83,$75,$6E   ;C3E252|        |000063;
db $73,$65,$72,$20,$0D,$65,$69,$6E   ;C3E25A|        |000065;
db $7A,$69,$67,$65,$72,$20,$5A,$75   ;C3E262|        |      ;
db $73,$63,$68,$61,$75,$65,$72,$20   ;C3E26A|        |000063;
db $0D,$62,$69,$73,$74,$2C,$20,$F5   ;C3E272|        |006962;
db $77,$69,$72,$20,$75,$6E,$73,$65   ;C3E27A|        |000069;
db $72,$20,$0D,$42,$65,$73,$74,$65   ;C3E282|        |000020;
db $73,$20,$67,$65,$62,$65,$6E,$2E   ;C3E28A|        |000020;
db $11,$42,$65,$61,$63,$68,$74,$65   ;C3E292|        |000042;
db $20,$B2,$B5,$0D,$62,$65,$69,$64   ;C3E29A|        |C3B5B2;
db $65,$6E,$20,$61,$6E,$64,$65,$72   ;C3E2A2|        |00006E;
db $65,$6E,$20,$4A,$75,$6E,$67,$73   ;C3E2AA|        |00006E;
db $60,$2E,$13,$40,$FF,$10,$48,$61   ;C3E2B2|        |      ;
db $74,$20,$C3,$84,$67,$65,$66,$61   ;C3E2BA|        |000020;
db $6C,$6C,$65,$6E,$3F,$11,$42,$65   ;C3E2C2|        |00656C;
db $69,$20,$75,$6E,$73,$65,$72,$65   ;C3E2CA|        |      ;
db $72,$20,$6E,$7B,$63,$68,$73,$74   ;C3E2D2|        |000020;
db $65,$6E,$20,$0D,$4E,$75,$6D,$6D   ;C3E2DA|        |00006E;
db $65,$72,$2C,$20,$6D,$75,$25,$74   ;C3E2E2|        |000072;
db $20,$83,$B9,$0D,$72,$69,$63,$68   ;C3E2EA|        |C3B983;
db $74,$69,$67,$65,$20,$45,$69,$63   ;C3E2F2|        |000069;
db $68,$68,$2A,$72,$6E,$63,$68,$65   ;C3E2FA|        |      ;
db $6E,$20,$0D,$65,$72,$72,$61,$74   ;C3E302|        |000D20;
db $65,$6E,$2E,$20,$4D,$69,$63,$68   ;C3E30A|        |00006E;
db $21,$11,$AA,$F5,$ED,$62,$65,$2D   ;C3E312|        |000011;
db $0D,$77,$65,$67,$65,$6E,$2C,$20   ;C3E31A|        |006577;
db $EB,$F3,$83,$B7,$0D,$72,$69,$63   ;C3E322|        |      ;
db $68,$74,$69,$67,$65,$6E,$20,$66   ;C3E32A|        |      ;
db $69,$6E,$64,$65,$73,$74,$2C,$20   ;C3E332|        |      ;
db $67,$65,$2D,$0D,$77,$69,$6E,$6E   ;C3E33A|        |000065;
db $73,$74,$20,$83,$C0,$50,$72,$65   ;C3E342|        |000074;
db $69,$73,$2E,$11,$52,$65,$64,$65   ;C3E34A|        |      ;
db $20,$DA,$64,$65,$6D,$6A,$65,$6E   ;C3E352|        |C364DA;
db $69,$67,$65,$6E,$2C,$0D,$EE,$BB   ;C3E35A|        |      ;
db $83,$61,$6E,$6E,$69,$6D,$6D,$73   ;C3E362|        |000061;
db $74,$2C,$0D,$BA,$C8,$B9,$72,$69   ;C3E36A|        |00002C;
db $63,$68,$74,$69,$67,$65,$20,$0D   ;C3E372|        |000068;
db $45,$69,$63,$68,$68,$2A,$72,$6E   ;C3E37A|        |000069;
db $63,$68,$65,$6E,$20,$69,$73,$74   ;C3E382|        |000068;
db $2E,$11,$55,$6E,$64,$20,$6C,$6F   ;C3E38A|        |005511;
db $73,$20,$67,$65,$68,$74,$60,$73   ;C3E392|        |000020;
db $21,$13,$40,$FF,$10,$83,$CD,$52   ;C3E39A|        |000013;
db $65,$63,$68,$74,$21,$21,$0D,$4F   ;C3E3A2|        |000063;
db $6B,$61,$79,$2C,$20,$D1,$F2,$84   ;C3E3AA|        |      ;
db $0D,$BE,$47,$65,$73,$63,$68,$65   ;C3E3B2|        |0047BE;
db $6E,$6B,$20,$67,$65,$62,$65,$6E   ;C3E3BA|        |00206B;
db $2E,$11,$02,$02,$20,$C1,$0D,$03   ;C3E3C2|        |000211;
db $24,$BE,$E4,$48,$65,$69,$6C,$6B   ;C3E3CA|        |0000BE;
db $72,$7B,$75,$74,$65,$72,$2E,$03   ;C3E3D2|        |00007B;
db $20,$13,$40,$FF,$10,$4C,$65,$69   ;C3E3DA|        |C34013;
db $64,$65,$72,$20,$6E,$65,$69,$6E   ;C3E3E2|        |000065;
db $2E,$20,$56,$65,$72,$73,$75,$63   ;C3E3EA|        |005620;
db $68,$60,$73,$20,$0D,$AB,$64,$6F   ;C3E3F2|        |      ;
db $63,$68,$20,$62,$61,$6C,$64,$20   ;C3E3FA|        |000068;
db $6E,$6F,$63,$68,$2D,$0D,$65,$69   ;C3E402|        |00636F;
db $6E,$6D,$61,$6C,$2E,$0D,$13,$40   ;C3E40A|        |00616D;
db $FF                               ;C3E412|        |3F3B02;
COP #$3B                             ;C3E413|023B    |      ;
db $3F,$00,$29,$E4,$02,$17,$70,$C0   ;C3E415|        |E42900;
db $E2,$20,$A9,$80,$48,$C2,$20,$A9   ;C3E41D|        |      ;
db $96,$B0,$48,$6B,$02,$85,$C9,$A9   ;C3E425|        |0000B0;
db $80,$02,$17,$05,$E5,$02,$15,$02   ;C3E42D|        |C3E431;
db $91,$02,$14,$5D,$00,$3D,$E4,$6B   ;C3E435|        |000002;
db $02,$14,$4A,$00,$44,$E4,$6B,$02   ;C3E43D|        |      ;
db $17,$0A,$E5,$02,$05,$04,$00,$02   ;C3E445|        |00000A;
db $16,$02,$17,$00,$00,$02,$A1,$08   ;C3E44D|        |000002;
db $00,$08,$00,$02,$81,$0C,$03,$02   ;C3E455|        |      ;
db $83,$02,$A1,$F8,$FF,$F8,$FF,$02   ;C3E45D|        |000002;
db $87,$02,$81,$0E,$03,$02,$83,$02   ;C3E465|        |000002;
db $87,$02,$A1,$08,$00,$08,$00,$02   ;C3E46D|        |000002;
db $81,$0D,$03,$02,$83,$02,$A1,$F8   ;C3E475|        |00000D;
db $FF,$F8,$FF,$02,$81,$0E,$03,$02   ;C3E47D|        |02FFF8;
db $83,$02,$9F,$10,$00,$02,$85,$C9   ;C3E485|        |000002;
db $A9,$80,$00,$4E,$02,$80,$02,$02   ;C3E48D|        |      ;
db $82,$02,$1B,$9C,$E4,$3C,$00,$02   ;C3E495|        |C3FF9A;
db $09,$05,$80,$02,$80,$00,$02,$82   ;C3E49D|        |      ;
db $02,$15,$02,$17,$0A,$E5,$02,$05   ;C3E4A5|        |      ;
db $06,$00,$02,$16,$02,$17,$00,$00   ;C3E4AD|        |000000;
db $02,$80,$03,$02,$82,$02,$81,$05   ;C3E4B5|        |      ;
db $06,$02,$83,$02,$80,$04,$02,$82   ;C3E4BD|        |000002;
db $02,$87,$02,$81,$05,$03,$02,$83   ;C3E4C5|        |      ;
db $02,$80,$03,$02,$82,$02,$80,$05   ;C3E4CD|        |      ;
db $02,$82,$02,$87,$02,$80,$05,$02   ;C3E4D5|        |      ;
db $82,$02,$80,$04,$02,$82,$02,$80   ;C3E4DD|        |C364E2;
db $00,$02,$82,$02,$15,$02,$17,$0F   ;C3E4E5|        |      ;
db $E5,$02,$05,$07,$00,$02,$85,$C9   ;C3E4ED|        |000002;
db $A9,$80,$00,$4E,$02,$80,$0C,$02   ;C3E4F5|        |      ;
db $82,$02,$17,$1C,$E5,$02,$91,$6B   ;C3E4FD|        |C3FC02;
db $02,$01,$30,$E5,$6B,$02,$01,$A6   ;C3E505|        |      ;
db $E5,$6B,$02,$01,$BC,$E5,$02,$09   ;C3E50D|        |00006B;
db $06,$80,$02,$09,$07,$80,$6B,$02   ;C3E515|        |000080;
db $07,$00,$80,$2B,$E5,$02,$01,$EC   ;C3E51D|        |000000;
db $E5,$02,$17,$2B,$E5,$6B,$02,$01   ;C3E525|        |000002;
db $02,$E6,$6B,$10,$8F,$B1,$BE,$4D   ;C3E52D|        |      ;
db $69,$74,$67,$6C,$69,$65,$64,$20   ;C3E535|        |      ;
db $0D,$B8,$3C,$57,$6F,$6F,$64,$73   ;C3E53D|        |003CB8;
db $74,$69,$6E,$2D,$54,$72,$69,$6F   ;C3E545|        |000069;
db $73,$3E,$2E,$0D,$AA,$6D,$61,$63   ;C3E54D|        |00003E;
db $68,$65,$6E,$20,$CE,$D4,$0D,$BF   ;C3E555|        |      ;
db $6B,$6C,$65,$69,$6E,$65,$20,$53   ;C3E55D|        |      ;
db $68,$6F,$77,$2E,$11,$8F,$62,$72   ;C3E565|        |      ;
db $61,$75,$63,$68,$65,$20,$E0,$B5   ;C3E56D|        |000075;
db $0D,$61,$6E,$64,$65,$72,$65,$6E   ;C3E575|        |006E61;
db $20,$7A,$77,$65,$69,$20,$42,$61   ;C3E57D|        |C3777A;
db $6E,$64,$2D,$0D,$6D,$69,$74,$67   ;C3E585|        |002D64;
db $6C,$69,$65,$64,$65,$72,$2C,$20   ;C3E58D|        |006569;
db $EC,$61,$6E,$7A,$75,$2D,$0D,$66   ;C3E595|        |006E61;
db $61,$6E,$67,$65,$6E,$2E,$13,$40   ;C3E59D|        |00006E;
db $FF,$10,$48,$65,$79,$2C,$20,$6C   ;C3E5A5|        |654810;
db $61,$75,$66,$60,$20,$CE,$DF,$0D   ;C3E5AD|        |000075;
db $72,$75,$6D,$2E,$13,$40,$FF,$10   ;C3E5B5|        |000075;
db $4F,$6B,$61,$79,$2C,$20,$6C,$61   ;C3E5BD|        |79616B;
db $25,$20,$6D,$61,$6C,$20,$73,$65   ;C3E5C5|        |000020;
db $68,$60,$6E,$2C,$0D,$6F,$62,$20   ;C3E5CD|        |      ;
db $D1,$77,$69,$72,$6B,$6C,$69,$63   ;C3E5D5|        |000077;
db $68,$20,$41,$6C,$65,$78,$20,$0D   ;C3E5DD|        |      ;
db $62,$69,$6E,$2E,$13,$40,$FF,$10   ;C3E5E5|        |C35451;
db $53,$6F,$20,$BE,$50,$65,$63,$68   ;C3E5ED|        |00006F;
db $2C,$20,$62,$65,$69,$6E,$61,$68   ;C3E5F5|        |006220;
db $65,$2E,$13,$40,$FF,$10,$8F,$68   ;C3E5FD|        |00002E;
db $6F,$66,$66,$65,$20,$84,$CF,$0D   ;C3E605|        |656666;
db $75,$6E,$73,$65,$72,$65,$20,$53   ;C3E60D|        |00006E;
db $68,$6F,$77,$20,$67,$65,$66,$61   ;C3E615|        |      ;
db $6C,$6C,$65,$6E,$2E,$0D,$42,$69   ;C3E61D|        |00656C;
db $73,$20,$73,$70,$7B,$74,$65,$72   ;C3E625|        |000020;
db $2E,$13,$40,$FF                   ;C3E62D|        |004013;
COP #$14                             ;C3E631|0214    |      ;
db $50,$00,$38,$E6                   ;C3E633|        |C3E635;
RTL                                  ;C3E637|6B      |      ;
db $02,$30,$50,$00,$69,$E6,$83,$02   ;C3E638|        |      ;
db $91,$02,$0D,$00,$17,$0D,$49,$E6   ;C3E640|        |000002;
db $6B,$02,$07,$07,$85,$66,$E6,$02   ;C3E648|        |      ;
db $1B,$55,$E6,$02,$00,$02,$01,$72   ;C3E650|        |      ;
db $E6,$00,$5E,$02,$0A,$3B,$02,$09   ;C3E658|        |000000;
db $07,$85,$02,$09,$01,$9B,$02,$91   ;C3E660|        |000085;
db $6B,$02,$01,$28,$E7,$02,$37,$02   ;C3E668|        |      ;
db $86,$6B,$10,$8F,$B1,$B6,$57,$7B   ;C3E670|        |00006B;
db $63,$68,$74,$65,$72,$20,$0D,$B8   ;C3E678|        |000068;
db $57,$61,$6C,$64,$65,$73,$2E,$11   ;C3E680|        |000061;
db $8F,$62,$65,$6F,$62,$61,$63,$68   ;C3E688|        |6F6562;
db $74,$65,$20,$BC,$0D,$A9,$EA,$BF   ;C3E690|        |000065;
db $45,$77,$69,$67,$2D,$0D,$6B,$65   ;C3E698|        |000077;
db $69,$74,$2E,$11,$02,$02,$2C,$20   ;C3E6A0|        |      ;
db $BE,$48,$75,$6E,$64,$20,$0D,$E2   ;C3E6A8|        |007548;
db $54,$75,$72,$62,$6F,$20,$CF,$0D   ;C3E6B0|        |      ;
db $C2,$62,$65,$69,$20,$6D,$65,$69   ;C3E6B8|        |      ;
db $6E,$65,$6E,$20,$0D,$57,$75,$72   ;C3E6C0|        |006E65;
db $7A,$65,$6C,$6E,$20,$76,$65,$72   ;C3E6C8|        |      ;
db $67,$72,$61,$62,$65,$6E,$2E,$11   ;C3E6D0|        |000072;
db $83,$FA,$64,$69,$65,$73,$65,$6E   ;C3E6D8|        |0000FA;
db $20,$67,$72,$5B,$6E,$65,$6E,$20   ;C3E6E0|        |C37267;
db $0D,$A2,$C5,$A6,$0D,$62,$72,$61   ;C3E6E8|        |00C5A2;
db $75,$63,$68,$65,$6E,$2C,$20,$61   ;C3E6F0|        |000063;
db $6C,$73,$6F,$20,$6E,$69,$6D,$6D   ;C3E6F8|        |006F73;
db $60,$20,$0D,$69,$68,$6E,$20,$62   ;C3E700|        |      ;
db $69,$74,$74,$65,$2E,$11,$02,$02   ;C3E708|        |      ;
db $20,$C1,$0D,$03,$24,$B7,$67,$72   ;C3E710|        |C30DC1;
db $5B,$6E,$65,$6E,$20,$53,$74,$65   ;C3E718|        |      ;
db $69,$6E,$2E,$03,$20,$13,$40,$FF   ;C3E720|        |      ;
db $10,$0E,$3C,$8F,$B1,$B6,$57,$7B   ;C3E728|        |C3E738;
db $63,$68,$74,$65,$72,$20,$0D,$B8   ;C3E730|        |000068;
db $57,$61,$6C,$64,$65,$73,$2E,$20   ;C3E738|        |000061;
db $44,$61,$6E,$6B,$65,$2C,$20,$BA   ;C3E740|        |      ;
db $0D,$83,$D9,$62,$65,$66,$72,$65   ;C3E748|        |00D983;
db $69,$74,$20,$68,$61,$73,$74,$2E   ;C3E750|        |      ;
db $11,$8F,$F2,$84,$B7,$0D,$67,$72   ;C3E758|        |00008F;
db $5B,$6E,$65,$6E,$20,$A2,$67,$65   ;C3E760|        |      ;
db $62,$65,$6E,$2C,$0D,$F3,$83,$77   ;C3E768|        |C355D0;
db $69,$65,$64,$65,$72,$6B,$65,$68   ;C3E770|        |      ;
db $72,$73,$74,$2E,$13,$40,$FF       ;C3E778|        |000073;
RTL                                  ;C3E77F|6B      |      ;
COP #$14                             ;C3E780|0214    |      ;
db $64,$00,$87,$E7                   ;C3E782|        |000000;
RTL                                  ;C3E786|6B      |      ;
db $02,$85,$C9,$A9,$80,$02,$17,$A0   ;C3E787|        |      ;
db $E7,$02,$80,$1D,$02,$82,$02,$1B   ;C3E78F|        |000002;
db $9B,$E7,$28,$00,$02,$87,$82,$F0   ;C3E797|        |      ;
db $FF,$02,$01,$A5,$E7,$6B,$10,$8F   ;C3E79F|        |A50102;
db $CC,$EE,$B6,$9A,$0D,$B8,$50,$68   ;C3E7A7|        |00B6EE;
db $2A,$6E,$69,$78,$20,$67,$65,$68   ;C3E7AF|        |      ;
db $2A,$72,$74,$2C,$AF,$0D,$D1,$B5   ;C3E7B7|        |      ;
db $53,$65,$65,$6C,$65,$20,$B8,$0D   ;C3E7BF|        |000065;
db $42,$65,$72,$67,$65,$73,$20,$62   ;C3E7C7|        |      ;
db $65,$73,$75,$63,$68,$74,$20,$68   ;C3E7CF|        |000073;
db $61,$62,$65,$2E,$11,$A8,$83,$B5   ;C3E7D7|        |000062;
db $64,$72,$65,$69,$20,$53,$79,$6D   ;C3E7DF|        |000072;
db $62,$6F,$6C,$65,$0D,$65,$69,$6E   ;C3E7E7|        |C35459;
db $67,$65,$73,$61,$6D,$6D,$65,$6C   ;C3E7EF|        |000065;
db $74,$20,$68,$61,$73,$74,$2C,$0D   ;C3E7F7|        |000020;
db $73,$6F,$6C,$6C,$74,$65,$73,$74   ;C3E7FF|        |00006F;
db $20,$83,$B7,$91,$0D,$B8,$42,$65   ;C3E807|        |C3B783;
db $72,$67,$65,$73,$20,$62,$65,$73   ;C3E80F|        |000067;
db $75,$63,$68,$65,$6E,$2E,$13,$40   ;C3E817|        |000063;
db $FF,$02,$14,$49,$00,$27,$E8,$6B   ;C3E81F|        |491402;
db $02,$85,$AF,$E9,$83,$02,$17,$45   ;C3E827|        |      ;
db $E8,$02,$15,$02,$91,$02,$07,$03   ;C3E82F|        |      ;
db $83,$3B,$E8,$6B,$02,$16,$02,$85   ;C3E837|        |00003B;
db $C9,$A9,$80,$02,$86,$6B,$02,$01   ;C3E83F|        |      ;
db $6E,$E8,$E2,$20,$AD,$82,$1B,$09   ;C3E847|        |00E2E8;
db $02,$8D,$82,$1B,$C2,$20,$02,$09   ;C3E84F|        |      ;
db $03,$83,$02,$14,$4F,$00,$61,$E8   ;C3E857|        |000083;
db $80,$06,$02,$14,$51,$00,$6B,$E8   ;C3E85F|        |C3E867;
db $02,$01,$2B,$E9,$00,$4E,$6B,$10   ;C3E867|        |      ;
db $41,$75,$63,$68,$20,$F3,$D1,$DF   ;C3E86F|        |000075;
db $E9,$0D,$61,$75,$73,$73,$65,$68   ;C3E877|        |      ;
db $65,$2C,$20,$E9,$6B,$6F,$6D,$6D   ;C3E87F|        |00002C;
db $65,$20,$69,$63,$68,$2C,$0D,$67   ;C3E887|        |000020;
db $65,$6E,$61,$75,$20,$F6,$44,$75   ;C3E88F|        |00006E;
db $2C,$20,$B0,$F1,$0D,$48,$69,$6D   ;C3E897|        |00B020;
db $6D,$65,$6C,$2E,$11,$8F,$65,$72   ;C3E89F|        |006C65;
db $6C,$65,$75,$63,$68,$74,$65,$20   ;C3E8A7|        |007565;
db $B5,$20,$0D,$44,$75,$6E,$6B,$65   ;C3E8AF|        |000020;
db $6C,$68,$65,$69,$74,$2E,$0D,$83   ;C3E8B7|        |006568;
db $65,$72,$66,$72,$65,$75,$73,$74   ;C3E8BF|        |000072;
db $20,$6A,$65,$64,$65,$6E,$2E,$11   ;C3E8C7|        |C3656A;
db $4C,$61,$25,$20,$ED,$FF,$61,$6E   ;C3E8CF|        |C32561;
db $20,$0D,$B6,$57,$69,$65,$64,$65   ;C3E8D7|        |C3B60D;
db $72,$62,$65,$6C,$65,$62,$75,$6E   ;C3E8DF|        |000062;
db $67,$20,$B6,$0D,$A9,$61,$72,$62   ;C3E8E7|        |000020;
db $65,$69,$74,$65,$6E,$2E,$11,$8A   ;C3E8EF|        |000069;
db $57,$65,$73,$65,$6E,$2C,$20,$B9   ;C3E8F7|        |000065;
db $B5,$0D,$44,$75,$6E,$6B,$65,$6C   ;C3E8FF|        |00000D;
db $68,$65,$69,$74,$20,$65,$72,$68   ;C3E907|        |      ;
db $65,$6C,$6C,$74,$2C,$0D,$66,$6F   ;C3E90F|        |00006C;
db $6C,$67,$74,$20,$84,$EE,$6E,$75   ;C3E917|        |007467;
db $6E,$20,$61,$6E,$2E,$0D,$02,$02   ;C3E91F|        |006120;
db $21,$13,$40,$FF,$10,$0E,$3C,$28   ;C3E927|        |000013;
db $62,$72,$69,$67,$65,$6E,$73,$2C   ;C3E92F|        |C352A4;
db $20,$77,$61,$72,$75,$6D,$20,$67   ;C3E937|        |C36177;
db $65,$68,$65,$6E,$20,$0D,$77,$69   ;C3E93F|        |000068;
db $72,$20,$DF,$6D,$61,$6C,$20,$D3   ;C3E947|        |000020;
db $B9,$0D,$7A,$77,$65,$69,$74,$65   ;C3E94F|        |007A0D;
db $20,$55,$6E,$74,$65,$72,$67,$65   ;C3E957|        |C36E55;
db $73,$63,$68,$6F,$25,$20,$0D,$B8   ;C3E95F|        |000063;
db $57,$61,$73,$73,$65,$72,$74,$65   ;C3E967|        |000061;
db $6D,$70,$65,$6C,$73,$3F,$11,$83   ;C3E96F|        |006570;
db $FA,$6E,$75,$6E,$20,$D3,$B6,$0D   ;C3E977|        |      ;
db $4C,$61,$67,$65,$20,$73,$65,$69   ;C3E97F|        |C36761;
db $6E,$20,$95,$FD,$0D,$73,$65,$68   ;C3E987|        |009520;
db $65,$6E,$2C,$B5,$83,$6F,$68,$6E   ;C3E98F|        |00006E;
db $65,$20,$D9,$0D,$DF,$67,$65,$73   ;C3E997|        |000020;
db $65,$68,$65,$6E,$20,$68,$7B,$74   ;C3E99F|        |000068;
db $74,$65,$73,$74,$2E,$13,$40,$FF   ;C3E9A7|        |000065;
db $02,$07,$04,$03,$B8,$E9,$02,$86   ;C3E9AF|        |      ;
db $6B,$02,$91,$02,$0D,$00,$19,$19   ;C3E9B7|        |      ;
db $C2,$E9,$6B,$02,$01,$D2,$E9,$00   ;C3E9BF|        |      ;
db $5E,$02,$0A,$1E,$02,$09,$04,$83   ;C3E9C7|        |000A02;
db $02,$91,$6B,$10,$03,$24,$87,$42   ;C3E9CF|        |      ;
db $6C,$7B,$74,$74,$65,$72,$20,$EE   ;C3E9D7|        |00747B;
db $0D,$47,$72,$65,$65,$6E,$20,$57   ;C3E9DF|        |007247;
db $6F,$6F,$64,$20,$0D,$03,$20,$D7   ;C3E9E7|        |20646F;
db $6D,$61,$6E,$20,$75,$6E,$74,$65   ;C3E9EF|        |006E61;
db $72,$20,$B7,$0D,$48,$75,$6E,$64   ;C3E9F7|        |000020;
db $65,$6B,$6E,$6F,$63,$68,$65,$6E   ;C3E9FF|        |00006B;
db $20,$66,$69,$6E,$64,$65,$6E,$21   ;C3EA07|        |C36966;
db $13,$40,$FF                       ;C3EA0F|        |000040;
COP #$14                             ;C3EA12|0214    |      ;
db $49,$00,$19,$EA                   ;C3EA14|        |      ;
RTL                                  ;C3EA18|6B      |      ;
db $02,$30,$49,$00,$23,$EA,$83,$02   ;C3EA19|        |      ;
db $91,$6B,$02,$01,$2A,$EA,$02,$86   ;C3EA21|        |00006B;
db $6B,$10,$0E,$3C,$45,$69,$6E,$20   ;C3EA29|        |      ;
db $A0,$72,$75,$66,$74,$20,$0D,$02   ;C3EA31|        |      ;
db $02,$20,$AD,$0D,$BB,$4C,$6F,$63   ;C3EA39|        |      ;
db $68,$2E,$11,$8F,$B1,$B9,$57,$65   ;C3EA41|        |      ;
db $73,$65,$6E,$2C,$B9,$0D,$B6,$44   ;C3EA49|        |000065;
db $75,$6E,$6B,$65,$6C,$68,$65,$69   ;C3EA51|        |00006E;
db $74,$20,$4C,$69,$63,$68,$74,$20   ;C3EA59|        |000020;
db $0D,$62,$72,$69,$6E,$67,$74,$2E   ;C3EA61|        |007262;
db $20,$8F,$F2,$84,$0D,$E3,$44,$65   ;C3EA69|        |C3F28F;
db $69,$6E,$65,$72,$20,$52,$5B,$63   ;C3EA71|        |      ;
db $6B,$6B,$65,$68,$72,$20,$11,$68   ;C3EA79|        |      ;
db $65,$6C,$66,$65,$6E,$2E,$13,$40   ;C3EA81|        |00006C;
db $FF,$02,$14,$51,$00,$91,$EA,$6B   ;C3EA89|        |511402;
db $02,$07,$03,$84,$C7,$EA,$02,$15   ;C3EA91|        |      ;
db $02,$17,$CA,$EA,$02,$91,$6B,$02   ;C3EA99|        |      ;
db $17,$00,$00,$02,$03,$20,$BD,$16   ;C3EAA1|        |000000;
db $00,$29,$FF,$DF,$9D,$16,$00,$02   ;C3EAA9|        |      ;
db $80,$07,$02,$82,$BD,$16,$00,$09   ;C3EAB1|        |C3EABA;
db $00,$20,$9D,$16,$00,$02,$80,$07   ;C3EAB9|        |      ;
db $02,$82,$02,$04,$02,$16,$02,$86   ;C3EAC1|        |      ;
db $6B,$02,$19,$1F,$DE,$EA,$02,$01   ;C3EAC9|        |      ;
db $0D,$EB,$02,$0B,$1F,$02,$09,$03   ;C3EAD1|        |0002EB;
db $84,$02,$27,$A0,$EA,$02,$01,$E3   ;C3EAD9|        |000002;
db $EA,$6B,$10,$83,$6D,$75,$25,$74   ;C3EAE1|        |      ;
db $20,$DB,$C2,$0D,$62,$72,$69,$6E   ;C3EAE9|        |C3C2DB;
db $67,$65,$6E,$2C,$20,$F9,$C4,$0D   ;C3EAF1|        |000065;
db $4D,$6F,$6E,$6D,$6F,$20,$67,$65   ;C3EAF9|        |006E6F;
db $68,$2A,$72,$74,$20,$68,$61,$74   ;C3EB01|        |      ;
db $2E,$13,$40,$FF,$10,$44,$61,$2E   ;C3EB09|        |004013;
db $2E,$20,$B9,$D2,$4D,$6F,$6E,$6D   ;C3EB11|        |00B920;
db $6F,$60,$73,$20,$0D,$53,$63,$68   ;C3EB19|        |207360;
db $6C,$65,$69,$66,$65,$21,$11,$4F   ;C3EB21|        |006965;
db $2E,$2E,$20,$6F,$6B,$61,$79,$2C   ;C3EB29|        |00202E;
db $20,$D1,$F2,$0D,$AD,$BB,$57,$65   ;C3EB31|        |C3F2D1;
db $67,$20,$67,$65,$68,$65,$6E,$2C   ;C3EB39|        |000020;
db $F3,$0D,$83,$DB,$B9,$67,$69,$62   ;C3EB41|        |00000D;
db $73,$74,$2E,$13,$40,$FF,$02,$14   ;C3EB49|        |000074;
db $62,$00,$56,$EB,$6B,$02,$15,$02   ;C3EB51|        |C34154;
db $17,$7C,$EB,$02,$07,$07,$03,$66   ;C3EB59|        |00007C;
db $EB,$02,$17,$81,$EB,$02,$07,$00   ;C3EB61|        |      ;
db $04,$70,$EB,$02,$17,$9A,$EB,$02   ;C3EB69|        |000070;
db $91,$02,$18,$1F,$7B,$EB,$02,$09   ;C3EB71|        |000002;
db $07,$89,$6B,$02,$01,$9F,$EB,$6B   ;C3EB79|        |000089;
db $02,$01,$2E,$EC,$02,$17,$95,$EB   ;C3EB81|        |      ;
db $02,$14,$5C,$00,$90,$EB,$6B,$02   ;C3EB89|        |      ;
db $09,$00,$84,$6B,$02,$01,$00,$ED   ;C3EB91|        |      ;
db $6B,$02,$01,$04,$ED,$6B,$10,$8F   ;C3EB99|        |      ;
db $77,$5B,$68,$6C,$65,$20,$D4,$D3   ;C3EBA1|        |00005B;
db $B6,$0D,$45,$72,$64,$65,$2C,$20   ;C3EBA9|        |00000D;
db $EB,$6D,$61,$6E,$63,$68,$6D,$61   ;C3EBB1|        |      ;
db $6C,$20,$0D,$66,$69,$6E,$64,$65   ;C3EBB9|        |000D20;
db $20,$D1,$72,$69,$63,$68,$74,$69   ;C3EBC1|        |C372D1;
db $67,$20,$0D,$73,$65,$6C,$74,$73   ;C3EBC9|        |000020;
db $61,$6D,$65,$20,$53,$61,$63,$68   ;C3EBD1|        |00006D;
db $65,$6E,$2E,$11,$8F,$CC,$67,$65   ;C3EBD9|        |00006E;
db $72,$61,$64,$65,$20,$64,$6F,$72   ;C3EBE1|        |000061;
db $74,$20,$5F,$20,$0D,$BE,$E4,$48   ;C3EBE9|        |000020;
db $75,$6E,$64,$65,$6B,$6E,$6F,$63   ;C3EBF1|        |00006E;
db $68,$65,$6E,$20,$0D,$61,$75,$73   ;C3EBF9|        |      ;
db $67,$65,$67,$72,$61,$62,$65,$6E   ;C3EC01|        |000065;
db $2E,$11,$8F,$CC,$D9,$65,$72,$2D   ;C3EC09|        |008F11;
db $0D,$73,$63,$68,$72,$65,$63,$6B   ;C3EC11|        |006373;
db $74,$2C,$20,$EB,$E6,$20,$0D,$F4   ;C3EC19|        |00002C;
db $76,$65,$72,$67,$72,$61,$62,$65   ;C3EC21|        |000065;
db $6E,$2E,$13,$40,$FF,$10,$57,$41   ;C3EC29|        |00132E;
db $53,$3F,$20,$49,$73,$74,$20,$CE   ;C3EC31|        |00003F;
db $BE,$0D,$77,$65,$69,$62,$6C,$69   ;C3EC39|        |00770D;
db $63,$68,$65,$72,$20,$4D,$61,$75   ;C3EC41|        |000068;
db $6C,$77,$75,$72,$66,$20,$0D,$76   ;C3EC49|        |007577;
db $6F,$72,$62,$65,$69,$67,$65,$6B   ;C3EC51|        |656272;
db $6F,$6D,$6D,$65,$6E,$3F,$21,$11   ;C3EC59|        |656D6D;
db $4E,$65,$69,$6E,$2C,$20,$D1,$77   ;C3EC61|        |006965;
db $6F,$68,$6E,$65,$20,$CE,$0D,$75   ;C3EC69|        |656E68;
db $6E,$74,$65,$6E,$20,$61,$6C,$6C   ;C3EC71|        |006574;
db $65,$69,$6E,$65,$2E,$11,$4F,$68   ;C3EC79|        |000069;
db $2C,$20,$D1,$67,$6C,$61,$75,$62   ;C3EC81|        |00D120;
db $65,$20,$D1,$0D,$CC,$BC,$47,$65   ;C3EC89|        |000020;
db $73,$63,$68,$69,$63,$68,$74,$65   ;C3EC91|        |000063;
db $20,$0D,$EA,$6D,$61,$6C,$20,$67   ;C3EC99|        |C3EA0D;
db $65,$68,$2A,$72,$74,$2E,$2E,$2E   ;C3ECA1|        |000068;
db $2E,$11,$48,$69,$65,$72,$20,$77   ;C3ECA9|        |004811;
db $6F,$68,$6E,$74,$65,$20,$C4,$0D   ;C3ECB1|        |746E68;
db $BF,$73,$5B,$25,$65,$20,$4D,$61   ;C3ECB9|        |255B73;
db $75,$6C,$77,$75,$72,$66,$2D,$0D   ;C3ECC1|        |00006C;
db $44,$61,$6D,$65,$2E,$11,$80,$E6   ;C3ECC9|        |      ;
db $F8,$EE,$0D,$74,$65,$75,$66,$6C   ;C3ECD1|        |      ;
db $69,$73,$63,$68,$65,$6E,$20,$57   ;C3ECD9|        |      ;
db $65,$73,$65,$6E,$20,$65,$6E,$74   ;C3ECE1|        |000073;
db $2D,$0D,$66,$5B,$68,$72,$74,$2E   ;C3ECE9|        |00660D;
db $11,$8F,$CC,$41,$6E,$67,$73,$74   ;C3ECF1|        |00008F;
db $2E,$2E,$2E,$2E,$13,$40,$FF,$10   ;C3ECF9|        |002E2E;
db $13,$F2,$EC,$10,$8F,$68,$61,$74   ;C3ED01|        |0000F2;
db $74,$65,$20,$73,$6F,$6C,$63,$68   ;C3ED09|        |000065;
db $65,$20,$0D,$41,$6E,$67,$73,$74   ;C3ED11|        |000020;
db $2C,$20,$BA,$D1,$C0,$0D,$54,$75   ;C3ED19|        |00BA20;
db $6E,$6E,$65,$6C,$20,$FE,$48,$61   ;C3ED21|        |00656E;
db $75,$73,$20,$6E,$65,$62,$65,$6E   ;C3ED29|        |000073;
db $2D,$0D,$61,$6E,$20,$67,$65,$67   ;C3ED31|        |00610D;
db $72,$61,$62,$65,$6E,$20,$68,$61   ;C3ED39|        |000061;
db $62,$65,$2E,$13,$40,$FF,$02,$14   ;C3ED41|        |C31BA9;
db $5C,$00,$4E,$ED,$6B,$02,$17,$00   ;C3ED49|        |ED4E00;
db $00,$02,$91,$02,$0D,$00,$05,$0B   ;C3ED51|        |      ;
db $71,$ED,$02,$0D,$00,$05,$0F,$71   ;C3ED59|        |0000ED;
db $ED,$02,$0D,$00,$0E,$0D,$AD,$ED   ;C3ED61|        |000D02;
db $02,$0D,$00,$0D,$12,$AD,$ED,$6B   ;C3ED69|        |      ;
db $02,$2A,$10,$00,$00,$00,$02,$9B   ;C3ED71|        |      ;
db $00,$00,$81,$ED,$81,$ED,$8F,$ED   ;C3ED79|        |      ;
db $02,$80,$0B,$02,$82,$02,$81,$07   ;C3ED81|        |      ;
db $10,$02,$83,$82,$0B,$00,$02,$80   ;C3ED89|        |C3ED8D;
db $0B,$02,$82,$02,$81,$06,$10,$02   ;C3ED91|        |      ;
db $83,$02,$01,$B5,$ED,$02,$16,$02   ;C3ED99|        |000002;
db $87,$02,$80,$0B,$02,$82,$02,$15   ;C3EDA1|        |000002;
db $02,$17,$B0,$ED,$02,$91,$6B,$02   ;C3EDA9|        |      ;
db $01,$F7,$ED,$6B,$10,$42,$55,$48   ;C3EDB1|        |0000F7;
db $21,$11,$2E,$2E,$2E,$2E,$2E,$2E   ;C3EDB9|        |000011;
db $2E,$2E,$2E,$2E,$2E,$11,$41,$63   ;C3EDC1|        |002E2E;
db $68,$20,$6B,$6F,$6D,$6D,$60,$20   ;C3EDC9|        |      ;
db $73,$63,$68,$6F,$6E,$21,$20,$48   ;C3EDD1|        |000063;
db $61,$62,$60,$20,$0D,$D1,$85,$DF   ;C3EDD9|        |000062;
db $BE,$0D,$77,$65,$6E,$69,$67,$20   ;C3EDE1|        |00770D;
db $65,$72,$73,$63,$68,$72,$65,$63   ;C3EDE9|        |000072;
db $6B,$74,$2E,$13,$40,$FF,$10,$50   ;C3EDF1|        |      ;
db $75,$68,$21,$13,$40,$FF,$02,$14   ;C3EDF9|        |000068;
db $40,$00,$06,$EE,$6B,$02,$85,$C9   ;C3EE01|        |      ;
db $A9,$80,$02,$15,$02,$17,$14,$EE   ;C3EE09|        |      ;
db $02,$91,$6B,$02,$14,$51,$00,$1F   ;C3EE11|        |      ;
db $EE,$02,$01,$7C,$EF,$6B,$02,$18   ;C3EE19|        |000102;
db $36,$29,$EE,$02,$01,$B3,$EF,$6B   ;C3EE21|        |000029;
db $02,$01,$33,$EE,$00,$5E,$02,$0A   ;C3EE29|        |      ;
db $36,$6B,$10,$8F,$CC,$DF,$67,$65   ;C3EE31|        |00006B;
db $77,$75,$25,$74,$0D,$BA,$C8,$BE   ;C3EE39|        |000075;
db $47,$65,$69,$73,$74,$20,$77,$61   ;C3EE41|        |000065;
db $72,$2E,$11,$AA,$68,$61,$74,$74   ;C3EE49|        |00002E;
db $65,$6E,$20,$ED,$62,$65,$69,$64   ;C3EE51|        |00006E;
db $65,$20,$0D,$D3,$4D,$6F,$6E,$6D   ;C3EE59|        |000020;
db $6F,$20,$76,$65,$72,$6C,$69,$65   ;C3EE61|        |657620;
db $62,$74,$2E,$11,$45,$69,$6E,$65   ;C3EE69|        |C31CE0;
db $73,$20,$A6,$F8,$0D,$4D,$6F,$6E   ;C3EE71|        |000020;
db $6D,$6F,$20,$F1,$82,$67,$65,$2D   ;C3EE79|        |00206F;
db $0D,$66,$61,$6E,$67,$65,$6E,$2C   ;C3EE81|        |006166;
db $20,$EB,$C8,$76,$65,$72,$2D,$0D   ;C3EE89|        |C3C8EB;
db $73,$75,$63,$68,$74,$65,$20,$E6   ;C3EE91|        |000075;
db $FD,$72,$65,$74,$74,$65,$6E,$2C   ;C3EE99|        |006572;
db $11,$6B,$61,$6D,$20,$AB,$6E,$69   ;C3EEA1|        |00006B;
db $65,$20,$7A,$75,$72,$5B,$63,$6B   ;C3EEA9|        |000020;
db $2E,$0D,$50,$6C,$2A,$74,$7A,$6C   ;C3EEB1|        |00500D;
db $69,$63,$68,$20,$FC,$C8,$0D,$F4   ;C3EEB9|        |      ;
db $64,$61,$2C,$EB,$D1,$0D,$68,$61   ;C3EEC1|        |000061;
db $74,$74,$65,$20,$D8,$41,$68,$6E   ;C3EEC9|        |000074;
db $75,$6E,$67,$2C,$F9,$11,$DA,$69   ;C3EED1|        |00006E;
db $68,$6D,$20,$67,$65,$73,$63,$68   ;C3EED9|        |      ;
db $65,$68,$65,$6E,$20,$69,$73,$74   ;C3EEE1|        |000068;
db $2E,$0D,$80,$67,$75,$74,$2C,$20   ;C3EEE9|        |00800D;
db $6E,$69,$6D,$6D,$60,$20,$64,$69   ;C3EEF1|        |006D69;
db $65,$73,$65,$73,$20,$0D,$41,$72   ;C3EEF9|        |000073;
db $6D,$62,$61,$6E,$64,$2C,$20,$EB   ;C3EF01|        |006162;
db $62,$65,$6C,$65,$62,$65,$20,$0D   ;C3EF09|        |C35B71;
db $47,$72,$65,$65,$6E,$20,$57,$6F   ;C3EF11|        |000072;
db $6F,$64,$20,$77,$69,$65,$64,$65   ;C3EF19|        |772064;
db $72,$2E,$11,$8F,$77,$65,$69,$25   ;C3EF21|        |00002E;
db $2C,$20,$BA,$BC,$0D,$62,$65,$69   ;C3EF29|        |00BA20;
db $64,$65,$6E,$20,$4D,$61,$75,$6C   ;C3EF31|        |000065;
db $77,$5B,$72,$66,$65,$20,$CE,$0D   ;C3EF39|        |00005B;
db $67,$65,$72,$6E,$65,$20,$D3,$46   ;C3EF41|        |000065;
db $72,$69,$65,$64,$65,$6E,$20,$67   ;C3EF49|        |000069;
db $65,$2D,$0D,$6C,$65,$62,$74,$20   ;C3EF51|        |00002D;
db $68,$7B,$74,$74,$65,$6E,$2E,$11   ;C3EF59|        |      ;
db $02,$02,$20,$C1,$0D,$03,$24,$53   ;C3EF61|        |      ;
db $63,$68,$69,$6C,$64,$20,$41,$72   ;C3EF69|        |000068;
db $6D,$62,$61,$6E,$64,$21,$03,$20   ;C3EF71|        |006162;
db $13,$40,$FF,$10,$98,$4D,$69,$74   ;C3EF79|        |000040;
db $62,$65,$77,$6F,$68,$6E,$65,$72   ;C3EF81|        |C366E9;
db $20,$D2,$0D,$76,$65,$72,$73,$63   ;C3EF89|        |C30DD2;
db $68,$77,$75,$6E,$64,$65,$6E,$2E   ;C3EF91|        |      ;
db $20,$4B,$2A,$6E,$6E,$74,$65,$73   ;C3EF99|        |C32A4B;
db $74,$20,$0D,$83,$69,$68,$6E,$20   ;C3EFA1|        |000020;
db $73,$75,$63,$68,$65,$6E,$3F,$13   ;C3EFA9|        |000075;
db $40,$FF,$10,$8F,$B1,$C2,$65,$69   ;C3EFB1|        |      ;
db $66,$65,$72,$2D,$0D,$73,$5B,$63   ;C3EFB9|        |000065;
db $68,$74,$69,$67,$2C,$BA,$C8,$4D   ;C3EFC1|        |      ;
db $6F,$6E,$6D,$6F,$60,$73,$20,$0D   ;C3EFC9|        |6F6D6E;
db $48,$65,$72,$7A,$20,$67,$65,$77   ;C3EFD1|        |      ;
db $6F,$6E,$6E,$65,$6E,$20,$68,$61   ;C3EFD9|        |656E6E;
db $74,$2E,$11,$80,$D1,$68,$6F,$66   ;C3EFE1|        |00002E;
db $66,$65,$2C,$20,$BA,$0D,$E6,$6E   ;C3EFE9|        |000065;
db $75,$6E,$20,$67,$6C,$5B,$63,$6B   ;C3EFF1|        |00006E;
db $6C,$69,$63,$68,$20,$E7,$13,$40   ;C3EFF9|        |006369;
db $FF                               ;C3F001|        |721402;
COP #$14                             ;C3F002|0214    |      ;
db $72,$00,$09,$F0                   ;C3F004|        |000000;
RTL                                  ;C3F008|6B      |      ;
db $02,$07,$07,$83,$A8,$F0,$02,$85   ;C3F009|        |      ;
db $C9,$A9,$80,$02,$17,$AB,$F0,$02   ;C3F011|        |      ;
db $15,$02,$91,$6B,$02,$17,$B3,$F0   ;C3F019|        |000002;
db $02,$16,$02,$27,$27,$F0,$02,$0D   ;C3F021|        |      ;
db $16,$0E,$1F,$94,$F0,$02,$9C,$34   ;C3F029|        |00000E;
db $F0,$66,$F0,$02,$9A,$10,$00,$3E   ;C3F031|        |C3F099;
db $F0,$66,$F0,$5D,$F0,$02,$14,$56   ;C3F039|        |C3F0A1;
db $00,$54,$F0,$BD,$00,$00,$C9,$20   ;C3F041|        |      ;
db $01,$B0,$08,$BD,$02,$00,$C9,$70   ;C3F049|        |0000B0;
db $01,$90,$CF,$02,$97,$02,$80,$0B   ;C3F051|        |000090;
db $02,$82,$80,$CA,$02,$96,$02,$80   ;C3F059|        |      ;
db $0B,$02,$82,$80,$C1,$02,$9B,$10   ;C3F061|        |      ;
db $00,$70,$F0,$23,$F0,$8D,$F0,$02   ;C3F069|        |      ;
db $14,$56,$00,$86,$F0,$BD,$02,$00   ;C3F071|        |000056;
db $C9,$70,$01,$B0,$08,$BD,$00,$00   ;C3F079|        |      ;
db $C9,$20,$01,$90,$9D,$02,$80,$0A   ;C3F081|        |      ;
db $02,$82,$80,$9A,$02,$80,$09,$02   ;C3F089|        |      ;
db $82,$80,$93,$02,$17,$B8,$F0,$02   ;C3F091|        |C38414;
db $15,$02,$80,$06,$02,$82,$02,$91   ;C3F099|        |000002;
db $6B,$02,$16,$02,$09,$07,$83,$02   ;C3F0A1|        |      ;
db $86,$6B,$02,$01,$C0,$F0,$02,$27   ;C3F0A9|        |00006B;
db $1D,$F0,$02,$01,$75,$F1,$6B,$02   ;C3F0B1|        |0002F0;
db $01,$A4,$F1,$02,$27,$A2,$F0,$10   ;C3F0B9|        |0000A4;
db $98,$4E,$61,$6D,$65,$20,$D2,$4D   ;C3F0C1|        |      ;
db $6F,$6E,$6D,$6F,$20,$0D,$B6,$4D   ;C3F0C9|        |6F6D6E;
db $61,$75,$6C,$77,$75,$72,$66,$2E   ;C3F0D1|        |000075;
db $11,$48,$69,$65,$72,$20,$D2,$C3   ;C3F0D9|        |000048;
db $E9,$68,$65,$6C,$6C,$2E,$0D,$8F   ;C3F0E1|        |      ;
db $6B,$61,$6E,$6E,$60,$6E,$69,$63   ;C3F0E9|        |      ;
db $68,$74,$73,$20,$73,$65,$68,$65   ;C3F0F1|        |      ;
db $6E,$2E,$11,$4B,$61,$6E,$6E,$73   ;C3F0F9|        |00112E;
db $74,$20,$83,$D9,$B2,$0D,$FD,$DD   ;C3F101|        |000020;
db $48,$61,$75,$73,$20,$66,$5B,$68   ;C3F109|        |      ;
db $72,$65,$6E,$3F,$0D,$8F,$F2,$84   ;C3F111|        |000065;
db $66,$6F,$6C,$67,$65,$6E,$2E,$11   ;C3F119|        |00006F;
db $47,$65,$68,$60,$B2,$FD,$BB,$4C   ;C3F121|        |000065;
db $6F,$63,$68,$2C,$0D,$B9,$FD,$DD   ;C3F129|        |2C6863;
db $5A,$75,$68,$61,$75,$73,$65,$20   ;C3F131|        |      ;
db $0D,$66,$5B,$68,$72,$74,$2E,$11   ;C3F139|        |005B66;
db $52,$65,$64,$65,$20,$65,$72,$73   ;C3F141|        |000065;
db $74,$20,$F4,$DA,$0D,$6D,$69,$72   ;C3F149|        |000020;
db $2C,$20,$F3,$D1,$61,$6E,$20,$B6   ;C3F151|        |00F320;
db $0D,$72,$69,$63,$68,$74,$69,$67   ;C3F159|        |006972;
db $65,$6E,$20,$53,$74,$65,$6C,$6C   ;C3F161|        |00006E;
db $65,$20,$0D,$73,$74,$65,$68,$65   ;C3F169|        |000020;
db $2E,$13,$40,$FF,$10,$4C,$61,$75   ;C3F171|        |004013;
db $66,$60,$20,$64,$6F,$63,$68,$20   ;C3F179|        |000060;
db $DF,$E9,$0D,$73,$63,$68,$6E,$65   ;C3F181|        |730DE9;
db $6C,$6C,$2E,$20,$8F,$6B,$6F,$6D   ;C3F189|        |002E6C;
db $6D,$60,$20,$6A,$61,$20,$0D,$67   ;C3F191|        |002060;
db $61,$72,$20,$DF,$6D,$69,$74,$2E   ;C3F199|        |000072;
db $13,$40,$FF,$10,$8F,$F2,$84,$BE   ;C3F1A1|        |000040;
db $47,$65,$2D,$0D,$73,$63,$68,$65   ;C3F1A9|        |000065;
db $6E,$6B,$20,$67,$65,$62,$65,$6E   ;C3F1B1|        |00206B;
db $2E,$0D,$57,$61,$72,$74,$65,$73   ;C3F1B9|        |00570D;
db $74,$20,$83,$B2,$68,$69,$65,$72   ;C3F1C1|        |000020;
db $3F,$13,$40,$FF,$02,$14,$4F,$00   ;C3F1C9|        |FF4013;
db $D4,$F1,$6B,$02,$85,$C9,$A9,$80   ;C3F1D1|        |0000F1;
db $02,$17,$E2,$F1,$02,$15,$02,$91   ;C3F1D9|        |      ;
db $6B,$02,$01,$E7,$F1,$6B,$10,$54   ;C3F1E1|        |      ;
db $75,$72,$62,$6F,$2C,$20,$B6,$48   ;C3F1E9|        |000072;
db $75,$6E,$64,$2C,$20,$6C,$65,$62   ;C3F1F1|        |00006E;
db $74,$65,$20,$0D,$C4,$DA,$C7,$4D   ;C3F1F9|        |000065;
db $61,$6E,$6E,$20,$0D,$E2,$44,$72   ;C3F201|        |00006E;
db $2E,$4C,$65,$6F,$2E,$11,$54,$75   ;C3F209|        |00654C;
db $72,$62,$6F,$20,$CF,$EE,$69,$68   ;C3F211|        |000062;
db $6D,$20,$0D,$EF,$44,$69,$6E,$67   ;C3F219|        |000D20;
db $65,$20,$67,$65,$6C,$65,$72,$6E   ;C3F221|        |000020;
db $74,$2E,$11,$45,$72,$20,$CF,$B5   ;C3F229|        |00002E;
db $7D,$73,$74,$65,$20,$B6,$0D,$42   ;C3F231|        |007473;
db $7B,$75,$6D,$65,$20,$62,$65,$6E   ;C3F239|        |      ;
db $75,$74,$7A,$74,$2C,$20,$EC,$0D   ;C3F241|        |000074;
db $C2,$FD,$6D,$61,$63,$68,$65,$6E   ;C3F249|        |      ;
db $2C,$20,$BA,$0D,$6D,$61,$6E,$20   ;C3F251|        |00BA20;
db $46,$6C,$6F,$25,$20,$6E,$65,$6E   ;C3F259|        |00006C;
db $6E,$74,$2E,$13,$40,$FF,$02,$14   ;C3F261|        |002E74;
db $43,$00,$6E,$F2,$6B,$02,$85,$C9   ;C3F269|        |000000;
db $A9,$80,$02,$17,$7C,$F2,$02,$15   ;C3F271|        |      ;
db $02,$91,$6B,$02,$18,$02,$86,$F2   ;C3F279|        |      ;
db $02,$01,$99,$F3,$6B,$02,$18,$25   ;C3F281|        |      ;
db $9D,$F2,$02,$19,$25,$A2,$F2,$02   ;C3F289|        |0002F2;
db $01,$4B,$F3,$02,$0B,$25,$00,$5E   ;C3F291|        |00004B;
db $02,$0A,$02,$6B,$02,$01,$A7,$F2   ;C3F299|        |      ;
db $6B,$02,$01,$10,$F3,$6B,$10,$57   ;C3F2A1|        |      ;
db $69,$6C,$6C,$6B,$6F,$6D,$6D,$65   ;C3F2A9|        |      ;
db $6E,$20,$D5,$54,$61,$75,$73,$63   ;C3F2B1|        |00D520;
db $68,$2D,$0D,$67,$65,$73,$63,$68   ;C3F2B9|        |      ;
db $7B,$66,$74,$20,$B8,$45,$69,$63   ;C3F2C1|        |      ;
db $68,$2D,$0D,$68,$2A,$72,$6E,$63   ;C3F2C9|        |      ;
db $68,$65,$6E,$73,$2E,$11,$8F,$CC   ;C3F2D1|        |      ;
db $48,$75,$6E,$67,$65,$72,$2E,$20   ;C3F2D9|        |      ;
db $A8,$0D,$83,$DB,$C2,$FD,$45,$73   ;C3F2E1|        |      ;
db $73,$65,$6E,$20,$0D,$62,$72,$69   ;C3F2E9|        |000065;
db $6E,$67,$73,$74,$2C,$20,$F2,$D1   ;C3F2F1|        |007367;
db $C3,$11,$84,$67,$65,$67,$65,$6E   ;C3F2F9|        |000011;
db $20,$C2,$0D,$74,$61,$75,$73,$63   ;C3F301|        |C30DC2;
db $68,$65,$6E,$2E,$13,$40,$FF,$10   ;C3F309|        |      ;
db $41,$68,$2C,$20,$D1,$72,$69,$65   ;C3F311|        |000068;
db $63,$68,$65,$20,$6B,$2A,$73,$74   ;C3F319|        |000068;
db $2D,$0D,$6C,$69,$63,$68,$65,$20   ;C3F321|        |006C0D;
db $53,$61,$6D,$65,$6E,$6B,$2A,$72   ;C3F329|        |000061;
db $6E,$65,$72,$2E,$20,$83,$0D,$CD   ;C3F331|        |007265;
db $77,$65,$6C,$63,$68,$65,$2C,$20   ;C3F339|        |000065;
db $DF,$0D,$77,$61,$68,$72,$3F,$13   ;C3F341|        |61770D;
db $40,$FF,$10,$8F,$62,$69,$65,$74   ;C3F349|        |      ;
db $65,$20,$84,$64,$69,$65,$73,$65   ;C3F351|        |000020;
db $73,$20,$0D,$A3,$D5,$41,$75,$73   ;C3F359|        |000020;
db $74,$61,$75,$73,$63,$68,$20,$0D   ;C3F361|        |000061;
db $67,$65,$67,$65,$6E,$20,$B5,$53   ;C3F369|        |000065;
db $61,$6D,$65,$6E,$6B,$2A,$72,$6E   ;C3F371|        |00006D;
db $65,$72,$2E,$11,$02,$02,$20,$C1   ;C3F379|        |000072;
db $0D,$03,$24,$B9,$50,$73,$79,$63   ;C3F381|        |002403;
db $68,$6F,$20,$53,$63,$68,$77,$65   ;C3F389|        |      ;
db $72,$74,$2E,$03,$20,$13,$40,$FF   ;C3F391|        |000074;
db $10,$87,$53,$61,$6D,$65,$6E,$6B   ;C3F399|        |C3F322;
db $2A,$72,$6E,$65,$72,$20,$D0,$0D   ;C3F3A1|        |      ;
db $E8,$67,$75,$74,$20,$67,$65,$73   ;C3F3A9|        |      ;
db $63,$68,$6D,$65,$63,$6B,$74,$2E   ;C3F3B1|        |000068;
db $13,$40,$FF                       ;C3F3B9|        |000040;
COP #$14                             ;C3F3BC|0214    |      ;
db $43,$00,$C3,$F3                   ;C3F3BE|        |000000;
RTL                                  ;C3F3C2|6B      |      ;
db $02,$30,$43,$00,$CD,$F3,$83,$02   ;C3F3C3|        |      ;
db $91,$6B,$02,$01,$D4,$F3,$02,$86   ;C3F3CB|        |00006B;
db $6B,$10,$0E,$3C,$45,$69,$6E,$65   ;C3F3D3|        |      ;
db $20,$6C,$65,$69,$73,$65,$20,$A0   ;C3F3DB|        |C3656C;
db $0D,$6B,$6F,$6D,$6D,$74,$20,$AD   ;C3F3E3|        |006F6B;
db $BB,$4C,$6F,$63,$68,$2E,$11,$4F   ;C3F3EB|        |      ;
db $68,$2C,$20,$68,$61,$62,$60,$20   ;C3F3F3|        |      ;
db $D1,$C0,$20,$0D,$48,$75,$6E,$67   ;C3F3FB|        |0000C0;
db $65,$72,$2E,$2E,$2E,$2E,$2E,$11   ;C3F403|        |000072;
db $A8,$DB,$E1,$6A,$65,$6D,$61,$6E   ;C3F40B|        |      ;
db $64,$20,$0D,$C2,$FD,$45,$73,$73   ;C3F413|        |000020;
db $65,$6E,$20,$62,$72,$69,$6E,$67   ;C3F41B|        |00006E;
db $65,$6E,$20,$11,$77,$5B,$72,$64   ;C3F423|        |00006E;
db $65,$2C,$20,$64,$61,$6E,$6E,$20   ;C3F42B|        |00002C;
db $77,$5B,$72,$64,$65,$20,$D1,$0D   ;C3F433|        |00005B;
db $69,$68,$6D,$20,$64,$69,$65,$73   ;C3F43B|        |      ;
db $65,$73,$20,$6D,$7B,$63,$68,$74   ;C3F443|        |000073;
db $69,$67,$65,$20,$0D,$A3,$67,$65   ;C3F44B|        |      ;
db $62,$65,$6E,$2E,$2E,$2E,$2E,$2E   ;C3F453|        |C362BB;
db $13,$40,$FF,$02,$14,$41,$00,$65   ;C3F45B|        |000040;
db $F4,$6B,$02,$85,$C9,$A9,$80,$02   ;C3F463|        |00026B;
db $17,$73,$F4,$02,$15,$02,$91,$6B   ;C3F46B|        |000073;
db $02,$07,$02,$9A,$87,$F4,$02,$01   ;C3F473|        |      ;
db $8C,$F4,$00,$5E,$02,$0A,$2C,$02   ;C3F47B|        |0000F4;
db $09,$02,$9A,$6B,$02,$01,$D0,$F4   ;C3F483|        |      ;
db $6B,$10,$44,$61,$6E,$6B,$65,$2C   ;C3F48B|        |      ;
db $20,$BA,$83,$D9,$0D,$CA,$68,$61   ;C3F493|        |C383BA;
db $73,$74,$2E,$20,$8F,$0D,$F2,$84   ;C3F49B|        |000074;
db $64,$69,$65,$73,$20,$67,$65,$62   ;C3F4A3|        |000069;
db $65,$6E,$2E,$11,$02,$02,$20,$C1   ;C3F4AB|        |00006E;
db $0D,$03,$24,$B9,$45,$6D,$62,$6C   ;C3F4B3|        |002403;
db $65,$6D,$20,$43,$20,$B8,$0D,$4D   ;C3F4BB|        |00006D;
db $65,$69,$73,$74,$65,$72,$73,$2E   ;C3F4C3|        |000069;
db $03,$20,$13,$40,$FF,$10,$44,$61   ;C3F4CB|        |000020;
db $6E,$6B,$65,$2C,$20,$BA,$83,$D9   ;C3F4D3|        |00656B;
db $0D,$CA,$68,$61,$73,$74,$2E,$13   ;C3F4DB|        |0068CA;
db $40,$FF,$02,$15,$02,$17,$EE,$F4   ;C3F4E3|        |      ;
db $02,$91,$6B,$02,$07,$02,$84,$F9   ;C3F4EB|        |      ;
db $F4,$02,$01,$0A,$F5,$6B,$02,$01   ;C3F4F3|        |000102;
db $8E,$F5,$02,$3C,$04,$02,$10,$04   ;C3F4FB|        |0002F5;
db $01,$02,$20,$01,$D0,$02,$6B,$10   ;C3F503|        |000002;
db $54,$75,$72,$62,$6F,$20,$77,$65   ;C3F50B|        |      ;
db $69,$67,$65,$72,$74,$65,$20,$E5   ;C3F513|        |      ;
db $0D,$73,$65,$69,$6E,$20,$4C,$65   ;C3F51B|        |006573;
db $62,$65,$6E,$20,$BB,$42,$2A,$73   ;C3F523|        |C3638B;
db $65,$6E,$2C,$20,$0D,$44,$65,$61   ;C3F52B|        |00006E;
db $74,$68,$74,$6F,$6C,$6C,$2C,$20   ;C3F533|        |000068;
db $FD,$6F,$70,$66,$65,$72,$6E,$2E   ;C3F53B|        |00706F;
db $11,$45,$72,$20,$6B,$7B,$6D,$70   ;C3F543|        |000045;
db $66,$74,$65,$20,$67,$65,$67,$65   ;C3F54B|        |000074;
db $6E,$20,$0D,$44,$65,$61,$74,$68   ;C3F553|        |000D20;
db $74,$6F,$6C,$6C,$2C,$20,$EC,$47   ;C3F55B|        |00006F;
db $72,$65,$65,$6E,$0D,$57,$6F,$6F   ;C3F563|        |000065;
db $64,$20,$EB,$AE,$54,$69,$65,$72   ;C3F56B|        |000020;
db $65,$20,$FD,$0D,$72,$65,$74,$74   ;C3F573|        |000020;
db $65,$6E,$2E,$11,$80,$C8,$6E,$69   ;C3F57B|        |00006E;
db $65,$64,$65,$72,$6C,$61,$67,$2E   ;C3F583|        |000064;
db $13,$40,$FF,$10,$54,$75,$72,$62   ;C3F58B|        |000040;
db $6F,$2C,$20,$77,$61,$72,$74,$65   ;C3F593|        |77202C;
db $21,$13,$40,$FF,$02,$14,$74,$00   ;C3F59B|        |000013;
db $A6,$F5,$6B,$02,$81,$27,$0F,$02   ;C3F5A3|        |0000F5;
db $83,$02,$81,$28,$08,$02,$83,$02   ;C3F5AB|        |000002;
db $15,$02,$17,$DB,$F5,$02,$91,$6B   ;C3F5B3|        |000002;
db $02,$17,$00,$00,$02,$1B,$C5,$F5   ;C3F5BB|        |      ;
db $3C,$00,$02,$81,$28,$08,$02,$83   ;C3F5C3|        |000200;
db $02,$81,$27,$0F,$02,$83,$02,$80   ;C3F5CB|        |      ;
db $23,$02,$82,$02,$16,$02,$91,$6B   ;C3F5D3|        |000002;
db $02,$01,$E7,$F5,$02,$09,$02,$84   ;C3F5DB|        |      ;
db $02,$27,$BB,$F5,$10,$02,$02,$2C   ;C3F5E3|        |      ;
db $20,$67,$65,$68,$65,$20,$FE,$0D   ;C3F5EB|        |C36567;
db $54,$65,$6D,$70,$65,$6C,$20,$B8   ;C3F5F3|        |      ;
db $4C,$69,$63,$68,$74,$65,$73,$20   ;C3F5FB|        |C36369;
db $0D,$EB,$62,$65,$66,$72,$65,$69   ;C3F603|        |0062EB;
db $65,$20,$B7,$0D,$57,$7B,$63,$68   ;C3F60B|        |000020;
db $74,$65,$72,$20,$B8,$57,$61,$6C   ;C3F613|        |000065;
db $64,$65,$73,$2E,$11,$83,$FA,$B9   ;C3F61B|        |000065;
db $66,$69,$6E,$64,$65,$6E,$2C,$0D   ;C3F623|        |000069;
db $77,$6F,$6E,$61,$63,$68,$20,$83   ;C3F62B|        |00006F;
db $73,$75,$63,$68,$73,$74,$2E,$11   ;C3F633|        |000075;
db $8C,$CB,$64,$61,$20,$C0,$56,$6F   ;C3F63B|        |0064CB;
db $67,$65,$6C,$20,$0D,$E2,$54,$69   ;C3F643|        |000065;
db $6B,$69,$2C,$20,$B6,$84,$0D,$F0   ;C3F64B|        |      ;
db $65,$72,$7A,$7B,$68,$6C,$74,$2C   ;C3F653|        |000072;
db $F6,$0D,$6D,$61,$6E,$20,$B9,$46   ;C3F65B|        |00000D;
db $6C,$6F,$25,$20,$62,$65,$6E,$75   ;C3F663|        |00256F;
db $74,$7A,$74,$2E,$11,$83,$6D,$75   ;C3F66B|        |00007A;
db $73,$74,$20,$47,$72,$65,$65,$6E   ;C3F673|        |000074;
db $20,$57,$6F,$6F,$64,$20,$0D,$D6   ;C3F67B|        |C36F57;
db $62,$65,$73,$63,$68,$5B,$74,$7A   ;C3F683|        |C369EB;
db $65,$6E,$2C,$6E,$61,$63,$68,$2D   ;C3F68B|        |00006E;
db $0D,$BB,$D1,$77,$65,$67,$20,$62   ;C3F693|        |00D1BB;
db $69,$6E,$2E,$13,$40,$FF,$02,$A1   ;C3F69B|        |      ;
db $7C,$00,$FA,$FF,$02,$80,$1F,$02   ;C3F6A3|        |C3FA00;
db $82,$02,$80,$20,$02,$82,$02,$80   ;C3F6AB|        |C376B0;
db $1D,$02,$82,$02,$1B,$BC,$F6,$28   ;C3F6B3|        |008202;
db $00,$02,$87,$02,$80,$1D,$02,$82   ;C3F6BB|        |      ;
db $02,$15,$02,$17,$D1,$F6,$02,$91   ;C3F6C3|        |      ;
db $02,$80,$1A,$02,$82,$6B,$02,$01   ;C3F6CB|        |      ;
db $E5,$F6,$9C,$23,$04,$02,$3C,$04   ;C3F6D3|        |0000F6;
db $02,$10,$04,$01,$00,$70,$00,$A0   ;C3F6DB|        |      ;
db $02,$6B,$10,$41,$75,$63,$68,$20   ;C3F6E3|        |      ;
db $F3,$D1,$E1,$BE,$0D,$42,$61,$75   ;C3F6EB|        |0000D1;
db $6D,$73,$74,$75,$6D,$70,$66,$20   ;C3F6F3|        |007473;
db $62,$69,$6E,$2C,$20,$E9,$0D,$74   ;C3F6FB|        |C36567;
db $72,$7B,$75,$6D,$65,$20,$D1,$B0   ;C3F703|        |00007B;
db $F1,$0D,$72,$69,$63,$68,$74,$69   ;C3F70B|        |00000D;
db $67,$65,$6E,$20,$4C,$65,$62,$65   ;C3F713|        |000065;
db $6E,$2E,$11,$8F,$B1,$BE,$56,$6F   ;C3F71B|        |00112E;
db $67,$65,$6C,$20,$EB,$0D,$D7,$5B   ;C3F723|        |000065;
db $62,$65,$72,$61,$6C,$6C,$20,$68   ;C3F72B|        |C36993;
db $69,$6E,$2D,$0D,$66,$6C,$69,$65   ;C3F733|        |      ;
db $67,$65,$6E,$20,$77,$6F,$20,$D1   ;C3F73B|        |000065;
db $77,$69,$6C,$6C,$2E,$13,$40,$FF   ;C3F743|        |000069;
db $02,$91,$02,$0D,$00,$0F,$15,$55   ;C3F74B|        |      ;
db $F7,$6B,$02,$07,$06,$09,$5E,$F7   ;C3F753|        |00006B;
db $02,$86,$6B,$02,$01,$6E,$F7,$00   ;C3F75B|        |      ;
db $5E,$02,$0A,$39,$02,$09,$06,$89   ;C3F763|        |000A02;
db $02,$86,$6B,$10,$02,$02,$20,$66   ;C3F76B|        |      ;
db $69,$6E,$64,$65,$74,$20,$0D,$03   ;C3F773|        |      ;
db $24,$BF,$73,$65,$6C,$74,$73,$61   ;C3F77B|        |0000BF;
db $6D,$65,$20,$46,$6C,$61,$73,$63   ;C3F783|        |002065;
db $68,$65,$03,$20,$2E,$13,$40,$FF   ;C3F78B|        |      ;
db $02,$85,$F8,$AE,$80,$02,$86,$6B   ;C3F793|        |      ;
JSL.L CODE_C3C040                    ;C3F79B|2240C083|83C040;
COP #$17                             ;C3F79F|0217    |      ;
db $AF,$F7                           ;C3F7A1|        |20E2F7;
SEP #$20                             ;C3F7A3|E220    |      ;
LDA.B #$83                           ;C3F7A5|A983    |      ;
PHA                                  ;C3F7A7|48      |      ;
REP #$20                             ;C3F7A8|C220    |      ;
LDA.W #$C05A                         ;C3F7AA|A95AC0  |      ;
PHA                                  ;C3F7AD|48      |      ;
RTL                                  ;C3F7AE|6B      |      ;
db $02,$07,$05,$9C,$C1,$F7,$02,$01   ;C3F7AF|        |      ;
db $B4,$FE,$02,$38,$50,$01,$02,$09   ;C3F7B7|        |0000FE;
db $05,$9C,$02,$01,$D8,$FE,$02,$1A   ;C3F7BF|        |00009C;
db $20,$D1,$02,$E3,$F7,$AF,$D2,$03   ;C3F7C7|        |C302D1;
db $00,$F0,$11,$02,$01,$F1,$FE,$EE   ;C3F7CF|        |      ;
db $39,$04,$02,$10,$04,$01,$02,$E0   ;C3F7D7|        |000204;
db $02,$A0,$01,$6B,$02,$01,$08,$FF   ;C3F7DF|        |      ;
db $6B,$02,$14,$48,$00,$EF,$F7,$6B   ;C3F7E7|        |      ;
db $22,$40,$C0,$83,$02,$17,$03,$F8   ;C3F7EF|        |83C040;
db $E2,$20,$A9,$83,$48,$C2,$20,$A9   ;C3F7F7|        |      ;
db $5A,$C0,$48,$6B,$02,$07,$06,$9C   ;C3F7FF|        |      ;
db $C1,$F7,$02,$01,$B4,$FE,$02,$38   ;C3F807|        |0000F7;
db $80,$01,$02,$09,$06,$9C,$82,$A9   ;C3F80F|        |C3F812;
db $FF,$02,$14,$5E,$00,$1F,$F8,$6B   ;C3F817|        |5E1402;
db $22,$40,$C0,$83,$02,$17,$33,$F8   ;C3F81F|        |83C040;
db $E2,$20,$A9,$83,$48,$C2,$20,$A9   ;C3F827|        |      ;
db $5A,$C0,$48,$6B,$02,$07,$07,$9C   ;C3F82F|        |      ;
db $C1,$F7,$02,$01,$49,$F8,$00,$5E   ;C3F837|        |0000F7;
db $02,$0A,$12,$02,$09,$07,$9C,$82   ;C3F83F|        |      ;
db $78,$FF,$10,$48,$69,$65,$72,$2C   ;C3F847|        |      ;
db $20,$6E,$69,$6D,$6D,$20,$64,$69   ;C3F84F|        |C3696E;
db $65,$73,$20,$0D,$03,$24,$9A,$B8   ;C3F857|        |000073;
db $4C,$69,$63,$68,$74,$20,$50,$66   ;C3F85F|        |C36369;
db $65,$69,$6C,$73,$2E,$03,$20,$11   ;C3F867|        |000069;
db $0C,$02,$14,$53,$00,$77,$F8,$6B   ;C3F86F|        |001402;
db $22,$40,$C0,$83,$02,$17,$8B,$F8   ;C3F877|        |83C040;
db $E2,$20,$A9,$83,$48,$C2,$20,$A9   ;C3F87F|        |      ;
db $5A,$C0,$48,$6B,$02,$01,$B4,$FE   ;C3F887|        |      ;
db $02,$38,$01,$00,$82,$2B,$FF       ;C3F88F|        |      ;
LDY.W $039E                          ;C3F896|AC9E03  |81039E;
LDA.W $0002,Y                        ;C3F899|B90200  |810002;
CMP.W #$0060                         ;C3F89C|C96000  |      ;
BCC UNREACH_C3F8D1                   ;C3F89F|9030    |C3F8D1;
COP #$0D                             ;C3F8A1|020D    |      ;
db $00,$1C,$20,$B1,$F8               ;C3F8A3|        |      ;
COP #$0D                             ;C3F8A8|020D    |      ;
db $00,$03,$19,$BB,$F8               ;C3F8AA|        |      ;
BRA CODE_C3F903                      ;C3F8AF|8052    |C3F903;
db $02,$11,$16,$17,$19,$02,$12,$16   ;C3F8B1|        |      ;
db $46,$FB,$02,$11,$14,$0F,$14,$02   ;C3F8B9|        |0000FB;
db $12,$14,$CA,$FA,$02,$11,$15,$06   ;C3F8C1|        |000014;
db $10,$02,$12,$15,$E2,$FB,$80,$32   ;C3F8C9|        |C3F8CD;

UNREACH_C3F8D1:
db $02,$11,$14,$0F,$08,$02,$12,$14   ;C3F8D1|        |      ;
db $E2,$FB,$02,$11,$15,$1C,$0D,$02   ;C3F8D9|        |      ;
db $12,$15,$CA,$FA,$02,$11,$16,$17   ;C3F8E1|        |000015;
db $19,$02,$12,$16,$46,$FB,$02,$11   ;C3F8E9|        |001202;
db $17,$06,$10,$02,$12,$17,$E2,$FB   ;C3F8F1|        |000006;
db $02,$11,$18,$0F,$14,$02,$12,$18   ;C3F8F9|        |      ;
db $CA,$FA                           ;C3F901|        |      ;

CODE_C3F903:
COP #$86                             ;C3F903|0286    |      ;
RTL                                  ;C3F905|6B      |      ;
COP #$07                             ;C3F906|0207    |      ;
db $01,$84,$5E,$F9                   ;C3F908|        |000084;
COP #$91                             ;C3F90C|0291    |      ;
COP #$0C                             ;C3F90E|020C    |      ;
db $00,$01,$15,$F9                   ;C3F910|        |      ;
RTL                                  ;C3F914|6B      |      ;
db $02,$2A,$00,$00,$00,$00,$02,$2A   ;C3F915|        |      ;
db $10,$00,$00,$00,$A9,$80,$2F,$0C   ;C3F91D|        |C3F91F;
db $26,$03,$02,$81,$1A,$02,$02,$83   ;C3F925|        |000003;
db $02,$1B,$33,$F9,$1E,$00,$02,$81   ;C3F92D|        |      ;
db $30,$02,$02,$83,$A9,$80,$2F,$1C   ;C3F935|        |C3F939;
db $26,$03,$02,$18,$1E,$62,$F9,$02   ;C3F93D|        |000003;
db $01,$02,$FA,$02,$81,$19,$02,$02   ;C3F945|        |000002;
db $83,$02,$2B,$00,$00,$00,$00,$02   ;C3F94D|        |000002;
db $2B,$10,$00,$00,$00,$02,$09,$01   ;C3F955|        |      ;
db $84,$02,$27,$4E,$FA,$02,$01,$69   ;C3F95D|        |000002;
db $F9,$02,$91,$6B,$10,$02,$02,$20   ;C3F965|        |009102;
db $66,$69,$6E,$67,$20,$61,$6E,$20   ;C3F96D|        |000069;
db $0D,$BF,$6C,$65,$69,$73,$65,$20   ;C3F975|        |006CBF;
db $A0,$FD,$0D,$68,$2A,$72,$65,$6E   ;C3F97D|        |      ;
db $2E,$11,$AA,$E7,$46,$6C,$2A,$25   ;C3F985|        |00AA11;
db $65,$2C,$B5,$AD,$0D,$7D,$73,$74   ;C3F98D|        |00002C;
db $65,$6E,$20,$EE,$42,$7B,$75,$6D   ;C3F995|        |00006E;
db $65,$6E,$20,$0D,$47,$72,$65,$65   ;C3F99D|        |00006E;
db $6E,$20,$57,$6F,$6F,$64,$60,$73   ;C3F9A5|        |005720;
db $20,$67,$65,$66,$65,$72,$74,$69   ;C3F9AD|        |C36567;
db $67,$74,$20,$0D,$73,$69,$6E,$64   ;C3F9B5|        |000074;
db $2E,$11,$A8,$83,$ED,$DF,$62,$65   ;C3F9BD|        |00A811;
db $2D,$0D,$77,$65,$69,$73,$65,$6E   ;C3F9C5|        |00770D;
db $20,$6B,$61,$6E,$6E,$73,$74,$2C   ;C3F9CD|        |C3616B;
db $20,$BA,$83,$0D,$AD,$47,$72,$65   ;C3F9D5|        |C383BA;
db $65,$6E,$20,$57,$6F,$6F,$64,$20   ;C3F9DD|        |00006E;
db $6B,$6F,$6D,$6D,$73,$74,$2C,$11   ;C3F9E5|        |      ;
db $F5,$77,$69,$72,$20,$85,$DF,$0D   ;C3F9ED|        |000077;
db $62,$65,$66,$2A,$72,$64,$65,$72   ;C3F9F5|        |C3605D;
db $6E,$2E,$13,$40,$FF,$10,$8A,$E7   ;C3F9FD|        |00132E;
db $42,$6C,$7B,$74,$74,$65,$72,$20   ;C3FA05|        |      ;
db $AD,$0D,$47,$72,$65,$65,$6E,$20   ;C3FA0D|        |00470D;
db $57,$6F,$6F,$64,$21,$0D,$54,$75   ;C3FA15|        |00006F;
db $72,$62,$6F,$60,$73,$20,$53,$79   ;C3FA1D|        |000062;
db $6D,$62,$6F,$6C,$21,$11,$AA,$F5   ;C3FA25|        |006F62;
db $85,$FE,$0D,$54,$65,$6D,$70,$65   ;C3FA2D|        |0000FE;
db $6C,$20,$B8,$4C,$69,$63,$68,$74   ;C3FA35|        |00B820;
db $73,$20,$0D,$62,$72,$69,$6E,$67   ;C3FA3D|        |000020;
db $65,$6E,$2E,$13,$40,$FF           ;C3FA45|        |00006E;
COP #$AD                             ;C3FA4B|02AD    |      ;
db $08,$02,$A4,$02,$2A,$F0,$FF,$00   ;C3FA4D|        |      ;
db $00,$02,$2B,$00,$00,$00,$00,$02   ;C3FA55|        |      ;
db $2B,$10,$00,$00,$00,$02,$91,$02   ;C3FA5D|        |      ;
db $0C,$00,$00,$6D,$FA,$82,$01,$00   ;C3FA65|        |000000;
db $6B,$02,$91,$02,$0C,$00,$00,$77   ;C3FA6D|        |      ;
db $FA,$6B,$02,$85,$9F,$FA,$83,$02   ;C3FA75|        |      ;
db $2B,$F0,$FF,$00,$00,$02,$2A,$00   ;C3FA7D|        |      ;
db $00,$00,$00,$02,$2A,$10,$00,$00   ;C3FA85|        |      ;
db $00,$02,$80,$1A,$02,$82,$02,$23   ;C3FA8D|        |      ;
db $8E,$FA,$02,$09,$00,$80,$02,$27   ;C3FA95|        |0002FA;
db $C7,$FA,$A9,$80,$2F,$0C,$26,$03   ;C3FA9D|        |0000FA;
db $02,$91,$02,$2F,$00,$00,$FE,$FF   ;C3FAA5|        |      ;
db $02,$07,$00,$80,$B4,$FA,$6B,$02   ;C3FAAD|        |      ;
db $2F,$00,$00,$FE,$FF,$02,$09,$00   ;C3FAB5|        |FE0000;
db $00,$A9,$80,$2F,$1C,$26,$03,$02   ;C3FABD|        |      ;
db $86,$6B,$02,$AD,$08,$02,$A4,$02   ;C3FAC5|        |00006B;
db $2A,$F0,$FF,$00,$00,$02,$2B,$00   ;C3FACD|        |      ;
db $00,$F0,$FF,$02,$2B,$10,$00,$F0   ;C3FAD5|        |      ;
db $FF,$02,$91,$02,$0C,$00,$00,$E9   ;C3FADD|        |029102;
db $FA,$82,$01,$00,$6B,$02,$91,$02   ;C3FAE5|        |      ;
db $0C,$00,$00,$F3,$FA,$6B,$02,$85   ;C3FAED|        |000000;
db $1B,$FB,$83,$02,$2B,$F0,$FF,$00   ;C3FAF5|        |      ;
db $00,$02,$2A,$00,$00,$F0,$FF,$02   ;C3FAFD|        |      ;
db $2A,$10,$00,$F0,$FF,$02,$80,$19   ;C3FB05|        |      ;
db $02,$82,$02,$23,$0A,$FB,$02,$09   ;C3FB0D|        |      ;
db $00,$80,$02,$27,$4B,$FA,$A9,$80   ;C3FB15|        |      ;
db $2F,$0C,$26,$03,$02,$91,$02,$2F   ;C3FB1D|        |03260C;
db $00,$00,$02,$00,$02,$07,$00,$80   ;C3FB25|        |      ;
db $30,$FB,$6B,$02,$2F,$00,$00,$02   ;C3FB2D|        |C3FB2A;
db $00,$02,$09,$00,$00,$A9,$80,$2F   ;C3FB35|        |      ;
db $1C,$26,$03,$02,$86,$6B           ;C3FB3D|        |000326;
COP #$AD                             ;C3FB43|02AD    |      ;
db $08,$02,$A4,$02,$2A,$00,$00,$10   ;C3FB45|        |      ;
db $00,$02,$2B,$10,$00,$00,$00,$02   ;C3FB4D|        |      ;
db $2B,$10,$00,$F0,$FF,$02,$2B,$00   ;C3FB55|        |      ;
db $00,$00,$00,$02,$2B,$00,$00,$F0   ;C3FB5D|        |      ;
db $FF,$02,$91,$02,$0C,$00,$00,$71   ;C3FB65|        |029102;
db $FB,$82,$01,$00,$6B,$02,$91,$02   ;C3FB6D|        |      ;
db $0C,$00,$00,$7B,$FB,$6B,$02,$85   ;C3FB75|        |000000;
db $B7,$FB,$83,$02,$2B,$00,$00,$10   ;C3FB7D|        |0000FB;
db $00,$02,$2A,$10,$00,$00,$00,$02   ;C3FB85|        |      ;
db $2A,$10,$00,$F0,$FF,$02,$2A,$00   ;C3FB8D|        |      ;
db $00,$00,$00,$02,$2A,$00,$00,$F0   ;C3FB95|        |      ;
db $FF,$02,$80,$1B,$02,$82,$02,$22   ;C3FB9D|        |1B8002;
db $9E,$FB,$02,$09,$00,$80,$02,$23   ;C3FBA5|        |0002FB;
db $B3,$FB,$02,$27,$DF,$FB,$02,$27   ;C3FBAD|        |0000FB;
db $43,$FB,$A9,$80,$2F,$0C,$26,$03   ;C3FBB5|        |0000FB;
db $02,$91,$02,$2F,$FE,$FF,$00,$00   ;C3FBBD|        |      ;
db $02,$07,$00,$80,$CC,$FB,$6B,$02   ;C3FBC5|        |      ;
db $2F,$FE,$FF,$00,$00,$02,$09,$00   ;C3FBCD|        |00FFFE;
db $00,$A9,$80,$2F,$1C,$26,$03,$02   ;C3FBD5|        |      ;
db $86,$6B                           ;C3FBDD|        |00006B;
COP #$AD                             ;C3FBDF|02AD    |      ;
db $08,$02,$A4,$02,$87,$02,$2A,$00   ;C3FBE1|        |      ;
db $00,$10,$00,$02,$2B,$00,$00,$00   ;C3FBE9|        |      ;
db $00,$02,$2B,$00,$00,$F0,$FF,$02   ;C3FBF1|        |      ;
db $2B,$10,$00,$00,$00,$02,$2B,$10   ;C3FBF9|        |      ;
db $00,$F0,$FF,$02,$91,$02,$0C,$00   ;C3FC01|        |      ;
db $00,$0F,$FC,$82,$01,$00,$6B,$02   ;C3FC09|        |      ;
db $91,$02,$0C,$00,$00,$19,$FC,$6B   ;C3FC11|        |000002;
db $02,$85,$57,$FC,$83,$02,$2B,$00   ;C3FC19|        |      ;
db $00,$10,$00,$02,$2A,$00,$00,$00   ;C3FC21|        |      ;
db $00,$02,$2A,$00,$00,$F0,$FF,$02   ;C3FC29|        |      ;
db $2A,$10,$00,$00,$00,$02,$2A,$10   ;C3FC31|        |      ;
db $00,$F0,$FF,$02,$80,$1B,$02,$82   ;C3FC39|        |      ;
db $02,$22,$3C,$FC,$02,$09,$00,$80   ;C3FC41|        |      ;
db $02,$87,$02,$24,$53,$FC,$02,$27   ;C3FC49|        |      ;
db $43,$FB,$02,$27,$DF,$FB,$A9,$80   ;C3FC51|        |0000FB;
db $2F,$0C,$26,$03,$02,$91,$02,$2F   ;C3FC59|        |03260C;
db $02,$00,$00,$00,$02,$07,$00,$80   ;C3FC61|        |      ;
db $6C,$FC,$6B,$02,$2F,$02,$00,$00   ;C3FC69|        |006BFC;
db $00,$02,$09,$00,$00,$A9,$80,$2F   ;C3FC71|        |      ;
db $1C,$26,$03,$02,$86,$6B,$02,$92   ;C3FC79|        |000326;
db $3B,$02,$94,$02,$B0,$98,$FC,$83   ;C3FC81|        |      ;
db $40,$20,$02,$1B,$91,$FC,$F0,$00   ;C3FC89|        |      ;
db $02,$92,$3D,$02,$94,$80,$E7,$02   ;C3FC91|        |      ;
db $03,$F0,$02,$19,$0A,$A2,$FC,$80   ;C3FC99|        |0000F0;
db $0C,$A9,$80,$00,$22,$8A,$83,$83   ;C3FCA1|        |0080A9;
db $90,$03,$02,$39,$01,$02,$04,$02   ;C3FCA9|        |C3FCAE;
db $86,$6B,$BD,$02,$00,$38,$E9,$01   ;C3FCB1|        |00006B;
db $00,$18,$6D,$84,$03,$9D,$02,$00   ;C3FCB9|        |      ;
db $8D,$40,$03,$6B                   ;C3FCC1|        |000340;
PHX                                  ;C3FCC5|DA      |      ;
LDX.W #$0000                         ;C3FCC6|A20000  |      ;

CODE_C3FCC9:
LDA.W #$00A0                         ;C3FCC9|A9A000  |      ;
STA.L $7E7000,X                      ;C3FCCC|9F00707E|7E7000;
STA.L $7E7800,X                      ;C3FCD0|9F00787E|7E7800;
LDA.W #$7100                         ;C3FCD4|A90071  |      ;
STA.L $7E7001,X                      ;C3FCD7|9F01707E|7E7001;
LDA.W #$7900                         ;C3FCDB|A90079  |      ;
STA.L $7E7801,X                      ;C3FCDE|9F01787E|7E7801;
INX                                  ;C3FCE2|E8      |      ;
INX                                  ;C3FCE3|E8      |      ;
INX                                  ;C3FCE4|E8      |      ;
CPX.W #$0015                         ;C3FCE5|E01500  |      ;
BNE CODE_C3FCC9                      ;C3FCE8|D0DF    |C3FCC9;
LDA.W #$0000                         ;C3FCEA|A90000  |      ;
STA.L $7E7000,X                      ;C3FCED|9F00707E|7E7000;
STA.L $7E7800,X                      ;C3FCF1|9F00787E|7E7800;
PLX                                  ;C3FCF5|FA      |      ;
COP #$91                             ;C3FCF6|0291    |      ;
LDA.W $0000,X                        ;C3FCF8|BD0000  |810000;
INC A                                ;C3FCFB|1A      |      ;
CLC                                  ;C3FCFC|18      |      ;
ADC.W $0382                          ;C3FCFD|6D8203  |810382;
STA.W $0000,X                        ;C3FD00|9D0000  |810000;
STA.W $033E                          ;C3FD03|8D3E03  |81033E;
LDA.W $0002,X                        ;C3FD06|BD0200  |810002;
INC A                                ;C3FD09|1A      |      ;
CLC                                  ;C3FD0A|18      |      ;
ADC.W $0384                          ;C3FD0B|6D8403  |810384;
STA.W $0002,X                        ;C3FD0E|9D0200  |810002;
STA.W $0340                          ;C3FD11|8D4003  |810340;
PHX                                  ;C3FD14|DA      |      ;
LDA.W $0312                          ;C3FD15|AD1203  |810312;
LSR A                                ;C3FD18|4A      |      ;
LSR A                                ;C3FD19|4A      |      ;
CLC                                  ;C3FD1A|18      |      ;
ADC.W $0340                          ;C3FD1B|6D4003  |810340;
AND.W #$001F                         ;C3FD1E|291F00  |      ;
ASL A                                ;C3FD21|0A      |      ;
TAX                                  ;C3FD22|AA      |      ;
LDY.W #$0000                         ;C3FD23|A00000  |      ;
PHB                                  ;C3FD26|8B      |      ;
SEP #$20                             ;C3FD27|E220    |      ;
LDA.B #$7E                           ;C3FD29|A97E    |      ;
PHA                                  ;C3FD2B|48      |      ;
PLB                                  ;C3FD2C|AB      |      ;
REP #$20                             ;C3FD2D|C220    |      ;

CODE_C3FD2F:
LDA.L UNREACH_83FD6D,X               ;C3FD2F|BF6DFD83|83FD6D;
CLC                                  ;C3FD33|18      |      ;
ADC.W $033E                          ;C3FD34|6D3E03  |7E033E;
STA.W $7100,Y                        ;C3FD37|990071  |7E7100;
LDA.L UNREACH_83FD6D,X               ;C3FD3A|BF6DFD83|83FD6D;
CLC                                  ;C3FD3E|18      |      ;
ADC.W $0340                          ;C3FD3F|6D4003  |7E0340;
STA.W $7900,Y                        ;C3FD42|990079  |7E7900;
INX                                  ;C3FD45|E8      |      ;
INX                                  ;C3FD46|E8      |      ;
INY                                  ;C3FD47|C8      |      ;
INY                                  ;C3FD48|C8      |      ;
CPY.W #$0040                         ;C3FD49|C04000  |      ;
BNE CODE_C3FD2F                      ;C3FD4C|D0E1    |C3FD2F;
PLB                                  ;C3FD4E|AB      |      ;
SEP #$20                             ;C3FD4F|E220    |      ;
LDA.B #$0D                           ;C3FD51|A90D    |      ;
XBA                                  ;C3FD53|EB      |      ;
LDA.B #$7E                           ;C3FD54|A97E    |      ;
LDY.W #$7000                         ;C3FD56|A00070  |      ;
JSL.L CODE_C29873                    ;C3FD59|22739882|829873;
LDA.B #$0E                           ;C3FD5D|A90E    |      ;
XBA                                  ;C3FD5F|EB      |      ;
LDA.B #$7E                           ;C3FD60|A97E    |      ;
LDY.W #$7800                         ;C3FD62|A00078  |      ;
JSL.L CODE_C29873                    ;C3FD65|22739882|829873;
REP #$20                             ;C3FD69|C220    |      ;
PLX                                  ;C3FD6B|FA      |      ;
RTL                                  ;C3FD6C|6B      |      ;
db $00,$00,$01,$00,$02,$00,$02,$00   ;C3FD6D|        |      ;
db $03,$00,$03,$00,$04,$00,$04,$00   ;C3FD75|        |000000;
db $04,$00,$04,$00,$04,$00,$03,$00   ;C3FD7D|        |000000;
db $03,$00,$02,$00,$02,$00,$01,$00   ;C3FD85|        |000000;
db $00,$00,$FF,$FF,$FE,$FF,$FE,$FF   ;C3FD8D|        |      ;
db $FD,$FF,$FD,$FF,$FC,$FF,$FC,$FF   ;C3FD95|        |00FDFF;
db $FC,$FF,$FC,$FF,$FC,$FF,$FD,$FF   ;C3FD9D|        |C3FCFF;
db $FD,$FF,$FE,$FF,$FE,$FF,$FF,$FF   ;C3FDA5|        |00FEFF;
db $00,$00,$01,$00,$02,$00,$02,$00   ;C3FDAD|        |      ;
db $03,$00,$03,$00,$04,$00,$04,$00   ;C3FDB5|        |000000;
db $04,$00,$04,$00,$04,$00,$03,$00   ;C3FDBD|        |000000;
db $03,$00,$02,$00,$02,$00,$01,$00   ;C3FDC5|        |000000;
db $00,$00,$FF,$FF,$FE,$FF,$FE,$FF   ;C3FDCD|        |      ;
db $FD,$FF,$FD,$FF,$FC,$FF,$FC,$FF   ;C3FDD5|        |00FDFF;
db $FC,$FF,$FC,$FF,$FC,$FF,$FD,$FF   ;C3FDDD|        |C3FCFF;
db $FD,$FF,$FE,$FF,$FE,$FF,$FF,$FF   ;C3FDE5|        |00FEFF;
PHX                                  ;C3FDED|DA      |      ;
LDX.W #$0000                         ;C3FDEE|A20000  |      ;

CODE_C3FDF1:
LDA.W #$0090                         ;C3FDF1|A99000  |      ;
STA.L $7E7000,X                      ;C3FDF4|9F00707E|7E7000;
STA.L $7E7800,X                      ;C3FDF8|9F00787E|7E7800;
LDA.W #$7100                         ;C3FDFC|A90071  |      ;
STA.L $7E7001,X                      ;C3FDFF|9F01707E|7E7001;
LDA.W #$7900                         ;C3FE03|A90079  |      ;
STA.L $7E7801,X                      ;C3FE06|9F01787E|7E7801;
INX                                  ;C3FE0A|E8      |      ;
INX                                  ;C3FE0B|E8      |      ;
INX                                  ;C3FE0C|E8      |      ;
CPX.W #$002A                         ;C3FE0D|E02A00  |      ;
BNE CODE_C3FDF1                      ;C3FE10|D0DF    |C3FDF1;
LDA.W #$0000                         ;C3FE12|A90000  |      ;
STA.L $7E7000,X                      ;C3FE15|9F00707E|7E7000;
STA.L $7E7800,X                      ;C3FE19|9F00787E|7E7800;
PLX                                  ;C3FE1D|FA      |      ;
COP #$91                             ;C3FE1E|0291    |      ;
PHX                                  ;C3FE20|DA      |      ;
LDA.W $0312                          ;C3FE21|AD1203  |810312;
LSR A                                ;C3FE24|4A      |      ;
CLC                                  ;C3FE25|18      |      ;
ADC.W bg1_vofs                          ;C3FE26|6D3C03  |81033C;
AND.W #$000F                         ;C3FE29|290F00  |      ;
ASL A                                ;C3FE2C|0A      |      ;
TAX                                  ;C3FE2D|AA      |      ;
LDY.W #$0000                         ;C3FE2E|A00000  |      ;
SEP #$20                             ;C3FE31|E220    |      ;
PHB                                  ;C3FE33|8B      |      ;
LDA.B #$7E                           ;C3FE34|A97E    |      ;
PHA                                  ;C3FE36|48      |      ;
PLB                                  ;C3FE37|AB      |      ;

CODE_C3FE38:
LDA.L UNREACH_83FE74,X               ;C3FE38|BF74FE83|83FE74;
CLC                                  ;C3FE3C|18      |      ;
ADC.W bg1_hofs                          ;C3FE3D|6D3A03  |7E033A;
STA.W $7100,Y                        ;C3FE40|990071  |7E7100;
LDA.L UNREACH_83FE74,X               ;C3FE43|BF74FE83|83FE74;
CLC                                  ;C3FE47|18      |      ;
ADC.W bg1_vofs                          ;C3FE48|6D3C03  |7E033C;
STA.W $7900,Y                        ;C3FE4B|990079  |7E7900;
INX                                  ;C3FE4E|E8      |      ;
INX                                  ;C3FE4F|E8      |      ;
INY                                  ;C3FE50|C8      |      ;
INY                                  ;C3FE51|C8      |      ;
CPY.W #$0020                         ;C3FE52|C02000  |      ;
BNE CODE_C3FE38                      ;C3FE55|D0E1    |C3FE38;
PLB                                  ;C3FE57|AB      |      ;
LDA.B #$0F                           ;C3FE58|A90F    |      ;
XBA                                  ;C3FE5A|EB      |      ;
LDA.B #$7E                           ;C3FE5B|A97E    |      ;
LDY.W #$7000                         ;C3FE5D|A00070  |      ;
JSL.L CODE_C29873                    ;C3FE60|22739882|829873;
LDA.B #$10                           ;C3FE64|A910    |      ;
XBA                                  ;C3FE66|EB      |      ;
LDA.B #$7E                           ;C3FE67|A97E    |      ;
LDY.W #$7800                         ;C3FE69|A00078  |      ;
JSL.L CODE_C29873                    ;C3FE6C|22739882|829873;
REP #$20                             ;C3FE70|C220    |      ;
PLX                                  ;C3FE72|FA      |      ;
RTL                                  ;C3FE73|6B      |      ;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C3FE74|        |      ;
db $01,$00,$01,$00,$01,$00,$01,$00   ;C3FE7C|        |000000;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C3FE84|        |      ;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C3FE8C|        |FFFFFF;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C3FE94|        |      ;
db $01,$00,$01,$00,$01,$00,$01,$00   ;C3FE9C|        |000000;
db $00,$00,$00,$00,$00,$00,$00,$00   ;C3FEA4|        |      ;
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;C3FEAC|        |FFFFFF;
db $10,$8F,$B3,$BC,$0D,$57,$65,$6C   ;C3FEB4|        |C3FE45;
db $74,$2E,$20,$4E,$69,$6D,$6D,$60   ;C3FEBC|        |00002E;
db $20,$B2,$0D,$64,$69,$65,$73,$2E   ;C3FEC4|        |C30DB2;
db $11,$02,$02,$20,$C1,$45,$58,$50   ;C3FECC|        |000002;
db $21,$13,$40,$FF,$10,$96,$83,$E3   ;C3FED4|        |000013;
db $20,$0D,$47,$72,$65,$65,$6E,$20   ;C3FEDC|        |C3470D;
db $57,$6F,$6F,$64,$20,$7A,$75,$72   ;C3FEE4|        |00006F;
db $5B,$63,$6B,$3F,$0C,$4E,$75,$6E   ;C3FEEC|        |      ;
db $20,$67,$75,$74,$2C,$20,$76,$69   ;C3FEF4|        |C37567;
db $65,$6C,$20,$47,$6C,$5B,$63,$6B   ;C3FEFC|        |00006C;
db $2E,$13,$40,$FF,$4B,$6F,$6D,$6D   ;C3FF04|        |004013;
db $60,$20,$FD,$DB,$7A,$75,$72,$5B   ;C3FF0C|        |      ;
db $63,$6B,$2C,$0D,$F3,$83,$E3,$47   ;C3FF14|        |00006B;
db $72,$65,$65,$6E,$0D,$57,$6F,$6F   ;C3FF1C|        |000065;
db $64,$20,$7A,$75,$72,$5B,$63,$6B   ;C3FF24|        |000020;
db $6B,$65,$68,$72,$65,$6E,$20,$0D   ;C3FF2C|        |      ;
db $6D,$2A,$63,$68,$74,$65,$73,$74   ;C3FF34|        |00632A;
db $2E,$13,$40,$FF,$12,$08,$06,$04   ;C3FF3C|        |004013;
db $0C

padbyte $FF : pad $C40000
