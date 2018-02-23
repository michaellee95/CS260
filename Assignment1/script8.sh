#!/bin/bash
#script that find GCD and LCM of two arguments

#Make sure there are two positive integers as arguments
if [[ $# -lt 2 ]] || [[ $# -gt 2 ]] || ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]
then
	echo "Need two integer inputs"
else
	#Find the smaller of the two input
	smaller=""
	if [ $1 -lt $2 ]
	then
		smaller=$1
	else
		smaller=$2
	fi
	#While the smaller input does not equal 0, 
	#Check to see if both arguments divided by loop value is equal to 0
	#If so, that value is the GCD
	while [ $smaller -ne 0 ]
	do
		x=`expr $1 % $smaller`
		y=`expr $2 % $smaller`
		if [[ $x -eq 0 ]] && [[ $y -eq 0 ]]
		then
			gcd=$smaller
			echo "GCD of $1 and $2 is: $gcd"
		break
		else
			smaller=$((smaller-1))
		fi
	done
	#LCM can be found by multiplying argument 1 and 2 and dividing by GCD
	lcm=`expr $1 \* $2 / $gcd`
	echo "LCM of $1 and $2 is: $lcm"
fi
