# Analysis of the diversity of *Vanilla sp* (Orchidaceae)



[TOC]

#### Description

The present repository contains a way to process and analyze data GBS, in order to identify the genetic diversity of individuals wild and cultivated in species of *Vanilla sp* genre. The GBS data was demultiplexed (Stacks) and aligned in front a reference genome given the nature of data. Later, the data was newly filtered (Stacks, VCFtools and R) to find Single Nucleotide Polymorphism (SNP) data in order to use to identify diversity among populations (*V. planifolia* wild and cultivated, *V. planifolia* between states of Mexico, and among species)

#### General work flow diagram 

![workflow](/home/adrian/Escritorio/Process/mygit/vanilla_diversity/workflow.jpg)

[^Fig. 1. ]: Workflow for different analysis

#### Prerequisites

**Software**

- [Stacks v.2.55](https://catchenlab.life.illinois.edu/stacks/) or superior
- [Trim Galore v.0.6.4](https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md) 
- [BWA (Burrows-Wheeler Aligner v.0.7.17)](http://bio-bwa.sourceforge.net/)
- [PicardTools v1.13](https://broadinstitute.github.io/picard/)
- [SamTools v1.10](http://www.htslib.org/)
- [Qualimap v2.2.1](http://qualimap.conesalab.org/)
- [VCFTools v 0.1.16](http://vcftools.sourceforge.net/)
- [R v 4.1.0 Camp Pontanezen](https://www.r-project.org/) y [Rstudio](https://www.rstudio.com/)

**R packages**

- SNPRelate (available from [Bioconductor project](https://www.bioconductor.org/packages/release/bioc/html/SNPRelate.html))
- Tidyverse
  - ggplot2

**PC info used in this proyect** 

- Distro: Linux Mint 20.1 Cinnamon v. 4.8.6
- Motherboard: Acer IPISB-AG
- Processor: Intel© Core™ i3-3240 CPU @ 3.40GHz × 2
- RAM: 8gb DDR3

#### Directories

**bin** 

Contains

- For_analysis_chloroplast:

  1_First_module_demultiplexing: Script for demultiplex data with software Stacks, the script contains sequence adapter.

  2_Second_module_cleaning: Script for clean and trimming data with software TrimGalore

  3_Third_module_alignment: To align data with reference genome using software BWA (chloroplast reference genome)

  4_Fourth_module_sort: Transform data from SAM to BAM with SAMTools, sort (way coordinate) and add read groups to the reads with PicardTools

  5_Fifth_module_quality: To obtain alignment reports quality with Qualimap

- For_analysis_wgenome

  1_First_module_demultiplexing: Script for demultiplex data with software Stacks, the script contains sequence adapter.

  2_Second_module_cleaning: Script for clean and trimming data with software TrimGalore

  3_Third_module_alignment: To align data with reference genome using software BWA (vanilla whole reference genome) with duplicates. Eliminate samples that are not *V. planifolia* 

  4_Fourth_module_sort: Transform data from SAM to BAM with SAMTools, sort (coordinate) and add read groups with PicardTools

  5_Fifth_module_quality: Alignment quality reports with Qualimap

  6_Sixth_module_catalogue: Return Stacks to build a loci catalogue with gstacks

  7_Seventh_module_populations: With the help of a population map, it generates files for population analysis in different programs, using the program populations from the software Stacks (used for VCFTools, STRUCTURE and Phylip software for subsequent analyzes) 

  8_Eight_module_call_variants: Separate variants to discriminate final loci catalogue (SNP's)

  9_Nineth_module_PCA.R: Principal Component Analysis to the final loci catalogue to identify graphically populations

- For_analysis_without_duplicates

  1_First_module_demultiplexing: Script for demultiplex data with software Stacks, the script contains sequence adapter.

  2_Second_module_cleaning: Script for clean and trimming data with software TrimGalore

  3_Third_module_concatenate: A way to concatenate duplicated samples and put in the correct directory, to have greater coberture. Eliminate samples that are not *V. planifolia* 

  4_Fourth_module_alignment: To align data with reference genome using software BWA (vanilla whole reference genome)

  5_Fifth_module_sort: Transform data from SAM to BAM with SAMTools, sort (way coordinate) and add read groups to the reads with PicardTools

  6_Sixth_module_quality: To obtain alignment reports quality with Qualimap

  7_Seventh_module_catalogue: In software Stacks, build a loci catalogue with program gstacks and a map population  (available on directory "meta")

  8_Eighth_module_populations: Use the population map and the program populations on Stacks, it generates files for population analysis (used for VCFTools, STRUCTURE and Phylip programs for subsequent analyzes)

  9_Nineth_module_call_variants: Separate variants on VCFTools to discriminate final loci catalogue (catalogue of SNP's)

  10_Tenth_module_SPCA.R: Principal Component Analysis to the final loci catalogue to identify graphically populations

- For_analysis_each_state

  1_First_module_demultiplexing: Script for demultiplex data with software Stacks, the script contains sequence adapter.

  2_Second_module_cleaning: Clean and trimming data with TrimGalore

  3_Third_module_concatenate: Concatenate duplicated samples and put in the correct directory, in order to have greater coberture than with duplicates. Eliminate samples that are not *V. planifolia* 

  4_Fourth_module_alignment: Align data with reference genome using program BWA (vanilla whole reference genome)

  5_Fifth_module_sort: Transform data from SAM to BAM (SAMTools), sort (way coordinate) and add read groups with PicardTools

  6_Sixth_module_quality: Generate alignment reports quality with Qualimap

  7_Seventh_module_catalogue: Stacks, build a loci catalogue with gstacks, using a map population (available on directory "meta")

  8_Eighth_module_populations: Use the population map and module populations on the program Stacks, it generates files for population analysis (used for VCFTools, STRUCTURE and Phylip programs for subsequent analyzes)

  9_Nineth_module_call_variants: Separate variants on VCFTools, obtain SNP catalogue

  10_Tenth_module_TPCA.R: Principal Component Analysis SNP catalogue, to identify graphically populations

- For_analysis_all_sps

  1_First_module_demultiplexing: Script for demultiplex data with software Stacks, the script contains sequence adapter.

  2_Second_module_cleaning: Cleaning and trimming data with TrimGalore

  3_Third_module_concatenate: Concatenate duplicated samples and put in the correct directory, in order to have greater coberture than with duplicates. In this case, use all the samples (without duplicates, but all the samples)

  4_Fourth_module_alignment: Align all samples in front reference genome using BWA (vanilla whole reference genome)

  5_Fifth_module_sort: Transform data from SAM to BAM (SAMTools), sort (coordinate) and add read groups (PicardTools)

  6_Sixth_module_quality: Generate alignment reports quality with Qualimap

  7_Seventh_module_catalogue: On gstacks (from Stacks) build a loci catalogue using a map population (available on directory "meta")

  8_Eighth_module_populations: With population map and populations (from Stacks), it generates files for population analysis (used for VCFTools, STRUCTURE and Phylip programs for subsequent analyzes)

  9_Nineth_module_call_variants: Separate variants on software VCFTools, obtain SNP catalogue

  10_Tenth_module_FPCA.R: Principal Component Analysis SNP catalogue, to identify graphically populations

**data** 

- README_gen.md: Contains the links to the reference genome (chloroplast and whole genome)

**meta** 

- pest_nd.tsv: Population map to the analysis for states (just *V. planifolia*)
- pest_nd.txt: Population map to the PCA for states but in R (just *V. planifolia*)
- pmallsp.tsv: Population map to the analysis for all species (without duplicates)
- pmallsp.txt: Population map to the PCA for all species but in R (without duplicates)
- pmap_nod.tsv: Population map to the analysis without duplicates (just for *V. planifolia*)
- pmap_nod.tsv: Population map to the PCA without duplicates but in R (just for *V. planifolia*) 
- popmap_orig.tsv: Population map to the analysis with duplicates (just *V. planifolia*)
- popmap_orig.txt: Population map to the PCA with duplicates (just *V. planifolia*)

#### Note

During the process, is necessary empty some directories (manly in analysis with the whole reference genome), generally the directories that are need to be emptied is "pop_origin, wgen, wgen_aln, wgenbam wgrep, wgroups, wgsort" but is better read carefully each script to identify common directories that the process is using and sharing in each analysis.

Futhermore, all analysis take place in one "master directory" called ´Process´, which contains all directories during the analysis.

#### Credits





*Adrián Gutiérrez* 
