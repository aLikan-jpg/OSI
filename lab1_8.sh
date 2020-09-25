#!/bin/bash
function log(){
local blue="\033[1;34m"
local reset="\033[0m"
local yellow="\033[1;33m"
file_exist "/var/log/anaconda/X.log" && error "file not found" 5;
cat /var/log/anaconda/X.log | grep "(II)" | sed -E "/(II)/s//$(printf "$blue information $reset")/";
cat /var/log/anaconda/X.log | grep "(WW)" | sed -E "/(WW)/s/$(printf "$yellow Warning $reset")/";
}
