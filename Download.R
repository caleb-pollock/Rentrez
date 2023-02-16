# Creates a  vector containing the IDs for nucleotide sequences found in the NCBI database
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

library(rentrez)

# Retrieve nucleotide sequences associated with IDs in the vector above, DB = database, and we are using the nucleotide database, id = the nucleotide sequences we wish to search, rettype = output to fasta format
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") 

                                                                      
head(Bburg)

Sequences <- strsplit(Bburg, split = "\n\n")

Sequences <- unlist(Sequences)

# create headers and seq
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)


# Create sequence data frame
Sequences<-data.frame(Name=header,Sequence=seq)
print(Sequences)

# Remove new line characters from the Sequence column
Sequences$Sequence <- gsub("\n", "",Sequences$Sequence)
print(Sequences)

write.csv(Sequences, file = "Sequences.csv", row.names = FALSE)