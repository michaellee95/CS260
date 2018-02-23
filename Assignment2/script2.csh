#!/bin/csh
#script taht ask if user is okay

#Ask if user is okay
echo -n "Are you okay? "
set input = $<
set input = `echo $input | tr "[:upper:]" "[:lower:]"` 

#Loop question if input is neither y or n
while (( $input != "y" ) && ( $input != "n" ))
echo "Incorrect input"
echo -n "Are you okay? "
set input = $< 
end

#print answer for y or n
if ( $input == "y" ) then
echo "glad to hear it"
else
echo "sorry that you are not feeling good"
endif
