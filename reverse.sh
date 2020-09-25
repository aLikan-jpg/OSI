#!/bin/bash
#testtest
tac lab1_3 > lab1_33
if [ -s $lab1_33 ]
then
echo "done" 
else
echo " fail" 
fi
