#!/bin/bash
#script that to print grade, modified to accept argument

#Same as script3 but instead of inputting score in script,
#The score will be entered as a argument
if [[ $1 -ge 0 && $1 -le 100 ]]
then
	if [ $1 -ge 90 ]
	then
		echo "you got A"
	elif [ $1 -ge 80 ]
	then
		echo "you got B"
	elif [ $1 -ge 70 ]
	then
		echo "you got C"
	elif [ $1 -ge 60 ]
	then
		echo "you got D"
	else
		echo "you failed"
	fi
else
	echo "Wrong Input"
fi