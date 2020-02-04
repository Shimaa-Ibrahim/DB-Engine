#!/bin/bash


shopt -s extglob

function createTable {
	                                
string='^[a-z]|[A-Z]$'
echo "Enter Table Name"
read tname
while [ 1 -eq 1 ]
	do
                #here fix this by add dbname before table name
		if [[ -f ~/DB-Engine/$tname ]]
		then
			echo "$tname Already EXISTS"
			read tname
		elif [[ -z $tname  ]]
		then
			echo "$tname not valid enter a valid name"
			echo "elif 1"
			read tname
		elif [[ ! $tname =~ $string ]]
		then
			echo "$tname  not valid"
			echo "elif 2"
			read tname
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
							echo  "$colMetadata" >> ~/DB-Engine/$tname.metaData
							
						done
                                        #here fix this by add dbname before table name
					touch ~/DB-Engine/$tname
					touch ~/DB-Engine/$tname.metaData
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
