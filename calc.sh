#!/bin/bash
calc=$1
num1=$2
num2=$3
case $calc in 
sum)
echo $(($num1+$num2))
exit 0
;;
sub)
echo $(($num1-$num2))
exit 0
;;
mul)
echo $(($num1*$num2))
exit 0
;;
div)
echo $(($num1/$num2))
exit 0
;;
*) 
echo 'Incorrect. Enter right number'
exit 0
;;
esac
