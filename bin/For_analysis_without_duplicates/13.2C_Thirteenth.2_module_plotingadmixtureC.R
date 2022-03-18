##For this module, we will do plots for the Admixture analysis, and check the
##population structure for V. planifolia wild and cultivated.

setwd("../Process/data/popstr/popscn/culti")

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
##On the previous module, we copied the files "pmap_nod.txtC", "code_nodup.txtC" and "pest_ndC.txt"
##From the "filtered" directory, we will use the "pop" column from the "pmap_nodC.txt", "pest_nd.txt"
##And the "code" column from the "code_nodupC.txt". Each popmap contains only samples described as cultivated

datpopc <- read.table("pmap_nodC.txt", header = T)
datindc <- read.table("code_nodupC.txt", header = T)
datregc <- read.table("pest_ndC.txt", header = T)
popindc <- data.frame(datindc$code, datpopc$pop, datregc$pop)

##Building the new data frame for the poblational structure (From Admixture haha)
K8c <- read.table("cultian2.8.Q")
K8c$ind <- popindc$datindc.code
K8c$pop <- popindc$datpopc.pop
K8c$reg <- popindc$datregc.pop
K8fc <- melt(K8c)

regcplot <- ggplot(K8fc, aes(factor(ind), value, fill = factor(variable)))+geom_bar(stat="identity")+facet_grid(~fct_inorder(reg), scales = "free", switch = "x", space = "free")+theme_minimal()+theme(axis.text.x=element_text(size=8,angle=45,hjust=1),axis.text.y=element_text(size=10),legend.position="none",axis.title.x=element_blank(),axis.title.y=element_text(size=11),strip.text.x=element_text(size=11))

popcplot <- ggplot(K8fc, aes(factor(ind), value, fill = factor(variable)))+geom_bar(stat="identity")+facet_grid(~fct_inorder(pop), scales = "free", switch = "x", space = "free")+theme_minimal()+theme(axis.text.x=element_text(size=8,angle=45,hjust=1),axis.text.y=element_text(size=10),legend.position="none",axis.title.x=element_blank(),axis.title.y=element_text(size=11),strip.text.x=element_text(size=11))

png(filename="struc5vp.png", width=1080, height=720)

regcplot + popcplot + plot_layout(ncol=1)


##Same analysis but strict

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
##On the previous module, we copied the files "pmap_nod.txtC", "code_nodup.txtC" and "pest_ndC.txt"
##From the "filtered" directory, we will use the "pop" column from the "pmap_nodC.txt", "pest_nd.txt"
##And the "code" column from the "code_nodupC.txt". Each popmap contains only samples described as cultivated

datpopcs <- read.table("pmap_nodC.txt", header = T)
datindcs <- read.table("code_nodupC.txt", header = T)
datregcs <- read.table("pest_ndC.txt", header = T)
popindcs <- data.frame(datindcs$code, datpopcs$pop, datregcs$pop)

##Building the new data frame for the poblational structure (From Admixture haha)
K10cs <- read.table("cultians2.10.Q")
K10cs$ind <- popindcs$datindcs.code
K10cs$pop <- popindcs$datpopcs.pop
K10cs$reg <- popindcs$datregcs.pop
K10fcs <- melt(K10cs)

regcsplot <- ggplot(K10fcs, aes(factor(ind), value, fill = factor(variable)))+geom_bar(stat="identity")+facet_grid(~fct_inorder(reg), scales = "free", switch = "x", space = "free")+theme_minimal()+theme(axis.text.x=element_text(size=8,angle=45,hjust=1),axis.text.y=element_text(size=10),legend.position="none",axis.title.x=element_blank(),axis.title.y=element_text(size=11),strip.text.x=element_text(size=11))

popcsplot <- ggplot(K10fcs, aes(factor(ind), value, fill = factor(variable)))+geom_bar(stat="identity")+facet_grid(~fct_inorder(pop), scales = "free", switch = "x", space = "free")+theme_minimal()+theme(axis.text.x=element_text(size=8,angle=45,hjust=1),axis.text.y=element_text(size=10),legend.position="none",axis.title.x=element_blank(),axis.title.y=element_text(size=11),strip.text.x=element_text(size=11))

png(filename="struc7vp.png", width=1080, height=720)

regcsplot + popcsplot + plot_layout(ncol=1)





