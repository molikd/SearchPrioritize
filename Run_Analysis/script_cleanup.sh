#!/bin/bash

new_file=$( echo $1 | sed 's/\.txt/\.cln\.txt/g' )

if [[ $1 == *"results_1"* ]]; then
  echo "Results 1 Modifications on $1"
  echo "dumping into $new_file"
  cat $1 | sed "s/\'//g" >> $new_file
 elif [[ $1 == *"results_2"* ]]; then 
  echo "Results 2 Modifications on $1"
  echo "dumping into $new_file"
  cat $1 | sed "s/\'//g" | sed 's/ \[orgn\]//g' >> $new_file
 elif [[ $1 == *"results_3"* ]]; then
  echo "Results 3 Modifications on $1"
  echo "dumping into $new_file"
  cat $1 | sed "s/\'//g" | sed 's/\"\[All\ Fields\]//g' | sed 's/^"//g' >> $new_file
 elif [[ $1 == *"results_4"* ]]; then
  echo "Results 4 Modifications on $1"
  echo "dumping into $new_file"
  cat $1 | sed "s/\'//g" | sed 's/ \[orgn\]//g' >> $new_file
 else
  echo "not a results file"
fi
