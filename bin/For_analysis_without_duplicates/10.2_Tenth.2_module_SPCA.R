##Prerequisite libraries: SNPRelate (available on the package Bioconductor)
##and Tidyverse (available on the default CRAN of R)
##The archive is in directory (../Process/data/filtered/filtered_second")

##Open the libraries
library(SNPRelate)
library(tidyverse)

##Transform the file .vcf into gds and prepare the popmap (used in the previous
##analyzes)
sfns<- "secondstr.recode.vcf"
snpgdsVCF2GDS(sfns, "sfns.gds", method="biallelic.only")
popfls<- c("pmap_nod.txt")
infpops<-read_tsv(popfls)
labelfls<-c("code_nodup.txt")
infolabs<-read_tsv(labelfls)

##To prun the transformed data and extract the SNP
ssgenef<-snpgdsOpen('sfns.gds')
sprunsetsnps<-snpgdsLDpruning(ssgenef, autosome.only = F, remove.monosnp = F, )
ssetsnip.ids<- unlist(sprunsetsnps)

##Execute Principal Component Analysis
ssAnPCA<-snpgdsPCA(ssgenef, num.thread = 2, eigen.cnt = 16, snp.id = ssetsnip.ids,
                 missing.rate = (0.8 o 0.9), maf = 0.10, autosome.only = F)

##Calculate the explained variation
ssvar.exp<-ssAnPCA$varprop*100
head(round(ssvar.exp, 2))

#Do the data frame
ssdatfra<-data.frame(name = ssAnPCA$sample.id,
                   pop = infpops$pop,
                   labname = infolabs$code,
                   Ei1 = ssAnPCA$eigenvect[,1],  
                   Ei2 = ssAnPCA$eigenvect[,2],    
                   stringsAsFactors = FALSE)

##Command line for a PCA with ggplot package
png(filename="pca_vplanwcs.png", width=1920, height=1080)
ggplot(data=ssdatfra,aes(Ei1,Ei2)) + geom_jitter(aes(color=pop), width=0.01,height=0.01) + ylab("PC 2") + xlab("PC 1") + geom_text(aes(label=labname, hjust=0, vjust=0, color=pop))
