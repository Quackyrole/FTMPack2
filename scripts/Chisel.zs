import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.chisel.Carving;

// mods.chisel.Carving.addGroup("slate");

for block in <ore:slate>.items {
    mods.chisel.Carving.addVariation("slate", block);
}


mods.chisel.Carving.addVariation("stonebrick", <rustic:stone_pillar>);
mods.chisel.Carving.addVariation("andesite", <rustic:andesite_pillar>);
mods.chisel.Carving.addVariation("diorite", <rustic:diorite_pillar>);
mods.chisel.Carving.addVariation("granite", <rustic:granite_pillar>);
