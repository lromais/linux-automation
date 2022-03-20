#!/bin/bash -x

MAXIM="4039144"
MONITOR=$(free | grep Mem)
USED=$(echo $MONITOR | awk ' { print $3 }')
FREE=$(echo $MONITOR | awk ' { print $4 }')

if [ "$USED" -gt "$MAXIM" ] 
then
	sudo killall -9 java

else
	echo "Memory is below threshold"
fi
