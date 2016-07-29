#!/usr/bin/env bash
##################################################
#                                                #
# Little script which waits for a file to come   #
# into existence for a certain amount of time.   #
# Will succeed if the file emerges and fail if   #
# not.                                           #
#                                                #
# Can be used in docker shared volumes instead   #
# of inotifywait as it wont work their           #
#                                                #
##################################################

# properly rename file name and timeout arguments
fileToWaitFor="$1";
timeoutDuration=$2;

# iterate X times and check if the file exists
# Return 0 if so, >0 otherwise
for i in `seq 1 $timeoutDuration`;
do
    # sleep a little to map to actual seconds
    sleep 1;

    # check for file existence and react upon it
    if [ -e "$fileToWaitFor" ]
    then
        exit 0;
    fi
done

# the loop is done so we must have failed
exit 1;