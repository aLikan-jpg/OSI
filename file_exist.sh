#!/bin/bash
function file_exist() {
[ -f "$1" ] && return 1 || return 0;
}

