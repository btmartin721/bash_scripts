# bash_scripts

**Some of these are for use on an HPC cluster**

### submitSTR.sh  

Usage:  
`./submitSTR.sh <infile.pbs> <starting_K_value> <last_K_value> <optional: TEST_FLAG>`

Infile should be a .pbs script that runs structure on an HPC cluster  
example PBS script included in repository as example.pbs  

**PBS script MUST HAVE '&' symbol in sed command; it gets replace with K values**

GNU parallel should be used for multiple runs  

If you want to use TEST_FLAG, just type any string as the fourth command-line argument If TEST_FLAG is   
defined, the script will print to STDOUT instead of submitting to queue  

$2 and $3 arguments submit structure runs from K=$2 to K=$3  

Output is piped into qsub command unless TEST_FLAG is defined  


### get-avg-cov_pyradS3.sh  

Usage:  
`./get-avg-cov_pyradS3.sh s3.clusters_filename outfile`

Script takes the s3.clusters.txt output from pyRAD and calculates the average coverage with Depth>N


### genPBS.sh  

Usage:  
`./genPBS.sh <outfile_name_with_extension>`

Generates blank PBS file for use on an HPC cluster
