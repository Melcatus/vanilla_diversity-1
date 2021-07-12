#!/bin/bash

####For analysis population in the last output files with stacks
##Prerequisites, Stacks populations module
##Make a module for output
mkdir ../Process/data/popf
mkdir ../Process/data/popf/fourth_an

##To do analysis on the last output of gstacks (seventh module)
##The outputs on this analysis was determined for software 'STRUCTURE', 'GENEPOP', 'Phylip' and 'VCFtools'
stacks populations -P ../Process/data/gwens/fourth_an -O ../Process/data/popf/fourth_an -M ../Process/data/"pmallsp.tsv" --min-samples-per-pop 0.01 --min-samples-overall 0.01 --min-population 1 --hwe --fstats --ordered-export --fasta-loci --fasta-samples --vcf --phylip --structure
