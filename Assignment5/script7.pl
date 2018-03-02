#!/usr/bin/perl
#script that print days
use warnings;
use strict;

#check to see if arguments have been entered
if ($#ARGV < 0){
    print "need some arguments\n";
    exit;
}
#loop through array and print each date
#use shift to move index up
else{
    my @dates = $ARGV;
    my $temp = $#ARGV;
    while ($temp >= 0){
	foreach my $index (@ARGV){
	    print "$index ";
	}
	print "\n";
	shift;
	$temp = $temp - 1;
    }
}
