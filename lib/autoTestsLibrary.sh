#!/bin/sh

#Aim: Library that defines sub-functions for the auto tests to be run under the production container
#Library file
#Functions:
#	deploy_test
#	executable_check
#	search_pattern
#	set_variables
	
#--------------------------------------------------------------------------------------------------------------------------
deploy_test(){
		name=$1
		fileOrDirectory=$2
		case $fileOrDirectory in
		"file")
                	if [ -f $name ];then
                        	flag="succeeded"
                        	ok_nok="OK"
                	else
                        	flag="failed"
                        	ok_nok="NOK"
                	fi
		;;

		"directory")
                	if [ -d $name ];then
                        	flag="succeeded"
                        	ok_nok="OK"
                	else
                        	flag="failed"
                        	ok_nok="NOK"
                	fi
		;;
		*)
			echo "[ ERROR ]: Invalid input; please mention 2nd parameter as either a file or a directory\n"
			;;
		esac
		
		printf "\n\t\t[ $ok_nok ]: $fileOrDirectory - $name deployment in production $flag!!!"
}

#--------------------------------------------------------------------------------------------------------------------------
executable_check(){
	FILE=$1
	if [ -f $FILE ];then
		if [ ! -x $FILE ];then
			printf "\n\t\t[ INFO ]: Assigning executable permission on the $FILE file..."
			chmod +x $FILE
		fi
		printf "\n\t\t[ OK ]: $FILE is an executable file..."
	else
		printf "\n\t\t[ NOK ]: $FILE does not exists..."
	fi
}

#--------------------------------------------------------------------------------------------------------------------------
search_pattern(){
		FILE=$1
		PATTERN=$2
		result="found"
		ok_nok="OK"
		if [ ` grep -iw ".*$PATTERN.*" $FILE | wc -l ` -eq 0 ];then
			result="not found"
			ok_nok="NOK"
		fi

		printf "\n\t\t[ $ok_nok ]: Pattern - \"$PATTERN\" $result in the file - $FILE"
}
	
#--------------------------------------------------------------------------------------------------------------------------
set_variables(){
	DIR=`pwd`
	CURR_DATE=`date "+%Y%m%d_%H:%M:%S"`
	if [ ! -d $DIR/logs ];then
		mkdir $DIR/logs
	fi
	LOGFILE="$DIR/logs/autoBuildTestsResult_$CURR_DATE.log"
}

#--------------------------------------------------------------------------------------------------------------------------

