#!/bin/bash
#script that parse different parts of current date

#Get current date as day-month-year hour:minute:second
now="$(date +'%d-%m-%Y %H:%M:%S')"

#Store date and time seperately, parsing using - and :
read D M Y h m s <<< ${now//[-:]/ }
echo "Current date and time is: "
echo "Year is: $Y"
echo "Month is: $M"
echo "Day is: $D"
echo "Hour is: $h"
echo "Minute is: $m"
echo "Second is: $s"
