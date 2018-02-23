#!/bin/csh
#script that print days

#ensure there are some argument
if ( $#argv < 1 )then
    echo "need some arguments"
else
    set temp = $#argv
    #loop through the argument list and print them
    while ( $temp > 0 )
	foreach index ( $argv )
	    echo -n "$index "
	end
	echo ""
	#use shift to remove the first argument
	shift
	@ temp = $temp - 1
    end
endif
