!#/bin/bash

#####Prerequisites: install Picard-tools and samtools
## This script is in ./bin and data are ../vanilla/data/map
## To sort sequences on Picard-tools


#### Convert sam  files to bam format
for R in `ls ../vanilla/data/map | grep -oE "\w*.fq.gz" | uniq`;
do java -jar -Xmx60000M ../picard.jar SamFormatConverter I=../vanilla/data/map/${R}.sam O=../vanilla/data/map/${R}.bam;
done

# sorted
for R in `ls ../vanilla/data/map | grep -oE "\w*.fq.gz" | uniq`;
do java -jar -Xmx60000M ../picard.jar SortSam I=../vanilla/data/map/${R}.bam O=../vanilla/data/map/${R}sorted.bam SO=coordinate;
done

### Add group
for R in `ls ../vanilla/data/map | grep -oE "\w*.fq.gz" | uniq`;
do java -jar -Xmx60000M ../picard.jar AddOrReplaceReadGroups I=../vanilla/data/map/${R}sorted.bam O=../vanilla/data/map/${R}sortedRG.bam ID=sample LB=Paired-end PL=Illumina PU=Unknown SM=sample;
done

# Index samples
for R in `ls ../vanilla/data/map | grep -oE "\w*.fq.gz" | uniq`;
do samtools index ../vanilla/data/map/${R}sortedRG.bam;
done
