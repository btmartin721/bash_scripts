#!/bin/bash

CLUMPAK_DIR=$1;
minK=$2;
maxK=$3;
admixDIR=$4

display_usage() { 
	echo -e "\nThis script is intended to process results from Steve Mussmann's admixturePipeline"
	echo -e "You can find his pipeline at: https://github.com/stevemussmann/admixturePipeline.git\n"
	echo -e "You also must have two of his other GitHub scripts in your path: "
	echo -e "\tdistruct-rerun.py\n\thttps://github.com/stevemussmann/distruct-rerun.git\n"
	echo -e "\tadmixture_cv_sum.py\n\thttps://github.com/stevemussmann/admixture_cv_sum.git\n"
	echo -e "\nUsage:\n./process_admixture.sh [arguments] \n\n"
	echo -e "Required arguments (must be in following order): \n"
	echo -e "\t[CLUMPAK_DIRECTORY] [minK] [maxK] [admixDIR]\n\n"
	echo -e "\tCLUMPAK_DIRECTORY: Path to directory output from CLUMPAK; must be unzipped"
	echo -e "\tminK: Lowest K run in ADMIXTURE"
	echo -e "\tmaxK: Highest K run in ADMIXTURE"
	echo -e "\tadmixDIR: Path to directory with all ADMIXTURE results\n"
	} 

# if less than four arguments supplied, display usage 
	if [  $# -le 3 ] 
	then 
		display_usage
		exit 1
	fi 
 
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

distruct-rerun.py -d $CLUMPAK_DIR -k $minK -K $maxK;
cp MajorClusterRuns.txt $admixDIR;
cd $admixDIR;
for file in `cat MajorClusterRuns.txt`; do grep CV $file >> cv_file.txt; done;
admixture_cv_sum.py -c cv_file.txt;

