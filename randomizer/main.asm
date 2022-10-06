arch 65816
lorom

warnings enable Wimplicitly_sized_immediate
optimize address ram

check title "SOULBLAZER - 1 USA   "

incsrc "patch_header.asm"
incsrc "vars.asm"
incsrc "hooks.asm"

incsrc "enhancements/skip_intro.asm"
incsrc "enhancements/lair_hud_update.asm"
incsrc "enhancements/hud_adjustments.asm"
incsrc "enhancements/textbox.asm"

org $A08000 ; bank $A0
incsrc "hooks/nmi.asm"
incsrc "hooks/refreshui.asm"
incsrc "hooks/lair_reveal.asm"
incsrc "hooks/map_change.asm"

