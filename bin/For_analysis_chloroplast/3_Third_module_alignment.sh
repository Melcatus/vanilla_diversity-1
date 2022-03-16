#!/bin/bash

##Prerequisites on this module, software BWA Burrows-Wheeler Aligner ver.0.7.17
## This script is in ./bin and data are in ../vanilla/data/trimmed
## Reference genome downloaded from NCBI: NC_026778.1 

##To create a directory for the sequences of the genome reference of Vanilla (chloroplast genome) and index
mkdir ../vanilla/data/reference

##Create the directory with the genome reference (in format fasta)
bwa index ../vanilla/data/reference/chloroplast_vp.fasta

##Create a directory for the alignment sequences
mkdir ../vanilla/data/map

### Mapping samples against the genome reference
for R in `ls ../vanilla/data/trimmed/ | grep -oE "\w*.fq.gz" | uniq`;
do bwa mem -t 10 -M ../vanilla/data/reference/chloroplast_vp.fasta ../vanilla/data/trimmed/${R} > ../vanilla/data/map/${R}.sam;
done
