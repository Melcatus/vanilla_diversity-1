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
library(vcfR)
library(adegenet)
library(hierfstat)
library(ggplot2)
library(reshape2)
library(gridExtra)

##We need do a new data frame with the code samples and population to each belongs to
##On the previous module, we copied the files "pmap_nod.txt", "code_nodup.txt" and "pest_nd.txt"
##From the "filtered" directory, we will use the "pop" column from the "pmap_nod.txt", "pest_nd.txt"
##And the "code" column from the "code_nodup.txt"

datpop <- read.table("pmap_nod.txt", header = T)
datind <- read.table("code_nodup.txt", header = T)
datreg <- read.table("pest_nd.txt", header = T)
popind <- data.frame(datind$code, datpop$pop, datreg$pop)

##Building the new data frame for the poblational structure (From Admixture haha)
K8 <- read.table("scnd2.8.Q")
K8$ind <- popind$datind.code
K8$pop <- popind$datpop.pop
K8$reg <- popind$datreg.pop
K8f <- melt(K8)

ggplot(data=K8f,aes(x=ind,y=value,fill=variable))+geom_bar(stat="identity")






