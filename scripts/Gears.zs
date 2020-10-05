#priority 80
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import scripts.Functions.tryGetModListItem;
import scripts.Functions.hasItem;
import scripts.Functions.entryHasItem;
import scripts.Functions.clearEntryRecipes;
import scripts.Functions.clearEntryStamperRecipes;
import scripts.Functions.clearEntryMetalPressRecipes;
import scripts.Functions.toSnakeCase;


function addGearRecipe(gear as IItemStack, ingr1 as IIngredient, matname as string) {
    recipes.addShaped(
        "gear_"+matname,
        gear,
        [
            [null, ingr1, null],
            [ingr1, gearBushing, ingr1],
            [null, ingr1, null]
        ]
    );
}

function addGearStamperRecipe(gear as IItemStack, liquid as ILiquidStack, matname as string) {
    mods.embers.Stamper.add(gear, liquid * 576, gearStamp, null);
}

function addGearMetalPressRecipe(gear as IItemStack, ingr1 as IIngredient) {
    mods.immersiveengineering.MetalPress.addRecipe(gear, ingr1, gearMold, 2400, 4);
}

// function doGearRecipes() {

// }

val gear_entries as [IOreDictEntry] = <ore:gear*>;

for gear_entry in gear_entries {
    val gear_name as string = gear_entry.name;
    if (entryHasItem(gear_entry)) {
        val material_name as string = gear_name.replaceAll("gear(.*)", "$1");
        val ingot_name as string = "ingot" + material_name;
        val gem_name as string = "gem" + material_name;
        if (hasItem(ingot_name)) {
            val gear as IItemStack = tryGetModListItem(gear_entry, mods_order, true);
            val ingot as IIngredient = oreDict.get(ingot_name);
            clearEntryRecipes(gear_entry);
            addGearRecipe(gear, ingot, material_name);
            clearEntryMetalPressRecipes(gear_entry);
            addGearMetalPressRecipe(gear, ingot);
            clearEntryStamperRecipes(gear_entry);
            val liquid as ILiquidStack = game.getLiquid(toSnakeCase(material_name));
            if (isNull(liquid)) {
                print("Liquid " + material_name + " not found");
            } else {
                addGearStamperRecipe(gear, liquid, material_name);
            }
        } else if (hasItem(gem_name)) {
            val gear as IItemStack = tryGetModListItem(gear_entry, mods_order, true);
            val gem as IIngredient = oreDict.get(gem_name);
            clearEntryRecipes(gear_entry);
            addGearRecipe(gear, gem, material_name);
            clearEntryMetalPressRecipes(gear_entry);
            addGearMetalPressRecipe(gear, gem);
        }
    }
}
