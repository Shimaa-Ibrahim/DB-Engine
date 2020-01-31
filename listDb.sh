#!/usr/bin/bash
echo "list database script"


typeset -i x=1
while test $x -eq 1
 do
	clear
	select choice in "list Database" "create Database" "connect Database" "exit"
	 do 
          #echo "$choice"
	  case $choice in
	    "list Database") sudo ls /var/lib/mysql | grep ^[A-Z] 
	       echo "you enterted list"
	       
	     ;;
            "create Database") 
	       echo "you enterted create"
	       echo "enter new Database Name starting with capital letter please"
	       read databaseName;
	       sudo mkdir /var/lib/mysql/$databaseName
	       break;
	     ;;
	    "connect Database") 
	       echo "you enterted connect"
	       echo "enter Database Name starting with capital letter please"
	       read databaseName;
		#if $databaseName= 
	       cd /var/lib/mysql/$databaseName
		. /home/basma/listTb.sh
		#while test $x -eq 1
		 #do
		#	clear
		#	select choice in "list table" "create table" "insert table" "delete table" "select table" "exit"
		#	 do 
		#	  #echo "$choice"
		#	  case $choice in
		 #	  esac
		#	 done 
		 #done

	       break 2;
	     ;;
	    "exit")
	     break 2;
	     ;;
	     *)
		echo "wrong choice select from 1 to 4 please "
	     ;;
	  esac
	 done 
 done

