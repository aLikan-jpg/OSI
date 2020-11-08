#!/bin/bash
. ./libs/error.sh
Menu() {
echo -e "MENU:\nc - calc\ns - search\nr - reverse\nst - strlen\nl - log\ne - exit\nh - help"
echo "INPUT KEY:"
read key
case "$key" in
calc | c)
./interactive/calc.sh
;;
search | s)
./interactive/search.sh
;;
strlen | st)
./interactive/strlen.sh
;;
log | l)
./interactive/log.sh
;;
exit | e)
./interactive/exit.sh
;;
reverse | r)
./interactive/reverse.sh
;;
help | h)
./interactive/help.sh
;;
*)
clear
printError "Wrong key"
Menu
;;
esac
}
Menu
