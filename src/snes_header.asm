ORG $C0FFB0

db "41" ; dev id
db "SO  " ; game code
fillbyte $00 : fill 6
db $00 ; flash size
db $00 ; expansion ram size
db $00 ; special version
db $00 ; CO-Cpu

db "SOULBLAZER 1 GRM"
padbyte $20
pad $C0FFD5
warnpc $C0FFD5

org $C0FFD5
db $31  ; Map Mode:         HiRom, Fastrom
db $02  ; Cartridge Type:   ROM, RAM and Battery
db $0A  ; ROM Size:         2^$0A = 1024kB
db $03  ; RAM Size:         2^$03 = 8kB
db $09  ; Destination Code: PAL, Germany
db $33  ; Fixed ID for version 3 of the header
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
