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

##To prun the transformed data and extract the SNP
fgenef<-snpgdsOpen('ffn.gds')
fprunsetsnp<-snpgdsLDpruning(fgenef, autosome.only = F, remove.monosnp = F, )
fsetsnip.id<- unlist(fprunsetsnp)
fsamp.id<-read.gdsn(index.gdsn(fgenef,"sample.id"))

##Execute Principal Component Analysis
fAnPCA<-snpgdsPCA(fgenef, num.thread = 2, eigen.cnt = 16, snp.id = fsetsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
fvar.exp<-fAnPCA$varprop*100
head(round(fvar.exp, 2))

#Do the data frame
fdatfra<-data.frame(name = fAnPCA$sample.id,
                   pop = finfpop$pop,
                   Ei1 = fAnPCA$eigenvect[,1],  
                   Ei2 = fAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##First command line option for a PCA with ggplot package
png(filename="pca_allsp.png", width=900, height=750)
ggplot(data=fdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1")

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

