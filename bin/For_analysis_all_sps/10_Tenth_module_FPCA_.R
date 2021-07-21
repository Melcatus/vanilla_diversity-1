##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_fourth")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes)
ffn<- "fourth.recode.vcf"
snpgdsVCF2GDS(ffn, "ffn.gds", method="biallelic.only")
fpopfl<- c("pmallsp.txt")
finfpop<-read_tsv(fpopfl)
labfl<-c("code_allsp.txt")
inflb<-read_tsv(labfl)

##To prun the transformed data and extract the SNP
fgenef<-snpgdsOpen('ffn.gds')
fprunsetsnp<-snpgdsLDpruning(fgenef, autosome.only = F, remove.monosnp = F, )
fsetsnip.id<- unlist(fprunsetsnp)

##Execute Principal Component Analysis
fAnPCA<-snpgdsPCA(fgenef, num.thread = 2, eigen.cnt = 16, snp.id = fsetsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
fvar.exp<-fAnPCA$varprop*100
head(round(fvar.exp, 2))

#Do the data frame
fdatfra<-data.frame(name = fAnPCA$sample.id,
                   pop = finfpop$pop,
                   labname = inflb$code,
                   Ei1 = fAnPCA$eigenvect[,1],  
                   Ei2 = fAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca_allsp.png", width=1920, height=1080)
ggplot(data=fdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop))
