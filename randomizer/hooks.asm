; NMI Hook
org $008342
JML.l NmiHook
org $008349
NmiHookReturn:

; UI refresh
org $02A659
JML.l RefreshUiHook
org $02A661
RefreshUiHookReturn:

; Lair reveal
org $028C58
JML.l LairRevealHook
org $028C60
LairRevealHookReturn:

; change map
org $04F7D0
JSL MapChangePostHook
