#!/usr/bin/bash
echo "list table script"



		while test 1 -eq 1
		 do
			clear
			select choice in "list table" "create table" "insert table" "delete table" "select table" "exit"
			 do
			  case $choice in
				"list table")echo "you enterlist table"
				sudo ls /var/lib/mysql/$databaseName | grep *.ibd
				;;
				"create table")echo "you enter create table"
				echo "enter table Name"
				read tableName
				sudo touch /var/lib/mysql/$databaseName/$tableName.ibd
				sudo touch /var/lib/mysql/$databaseName/$tableName.frm

				;;
				"insert table")echo "you enter insert table"
				;;
				"delete table")echo "you enter delete table"
				;;
				"select table")echo "you enter select table"
				;;
				"exit")break 2;
				;;
			  esac
			 done 
		 done

	      
