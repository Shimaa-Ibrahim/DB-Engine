#!/bin/bash 
shopt -s extglob
function tableMenu {
clear
select choice in "List Tables" "Create Table" "DELETE Table" "INSERT into Table" "DELETE RECORD" "SELECT from Table" "RETURN TO MAIN MENU"
do
	case $choice in
	"List Tables")
	clear      
	echo "*** TABLES LIST***"   
	ls -1

	;;

	"Create Table")
	 . /home/basma/DB-Engine/DB-Engine/createTable.sh
	;;
	

	"DELETE Table")
	;;

	"INSERT into Table")
	;;

	"DELETE RECORD")
	;;

	"SELECT from Table")
	;;

	"RETURN TO MAIN MENU")
	./MainMenu.sh
	;;
	*)
	 clear
 	 echo "WARNING::Wrong choice, please select from 1 to 7"
	 echo "----PRESS ANY KEY TO RETURN TO THE MAIN MENU----"
	 read -s
	 tableMenu;;

esac
done

}
tableMenu