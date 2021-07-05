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

##To prun the transformed data and extract the SNP
tgenef<-snpgdsOpen('tfn.gds')
tprunsetsnp<-snpgdsLDpruning(tgenef, autosome.only = F, remove.monosnp = F, )
tsetsnip.id<- unlist(tprunsetsnp)
tsamp.id<-read.gdsn(index.gdsn(tgenef,"sample.id"))

##Execute Principal Component Analysis
tAnPCA<-snpgdsPCA(tgenef, num.thread = 2, eigen.cnt = 16, snp.id = tsetsnip.id,
                 missing.rate = 0.30, maf = 0.10, autosome.only = F)

##Calculate the explained variation
tvar.exp<-tAnPCA$varprop*100
head(round(tvar.exp, 2))

#Do the data frame
tdatfra<-data.frame(name = tAnPCA$sample.id,
                   pop = tinfpop$pop,
                   Ei1 = tAnPCA$eigenvect[,1],  
                   Ei2 = tAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##First command line option for a PCA with ggplot package
png(filename="pca_state.png", width=900, height=750)
ggplot(data=tdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1")

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

