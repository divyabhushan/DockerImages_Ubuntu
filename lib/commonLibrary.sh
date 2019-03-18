#!/bin/sh

#CommonLibrary file
set_variables(){
	DIR="`pwd`"
	SCRIPT_PATH="$DIR/code"
}

#To check the exit status of the previous program, exit the main program if there is a failed sub-function.
exit_status(){
	flag=$1
	case $flag in 
	"false")
		echo "[ NOK ]: Program failed with non-zero status !!!"
		echo "[ NOK ]: Cannot run the application. Program failed...\n"
		exit 1;
	;;
	"true")
		echo "[ OK ]: Program deployed successfully !!!"
	;;
	*)
		echo "[ ERROR ]: Program in unknown status error!!!\nAbort the program..."
		exit 1;
	;;
	esac
}

