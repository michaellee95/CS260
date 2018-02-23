#!/bin/csh
#script that ask user input and print if even or odd

#Get user input
echo -n "Enter a number: "
@ n = $<

#check if input is even or odd by dividing by 2
@ rem = $n % 2

#If there's a remainder it's odd, else it is even
if ( $rem == 0) then
    echo "$n is even"
else
    echo "$n is odd"
endif
