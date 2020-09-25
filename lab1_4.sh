#!/bin/bash
strcop() {
read str
echo ${#str}
if [ "${#str}" != 0 ]
then 
echo "done" 
else 
echo "please enter a string"
fi 
}
strcop 

