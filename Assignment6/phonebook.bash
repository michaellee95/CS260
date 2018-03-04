#!/bin/bash

phoneDatabase="datebook.txt"

#check if file exist. Else exit program
if [ ! -f $phoneDatabase ];
then
    echo "Phonebook not found. Exiting program"
    exit
fi

#get necessary data for new insertion
#each variable will check if input format is correct
insert()
{
    name=""
    home=""
    mobile=""
    address=""
    bday=""
    salary=""

    #get first and last name
    while [[ 1 ]]
    do
	echo "enter first and last name: "
	read name
	#check if name is valid
	if [[ ! $name =~ ^[[:alpha:]]{1,}[[:space:]][[:alpha:]]+$ ]] 
	then
	    echo "invalid format. Name must contain alphabet only"
	    continue
	else
	    break
	fi
    done

    #get home phone number
    while [[ 1 ]]
    do
        echo "enter home phone number: "
        read home
	#check if number is valid
        if [[ ! $home =~ ^([0-9]{3}-){2}[0-9]{4}$ ]]
        then
            echo "invalid format. Format must be 123-456-7890"
            continue
        else
            break
        fi
    done

    #get mobile phone number
    #if number exist in database reject it
    while [[ 1 ]]
    do
        echo "enter mobile phone number: "
        read mobile
        if [[ ! $mobile =~ ^([0-9]{3}-){2}[0-9]{4}$ ]]
        then
            echo "invalid format. Format must be 123-456-7890"
            continue
        else
	    repeat="n"
	    repeat=`awk -F: -v var="$mobile" '{if ($3 ~ var ) {print "y";}}' "$phoneDatabase" `
	    if [[ $repeat =~ "y" ]]
	    then
		echo "mobile already exist. enter new one"
		continue
	    fi
            break
        fi
    done

    #get address
    while [[ 1 ]]
    do
	echo "enter address, city, state and zip: "
	read address
	#check if address is in valid format
	if [[ ! $address =~ ^[[:digit:]]{1,}[[:space:]].{1,},[[:space:]].{1,},[[:space:]][[:alpha:]]{2}[[:space:]][[:digit:]]{5}$ ]]
	then
	    echo "invalid format. Format must be street name, city, state zip"
	    echo "example address: 1234 some dr. apt.3, town, WA 12345"
	    continue
	else
	    break
	fi
    done

    #get birthday
    while [[ 1 ]]
    do
	echo "enter birthday"
	read bday
	#check if birthday is in valid format
	if [[ ! $bday =~ ^([[:digit:]]{2}\/){2}[[:digit:]]{2}$ ]]
	then
	    echo "invalid format. Format must be 01/02/03"
	    continue
	else
	    break
	fi
    done

    #get salary
    while [[ 1 ]]
    do
	echo "enter salary"
	read salary
	#check if salary is numbers
	if [[ ! $salary =~ ^[0-9]{1,}$ ]]
	then
	    echo "invalid input. Can only enter whole numbers"
	    continue
	else
	    break
	fi
    done

    #create new record based on user input and put into database
    newRecord="$name:$home:$mobile:$address:$bday:$salary" 
    echo "New data to be recorded is: "
    echo "$newRecord"
    echo ""
    echo "$newRecord" >> "$phoneDatabase"

    #sort database
    #sort phoneDatabase based on 1st tab and store in temp file
    #copy temp file to database
    #remove database and show updated database
    sort -k1d -t":" "$phoneDatabase" > "temp"
    cp "temp" "$phoneDatabase"
    rm "temp"
    cat "$phoneDatabase"
}

#menu
while [[ 1 ]]
do
    echo "1. list record by first name"
    echo "2. list record by last name"
    echo "3. list record by reverse first name"
    echo "4. list record by reverse last name"
    echo "5. search record by last name"
    echo "6. search record by birthday in a given month"
    echo "7. search record by birthday in a given  year"
    echo "8. insert new record"
    echo "9. delete record by last name"
    echo "10. delete record by mobile number"
    echo "0. Exit"
    echo -n "Enter choice: "
    read option

    #perform correct operation based on input
    case $option in
	"1") #print sorted record
	    echo "list record by first name"
	    echo | sort -k1d -t" " "$phoneDatabase"
	    ;;
        "2") #print sorted record
            echo "list record by last name"
            echo | sort -k2d -t" " "$phoneDatabase"
            ;;
	"3") #print sorted record in reverse
	    echo "list record by reverse first name"
	    echo  | sort -k1dr -t" " "$phoneDatabase"
	    ;;
	"4") #print sorted record in reverse
            echo "list record by reverse last name"
            echo  | sort -k2dr -t" " "$phoneDatabase"
            ;;
	"5") #print found record based on last name
	    echo "search record by last name"
	    echo "enter last name you want to search: (is case sensitive)"
	    read name
	    awk -v var=$name -F'[ :]' '{if ($2 ~ var) {print;} }' "$phoneDatabase"
            ;;
	"6") #print found record based on month
	    echo "search record by birthday in a given month"
	    while [[ 1 ]]
	    do		
		echo "enter month"
		read bday
		#check if typed month is valid
		if [[ $bday =~ [[:digit:]]{1,2}$ && $bday -ge 1 && $bday -le 12 ]]
		then
		    awk -v var=$bday -F'[/:]' '{if ($5 == var) {print;} }' "$phoneDatabase"
		    break
		else
		    echo "invalid month"
		    continue
		fi
	    done
	    ;;
	"7") #print found record based on year
            echo "search record by birthday in a given year"
	    while [[ 1 ]]
	    do
		echo "enter year"
		read bday
		#check if typed year is valid
		if [[ $bday =~ [[:digit:]]{1,2}$ ]]
		then 
		    awk -v var=$bday -F'[/:]' '{if ($7 == var) {print;} }' "$phoneDatabase"
		    break
		else
		    echo "invalid year"
		    continue
		fi
	    done
            ;;
	"8") #insert new data into database
	    insert
	    ;;
	"9") #delete record based on last name
	    echo "delete record(s) by last name"
	    echo "enter last name to delete: (case sensitive)"
	    read name
	    echo "The following records will be deleted"
	    #print which record was found
	    #move data in database to new one but skip if value matches name entered
	    awk -v var="$name" -F'[ :]' '{if ($2 ~ var) {print;} }' "$phoneDatabase"
	    awk -v var="$name" -F'[ :]' '{if ($2 !~ var) {print;} }' "$phoneDatabase" > "temp"
	    cp "temp" "$phoneDatabase"
	    rm "temp"
	    echo ""
	    echo "new database:"
	    cat "$phoneDatabase"
	    ;;
        "10") #delete record based on mobile number
            echo "delete record(s) by mobile number"
	    while [[ 1 ]]
	    do
		echo "enter mobile number in 123-456-7890 format"
		read mobile
		#check if number entered is valid
		if [[ ! $mobile =~ ^([0-9]{3}-){2}[0-9]{4}$ ]]
		then
		    echo "invalid format"
		    continue
		fi
		echo "The following records will be deleted"
                #print which record was found
		#move data in database to new one but skip if value matches number entered
		awk -v var="$mobile" -F'[ :]' '{if ($4 ~ var) {print;} }' "$phoneDatabase"
		awk -v var="$mobile" -F'[ :]' '{if ($4 !~ var) {print;} }' "$phoneDatabase" > "temp"
		cp "temp" "$phoneDatabase"
		rm "temp"
		echo ""
		echo "new database:"
		cat "$phoneDatabase"
		break
	    done
            ;;
	
	"0") #exit program
	    echo "Exiting"
	    exit
	    ;;
	*) #repeat if input is invalid
	    echo "invalid option"
	    ;;
    esac

    #have user press enter to clear screen and continue
    echo "press enter to continue"
    read $waste
    clear
done

	
