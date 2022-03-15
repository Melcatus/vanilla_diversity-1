#!/bin/bash

## Prerequisites:samtools and NGSEP 3.3.0
## This script to find genomic variants

# The fai index 

samtools faidx  ../vanilla/data/reference/chloroplast_vp.fasta

## Find variants
for R in `ls ../vanilla/data/map | grep -oE "\w*.fq.gz" | uniq`;
do java -jar -Xms60000M -Xmx60000M ../NGSEPcore_3.3.0.jar FindVariants -maxAlnsPerStartPos 100 -csb -ploidy 1 -psp ../vanilla/data/reference/chloroplast_vp.fasta ../vanilla/data/map/${R}sortedRG.bam ../vanilla/data/map/${R}1 >& ../vanilla/data/map/${R}.log;
done
