org $00FFB0
db "41SO  "
fillbyte $00 : fill 7
db $00, $00, $00

db "SOULBLAZER 1 GRM"
padbyte $20
pad $00FFD5
warnpc $00FFD5

org $00FFD5
db $31  ; Map Mode:         HiRom
db $02  ; Cartridge Type:   ROM, RAM and Battery
db $0A  ; ROM Size:         2^0A = 1024kB
db $03  ; RAM Size:         2^03 = 8kB
db $09  ; Destination Code: PAL
db $33  ; Fixed ID
db $00  ; Mask ROM Version: Zero

dw $AAAA, $5555 ; ROM verification: will be overriden by asar

dw $FFFF, $FFFF
dw NATIVE_MODE_COP
dw NATIVE_MODE_BRK
dw $FFFF
dw NATIVE_MODE_NMI
dw $FFFF
dw NATIVE_MODE_IRQ
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw EMULATION_MODE_RESET
dw $FFFF
