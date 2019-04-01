#!/bin/sh

#Library includes
. lib/commonLibrary.sh

#Execute the following shells

execute_scripts(){
	
	$SCRIPT_PATH/helloWorld.sh
	$SCRIPT_PATH/currentTime.sh
	$SCRIPT_PATH/run_tests.sh data/deployedFiles.txt data/executableFiles.txt data/patternSearch.txt
}

main(){
	#Call the set_variables function from the common library to set home dir and script path dir
	set_variables

	echo "[ INFO ]:This is my application."
	printf "\tRead the README file for more information: README.md\n"
	echo "[ INFO ]:This runs fine in dev environment."
	echo "[ INFO ]:I am under `uname -a` container"
	echo "[ INFO ]:Packaging the app and its dependencies in a container and shipping it on docker hub."
	#call sub-function to run supporting scripts
	
	execute_scripts

	echo "[ INFO ]:Check if CentOS iso file exists"

	if [ ` find iso -name "CentOS*.iso" ` ];then
		echo "[ OK ]: File exists - ` find iso -name "CentOS*.iso" `"
		exit_status true 
	else
		echo "[ NOK ]: Missing file CentOS*.iso...Cannot run the application."
		exit_status false
	fi
	exit 0;
}

main $@
