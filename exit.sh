#!/bin/bash
read command
read number
if [[ $command != "exit" ]]
then
echo "incorrect arg"
elif ! [ -z $number ]
then
echo $number
exit $number
else
echo "0"
exit 0
fi
