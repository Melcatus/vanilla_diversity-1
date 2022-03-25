##To do Fst analysis on vcf files, this is the lack analysis on vcf files with missing data = 0.1 (module 9.1)
##Requeriments: R (4.0.0 or superior), library hierfstat, adegenet, vcfR, ggplot, corrplot, popmap
##The archives are in filtered_second directory
setwd("../Process/data/filtered/filtered_second")

##First we need charge the libraries (download first)
install.packages("hierfstat")
install.packages("ggplot2")
install.packages("adegenet")
install.packages("corrplot")
install.packages("vcfR")
library(hierfstat)
library(ggplot2)
library(adegenet)
library(corrplot)
library(vcfR)

##Charge the vcf files and transform with vcfR
fst2.vcf <- read.vcfR("secondlack.recode.vcf")
fst2dat<-vcfR2genind(fst2.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_nd.txt",sep="\t",header=T)
pop(fst2dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstat2dat<-genind2hierfstat(fst2dat)
basicss2 <- basic.stats(fst2dat)
basicssind2 <- summary(fst2dat)
datfst2 <- pairwise.neifst(fstat2dat)
datfstWC2 <- pairwise.WCfst(fstat2dat)

##Plotting the fst matrix (two methods)

png(filename="fst2vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst2,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei2")
corrplot(datfstWC2,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC2")
dev.off()
