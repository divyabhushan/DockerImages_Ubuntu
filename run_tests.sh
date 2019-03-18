#!/bin/sh
#Library includes
. lib/autoTestsLibrary.sh

#Aim: This script is run under the container built by the docker-compose.test.yml image.
#Scenario: These tests will be run in production enviroment and test our application deployed.

test_suite1(){
	printf "\nTest_suite1...\n"
		#------------------------------------------------------------------------------------------------------
		printf "\t[ TestCase_1 ][ INFO ]:Checking if the following applications are deployed in production..."
		#Give the list of file names and mention if its a file or directory
		#filename;fileOrDirectory
		DEPLOYED_FILES=$1

		egrep '^[a-zA-Z0-9]|^\/' $DEPLOYED_FILES | awk -F';' 'NF==2 {print $0}' | { while read one_line;do
			NAME=` echo $one_line | grep -v "^#" | cut -d';' -f1 ` 
			TYPE=` echo $one_line | grep -v "^#" | cut -d';' -f2 ` 
			deploy_test $NAME $TYPE
		done; }
		#------------------------------------------------------------------------------------------------------
		printf "\n\t[ TestCase_2 ][ INFO ]:Checking if the files are executable; if not change permissions..."
		EXECUTABLE_FILE=$2
		
		#Check the file for valid enteries with lines beginning with alphanumeric letters.
		#Ignore blank space and comments	
		egrep '^[a-zA-Z0-9]|^\/' $EXECUTABLE_FILE | { while read one_line;do
			executable_check $one_line
		done;}

		#------------------------------------------------------------------------------------------------------
		printf "\n\t[ TestCase_3 ][ INFO ]: ..\n"
}

test_suite2(){
	printf "\nTest_suite2...\n"
		#------------------------------------------------------------------------------------------------------
		printf "\t[ TestCase_1 ][ INFO ]:Searching for a pattern in the file..."
		SAMPLE_FILE=$1

		#Grep for only the valid lines beginning with an alphanumeric letter or a forward slash "/".
		#Print only the lines with 2 fields: a filename and pattern using awk

		egrep '^[a-zA-Z0-9]|^\/' $SAMPLE_FILE | awk -F';' 'NF==2 {print $0}' | { while read one_line;do
			FILE=` echo $one_line | cut -d ';' -f1 `
			PATTERN=` echo $one_line | cut -d ';' -f2 `

                	#Call the search_pattern function from lib/autoTestsLibrary.sh
			search_pattern $FILE $PATTERN	
		done; }

		#------------------------------------------------------------------------------------------------------
}

main(){
	#Arguments check
	if [ $# -ne 3 ];then
		echo "[ USAGE ]: [ $0 ] [ DEPLOYED_FILES_LIST ] [ EXECUTABLE_FILES_LIST ] [ PATTERN_SEARCH_LIST ]\n"
		echo "Example:\n"
		echo "$0 data/deployedFiles.txt data/executableFiles.txt data/patternSearch.txt\n"
		exit 1;
	fi

	#Call the set_set-variables function
	set_variables

	printf "\n[ INFO ]: Environment details:\nOperating-system : `uname -o`\nKernel-release : `uname -r`\n" | tee -a $LOGFILE
	test_suite1 $1 $2 | tee -a $LOGFILE
	
	test_suite2 $3 | tee -a $LOGFILE
	printf "\nEnd of test cases...\n" | tee -a $LOGFILE
	exit 0;
} 
main $@
