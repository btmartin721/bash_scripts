# bash_scripts
Random bash scripts

submitSTR.sh: 

Set command-line arguments
Infile should be a .pbs script that runs structure on an HPC cluster
GNU parallel should be used for multiple runs
Must be at least three command-line arguments

Fourth command-line argument (TEST_FLAG) allows the user to view the modified .pbs files without submitting to queue

If you want to use TEST_FLAG, just type any string as the fourth command-line argument

If TEST_FLAG is defined, the script will print to STDOUT instead of submitting to queue
Submits structure runs with K=$2 to K=$3

.pbs script MUST HAVE '&' symbol in sed command

The sed command replaces an '&' symbol in the .pbs script
The '&' symbol is replaced with the K value

Each .pbs script is piped into qsub to submit each K value unless TEST_FLAG is defined
