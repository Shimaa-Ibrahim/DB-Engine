#!/bin/bash 
shopt -s extglob
typeset -i numcol
declare -a colNames
function createTable {	
clear                                

echo "Enter Table Name"
read tableName
while [ 1 -eq 1 ]
	do
                #here fix this by add dbname before table name
		if [ -f $tableName ] && [ ! -z $tableName ]
		then
			echo "$tableName Already EXISTS Please enter a valid name"
			read -p "TRY AGAIN! [y|N] : " answer
			if [[ $answer == "n" || $answer == "N" ]]
			then			
			break
			else
			read tableName
			fi
		elif [ -z $tableName ]
		then
			echo "Empty Input! Please, enter a valid name"
			read tableName

		elif [[ ! $tableName =~ ^[a-zA-Z_]*$ ]]
		then
			echo "$tableName not valid. Please, enter valid name (LETTERS_ ONLY) aT least one letter"
			read tableName
		else 
			echo "Please enter columns number"
			read numCol
		  	case $numCol in
			    +([1-9]))
				    echo "Number of Columns is : $numcol"
		                    #declare -a colNames
     					#colMetadata=$numCol;
					#echo  "$colMetadata" >> $tableName.metaData

					for (( i=1; i<=numCol; i++ ))
						do 
							colMetadata="";
                                                        echo "Enter column name: "
							read  colName;
							colNames[$i-1]=$colName
                                                    	if [ -z $colName ]
							then
								echo "$colName not valid enter a valid name from letters"
								echo "elif 1"
								i=$i-1
								continue;
							elif [[ ! $colName =~ ^[a-zA-Z_]*$ ]]
							then
								echo "$colName  not valid must be String character"
								echo "elif 2"
								i=$i-1
								continue;
							else                                                        
							#add colname to colmetadate so that append on it datatype 
					        	colMetadata="$colName";
							echo "please enter column datatype String(s) IntgerNumber(n): (s/n)" 
							read colDataType;
							if [[ $colDataType == "s" || $colDataType == "S" ]]
						        then
								colMetadata="$colMetadata:string"
							elif [[ $colDataType == "n" || $colDataType == "N" ]]
                                                        then
								colMetadata="$colMetadata:number"
							else 
								echo "$colDatatype is not valid please enter column name again and then datatype String(s) IntgerNumber(n): (s/n)"
								i=$i-1
								continue;
							fi
							fi
                                                        #here fix this by add dbname before table name
							echo  "$colMetadata" >> $tableName.metaData
							
						done
						for (( i=0 ; i < numCol-1 ; i++ ))
						 do
						    for (( j=$i+1 ; j < numCol ; j++ ))
						      do

							if [[ "${colNames[i]}" == "${colNames[j]}" ]]
							then
								echo "NO duplicates is allowed in column names, cannot create table please try again"
 
  								echo "press Enter to continue "
							        rm -rf $tableName.metaData
								rm -rf $tableName
								read enter
								break 3
							fi
   						      done
    				 	         done
					echo  "${colNames[@]}" >> $tableName
                                        #here fix this by add dbname before table name
					touch $tableName
					touch $tableName.metaData
					break 2;
					;;
			    *)	     echo "please enter a valid number from 1 to infinity"
	                             break 2
					;;
               		esac
		fi
	done		
#echo "${colNames[@]}"
#echo "$numCol"
}

