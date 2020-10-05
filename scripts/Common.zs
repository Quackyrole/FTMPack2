#priority 100
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

global mods_order as string[] = [
    "minecraft",
    "metallurgy",
    "thermalfoundation",
    "immersiveengineering",
    "embers",
    "jaopca"
];

global stick as IOreDictEntry = <ore:stickWood>;
global gearBushing as IItemStack = <railcraft:gear:3>;
global gearStamp as IItemStack = <embers:stamp_gear>;
global gearMold as IItemStack = <immersiveengineering:mold:1>;
global plateStamp as IItemStack = <embers:stamp_plate>;
global plateMold as IItemStack = <immersiveengineering:mold>;

global hammerEmbers as IItemStack = <embers:tinker_hammer>;
global hammerIE as IItemStack = <immersiveengineering:tool>;

global toolHammer as IOreDictEntry = <ore:toolHammer>;
toolHammer.add(hammerEmbers);
toolHammer.add(hammerIE);
