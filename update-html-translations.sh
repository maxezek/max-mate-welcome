#!/bin/sh

# workingdir=$(pwd)
# for pot in $(ls $workingdir/data/po/)
# do
#   rm $workingdir/data/po/$pot/$pot.pot -v
# done
# rm -f po/max-mate-welcome.pot
# ./welcome-po.py --create-pot
# ./edgar-allan create-all-pots

for html in $(find data/po/ -mindepth 1 -type d); do

    pot=$(find ${html} -name "*.pot"| tail -1)
    for p in $(find ${html} -name "*.po"); do
        echo $p in $html
        echo "  msgmerge -v ${p} ${pot} -U"
    done

done


# rm -rf ./locale/ ./data/i18n/
# mkdir ./locale/ ./data/i18n/
# ./welcome-po.py --install
# ./edgar-allan translate-all
