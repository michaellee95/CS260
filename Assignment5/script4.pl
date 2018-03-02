#!/usr/bin/perl
#script that parse different parts of date
use strict;
use warnings;
use Data::Dumper qw(Dumper);

#get time and split based on whitespace and store in array
my $datestring = gmtime();
my @date = split(' ', $datestring);

#print each value in array 
foreach my $val (@date){
    print "$val\n";
}
