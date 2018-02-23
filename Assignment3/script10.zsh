#!/bin/zsh
#script that present user with multple option

#make sure two integer has been passed as arguments
if [ $# != 2 ] || [[ ! $1 =~ ^-?[[:digit:]]+$ ]] || [[ ! $2 =~ ^-?[[:digit:]]+$ ]]
then
    print "please pass two integers as arguments"
    exit
fi

input=""

#continuoulsy run program as long as exit command has not been given
function menu(){
    input=$input:l
    while [ "$input" != "e" ]
    do
	print "add (enter a or A)"
	print "subtract (enter s or S)"
	print "multiply (enter m or M)"
	print "divide (enter d or D)"
	print "exit (enter e or E)"
	read input

	input=$input:l

	if [ "$input" = "a" ]
	then
	    (( add = $1 + $2 ))
	    print "sum of $1 and $2 is: $add"
	elif [ "$input" = "s" ]
	then
	    (( sub = $1 - $2 ))
	    print "subtraction of $1 and $2 is: $sub"
	elif [ "$input" = "m" ]
	then
	    (( product = $1 * $2 ))
	    print "product of $1 and $2 is: $product"
	elif [ "$input" = "d" ]
	then
	    (( div = $1 / $2 ))
	    print "division of $1 and $2 is: $div"
	elif [ "$input" = "e" ]
	then
	    print "exiting"
	    exit
	else
	    print "invalid input"
	    continue
	fi

	reuse $1 $2
    done
}

#function that ask if user wish to reuse same variables
#if user says no it will ask user to enter two new integers
function reuse(){
    print "would you like to reuse the same variables? (y/n)"
    read reuse
    reuse=$reuse:l
    while [[ $reuse != "y" ]] && [[ $reuse != "n" ]]
    do
	print "wrong input enter y/n"
	read reuse
	reuse=$reuse:l
    done

    if [ "$reuse" = "n" ]
    then
	print "enter two integers: "
	read 1 2
	while [ $# != 2 ] || [[ ! $1 =~ ^-?[[:digit:]]+$ ]] || [[ ! $2 =~ ^-?[[:digit:]]+$ ]]
	do
	    print "enter two integers: "
	    read 1 2
	done
    fi
    menu $1 $2
}


menu $input $1 $2
