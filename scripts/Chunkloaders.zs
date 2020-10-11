# Anchor Upgrade (Mekanism)
recipes.remove(<mekanism:anchorupgrade>);
recipes.addShaped(
    "mekanism_anchorupgrade", <mekanism:anchorupgrade>,
    [
        [null, <ore:blockGlass>, null],
        [<mekanism:enrichedalloy>, <opencomputers:upgrade:4>, <mekanism:enrichedalloy>],
        [null, <ore:blockGlass>, null]
    ]
);

# Passive worldspike
recipes.remove(<railcraft:worldspike:1>);
recipes.addShaped(
    "railcraft_worldspike#1$1", <railcraft:worldspike:1>,
    [
        [<ore:ingotGold>, <minecraft:obsidian>, <ore:ingotGold>],
        [<minecraft:prismarine:1>, <opencomputers:upgrade:4>, <minecraft:prismarine:1>],
        [<ore:ingotGold>, <minecraft:obsidian>, <ore:ingotGold>]
    ]
);

# Personal worldspike
recipes.remove(<railcraft:worldspike:2>);
recipes.addShaped(
    "railcraft_worldspike#2$1", <railcraft:worldspike:2>,
    [
        [<ore:ingotGold>, <minecraft:obsidian>, <ore:ingotGold>],
        [<ore:gemEmerald>, <opencomputers:upgrade:4>, <ore:gemEmerald>],
        [<ore:ingotGold>, <minecraft:obsidian>, <ore:ingotGold>]
    ]
);

# Standard worldspike
recipes.remove(<railcraft:worldspike:3>);
recipes.addShaped(
    "railcraft_worldspike#3$1", <railcraft:worldspike:3>,
    [
        [<ore:ingotGold>, <minecraft:obsidian>, <ore:ingotGold>],
        [<ore:gemDiamond>, <opencomputers:upgrade:4>, <ore:gemDiamond>],
        [<ore:ingotGold>, <minecraft:obsidian>, <ore:ingotGold>]
    ]
);

// # Worldspike point
// recipes.remove(<railcraft:worldspike_point>);
// recipes.addShaped(
//     "railcraft_worldspike_point$1", <railcraft:worldspike_point>,
//     [
//         [null, <minecraft:ender_pearl:*>, null],
//         [null, <minecraft:obsidian>, null],
//         [<minecraft:obsidian>, <ore:ingotGold>, <minecraft:obsidian>]
//     ]
// );

# Chunk Loader (SC2)

recipes.addShaped(
    "stevescarts:module/chunk_loader", <stevescarts:cartmodule:49>,
    [
        [null, <minecraft:ender_pearl>, null],
        [<stevescarts:modulecomponents:9>, <railcraft:worldspike:3>, <stevescarts:modulecomponents:9>],
        [<stevescarts:modulecomponents:22>, <stevescarts:modulecomponents:16>, <stevescarts:modulecomponents:22>]
    ]
);
