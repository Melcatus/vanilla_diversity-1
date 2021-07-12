#!/bin/bash

##Prerequisites on this module, software BWA Burrows-Wheeler Aligner ver.0.7.17 (available on https://sourceforge.net/projects/bio-bwa/files/)  or use the next command on console (on Linux)

# sudo apt update
# sudo apt install bwa

##To create a directory for the sequences of the genome reference of Vanilla (chloroplast genome) and index
##Genome available on https://www.ncbi.nlm.nih.gov/nuccore/MN200375.1?report=graph. Necesary on format fasta, download the visible range
mkdir ../Process/data/MN200375

##Create the directory with the genome reference (in format fasta)
##Opcional use flag -a is/bwtsw to inditcate the length in sequences (short or long respectively)
bwa index ../Process/data/MN200375/"MN200375.fa" ../Process/data/MN200375/MN200375

##Create a directory for the alignment sequences
mkdir ../Process/data/vanilla_aln

#####To use the package bwa-mem in just one sample
bwa mem -t 4 -p ../Process/data/MN200375/MN200375.fa ../Process/data/data_clean/***_trimmed.fq.gz > ~/Escritorio/Process/data/vanilla_aln/name_archive.sam

#####To use a loop to all samples in one comand
##Create a new directory
mkdir ../Process/data/data_trimmed

##Move data trimmed (ended with *.fq.gz) to the new directory
cd ../Process/data/data_clean
cp *.fq.gz ../Process/data/data_trimmed

##Built a loop for data trimmed to alignment in one comand

for alignment in `ls ../Process/data/data_trimmed/|grep -oE "\w*"| uniq`; do
bwa mem -t 4 -p ../Process/data/MN200375/MN200375.fa ../Process/data/data_trimmed/${alignment}.fq.gz > ../Process/data/vanilla_aln/${alignment}.sam;
done
