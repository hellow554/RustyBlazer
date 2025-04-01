%define_enum_with_values(Sound,
    Nothing, 0,
    SwordSwing, 1,
    EnemyHit, 2,
    LairDone, 3,
    PlayerHurt, 4,
    Explosion1, 5,
    EndbossDungeonAppears, 6,
    MenuBeep, 7,
    HealthRestore, 8,
    Gunshot1, 9,
    Gunshot2, 10,
    WaterSpit, 11,
    HittingMetal, 12,
    ReceivingGem, 13,
    SomebodyAppears, 14,
    Thunder, $10,
    CastLightArrow, 18,
    EnemySpawns, 19,
    OpenChest, 21,
    CastTornado, 22,
    LvlUp, 23,
    DialogConfirm, 24,
    CastFlameBall, 27,
    ReleaseCreature, 28,
    MagicFlareExplore, 33,
    CastMagicRotator, 36,
    SaveDone, 38)

; maybe it goes until 63/0x3f and the upper two bits are for flags? not sure though

!Sound_MetalEnemyHitWithNormalSword = $4C
!Sound_WheelStartSpinning = $4F
!Sound_ReceiveItem = $5E
!Sound_Saving = $66
!Sound_ReceiveGold = $8D
!Sound_PlayerVanish = $8E
!Sound_NextLevel = $97
!Sound_ReceiveItemFromChest = $9E
