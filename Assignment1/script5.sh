##!/bin/bash
#script that print color of sky

#Get color
echo -n "Enter color: "
read color

case "$color" in
	#If input starts with B or b followed by an l print sky is X color
	([Bb]l*) echo "The sky is" "$color" ;;
	#If input is red or yellow print approrpiate message
	("red") echo "The sun is sometimes" "$color" ;;
	("yellow") echo "The sun is sometimes" "$color" ;;
	#Print error message if input is none of above
	(*) echo "Color is not in any defined categories" ;;
esac
