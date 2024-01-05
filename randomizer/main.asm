arch 65816
hirom

warnings enable Wimplicitly_sized_immediate
optimize address ram

check title "SOULBLAZER 1 GRM     "

incsrc "../src/common/common.asm"

incsrc "patch_header.asm"
incsrc "vars.asm"
incsrc "hooks.asm"

incsrc "enhancements/skip_intro.asm"
incsrc "enhancements/lair_hud_update.asm"
incsrc "enhancements/hud_adjustments.asm"
incsrc "enhancements/textbox.asm"

ORG  $D08000 ; bank $A0
BASE $908000
incsrc "hooks/nmi.asm"
incsrc "hooks/refreshui.asm"
incsrc "hooks/lair_reveal.asm"
incsrc "hooks/map_change.asm"

incsrc "code/debug_menu.asm"

