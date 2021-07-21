#!/bin/bash

##Prerequisites to make networks, vcf2phylip v.2.6

##To transform archives with the extension "".vcf" in NEXUS format.
python vcf2phylip.py -i ../Process/data/filtered/filtered_third/"third.recode.vcf" --output-folder ../Process/data/filtered/filtered_third --output-prefix third -n

##The files can be manipulated in SplitsTree
