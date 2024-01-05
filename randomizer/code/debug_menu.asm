; this is inspired by the debug code originally located in the ROM

DebugMenu:
    LDA JOY2H
    BNE + : RTL : +

macro convert_lower_nibble(source, destination)
    LDA.W <source>
    JSR lower_nibble_to_ascii_hex
    STA.W <destination>
endmacro

macro convert_nibbles(source, destination)
    LDA.W <source>
    JSR upper_nibble_to_ascii_hex
    STA.W <destination>
    %convert_lower_nibble(<source>, <destination>+1)
endmacro

%convert_nibbles(map_number, $1F06)
%convert_nibbles(map_sub_number, $1F09)
%convert_nibbles(current_map_number, $1F0C)
%convert_nibbles(PlayerPosInt.x, $1F0F)
%convert_lower_nibble(PlayerPosReal.x, $1F12)
%convert_nibbles(PlayerPosInt.y, $1F14)
%convert_lower_nibble(PlayerPosReal.y, $1F14)
%convert_nibbles($1F00, $1F19)

upper_nibble_to_ascii_hex:
    LSR
    LSR
    LSR
    LSR
    ; fallthrough
lower_nibble_to_ascii_hex:
    REP #$20
    AND.W #$F
    TAX
    LDA.L .hex_string, X
    SEP #$20
    RTS

.hex_string
    db "0123456789ABCDEF"
