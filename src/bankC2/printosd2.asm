
printOsdStringFromBank2:
    PHP
    PHB
    SEP #$20
    ; Load Bank 2
    LDA.B #$82
    PHA
    PLB

    LDA.W $03FB
    PHA
    LDA.W text_modifier
    PHA
    LDA.B #$20
    STA.W text_modifier
    STZ.W $03FB
    PHX

.loop:
    JSR.W load_next_char_or_word
    CMP.B #$14 : BNE + : BRL .print_spaces : +
    CMP.B #$13 : BEQ .load_new_txt_ptr
    CMP.B #$0D : BNE + : BRL .print_newline : +
    BCS .print_char
    CMP.B #$00 : BNE + : BRL .wait_and_end : +
    DEC : BNE + : BRL .new_pos : +
    DEC : BNE + : BRL .quick_print : +
    DEC : BNE + : BRL .color_text : +
    DEC : BNE + : BRL .print_healthbar : +
    DEC : BNE + : BRL .table_lookup : +
    DEC : BNE + : BRL .print_dec_value : +
    DEC : BNE + : BRL .draw_textbox : +
    DEC : BNE + : BRL .clearTextbox : +
    DEC : BNE + : BRL .cursive : +
    DEC : BNE + : BRL .unknown : +
    DEC : BNE + : BRL .unknown2 : +
    BRA .loop


.print_char:
    ORA.W $03FB
    STA.L L3_Text, X
    XBA
    LDA.W text_modifier
    STA.L L3_Text+1, X
    INX
    INX
    BIT.B #2
    BEQ + : BRL .loop : +

    INC A
    STA.L $7F6FBE+1, X
    XBA
    STA.L $7F6FBE, X
    BRL .loop

.load_new_txt_ptr: ; $13
    LDA.W 1, Y
    XBA
    LDA.W 0, Y
    TAY
    BRL .loop

.print_spaces: ; $14
    LDA.B #$20
    XBA
    LDA.W 0, Y
    INY

..space_loop:
    XBA
    STA.L L3_Text, X
    INX
    INX
    XBA
    DEC A
    BNE ..space_loop
    BRL .loop

.unknown2:
    LDA.W 0, Y
    INY
    STA.B 0
    REP #$20
    LDA.W 0, Y
    INY
    INY
    PHY
    TAY
    LDA.W 0, Y
    AND.W #$FF
    SEP #$20
    TAY
    BEQ +
    LDA.W text_modifier
    XBA
    LDA.B $00
    REP #$20

-:
    STA.L L3_Text, X
    INX
    INX
    DEY
    BNE -
    SEP #$20

+:
    PLY
    BRL .loop

.unknown:
    LDA.W $03FB
    EOR.B #$80
    STA.W $03FB
    BRL .loop

.cursive:
    LDA.W $03EB
    EOR.B #$02
    STA.W $03EB
    BRL .loop

.clearTextbox:
    PHX
    REP #$20
    LDX.W 0, Y
    INY
    INY
    SEP #$20
    JSL.L clearTextbox
    PLX
    BRL .loop

.draw_textbox:
    LDA.W 0, Y
    INY
    STA.B 0
    LDA.W $0000, Y
    INY
    STA.B 2
    STX.W textbox_tlc
    JSR.W CODE_C2AB48
    REP #$20
    PLA
    CLC
    ADC.W #(!Row_Width * 2) + 2 ; set the new position to the first position inside of the box
    TAX
    PHX
    SEP #$20
    BRL .loop

.print_dec_value:
    LDA.W 0, Y
    INY
    STA.B 0
    STA.B 2
    REP #$20
    DEC A
    AND.W #$FF
    ASL A
    PHX
    CLC
    ADC.B 1, S
    STA.B 1, S
    TAX
    LDA.W 0, Y
    INY
    INY
    PHY
    TAY
    SEP #$20
    LDA.W text_modifier
    XBA

.dec_loop1:
    LDA.W 0, Y
    AND.B #$0F
    ORA.B #$30
    REP #$20
    STA.L L3_Text, X
    DEX
    DEX
    SEP #$20
    DEC.B $00
    BEQ .dec_loop2
    LDA.W 0, Y
    INY
    AND.B #$F0
    LSR A
    LSR A
    LSR A
    LSR A
    ORA.B #$30
    REP #$20
    STA.L L3_Text, X
    DEX
    DEX
    SEP #$20
    DEC.B $00
    BNE .dec_loop1

.dec_loop2:
    INX
    INX
    DEC.B $02
    BEQ +
    LDA.L L3_Text, X
    CMP.B #$30
    BNE +
    LDA.B #$20
    STA.L L3_Text, X
    BRA .dec_loop2

+:
    XBA
    BIT.B #$02
    BNE .dec_end
    XBA
    INC.B $02

.dec_loop3:
    LDA.L L3_Text, X
    REP #$20
    ORA.W #$0100
    STA.L L3_Text-!Row_Width, X
    AND.W #$FEFF
    SEP #$20
    INX
    INX
    DEC.B $02
    BNE .dec_loop3

.dec_end:
    PLY
    PLX
    INX
    INX
    BRL .loop

.table_lookup:
    REP #$20
    LDA.W $0000, Y
    INY
    INY
    STA.B $00
    LDA.W $0000, Y
    INY
    INY
    PHY
    TAY
    LDA.W $0000, Y
    ASL A
    CLC
    ADC.B $00
    TAY
    LDA.W $0000, Y
    TAY
    SEP #$20
    LDA.W text_modifier
    XBA
    JSR.W CODE_C2AA33
    PLY
    BRL .loop

.print_healthbar:
    REP #$20
    PHY
    LDA.W $0000, Y
    TAY
    LDA.W $0000, Y
    STA.B $00
    PLY
    PHY
    LDA.W $0002, Y
    TAY
    LDA.W $0000, Y
    STA.B $02
    SEP #$20
    JSR.W CODE_C2AAAA
    PLY
    INY
    INY
    INY
    INY
    BRL .loop

.color_text:
    LDA.W text_modifier
    AND.B #$E3
    ORA.W $0000, Y
    INY
    STA.W text_modifier
    BRL .loop

.quick_print:
    LDA.W $0000, Y
    INY
    PHY
    REP #$20
    AND.W #$00FF
    ASL A
    TAY
    LDA.W osd2lut, Y
    TAY
    SEP #$20
    LDA.W text_modifier
    XBA
    JSR.W CODE_C2AA7D
    PLY
    BRL .loop

.new_pos:
    LDA.W $0001, Y
    STA.B $02, S
    XBA
    LDA.W $0000, Y
    STA.B $01, S
    INY
    INY
    TAX
    BRL .loop

.print_newline:
    REP #$20
    PLA
    CLC
    ADC.W #!Row_Width
    TAX
    PHA
    SEP #$20
    BRL .loop

.wait_and_end:
    PLX
    PLA
    STA.W text_modifier
    PLA
    STA.W $03FB
    LDA.B #$01
    TSB.W $03BA
    PLB
    PLP
    RTL

load_next_char_or_word:
    LDA.W $0000,Y
    BMI .do_lookup ; if the high bit is set (0x80), then do a lookup
    INY
    RTS

.do_lookup:
    INY
    PHB
    PHY
    REP #$20

; use `A` and multiply it by 12,
    AND.W #$007F
    PHA
    ASL
    CLC
    ADC.B 1, S
    ASL
    ASL
    TAY
    PLA
    SEP #$20
; switch to bank $C6, where the lut is located
    LDA.B #bank(Words_LUT)
    PHA
    PLB
    LDA.B #12 ; size of one word in the LUT
    STA.B $0C ; store max size of string
    LDA.W text_modifier
    XBA

.print_word:
    LDA.W Words_LUT, Y
    BEQ .zero
    INY
    ORA.W $03FB
    REP #$20
    STA.L L3_Text, X
    INX
    INX
    BIT.W #$0200
    BNE .lower
    ORA.W #$0100
    STA.L $7F6FBE, X
    AND.W #$FEFF

.lower:
    SEP #$20
    DEC.B $0C
    BNE .print_word

.zero:
    LDA.B #$20
    ORA.W $03FB
    REP #$20
    STA.L L3_Text, X
    INX
    INX
    BIT.W #$0200
    BNE .lower2
    ORA.W #$0100
    STA.L $7F6FBE,X
    AND.W #$FEFF

.lower2:
    SEP #$20
    PLY
    PLB
    BRA load_next_char_or_word

CODE_C2AA33:
LDA.W $0000,Y                        ;C2AA33|B90000  |820000;
BMI CODE_C2AA5E                      ;C2AA36|3026    |C2AA5E;
BNE CODE_C2AA3B                      ;C2AA38|D001    |C2AA3B;
RTS                                  ;C2AA3A|60      |      ;

CODE_C2AA3B:
CMP.B #$14                           ;C2AA3B|C914    |      ;
BEQ CODE_C2AA64                      ;C2AA3D|F025    |C2AA64;
INY                                  ;C2AA3F|C8      |      ;
ORA.W $03FB                          ;C2AA40|0DFB03  |8203FB;
REP #$20                             ;C2AA43|C220    |      ;
STA.L L3_Text,X                      ;C2AA45|9F00707F|7F7000;
INX                                  ;C2AA49|E8      |      ;
INX                                  ;C2AA4A|E8      |      ;
BIT.W #$0200                         ;C2AA4B|890002  |      ;
BNE CODE_C2AA5A                      ;C2AA4E|D00A    |C2AA5A;
ORA.W #$0100                         ;C2AA50|090001  |      ;
STA.L $7F6FBE,X                      ;C2AA53|9FBE6F7F|7F6FBE;
AND.W #$FEFF                         ;C2AA57|29FFFE  |      ;

CODE_C2AA5A:
SEP #$20                             ;C2AA5A|E220    |      ;
BRA CODE_C2AA33                      ;C2AA5C|80D5    |C2AA33;

CODE_C2AA5E:
JSR.W load_next_char_or_word                    ;C2AA5E|20C5A9  |C2A9C5;
DEY                                  ;C2AA61|88      |      ;
BRA CODE_C2AA33                      ;C2AA62|80CF    |C2AA33;

CODE_C2AA64:
LDA.B #$20                           ;C2AA64|A920    |      ;
ORA.W $03FB                          ;C2AA66|0DFB03  |8203FB;
XBA                                  ;C2AA69|EB      |      ;
INY                                  ;C2AA6A|C8      |      ;
LDA.W $0000,Y                        ;C2AA6B|B90000  |820000;
INY                                  ;C2AA6E|C8      |      ;

CODE_C2AA6F:
XBA                                  ;C2AA6F|EB      |      ;
STA.L L3_Text,X                      ;C2AA70|9F00707F|7F7000;
INX                                  ;C2AA74|E8      |      ;
INX                                  ;C2AA75|E8      |      ;
XBA                                  ;C2AA76|EB      |      ;
DEC A                                ;C2AA77|3A      |      ;
BNE CODE_C2AA6F                      ;C2AA78|D0F5    |C2AA6F;
BRL CODE_C2AA33                      ;C2AA7A|82B6FF  |C2AA33;

CODE_C2AA7D:
LDA.W $0000,Y                        ;C2AA7D|B90000  |820000;
BMI UNREACH_C2AAA4                   ;C2AA80|3022    |C2AAA4;
BNE CODE_C2AA85                      ;C2AA82|D001    |C2AA85;
RTS                                  ;C2AA84|60      |      ;

CODE_C2AA85:
INY                                  ;C2AA85|C8      |      ;
ORA.W $03FB                          ;C2AA86|0DFB03  |8203FB;
REP #$20                             ;C2AA89|C220    |      ;
STA.L L3_Text,X                      ;C2AA8B|9F00707F|7F7000;
INX                                  ;C2AA8F|E8      |      ;
INX                                  ;C2AA90|E8      |      ;
BIT.W #$0200                         ;C2AA91|890002  |      ;
BNE CODE_C2AAA0                      ;C2AA94|D00A    |C2AAA0;
ORA.W #$0100                         ;C2AA96|090001  |      ;
STA.L $7F6FBE,X                      ;C2AA99|9FBE6F7F|7F6FBE;
AND.W #$FEFF                         ;C2AA9D|29FFFE  |      ;

CODE_C2AAA0:
SEP #$20                             ;C2AAA0|E220    |      ;
BRA CODE_C2AA7D                      ;C2AAA2|80D9    |C2AA7D;

UNREACH_C2AAA4:
db $20,$C5,$A9,$88,$80,$D3           ;C2AAA4|        |C2A9C5;

CODE_C2AAAA:
PHX                                  ;C2AAAA|DA      |      ;
LDX.W #$0000                         ;C2AAAB|A20000  |      ;
LDA.B $00                            ;C2AAAE|A500    |000000;

CODE_C2AAB0:
SEC                                  ;C2AAB0|38      |      ;
SBC.B #$0A                           ;C2AAB1|E90A    |      ;
BMI CODE_C2AAB9                      ;C2AAB3|3004    |C2AAB9;
INX                                  ;C2AAB5|E8      |      ;
INX                                  ;C2AAB6|E8      |      ;
BRA CODE_C2AAB0                      ;C2AAB7|80F7    |C2AAB0;

CODE_C2AAB9:
LDA.B $01,S                          ;C2AAB9|A301    |000001;
CMP.B #$CC                           ;C2AABB|C9CC    |      ;
BNE CODE_C2AAD1                      ;C2AABD|D012    |C2AAD1;
LDA.L UNREACH_81FB2F,X               ;C2AABF|BF2FFB81|81FB2F;
STA.L $7F0014                        ;C2AAC3|8F14007F|7F0014;
LDA.L UNREACH_81FB30,X               ;C2AAC7|BF30FB81|81FB30;
STA.L $7F0015                        ;C2AACB|8F15007F|7F0015;
BRA CODE_C2AAE1                      ;C2AACF|8010    |C2AAE1;

CODE_C2AAD1:
LDA.L UNREACH_81FB2F,X               ;C2AAD1|BF2FFB81|81FB2F;
STA.L $7F001C                        ;C2AAD5|8F1C007F|7F001C;
LDA.L UNREACH_81FB30,X               ;C2AAD9|BF30FB81|81FB30;
STA.L $7F001D                        ;C2AADD|8F1D007F|7F001D;

CODE_C2AAE1:
LDA.B $00                            ;C2AAE1|A500    |000000;
CMP.B #$33                           ;C2AAE3|C933    |      ;
BCC CODE_C2AAE9                      ;C2AAE5|9002    |C2AAE9;
LDA.B #$32                           ;C2AAE7|A932    |      ;

CODE_C2AAE9:
STA.B $00                            ;C2AAE9|8500    |000000;
LDA.B $02                            ;C2AAEB|A502    |000002;
CMP.B #$33                           ;C2AAED|C933    |      ;
BCC CODE_C2AAF3                      ;C2AAEF|9002    |C2AAF3;
LDA.B #$32                           ;C2AAF1|A932    |      ;

CODE_C2AAF3:
STA.B $02                            ;C2AAF3|8502    |000002;
PLX                                  ;C2AAF5|FA      |      ;
LDA.B $00                            ;C2AAF6|A500    |000000;
LSR A                                ;C2AAF8|4A      |      ;
BEQ CODE_C2AB0A                      ;C2AAF9|F00F    |C2AB0A;
PHP                                  ;C2AAFB|08      |      ;

CODE_C2AAFC:
XBA                                  ;C2AAFC|EB      |      ;
LDA.B #$1B                           ;C2AAFD|A91B    |      ;
STA.L L3_Text,X                      ;C2AAFF|9F00707F|7F7000;
INX                                  ;C2AB03|E8      |      ;
INX                                  ;C2AB04|E8      |      ;
XBA                                  ;C2AB05|EB      |      ;
DEC A                                ;C2AB06|3A      |      ;
BNE CODE_C2AAFC                      ;C2AB07|D0F3    |C2AAFC;
PLP                                  ;C2AB09|28      |      ;

CODE_C2AB0A:
BCS CODE_C2AB13                      ;C2AB0A|B007    |C2AB13;
LDA.B $02                            ;C2AB0C|A502    |000002;
SEC                                  ;C2AB0E|38      |      ;
SBC.B $00                            ;C2AB0F|E500    |000000;
BRA CODE_C2AB2D                      ;C2AB11|801A    |C2AB2D;

CODE_C2AB13:
LDA.B #$1C                           ;C2AB13|A91C    |      ;
STA.L L3_Text,X                      ;C2AB15|9F00707F|7F7000;
LDA.B $02                            ;C2AB19|A502    |000002;
SEC                                  ;C2AB1B|38      |      ;
SBC.B $00                            ;C2AB1C|E500    |000000;
BEQ CODE_C2AB47                      ;C2AB1E|F027    |C2AB47;
XBA                                  ;C2AB20|EB      |      ;
LDA.B #$1D                           ;C2AB21|A91D    |      ;
STA.L L3_Text,X                      ;C2AB23|9F00707F|7F7000;
XBA                                  ;C2AB27|EB      |      ;
INX                                  ;C2AB28|E8      |      ;
INX                                  ;C2AB29|E8      |      ;
DEC A                                ;C2AB2A|3A      |      ;
BEQ CODE_C2AB47                      ;C2AB2B|F01A    |C2AB47;

CODE_C2AB2D:
LSR A                                ;C2AB2D|4A      |      ;
BEQ CODE_C2AB3F                      ;C2AB2E|F00F    |C2AB3F;
PHP                                  ;C2AB30|08      |      ;

CODE_C2AB31:
XBA                                  ;C2AB31|EB      |      ;
LDA.B #$1E                           ;C2AB32|A91E    |      ;
STA.L L3_Text,X                      ;C2AB34|9F00707F|7F7000;
INX                                  ;C2AB38|E8      |      ;
INX                                  ;C2AB39|E8      |      ;
XBA                                  ;C2AB3A|EB      |      ;
DEC A                                ;C2AB3B|3A      |      ;
BNE CODE_C2AB31                      ;C2AB3C|D0F3    |C2AB31;
PLP                                  ;C2AB3E|28      |      ;

CODE_C2AB3F:
BCC CODE_C2AB47                      ;C2AB3F|9006    |C2AB47;
LDA.B #$1F                           ;C2AB41|A91F    |      ;
STA.L L3_Text,X                      ;C2AB43|9F00707F|7F7000;

CODE_C2AB47:
RTS                                  ;C2AB47|60      |      ;

CODE_C2AB48:
PHX                                  ;C2AB48|DA      |      ;
LDA.B #$01                           ;C2AB49|A901    |      ;
STA.L L3_Text,X                      ;C2AB4B|9F00707F|7F7000;
LDA.B $00                            ;C2AB4F|A500    |000000;
STA.B $0C                            ;C2AB51|850C    |00000C;
LDA.B #$03                           ;C2AB53|A903    |      ;

CODE_C2AB55:
STA.L $7F7002,X                      ;C2AB55|9F02707F|7F7002;
INX                                  ;C2AB59|E8      |      ;
INX                                  ;C2AB5A|E8      |      ;
DEC.B $0C                            ;C2AB5B|C60C    |00000C;
BNE CODE_C2AB55                      ;C2AB5D|D0F6    |C2AB55;
LDA.B #$02                           ;C2AB5F|A902    |      ;
STA.L $7F7002,X                      ;C2AB61|9F02707F|7F7002;
REP #$20                             ;C2AB65|C220    |      ;
PLA                                  ;C2AB67|68      |      ;
CLC                                  ;C2AB68|18      |      ;
ADC.W #$0040                         ;C2AB69|694000  |      ;
TAX                                  ;C2AB6C|AA      |      ;
SEP #$20                             ;C2AB6D|E220    |      ;
LDA.B $02                            ;C2AB6F|A502    |000002;
STA.B $0C                            ;C2AB71|850C    |00000C;

CODE_C2AB73:
PHX                                  ;C2AB73|DA      |      ;
LDA.B #$07                           ;C2AB74|A907    |      ;
STA.L L3_Text,X                      ;C2AB76|9F00707F|7F7000;
LDA.B $00                            ;C2AB7A|A500    |000000;
STA.B $0E                            ;C2AB7C|850E    |00000E;
STZ.B $0F                            ;C2AB7E|640F    |00000F;
LDA.W $03EB                          ;C2AB80|ADEB03  |8203EB;
XBA                                  ;C2AB83|EB      |      ;
LDA.B #$20                           ;C2AB84|A920    |      ;
REP #$20                             ;C2AB86|C220    |      ;

CODE_C2AB88:
STA.L $7F7002,X                      ;C2AB88|9F02707F|7F7002;
INX                                  ;C2AB8C|E8      |      ;
INX                                  ;C2AB8D|E8      |      ;
DEC.B $0E                            ;C2AB8E|C60E    |00000E;
BNE CODE_C2AB88                      ;C2AB90|D0F6    |C2AB88;
SEP #$20                             ;C2AB92|E220    |      ;
LDA.B #$08                           ;C2AB94|A908    |      ;
STA.L $7F7002,X                      ;C2AB96|9F02707F|7F7002;
REP #$20                             ;C2AB9A|C220    |      ;
PLA                                  ;C2AB9C|68      |      ;
CLC                                  ;C2AB9D|18      |      ;
ADC.W #$0040                         ;C2AB9E|694000  |      ;
TAX                                  ;C2ABA1|AA      |      ;
SEP #$20                             ;C2ABA2|E220    |      ;
DEC.B $0C                            ;C2ABA4|C60C    |00000C;
BNE CODE_C2AB73                      ;C2ABA6|D0CB    |C2AB73;
LDA.B #$05                           ;C2ABA8|A905    |      ;
STA.L L3_Text,X                      ;C2ABAA|9F00707F|7F7000;
LDA.B $00                            ;C2ABAE|A500    |000000;
STA.B $0C                            ;C2ABB0|850C    |00000C;
LDA.B #$04                           ;C2ABB2|A904    |      ;

CODE_C2ABB4:
STA.L $7F7002,X                      ;C2ABB4|9F02707F|7F7002;
INX                                  ;C2ABB8|E8      |      ;
INX                                  ;C2ABB9|E8      |      ;
DEC.B $0C                            ;C2ABBA|C60C    |00000C;
BNE CODE_C2ABB4                      ;C2ABBC|D0F6    |C2ABB4;
LDA.B #$06                           ;C2ABBE|A906    |      ;
STA.L $7F7002,X                      ;C2ABC0|9F02707F|7F7002;
RTS                                  ;C2ABC4|60      |      ;

clearTextbox:
    PHY
    LDA.L L3_Text, X
    CMP.B #1
    BNE .end
    STZ.B $00
    STZ.B $01
    PHX

.first_loop:
    LDA.L L3_Text, X
    CMP.B #2
    BEQ ..break
    INX
    INX
    INC.B 0
    BRA .first_loop

..break:
    PLX

.second_loop:
    REP #$20
    LDA.B $00
    STA.B $0C
    PHX
    LDA.W #' '<<8

..inner_loop:
    STA.L L3_Text, X
    INX
    INX
    DEC.B $0C
    BNE ..inner_loop
    LDA.L L3_Text, X
    TAY
    LDA.W #$2000
    STA.L L3_Text,X
    PLX
    TXA
    CLC
    ADC.W #$0040
    TAX
    SEP #$20
    TYA
    CMP.B #$06
    BNE .second_loop

.end:
    PLY
    RTL
