#!/bin/bash
#script that ask user input and print if even or odd

#Get user input
echo -n "Enter a number: "
read n

#Check if input is even or odd by dividing by 2 
rem=$(( $n % 2 ))

#If there's remainder it's odd, else it is even
if [ $rem -eq 0 ]
then
	echo "$n is even"
else
	echo "$n is odd"
fi
