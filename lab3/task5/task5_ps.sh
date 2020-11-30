#!/bin/bash

cur=1
mode="+"

tail -f pipe0 |
while true; do
	read line
	case $line in
		"+")
			mode="$line"
		;;
		"*")
			mode="$line"
		;;
		"QUIT")
	 		echo "Quitting..."
			exit 0
		;;
		[0-9]*)
			case $mode in
				"+")
					cur=$(echo "${cur} + ${line}" | bc)
					echo "Current value = $cur"
				;;
				"*")
					cur=$(echo "${cur} * ${line}" | bc)
					echo "Current value = $cur"
				;;
			esac
		;;
		*)
			echo "Invalid input"
			exit 1
		;;

	esac
done
