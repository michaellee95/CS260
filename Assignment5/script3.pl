#!/usr/bin/perl
#script that print grade
use warnings;
use strict;

#ask for score
print "enter score: ";
my $score = <STDIN>;
chomp $score;

#check if input is a number
if (!($score =~ /^\d+?$/)){
    print "invalid input\n";
    exit;
}

#if score is not between 0 and 100 tell user input is wrong
#else print grade
if (($score >= 0) && ($score <= 100)){
    if ($score >= 90){
	print "you got A\n";
    }
    elsif ($score >= 80){
	print "you got B\n";
    }
    elsif ($score >= 70){
	print "you got C\n";
    }
    elsif ($score >= 60){
	print "you got D\n";
    }
    else{
	print "you failed\n";
    }
}
else{
    print "invalid input\n";
}
