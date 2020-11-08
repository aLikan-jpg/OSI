#!/bin/bash

key=$1
arg2=$2
arg3=$3
arg4=$4
case $key in
calc)
  ./calc.sh $arg2 $arg3 $arg4
  ;;
search)
  ./search.sh $arg2 $arg3
  ;;
reverse)
  ./reverse.sh $arg2 $arg3
  ;;
strlen)
  shift
  ./strlen.sh "$@"
  ;;
log)
  ./log.sh
  ;;
exit)
  ./exit.sh $arg2
  ;;
help)
  ./help.sh $arg2
  ;;
interactive)
  ./interactive/interactive.sh
  ;;
*)
  >&2 echo -e "\e[31mERROR:\e[0m Wrong Key.\nProgramm exited with code: -1"
  exit -1
  ;;
esac
