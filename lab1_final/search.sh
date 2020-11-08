#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
dirname=$1
whatToFind=$2
if [[ -z $dirname ]] ; then
errorExit "Missing directory" 1
elif [[ -z $whatToFind ]] ; then
errorExit "Missing pattern" 1
fi
! isExists $dirname && errorExit "$dirname is not a directory" 4
grep -r $whatToFind $dirname 2> /dev/null | cut -d: -f2
exit 0
