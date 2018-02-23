#!/bin/zsh
#script that ask user input and print if even or odd

#Get user input
echo -n "Enter a number: "
read input;

#check if input is even or odd
integer rem
(( rem = input % 2 ))

#if there's a reminder it's odd, else it is even
if [ $rem -eq 0 ]
then
    print "$input is even"
else
    print "$input is odd"
fi
