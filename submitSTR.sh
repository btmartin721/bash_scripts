#!/bin/bash

# Set command-line arguments
# infile should be a .pbs script that runs structure
# GNU parallel should be used for multiple runs
INFILE=$1
KSTART=$2
KEND=$3
TEST_FLAG=$4

# check if there are at least three command-line arguments
# test_flag allows the user to view the modified .pbs files without submitting to queue
# If you want to use TEST_FLAG, just type any string as the fourth command-line argument
if [ $# -lt 3 ]
	then
		echo "Usage: ./submitSTR.sh <infile.pbs> <starting_K_value> <last_K_value> <optional: test_flag> 
		 "
		exit 1
	fi

if [ ! -f $INFILE ]; then
	echo "Input file does not exist"
	exit 1
fi


# TEST_FLAG is the fourth command-line argument
# if TEST_FLAG is defined, the script will print to STDOUT instead of submitting to queue		
if [ $TEST_FLAG ]; then


# Submits structure runs with K=$2 to K=$3
# The sed command replaces an @ symbol in the .pbs script
# The @ symbol is replaced with the K value
# Each .pbs script is piped into qsub to submit each K value unless TEST_FLAG is defined
	for k in `seq $KSTART $KEND`
		do 
			cat $INFILE | sed "s/&/$k/g"
			#echo "Test flag was used "
		done

else
	for k in `seq $KSTART $KEND`
		do
			cat $INFILE | sed "s/&/$k/g" | qsub
			#echo "No test flag was used "
		done

fi

exit 0

