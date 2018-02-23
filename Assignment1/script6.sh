##!/bin/bash
#script that print 0-9 using expr

num=0

#Loop from 0 to 9 and print number
while [ $num -le 9 ]
do
	echo $num
	num=$(expr $num + 1)
done
