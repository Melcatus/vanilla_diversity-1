#!/bin/bash

####For analysis population in the last output files with stacks
##Prerequisites, Stacks populations module
##Make a module for output
mkdir ../Process/data/popf
mkdir ../Process/data/popf/first_an

##To do analysis on the last output of gstacks (sixth module)
##The outputs on this analysis was determined for software 'STRUCTURE', 'GENEPOP', 'Phylip' and 'VCFtools'
stacks populations -P ../Process/data/gwens/first_an -O ../Process/data/popf/first_an -M ../Process/data/"popmap_orig.tsv" --min-samples-per-pop 0.01 --min-samples-overall 0.01 --min-population 1 --hwe --fstats --ordered-export --fasta-loci --fasta-samples --vcf --phylip --structure
