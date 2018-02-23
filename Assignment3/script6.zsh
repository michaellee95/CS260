#!/bin/zsh
#script that print 0-9

integer num=0

#loop and print
while [ $num -le 9 ]
do
    print $num
    num=$num+1
done
