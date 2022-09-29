# Misc Data

This document contains all the details that are either too small or to generic to fit into its own document.

## Player Souls

The player souls is a bitflag of 5 possible values. Which souls the player currently has, is stored at `$1B82` of the wram section.

The possible values are

| Bitvalue | Soul      |
| -------: | :-------- |
|     `$1` | Magician  |
|     `$2` | Light     |
|     `$4` | Shield    |
|     `$8` | Detection |
|    `$10` | Reality   |

The descriptive strings are stored at `.82:C636`

## Facing Direction

When spawing any Entity, a facing direction ca be used. The following
