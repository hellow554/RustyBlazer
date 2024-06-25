%define_enum_with_values(Souls, Magician, %1, Light, %10, Shield, %100, Detection, %1000, Reality, %10000)

%define_enum_with_values(Key16,
    R, $10, L, $20, X, $40, A, $80, Right, $100, Left, $200, Down, $400, Up, $800,
    Start, $1000, Select, $2000, Y, $4000, B, $8000)

!Key16_All_Directions    = Key16.Right|Key16.Left|Key16.Down|Key16.Up
!Key16_All_ActionButtons = !Key16_All_Directions|Key16.A|Key16.X|Key16.Y|Key16.Start|Key16.Select
!Key16_Menu_Keys         = !Key16_All_Directions|Key16.A|Key16.B|Key16.Y

%define_enum_with_values(Key8,
    Right, $1, Left, $2, Down, $4, Up, $8,
    Start, $10, Select, $20, Y, $40, B, $80)

!Key8_All_Directions = Key8.Right|Key8.Left|Key8.Down|Key8.Up

%define_enum_with_values(UpdateHud, Text, %1, Exp, %10, Health, %100, Level, %1000, Gold, %10000)
!UpdateHud_All = UpdateHud.Text|UpdateHud.Exp|UpdateHud.Health|UpdateHud.Level|UpdateHud.Gold


!Entity_Player     = $00
!Entity_ChiefsWife = $04
!Entity_ShopOwner  = $05
!Entity_MillKeeper = $08

!Row_Width = $40

%define_enum(Facing, Down, Up, Left, Right)

!WORDLUT_ENTRY_SIZE = 12

!BGM_BG1 = %1
!BGM_BG2 = %10
!BGM_BG3 = %100
!BGM_BG4 = %1000
!BGM_Obj = %10000

!Pflags_Carry       = %00000001
!Pflags_Zero        = %00000010
!Pflags_IrqDisable  = %00000100
!Pflags_DecimalMode = %00001000
!Pflags_Index8Bit   = %00010000
!Pflags_Acc8Bit     = %00100000
!Pflags_Overflow    = %01000000
!Pflags_Negative    = %10000000

!PlayerMaxLevel = 50
!PlayerMaxHealth = 100
!HealthGainPerLvl = 2
!WeaponsMaxPoints = 12
!ArmorMaxPoints = 12
