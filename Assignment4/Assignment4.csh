#! /bin/csh
set savings = 1000.00
set checkings = 1000.00

clear
set try = 0

#Get pin
while (1)
    echo "***Welcome to Cal Poly's ATM***"
    echo "Enter your pin"
    set pin = $<

    if ($pin == "111") then
	break
    else
	echo "Wrong pin"
	@ try ++
    endif

    if ($try == 3) then
	echo "Too many illegal PINS. Try again later."
	sleep 1
	exit
    endif

    sleep 1
    clear
end

#display menu choice
while (1)
    clear
    echo "***welcome to cal poly's ATM System***"
    echo "1. Transfer from checking to savings"
    echo "2. Transfer from savings to checkings"
    echo "3. savings balance"
    echo "4. checking balance"
    echo "5. withdraw cash"
    echo "6. Exit"
    set option = $<

    switch ($option)
	#transfer from checking to saving if possible
	case "1":
	    echo "enter amount to transfer"
	    set amt = $<
	    if ( `echo "$amt > $checkings" | bc` || `echo "$amt < 0" | bc` ) then
		echo "transaction not completed"
		echo "balance in checking: " $checkings
	    else
		set savings = ` echo "$savings + $amt" | bc `
		set checkings = ` echo "$checkings - $amt" | bc `
		echo "new checking balance: " $checkings
		echo "new savings balance: " $savings
	    endif
	 breaksw

	#transfer from saving to checking if possible
        case "2":
            echo "enter amount to transfer"
            set amt = $<
            if ( `echo "$amt > $savings" | bc` || `echo "$amt < 0" | bc`   ) then
                echo "transaction not completed"
                echo "balance in savings: " $savings
            else
                set checkings = `echo "$checkings + $amt" | bc`
                set savings = `echo "$savings - $amt" | bc`
                echo "new checking balance: " $checkings
                echo "new savings balance: " $savings
            endif
	breaksw

	#display saving balance
	case "3"
	    echo "Saving account balance: " $savings
	breaksw

	#display checking balance
	case "4"
	    echo "Checkings account balance: " $checkings
	breaksw

	#withdraw from checking/saving if possible
	case "5"
	    while (1)
		echo "select 1 for savings and 2 for checkings"
		set select = $<
		switch ($select)
		    case "1":
			echo "enter amount to withdraw"
			set amt = $<
			if ( ` echo "$amt > $savings" | bc ` || `echo "$amt < 0" | bc`  ) then
			    echo "transaction denied"
			    echo "current savings balance: " $savings
			else
			    set savings = `echo "$savings -$amt" | bc `
			    echo "Remaining saving balance: " $savings
			endif
			break
		    breaksw

		    case "2":
                        echo "enter amount to withdraw"
                        set amt = $<
                        if ( ` echo "$amt > $checkings" | bc ` || `echo "$amt < 0" | bc`  ) then
                            echo "transaction denied"
                            echo "current checking balance: " $checkings
                        else
                            set checkings = `echo "$checkings -$amt" | bc `
                            echo "Remaining saving balance: " $checkings
                        endif
                        break
                    breaksw

		    default:
			echo "invalid input"
		    breaksw
		endsw
	    end
	breaksw

	#exit script
	case "6"
	    echo "Thank you for using cal poly's ATM"
	    sleep 1
	    exit
        breaksw

	default:
	    echo "Invalid input"
	breaksw
    endsw

    echo "Press enter to continue"
    set throw = $<
 end
