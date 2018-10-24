#!/bin/bash
#
# This script will regenerate all the POT files for
# Ubuntu MATE Welcome.
#

workingdir=$(pwd)
for pot in $(ls $workingdir/data/po/)
do
  rm $workingdir/data/po/$pot/$pot.pot -v
done
rm po/ubuntu-mate-welcome.pot
./welcome-po.py --create-pot
./edgar-allan create-all-pots

find data/ -name "*.old" -delete

# MAX merge po with translations (update po files)
for d in $(find data/po/ -mindepth 1 -maxdepth 1 -type d); do
    POT=$(find ${d} -type f -name "*.pot")
    for p in $(find ${d} -type f -name "*.po"); do
        echo msgmerge -v ${p} ${POT} -U
        msgmerge -v ${p} ${POT} -U
    done
done
