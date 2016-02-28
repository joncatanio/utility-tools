#!/bin/sh
# Description: Reads files from user input and transfers them from local 
#              machine to server. 

# The path that files will be transfered to on the server.
TRANSFER_PATH=""
# The server to transfer files to (e.g. "user@127.0.0.1").
SERVER=""
# A specific port if needed (e.g. "-P 3022").
PORT=""

# Files to always include in the transfer.
ALWAYS_TRANSFER=""

# Get user input for file to transfer, could be path or current directory.
printf "\033[36m"
printf "Enter file(s) to transfer to \033[0;46m%s\033[m: " "$SERVER" 
printf "\033[m"
# -r flag treats backslashes as a part of the input line permitting path input. 
read -r files
scp $PORT $ALWAYS_TRANSFER $files $SERVER:$TRANSFER_PATH

# Check scp(1) exit status and print conditional message.
STATUS=$?
if [ $STATUS -eq 0 ]; then
   printf "\n\033[33;32mTransfer successful.\033[m\n"
else
   printf "\n\033[33;31mTransfer failed!\033[m\n"
fi

exit 0
