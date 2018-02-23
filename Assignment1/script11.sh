#!/bin/bash
#script that find sum and factorial of integers

#Get user input
echo -n "Input a number between 1 and 10: "
read input

#Make sure input is a number from 1 to 10
if [[ input -lt 1 ]] || [[ input -gt 10 ]] || ! [[ $input =~ ^[0-9]+$ ]]
then
	echo "Input must be a integer between 1 and 10"
else
	loop=1
	add=0
	product=1
	#Loop from 1 to input value and add/multiply to sum/product,
	#afterwards increment loop value
	while [ $loop -le $input ]
	do
		sum=$(($sum+$loop))
		product=$(($product*loop))
		loop=$(($loop+1))
	done
	echo "Sum from 1 to $input is: $sum"
	echo "Product from 1 to $input is: $product"
fi

