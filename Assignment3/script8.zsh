#!/bin/zsh
#script that find GCD and LCM of two arguments

#make sure there are two positive integers as arguments
if [ $# != 2 ]
then
    print "need two arguments"
    exit
fi
if [[ ! $1 =~ ^[[:digit:]]+$ ]] || [[ ! $2 =~ ^[[:digit:]]+$ ]]
then
    print "need two positive integers"
    exit
fi

#find smaller of two argument
smaller=""
if [ $1 -lt $2 ]
then
    smaller=$1
else
    smaller=$2
fi

#find GCD
while [ $smaller -ne 0 ]
do
    (( x = $1 % $smaller ))
    (( y = $2 % $smaller ))
    if [[ $x -eq 0 ]] && [[ $y -eq 0 ]]
    then
	gcd=$smaller
	print "GCD of $1 and $2 is: $gcd"
	break
    else
	(( smaller = $smaller-1 ))
    fi
done

#find LCM
(( lcm = $1 * $2 / $gcd ))
print "LCM of $1 and $2 is: $lcm"
