##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_second/wild")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap with just wild samples (used in the previous
##analyzes)
sfnw<- "wildan.recode.vcf"
snpgdsVCF2GDS(sfnw, "sfnw.gds", method="biallelic.only")
popflw<- c("pmap_nodW.txt")
infpopw<-read_tsv(popflw)
labelflw<-c("code_nodupW.txt")
infolabw<-read_tsv(labelflw)

##To prun the transformed data and extract the SNP
swgenef<-snpgdsOpen('sfnw.gds')
wprunsetsnps<-snpgdsLDpruning(swgenef, autosome.only = F, remove.monosnp = F, )
swetsnip.ids<- unlist(wprunsetsnps)

##Execute Principal Component Analysis
wsAnPCA<-snpgdsPCA(swgenef, num.thread = 2, eigen.cnt = 16, snp.id = swetsnip.ids,
                 missing.rate = (0.1), maf = (0.10), autosome.only = F)

##Calculate the explained variation
swvar.exp<-wsAnPCA$varprop*100
head(round(swvar.exp, 2))

#Do the data frame
swdatfra<-data.frame(name = wsAnPCA$sample.id,
                   pop = infpopw$pop,
                   labname = infolabw$code,
                   Ei1 = wsAnPCA$eigenvect[,1],  
                   Ei2 = wsAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca4vp.png", width=1080, height=720)
ggplot(data=swdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01, size = 5) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop, size = 18))


##Same analysis but strict
##The archive is in directory (../Process/data/filtered/filtered_second/wild")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes). We need the popmap with just wild samples
sfnws<- "wildans.recode.vcf"
snpgdsVCF2GDS(sfnws, "sfnws.gds", method="biallelic.only")
popflws<- c("pmap_nodW.txt")
infpopws<-read_tsv(popflws)
labelflws<-c("code_nodupW.txt")
infolabws<-read_tsv(labelflws)

##To prun the transformed data and extract the SNP
swsgenef<-snpgdsOpen('sfnws.gds')
wsprunsetsnps<-snpgdsLDpruning(swsgenef, autosome.only = F, remove.monosnp = F, )
swetssnip.ids<- unlist(wsprunsetsnps)

##Execute Principal Component Analysis
wssAnPCA<-snpgdsPCA(swsgenef, num.thread = 2, eigen.cnt = 16, snp.id = swetssnip.ids,
                 missing.rate = (0.8), maf = (0.1), autosome.only = F)

##Calculate the explained variation
swsvar.exp<-wsAnPCA$varprop*100
head(round(swvars.exp, 2))

#Do the data frame
swsdatfra<-data.frame(name = wssAnPCA$sample.id,
                   pop = infpopws$pop,
                   labname = infolabws$code,
                   Ei1 = wssAnPCA$eigenvect[,1],  
                   Ei2 = wssAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca6vp.png", width=1080, height=720)
ggplot(data=swsdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01, size = 5) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop, size = 18))
