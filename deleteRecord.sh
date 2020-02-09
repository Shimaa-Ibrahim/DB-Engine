#!/bin/bash 
shopt -s extglob

function deleteRecord {
clear
	echo "please enter the table name to delete from"
	read tableName
		if [ ! -f $tableName ] && [ ! -z $tableName ]
		then 
			echo "inValid table name does not exist please enter a valid table name"
		elif [ -z $tableName ]
		then
			echo "Empty Input! Please, enter a valid name"
			read tableName
		else

			numCol=`cat $tableName.metaData | wc -l`
			#echo $numCol
			declare -a colNames
			declare -a colValues
			rowNum=`cat $tableName | wc -l`
			colNameExist=0
			colValueExist=0
			for (( i=1; i<=numCol; i++ ))
			do
				colName=`sed -n "$i p" $tableName.metaData | cut -d: -f1`
				colNames[$i-1]=$colName
				
			done
                        echo "Do you want to delete all records or only one record press [a|o]?"
			read answer
			if  [[ $answer == "a" || $answer == "A" ]]
			then
				deleteAll;
				echo "all records deleted successfully"
			elif  [[ $answer == "o" || $answer == "O" ]]
			then
				echo "please enter column name to delete a record according to it from the following"
				echo ${colNames[@]}
				read colNameToDeleteAcc
						
				for (( i=1; i<=numCol; i++ ))
				do
					if [[ ${colNames[$i-1]} == $colNameToDeleteAcc ]]
					then
						colNameExist=1
						fieldNum=$((i+1))
						break;
					
					fi
				done
				
				if [[ colNameExist -eq 0 ]]
				then
					echo "invalid column name nothing to delete"				
				elif [[ colNameExist -eq 1 ]]
				then
							
					for (( i=2; i<=rowNum; i++ ))
					do
						colValue=`sed -n "$i p" $tableName | cut -d ' ' -f$fieldNum`
						colValues[$i-1]=$colValue
					done
					echo ${colValues[@]}
					
						echo "please enter column value to delete a record according to it"
						read colValueToBeDeleted
						rowNum=`cat $tableName | wc -l`
						
						for (( i=2; i<=rowNum; i++ ))
						 do
							if [[ ${colValues[$i-1]} == $colValueToBeDeleted ]]
							then
								
								colValueExist=1
								`sed -i "$i d" $tableName`
				 				echo "Record where $colNameToDeleteAcc = $colValueToBeDeleted has been deleted"
								rowNum=$rowNum-1
								#to delete 1st value match
								break;
							
							fi
						 done
					if [[ colValueExist -eq 0 ]]
					then
						echo "Invalid column value nothing to delete"
					fi

				fi
			else
				echo "Invalid answer"
			fi	  
		  fi	
}
function deleteAll {
	rowNum=`cat $tableName | wc -l`
	for (( i=rowNum; i>=2; i-- ))
	 do
		`sed -i "$i d" $tableName`
	
	done
}
