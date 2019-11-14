library(lattice)
library(dplyr)

#Genome results

#sp_google_results <- read.table("results_1_Insecta.txt", as.is=TRUE, header=FALSE)
#sp_google_results.nz <- sp_google_results[sp_google_results$V3!=0,]

sp_genome_results <- read.table("results_2_Insecta.txt", as.is=TRUE, header=FALSE)
sp_genome_results.nz <- sp_genome_results[sp_genome_results$V3!=0,]

plot(density(sp_genome_results.nz$V3), main="Density of Non-Zero Genomes")
polygon(density(sp_genome_results.nz$V3), col="#82b446") 

plot(sp_genome_results.nz[order(-sp_genome_results.nz$V3),]$V3)

#Assembly Results

sp_assembly_results <-  read.table("results_4_Insecta.txt", as.is=TRUE, header=FALSE)
sp_assembly_results.nz <- sp_assembly_results[sp_assembly_results$V3!=0,]

plot(density(sp_assembly_results.nz$V3, bw=.5), main="Density of Non-Zero Genomes")
polygon(density(sp_assembly_results.nz$V3, bw=.5), col="#B44682") 

plot(sp_assembly_results.nz[order(-sp_assembly_results.nz$V3),]$V3)

#Pubmed results

sp_pubmed_results <- read.table("results_3_Insecta.txt", as.is=TRUE, header=FALSE)
sp_pubmed_results.nz <- sp_pubmed_results[sp_pubmed_results$V3!=0,]
plot(density(sp_pubmed_results.nz$V3))

sp_pubmed_results.nz.lt20 <- sp_pubmed_results.nz[sp_pubmed_results.nz$V3<20,]

pubmed.density <- density(sp_pubmed_results.nz.lt20$V3, bw=.5)
plot(pubmed.density, main="Density of Non-Zero, Less Than 20 Pubmed")
polygon(pubmed.density, col="steelblue") 

mean(sp_pubmed_results$V3); mean(sp_pubmed_results[sp_pubmed_results$V3!=0,]$V3)

ordered_sp_pubmed_results.nz <- sp_pubmed_results.nz[order(-sp_pubmed_results.nz$V3),]

plot(ordered_sp_pubmed_results.nz$V3, type="h", ylab="Number Hits", ylim=c(0,100), col="steelblue", main="Number of Pubmed Hits")
plot(ordered_sp_pubmed_results.nz$V3, pch=16 , col= ifelse(ordered_sp_pubmed_results.nz$V2 %in% sp_genome_results.nz$V2, "steelblue", "#82b446"), main="Number of Pubmed Hits, Colored by Genome", ylab="Number Hits")

# trim pubmed results to not in assemblies or genomes
'%!in%' <- function(x,y)!('%in%'(x,y))

nogn_ordered_sp_pubmed_results.nz <- ordered_sp_pubmed_results.nz[ordered_sp_pubmed_results.nz$V2 %!in% sp_genome_results.nz$V2,]

