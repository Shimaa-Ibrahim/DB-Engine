#!/bin/bash 
shopt -s extglob
function insertRow {
clear
row="";
echo "insert Table name"
read tableName
if [ -f $tableName ] && [ ! -z $tableName ]
then
col_Number=`cat $tableName.metaData | wc -l`
for (( i=1; i<=col_Number; i++ ))
do 
	col_Type $i

done
        echo "$row" >> $tableName
	clear
	echo "Row created SUCCESSFULLY"
	read -s
	~/DB-Engine/tableMenu.sh
else
	echo "This Table does not exist"
	read -s
	~/DB-Engine/tableMenu.sh
fi
}

function col_Type {
num=$1
col_name=`sed -n "${num}p" $tableName.metaData | cut -d: -f1`
col_type=`sed -n "${num}p" $tableName.metaData | cut -d: -f2`

echo "Insert ( $col_name ) column Value ( $col_type value ) -- null values is accepted --"
read col_value
if [ $col_type == "string" ]
then
while [ 1 -eq 1 ]
do
	clear
	case $col_value in
	+([a-zA-Z]))
	row+="$col_value "
	break ;;
	"")
	echo "column value is null (accepted)\n"
	row+="null "
	break ;;
	*)
	echo "--INVALID DATATYPE --TRY AGAIN--"
	echo "Insert ( $col_name ) column Value ( $col_type value ) -- null values is accepted --"
	read col_value;;
	esac
done

elif [ $col_type == "number" ]
then
while [ 1 -eq 1 ]
do
	clear
	case $col_value in
	+([0-9]))
	row+="$col_value "
	break;;
	"")
	row+="null "
	echo "column value is null (accepted)\n"
	break;;
	*)
	echo "--INVALID DATATYPE --TRY AGAIN --"
	echo "Insert ( $col_name ) column Value ( $col_type value ) -- null values is accepted --"
	read col_value;;
	esac
done
fi
}

insertRow
