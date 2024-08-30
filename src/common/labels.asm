INIDISP = $002100
OBSEL = $002101
OAMADDL = $002102
OAMADDH = $002103
OAMDATA = $002104
BGMODE = $002105
MOSAIC = $002106
BG1SC = $002107
BG2SC = $002108
BG3SC = $002109
BG4SC = $00210A
BG12NBA = $00210B
BG34NBA = $00210C
BG1HOFS = $00210D
BG1VOFS = $00210E
BG2HOFS = $00210F
BG2VOFS = $002110
BG3HOFS = $002111
BG3VOFS = $002112
BG4HOFS = $002113
BG4VOFS = $002114
VMAIN = $002115
VMADDL = $002116
VMADDH = $002117
VMDATAL = $002118
VMDATAH = $002119
M7SEL = $00211A
M7A = $00211B
M7B = $00211C
M7C = $00211D
M7D = $00211E
M7X = $00211F
M7Y = $002120
CGADD = $002121
CGDATA = $002122
W12SEL = $002123
W34SEL = $002124
WOBJSEL = $002125
WH0 = $002126
WH1 = $002127
WH2 = $002128
WH3 = $002129
WBGLOG = $00212A
WOBJLOG = $00212B
TM = $00212C
TS = $00212D
TMW = $00212E
TSW = $00212F
CGWSEL = $002130
CGADSUB = $002131
COLDATA = $002132
SETINI = $002133
MPYL = $002134
MPYM = $002135
MPYH = $002136
SLHV = $002137
RDOAM = $002138
RDVRAML = $002139
RDVRAMH = $00213A
RDCGRAM = $00213B
OPHCT = $00213C
OPVCT = $00213D
STAT77 = $00213E
STAT78 = $00213F
APUIO0 = $002140
APUIO1 = $002141
APUIO2 = $002142
APUIO3 = $002143
WMDATA = $002180
WMADDL = $002181
WMADDM = $002182
WMADDH = $002183
JOYA = $004016
JOYB = $004017
NMITIMEN = $004200
WRIO = $004201
WRMPYA = $004202
WRMPYB = $004203
WRDIVL = $004204
WRDIVH = $004205
WRDIVB = $004206
HTIMEL = $004207
HTIMEH = $004208
VTIMEL = $004209
VTIMEH = $00420A
MDMAEN = $00420B
HDMAEN = $00420C
MEMSEL = $00420D
RDNMI = $004210
TIMEUP = $004211
HVBJOY = $004212
RDIO = $004213
RDDIVL = $004214
RDDIVH = $004215
RDMPYL = $004216
RDMPYH = $004217
JOY1L = $004218
JOY1H = $004219
JOY2L = $00421A
JOY2H = $00421B
JOY3L = $00421C
JOY3H = $00421D
JOY4L = $00421E
JOY4H = $00421F

struct DMA_Regs $4300
    .control: skip 1                        ; $43x0
    .destination: skip 1                    ; $43x1
    .source_address:                        ; $43x2-4
        .source_address_word:
            .source_address_low: skip 1
            .source_address_high: skip 1
        .source_address_bank: skip 1
    .size:                                  ; $43x5-6
        .size_word:
            .size_low: skip 1
            .size_high: skip 1
endstruct align $10

struct HDMA_Regs $4300
    .control: skip 1                        ; $43x0
    .destination: skip 1                    ; $43x1
    .source_address:                        ; $43x2-4
        .source_address_word:
            .source_address_low: skip 1
            .source_address_high: skip 1
        .source_address_bank: skip 1
    .size:                                  ; $43x5-6
        .size_word:
            .size_low: skip 1
            .size_high: skip 1
    .indirect_bank: skip 1                  ; $43x7
    .table_address_word:                    ; $43x8-9
        .table_address_low: skip 1
        .table_address_high: skip 1
    .line_counter : skip 1                  ; $43xA
endstruct align $10

save_entries = $700000

TempVar0 = $7E0000 ; a temporary place for a variable - might be override by any other function call

;; CopTemp contains the address of the COP arguments stored directly after the `COP xx` opcode
%LongPtr(CopTemp, $7E0038)
%LongPtr(SoundId, $7E003B)

;; each bit tells whether the DMA channel (0-7) is configured and should be enabled during NMI to transfer data to the PPU
HDMA_channel_enable_bits = $7E0042
;; the next free DMA channel in one-hot encoding (e.g. always only 1 bit is set, all others are 0)
HDMA_channel_next_free_slot = $7E0044
;; the offset of the next free DMA channel, so it can be used to access various DMA registers, because they are all $10*channel apart
;; so you can write something like `LDX HDMA_channel_offset : STA DMA_Regs[0].control, X` to access the correct DMA_Regs[0].control register for the active DMA channel
HDMA_channel_offset = $7E0046

_0301 = $7E0301
_0302 = $7E0302
_0312 = $7E0312
map_number = $7E0314
map_sub_number = $7E0316
sceneId = $7E0318
_031A = $7E031A
_031C = $7E031C
_031E = $7E031E
buttons_pressed = $7E0322
buttons_pressed8 = $7E0323
button_mask = $7E0326
_032A = $7E032A
; this is set to $80 if you want to display the enemy health, it's getting
; decremented until it's 0 and the code will make it disappear again
displayEnemeyHealthCounter = $7E0330
display_hud_bitfield = $7E0332
enemy_current_health = $7E0336
enemy_max_health = $7E0338
bg1_hofs = $7E033A
bg1_vofs = $7E033C
bg2_hofs = $7E033E
bg2_vofs = $7E0340
_0343    = $7E0343
_0372    = $7E0372
%Position(PlayerPosReal, $7E0374)
%Position(PlayerPosInt, $7E0378)
%PositionFacing(TeleportPos, $7E037C) ; the X, Y and facing after the next teleportation event
bg3_horizontal_scroll = $7E0386
bg3_vertical_scroll = $7E0388
_038A = $7E038A
_038C = $7E038C
_039C = $7E039C
_039E = $7E039E
_03B6 = $7E03B6
_03BA = $7E03BA
_03BC = $7E03BC
TmTemp = $7E03C2 ; the current TM register value
CGadSubTemp = $7E03C3 ; the current CGadSub register value
Bg2ScTemp = $7E03C4 ; the current BG2Sc register value
W12SelTemp = $7E03C5 ; the current W12Sel register value
number_of_choies = $7E03C6 ; number of choices for the choice box menu
cursor_counter = $7E03C8 ; the counter used for the blinking cursor animation
text_lut_id = $7E03CA
choice_idx = $3D2 ; the choice in a choicebox that has been selected
vblank_interrupt_enabled = $7E03D4 ; if 0 the nmi interrupt is disabled, if 1 not
%LongPtr(_03DA_ptr, $7E03DA) ; not sure what it does yet
text_modifier = $7E03EB
textbox_tlc = $7E03F9 ; top left corner of a default textbox
lair_reveal_in_progress = $7E03FD ; 0 if no revealing is in progress, elsewise != 0 (mostly 1)
magic_cast_in_progress = $7E043F ; 0 if no player magic is currently on screen, else 1
revealing_lair_id = $7E0407 ; this is the lair id that is currently revealed
player_health_restore = $7E0447 ; how many hitpoints to restore
exp_to_give = $7E0449
player_died = $7E044B ; 0 if player is alive, else otherwise

player_name_dialog_x = $7E044D
player_name_dialog_y = $7E044F

player_name8 = $7E0453
remaining_lair = $7E0462
_0472 = $7E0472
inhibit_buttons_readout = $7E0474

oam_data = $7E0492 ; 544 bytes in size including $6B1
unk_7E06B2 = $7E06B2 ; don't remove, because we need it for the size of `oam_data`


entities_table = $7E0800

game_state = $7E1A5E
something_table   = $7E1A9E ; 64 bytes * 8 bits = 512 possiblities
lair_sealed_table = $7E1ADE ; 64 bytes * 8 bits = 512 possible lairs

struct Inventory $7E1B1E
    .swords: skip 8
    .armor: skip 8
    .magic: skip 8
    .items: skip 40
endstruct

struct Equipment $7E1B5E
    .sword: skip 2
    .armor: skip 2
    .magic: skip 2
    .item: skip 2
endstruct

%BigDecimal(PlayerGold, $7E1B66)
player_level_ascii = $7E1B6A
player_current_health_ascii = $7E1B6C
player_max_health_ascii = $7E1B6E
player_strength_from_item = $7E1B70
player_strength_from_level = $7E1B72
player_defense_from_item = $7E1B74
player_defense_from_level = $7E1B76
%BigDecimal(PlayerExp, $7E1B78)
%BigDecimal(ExpNeededForNextLevel, $7E1B7C)
lair_remaining_ascii = $7E1B80
player_souls = $7E1B82
text_speed = $7E1B84
player_level = $7E1B86
player_current_health = $7E1B88
player_max_health = $7E1B8A
player_total_strength = $7E1B8C
player_total_defense = $7E1B8E
player_name = $7E1B92


_1C62 = $7E1C62
_1C64 = $7E1C64
_1C66 = $7E1C66
_1C68 = $7E1C68
current_map_number = $7E1C6A
_1C71 = $7E1C71
_1C72 = $7E1C72
_1C73 = $7E1C73
_1C74 = $7E1C74

StackBegin = $7E1FFF

UNKN_7E3800 = $7E3800
DATA_7E7800 = $7E7800
DATA_7E7900 = $7E7900
tilemap = $7E8000
DATA_7EC000 = $7EC000

struct CgData2bpp $7F0000
    .data: skip $8
endstruct
struct CgData4bpp $7F0000
    .data: skip $20
endstruct
struct CgData8bpp $7F0000 ; $7F0000 - $7F0203
    ; the data for the color palette
    ; an array of either
    ; 64x2bpp
    ; 16x4bpp
    ; 1x8bpp
    .data : skip $200
endstruct
struct CgData extends CgData8bpp
    ; fixed color data (COLDATA)
    .blue:  skip 1
    .green: skip 1
    .red:   skip 1
endstruct
assert objectsize(CgData8bpp) == $203

;; A value of $00 means, that the lair is cleared, but not sealed yet
;; A value of $C0 means, that the sealing is in progress
;; A Value of $80 means, that the lair is sealed
;; Any other value indicates the amount of monsters to spawn
lair_spawn = $7F0203

_7F0483 = $7F0483

;; Each two bytes in this array corresponds to the following tilemap defintion
;; vhopppcc cccccccc
;; v/h        = Vertical/Horizontal flip this tile.
;; o          = Tile priority.
;; ppp        = Tile palette. The number of entries in the palette depends on the Mode and the BG.
;; cccccccccc = Tile number.
L3_Text = $7F7000
SomeOtherTypeToTransferToVram = $7F7800

;; for each tile on the map, this is where the
;; information stored whether it's passable or not
;;
;; $F0 means not passable
;; $00 means passable
;;
;; Not sure if other values are possible
passable_map = $7F8000



UNREACH_8199B4 = $8199B4
UNREACH_8199B5 = $8199B5
UNREACH_8199B6 = $8199B6
UNREACH_81BA19 = $81BA19
UNREACH_81BA1A = $81BA1A
UNREACH_81BA23 = $81BA23
UNREACH_81BA1D = $81BA1D
UNREACH_81BA1F = $81BA1F
UNREACH_81BA21 = $81BA21
UNREACH_81BA22 = $81BA22
UNREACH_81FAD7 = $81FAD7
UNREACH_81FAAB = $81FAAB
UNREACH_81FCC4 = $81FCC4
UNREACH_81FA7F = $81FA7F
UNREACH_81EE8E = $81EE8E
UNREACH_81BA15 = $81BA15
UNREACH_81FB49 = $81FB49
UNREACH_81FB4B = $81FB4B
UNREACH_81BA2B = $81BA2B
UNREACH_8B8000 = $8B8000
UNKN_8D8000 = $8D8000

UNREACH_82FB15 = $82FB15
UNREACH_82FB17 = $82FB17
UNREACH_82FB11 = $82FB11
UNREACH_82FB12 = $82FB12
UNREACH_82FB13 = $82FB13
UNREACH_82FB14 = $82FB14

UNREACH_81A9DF = $81A9DF
UNREACH_81A9E0 = $81A9E0
UNREACH_81A9E1 = $81A9E1
UNREACH_81A9E2 = $81A9E2
UNREACH_81AC98 = $81AC98
UNREACH_81AC97 = $81AC97
UNREACH_81AC99 = $81AC99
UNREACH_81AC9A = $81AC9A
UNREACH_81AC9B = $81AC9B
UNREACH_81AC9C = $81AC9C
UNREACH_81AC9D = $81AC9D
UNREACH_81AC9F = $81AC9F
UNREACH_81B69B = $81B69B
UNREACH_81B69D = $81B69D
UNREACH_81B69C = $81B69C
UNREACH_81BA1B = $81BA1B
UNREACH_81BA1C = $81BA1C
UNREACH_81BA2A = $81BA2A
UNREACH_81BA0F = $81BA0F
UNREACH_81BA10 = $81BA10
UNREACH_82FC39 = $82FC39
UNREACH_82FC3A = $82FC3A
UNREACH_81BA16 = $81BA16
UNREACH_82F44A = $82F44A
UNREACH_81BA13 = $81BA13
UNREACH_81BA14 = $81BA14
UNREACH_81BA2C = $81BA2C
UNREACH_81BA0E = $81BA0E
UNREACH_82F89A = $82F89A
UNREACH_82F89C = $82F89C
UNREACH_82F89B = $82F89B
UNREACH_82F89D = $82F89D
UNREACH_82F89E = $82F89E
UNREACH_82F89F = $82F89F
UNREACH_82F8A0 = $82F8A0
UNREACH_82F8A1 = $82F8A1
UNREACH_82F8A2 = $82F8A2
UNREACH_81F99A = $81F99A
UNREACH_81F99C = $81F99C
UNREACH_81F99B = $81F99B
UNREACH_81F99D = $81F99D
UNREACH_819B5E = $819B5E
UNREACH_819B54 = $819B54
UNREACH_81F9F7 = $81F9F7
UNREACH_81FA07 = $81FA07
UNREACH_81FA17 = $81FA17
UNREACH_898800 = $898800
UNREACH_898802 = $898802
UNREACH_898804 = $898804
UNREACH_898806 = $898806
UNREACH_81FA27 = $81FA27
UNREACH_81FB8A = $81FB8A
UNREACH_81FBA0 = $81FBA0
UNREACH_81FB2F = $81FB2F
UNREACH_81FB30 = $81FB30
UNREACH_898000 = $898000
UNREACH_898002 = $898002
UNREACH_898004 = $898004
UNREACH_898006 = $898006
UNREACH_898008 = $898008
UNREACH_89800A = $89800A
UNREACH_89800C = $89800C
UNREACH_89800E = $89800E
UNREACH_81BA20 = $81BA20
UNREACH_82FB39 = $82FB39
UNREACH_82FB3A = $82FB3A
