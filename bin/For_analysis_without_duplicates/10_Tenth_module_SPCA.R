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

##To prun the transformed data and extract the SNP
sgenef<-snpgdsOpen('sfn.gds')
sprunsetsnp<-snpgdsLDpruning(sgenef, autosome.only = F, remove.monosnp = F, )
ssetsnip.id<- unlist(sprunsetsnp)
samp.id<-read.gdsn(index.gdsn(sgenef,"sample.id"))

##Execute Principal Component Analysis
sAnPCA<-snpgdsPCA(sgenef, num.thread = 2, eigen.cnt = 16, snp.id = ssetsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
svar.exp<-sAnPCA$varprop*100
head(round(svar.exp, 2))

#Do the data frame
sdatfra<-data.frame(name = sAnPCA$sample.id,
                   pop = infpop$pop,
                   Ei1 = sAnPCA$eigenvect[,1],  
                   Ei2 = sAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##First command line option for a PCA with ggplot package
ggplot(data=sdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1")

lbls <- paste("PC", 1:4, "\n", format(var.exp[1:4], digits=2), "%", sep="")
pairs(AnPCA$eigenvect[,1:4], col=datfra$pop, labels=lbls)

chr <- read.gdsn(index.gdsn(genef, "snp.chromosome"))
corr <- snpgdsPCACorr(AnPCA, genef, eig.which=1:4)
savepar <- par(mfrow=c(3,1), mai=c(0.3, 0.55, 0.1, 0.25))
for (i in 1:3)
{
  plot(abs(corr$snpcorr[i,]), ylim=c(0,1), xlab="", ylab=paste("PC", i),
       col=chr, pch="+")
}

