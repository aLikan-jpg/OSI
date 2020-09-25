#!/bin/bash
function error(){
>&2 echo -e "\n\033[0;31mError: $1\033[0m";
[[$interact -eq 0]] && exit $2 || return 0;
}
