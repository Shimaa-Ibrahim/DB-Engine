#!/usr/bin/bash 
shopt -s extglob

function createTable {	
clear                                
string='^[a-z]|[A-Z]$'
echo "Enter Table Name"
read tableName
while [ 1 -eq 1 ]
	do
                #here fix this by add dbname before table name
		if [ -f $tableName ] && [ ! -z $tableName ]
		then
			echo "$tableName Already EXISTS"
			read -p "TRY AGAIN! [y|N] : " ans
			if [ $ans == "y" ]
			then			
			break
			else
			read tableName
			fi
		elif [ -z $tableName ]
		then
			echo "Empty Input! Please, enter a valid name"
			read tableName

		elif [[ ! $tableName =~ $string ]]
		then
			echo "$tableName not valid. Please, enter valid name (LETTERS ONLY)"
			read tableName
		else 
			echo "Please enter columns number"
			read numCol
		  	case $numCol in
			    +([1-9]))
				    echo "Number of Columns is : $numcol"
		                    echo "please enter name of columns with datatype seperated with :"
     
					for (( i=1; i<=numCol; i++ ))
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
							elif [ -z $colName ]
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
							fi
                                                        #here fix this by add dbname before table name
							echo  "$colMetadata" >> $tableName.metaData
							
						done
                                        #here fix this by add dbname before table name
					touch $tableName
					touch $tableName.metaData
					if [ $? -eq 0 ]
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
