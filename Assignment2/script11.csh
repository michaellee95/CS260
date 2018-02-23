#!/bin/csh
#script that find sum and factorial of integers

#get user input
echo -n "input a number between 1 and 10: "
set input = $<

if ($input > 10 || $input < 1)then
    echo "input must be a integer between 1 and 10"
else
    set loop = 1
    set sum = 0
    set product = 1
    #loop from 1 to iput value and add/multiply to sum/product,
    #afterwards incrememtn loop value
    while ($loop <= $input)
	@ sum = $sum + $loop
	@ product = $product * $loop
	@ loop = $loop + 1
    end
    echo "sum from 1 to $input is: $sum"
    echo "product from 1 to $input is: $product"
endif
