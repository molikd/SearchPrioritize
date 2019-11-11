#!/bin/bash
#$ -M dmolik@nd.edu
#$ -m abe
#$ -pe smp 2
#$ -N clean_search_template

export PATH=/afs/crc.nd.edu/user/d/dmolik/bin:/afs/crc.nd.edu/user/d/dmolik/local/lib/perl5/bin:/afs/crc.nd.edu/user/d/dmolik/local/bin:/afs/crc.nd.edu/user/d/dmolik/local/opt/sratoolkit.2.8.2-1-centos_linux64/bin:/afs/crc.nd.edu/user/d/dmolik/local/opt/mothur:$PATH
export PATH=/afs/crc.nd.edu/user/d/dmolik/local/opt/ncbi-blast-2.6.0+/bin:/afs/crc.nd.edu/user/d/dmolik/local/opt/trout-0.9/bin:$PATH

#grep -v -f results_1_Insecta_complete.txt Insecta.txt >> results_1_Insecta_redo_list.txt
#grep -v -f results_2_Insecta_complete.txt Insecta.txt >> results_2_Insecta_redo_list.txt
grep -v -f results_4_Insecta_complete.txt Insecta.txt >> results_4_Insecta_redo_list.txt
