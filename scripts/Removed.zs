import mods.jei.JEI.addDescription as ad;

ad(
    <psicosts:blood_resonator>,
    "This block cause crash in current state.",
    "It is disabled for now"
);
<psicosts:blood_resonator>.addTooltip(format.red("This block cause crash in current state. It is disabled for now"));
recipes.remove(<psicosts:blood_resonator>);
