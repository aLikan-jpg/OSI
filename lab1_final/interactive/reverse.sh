#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
echo "Insert Input Filename:"
read inputName;
echo "Insert Output Filename:"
read outputName;
if (( ${#inputName} == 0 ))
then
clear
printError 'Missing input file'
./interactive/interactive.sh
elif (( ${#outputName} == 0 ))
then
clear
printError 'Missing output file'
./interactive/interactive.sh
fi
! isFileExists "$1" && clear && printError "File $1 doesn't exist"  && ./interactive/interactive.sh
! isReadable "$1" && clear && printError "File $1 isn't readable" && ./interactive/interactive.sh
isFileExists "$2" && ! isWritable "$2" && clear &&
printError "File $2 isn't writable" && ./interactive/interactive.sh
[[ "$inputName" = "$outputName" ]] && tac "$inputName" | rev > TMP && mv TMP "$outputName" || tac "$1" | rev > "$2"
clear
echo 'Successfully reversed'
./interactive/interactive.sh

