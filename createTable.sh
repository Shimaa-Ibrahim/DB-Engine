function createTable {
	clear
	echo "Enter Table Name"
	read tname
	if [ -f $tname ]
	then
	echo "$tname Already EXISTS"
	else 
	case $tname in 
	"") 
	echo "Enter Table Name"
	read -s	
	createTable;;

	 +([a-zA-Z]))
	touch $tname $tname.tmd
	echo "$tname created SUCCESSFULLY"
	echo "Please Enter number of columns"
	while test 1 -eq 1
	do
	read col
	case $col in
	"") echo "Please Enter number of columns"
	    read -s;;
	[1-9])echo "Number of columns is $col"
	      break 1;;
	*) echo "Numbers must be between 1-9 -- TRY AGAIN --";;	
	esac
	done
	;;
	*)
	echo "Table name must be letters ONLY"
        echo "TRY AGAIN! [y|N]" 
	read ans
	case $ans in
	y)createTable;;
	*)./tableMenu.sh;;
	esac 
	esac
	fi
}

createTable
