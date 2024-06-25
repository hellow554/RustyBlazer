A7_script_WalkThroughSpace:
    %Cop92($37)
    %Cop94()
    %CopLoopStart($60) : {
        %CopJumpIfEventFlagIsSet(!EV_A7_SomethingWithSpaceAndSoulArmor, .no_harm)
        %CopJumpIfItemIsNotEquipped(Items.SoulArmor, .harm_player)
        BRA .no_harm
    .harm_player:
        LDA.W _0312
        AND.W #7
        BNE .no_harm
        %CopHarmPlayer(1)
    .no_harm:
    } : %CopLoopEnd()
    %Cop92($4F)
    %Cop94()
    BRA A7_script_WalkThroughSpace