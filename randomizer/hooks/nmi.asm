NmiHook:
    ; we need to do the things we overwrote
    PHP
    PHB
    REP #$30
    PHA
    PHX
    PHY

    ; increase the framecounter
    INC NmiFrames
    BNE + ; rollover?
    INC NmiFrames+2
+

    JML.l NmiHookReturn
