---
title: "**KSU paired 16S & ITS: \n Down-selecting for generalist OTUs**"
subtitle: Generalist vs. Specialist framework to select OTUs for downstream
  co-occurrence network analyses (EDGE samples excluded). 
author: "Kelli Feeser"
date: '2023-08-22'
output:
  bookdown::html_document2:
    code_folding: hide
    df_print: kable
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 3
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    df_print: kable
    number_sections: yes
    css: styles.css
    toc: yes
    toc_depth: 3
  html_document: 
    code_folding: hide
    css: test.css
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 2
editor_options:
  chunk_output_type: inline
---

**FYI** - I use 'GvS' for 'generalist vs specialist'\
\

**Reference:** Hou 2019 doi: 10.1264/jsme2.ME18107\
\

**Overview**\
Habitat generalists and specialists were classified based on the occurrence of bacterial and archaeal OTUs (16S) and fungal OTUs (ITS) with permutation algorithms (1,000 permutations) using EcolUtils (v0.1 package, <https://github.com/GuillemSalazar/EcolUtils>).\
This approach generated 1,000 stimulated OTU tables using the quasiswap algorithm. The occurrence of OTUs was calculated based on 1,000 randomly generated OTU tables, and the observed occurrences for the true microbial communities were then compared to the 95% confidence interval derived from the means of randomly generated occurrences.\
Habitat generalist and specialist OTUs were identified with observed occurrences that were higher than the upper 95% confidence interval and lower than the lower 95% confidence interval, respectively.\

-   *Generalists*: highest 2.5% of occurrence:abundance distribution\
-   *Specialists*: lowest 2.5% of occurrence:abundance distribution\
-   *Non-significant (NS)*: the 95% in-between\

\

**Source code**\
spec.gen: <https://rdrr.io/github/GuillemSalazar/EcolUtils/man/spec.gen.html>\
\

**Other notes**\
-- niche.width.method = occurence or levins\
-- input: Community data, a matrix-like object (samples as rows; OTUs as columns).\
\

------------------------------------------------------------------------

# Set-up & data import -------------------------------------------------------



## install packages {.hidden .unlisted .unnumbered}



\

## load packages {.hidden .unlisted .unnumbered}


```r
library("ggplot2"); packageVersion("ggplot2") #‘3.4.4’
library("vegan"); packageVersion("vegan") # # ‘2.6.4’
library("phyloseq"); packageVersion("phyloseq") #‘1.44.0’
library("EcolUtils"); packageVersion("EcolUtils") #‘0.1’
# detach("package:metagMisc", unload = T)
library("spaa"); packageVersion("spaa") #‘0.2.2’
library("plyr"); packageVersion("plyr") #‘1.8.9’
library("dplyr"); packageVersion("dplyr") #‘1.1.3’
```

\

## 16S and ITS OTUs

Input data: rarefied 16S and ITS OTU tables, EDGE samples excluded. Data subset to samples where both 16S and ITS data were available. GvS run for i) all grass hosts combined, and ii-xi) the 5 grass hosts independently (subset OTU tables)

|             | Bacteria |    Fungi    |             |
|-------------|:--------:|:-----------:|:-----------:|
|             | *n OTUs* | *n samples* | *n samples* |
| All Grasses |  22,661  |    6,626    |     485     |
| ANGE        |  13,778  |    2,930    |     95      |
| BOER        |  8,224   |    1,662    |     78      |
| BOGR        |  9,671   |    2,415    |     75      |
| BUDA        |  10,954  |    2,343    |     79      |
| SCSC        |  17,022  |    4,322    |     157     |

: Numbers of bacterial and fungal OTUs and samples input into GvS

\
\

OTU tables were then pruned to a minimum OTU occurrence of 2 (i.e., singleton OTUs removed).

## read-in clean phyloseq obects {.hidden .unlisted .unnumbered}

### all grass hosts (all samples, excluding EDGE samples)



### *Blue grama* OTUs



### *Black grama* OTUs



### *Little Bluestem* OTUs


```r
BacArch_min2_noEDGE_SCSC_raw<-readRDS(file = "clean_rds_saves/BacArch_min2_rare9048_noEDGE_SCSC_v1.rds")
BacArch_min2_noEDGE_SCSC_raw
# should be
  # otu_table()   OTU Table:         [ 17568 taxa and 174 samples ]

Fun_min2_noEDGE_SCSC_raw<-readRDS(file = "clean_rds_saves/Fun_min2_rare10116_noEDGE_SCSC_v1.rds")
Fun_min2_noEDGE_SCSC_raw
# should be
  # otu_table()   OTU Table:         [ 4347 taxa and 161 samples ]

# subset to only the samples present in both datasets
bac_SCSC_names1<-((sample_data(BacArch_min2_noEDGE_SCSC_raw))$sample_name)
fun_SCSC_names1<-((sample_data(Fun_min2_noEDGE_SCSC_raw))$sample_name)

SCSC_common_names<-Reduce(intersect, list(bac_SCSC_names1,fun_SCSC_names1))

Bac_SCSC_shared<-subset_samples(BacArch_min2_noEDGE_SCSC_raw, sample_name %in% SCSC_common_names)
Bac_SCSC_shared <- prune_taxa(taxa_sums(Bac_SCSC_shared) > 0, Bac_SCSC_shared)
Bac_SCSC_shared
# should be
  # otu_table()   OTU Table:         [ 17022 taxa and 157 samples ]

Fun_SCSC_shared<-subset_samples(Fun_min2_noEDGE_SCSC_raw, sample_name %in% SCSC_common_names)
Fun_SCSC_shared <- prune_taxa(taxa_sums(Fun_SCSC_shared) > 0, Fun_SCSC_shared)
Fun_SCSC_shared
# should be
  # otu_table()   OTU Table:         [ 4322 taxa and 157 samples ]


# easier naming
bac_SCSC<-Bac_SCSC_shared
fun_SCSC<-Fun_SCSC_shared
```

### *Big Bluestem* OTUs


```r
BacArch_min2_noEDGE_ANGE_raw<-readRDS(file = "clean_rds_saves/BacArch_min2_rare9048_noEDGE_ANGE_v1.rds")
BacArch_min2_noEDGE_ANGE_raw
# should be
  # otu_table()   OTU Table:         [ 14268 taxa and 106 samples ]

Fun_min2_noEDGE_ANGE_raw<-readRDS(file = "clean_rds_saves/Fun_min2_rare10116_noEDGE_ANGE_v1.rds")
Fun_min2_noEDGE_ANGE_raw
# should be
  # otu_table()   OTU Table:         [ 2985 taxa and 98 samples ]

# subset to only the samples present in both datasets
bac_ANGE_names1<-((sample_data(BacArch_min2_noEDGE_ANGE_raw))$sample_name)
fun_ANGE_names1<-((sample_data(Fun_min2_noEDGE_ANGE_raw))$sample_name)

ANGE_common_names<-Reduce(intersect, list(bac_ANGE_names1,fun_ANGE_names1))

Bac_ANGE_shared<-subset_samples(BacArch_min2_noEDGE_ANGE_raw, sample_name %in% ANGE_common_names)
Bac_ANGE_shared <- prune_taxa(taxa_sums(Bac_ANGE_shared) > 0, Bac_ANGE_shared)
Bac_ANGE_shared
# should be
  # otu_table()   OTU Table:         [ 13778 taxa and 95 samples ]

Fun_ANGE_shared<-subset_samples(Fun_min2_noEDGE_ANGE_raw, sample_name %in% ANGE_common_names)
Fun_ANGE_shared <- prune_taxa(taxa_sums(Fun_ANGE_shared) > 0, Fun_ANGE_shared)
Fun_ANGE_shared
# should be
  # otu_table()   OTU Table:         [ 2930 taxa and 95 samples ]


# easier naming
bac_ANGE<-Bac_ANGE_shared
fun_ANGE<-Fun_ANGE_shared
```

### *Buffalograss* OTUs


```r
BacArch_min2_noEDGE_BUDA_raw<-readRDS(file = "../processed_data/clean_rds_saves/BacArch_min2_rare9048_noEDGE_BUDA_v1.rds")
BacArch_min2_noEDGE_BUDA_raw
# should be
  # otu_table()   OTU Table:         [ 11048 taxa and 83 samples ]

Fun_min2_noEDGE_BUDA_raw<-readRDS(file = "../processed_data/clean_rds_saves/Fun_min2_rare10116_noEDGE_BUDA_v1.rds")
Fun_min2_noEDGE_BUDA_raw
# should be
  # otu_table()   OTU Table:         [ 2369 taxa and 80 samples ]

# subset to only the samples present in both datasets
bac_BUDA_names1<-((sample_data(BacArch_min2_noEDGE_BUDA_raw))$sample_name)
fun_BUDA_names1<-((sample_data(Fun_min2_noEDGE_BUDA_raw))$sample_name)

BUDA_common_names<-Reduce(intersect, list(bac_BUDA_names1,fun_BUDA_names1))

Bac_BUDA_shared<-subset_samples(BacArch_min2_noEDGE_BUDA_raw, sample_name %in% BUDA_common_names)
Bac_BUDA_shared <- prune_taxa(taxa_sums(Bac_BUDA_shared) > 0, Bac_BUDA_shared)
Bac_BUDA_shared
# should be
  # otu_table()   OTU Table:         [ 10954 taxa and 79 samples ]

Fun_BUDA_shared<-subset_samples(Fun_min2_noEDGE_BUDA_raw, sample_name %in% BUDA_common_names)
Fun_BUDA_shared <- prune_taxa(taxa_sums(Fun_BUDA_shared) > 0, Fun_BUDA_shared)
Fun_BUDA_shared
# should be
  # otu_table()   OTU Table:         [ 2343 taxa and 79 samples ]

# easier naming
bac_BUDA<-Bac_BUDA_shared
fun_BUDA<-Fun_BUDA_shared
```

\

------------------------------------------------------------------------

\

# Run generalist vs specialist code {.tabset .tabset-pills}

R package: library("EcolUtils"); packageVersion("EcolUtils") #‘0.1’
\

`spec.gen(comm.tab,n=1000, perm.method="quasiswap", niche.width.method="occurrence", probs = c(0.025, 0.975))` \
\


|                      |                                                                                                                                                             |
|--------------|----------------------------------------------------------|
| `niche.width.method` | Niche width index (from `niche.width` in **spaa**): `levins` (default) or `shannon`. Or simply the `occurrence`: the number of samples where an OTU occurs. |
| `perm.method`        | Method for null model construction (from `permatswap` in **vegan**). Currently, only `quasiswap` (default) has been thoroughly tested.                      |
| `n`                  | Number of permutations.                                                                                                                                     |
| `probs`              | Probabilities for confidence interval calculations.                                                                                                         |


```r
# Extract abundance matrix from the phyloseq object
OTU1 = as(otu_table(phylo_obj), "matrix")
# transpose if necessary
if(taxa_are_rows(phylo_obj)){OTU1 <- t(OTU1)}
# Coerce to data.frame
OTUdf = as.data.frame(OTU1)
comm.tab<-OTUdf

com_min2 <- prune_taxa(taxa_sums(phylo_obj) > 1, phylo_obj)
comm.tabRA  = transform_sample_counts(com_min2, function(x) x / sum(x) )
OTU2 = as(otu_table(comm.tabRA), "matrix")
write.csv(OTU2, file="KSU_phylo_out/2_GvS_out/GvS_OTU_[].csv")

OTU3 = as(tax_table(comm.tabRA), "matrix")
write.csv(OTU3, file="KSU_phylo_out/2_GvS_out/GvS_Taxa_[].csv")

comm.tab<-comm.tab[,which(colSums(comm.tab)>1)]
res<-spec.gen(comm.tab,n=100, perm.method="quasiswap", niche.width.method="occurrence", probs = c(0.025, 0.975))
write.csv(res, file="KSU_phylo_out/2_GvS_out/GvS_res_[].csv")
```

\
\

## All Grasses {.tabset}

### 16S {.unnumbered}



Generalists: 2,145 OTUs\
Specialists: 5,140 OTUs\


### ITS {.unnumbered}



Generalists: 896 OTUs\
Specialists: 1,803 OTUs\

## BOGR (*B. gracilis* / Blue grama) {.tabset}

### 16S {.unnumbered}



Generalists: 788 OTUs\
Specialists: 1,113 OTUs\

### ITS {.unnumbered}



Generalists: 286 OTUs\
Specialists: 300 OTUs\

## BOER (*B. eriopoda* / Black grama) {.tabset}

### 16S {.unnumbered}



### ITS {.unnumbered}



\
\

## SCSC (*Schizachyrium scoparium* / Little bluestem) {.tabset}

### 16S {.unnumbered}



### ITS {.unnumbered}



\
\

## ANGE (*Andropogon gerardii* / Big bluestem) {.tabset}

### 16S {.unnumbered}



### ITS {.unnumbered}



\
\

## BUDA (*Bouteloua dactyloides* / Buffalograss) {.tabset}

### 16S {.unnumbered}



### ITS {.unnumbered}



\
\

# Download CSV files

## All Grasses

**Bacteria**

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_Res_16S_AllGrasses_nperm100.csv"  download>Click to download bacterial OTU classifications (all grasses)</a>

-   OTUs are rows (n=18016). If observed OTU occurrence \< confidence interval thresholds, then sign = "specialist'

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_OTU_16S_AllGrasses_relabund.csv"  download>Click to download bacterial OTU table (converted to relative abundance)</a>

-   OTUs are rows (n=18016), samples are columns (n=484)

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_Taxa_16S_AllGrasses.csv"  download>Click to download bacterial OTU taxonomy (GvS classification is 2nd column)</a>

-   OTUs are rows (n=18016)

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_sampledata_16S_AllGrasses.csv"  download>Click to download bacterial sample metadata</a>

-   samples are rows (n=484), metadata are columns (n=39)

-   Bacterial-fungal df joiner is col D `sample_name`
\

**Fungi**

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_Res_ITS_AllGrasses_nperm100.csv"  download>Click to download fungal OTU classifications (all grasses)</a>

-   OTUs are rows (n=5875). If observed OTU occurrence \< confidence interval thresholds, then sign = "specialist'

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_OTU_ITS_AllGrasses_relabund.csv"  download>Click to download fungal OTU table (converted to relative abundance)</a>

-   OTUs are rows (n=5875), samples are columns (n=484)

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_Taxa_ITS_AllGrasses.csv"  download>Click to download fungal OTU taxonomy (GvS classification is 2nd column)</a>

-   OTUs are rows (n=5875)

<a href="../processed_data/2_generalist_vs_specialist/GvS_AllGrasses/GvS_sampledata_ITS_AllGrasses.csv"  download>Click to download fungal sample metadata</a>

-   samples are rows (n=484), metadata are columns (n=39)

-   Bacterial-fungal df joiner is col D `sample_name` (note that this is essentially same as the bacterial sample data
\
\

## *Blue Grama*

**Bacteria**

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_Res_16S_BOGR_nperm500.csv"  download>Click to download bacterial OTU classifications (*Blue grama* only)</a>

-   OTUs are rows (n=7004). If observed OTU occurrence \< confidence interval thresholds, then sign = "specialist'

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_OTU_16S_BOGR_relabund.csv"  download>Click to download bacterial OTU table (converted to relative abundance)</a>

-   OTUs are rows (n=7004), samples are columns (n=75)

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_Taxa_16S_BOGR.csv" download>Click to download bacterial OTU taxonomy (GvS classification is 2nd column)</a>

-   OTUs are rows (n=7004)

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_sampledata_16S_BOGR.csv"  download>Click to download bacterial sample metadata</a>

-   samples are rows (n=75), metadata are columns (n=39)

-   Bacterial-fungal df joiner is col D `sample_name`
\

**Fungi**

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_Res_ITS_BOGR_nperm500.csv"  download>Click to download fungal OTU classifications (*Blue grama* only)</a>

-   OTUs are rows (n=1922). If observed OTU occurrence \< confidence interval thresholds, then sign = "specialist'

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_OTU_ITS_BOGR_relabund.csv"  download>Click to download fungal OTU table (converted to relative abundance)</a>

-   OTUs are rows (n=1922), samples are columns (n=75)

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_Taxa_ITS_BOGR.csv" download>Click to download fungal OTU taxonomy (GvS classification is 2nd column)</a>

-   OTUs are rows (n=1922)

<a href="../processed_data/2_generalist_vs_specialist/GvS_Bluegrama/GvS_sampledata_ITS_BOGR.csv" download>Click to download fungal sample metadata</a>

-   samples are rows (n=75), metadata are columns (n=39)

-   Bacterial-fungal df joiner is col D `sample_name` (note that this is essentially same as the bacterial sample data
