#!/usr/bin/perl

use warnings;
use strict;

my $phoneDatabase="datebook.txt";

#check if file exist
if ( ! -f "$phoneDatabase" )
{
    print "Database not found. Exiting\n";
    exit;
}

#subprogram for inserting record
#get necessary data for new insertion
#each variable will check if input format is correct
sub insert
{
    my $name="";
    my $home="";
    my $mobile="";
    my $address="";
    my $bday="";
    my $salary="";

    #get first and last name
    while ( 1 )
    {
	print "enter first and last name:\n";
	$name=<STDIN>;
	chomp $name;
	#check if name is valid
	if ( $name !~ /^[[:alpha:]]{1,}[[:space:]][[:alpha:]]+$/ )
	{
	    print "invalid format. Name must contain alphabet only\n";
	    next;
	}
	else
	{
	    last;
	}
    }

    #get home phone number
    while ( 1 )
    {
	print "enter home phone number: in 123-456-7890\n";
	$home=<STDIN>;
	chomp $home;
	#check if number is valid
	if ( $home !~ /^([0-9]{3}-){2}[0-9]{4}$/ )
	{
	    print "invalid format\n";
	    next;
	}
	else
	{
	    last;
	}
    }

    #get mobile phone number
    #if nummber exist in database reject it
    while ( 1 )
    {
	print "enter mobile phone number: in 123-456-7890\n";
	$mobile=<STDIN>;
	chomp $mobile;
        #check if number is valid
        if ( $mobile !~ /^([0-9]{3}-){2}[0-9]{4}$/ )
        {
            print "invalid format\n";
            next;
        }
        else
        {
	    my $repeat="n";
	    $repeat=`awk -F: -v var="$mobile" '{if (\$3 ~ var ) {print "yes";}}' "$phoneDatabase" `;
	    if ( $repeat =~ /yes/ )	    
            {
		print "mobile already exist. Enter new one\n";
		next;
	    }
	    last;
        }
    }

    #get address
    while ( 1 )
    {
	print "enter address, city, state and zip:\n";
	$address=<STDIN>;
	chomp $address;
	#check if address is in valid format
	if ( $address !~ /^[[:digit:]]{1,}[[:space:]].{1,},[[:space:]].{1,},[[:space:]][[:alpha:]]{2}[[:space:]][[:digit:]]{5}$/ )
	{
	    print "invalid format. Format must be street name, city, state zip\n";
	    print "example address: 1234 some dr. apt.3, town, WA 12345\n";
	    next;
	}
	else
	{
	    last;
	}
    }

    #get birthday
    while ( 1 )
    {
	print "enter birthday. Format must be 01/02/03\n";
	$bday=<STDIN>;
	chomp $bday;
	#check if birthday is in valid format
	if ( $bday !~ /^([[:digit:]]{2}\/){2}[[:digit:]]{2}$/ )
	{
	    print "invalid format\n";
	    next;
	}
	else
	{
	    last;
	}
    }

    #get salary
    while ( 1 )
    {
	print "enter salary\n";
	$salary=<STDIN>;
	chomp $salary;
	#check if salary is numbers
	if ( $salary !~ /^[0-9]{1,}$/ )
	{
	    print "invalid input. Only enter whole numbers\n";
	    next;
	}
	else
	{
	    last;
	}
    }

    #create new record based on user input and put into database
    my $newRecord="$name:$home:$mobile:$address:$bday:$salary";
    print "New data to be recorded is:\n";
    print "$newRecord\n";
    print "\n";
    my $insertData="echo $newRecord >> $phoneDatabase";
    system($insertData);
    
    #sort
    #sort based on first name, store in temp file
    #copy temp file to database
    #remove database and show updated database
    my @cmd = ("touch", "temp");
    system(@cmd);
    my @cmd1 = ("sort", "-t", " ", "-k1d","-o", "temp", "$phoneDatabase");
    system(@cmd1);
    my @cmd2 = ("cp","temp","$phoneDatabase");
    system(@cmd2);
    my @cmd3 = ("rm", "temp");
    system(@cmd3);
    my @cmd4=("cat","$phoneDatabase");
    system(@cmd4);    
}
		
#menu
while ( 1 )
{
    print "1. list record by first name\n";
    print "2. list record by last name\n";
    print "3. list record by reverse first name\n";
    print "4. list record by reverse last name\n";
    print "5. search record by last name\n";
    print "6. search record by birthday in a given month\n";
    print "7. search record by birthday in a given  year\n";
    print "8. insert new record\n";
    print "9. delete record by last name\n";
    print "10. delete record by mobile number\n";
    print "0. Exit\n";
    print "Enter choice: ";
    my $option=<STDIN>;
    chomp $option;

    #perform correct operation based on input
    #print sorted record
    if ( $option == 1 )
    {
	print "list record by first name\n";
       	my @cmd = ("touch", "temp");
       	system(@cmd);
       	my @cmd1 = ("sort", "-t", " ", "-k1d","-o", "temp", "$phoneDatabase");
       	system(@cmd1);
       	my @cmd2 = ("cp","temp","$phoneDatabase");
       	system(@cmd2);
       	my @cmd3 = ("rm", "temp");
       	system(@cmd3);
       	my @cmd4=("cat","$phoneDatabase");
       	system(@cmd4);
	print "\n";
    }
    #print sorted record
    elsif ( $option == 2 )
    {
        print "list record by last name\n";
        my @cmd = ("touch", "temp");
        system(@cmd);
        my @cmd1 = ("sort", "-t", " ", "-k2d","-o", "temp", "$phoneDatabase");
        system(@cmd1);
        my @cmd2 = ("cp","temp","$phoneDatabase");
        system(@cmd2);
        my @cmd3 = ("rm", "temp");
        system(@cmd3);
        my @cmd4=("cat","$phoneDatabase");
        system(@cmd4);
        print "\n";
    }
    #print sorted record in reverse
    elsif ( $option == 3 )
    {
        print "list record by first name in reverse\n";
        my @cmd = ("touch", "temp");
        system(@cmd);
        my @cmd1 = ("sort", "-t", " ", "-k1dr","-o", "temp", "$phoneDatabase");
        system(@cmd1);
        my @cmd2 = ("cp","temp","$phoneDatabase");
        system(@cmd2);
        my @cmd3 = ("rm", "temp");
        system(@cmd3);
        my @cmd4=("cat","$phoneDatabase");
        system(@cmd4);
        printf "\n";
    }
    #print sorted record in reverse
    elsif ( $option == 4 )
    {
        print "list record by last name in reverse\n";
        my @cmd = ("touch", "temp");
        system(@cmd);
        my @cmd1 = ("sort", "-t", " ", "-k2dr","-o", "temp", "$phoneDatabase");
        system(@cmd1);
        my @cmd2 = ("cp","temp","$phoneDatabase");
        system(@cmd2);
        my @cmd3 = ("rm", "temp");
        system(@cmd3);
        my @cmd4=("cat","$phoneDatabase");
        system(@cmd4);
        printf "\n";
    }
    #search record by last name
    elsif ( $option == 5 )
    {
	print "search record by last name\n";
	print "enter last name you want to search: (is case sensitive)\n";
	my $name=<STDIN>;
	chomp $name;
	my @cmd = ("awk", "-v", "var=$name", "-F", "[ :]", "{if(\$2 ~ var) {print;} }", "$phoneDatabase");
	system(@cmd);
	print "\n";
    }
    #search record by birthday month
    elsif ( $option == 6 )
    {
        print "search record by birthday month\n";
	while ( 1 )
	{
	    print "enter month to search\n";
	    my $bday=<STDIN>;
	    chomp $bday;
	    #check if typed month is valid
	    if ( $bday =~ /^[[:digit:]]{1,2}$/ && $bday >= 1 && $bday <= 12 )
	    {
		my @cmd = ("awk", "-v", "var=$bday", "-F", "[/:]", "{if(\$5 == var) {print;} }", "$phoneDatabase");
		system(@cmd);
		print "\n";
		last;
	    }
	    else{
		print "invalid month\n";
		next;
	    }
	}
    }
    #search record by birthday year
    elsif ( $option == 7 )
    {
        print "search record by birthday year\n";
        while ( 1 )
        {
            print "enter year to search\n";
            my $bday=<STDIN>;
            chomp $bday;
            #check if typed month is valid
            if ( $bday =~ /^[[:digit:]]{1,2}$/ )
            {
                my @cmd = ("awk", "-v", "var=$bday", "-F", "[/:]", "{if(\$7 ~ var) {print;} }", "$phoneDatabase");
                system(@cmd);
                print "\n";
                last;
            }
            else{
                print "invalid year\n";
                next;
            }
        }
    }    
    #insert new data into database
    elsif ( $option == 8 )
    {
	insert;
    }
    #delete record based on last name
    elsif ( $option == 9 )
    {
	print "delete record(s) by last name\n";
	print "enter last name to delete (case sensitive)\n";
	my $name=<STDIN>;
	chomp $name;
	print "the following records will be deleted\n";
	#print which record was found
	#move data in database to new one but skip if value matches name entered
	my @cmd = ("awk", "-v", "var=$name", "-F", "[ :]", "{if(\$2 ~ var) {print;} }", "$phoneDatabase");
	system(@cmd);
	print "\n";
        my @cmd1 = ("touch temp; awk -v var=$name -F'[: ]' '{if (\$2 !~ var) {print;} }' $phoneDatabase >> temp; cp temp $phoneDatabase; rm temp; cat $phoneDatabase");
	system(@cmd1);
	print "\n";
    }
    #delete record based on mobile number
    elsif ( $option == 10 )
    {
	"delete record(s) by mobile number\n";
	while ( 1 )
	{
	    print "enter mobile number to delete\n";
	    my $mobile=<STDIN>;
	    chomp $mobile;
	    #check if mobile is in valid format
	    if ( $mobile !~ /^([[:digit:]]{3}-){2}[[:digit:]]{4}$/ )
	    {
		print "invalid mobile\n";
		next;
	    }
	    #print found record
	    #move data in database to new one but skip if value matches number found
	    else
	    {
		print "the following records will be deleted\n";
		my @cmd = ("awk", "-v", "var=$mobile", "-F", "[:]", "{if(\$3 ~ var) {print;} }", "$phoneDatabase");
		system(@cmd);
		print "\n";
		my @cmd1 = "touch temp; awk -v var=$mobile -F'[:]' '{if (\$3 !~ var) {print;} }' $phoneDatabase >> temp; cp temp $phoneDatabase; rm temp; cat $phoneDatabase;";
		system(@cmd1);
		print "\n";
		last;
	    }
	}
    }
    #exit
    elsif ( $option == 0 )
    {
	print "exiting\n";
	exit;
    }
    else
    {
	print "invalid option\n";
    }

    #have user press enter to clear screen and continue
    print "press enter to continue\n";
    my $waste=<STDIN>;
    chomp $waste;
    my @cmd = ("clear");
    system(@cmd);
}
