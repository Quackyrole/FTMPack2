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


function addPlateRecipe(plate as IItemStack, ingr1 as IIngredient, matname as string) {
    recipes.addShapeless(
        "plate_"+matname,
        plate,
        [ingr1, ingr1, toolHammer]
    );
}

function addPlateStamperRecipe(plate as IItemStack, liquid as ILiquidStack, matname as string) {
    mods.embers.Stamper.add(plate, liquid * 144, plateStamp, null);
}

function addPlateMetalPressRecipe(plate as IItemStack, ingr1 as IIngredient) {
    mods.immersiveengineering.MetalPress.addRecipe(plate, ingr1, plateMold, 2400, 1);
}


val plate_entries as [IOreDictEntry] = <ore:plate*>;

for plate_entry in plate_entries {
    val plate_name as string = plate_entry.name;
    if (entryHasItem(plate_entry)) {
        val material_name as string = plate_name.replaceAll("plate(.*)", "$1");
        val ingot_name as string = "ingot" + material_name;
        val gem_name as string = "gem" + material_name;
        if (hasItem(ingot_name)) {
            val plate as IItemStack = tryGetModListItem(plate_entry, mods_order, true);
            val ingot as IIngredient = oreDict.get(ingot_name);
            clearEntryRecipes(plate_entry);
            addPlateRecipe(plate, ingot, material_name);
            clearEntryMetalPressRecipes(plate_entry);
            addPlateMetalPressRecipe(plate, ingot);
            clearEntryStamperRecipes(plate_entry);
            val liquid as ILiquidStack = game.getLiquid(toSnakeCase(material_name));
            if (isNull(liquid)) {
                print("Liquid " + material_name + " not found");
            } else {
                addPlateStamperRecipe(plate, liquid, material_name);
            }
        } else if (hasItem(gem_name)) {
            val plate as IItemStack = tryGetModListItem(plate_entry, mods_order, true);
            val gem as IIngredient = oreDict.get(gem_name);
            clearEntryRecipes(plate_entry);
            addPlateRecipe(plate, gem, material_name);
            clearEntryMetalPressRecipes(plate_entry);
            addPlateMetalPressRecipe(plate, gem);
        }
    }
}
