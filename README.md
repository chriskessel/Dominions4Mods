# Dominions4Mods
Run the script, output it to a .dm file, and copy to the Dominion4 mods directory

For example, this will disable 33% of the spells.

$ ./RandomSpells.sh 33 > RandomSpells.dm

For both RandomSpells and RandomItems, there are some items that common sense seemed to dicate would never be disabled. For example, all nation specific spells are safe. All Level_0 spells are safe. Communions (Astral/Blood) are safe. You can look at the first bits of the scripts and get a pretty quick idea of what's safe and what isn't.
