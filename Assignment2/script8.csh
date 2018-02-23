#!/bin/csh
#script that find GCD and LCM of two arguments

#make sure there are two positive integers as arguments
if ($# != 2 || $1 < 1 || $2 < 1)then
    echo "need two positive integer arguments"
    exit
endif

@ smaller = 0

#find smaller of two arguments
if ($1 > $2)then
    set smaller = $2
else
    set smaller = $1
endif

#find gcd and use gcd to find lcd
while ( $smaller != 0 )
    @ x = $1 % $smaller
    @ y = $2 % $smaller
    if (( $x == 0 ) && ( $y == 0 ))then
	set gcd = $smaller
	echo "GCD of $1 and $2 is: $gcd"
	break
    else
	@ smaller = $smaller - 1
    endif
end

@ lcm = $1 * $2 / $gcd
echo "LCM of $1 and $2 is: $lcm"
