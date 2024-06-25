A1_script_spinning_watermillwheel_inside:
    %CopJumpIfSealed(!Lair_A1_Mill_Keeper, .loop) : RTL
.loop
    %CopWaitForEventFlagToBeSet(!EV_A1_WatermillwheelRotated)
    %CopPlayAnimation(Animation.VillageWatermillwheelOutside)
    %Cop82()
    BRA .loop

A1_script_spinning_watermillwheel_outside:
    %CopJumpIfSealed(!Lair_A1_Mill_Keeper, .loop) : RTL
.loop
    %CopWaitForEventFlagToBeSet(!EV_A1_WatermillwheelRotated)
    %CopPlayAnimation(Animation.VillageWatermillwheelInside)
    %Cop82()
    BRA .loop
