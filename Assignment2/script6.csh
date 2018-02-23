#!/bin/csh
#script that print 0-9 using @

@ num = 0

while ( $num <= 9 )
    echo $num
    @ num = $num + 1
end
