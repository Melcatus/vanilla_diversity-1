#!bin/bash

##First, we need create a new directory for the new analysis.

mkdir ../Process/data/popstr; mkdir ../Process/data/popstr/popscn

##To transform our vcf file into bed file (.bed). Software "plink2" installed on linux environment.

plink2 --vcf ../Process/data/filtered/filtered_second/secondlack.recode.vcf --maf 0.1 --recode vcf --allow-extra-chr --out ../Process/data/popstr/popscn/scndl
plink2 --vcf ../Process/data/filtered/filtered_second/secondlack.recode.vcf --maf 0.1 --make-bed --allow-extra-chr --out ../Process/data/popstr/popscn/scndl2

##To test the most sensibility "K" for the admixture analysis
for adxsc in 1 2 3 4 5 6 7 8 9 10; do ../dist/admixture_linux-1.3.0/admixture32  --cv=10 ../Process/data/popstr/popscn/scndl2.bed  $adxsc | tee log${adxsc}.out; done

##The most sensibility "K" for this analysis is K=8
##Move archives to the directory ../popscn
##We need analize the output files ".log" to see the most sensibility "K". So, we will extract the CV values from the log files, and compare the lowest value.
##That will the mos sensibility "K" for the analysis

grep -h "CV" ../Process/data/popstr/popscn/log* | sed 's/:/\ \t/' > ../Process/data/popstr/popscn/CVl_values

##For the next step, we need copy the files with the samples code, and the population to which each sample belongs
##In this case, the files are "code_nodup.txt" and "pmap_nod.txt", and with they we will make a data frame on R.
