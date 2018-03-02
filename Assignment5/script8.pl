#!/usr/bin/perl
#script that find GCD and LCM of two arguments
use strict;
use warnings;

#make sure there are two positive integers as arguments
if ($#ARGV != 1){
    print "need two arguments\n";
    exit;
}
if  (( $ARGV[0] !~ /^\d+$/ ) || ( $ARGV[0] !~ /^\d+$/ )){
    print "need two positive integers\n";
} 

#find smaller of two argument
my $smaller = "";
if ($ARGV[0] < $ARGV[1]){
    $smaller = $ARGV[0];
}
else{
    $smaller = $ARGV[1];
}

my $gcd = 0;

#find GCD
while ($smaller > 0){
    my $x = $ARGV[0] % $smaller;
    my $y = $ARGV[1] % $smaller;
    if ($x == 0 && $y == 0){
	$gcd = $smaller;
	print "GCD of $ARGV[0] and $ARGV[1] is: $gcd\n";
	last;
    }
    else{
	$smaller = $smaller - 1;
    }
}

#find LCM
my $lcm = $ARGV[0] * $ARGV[1] / $gcd;
print "LCM of $ARGV[0] and $ARGV[1] is: $lcm\n";
