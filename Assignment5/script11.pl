#!/usr/bin/perl
#script that find sum and factorial of integers
use strict;
use warnings;

#get user input
print "input a nuber between 1 and 10: ";
my $input = <STDIN>;
chomp $input;

if (($input !~ /^\d+$/) || ($input < 1) || ($input > 10)){
    print "input must be a integer between 1 and 10\n";
}
else{
    my $loop = 1;
    my $sum = 0;
    my $product = 1;
    #loop from 1 to input value and add/multiply
    while ($loop <= $input){
	$sum = $sum + $loop;
	$product = $product * $loop;
	$loop = $loop + 1;
    }
    print "sum from 1 to $input is: $sum\n";
    print "product from 1 to $input is: $product\n";
}
