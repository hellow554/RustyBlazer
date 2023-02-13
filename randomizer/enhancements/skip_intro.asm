; we want to do two things:
;  1. we skip the enix logo
;       currently not possible
;  2. we make the sliding intro skipable
;       `LDA #0` instead of `LDA Start | Select`



org $00e6FC
    LDA.w #0
