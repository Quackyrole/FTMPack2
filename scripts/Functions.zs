#priority 100
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;


function toSnakeCase(inp as string) as string{
    val regex = "([a-z])([A-Z]+)";
    val replacement = "$1_$2";
    return inp.replaceAll(regex, replacement).toLowerCase();
}

function tryGetModItem(entry as IOreDictEntry, modName as string) as IItemStack {
    for item in entry.items as IItemStack[] {
        if (item.definition.id.startsWith(modName + ":")) {
            return item;
        }
    }
    return null;
}

function tryGetModListItem(entry as IOreDictEntry, modList as string[], failsafe as bool) as IItemStack {
    for item in entry.items as IItemStack[] {
        for modName in modList {
            if (item.definition.id.startsWith(modName + ":")) {
                return item;
            }
        }
    }
    if (failsafe) {
        return entry.firstItem;
    }
    return null;
}

function hasItem(entry_name as string) as bool{
    if (oreDict has entry_name) {
        // print("oredict " + entry_name + " exists...");
        val entry as IOreDictEntry = oreDict.get(entry_name);
        val item as IItemStack = entry.firstItem;
        if (!isNull(item)) {
            // print("oredict " + entry_name + " is not empty!");
            return true;
        }
    }
    return false;
}

function entryHasItem(entry as IOreDictEntry) as bool {
    val item as IItemStack = entry.firstItem;
    return !isNull(item);
}

function clearEntryRecipes(entry as IOreDictEntry) {
    for item in entry.items as IItemStack[] {
        recipes.remove(item);
    }
}

function clearEntryStamperRecipes(entry as IOreDictEntry) {
    for item in entry.items as IItemStack[] {
        mods.embers.Stamper.remove(item);
    }
}

function clearEntryMetalPressRecipes(entry as IOreDictEntry) {
    for item in entry.items as IItemStack[] {
        mods.immersiveengineering.MetalPress.removeRecipe(item);
    }
}
