##To do Fst analysis on vcf files (module 9)
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
fst1.vcf <- read.vcfR("second.recode.vcf")
fst1dat<-vcfR2genind(fst1.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_ndcoded.txt",sep="\t",header=T)
pop(fst1dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstatdat<-genind2hierfstat(fst1dat)
basicss <- basic.stats(fst1dat)
basicssind <- summary(fst1dat)
datfst <- pairwise.neifst(fstatdat)
datfstWC <- pairwise.WCfst(fstatdat)

##Plotting the fst matrix (two methods)

png(filename="fst1vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst,is.corr=FALSE,method="number,color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei")
corrplot(datfstWC,is.corr=FALSE,method="number,color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC")
dev.off()
