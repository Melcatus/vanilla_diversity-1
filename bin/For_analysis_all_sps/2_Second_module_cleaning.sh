#!bin/bash

##Prerequisites to this module, TrimGalore ver.0.0.6 (available on https://github.com/FelixKrueger/TrimGalore)
##Make a directory for clean data
mkdir ../Process/data/clean_data

##To clean demultiplexed data with TrimGalore_0.6.6 in general aspects, as illumina adapter, cut first and end bases, length, and quality

TrimGalore-0.6.6/trim_galore --illumina -length 84 --clip_R1 5 --stringency 5 -q 34 --three_prime_clip_R1 2 --fastqc ../Process/data/demultiplex/*.fq.gz -o ../Process/data/data_clean

##Move archives .fq.gz to a new directory
mkdir ../Process/data/data_trimmed
cd ../Process/data/data_clean
mv *fq.gz ../Process/data/data_trimmed
