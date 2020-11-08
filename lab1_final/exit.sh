#!/bin/bash
code=$1
. ./libs/func.sh
. ./libs/error.sh
if [[ -z "$code" ]] ; then
echo "Exititing with code: 0" 
exit 0
fi
[[ $(isNan $code) = "0" ]] && errorExit "$code is NaN" 3
echo "Exiting with code:$code"
exit $code
