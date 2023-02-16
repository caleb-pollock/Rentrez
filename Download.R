ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
library(rentrez)  # you may need install.packages first
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")