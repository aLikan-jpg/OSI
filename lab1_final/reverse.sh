#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
inputName=$1
outputName=$2
if (( ${#inputName} == 0 ))
then
errorExit 'Missing input file' 1
elif (( ${#outputName} == 0 ))
then
errorExit 'Missing output file' 1
fi
! isFileExists "$1" && errorExit "File $1 doesn't exist" 4
! isReadable "$1" && errorExit "File $1 isn't readable" 5
isFileExists "$2" && ! isWritable "$2" &&
errorExit "File $2 isn't writable" 6

[[ "$inputName" = "$outputName" ]] && tac "$inputName" | rev > TMP && mv TMP "$outputName" || tac "$1" | rev > "$2"
echo 'Successfully reversed'
exit 0
