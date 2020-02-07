#!/bin/bash 

function deleteTable { 
	echo "Enter Table Name to delete"
	read tableName 
	if [ -f $tableName ] && [ -f $tableName.metaData ]
	 then 
	    rm -rf $tableName.metaData
	    rm -rf $tableName
	    echo "$tableName Table  deleted Successfully"
	else 
	    echo "No such Table"
	fi
}

