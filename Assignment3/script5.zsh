#!/bin/zsh
#script that print color of sky

#get color
print -n "enter color: "
read color

#print appropriate response depending on color
case "$color" in
    ([[Bb]l*) print "The sky is $color" ;;
      ("red" || "yellow") print "the sun is sometimes $color" ;;
      (*) print "color is not in any defeined categories" ;;
      esac
      
