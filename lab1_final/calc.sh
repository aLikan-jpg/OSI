#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
option=$1
num1=$2
num2=$3
if [[ -z "$option" ]] ; then
	errorExit "Missing option" 1
elif (( ${#num1} == 0 )) ; then
	errorExit "Missing first number"  1
elif (( ${#num2} == 0 )) ; then
	errorExit "Missing second number" 1
fi

[[ $(isNan $num1) == "0" ]] && errorExit "$num1 is NaN" 3
[[ $(isNan $num2) == "0" ]] && errorExit "$num2 is NaN" 3

case $option in
sum)
sum $num1 $num2
exit 0
;;
sub)
sub $num1 $num2
exit 0
;;
mul)
mul $num1 $num2
exit 0
;;
div)
div $num1 $num2
exit 0
;;
*) errorExit 'Wrong option' 1
;;
esac
