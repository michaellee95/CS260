#!/usr/bin/perl
#script that present user with multiple option
use warnings;
use strict;

#make sure two integer has been passed as arguments
my $input1 = "";
my $input2 = "";

if (($#ARGV != 1) || ($ARGV[0] !~ /^-?\d+$/) || ($ARGV[1] !~ /^-?\d+$/)){
    print "please pass two integers as arguments\n";
    exit;
}

$input1 = $ARGV[0];
$input2 = $ARGV[1];

my $input = "";

#run program as long as exit command has not been given
sub menu(){
    $input = lc $input;
    
    while ($input ne "e"){
	print "add (enter a or A)\n";
	print "subtract (enter s or S)\n";
	print "multiply (enter m or M)\n";
	print "divide (enter d or D)\n";
	print "exit (enter e or E)\n";

	$input = <STDIN>;
	$input = lc $input;
	chomp $input;
	
	if ($input eq "a"){
	    my $add = $input1 + $input2;
	    print "sum of $input1 and $input2 is: $add\n";
	}
        elsif ($input eq "s"){
            my $sub = $input1 - $input2;
            print "subtraction of $input1 and $input2 is: $sub\n";
        }
        elsif ($input eq "m"){
            my $product = $input1 * $input2;
            print "product of $input1 and $input2 is: $product\n";
        }
        elsif ($input eq "d"){
            my $div = $input1 / $input2;
            print "division of $input1 and $input2 is: $div\n";
        }
        elsif ($input eq "e"){
            print "Exiting\n";
	    exit;
        }
	else{
	    print "invalid input\n";
	    next;
	}
	
	reuse($input1, $input2);
	print "\n";
    }
}

#subroutine that ask if user wish to reuse numbers
#if user say no ask user for new numbers
sub reuse{

    print "would you like to reuse the same variables? (y/n)\n";
    my $reuse = <STDIN>;
    $reuse = lc $reuse;
    chomp $reuse;
    while (($reuse ne "y") && ($reuse ne "n")){
	print "wrong input enter y/n\n";
	$reuse = <STDIN>;
	$reuse = lc $reuse;
	chomp $reuse;
    }

    if ($reuse eq "n" ){
	print "enter one integer: ";
	$input1 = <STDIN>;
	print "enter another integer: ";
	$input2 = <STDIN>;
	chomp $input1;
	chomp $input2;
	
	while (($input1 !~ /^-?\d+$/) || ($input2 !~ /^-?\d+$/)){
	    print "invalid input\n";	    
	    print "enter one integer: ";
	    $input1 = <STDIN>;
	    print "enter another integer: ";
	    $input2 = <STDIN>;
	    chomp $input1;
	    chomp $input2;
	}
    }
    return $input1, $input2;
}

menu;
