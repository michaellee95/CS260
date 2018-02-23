#!/bin/zsh
#script that ask if user is okay

#ask if user is ok
print -n "are you okay?"
read input
input=$input:l

while [[ "$input" != "y" ]] && [[ "$input" != "n" ]]
do
    print "incorrect input"
    print -n "are you okay? "
    read input
done

#print answer
if [ "$input" = "y" ]
then
    print "glad to hear it"
else
    print "sorry that you are not feeling good"
fi


