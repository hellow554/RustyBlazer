; =============================================================================
; by playing the game and tracing all the memory accesses, I'm somewhat
; certain that the following memory places are not accessed at all, so we use
; it to store our data
; =============================================================================

base $7E1E00
Temp0: skip 1
Temp1: skip 1
Temp2: skip 1
Temp3: skip 1

NmiFrames:      skip 4 ; 32-bit counter of the nmi frames
LairsCleared:   skip 2 ; cleared lairs in current room
LairsTotal:     skip 2 ; total lairs in current room

warnpc $7E1F00      ; variables beyond this point are accessed
