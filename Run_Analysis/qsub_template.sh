#!/bin/bash
#$ -M dmolik@nd.edu
#$ -m abe
#$ -pe smp 2
#$ -t 1-4
#$ -N search_template

export PATH=/afs/crc.nd.edu/user/d/dmolik/bin:/afs/crc.nd.edu/user/d/dmolik/local/lib/perl5/bin:/afs/crc.nd.edu/user/d/dmolik/local/bin:/afs/crc.nd.edu/user/d/dmolik/local/opt/sratoolkit.2.8.2-1-centos_linux64/bin:/afs/crc.nd.edu/user/d/dmolik/local/opt/mothur:$PATH
export PATH=/afs/crc.nd.edu/user/d/dmolik/local/opt/ncbi-blast-2.6.0+/bin:/afs/crc.nd.edu/user/d/dmolik/local/opt/trout-0.9/bin:$PATH

module load R
export R_LIBS=/afs/crc.nd.edu/user/d/dmolik/R/x86_64-pc-linux-gnu-library/3.5:$R_LIBS

python/2.7.15

OG_DIR=$( pwd )
DIR="/tmp/search_template-${USER}-${JOB_ID}-${SGE_TASK_ID}"

mkdir "$DIR"

cp script_* "$DIR"
cp search_template "$DIR"
cd "$DIR"

sh script_search.sh ${SGE_TASK_ID} search_template results_search_template

mv results_search_template $OG_DIR/results_${SGE_TASK_ID}_search_template
cd "$OG_DIR"
rm -rf "$DIR"
