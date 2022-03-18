#!/bin/bash

####For analysis population in the last output files with stacks
##Prerequisites, Stacks populations module
##Make a module for output
mkdir ../Process/data/popf
mkdir ../Process/data/popf/second_an
mkdir ../Process/data/popf/second_an/wild

##To do analysis on the last output of gstacks (seventh module)
##The outputs on this analysis was determined for software 'STRUCTURE', 'GENEPOP', 'Phylip' and 'VCFtools'. The popmap contains only samples described as wild
stacks populations -P ../Process/data/gwens/second_an/wild -O ../Process/data/popf/second_an/wild -M ../Process/data/"pmap_nodW.tsv" --min-samples-per-pop 0.01 --min-samples-overall 0.01 --min-population 1 --hwe --fstats --ordered-export --fasta-loci --fasta-samples --vcf
