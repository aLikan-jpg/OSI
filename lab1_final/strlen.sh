#!/bin/bash
. ./libs/func.sh
. ./libs/error.sh
[[ $# -eq 0 ]] && errorExit "Missing string" 1
string="$@"
echo "${#string}"
exit 0
