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
dw $0080
dw Native_mode_COP
dw Native_mode_BRK
dw $0000
dw Native_mode_NMI
dw $0000
dw Native_mode_IRQ
dw $0000
dw $0000
dw $0000
dw CODE_008900
dw $0000
dw $0015
dw Start
dw $D011

