#!/bin/bash
#script that print days

#Check to see if arguments have been entered
if [ $# -lt 1 ]
then
	echo "Need some arguments"
else
	temp=$#
	#loop from number of argument to 0
	while [ $temp -gt 0 ]
	do
		#Use for loop to print argument list from start
		for index in $@
		do
			echo -n "$index "
		done
		echo ""
		#Use shift to remove first in argument list
		shift
		#Reduce loop count
		temp=$((temp-1))	
	done
fi
