; Game Title
org $00FFC0
db "SOULBLAZER - 1 USA"
padbyte $20
pad $00FFD5
warnpc $00FFD5


org $00FFD5
db $20 ; Map Mode:          LoRom
db $02 ; Cartridge Type:    ROM, RAM and Battery
db $0A ; ROM Size:          2^0A = 1024kB
db $03 ; RAM Size:          2^03 = 8kB
db $01 ; Destination Code:  USA
db $B4 ; Developer Id:      
db $00 ; Mask ROM Version:  is zero

dw $AAAA,$5555 ; ROM Verification:  will be override by asar


dw $0000 ; unused
dw $0080                                                                        ;00FFE2|        |000080;
    dw Native_mode_COP                                                              ;00FFE4|        |00D61E;
    dw Native_mode_BRK                                                              ;00FFE6|        |00D5FC;
    dw $0000                                                                        ;00FFE8|        |000000;
    dw Native_mode_NMI                                                              ;00FFEA|        |008342;
    dw $0000                                                                        ;00FFEC|        |000000;
    dw Native_mode_IRQ                                                              ;00FFEE|        |0085A5;
    dw $0000                                                                        ;00FFF0|        |000000;
    dw $0000                                                                        ;00FFF2|        |000000;
    dw $0000                                                                        ;00FFF4|        |000000;
    dw CODE_008900                                                                  ;00FFF6|        |008900;
    dw $0000                                                                        ;00FFF8|        |000000;
    dw $0015                                                                        ;00FFFA|        |000015;
    dw Start                                                                        ;00FFFC|        |008000;
    dw $D011
    ; dw UNREACH_00D011                                                               ;00FFFE|        |00D011;
