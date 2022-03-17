##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_second")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes)
sfnl<- "secondlack.recode.vcf"
snpgdsVCF2GDS(sfnl, "sfnl.gds", method="biallelic.only")
popfll<- c("pmap_nod.txt")
infpopl<-read_tsv(popfll)
labelfll<-c("code_nodup.txt")
infolabl<-read_tsv(labelfll)

##To prun the transformed data and extract the SNP
slgenef<-snpgdsOpen('sfnl.gds')
sprunsetsnpl<-snpgdsLDpruning(slgenef, autosome.only = F, remove.monosnp = F, )
ssetsnip.idl<- unlist(sprunsetsnpl)

##Execute Principal Component Analysis
slAnPCA<-snpgdsPCA(slgenef, num.thread = 2, eigen.cnt = 16, snp.id = ssetsnip.idl,
                 missing.rate = 0.10, maf = 0.10, autosome.only = F)

##Calculate the explained variation
slvar.exp<-slAnPCA$varprop*100
head(round(slvar.exp, 2))

#Do the data frame
sldatfra<-data.frame(name = slAnPCA$sample.id,
                   pop = infpopl$pop,
                   labname = infolabl$code,
                   Ei1 = slAnPCA$eigenvect[,1],  
                   Ei2 = slAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca2vp.png", width=1080, height=720)
ggplot(data=sldatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01, size = 5) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop, size = 18))
