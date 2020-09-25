#!/bin/bash
function search {
p=$1
direc=$2
if grep -q "$n" "$direc"; then
grep -s "$n" "$direc"
else
echo " not found"
fi
}
search


