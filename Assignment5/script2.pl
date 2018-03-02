#!/usr/bin/perl
#script that ask if user is okay
use strict;
use warnings;

#ask if user is okay
print "are you okay? ";
my $input = <STDIN>;
$input = lc $input;
chomp $input;

#loop question if input is neither y or n
while ( ($input ne "y") && ($input ne "n") ){
    print "invalid input\n";
    print "are you okay? ";
    $input = <STDIN>;
    $input = lc $input;
    chomp $input;
}

#print answer ofr y or n
if ($input eq "y"){
    print "glad to hear it\n";
}
else{
    print "sorry that you are not feeling good\n";
}
