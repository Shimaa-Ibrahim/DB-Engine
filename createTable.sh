#!/usr/bin/bash


shopt -s extglob
#-o ! $tname =~ "'^[a-z]|[A-Z]$`" 
function createTable {
	number="^[0-9]+$"
				string='^[a-z]|[A-Z]$'
			
					echo "Enter Table Name"
						read tname
						
					while [ 1 -eq 1 ]
					do
						
						if [ -f $tname ]
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
							echo "enter columns number"
							read numCol
						  	case $numCol in
								    +([0-9])) echo "number"
									#break
									#	echo "plz enter name of columns with datatype sperated with ` `"
						#	declare -a array
						#	declare -a checkarr
						#	for (( i=1 ; i <= numCol ; i++ ))
						#	do 
						#		read separator
						#		if [[ $separator != *" "* ]]
						#		then
						#			echo "datatype must be seprated by '  ' "
						#			break 2
						#		fi
						#		IFS=' '
						#		read -ra NAMES <<< "$ separator"
								#if [[ [ "${NAMES[1]}"  -eq  'number'  ] || [ "${NAMES[1]}" = 'string'  ] ]]
								#then
						#			array[i]=$separator
						#			checkarr[i]=${NAMES[0]}
								#else
								#	echo "plz enter correct data type"
								#	i=$i-1
								#fi
						#	done
						    touch ~/DB-Engine/$tname
							echo "${array[@]}" > ~/DB-Engine/$tname
							if [[ $? -eq 0 ]]
							then
								echo "table created"
								break
							fi
									 ;;
									 *)		
									echo "please enter a valid number"
									break
									;;
							esac
		
						fi
					done	
	
}

crTable
