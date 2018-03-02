#!/usr/bin/perl
#script that squares input
use strict;
use warnings;

#square argument if it exist
sub square{
    if (($#ARGV != 0) || ($ARGV[0] !~ /^-?\d+$/)){
	print "need one integer argument\n";
    }
    else{
	my $square = $ARGV[0] * $ARGV[0];
	print "square of $ARGV[0] is $square\n";
    }
}

square;
	    
	    
