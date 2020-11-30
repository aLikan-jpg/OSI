#!/bin/bash

FILENAME="$PWD/$1"
TRASHDIR=~/.trash
TRASHLOG=~/.trash.log
LNNAME=$(date '+%y%H%M%S')

if [[ $# != 1 ]]
then
	echo "1 argument needed"
	exit 1
fi

if [[ ! -f $FILENAME ]]
then
	echo "file not found"
	exit 1
fi

if [[ ! -e $TRASHDIR ]]
then
	mkdir $TRASHDIR
	touch $TRASHLOG
fi

ln "$FILENAME" "$TRASHDIR/$LNNAME"
echo "$FILENAME $LNNAME" >> $TRASHLOG
rm "$FILENAME"
