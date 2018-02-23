#!/bin/csh
#script that parse different parts of current date

#get date as day-month-year hour:minute:second
set now = `date`

foreach word ( $now )
    echo $word
end
