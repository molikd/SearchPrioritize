#sp_google_results <- read.table("results_1_Insecta.txt", as.is=TRUE, header=FALSE)
#sp_google_results.nz <- sp_google_results[sp_google_results$V3!=0,]

sp_genome_results <- read.table("results_2_Insecta.txt", as.is=TRUE, header=FALSE)
sp_genome_results.nz <- sp_genome_results[sp_genome_results$V3!=0,]
plot(density(sp_genome_results.nz$V3))

plot(sp_genome_results.nz[order(-sp_genome_results.nz$V3),]$V3)

sp_pubmed_results <- read.table("results_3_Insecta.txt", as.is=TRUE, header=FALSE)
sp_pubmed_results.nz <- sp_pubmed_results[sp_pubmed_results$V3!=0,]
plot(density(sp_pubmed_results.nz$V3))

sp_pubmed_results.nz.lt20 <- sp_pubmed_results.nz[sp_pubmed_results.nz$V3<20,]
plot(density(sp_pubmed_results.nz.lt20$V3))

plot(sp_pubmed_results.nz[order(-sp_pubmed_results.nz$V3),]$V3)
