#!/bin/bash

IFS=$'\n';

if [ "$1" = 1 ]; then
	echo "google"
	IFS=$'\n';
	for line in $( cat $2); do
		sleep $(awk -v min=1 -v max=2 'BEGIN{srand(); print (min+rand()*(max-min))}')
		species_name=$( echo $line | awk '{print $1" "$2}' )
		google_hits=$( python script_google.py --phrase "$species_name" --after 2007 --before 2019 -c 0 --txt-globals --no-patents | awk 'NR==1{print $3}')
		echo "$line $google_hits" >> $3
	done
elif [ "$1" = 2 ]; then
	echo "genome"
	for line in $( cat $2); do
		Rscript script_genome.R "$line" "$3"
	done
elif [ "$1" = 3 ]; then 
	echo "pubmed"
	for line in $( cat $2); do
		Rscript script_pubmed.R "$line" "$3"
	done
elif [ "$1" = 4 ]; then
	echo "assembly"
	for line in $( cat $2); do
		Rscript script_assembly.R "$line" "$3"
	done
else
	echo "nothing"
fi
#for line in $( cat $2); do
#  Rscript search_script.R "$line" "$3"
#done
