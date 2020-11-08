#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
echo "Insert Directory name:"
read dirname;
echo "Insert Pattern:"
read whatToFind;
if [[ -z $dirname ]] ; then
clear
printError "Missing directory"
./interactive/interactive.sh
elif [[ -z $whatToFind ]] ; then
clear
printError "Missing pattern"
./interactive/interactive.sh
fi
! isExists $dirname && clear && printError "$dirname is not a directory" && ./interactive/interactive.sh
grep -r $whatToFind $dirname 2> /dev/null | cut -d: -f2
./interactive/interactive.sh
