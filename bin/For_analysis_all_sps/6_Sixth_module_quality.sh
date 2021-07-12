#!/bin/bash

####Prerequisites for this module, software samtools, available on http://www.htslib.org/
##Or use the next command line
#sudo apt update
#sudo apt install samtools

###To check the quality of alignment and mapping sequences

###In order not to create wrong directories, we will first create the directories of the quality reports process

#Make a directory for quality reports
mkdir ../Process/data/wgrep

#Make a directory for each archive to index quality report process
for dirq in `ls ../Process/data/wgroups | grep -oE "\w*" | uniq`; do
mkdir ../Process/data/wgrep/${dirq}
done
##Verify the existence of the directories

#Make an index on samtools
samtools faidx ../Process/data/wgen/"wrefgen.fa" --output ../Process/data/wrefgen.fa

#Index sample by sample
samtools index ../Process/data/wgroups/"***stg.bam"

#A loop to index all samples
for wind in `ls ../Process/data/wgroups | grep -oE "\w*" | uniq`; do
samtools index ../Process/data/wgroups/${wind}.bam
done

#For a quality report with qualimap sample by sample
qualimap_v2.2.1/qualimap bamqc -bam ../Process/data/wgroups/"***.bam" -nw 400 -hm 3 -outdir ../Process/data/wgrep

#Loop for all samples
for wrep in `ls ../Process/data/wgroups | grep -oE "\w*" | uniq`; do
qualimap_v2.2.1/qualimap bamqc -bam ../Process/data/wgroups/${wrep}.bam -nw 400 -hm 3 -outdir ../Process/data/wgrep/${wrep}
done
