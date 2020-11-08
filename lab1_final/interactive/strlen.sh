#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
echo "Insert string:"
read  string
eval "str=($string)"
[[ -z "$string" ]] && printError "Missing string" 1 && ./interactive/interactive.sh
echo "${#str}"
./interactive/interactive.sh
