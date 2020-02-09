#!/usr/bin/bash 
function selectRow {
clear
echo "Enter Table Name"
read tableName
if [[ -f $tableName ]] && [[ ! -z $tableName ]]
then
clear 
echo "1- Select All from Table"
echo "2- Select Using Column Value"
read -p "Your Choice : " chioce
case $chioce in
	1)
	selectAll $tableName;;
	2)
	#to select specific value
	clear
	col_Number=`cat $tableName.metaData | wc -l`
	fields=`cat $tableName | wc -l`
	column=10
	flag=0

	for (( i=1; i<=col_Number; i++ ))
	do
		col_Name=`sed -n "$i p" $tableName.metaData | cut -d: -f1`
		col_arr[$i-1]=$col_Name				
	done
	echo "$tableName columns are : ${col_arr[@]}"
	read -p "Enter The Column name : " col_Name
	for (( i=1; i<=col_Number; i++ ))
		do
			if [[ ${col_arr[$i-1]} == $col_Name ]]
			then
				column=$i
				break;
			fi
		done

	if [[ $column -eq 10 ]]
	then
		echo "This column does not exist"
	else
		read -p "Enter the value you are looking for! : " value
		for (( i=1; i<=fields; i++ ))
		do
			field_value=`sed -n "$i p" $tableName | cut -d ' ' -f$column`
			if [[ $field_value == $value ]]
			then
			echo "---------------- $tableName Table Data ----------------"
			sed -n -e "1p" -e "$i p" $tableName | column -t -o "  |  "
			echo "--------------------------------------------------"
			flag=1			
			break;
			fi
		done
			if [[ $flag -eq 0 ]]
			then
			echo "This value does not exist"
			echo "----PRESS ANY KEY TO RETURN TO TABLE MENU----"
			read -s
	 		~/DB-Engine/tableMenu.sh;;
			fi
			
		
		
	fi;;
	*)
	 clear
	 echo "WARNING::Wrong choice, please select 1 or 2"
	 echo "----PRESS ANY KEY TO RETURN TO TABLE MENU----"
	 read -s
	 ~/DB-Engine/tableMenu.sh;;
esac
elif [[ -z $tableName ]]
then
	echo "You should enter table name"
	echo "----PRESS ANY KEY TO RETURN TO TABLE MENU----"
	read -s
	 ~/DB-Engine/tableMenu.sh 
else

	echo "$tableName does not exist"
	echo "----PRESS ANY KEY TO RETURN TO TABLE MENU----"
	read -s
	 ~/DB-Engine/tableMenu.sh 
fi
}

function selectAll {
clear
echo $'----------------' "$1" $'Table Data ---------------- \n'
column -t -o "  |  " $1
echo "--------------------------------------------------"


}


selectRow
