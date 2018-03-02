#!/usr/bin/perl
#script that print color of sky

use warnings;
use strict;

#get color
print "enter color: ";
my $input = <STDIN>;
chomp $input;

#print approrpriate message based on input
if ($input =~ m/^[Bb]l*/){
    print "The sky is $input\n";
}
elsif ($input eq "red" || $input eq "yellow"){
    print "The sun is sometimes $input\n";
}
else{
    print "color is not in any defined categories\n";
}
