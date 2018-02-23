#!/bin/csh
#script that present user with multiple option

#check if two arguments have been entered
set input1 = 0
set input2 = 0

if ($# != 2)then
    echo "need two arguments"
    exit
else
    set input1 = $1
    set input2 = $2
    goto menu
endif

#get user input for menu
menu:
    echo "add (enter a or A)"
    echo "subtract (enter s or S)"
    echo "multiply (enter m or M)"
    echo "divide (enter d or D)"
    echo "exit (enter e or E)"
    set choice = $<
    #add/subtract/multiply/divide according to user input
    #afterwards ask if user wish to use same numbers or not
    while (1)
	switch ($choice)
	    case "[Aa]":
		@ result = $input1 + $input2
		echo "$input1 + $input2 = $result"
		goto askRepeat
		breaksw
	    case "[Ss]":
		@ result = $input1 - $input2
		echo "$input1 - $input2 = $result"
		goto askRepeat
		breaksw
	    case "[Mm]":
		@ result = $input1 * $input2
		echo "$input1 * $input2 = $result"
		goto askRepeat
		breaksw
	    case "[Dd]":
		@ result = $input1 / $input2
		echo "$input1 / $input2 = $result"
		goto askRepeat
		breaksw
	    case "[Ee]":
		echo "Exiting"
		exit 1
		breaksw
	    default:
		echo "wrong input"
		breaksw
    endsw
end

#ask user if they wish to reuse same number
askRepeat:
echo -n "Update numbers? (y/n)"
while (1)
    set input = $<
    if ($input =~ "[Yy]")then
	echo -n "input first number: "
	set input1 = $<
	echo -n "input second number: "
	set input2 = $<
	goto menu
    else if ($input =~ "[Nn]")then
	goto menu
    else
	echo "Invalid input"
    endif
end
