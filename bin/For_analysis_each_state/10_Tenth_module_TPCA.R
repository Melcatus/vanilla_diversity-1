##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_third")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes)
tfn<- "third.recode.vcf"
snpgdsVCF2GDS(tfn, "tfn.gds", method="biallelic.only")
tpopfl<- c("pest_nd.txt")
tinfpop<-read_tsv(tpopfl)
labfile<-c("code_stat.txt")
inflab<-read_tsv(labfile)

##To prun the transformed data and extract the SNP
tgenef<-snpgdsOpen('tfn.gds')
tprunsetsnp<-snpgdsLDpruning(tgenef, autosome.only = F, remove.monosnp = F, )
tsetsnip.id<- unlist(tprunsetsnp)

##Execute Principal Component Analysis
tAnPCA<-snpgdsPCA(tgenef, num.thread = 2, eigen.cnt = 16, snp.id = tsetsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
tvar.exp<-tAnPCA$varprop*100
head(round(tvar.exp, 2))

#Do the data frame
tdatfra<-data.frame(name = tAnPCA$sample.id,
                   pop = tinfpop$pop,
                   labname = inflab$code,
                   Ei1 = tAnPCA$eigenvect[,1],  
                   Ei2 = tAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca_state.png", width=1920, height=1080)
ggplot(data=tdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop))
