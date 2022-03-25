##To do Fst analysis on vcf files, this is the lack analysis on vcf files with just cultivated samples, with missing data = 0.1 (module 9.2C)
##Requeriments: R (4.0.0 or superior), library hierfstat, adegenet, vcfR, ggplot, corrplot, and the popmap with just cultivated samples
##The archives are in filtered_second/culti directory
setwd("../Process/data/filtered/filtered_second/culti")

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
fst5.vcf <- read.vcfR("cultian.recode.vcf")
fst5dat<-vcfR2genind(fst5.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_ndC.txt",sep="\t",header=T)
pop(fst5dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstat5dat<-genind2hierfstat(fst5dat)
basicss5 <- basic.stats(fst5dat)
basicssind5 <- summary(fst5dat)
datfst5 <- pairwise.neifst(fstat5dat)
datfstWC5 <- pairwise.WCfst(fstat5dat)

##Plotting the fst matrix (two methods)

png(filename="fst5vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst5,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei5")
corrplot(datfstWC5,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC5")
dev.off()


##Same analysis but strict
##To do Fst analysis on vcf files, this is the strict analysis on vcf files with just cultivated samples, with missing data = 0.8 (module 9.2C)
##Requeriments: R (4.0.0 or superior), library hierfstat, adegenet, vcfR, ggplot, corrplot, and the popmap with just cultivated samples
##The archives are in filtered_second/culti directory
setwd("../Process/data/filtered/filtered_second/culti")

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
fst7.vcf <- read.vcfR("cultians.recode.vcf")
fst7dat<-vcfR2genind(fst7.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_ndC.txt",sep="\t",header=T)
pop(fst7dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstat7dat<-genind2hierfstat(fst7dat)
basicss7 <- basic.stats(fst7dat)
basicssind7 <- summary(fst7dat)
datfst7 <- pairwise.neifst(fstat7dat)
datfstWC7 <- pairwise.WCfst(fstat7dat)

##Plotting the fst matrix (two methods)

png(filename="fst7vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst7,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei7")
corrplot(datfstWC7,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC7")
dev.off()
