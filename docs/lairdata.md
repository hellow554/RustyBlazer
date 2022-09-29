# Lair Data structure overview

The Lair struct is 32 bytes big.
For a code representation see [TODO][0].

| Byte Offset | Short Description | Long Description                                                                  |
| ----------: | ----------------- | --------------------------------------------------------------------------------- |
|             | **Resurrection**  |                                                                                   |
|           0 | resur_map_num     | The map number to teleport the player to if a resurrection scene should be played |
|           1 | resur_facing_dir  | The facing direction of the player. See <misc_data#Facing_Direction>              |
|           2 | resur_x           | The x position on the map to teleport to                                          |
|           3 | resur_y           | The y position on the map to teleport to                                          |
|           4 | resur_tlc_x       | The x position of the top-left-corner of the resurrection scene                   |
|           5 | resur_tlc_y       | The y position of the top-left-corner of the resurrection scene                   |
|           6 | resur_zone_width  | The width of the resurrection scene                                               |
|           7 | resur_zone_height | The height of the resurrection scene                                              |

[0]: https://TODO
