A1_tulip_chiefhouse_script:
    %CopJumpIfSealed($07, +)
    RTL

+:
    %CopJumpIfRevealing($07, .revealTalk)
    %Cop85($00A99D)
    %CopAssignTalkCallback(.CODE_0384AA)
    COP #$15

-:
    COP #$80
    db $1E
    COP #$82
    BRA -

.CODE_0384AA:
    %CopJumpIfSealed($09, .CODE_0384B5)
    %CopShowText(.aFirst)
    RTL

.CODE_0384B5:
    %CopShowText(.afterWatermillKeeper)

.revealTalk:
    %CopShowText(.aBegan)
    RTL

.aFirst:
    db $10
    db $93, "once ", $F3, $0D
    db $97, "water mill ", $B9, $0D
    db "before ", $E1, $EF, "was", $0D
    db "destroyed. ", $11

    db $88, "hear ", $E9, $BA, $97, "man ", $0D
    db $BB, $E1, "mill ", $FB, "runs ", $0D
    db $E1, "elevator ", $BB, $E1, $0D
    db "Underground Castle. "
    db $13
    dw aClearTextboxAndEnd

.aBegan:
    db $10
    db $0E,$3C
    db $02,$02, " began ", $0D
    db $E2, "hear ", $97, "small voice.", $11
    db $13
    dw .aFirst+1

.afterWatermillKeeper:
    db $10, $91, $EF, "Chief ", $0D
    db "speaks ", $F2, $C3, "every ", $0D
    db "morning. ", $11
    db "Even ", $EB, $88, "cannot ", $0D
    db "speak, ", $88, "communicate ", $0D
    db $F2, "him through our ", $0D
    db "thoughts. "
    db $13
    dw aClearTextboxAndEnd
