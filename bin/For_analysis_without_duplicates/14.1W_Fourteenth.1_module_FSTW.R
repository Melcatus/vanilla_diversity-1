##To do Fst analysis on vcf files, this is the lack analysis on vcf files with just wild samples, with missing data = 0.1 (module 9.1W)
##Requeriments: R (4.0.0 or superior), library hierfstat, adegenet, vcfR, ggplot, corrplot, and the popmap with just wild samples
##The archives are in filtered_second/wild directory
setwd("../Process/data/filtered/filtered_second/wild")

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
fst4.vcf <- read.vcfR("wildan.recode.vcf")
fst4dat<-vcfR2genind(fst4.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_ndW.txt",sep="\t",header=T)
pop(fst4dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstat4dat<-genind2hierfstat(fst4dat)
basicss4 <- basic.stats(fst4dat)
basicssind4 <- summary(fst4dat)
datfst4 <- pairwise.neifst(fstat4dat)
datfstWC4 <- pairwise.WCfst(fstat4dat)

##Plotting the fst matrix (two methods)

png(filename="fst4vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst4,is.corr=FALSE,method="number,color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei4")
corrplot(datfstWC4,is.corr=FALSE,method="number,color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC4")
dev.off()

##Same analysis but strict

##To do Fst analysis on vcf files, this is the strict analysis on vcf files with just wild samples, with missing data = 0.8 (module 9.1W)
##Requeriments: R (4.0.0 or superior), library hierfstat, adegenet, vcfR, ggplot, corrplot, and the popmap with just wild samples
##The archives are in filtered_second/wild directory
setwd("../Process/data/filtered/filtered_second/wild")

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
fst6.vcf <- read.vcfR("wildans.recode.vcf")
fst6dat<-vcfR2genind(fst6.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_ndW.txt",sep="\t",header=T)
pop(fst6dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstat6dat<-genind2hierfstat(fst6dat)
basicss6 <- basic.stats(fst6dat)
basicssind6 <- summary(fst6dat)
datfst6 <- pairwise.neifst(fstat6dat)
datfstWC6 <- pairwise.WCfst(fstat6dat)

##Plotting the fst matrix (two methods)

png(filename="fst6vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst6,is.corr=FALSE,method="number,color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei6")
corrplot(datfstWC6,is.corr=FALSE,method="number,color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC6")
dev.off()
