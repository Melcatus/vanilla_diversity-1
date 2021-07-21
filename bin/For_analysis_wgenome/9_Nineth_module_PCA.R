##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_first/"first.recode.vcf")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes)
thefn<- "first.recode.vcf"
snpgdsVCF2GDS(thefn, "thefn.gds", method="biallelic.only")
popfile<- c("popmap_orig.txt")
infopop<-read_tsv(popfile)
labelfile<-c("code_dup.txt")
infolabel<-read_tsv(labelfile)

##To prun the transformed data and extract the SNP
genef<-snpgdsOpen('thefn.gds')
prunsetsnp<-snpgdsLDpruning(genef, autosome.only = F, remove.monosnp = F, )
setsnip.id<- unlist(prunsetsnp)

##Execute Principal Component Analysis
AnPCA<-snpgdsPCA(genef, num.thread = 2, eigen.cnt = 16, snp.id = setsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
var.exp<-AnPCA$varprop*100
head(round(var.exp, 2))

#Do the data frame
datfra<-data.frame(name = AnPCA$sample.id,
                   pop = infopop$pop,
                   labname = infolabel$code,
                   Ei1 = AnPCA$eigenvect[,1],  
                   Ei2 = AnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca_withdup.png", width=1920, height=1080)
ggplot(data=datfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop))
