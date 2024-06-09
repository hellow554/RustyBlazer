#!/usr/bin/env python3

LUT = [
    "Aber",
    "Bitte",
    "Bösen",
    "Du",
    "Dir",
    "Dich",
    "Deathtoll",
    "Die",
    "Der",
    "Dies",
    "Das",
    "Enblem",
    "Es",
    "GreenWood",
    "Heilkräuter",
    "Ich",
    "Juwelen",
    "König",
    "Königin",
    "Leo",
    "Lisa",
    "Monster",
    "Möchtest",
    "Menschen",
    "Mein",
    "Magridd",
    "Magie",
    "Notwendige",
    "Phoenix",
    "Rüstung",
    "Schloß",
    "Sie",
    "Stimme",
    "Schlüssel",
    "Stein",
    "Schwert",
    "Traumstab",
    "Traum",
    "Tages",
    "Vielleicht",
    "Wenn",
    "Welt",
    "Wir",
    "aber",
    "auf",
    "aus",
    "alle",
    "als",
    "auch",
    "bin",
    "bitte",
    "bewache",
    "bist",
    "die",
    "der",
    "den",
    "des",
    "das",
    "daß",
    "dem",
    "diese",
    "dieser",
    "ein",
    "eine",
    "einen",
    "erhielt",
    "etwas",
    "es",
    "einmal",
    "eines",
    "einer",
    "einem",
    "er",
    "für",
    "freigelassen",
    "gibt",
    "habe",
    "hast",
    "hier",
    "hat",
    "haben",
    "ich",
    "ist",
    "in",
    "immer",
    "im",
    "jetzt",
    "kann",
    "keine",
    "mich",
    "mit",
    "mir",
    "meine",
    "meinem",
    "meiner",
    "nicht",
    "noch",
    "nur",
    "namens",
    "nach",
    "paar",
    "sich",
    "sie",
    "sind",
    "sehr",
    "so",
    "schon",
    "und",
    "um",
    "uns",
    "von",
    "viele",
    "vielleicht",
    "vom",
    "werde",
    "wenn",
    "wieder",
    "werden",
    "wie",
    "wird",
    "wurde",
    "was",
    "wirst",
    "welche",
    "war",
    "zu",
    "zum",
    "zusammen",
]

import sys

for arg in sys.argv[1:]:
    x = int(arg, 16)
    if x >= 0x80:
        x -= 0x80
        print("{:02X} -> {}".format(x, LUT[x]))
    
