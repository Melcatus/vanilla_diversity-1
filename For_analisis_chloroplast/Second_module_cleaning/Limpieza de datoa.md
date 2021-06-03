Limpieza de datos

Cada archivo demultiplexeado arrojó 4 archivos en total que fueron almacenados en la carpeta de data_cleaning

Un reporte general que contiene lo realizado en cada archivo incluye lo siguiente

> SUMMARISING RUN PARAMETERS
> ==========================
> Input filename: /home/adrian/Escritorio/Process/data/demultiplex/A01.fq.gz
> Trimming mode: single-end
> Trim Galore version: 0.6.6
> Cutadapt version: 2.8
> Number of cores used for trimming: 1
> Quality Phred score cutoff: 20
> Quality encoding type selected: ASCII+33
> Adapter sequence: 'AGATCGGAAGAGC' (Illumina TruSeq, Sanger iPCR; user defined)
> Maximum trimming error rate: 0.1 (default)
> Minimum required adapter overlap (stringency): 1 bp
> Minimum required sequence length before a sequence gets removed: 20 bp
> Running FastQC on the data once trimming has completed
> Output file will be GZIP compressed
>
>
> This is cutadapt 2.8 with Python 3.8.5
> Command line parameters: -j 1 -e 0.1 -q 20 -O 1 -a AGATCGGAAGAGC /home/adrian/Escritorio/Process/data/demultiplex/A01.fq.gz
> Processing reads on 1 core in single-end mode ...
> Finished in 56.70 s (14 us/read; 4.39 M reads/minute).
>
> === Summary ===
>
> Total reads processed:               4,149,747
> Reads with adapters:                 2,146,169 (51.7%)
> Reads written (passing filters):     4,149,747 (100.0%)
>
> Total basepairs processed:   377,626,977 bp
> Quality-trimmed:                 122,967 bp (0.0%)
> Total written (filtered):    356,518,012 bp (94.4%)
>
> === Adapter 1 ===
>
> Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 2146169 times; Reverse-complemented: 0 times
>
> No. of allowed errors:
> 0-9 bp: 0; 10-13 bp: 1
>
> Bases preceding removed adapters:
>   A: 18.2%
>   C: 13.0%
>   G: 60.3%
>   T: 8.4%
>   none/other: 0.0%
>
> Overview of removed sequences
> length	count	expect	max.err	error counts
> 1	846424	1037436.8	0	846424
> 2	209881	259359.2	0	209881
> 3	94523	64839.8	0	94523
> 4	41597	16209.9	0	41597
> 5	47625	4052.5	0	47625
> 6	32351	1013.1	0	32351
> 7	42179	253.3	0	42179
> 8	44893	63.3	0	44893
> 9	22589	15.8	0	22085 504
> 10	22135	4.0	1	21082 1053
> 11	43119	1.0	1	40984 2135
> 12	27595	0.2	1	26227 1368
> 13	37349	0.1	1	35224 2125
> 14	58046	0.1	1	54851 3195
> 15	28906	0.1	1	27249 1657
> 16	25437	0.1	1	24044 1393
> 17	25134	0.1	1	23740 1394
> 18	51445	0.1	1	48629 2816
> 19	33071	0.1	1	31155 1916
> 20	31879	0.1	1	30215 1664
> 21	16679	0.1	1	15743 936
> 22	38183	0.1	1	36067 2116
> 23	26082	0.1	1	24646 1436
> 24	11763	0.1	1	11085 678
> 25	15376	0.1	1	14567 809
> 26	29254	0.1	1	27683 1571
> 27	23375	0.1	1	22054 1321
> 28	18073	0.1	1	17093 980
> 29	10878	0.1	1	10327 551
> 30	15364	0.1	1	14515 849
> 31	15661	0.1	1	14818 843
> 32	14706	0.1	1	13919 787
> 33	9194	0.1	1	8665 529
> 34	12863	0.1	1	12143 720
> 35	11537	0.1	1	10919 618
> 36	11909	0.1	1	11286 623
> 37	5987	0.1	1	5681 306
> 38	9191	0.1	1	8671 520
> 39	6665	0.1	1	6270 395
> 40	6146	0.1	1	5800 346
> 41	6022	0.1	1	5656 366
> 42	4147	0.1	1	3921 226
> 43	7728	0.1	1	7276 452
> 44	6032	0.1	1	5700 332
> 45	3823	0.1	1	3590 233
> 46	4479	0.1	1	4240 239
> 47	3101	0.1	1	2930 171
> 48	3185	0.1	1	2999 186
> 49	4417	0.1	1	4183 234
> 50	4609	0.1	1	4331 278
> 51	2460	0.1	1	2312 148
> 52	4041	0.1	1	3829 212
> 53	1890	0.1	1	1776 114
> 54	1933	0.1	1	1822 111
> 55	2686	0.1	1	2527 159
> 56	2336	0.1	1	2198 138
> 57	1779	0.1	1	1685 94
> 58	1374	0.1	1	1281 93
> 59	1316	0.1	1	1237 79
> 60	1041	0.1	1	961 80
> 61	944	0.1	1	893 51
> 62	565	0.1	1	539 26
> 63	410	0.1	1	377 33
> 64	205	0.1	1	194 11
> 65	149	0.1	1	140 9
> 66	95	0.1	1	89 6
> 67	17	0.1	1	13 4
> 68	20	0.1	1	20
> 70	3	0.1	1	0 3
> 74	2	0.1	1	0 2
> 77	41	0.1	1	0 41
> 82	1	0.1	1	0 1
> 83	2	0.1	1	0 2
> 86	1	0.1	1	0 1
> 88	251	0.1	1	0 251
>
> RUN STATISTICS FOR INPUT FILE: /home/adrian/Escritorio/Process/data/demultiplex/A01.fq.gz
> =============================================
> 4149747 sequences processed in total
> Sequences removed because they became shorter than the length cutoff of 20 bp:	298 (0.0%)

Este reporte es referencia del archivo de A01 de los emitidos por TrimGalore