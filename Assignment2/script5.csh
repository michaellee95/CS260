#!/bin/csh
#script tht print color of sky

#get color
echo -n "enter color: "
set color = $<

switch ($color)
    case "[Bb]l*":
	echo "The sky is" "$color"
	breaksw
    case "[Rr]ed":
	echo "The sun is sometimes" "$color"
	breaksw
    case "[Yy]ellow":
	echo "The sun is sometimes" "$color"
	breaksw
    default:
	echo "color is not in any defined categories"
	breaksw
endsw
