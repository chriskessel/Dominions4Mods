#!/usr/bin/env bash

# NOTE: Using modulo doesn't typically generate precisely evenly distributed random results, but it's close enough for purposes of this mod.
# Randomly disable items, but purposefully leave in the Nation specific items.

DISABLED_PERCENTAGE=25

# Which ids are candidates for disablement was determined just by visual inspection in the Dom4 Mod Inspector.
DisablementCandidates=($(seq 0 499)) # according to the mod manual that's the range of all standard items
National=(37 152 380 382 386)

# Remove all items we want to make sure we're keeping from the DisablementCandidates
for i in ${National[@]}
do
  DisablementCandidates[i]=''
done
DisablementCandidates=(`echo ${DisablementCandidates[@]}`)

echo '#modname "RandomItems"'
echo '#description "Remove a random selection of items. All National items will always be kept."'
echo "#version 1.00"

for i in ${DisablementCandidates[@]}
do
   # create a number from 0-99.
   number=$RANDOM
   let "number %= 100"
   if [ "$number" -lt $DISABLED_PERCENTAGE ]; then
       echo "#selectitem $i"
       echo "#constlevel 12"
       echo "#end"
   fi
done
