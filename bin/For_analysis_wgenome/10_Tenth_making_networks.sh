#!/bin/bash

##Prerequisites. vcf2phylip v.2.6

##To make a file for phylogenetic network in SplitsTree

##To transform archives with extension .vcf to archives NEXUS format. Program vcf2phylip
python vcf2phylip.py -i ../Process/data/filtered/filtered_first/"first.recode.vcf" --output-folder ../Process/data/filtered/filtered_first --output-prefix first -n

##The files can be manipulated in SplitsTree
