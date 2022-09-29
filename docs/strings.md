# String representation

The strings are stored in an ascii representation.
Some values are used for different chars, but starting from `$20` (TODO) they represent the standard ascii alphabet.

There are two different locations in code which handles text printing. One is at `.82:A769`, which I call `printOsdStringFromBank2` and the other one is at `printOsdStringFromBankX` which is at `.82:AC27`.

The first one always uses bank 2 to print text and seems to be a more specific variant of the generic `printOsdStringFromBankX`, which is called by `JSL` and uses that stack information (the bank is stored on the stack) to determine which bank to use. It also supports more "opcodes" (see below).

Strings that will be printed by `printOsdStringFromBankX` either start with a `$10` to draw a standard textbox or `$01` ... (TODO: what does `$01` or other number do?)

## Opcodes

Values below `$20` have special meanings and consume a variable amount of bytes after it's "opcode".

TODO

## LUT

If the high bit is set (`$80`) a lookuptable is used to save space on the cartridge.
After a lookup, a space is inserted automatically.

The LUT is stored at `.90:8000` and is an array of 128 x 12 byte ascii strings, either with a leading `$0` or not, depending on the length of the actual string.

For example, if the string contains the value `$86`, the resulting string will become "`Deathtole `" (notice the leading space).
There are two misspelled words, "Deathtole" and "Liesa", which were not, for whatever reason, corrected and used.

| Offset | Value      |
| -----: | :--------- |
|     00 | All        |
|     01 | A          |
|     02 | And        |
|     03 | But        |
|     04 | Come       |
|     05 | Dream      |
|     06 | Deathtole  |
|     07 | Green      |
|     08 | I          |
|     09 | If         |
|     0A | King       |
|     0B | Leo        |
|     0C | Liesa      |
|     0D | Magridd    |
|     0E | Necessary  |
|     0F | Please     |
|     10 | Stone      |
|     11 | The        |
|     12 | This       |
|     13 | There      |
|     14 | Thank      |
|     15 | You        |
|     16 | and        |
|     17 | a          |
|     18 | are        |
|     19 | about      |
|     1A | all        |
|     1B | around     |
|     1C | an         |
|     1D | am         |
|     1E | after      |
|     1F | always     |
|     20 | back       |
|     21 | be         |
|     22 | but        |
|     23 | because    |
|     24 | basement   |
|     25 | believe    |
|     26 | come       |
|     27 | can        |
|     28 | called     |
|     29 | came       |
|     2A | creatures  |
|     2B | could      |
|     2C | everything |
|     2D | from       |
|     2E | for        |
|     2F | found      |
|     30 | give       |
|     31 | going      |
|     32 | good       |
|     33 | go         |
|     34 | get        |
|     35 | have       |
|     36 | has        |
|     37 | help       |
|     38 | human      |
|     39 | here       |
|     3A | is         |
|     3B | in         |
|     3C | just       |
|     3D | know       |
|     3E | like       |
|     3F | ll         |
|     40 | live       |
|     41 | lives      |
|     42 | my         |
|     43 | me         |
|     44 | monsters   |
|     45 | medical    |
|     46 | m          |
|     47 | many       |
|     48 | made       |
|     49 | machine    |
|     4A | not        |
|     4B | of         |
|     4C | one        |
|     4D | on         |
|     4E | over       |
|     4F | people     |
|     50 | put        |
|     51 | person     |
|     52 | please     |
|     53 | queen      |
|     54 | received   |
|     55 | really     |
|     56 | released   |
|     57 | s          |
|     58 | something  |
|     59 | started    |
|     5A | strange    |
|     5B | see        |
|     5C | should     |
|     5D | soul       |
|     5E | snail      |
|     5F | scared     |
|     60 | somewhere  |
|     61 | the        |
|     62 | to         |
|     63 | that       |
|     64 | this       |
|     65 | t          |
|     66 | take       |
|     67 | tell       |
|     68 | think      |
|     69 | there      |
|     6A | talk       |
|     6B | though     |
|     6C | used       |
|     6D | use        |
|     6E | very       |
|     6F | village    |
|     70 | voice      |
|     71 | will       |
|     72 | with       |
|     73 | was        |
|     74 | when       |
|     75 | what       |
|     76 | world      |
|     77 | watching   |
|     78 | want       |
|     79 | walk       |
|     7A | whenever   |
|     7B | who        |
|     7C | watch      |
|     7D | were       |
|     7E | you        |
|     7F | your       |
