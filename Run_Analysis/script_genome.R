#!/usr/bin/env Rscript

#library(RISmed)
library(rentrez)

args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
	  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
	  # default output file
	  args[2] = "out.txt"
}

#master_species_list <- read.table("species_list.txt", sep="\t", quote="", header=T, fill=T, as.is=T)

find_data <- function(x, output, x1, x2, x3){
    term <- paste( "\"",x,"\"[All Fields]", sep="")
    Sys.sleep(1)
    r <- EUtilsSummary(term, type='esearch', db='pubmed', mindate=2008, maxdate=2018)
    num <- QueryCount(r)
    cat(c(term,x1,x2,x3,num), file=output, append = T, fill = T)  }

#apply("cryptococcus", 1, find_data, output=args[2])

find_data_2 <- function(x, output){
  split <- strsplit(x, " ")
  search_term <- paste(split[[1]][1], split[[1]][2],"[orgn]") #convert to number
  Sys.sleep(1)
  r_search <-  entrez_search(db="genome", term=search_term,  retmax=0)
  cat(paste( c(search_term,r_search$count, sep="") ), file=output, append = T, fill = T)  }


arg1 <- strsplit(args[1]," ") 
term <- paste(arg1[[1]][1],arg1[[1]][2], sep=" ")

find_data_2(term,args[2])
