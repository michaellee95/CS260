#!/bin/zsh
#script that parse different parts of date

date | awk '{for (i = 1; i <= 6; i++) print $i}' 

