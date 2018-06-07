#!/bin/bash


INFILE=$1
OUTFILE=$2
PATTERN=$3


# Must have at least 3 command-line arguments
if [ $# -lt 3 ]
        then
                echo "Usage: ./get_excluded4pyrad.sh <PHYLIP_INFILE> <OUTFILE> <PATTERN_TO_KEEP>
You can use multiple patterns by using \| as a separator: TE\|CA\|MO
		"
                exit 1
        fi

# Check if INFILE exists or exit
if [ ! -f $INFILE ]; then
        echo "Input file does not exist"
        exit 1
fi

# Counts remaining ingroup
COUNT=`grep "$PATTERN" $INFILE | wc -l`
echo "
Remaining ingroup samples: $COUNT
"


## grep -v prints non-matches, so pattern must be the ones you want to keep
awk '{print $1}' $INFILE | grep -v "$PATTERN" | awk '{if(NR>1)print}' | paste -sd ',' > $OUTFILE;


