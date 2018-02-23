#!/bin/csh
#script that squares input

if ($# != 1)then
    echo "need one input"
    exit
else
    goto Square
endif

Square:
    @ square = $1 * $1
    echo "square of $1 is: $square"
