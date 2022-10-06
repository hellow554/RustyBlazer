; there are a few places where the `updateHudBitfield`
; is set to update all values.
; we want to include our lair reveal as well

org $00AFC2
LDA.w #$1F|$20 

org $02999B
LDA.b #$1F|$20

org $029c64
LDA.b #$1F|$20

org $04FACD
LDA.b #$1F|$20
