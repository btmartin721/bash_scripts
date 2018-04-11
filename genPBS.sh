#!/bin/bash

OUTFILE=$1

if [ $# -lt 1 ]; then
	echo "Usage: ./genPBS.sh <outfile_name_with_extension>
	"
	exit 1;
fi

echo '#!/bin/bash

#PBS -N jobname
#PBS -q queue
#PBS -j oe
#PBS -o jobname.$PBS_JOBID
#PBS -m abe
#PBS -M email@email.com
#PBS -l nodes=1:ppn=SET
#PBS -l walltime=72:00:00
#PBS -V
' > "$1"

exit 0;
