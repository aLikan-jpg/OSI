#!bin/bash

printError() {
  echo "$*" >> /dev/stderr
}

errorExit() {
  local message="$1"
  local code="$2"
  [[ -n "$message" ]] && printError "Error:$message.Exiting with code:$code" 
  exit "${code}"
}
