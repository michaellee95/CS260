#!/bin/ksh
savings=1000.00
checkings=1000.00

#transfer from checking to saving if possible
checkingToSaving()
{
    echo "please enter the amount to transfer"
    read amt
    
    if (( $amt > $checkings || $amt < 0 ))
    then
	echo "transaction not completed"
	echo "your checking balance is: $" $checkings
    else
	savings=$(echo "$amt + $savings" | bc )
	checkings=$(echo "$checkings - $amt" | bc )
	echo "new checking balance: $" $checkings
	echo "new saving balance: $" $savings
    fi
}

#transfer money from saving to checking if possible
savingToChecking()
{
    echo "please enter the amount to transfer"
    read amt

    if (( $amt > $savings || $amt < 0))
    then
        echo "transaction not completed"
        echo "your savings balance is: $" $savings
    else
        checkings=$(echo "$amt + $checkings" | bc )
        savings=$(echo "$savings - $amt" | bc )
        echo "new checking balance: $" $checkings
        echo "new saving balance: $" $savings
    fi
}

#withdraw cash if possible
withdraw()
{
    while (( 1 ))
    do
	echo "select 1 for saving and 2 for checking"
	read select
	case $select in
	    "1")
		echo "amount to withdraw"
		read amt
		if (( $amt > $savings || $amt < 0 ))
		then
		    echo "Error. Current saving balance is: $" $savings
		else
		    savings=$( echo "$savings - $amt" | bc -l )
		    echo "Remaining balance: $" $savings
		fi
		break;;
	    "2")
		echo "amount to withdraw"
		read amt
		
                if (( $amt > $checkings || $amt < 0 ))
                then
                    echo "Error. Current checking balance is: $" $checkings
                else
                    checkings=$( echo "$checkings - $amt" | bc -l )
		    echo "Remaining balance: $" $checkings
		fi
		break;;
	    *)
		echo "Invalid input";;
	esac
    done
}

#print menu option
menu()
{
    while (( 1 ))
    do
	echo "***welcome cal poly's ATM system***"
	echo ""
	echo "1. Transfer from checking to savings"
	echo "2. Transfer from savings to checking"
	echo "3. Saving account balance"
	echo "4. Checking account balance"
	echo "5. Withdraw cash from either account"
	echo "6. Exit"
	echo ""
	echo "->Select option(1-6)"
	read option

	case $option in
	    "1")
		checkingToSaving;;
	    "2")
		savingToChecking;;
	    "3")
		echo "your savings balance is: $" $savings;;
	    "4")
	        echo "your checking balance is: $" $checkings;;
	    "5")
		withdraw;;
	    "6")
		echo "Thank you for using the ATM system"
		exit;;
	    *)
		echo "Invalid input";;
	esac
	echo "press enter to proceed"
	read empty
	clear
    done	
}

#Get pin. Exit if too many wrong inputs
while (( 1 ))
do
    echo "*** Welcome to Cal Poly's ATM ****"
    echo "Please enter your PIN:"
    read pin

    if (( $pin == "111" ))
    then
	menu
	break
    else
	((try= $try + 1 ))
	echo "invalid pin"
	`sleep 1`
    fi
	
    if [[ $try == 3 ]]
    then
	echo "Too many illegal PINs. Try later again."
	exit 
    fi	
    clear 
done
