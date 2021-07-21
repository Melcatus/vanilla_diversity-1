#!/bin/bash

##Prerequisites, vcf2phylip v.2.6

##To make a file for phylogenetic network (program SplitsTree)

##To transform archives (extension .vcf) to archives NEXUS format. 
python vcf2phylip.py -i ../Process/data/filtered/filtered_second/"second.recode.vcf" --output-folder ../Process/data/filtered/filtered_second --output-prefix second -n

##The files can be manipulated in SplitsTree
