##To do Fst analysis on vcf files, this is the strict analysis on vcf files with missing data = 0.8 (module 9.2)
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
fst3.vcf <- read.vcfR("secondstr.recode.vcf")
fst3dat<-vcfR2genind(fst3.vcf)

##Add the populations and turn it as factors
labest <- read.table("pest_nd.txt",sep="\t",header=T)
pop(fst3dat)<-labest$pop

##Getting the fst stats with two methods: Weir and Cockerhan (1984) and Nei (1987)
fstat3dat<-genind2hierfstat(fst3dat)
basicss3 <- basic.stats(fst3dat)
basicssind3 <- summary(fst3dat)
datfst3 <- pairwise.neifst(fstat3dat)
datfstWC3 <- pairwise.WCfst(fstat3dat)

##Plotting the fst matrix (two methods)

png(filename="fst3vp.png", width=1080, height=720)
par(mfrow=c(1,2))

corrplot(datfst3,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstNei3")
corrplot(datfstWC3,is.corr=FALSE,method="color",type="full",col=rev(terrain.colors(100)),diag=FALSE, title = "FstWC3")
dev.off()
