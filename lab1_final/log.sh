#!/bin/bash
YELLOW="\e[1;33m"
CYAN="\e[36m"
RESET="\e[0m"
cat -e /var/log/anaconda/X.log | grep "] (WW)" | sed -E "/(WW)/s//$(printf "$YELLOW Warning $RESET")/";
cat -e /var/log/anaconda/X.log | grep "] (II)" | sed -E "/(II)/s//$(printf "$CYAN Information $RESET")/";
exit 0
