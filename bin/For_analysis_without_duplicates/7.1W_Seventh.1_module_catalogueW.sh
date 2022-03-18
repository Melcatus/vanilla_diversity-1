#!/bin/bash

##Prerequisites, stacks ver.2.55 or superior.
##To generate loci and identify SNP's

##Make a directory for output archives
mkdir ../Process/data/gwens
mkdir ../Process/data/gwens/second_an
mkdir ../Process/data/gwens/second_an/wild

##Identify the samples to generate a directory with the samples of contain just V. planifolia. The file with the information is in "1_Calidad_secuencias.xlsx"
##Move or copy the archives to the new directory (pop_origin/wild), this process need to do sample by sample (total = 43 archives)
mkdir ../Process/data/pop_origin
mkdir ../Process/data/pop_origin/wild

##Create a population map, identifying each sample as wild. To do this map, write in a text file (on editor text) <name_sample><tab><population>
##save as a -.tsv file. More information on https://catchenlab.life.illinois.edu/stacks/manual/#popmap

##To generate loci and identify SNP's
stacks gstacks -I ../Process/data/pop_origin/wild -O ../Process/data/gwens/second_an/wild -M ../Process/data/"pmap_nodW.tsv"
