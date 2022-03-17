##For this module, we will do plots for the Admixture analysis, and check the
##population structure for V. planifolia wild and cultivated.

setwd("../Process/data/popstr/popscn")

#Install and open the next libraries -> vcfR, adegenet, hierfstat, ggplot2, reshape2, gridExtra
install.packages("vcfR")
install.packages("adegenet")
install.packages("hierfstat")
install.packages("ggplot2")
install.packages("reshape2")
install.packages("gridExtra")
install.packages("patchwork")
install.packages("ggthemes")
install.packages("tidyverse")
library(vcfR)
library(adegenet)
library(hierfstat)
library(ggplot2)
library(tidyverse)
library(reshape2)
library(gridExtra)
library(patchwork)
library(ggthemes)

##We need do a new data frame with the code samples and population to each belongs to
##On the previous module, we copied the files "pmap_nod.txt", "code_nodup.txt" and "pest_nd.txt"
##From the "filtered" directory, we will use the "pop" column from the "pmap_nod.txt", "pest_nd.txt"
##And the "code" column from the "code_nodup.txt"

datpopl <- read.table("pmap_nod.txt", header = T)
datindl <- read.table("code_nodup.txt", header = T)
datregl <- read.table("pest_nd.txt", header = T)
popindl <- data.frame(datindl$code, datpopl$pop, datregl$pop)

##Building the new data frame for the poblational structure (From Admixture haha)
K8l <- read.table("scndl2.8.Q")
K8l$ind <- popindl$datindl.code
K8l$pop <- popindl$datpopl.pop
K8l$reg <- popindl$datregl.pop
K8fl <- melt(K8l)

reglplot <- ggplot(K8fl, aes(factor(ind), value, fill = factor(variable)))+geom_bar(stat="identity")+facet_grid(~fct_inorder(reg), scales = "free", switch = "x", space = "free")+theme_minimal()+theme(axis.text.x=element_text(size=8,angle=45,hjust=1),axis.text.y=element_text(size=10),legend.position="none",axis.title.x=element_blank(),axis.title.y=element_text(size=11),strip.text.x=element_text(size=11))

poplplot <- ggplot(K8fl, aes(factor(ind), value, fill = factor(variable)))+geom_bar(stat="identity")+facet_grid(~fct_inorder(pop), scales = "free", switch = "x", space = "free")+theme_minimal()+theme(axis.text.x=element_text(size=8,angle=45,hjust=1),axis.text.y=element_text(size=10),legend.position="none",axis.title.x=element_blank(),axis.title.y=element_text(size=11),strip.text.x=element_text(size=1))

png(filename="struc2vp.png", width=1080, height=720)

reglplot + poplplot + plot_layout(ncol=1)






