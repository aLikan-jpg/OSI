#!/bin/bash

datenow=$(date +"%Y-%m-%d")
secnow=0
lastdate=""
seclast=0
timediff=0
lastdir=""
newdir="$HOME/Backup-$datenow"
lastdate=$(find ~ -name "Backup*" | awk 'BEGIN{FS="-"}{print $2"-"$3"-"$4}' | sort -nr | head -1)

if [[ ! -f "~/backup-report" ]]
then
	touch ~/backup-report
fi

if [[ -e "$HOME/Backup-$lastdate" ]]
then
	lastdir="$HOME/Backup-$lastdate"
	seclast=$(date -d "$lastdate" +"%s")
	secnow=$(date -d "$datenow" +"%s")
	timediff=$(echo "($secnow - $seclast) / 60 / 60 / 24" | bc)
	if (( $timediff > 6 ))
	then
		mkdir "$newdir"
		cp -a "$HOME/source/." "$newdir"
		echo "[$datenow] Backup has been created successfully. Content:\n$(ls $newdir)" >> ~/backup-report
	else
		upd=""
		changelog=""
		newlog=""
		for file in $(ls ~/source)
		do
			if [[ -f "$lastdir/$file" ]]
			then
				srcsize=$(wc -c "$HOME/source/$file" | awk '{print $1}')
				busize=$(wc -c "$lastdir/$file" | awk '{print $1}')
				sizediff=$(echo "$srcsize - $busize" | bc)

				if (( $sizediff != 0 ))
				then
					mv "$lastdir/$file" "$lastdir/$file.$datenow"
					cp "$HOME/source/$file" "$lastdir"
					changelog="$changelog\nOUTDATE:$file.$datenow; UP-TO-DATE:$file"
				fi
			else
				cp "$HOME/source/$file" "$lastdir"
				newlog="$newlog\nNEW:$file"
			fi
		done
		upd=$(echo "$newlog$changelog" | sed 's/^\\n//')
		if [[ ! -z "$upd" ]]
		then
			echo -e "[$datenow] Latest backup ($lastdir) has been updated:\n$upd" >> ~/backup-report
		fi
	fi
else
	mkdir "$newdir"
	cp -a "$HOME/source/." "$newdir"
	echo "[$datenow] Backup has been created successfully. Content: $(ls $newdir)" >> ~/backup-report
fi
