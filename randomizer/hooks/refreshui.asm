; TODO: use the variable names from the game
RefreshUiHook:
    ; P is $30 = A8 I16

    LDA $1C6A ; currentMapNumber
    SEC
    SBC.b #$0F
    CMP.b #$04
    BCS + : JML.l RefreshUiHookReturn : +

    PHP
    PHY
    PHX ; just to be sure

    REP #$20                ; swap to A16
    LDA $0332 ; updateHudBitfield
    BIT.w #$08 ; level bit
    BEQ .printRemainingLairs

.printNextSwordLevel:
    LDA $1B5E               ; current equipped sword
    BEQ .printNextLevelExp  ; do we have a sword equipped?
    DEC                     ; table is 0-indxed
    ASL                     ; lut is word size, so we need to calculate the index times two
    TAX                     ; x is our indexer, because we can do long lookups
    LDA $2E1CE, X           ; do a lookup into the level requirement table
    STA Temp0               ; we use Temp0 in the string later
    CMP $1B86               ; current level
    BEQ +
    BMI +
    LDY.w #WeaponLevelNotReached
    BRA ++
+
    LDY.w #WeaponLevelReached
++
    JSL $02A769 ; printOsdStringFromBank2

    LDY.w #WeaponText
    JSL $02A769             ; printOsdStringFromBank2

.printNextLevelExp:
    LDA $1B86 ; current level
    ASL
    ASL
    TAX
    LDA $1FBB8, X ; the exp table
    STA Temp2
    LDA $1FBB8+2, X
    STA Temp0
    LDY.w #NextLevelExp
    JSL $02A769

    LDA $0332 ; updateHudBitfield for the next BIT instruction

.printRemainingLairs:
    BIT.w #$20
    BEQ .end

    LDA $0439 ; map is lairs free
    BNE .end

    LDA LairsCleared
    LDX.w #Temp0
    SEP #$20
    JSL $02B215 ; convert_hex_to_dec
    REP #$20

    LDA LairsTotal
    LDX.w #Temp1
    SEP #$20
    JSL $02B215
    REP #$20

    LDY.w #LairInfo
    JSL $02A769

.end:
    PLX
    PLY
    PLP
    LDA $1C6A ; currentMapNumber
    SEC
    SBC #$0F
    CMP.b #04
    JML.l RefreshUiHookReturn


; =================================================================
; the following strings must be in bank 2, because that's
; what the subroutine at $02a769 (printOsdStringFromBank2) expects

pushpc
org $02FF00

WeaponText:
    db $09, $03, $24
    db $01, $02, $00, "WEP", $00
WeaponLevelReached:
    db $09, $03, $20
    db $01, $0A, $00, $06, $02
    dw Temp0
    db $00
WeaponLevelNotReached:
    db $09, $03, $24
    db $01, $0A, $00, $06, $02
    dw Temp0
    db $00

NextLevelExp:
    db $09, $03, $24
    db $01, $10, $00, "NXT"
    db $03, $20
    db $01, $18, $00, $06, $08
    dw Temp0
    db $00

LairInfo:
    db $09, $03, $24
    db $01, $2A, $00, "LIR  "
    db $03, $20
    db $06, $02
    dw Temp0
    db "/"
    db $06, $02
    dw Temp1
    db $00

warnpc $02FFDF
pullpc
