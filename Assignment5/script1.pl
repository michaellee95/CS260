#!/usr/bin/perl
#script that ask user input and print if even or odd
use warnings;
use strict;

#get user input
print "enter number: ";
my $n = <STDIN>;
chomp $n;

#check if it's even or odd based on remainder
my $rem = $n/2;

if ($rem == 0){
    print "$n is even\n";
} 
else{
    print "$n is odd\n";
}
