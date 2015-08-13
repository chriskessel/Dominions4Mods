#!/usr/bin/env bash

# NOTE: Using modulo doesn't typically generate precisely evenly distributed random results, but it's close enough for purposes of this mod.
# Randomly disable spells, though purposefully leaving in all:
# - holy spells
# - national spells
# - level 0 spells

DISABLED_PERCENTAGE=$1

# Which spells ids are candidates for disablement was determined just by visual inspection in the Dom4 Mod Inspector.
DisablementCandidates=($(seq 0 1100)) # according to the mod manual that's the range of all standard spells
Hidden=($(seq 0 149) 171 286 312 315 408 409 1025)
Holy=($(seq 150 159))
Critical=($(seq 160 167) 872 873 945 946)
National=($(seq 168 407) 442 462 $(seq 647 649) $(seq 1016 1021) 1026 1027 $(seq 1030 1039) $(seq 1044 1064))
AllToKeep=(${Hidden[@]} ${Holy[@]} ${Critical[@]} ${National[@]})

# Remove all spells we want to make sure we're keeping from the DisablementCandidates
for i in ${AllToKeep[@]}
do
  DisablementCandidates[i]=''
done
DisablementCandidates=(`echo ${DisablementCandidates[@]}`)

echo '#modname "RandomSpells"'
echo '#description "Remove a random selection of spells. All holy, Level 0, and National spells will always be kept."'
echo "#version 1.00"

for i in ${DisablementCandidates[@]}
do
   # create a number from 0-99.
   number=$RANDOM
   let "number %= 100"
   if [ "$number" -lt $DISABLED_PERCENTAGE ]; then
       echo "#selectspell $i"
       echo "#school -1"
       echo "#end"
   fi
done
