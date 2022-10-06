; we want to do two things
; 1. we do not want to wait for a key to be released, before the next
;       key is recognized
; 2. we want to increase the text speed
;       this is somewhat problematic, because I encountered at least
;       one bug when doing this, so we skip this for now

org $02B04A
    BRA $1D

org $02B14F
    NOP #2
