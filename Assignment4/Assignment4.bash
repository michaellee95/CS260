#!/bin/bash

while [[ 1 ]]
do
    echo "*** Welcome to Cal Poly's ATM ****"
    echo "Please enter your PIN:"
    read pin

    if (( $pin == "111" ))
    then
	menu
	break
    else
	((try= $try + 1 ))
    fi
	
    if [[ $try == 3 ]]
    then
	echo "Too many illegal PINs. Try later again."
	exit 
    fi	
    clear 
done
