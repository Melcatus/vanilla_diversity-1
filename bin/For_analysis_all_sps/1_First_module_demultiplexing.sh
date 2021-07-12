#!bin/bash

##The data raw is on the directory called "raw"
##Prerequisites to this module. Stacks ver.2.55 or superior (available on http://creskolab.uoregon.edu/stacks/)
##Whole analisis is on a master directory called "Process"
#!bin/bash
##Create a output directory for demultiplex data
mkdir ../Process/data/demultiplex

##To demultiplex data
##Barcodes text is in directory called "data", file .txt
stacks process_radtags -p ../Process/data/raw -o ../Process/data/demultiplex -b ../Process/data/GBS-PstI-1-96_barcodes.txt -e pstI --renz_1 pstI -r -c -q --inline_null -s 20 --filter_illumina --adapter_1  AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT
