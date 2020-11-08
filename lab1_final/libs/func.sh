#!/bin/bash
isNan() {
  [[ "$1" =~ ^[-+]?([1-9][0-9]*|0)$ ]] && echo 1 || echo 0
}
sum() {
  let "res = $1 + $2"
  echo $res
}

sub() {
  let "res = $1 - $2"
  echo $res
}

mul() {
  let "res = $1 * $2"
  echo $res
}

div() {
  [[ "$2" -eq "0" ]] && errorExit "division by zero" 2
  let "res = $1 / $2"
  echo $res
}

isExists() {
  [[ -d "$1" ]] && return 0 || return -1
}

isFileExists() {
  [[ -f "$1" ]] && return 0 || return -1
}

isReadable() {
  [[ -r "$1" ]] && return 0 || return -1
}

isWritable() {
  [[ -w "$1" ]] && return 0 || return -1
}

