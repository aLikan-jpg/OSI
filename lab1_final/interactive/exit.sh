#!/bin/bash
echo "Insert Return Code:"
read code;
. ./libs/func.sh
. ./libs/error.sh
if [[ -z "$code" ]] ; then
echo "Exititing with code: 0" 
exit 0
fi
[[ $(isNan $code) = "0" ]] && errorExit "$code is NaN" 3
echo "Exiting with code:$code"
exit $code
