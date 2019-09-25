#!/bin/bash

IFS=$'\n';
for line in $( cat $1); do
  sleep $(awk -v min=1 -v max=2 'BEGIN{srand(); print (min+rand()*(max-min))}')
  species_name=$( echo $line | awk '{print $1" "$2}' )
  google_hits=$( python scholar.py --phrase "$species_name" --after 2007 --before 2019 -c 0 --txt-globals --no-patents | awk 'NR==1{print $3}')
  echo "$line $google_hits" >> $2
done
