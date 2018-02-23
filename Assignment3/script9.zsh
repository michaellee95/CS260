#!/bin/zsh
#script that squres input

square(){
    if [ $# != 1 ] || [[ ! $1 =~ ^-?[[:digit:]]+$ ]]
    then
	print "need one integer argument"
    else
	#get square of argument
	(( square = $1 * $1 ))
	print "square of $1 is $square"
    fi
}

square $1
