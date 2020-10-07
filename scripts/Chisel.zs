import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.chisel.Carving;

mods.chisel.Carving.addGroup("slate");

for block in <ore:slate>.items {
    mods.chisel.Carving.addVariation("test", block);
}

