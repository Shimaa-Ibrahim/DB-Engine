#!/bin/bash


shopt -s extglob

function createTable {
	                                
				string='^[a-z]|[A-Z]$'
					echo "Enter Table Name"
					read tname
			
					while [ 1 -eq 1 ]
					do
						
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
								read -p "Enter column name: " colName;
								# validate column name
								#nameFlag=$(validateColumnName "$colName");
								#if [[ $nameFlag == 0 ]]; then
								    colMetadata="$colName";
								    # select column datatype (string, number)
								    read -p "Choose column's datatype String(s) Number(n): (s/n)" colDataType;
								    if [[ $colDataType == "s" || $colDataType == "S" ]]; then
									colMetadata="$colMetadata:string";
								    elif [[ $colDataType == "n" || $colDataType == "N" ]]; then
									colMetadata="$colMetadata:number";
								    fi
								echo  "$colMetadata" >> ~/DB-Engine/$tname.metaData
								#fi
							done
								
                                                                     touch ~/DB-Engine/$tname
								     touch ~/DB-Engine/$tname.metaData
									
								
								     if [[ $? -eq 0 ]]
								     then
										echo "table created successfully"
										break 2
								     fi
								
								     ;;
								     *)		
									echo "please enter a valid number from 1 to infinity"
									break 2
									;;
							esac
		
						fi
					done		
	
}

createTable
