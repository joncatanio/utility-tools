#!/bin/sh
# This script assumes the user is redirecting input
# into a program through stdin. The user must create a 
# directory named "Tests" and place all test files, as .txt,
# into this directory. This script will also try to use 
# a makefile if there is one. 
#
# Green Text = Program successfully ran and finished with no error code.
# Red Text = Program finished with a non-zero exit status.

# Input executable name and the file extension of the test files..
EXECUTABLE_NAME=""
EXTENSION=""

declare "EXECUTE=java -ea $EXECUTABLE_NAME" 
FILES=Tests/*.$EXTENSION

# Compile code.
make

# Loop through all files in the Tests directory.
for f in $FILES
do
	echo
	echo "TESTING: $f..."
	
	printf "\033[33;36m"
	$EXECUTE < $f
	STATUS=$?
	printf "\033[0m"

	if [ $STATUS -eq 0 ]; then
		echo "\033[33;32m$f TEST COMPLETE. \033[0m"
		echo 
	else
		echo "\033[33;31m$f exited with a non-zero exit status. \033[0m"
		echo
	fi
	echo "-------------------------------------------------------"
done

exit 0
