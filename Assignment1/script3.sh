#!/bin/bash
#script that to print grade

#Ask for score
echo -n "Enter score: "
read score

#If score is not between 0 and 100 tell user input is wrong
#Else pring appropriate score
if [[ $score -ge 0 && $score -le 100 ]]
then
	if [ $score -ge 90 ]
	then
		echo "you got A"
	elif [ $score -ge 80 ]
	then
		echo "you got B"
	elif [ $score -ge 70 ]
	then
		echo "you got C"
	elif [ $score -ge 60 ]
	then
		echo "you got D"
	else
		echo "you failed"
	fi
else
	echo "Wrong Input"
fi
