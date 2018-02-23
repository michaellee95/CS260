#!/bin/csh
#script that print grade, modified to accept argument

#same as script 3 but instead of inputting score,
#score will be entered as argument
if ( $#argv == 0 )then
    echo "Enter score"
    exit 1
endif

if ( $1 >= 0 && $1 <= 100 )then
    if ( $1 >= 90 )then
	echo "you got A"
    else if ( $1 >= 80 )then
	echo "you got B"
    else if ( $1 > = 70 )then
        echo "you got C"
    else if ( $1 >= 60 ) then
	echo "you got D"
    else
	echo "you failed"
    endif
else
    echo "wrong input"
endif
