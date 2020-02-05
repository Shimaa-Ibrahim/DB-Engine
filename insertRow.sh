#!/usr/bin/bash 
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
	col_Name $i
	col_Type $i

done
        echo "$row" >> $tableName
	echo "Row created SUCCESSFULLY"
	read -s
	~/DB-Engine/tableMenu.sh
else
	echo "This Table does not exist"
	read -s
	~/DB-Engine/tableMenu.sh
fi
}


function col_Name {
num=$1
col_name=`sed -n "${num}p" $tableName.metaData | cut -d: -f1`
echo "Insert ( $col_name ) column Value"
}


function col_Type {
num=$1
col_type=`sed -n "${num}p" $tableName.metaData | cut -d: -f2`
read col_value
if [ $col_type == "string" ]
then
while [ 1 -eq 1 ]
do
	case $col_value in
	+([a-zA-Z]))
	row+="$col_value "
	break ;;
	"")
	echo "column value is null (accepted)\n"
	row+="null "
	break ;;
	*)
	clear
	echo "INVALID DATATYPE -value should be string- TRY AGAIN"
	read col_value;;
	esac
done

elif [ $col_type == "number" ]
then
while [ 1 -eq 1 ]
do
	case $col_value in
	+([0-9]))
	row+="$col_value "
	break;;
	"")
	row+="null "
	echo "column value is null (accepted)\n"
	break;;
	*)
	clear
	echo "INVALID DATATYPE -value should be integer- TRY AGAIN"
	read col_value;;
	esac
done
fi
}

insertRow
