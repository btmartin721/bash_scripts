#!/bin/bash

#Must have two command-line arguments
if [ $# -lt 2 ]; then 

	echo "Usage: avg_cov_pyRAD-s3.sh <s3.clusters_filename> <outfile>"
	exit 1; 

fi

file=$1;
outfile=$2

cat $file | sed -e '2,${ /^$/,$d }' | awk -v N=6 '{ sum += $N } END { if (NR > 0) print sum / NR }' > $outfile

