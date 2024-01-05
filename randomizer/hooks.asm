; NMI Hook
org $C08369
JML.L NmiHook
org $C08370
NmiHookReturn:

; UI refresh
org $02A659
JML.L RefreshUiHook
org $02A661
RefreshUiHookReturn:

; Lair reveal
org $028C58
JML.L LairRevealHook
org $028C60
LairRevealHookReturn:

; change map
org $04F7D0
JSL MapChangePostHook
