TextLutItem = $CF74
TextLutLocation = $C7C2


macro TextGoToPosition(x, y)
    db $01, <x>, <y>
endmacro

macro TextDrawBorder(width, height)
    db $07, <width>, <height>
endmacro

macro TextDrawBorderAtPosition(x, y, width, height)
    %TextGoToPosition(<x>, <y>)
    %TextDrawBorder(<width>, <height>)
endmacro

macro TextAtPosition(x, y, text)
    %TextGoToPosition(<x>, <y>)
    db "<text>"
endmacro

macro TextWithBorderAtPosition(x, y, width, height, text)
    %TextDrawBorderAtPosition(<x>, <y>, <width>, <height>)
    db "<text>"
endmacro

macro TextDoLookup(table, idxPtr)
    db $05
    dw <table>, <idxPtr>
endmacro

macro B2Text(text)
    db "<text>"
    db $00
endmacro
