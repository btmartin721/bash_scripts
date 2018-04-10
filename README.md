# bash_scripts
Random bash scripts

submitSTR.sh: 

Usage: ./submitSTR.sh <infile.pbs> <starting_K_value> <last_K_value> <optional: test_flag>

Must be at least three command-line arguments

Infile should be a .pbs script that runs structure on an HPC cluster
example PBS script included in repository as example.pbs

GNU parallel should be used for multiple runs

Fourth command-line argument (TEST_FLAG) allows the user to view the modified .pbs files without submitting to queue
If you want to use TEST_FLAG, just type any string as the fourth command-line argument
If TEST_FLAG is defined, the script will print to STDOUT instead of submitting to queue

$2 and $3 arguments submit structure runs with K=$2 to K=$3

.pbs script MUST HAVE '&' symbol in sed command in the .pbs script; it gets replaced with K values

Each .pbs script is piped into qsub to submit each K value unless TEST_FLAG is defined
