#!/usr/bin/bash 
shopt -s extglob

function mainMenu {
clear
#create db directory
if [ ! -d ~/DBMS ]
then
mkdir ~/DBMS
fi
echo "\"DATABASE ENGINE\""
echo "1- List DATABASE"
echo "2- Create DATABASE"
echo "3- Connect to DATABASE"
echo "4- EXIT"
read -s number
case $number in 
	1)
	clear 
	echo "***DATABASES***"
	ls -1 ~/DBMS
	echo "----PRESS ANY KEY TO RETURN TO THE MAIN MENU----"
	read -s
	mainMenu;;
	2)
	clear
	 echo "Please Enter DATABASE Name!"
	 read dbname 
	 #check if db exists
	 if [ ! -d ~/DBMS/$dbname ]
	 then
	 case $dbname in
	 +([a-zA-Z]))
	 mkdir ~/DBMS/$dbname
	 echo "DATABASE created successfully!"
	 read -s
	 mainMenu;; 
	 *)
	 echo "DATABASE name must be LETTERS ONLY"
	 read -s
	 mainMenu ;;
	 esac
      	 else
	 echo "This DATABASE already EXISTS"
	 read -s	
	 mainMenu
	 fi
	;;

	3)
	 clear
	 echo "Please Enter DATABASE name"
	 read dbname
	 if [ -d ~/DBMS/$dbname ]
	 then
	 cd ~/DBMS/$dbname
	 #tableList function 
	 else
	 echo "$dbname is NOT EXIST"
	 read -s
	 mainMenu
	 fi
 	 ;;
	
	4)
   	 exit;;

	*)
	 clear
	 echo "WARNING::Wrong choice, please select from 1 to 4"
         echo "----PRESS ANY KEY TO RETURN TO THE MAIN MENU----"
	 read -s
	 mainMenu;;
esac
}

mainMenu


