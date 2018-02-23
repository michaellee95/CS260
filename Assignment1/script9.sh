#!/bin/bash
#script that squares input

#Get one integer argument
function square(){
if [ $# -ne 1 ]|| ! [[ $1 =~ ^-?[0-9]+$ ]]
then
	echo "Need one argument"
else
	#Get the square of argument by multiplying by itself
	square=$(($1 * $1))
	echo "Square of $1 is $square"
fi
}

square $1
