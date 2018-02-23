#!/bin/zsh
#script that print days

#check to see if arguments have been entered
if [ $# -lt 1 ]
then
    print "need some arguments"
else
    integer temp=$#
    while [ $temp -gt 0 ]
    do
	for index in $@
	do
	    print -n "$index "
	done
	print ""
	shift
	temp=$temp-1
    done
fi
