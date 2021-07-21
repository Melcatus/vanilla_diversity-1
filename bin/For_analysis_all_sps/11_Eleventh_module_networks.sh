#!/bin/bash

##Prerequisites for phylogenetic networks, vcf2phylip v.2.6

##To transform the files (extension .vcf) into NEXUS format.

python vcf2phylip.py -i ../Process/data/filtered/filtered_fourth/"fourth.recode.vcf" --output-folder ../Process/data/filtered/filtered_fourth --output-prefix fourth -n

##The files can be manipulated in SplitsTree
