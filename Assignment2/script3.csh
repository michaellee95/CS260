#!/bin/csh
#script that print grade

#ask for score
echo -n "Enter score: "
@ score = $<
    
#If score is between 0 and 100 tell score
#Else print error
if (( $score >= 0 && $score <= 100 )) then
    if ( $score >= 90) then
	echo "You got A"
    else if ( $score >= 80 ) then
	echo "you got B"
    else if ( $score >= 70 ) then
	echo "you got C"
    else if ( $score >= 60 ) then
	echo "you got D"
    else
	echo "you failed"
    endif
else
    echo "wrong input"
endif
