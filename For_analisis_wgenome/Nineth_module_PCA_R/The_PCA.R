library(SNPRelate)
library(tidyverse)

thefn<- "first.recode.vcf"
snpgdsVCF2GDS(thefn, "thefn.gds", method="biallelic.only")
popfile<- c("popmap_orig.tsv")


genef<-snpgdsOpen('thefn.gds')
prunsetsnp<-snpgdsLDpruning(genef, autosome.only = F, remove.monosnp = F, )
setsnip.id<- unlist(prunsetsnp)


AnPCA<-snpgdsPCA(genef, num.thread = 2, eigen.cnt = 16, snp.id = setsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

var.exp<-AnPCA$varprop*100
head(round(var.exp, 2))

infopop<-read_tsv(popfile)

datfra<-data.frame(name = AnPCA$sample.id,
                  Ei1 = AnPCA$eigenvect[,1],  
                  Ei2 = AnPCA$eigenvect[,2],    
                  stringsAsFactors = FALSE)

ndfra<-merge(datfra, infopop)

library(ggplot2)
ggplot(data=ndfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=population), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1")

plot(datfra$Ei2, datfra$Ei1, xlab="eigenvector 2", ylab="eigenvector 1")