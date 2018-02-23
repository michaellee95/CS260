#!/bin/zsh
#script that find sum and factorial of integers

#get user input
print -n "input a number between 1 and 10: "
read input

if [[ $input -lt 1 ]] || [[ $input -gt 10 ]] || [[ ! $input =~ ^[[:digit:]]+$ ]]
then
    print "input must be a integer between 1 and 10"
else
    integer loop=1
    integer sum=0
    integer product=1
    #loop from 1 to input value and add/multiply to sum/product
    while [ $loop -le $input ]
    do
	(( sum = $sum + $loop ))
	(( product = $product * $loop ))
	(( loop = $loop + 1 ))
    done
    print "Sum from 1 to $input is: $sum"
    print "Product from 1 to $input is: $product"
fi

