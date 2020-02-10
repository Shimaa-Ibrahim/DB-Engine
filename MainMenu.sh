#!/bin/bash 
shopt -s extglob

function mainMenu {
clear
#create db directory
if [[ ! -d ~/DBMS ]]
then
mkdir ~/DBMS
fi
echo "\"DATABASE ENGINE\""
echo "1- List DATABASE"
echo "2- Create DATABASE"
echo "3- Connect to DATABASE"
echo "4- Drop DATABASE"
echo "5- EXIT"
read -p "Your Choice : " number
case $number in 
	1)
	clear 
	echo "***DATABASES***"
	ls -1 ~/DBMS
	echo "----PRESS ANY KEY ENTER TO THE MAIN MENU----"
	read -s
	mainMenu;;
	2)
	clear
	 echo "Please Enter DATABASE Name!"
	 read dbname 
	 createDB $dbname
	 ;;

	3)
	 clear
	 echo "Please Enter DATABASE name"
	 read dbname
	 if [[ -d ~/DBMS/$dbname ]] && [[ ! -z $dbname ]]
	 then

	 cd ~/DBMS/$dbname
	chmod +x ~/DB-Engine
	chmod +x ~/DB-Engine/*.sh
	 . ~/DB-Engine/tableMenu.sh 

	 else
	 if [[ -z $dbname ]]
	 then
	 echo "you should enter the name of DATABASE press any key to return to the main menu"
	 else	 
	 echo "$dbname DOES NOT EXIST"
	 fi
         read -s
	 mainMenu
	 fi
 	 ;;
	
	4)
 	 clear
	 echo "Enter DATABASE name"
	 read dbname
 	 if [[ -d ~/DBMS/$dbname ]]
	 then
	 echo "Are you sure you want to delete $dbname DATABASE [y|N]"
	 read ans
	 case $ans in 
	 y)
	 rm -r ~/DBMS/$dbname 
	 echo "$dbname deleted SUCCESSFULLY"
	 mainMenu;;
	 *)
	 mainMenu;;
 	 esac
	 else
	 echo "$dbname DOES NOT EXIST"
	 read -s 
	 mainMenu	
	 fi		
	;;
	5)
   	 exit;;

	*)
	 clear
	 echo "WARNING::Wrong choice, please select from 1 to 4"
         echo "----PRESS ENTER TO RETURN TO THE MAIN MENU----"
	 read -s
	 mainMenu;;
esac
}


function createDB {
	clear
#check if db exists
	 if [[ -d ~/DBMS/$1 ]] && [[ ! -z $1 ]]
	 then
	 echo "This DATABASE already EXISTS"
	 read -p "DO YOU WANT TO TRY AGAIN? [y|N] : " ans
	 if [[ $ans == "y" ]]
	 then 
	 echo "Please Enter DATABASE name"
	 read dbname 
	 createDB $dbname
	 else
	 mainMenu
	 fi
	 else
 	 case $1 in
	 "")
	 echo "You must enter the DATABASE name"
	 echo "Please Enter DATABASE name"
	 read dbname
	 createDB $dbname ;;
	 +([a-zA-Z]))
	 mkdir ~/DBMS/$dbname
	 echo "DATABASE created SUCCESSFULLY!"
	 read -s
	 mainMenu;; 
	 *)
	 echo "DATABASE name must be LETTERS ONLY"
	 echo "Please Enter DATABASE name"
	 read dbname
	 createDB $dbname ;;
	 esac
	 fi
}


mainMenu


