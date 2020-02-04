#!/bin/bash


shopt -s extglob

function createTable {
	                                
string='^[a-z]|[A-Z]$'
echo "Enter Table Name"
read tname
while [ 1 -eq 1 ]
	do
                #here fix this by add dbname before table name
		if [[ -f ~/DB-Engine/$tableName ]]
		then
			echo "$tableName Already EXISTS"
			read tableName
		elif [[ -z $tableName  ]]
		then
			echo "$tableName not valid enter a valid name"
			echo "elif 1"
			read tableName
		elif [[ ! $tableName =~ $string ]]
		then
			echo "$tableName  not valid please enter valid name string charaacters"
			echo "elif 2"
			read tableName
		else 
			echo "please enter columns number"
			read numCol
		  	case $numCol in
			    +([1-9])) echo "number"
		                    echo "please enter name of columns with datatype seperated with :"
     
					for (( i=1 ; i <= numCol ; i++ ))
						do 
							colMetadata="";
                                                        echo "Enter column name: "
							read  colName;
                                                       
#check if field(colName) already exists or not in the file but not working because file not created yet
							if grep -Fxq "$colName" $tableName.metaData
							then
								echo "$colName Already EXISTS"
								i=$i-1
								continue;
							elif [[ -z $colName  ]]
							then
								echo "$colName not valid enter a valid name from letters"
								echo "elif 1"
								i=$i-1
								continue;
							elif [[ ! $colName =~ $string ]]
							then
								echo "$colName  not valid must be dtring character"
								echo "elif 2"
								i=$i-1
								continue;
							else                                                        
							#add colname to colmetadate so that append on it datatype 
					        	colMetadata="$colName";
							echo "please enter column datatype String(s) TntegerNumber(n): (s/n)" 
							read colDataType;
							if [[ $colDataType == "s" || $colDataType == "S" ]]
						        then
								colMetadata="$colMetadata:string"
							elif [[ $colDataType == "n" || $colDataType == "N" ]]
                                                        then
								colMetadata="$colMetadata:number"
							fi
                                                        #here fix this by add dbname before table name
							echo  "$colMetadata" >> ~/DB-Engine/$tableName.metaData
							
						done
                                        #here fix this by add dbname before table name
					touch ~/DB-Engine/$tableName
					touch ~/DB-Engine/$tableName.metaData
					if [[ $? -eq 0 ]]
					then
						echo "table created successfully"
						break 2
					fi
					;;
			    *)	     echo "please enter a valid number from 1 to infinity"
	                             break 2
					;;
               		esac
		fi
	done		
	
}

createTable
