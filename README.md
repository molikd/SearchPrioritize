# API Search Repoisitory of Data for Genome Sequening

* README.md - This File, File Manifest

## Manifests of names of Sepcies
* Animalia_1.txt
* Animalia_2.txt
* Animalia_3.txt
* Animalia_4.txt
* Chromista.txt
* Fungi.txt
* Plantae.txt
* Protozoa.txt

## Files for Cluster Utility
* qsub_submit.sh - Submits template
* qsub_template.sh - Template Submit File, useally slightly edited for Job Control
* options_combinations.txt - Different Files for Qsub Processing

## Results of Search
* results_Animalia.txt - Final Results Animalia
* results_Chromista.txt - Final Results Chromista
* results_Fungi.txt - Final Results Fungi
* results_Plantae.txt - Final Results Plantae
* results_Protozoa.txt - Final Results Protozoa

## QC Files
* results_Animalia_1.bak.txt - Combined Files Ouput for Animalia, was split list for Anilalia 
* results_Animalia_2.bak.txt - Combined Files Ouput for Animalia
* results_Animalia_3.bak.txt - Combined Files Ouput for Animalia
* results_Animalia_4.bak.txt - Combined Files Ouput for Animalia
* results_qc_Chromista.txt - Combined Files Raw Ouput for Chromista
* results_qc_Fungi.txt - Combined Files Raw Ouput for Fungi
* results_qc_Plantae.txt - Combined Files Raw Ouput for Plantae

## Scripts for Searching 
* script_assembly.R - For Searching NCBI Assemblies 
* script_genome.R - For Searching NCBI Genomes
* script_google.py - For Searching Google Scholar
* script_google.sh - For Searching Google Scholar (Wrapper)
* script_pubmed.R - For Searching NCBI Pubmed
* script_search.sh - General Call Script, mostly used for cluster interaction



#### script_assembly.R - For Searching NCBI Assemblies 
```R
# Call for assemblies is:
find_data_2 <- function(x, output){
  split <- strsplit(x, " ")
  search_term <- paste(split[[1]][1], split[[1]][2],"[orgn]") 
  Sys.sleep(.8)
  r_search <-  entrez_search(db="assembly", term=search_term,  retmax=0)
  cat(paste( c(search_term,r_search$count, sep="") ), file=output, append = T, fill = T)  }
  
# Actual example search of a species going out would be:
"Cryptococcus Neoformans [orgn]"
```
#### script_genome.R - For Searching NCBI Genomes
```R
# Call for assemblies is:
find_data_2 <- function(x, output){
  split <- strsplit(x, " ")
  search_term <- paste(split[[1]][1], split[[1]][2],"[orgn]") #convert to number
  Sys.sleep(.8)
  r_search <-  entrez_search(db="genome", term=search_term,  retmax=0)
  cat(paste( c(search_term,r_search$count, sep="") ), file=output, append = T, fill = T)  }
  
# Actual example search of a species going out would be:
"Cryptococcus Neoformans [orgn]"
```
#### script_google.sh - For Searching Google Scholar (Wrapper)
```bash
# Call for google scholar hits is:
  species_name=$( echo $line | awk '{print $1" "$2}' )
  google_hits=$( python scholar.py --phrase "$species_name" --after 2007 --before 2019 -c 0 --txt-globals --no-patents | awk 'NR==1{print $3}') # should not include 2007 and 2019
  
# Actual example search of a species going out would be:
"Cryptococcus Neoformans"
```
#### script_pubmed.R - For Searching NCBI Pubmed
```R
find_data <- function(x, output){
    term <- paste( "\"",x,"\"[All Fields]", sep="")
    Sys.sleep(.9)
    r <- EUtilsSummary(term, type='esearch', db='pubmed', mindate=2008, maxdate=2018) # Should include 2008 and 2018
    num <- QueryCount(r)
    cat(c(term,num), file=output, append = T, fill = T)  }
  
# Actual example search of a species going out would be:
"Cryptococcus Neoformans"[All Fields]
```


