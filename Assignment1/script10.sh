#!/bin/bash
#script that present user with multiple option

#Make sure two integer has been passed as arguments
if [[ $# -lt 2 ]] || [[ $# -gt 2 ]] || ! [[ $1 =~ ^-?[0-9]+$ ]] || ! [[ $2 =~ ^-?[0-9]+$ ]]
then
	echo "Please pass two integers as arguments"
	exit
fi

arg1=$1
arg2=$2
input=""

#Continuously run program as long as exit command has not been given
while [ "${input,,}" != "e" ]
do
	echo "Add the numbers (enter a or A)"
	echo "Subtract the numbers (enter s or S)"
	echo "Multiply the numbers (enter m or M)"
	echo "Divide the numbers (enter d or D)"
	echo "Exit the numbers (enter e or E)"
	read input
	
	#Add/Subtract/Multiply/Divide the two arguments depending on input,
	#All input will be automatically changed to lowercase
	#After performing function ask if user would like to reuse same input
	#If user says no ask user for two new inputs
	if [ "${input,,}" == "a" ]	#Add
	then
		add=$(($arg1+$arg2))
		echo "Sum of $arg1 and $arg2 is: $add"
		echo "Would you like to reuse the same variables? (y/n)"
		read reuse
		while [[ "${reuse,,}" != "y" ]] && [[ "${reuse,,}" != "n" ]]
		do
			echo "Wrong input enter y/n"
			read reuse
		done
		if [ "${reuse,,}" == "n" ]
		then
			echo -n "Enter two integers: "
			read arg1 arg2
			while [[ $# -lt 2 ]] || [[ $# -gt 2 ]] || ! [[ $arg1 =~ ^-?[0-9]+$ ]] || ! [[ $arg2 =~ ^-?[0-9]+$ ]]
			do
				echo -n "Enter two integers: "
				read arg1 arg2
			done
		fi
		echo ""
		
	elif [ "${input,,}" == "s" ]	#Subtract
	then
		sub=$(($arg1-$arg2))
		echo "Subtraction of $arg1 and $arg2 is: $sub"
		echo ""
				echo "Would you like to reuse the same variables? (y/n)"
		read reuse
		while [[ "${reuse,,}" != "y" ]] && [[ "${reuse,,}" != "n" ]]
		do
			echo "Wrong input enter y/n"
			read reuse
		done
		if [ "${reuse,,}" == "n" ]
		then
			echo -n "Enter two integers: "
			read arg1 arg2
			while [[ $# -lt 2 ]] || [[ $# -gt 2 ]] || ! [[ $arg1 =~ ^-?[0-9]+$ ]] || ! [[ $arg2 =~ ^-?[0-9]+$ ]]
			do
				echo -n "Enter two integers: "
				read arg1 arg2
			done
		fi
		echo ""
		
	elif [ "${input,,}" == "m" ]	#Multiply
	then
		product=$(($arg1*$arg2))
		echo "Product of $arg1 and $arg2 is: $product"
		echo ""
				echo "Would you like to reuse the same variables? (y/n)"
		read reuse
		while [[ "${reuse,,}" != "y" ]] && [[ "${reuse,,}" != "n" ]]
		do
			echo "Wrong input enter y/n"
			read reuse
		done
		if [ "${reuse,,}" == "n" ]
		then
			echo -n "Enter two integers: "
			read arg1 arg2
			while [[ $# -lt 2 ]] || [[ $# -gt 2 ]] || ! [[ $arg1 =~ ^-?[0-9]+$ ]] || ! [[ $arg2 =~ ^-?[0-9]+$ ]]
			do
				echo -n "Enter two integers: "
				read arg1 arg2
			done
		fi
		echo ""	
		
	elif [ "${input,,}" == "d" ]	#Divide
	then
		div=$(($arg1/$arg2))
		echo "Division of $arg1 and $arg2 is: $div"
		echo ""
				echo "Would you like to reuse the same variables? (y/n)"
		read reuse
		while [[ "${reuse,,}" != "y" ]] && [[ "${reuse,,}" != "n" ]]
		do
			echo "Wrong input enter y/n"
			read reuse
		done
		if [ "${reuse,,}" == "n" ]
		then
			echo -n "Enter two integers: "
			read arg1 arg2
			while [[ $# -lt 2 ]] || [[ $# -gt 2 ]] || ! [[ $arg1 =~ ^-?[0-9]+$ ]] || ! [[ $arg2 =~ ^-?[0-9]+$ ]]
			do
				echo -n "Enter two integers: "
				read arg1 arg2
			done
		fi
		echo ""
		
	elif [ "${input,,}" == "e" ]	 #Exit program
	then
		echo "Exiting program"
		exit
		
	else	#Give error message if input is not one of the above
		echo "Wrong input"
		echo ""
	fi
done