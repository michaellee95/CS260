#!/bin/zsh
#script that print grade

#check if there's 1 argument
if [ $# != 1 ]
then
    print "1 argument required"
    exit
fi

#ask score
let score=$1

if [[ $score -ge 0 && $score -le 100 ]]
then
    if [ $score -ge 90 ]
    then
	print "you got A"
    elif [ $score -ge 80 ]
    then
	print "you got B"
    elif [ $score -ge 70 ]
    then
	print "you got C"
    elif [ $score -ge 60 ]
    then
	print "you got D"
    else
	print " you failed"
    fi
else
    print "wrong input"
fi
