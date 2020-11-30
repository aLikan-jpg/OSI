#!/bin/bash

FILENAME=$1
TRASHDIR=~/.trash
TRASHLOG=~/.trash.log

recover() {
	FULLNAME=$1
	LNNAME=$2
	FILENAME=$3
	TRASHDIR=$4
	TRASHLOG=$5
	FILEPATH=$(echo "$1" | awk 'BEGIN{FS = OFS = "/"} {$NF=""; print}')

	if [[ -e "$FILEPATH" ]]
	then
		if [[ ! -f "$FULLNAME" ]]
		then
			ln "$TRASHDIR/$LNNAME" "$FULLNAME"
		else
			echo "The file with the same name already exists in the given directory. Please, change the filename."
			read NEWNAME </dev/tty
			ln "$TRASHDIR/$LNNAME" "$FILEPATH/$NEWNAME"
		fi
		echo "The file has been recovered successfully"
	else
		if [[ ! -f '~/$FILENAME' ]]
		then
			ln "$TRASHDIR/$LNNAME" "~/$FILENAME"
		else
			echo "The file with the same name already exists in the given directory. Please, change the filename."
			read NEWNAME </dev/tty
			ln "$TRASHDIR/$LNNAME" "~/$NEWNAME"
		fi
		echo "The file has been recovered successfully but moved to the home directory"
	fi
	rm "$TRASHDIR/$LNNAME"
	sed -i "/$LNNAME/d" "$TRASHLOG"
}

if [[ $# != 1 ]]
then
	echo "1 argument needed"
	exit 1
fi

if [[ $FILENAME == *"/"* ]]
then
	echo "Argument can not contain a path"
	exit 1
fi

touch matches.tmp

grep -i "/$1\>" "$TRASHLOG" > matches.tmp

if [[ ! -s matches.tmp ]]
then
	echo "No such file in trash"
	exit 1
fi

while read LINE
do
	FULLNAME=$(echo "$LINE" | awk '{print $1}')
	LNNAME=$(echo "$LINE" | awk '{print $2}')
	echo "Do you want to recover file $FULLNAME from trash?"
	echo "Type 'Y' to agree or anything else to disagree"
	read ans </dev/tty
	if [[ $ans == 'Y' ]]
	then
		recover $FULLNAME $LNNAME $FILENAME $TRASHDIR $TRASHLOG
	else
		continue
	fi
done < matches.tmp

rm matches.tmp
