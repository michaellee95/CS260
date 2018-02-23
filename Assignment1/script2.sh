#!/bin/bash
#script that ask if user is okay

#Ask if user is ok
echo -n "Are you okay? "
read input

#Loop question if input is neither y or n
while [[ "${input,,}" != "y" ]] && [[ "${input,,}" != "n" ]]
do
echo "Incorrect input"
echo -n "Are you okay? "
read input
done

#Print answer for y or n
if [ "${input,,}" = "y" ]
then
	echo "glad to hear it"
else
	echo "sorry that you are not feeling good"
fi
