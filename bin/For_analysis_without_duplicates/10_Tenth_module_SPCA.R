##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_second")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes)
sfn<- "second.recode.vcf"
snpgdsVCF2GDS(sfn, "sfn.gds", method="biallelic.only")
popfl<- c("pmap_nod.txt")
infpop<-read_tsv(popfl)
labelfl<-c("code_nodup.txt")
infolab<-read_tsv(labelfl)

##To prun the transformed data and extract the SNP
sgenef<-snpgdsOpen('sfn.gds')
sprunsetsnp<-snpgdsLDpruning(sgenef, autosome.only = F, remove.monosnp = F, )
ssetsnip.id<- unlist(sprunsetsnp)

##Execute Principal Component Analysis
sAnPCA<-snpgdsPCA(sgenef, num.thread = 2, eigen.cnt = 16, snp.id = ssetsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
svar.exp<-sAnPCA$varprop*100
head(round(svar.exp, 2))

#Do the data frame
sdatfra<-data.frame(name = sAnPCA$sample.id,
                   pop = infpop$pop,
                   labname = infolab$code,
                   Ei1 = sAnPCA$eigenvect[,1],  
                   Ei2 = sAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca1vp.png", width=1080, height=720)
ggplot(data=sdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01, size = 5) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop, size = 18))
