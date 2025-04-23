---
title: "RAM: Spatial Origins and Cross-Kingdom Congruence in Bacterial and Fungal Communities"
subtitle: "Contrasting fungal F1 subassemblage vs. non-F1 subassemblages and associated bacterial communities"
author: "Kelli Feeser"
date: "2025-04-22"
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
  html_document:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
editor_options:
  chunk_output_type: inline
bibliography: RAMreferences.bib
notes:
  - "add 'csl: apa.csl  # optional for APA-style formatting' to yaml"
---




\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::

\

------------------------------------------------------------------------

Document last updated: 2025-04-22

------------------------------------------------------------------------

\



# Introduction

- Microbial communities are spatially structured due to both intrinsic (biotic) and extrinsic (environmental) factors.
- Bacteria and fungi co-occur but may exhibit divergent spatial regimes.
- This study investigates spatial dependence in paired bacterial and fungal communities.
- We evaluate:
  - Spatial distance distributions between [SUBGROUPS]
  - Spatial decay of community dissimilarity within and across [GROUPS]
  - Spatial structure in explanatory dissimilarity matrices
  - Spatial detrending of explanatory matrices
  - Cross-kingdom associations (bacteria ↔ fungi)

# Methods

## Baseline Model: Spatial Origins of Compositional Structure

- A spatial structure in a response matrix Y can emerge from:
  (i) **Spatial autocorrelation**: biotic processes internal to communities
  (ii) **Induced spatial dependence**: spatially structured external environmental gradients
- We follow the framework of [@lichstein2007plant] and [@borcard2018numerical] to disentangle these components.

## Geographic and Community Dissimilarity Matrices {.hidden}

# Results

## Key points

F1 is the most abundant subassemblage (n = 183 samples), encompasses the most sites (9 sites, in 8 of which all samples within that site were classified as F1) and it the most homogeneous. It might therefore be argued to represent the 'core' fungal constituency, stripped of members [with limited niche space, given the non-overlapping env parameters/support]. These members likely filled roles the varied but limited niche space, however, given the broad range of (non-overlapping?) environmental contexts among sites/discrete sampling locations, they would not be present to a substantial degree in such a homogeneous group. Additionally, the sites with samples classified as F1 spanned the entire maximum spatial extent of the study area - 1560 km apart. F1 should therefore also not include members that are geographically/dispersion limited. Considering that, we might expect then that F1 communities a) represent perhaps a stable, if not large proportion of all community profiles in the study area because they are the 'core', but b) taken as a whole, we expect there to be a small shared species pool/be few in number (gamma), and c) that examination of individual samples should reveal comparatively species-poor communities.\

However, it has the most species-rich communities and it has the largest spared species pool (), even after accounting for the high sample number (). Why?

Are non-F1 communities just subsets of F1?
How diverse are environmental conditions within F1 and in comparison to non-F1?

Which, if any, bacterial community characteristics/emergent properties are also reflected within and among F1 and non-F1 samples?\
\

Are these fungi the archectets of bacterial community structure? What influences do the regional species pool have, or the host grass species identity?


\
\

cut/draft text:
of a limited narrowly selected subset of all..\
\

## Spatial distance distributions

### Fungal F1 vs. non-F1 - comparisons of pairwise geographic distances between samples within each subassemblage group





<div class="figure">
<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/fig-spatial-dist-1.png" alt="Figure 1. Q–Q plots and distribution of spatial distances within F1 and non-F1 groups."  />
<p class="caption">(\#fig:fig-spatial-dist)Figure 1. Q–Q plots and distribution of spatial distances within F1 and non-F1 groups.</p>
</div>












### Summary of Group Differences

F1 mean ± SD: 740.4 ± 442.9 km  
non-F1 mean ± SD: 640.3 ± 380.1 km  
Group means: different (Anderson–Darling; p = 2.75e-157) → **F1** had the greater mean  
Medians: different (Mood's median test; p < 0.001) → **F1** had the higher median  
Variance: different (Levene's test; p = 1.7e-223) → **F1** had greater variability  
CV and IQR were greater in **F1** and **F1**

### Distribution Shape

F1 distribution: approximately symmetric, platykurtic (light tails, peaked)  
non-F1 distribution: approximately symmetric, platykurtic (light tails, peaked)

### Tail Analysis (Extreme Distances)

95th percentile threshold: 1267.9 km  
Proportion exceeding threshold:  
- F1: 10.7%  
- non-F1: 2.2%  
This suggests that **F1** had a heavier upper tail and more long-distance pairings.

### Relative Dispersion

CV ratio (F1 / non-F1): 1.01  
Range ratio (F1 / non-F1): 1.08  
Dispersion varied across metrics, with no consistent trend.

### Effect Size and Probability-Based Inference

Cohen’s *d* = 0.25 (small effect), 95% CI: NA  
Cliff’s delta = 0.14 (CI: 0.13–0.15)  
→ Estimated probability that a randomly selected x < y: 43%  
→ Estimated probability that x > y: 57%

### Ecological Interpretation: Spatial Clustering & Heterogeneity

Based on these results, **non-F1** appears more spatially clustered — i.e., sample pairs are generally closer geographically.  
This is supported by consistently lower dispersion metrics in non-F1.  
Skewness and kurtosis suggest differences in spatial structure, with **non-F1** more asymmetrically dispersed and **non-F1** showing more extreme values or outliers.  
This may reflect differing dispersal constraints, landscape heterogeneity, or spatial sampling extent between groups.

## Map of Sample Locations
Colored by "F1" vs "non-F1" (sd$Fun_sor_clus2)
With distance-based shading or clustering option





### Sample Map + Convex Hulls

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/fig-map-hulls-1.png)<!-- -->


\
\
\

# Distributions of numeric metadata in F1 vs. non-F1

\


```
##  [1] "SampleID"                                
##  [2] "X16S_ID"                                 
##  [3] "sample_name"                             
##  [4] "Replicate"                               
##  [5] "Site"                                    
##  [6] "Site_Grass"                              
##  [7] "Site.Rep"                                
##  [8] "Grass"                                   
##  [9] "Grass_Rep"                               
## [10] "Edge"                                    
## [11] "SiteName"                                
## [12] "MAT_degC"                                
## [13] "MAP_mm"                                  
## [14] "CollectionDate"                          
## [15] "Latitude"                                
## [16] "Longitude"                               
## [17] "Elevation_m"                             
## [18] "Grassland"                               
## [19] "Gradient"                                
## [20] "Bin"                                     
## [21] "julianday"                               
## [22] "coll_GDD"                                
## [23] "GDD30yr"                                 
## [24] "GDD3yr"                                  
## [25] "GDD2015"                                 
## [26] "ppt30yr"                                 
## [27] "ppt3yr"                                  
## [28] "ppt2015"                                 
## [29] "soil_moisture"                           
## [30] "GWC"                                     
## [31] "perc_moisture"                           
## [32] "pH"                                      
## [33] "phos"                                    
## [34] "ammonium"                                
## [35] "nitrate"                                 
## [36] "SOM"                                     
## [37] "herbivory_perc"                          
## [38] "avg_SLA"                                 
## [39] "avg_SRL"                                 
## [40] "coll_GDD_m.std"                          
## [41] "GDD30yr_m.std"                           
## [42] "GDD3yr_m.std"                            
## [43] "GDD2015_m.std"                           
## [44] "ppt30yr_m.std"                           
## [45] "ppt3yr_m.std"                            
## [46] "ppt2015_m.std"                           
## [47] "soil_moisture_m.std"                     
## [48] "GWC_m.std"                               
## [49] "perc_moisture_m.std"                     
## [50] "pH_m.std"                                
## [51] "phos_m.std"                              
## [52] "ammonium_m.std"                          
## [53] "nitrate_m.std"                           
## [54] "SOM_m.std"                               
## [55] "herbivory_perc_m.std"                    
## [56] "avg_SLA_m.std"                           
## [57] "avg_SRL_m.std"                           
## [58] "clus_sor_k10"                            
## [59] "clus_sor_k10_new"                        
## [60] "Fun_sor_clusters"                        
## [61] "bac_clus_sor_k10_og"                     
## [62] "Bac_sor_clusters"                        
## [63] "Fun_sor_clus2"                           
## [64] "ngrass_persite"                          
## [65] "ngrass_perFun_sor_clusters"              
## [66] "ngrass_perBac_sor_clusters"              
## [67] "Bac_gamma_Site"                          
## [68] "Fun_gamma_Site"                          
## [69] "nsamples_per_Site"                       
## [70] "nsamples_perBac_sor_clusters"            
## [71] "nsamples_perFun_sor_clusters"            
## [72] "soil_dry_perc"                           
## [73] "soil_water_content"                      
## [74] "soil_water_content_m.std"                
## [75] "nsamples_at_site_within_Fun_sor_clus2"   
## [76] "ngrasses_at_site_within_Fun_sor_clus2"   
## [77] "nsamples_at_site_within_Bac_sor_clusters"
## [78] "nsamples_at_site_within_Fun_sor_clusters"
## [79] "ngrasses_at_site_within_Bac_sor_clusters"
## [80] "ngrasses_at_site_within_Fun_sor_clusters"
```

```
##   [1] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
##  [12] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
##  [23] F1     non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
##  [34] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
##  [45] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
##  [56] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
##  [67] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 F1    
##  [78] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
##  [89] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [100] F1     F1     F1     F1     non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [111] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [122] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [133] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [144] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [155] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [166] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [177] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [188] non-F1 non-F1 non-F1 non-F1 non-F1 F1     F1     F1     F1     F1     F1    
## [199] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [210] F1     F1     non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [221] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [232] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [243] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [254] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 F1     F1     F1     F1     F1    
## [265] F1     F1     F1     F1     F1     F1     non-F1 non-F1 non-F1 non-F1 non-F1
## [276] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [287] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [298] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [309] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [320] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [331] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [342] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [353] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [364] non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 F1     F1     F1    
## [375] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [386] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [397] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [408] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [419] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [430] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [441] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [452] F1     F1     non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1 non-F1
## [463] non-F1 F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## [474] F1     F1     F1     F1     F1     F1     F1     F1     F1     F1     F1    
## Levels: F1 non-F1
```

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/violin-numeric-metadata-1.png)<!-- -->



\
\

# Site specificity of clusters {.tabset}

\

## counts of samples per bacterial cluster within F1 vs non-F1


```
## sample counts per bacterial cluster within F1:
```

```
##  B1  B2  B3  B4  B5  B6  B9 B10 B11 B12 B13 B14 
##  33  36   7  10   7  12   5  11  21   1  20  20
```

```
## 
## sample counts per bacterial cluster within non-F1:
```

```
##  B1  B2  B3  B4  B5  B7  B8  B9 B10 B11 B12 B13 
##   6  35  33  41  43  12  20  41  49   1  19   1
```


## counts of samples by site and fungal cluster


```
##      
##       F1 F2 F3 F4 F5 F6 F7 F8 F9 F10
##   BLM 23  0  0  0  0  0  0  0  0   0
##   BNP  0  0  0  0  2  0  0  0  9   4
##   CAD  0  0  0  0  0  6  0 15 17   0
##   CNF 27  0  0  0  0  0  0  0  0   0
##   CPR  0  0  0  0 11  0  0  0  0   0
##   DMT  0  0  0  0  1  1  0  7  4  13
##   FCP  0  0  0  1  1  0  7  1 17   0
##   FMT  0  0  0  0  0  0  0  0  2  13
##   GMT 19  0  0  0  0  0  0  0  0   0
##   GNF  0  0  0  0  0  0  0  7  0   0
##   HAR  0  0  0  0  0  0 13 22  2   0
##   HPG 11  0  0  0  2  0  0  1  1   0
##   KAE  0  0 29  1  0  0  1  0  1   0
##   KNZ  0  0  0  0  0 25 17  0  0   0
##   LAR  0  0  0 27  0  0  0  0  0   0
##   LBJ 34  0  0  0  0  0  0  0  0   0
##   NWP 20  0  0  0  0  0  0  0  0   0
##   ONF 22  0  0  0  0  0  0  0  0   0
##   RNF  6  0  0  0  0  0  0  0  0   0
##   SEV  0  0  0  0  0  0  0  0  3   7
##   SFA  0 10  0  0  0  0  0  0  0   0
##   UHC 21  0  0  0  0  0  0  0  0   0
```


## Association Statistics of sites and fungal clusters


```
##                     X^2  df P(> X^2)
## Likelihood Ratio 1488.8 189        0
## Pearson          2894.6 189        0
## 
## Phi-Coefficient   : NA 
## Contingency Coeff.: 0.926 
## Cramer's V        : 0.815
```


"Cramer's V is a standardized measure of association between categorical variables, allowing for comparisons across datasets or studies. Because it runs from 0 to 1, with 0 indicating no linkage and 1 showing perfect correlation, it provides a straightforward and understandable statistic."

## Table: F1 vs non-F1 distribution by Site

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-4)(\#tab:unnamed-chunk-4)F1 vs non-F1 distribution by Site</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Site </th>
   <th style="text-align:right;"> F1 </th>
   <th style="text-align:right;"> non-F1 </th>
   <th style="text-align:right;"> total </th>
   <th style="text-align:right;"> F1_prop </th>
   <th style="text-align:right;"> nonF1_prop </th>
   <th style="text-align:left;"> F1_status </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.733 </td>
   <td style="text-align:right;"> 0.267 </td>
   <td style="text-align:left;"> Mixed </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:left;"> Only non-F1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.000 </td>
   <td style="text-align:left;"> Only F1 </td>
  </tr>
</tbody>
</table>



## Decision Tree: sites by fungal clusters

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/tree-with-site-labels-1.png" width="40%" height="40%" />



## Decision Tree: sites by fungal clusters with host grass bar plot annotations and bacterial subassemblage assignments

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/final-aligned-bar-tree-1.png)<!-- -->

## Decision Tree: sites by fungal clusters with bacterial cluster branches


```
## Warning in data.frame(Class = class, Site = raw_sites, label = sites, x = x, : row
## names were found from a short variable and have been discarded
## Warning in data.frame(Class = class, Site = raw_sites, label = sites, x = x, : row
## names were found from a short variable and have been discarded
```

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/tree-with-cleaned-bac-1.png" width="40%" height="40%" />




## cut code {.hidden}












\

# Predictive Relationships Between Fungal and Bacterial Clusters

\

## Consistent subassemblage associations among corresponding samples {.tabset}

\

Are any fungal subassemblages paired consistently with a bacterial subassemblage or vice versa? Do those relationships change among sites, grass hosts, or a combination thereof?

    - B2 samples are about half (n = 36 of 71, 51%) F1, half F9/F10 (F9: n = 16, 22.5%; F10: n = 18, 25.4%), and 1 samples in F5 (1.4%)
        - however, all the F1 samples were at a latitude of 34.05433 while non-F1 were at 30.63087
        - 57 were BOER (F1: 23/non-F1: 24), 23 were BOGR (13/10), and 1 was BUDA (0/1).
        - non-overlapping sites 
            - F1: BLM (2 all BOGR), CNF (15 - BOGR and BOER), GMT (19 - BOGR and BOER); 
            - non-F1: 
                F5: BNP (1 BOGR); 
                F9: BNP (8 BOER), CAD (1 BUDA), DMT (4 BOGR), FMT (1 BOGR), SEV (2 BOER); 
                F10: BNP (4 BOER), DMT (10 - BOGR and BOER), FMT (2 BOGR), SEV (2 - BOGR and BOER)



### Table: F1 vs non-F1 distribution by Site




### Congruency table: Bacterial Congruence Within Sites (F1 vs non-F1)

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:congruence-site)(\#tab:congruence-site)Bacterial Congruence Within Sites (F1 vs non-F1)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> Site </th>
   <th style="text-align:left;"> type </th>
   <th style="text-align:left;"> dominant_B </th>
   <th style="text-align:right;"> dominant_n </th>
   <th style="text-align:right;"> total </th>
   <th style="text-align:right;"> congruent_prop </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 0.913 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 0.556 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 0.294 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B13 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B14 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 0.909 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B11 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.867 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 0.605 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B7 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 0.538 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 0.481 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.733 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.571 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 0.541 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG1 </td>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B12 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.594 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 0.976 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B8 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.800 </td>
  </tr>
</tbody>
</table>

## Summary table: Bacterial Congruence Proportions by Group (F1 vs non-F1)

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:summary-congruence)(\#tab:summary-congruence)Summary: Bacterial Congruence Proportions by Group (F1 vs non-F1)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:right;"> n_sites </th>
   <th style="text-align:right;"> mean_congruence </th>
   <th style="text-align:right;"> median_congruence </th>
   <th style="text-align:right;"> strong_congruence_n </th>
   <th style="text-align:right;"> prop_strong </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.802 </td>
   <td style="text-align:right;"> 0.913 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0.718 </td>
   <td style="text-align:right;"> 0.669 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.429 </td>
  </tr>
</tbody>
</table>

### Table: Bacterial Cluster Congruence by Site × Grass (F1 vs non-F1)

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-6)(\#tab:unnamed-chunk-6)Bacterial Cluster Congruence by Site × Grass (F1 vs non-F1)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> Site </th>
   <th style="text-align:left;"> Grass </th>
   <th style="text-align:left;"> type </th>
   <th style="text-align:left;"> dominant_B </th>
   <th style="text-align:right;"> dominant_n </th>
   <th style="text-align:right;"> total </th>
   <th style="text-align:right;"> congruent_prop </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> LBJ.ANGE </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.818 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP.ANGE </td>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B13 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF.ANGE </td>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B14 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC.ANGE </td>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B11 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF.BOER </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT.BOER </td>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLM.BOGR </td>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.833 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF.BOGR </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT.BOGR </td>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF.BOGR </td>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG.BUDA </td>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ.BUDA </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.333 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLM.SCSC </td>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF.SCSC </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B6 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ.SCSC </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.818 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP.SCSC </td>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B13 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF.SCSC </td>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B14 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.917 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC.SCSC </td>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.ANGE </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.ANGE </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE.ANGE </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B12 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.ANGE </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR.ANGE </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP.BOER </td>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR.BOER </td>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B7 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT.BOER </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT.BOER </td>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV.BOER </td>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B8 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP.BOGR </td>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.BOGR </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT.BOGR </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP.BOGR </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT.BOGR </td>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.BOGR </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG.BOGR </td>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.BOGR </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.889 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR.BOGR </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV.BOGR </td>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.BUDA </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.727 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP.BUDA </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.BUDA </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE.BUDA </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.BUDA </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.SCSC </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT.SCSC </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.444 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP.SCSC </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.727 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF.SCSC </td>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.571 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.SCSC </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE.SCSC </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B12 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.889 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.SCSC </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR.SCSC </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA.SCSC </td>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.800 </td>
  </tr>
</tbody>
</table>

### Dominant Bacterial Clusters by Site × Grass × Fungal Type {.hidden}

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:bacterial-pairing-congruence)(\#tab:bacterial-pairing-congruence)Dominant Bacterial Clusters by Site × Grass × Fungal Type</caption>
 <thead>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:left;"> Site </th>
   <th style="text-align:left;"> Grass </th>
   <th style="text-align:left;"> Type </th>
   <th style="text-align:left;"> Dominant_B </th>
   <th style="text-align:right;"> N_dominant </th>
   <th style="text-align:right;"> Total </th>
   <th style="text-align:right;"> Proportion </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> LBJ.ANGE </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.818 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP.ANGE </td>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B13 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF.ANGE </td>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B14 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC.ANGE </td>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B11 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF.BOER </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT.BOER </td>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLM.BOGR </td>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.833 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF.BOGR </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT.BOGR </td>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF.BOGR </td>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG.BUDA </td>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ.BUDA </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.333 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLM.SCSC </td>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF.SCSC </td>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B6 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ.SCSC </td>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.818 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP.SCSC </td>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B13 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF.SCSC </td>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B14 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.917 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC.SCSC </td>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> B11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.ANGE </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.ANGE </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE.ANGE </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B12 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.ANGE </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR.ANGE </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> ANGE </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP.BOER </td>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR.BOER </td>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B7 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT.BOER </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT.BOER </td>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV.BOER </td>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:left;"> BOER </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B8 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP.BOGR </td>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.667 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.BOGR </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT.BOGR </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP.BOGR </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT.BOGR </td>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.BOGR </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG.BOGR </td>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.BOGR </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.889 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR.BOGR </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV.BOGR </td>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:left;"> BOGR </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.BUDA </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.727 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP.BUDA </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.BUDA </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B3 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE.BUDA </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.BUDA </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> BUDA </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD.SCSC </td>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT.SCSC </td>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.444 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP.SCSC </td>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.727 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF.SCSC </td>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.571 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR.SCSC </td>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE.SCSC </td>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B12 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.889 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ.SCSC </td>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B10 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR.SCSC </td>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B9 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA.SCSC </td>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:left;"> SCSC </td>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> B4 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.800 </td>
  </tr>
</tbody>
</table>







## Predictive


``` r
# Load only necessary packages
library(nnet)  # for multinom()
library(broom) # for tidy() summaries

df <- sd
# levels(df$Fun_sor_clus2)

# Make sure df data is correctly factored
# df$Fun_sor_clus2 <- factor(df$Fun_sor_clus2, levels = c("F1", "non-F1"))
# df$Bac_sor_clusters <- factor(df$Bac_sor_clusters, levels = paste0("B", 1:14))
df$Fun_sor_clus2_flipped <- relevel(df$Fun_sor_clus2, ref = "non-F1")
# levels(df$Fun_sor_clus2_flipped)

# 1. F1 → Bac_sor_clusters (multinomial)
model_bac_predicted_by_fun <- multinom(Bac_sor_clusters ~ Fun_sor_clus2, data = df)
```

```
## # weights:  42 (26 variable)
## initial  value 1277.303748 
## iter  10 value 1100.842653
## iter  20 value 1076.770645
## iter  30 value 1075.387040
## iter  40 value 1075.314982
## final  value 1075.314894 
## converged
```

``` r
res_bac_by_fun <- tidy(model_bac_predicted_by_fun, exponentiate = TRUE, conf.int = TRUE)

# 2. Bac_sor_clusters → F1 (binary)
model_fun_predicted_by_bac <- glm(Fun_sor_clus2 ~ Bac_sor_clusters, data = df, family = binomial)
res_fun_by_bac <- tidy(model_fun_predicted_by_bac, exponentiate = TRUE, conf.int = TRUE)

# 3. non-F1 → Bac_sor_clusters (multinomial)
model_bac_by_nonF1 <- multinom(Bac_sor_clusters ~ Fun_sor_clus2_flipped, data = df)
```

```
## # weights:  42 (26 variable)
## initial  value 1277.303748 
## iter  10 value 1089.173573
## iter  20 value 1077.071782
## iter  30 value 1075.411321
## iter  40 value 1075.315112
## final  value 1075.314898 
## converged
```

``` r
res_bac_by_nonF1 <- tidy(model_bac_by_nonF1, exponentiate = TRUE, conf.int = TRUE)

# 4. Bac_sor_clusters → non-F1 (binary)
model_nonF1_by_bac <- glm(Fun_sor_clus2_flipped ~ Bac_sor_clusters, data = df, family = binomial)
res_nonF1_by_bac <- tidy(model_nonF1_by_bac, exponentiate = TRUE, conf.int = TRUE)
```

Fungal group F1 significantly predicted bacterial cluster membership in 18 out of 14 clusters. Significant clusters include: B2, B3, B4, B5, B6, B7, B8, B9, B10, B12.
Bacterial subassemblage significantly predicted F1 membership in 8 cluster terms. Significant clusters include: (Intercept), Bac_sor_clustersB2, Bac_sor_clustersB3, Bac_sor_clustersB4, Bac_sor_clustersB5, Bac_sor_clustersB9, Bac_sor_clustersB10, Bac_sor_clustersB12.
non-F1 fungal samples significantly predicted bacterial cluster membership in 15 out of 14 clusters. Significant clusters include: B2, B3, B4, B5, B8, B9, B10, B12.
Bacterial clusters significantly predicted non-F1 membership in 8 terms. Significant clusters include: (Intercept), Bac_sor_clustersB2, Bac_sor_clustersB3, Bac_sor_clustersB4, Bac_sor_clustersB5, Bac_sor_clustersB9, Bac_sor_clustersB10, Bac_sor_clustersB12.


\
\

# Proportion of metadata factors in F1 vs non-F1 {.tabset}

\

## F1 vs non-F1

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/plot-grass-metadata-distributions-by-F1-1.png)<!-- -->



## All Fungal Subassemblages

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/plot-latlong-metadata-distributions-by-Fun_sor_clusters-1.png)<!-- -->


## Wilcoxon rank-sum results - Filtered 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-7-1.png)<!-- -->




## Wilcoxon rank-sum results - Unfiltered 






## Categorical {.tabset}



### Proportions of F1 vs non-F1 among Grasses

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

### Proportions of F1 vs non-F1 among Grasslands

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

### Proportions of F1 vs non-F1 among grass hosts present per site

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

### Proportions of F1 vs non-F1 among Site_Grass

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-13-1.png)<!-- -->


# Mean annual precipitation data extractions and interpolation

[Assigning 2015 Mean Annual Precipitation (MAP) to each sampling site’s coordinates]{.underline} 
\
Some sites had grass samples with nearby coordinates measured.\

Only (LTER?) certain sites had MAP (in mm) previously measured. To fill in the remaining data (and cross-referencing the congruence of the overlapping data), we integrated spatial point data (geographic coordinates) with CHELSA precipitation rasters. 

Mean Annual Precipitation (MAP) for the year 2015 was derived from the CHELSAcruts dataset (Climatologies at High resolution for the Earth's Land Surface Areas), which provides high-resolution (~1 km, 30 arc-second) monthly precipitation data. We downloaded the full set of 12 monthly precipitation rasters (GeoTIFF format) for the year 2015 from the CHELSA data repository (https://www.envidat.ch/dataset/chelsacruts/resource/26958a2a-c7fa-4f16-82ce-57f2bbac59c8; Identifier
chelsacruts.26958a2a-c7fa-4f16-82ce-57f2bbac59c8, Issued date: June 23, 2020; Modified date: June 23, 2020). 
CHELSAcruts is a delta change monthly climate dataset for the years 1901-2016 for mean monthly maximum temperatures, mean monthly minimum temperatures, and monthly precipitation sum.
The data was accessed using the URL (https://envicloud.wsl.ch/#/?bucket=https%3A%2F%2Fos.zhdk.cloud.switch.ch%2Fchelsav1%2F&prefix=chelsa_cruts%2F (Metadata last updated: September 19, 2024; Data last updated: October 29, 2018; Created: October 29, 2018; Accessed: March 26, 2025). 

All raster data were processed using R (v4.4.3) with the raster (v3.6.31) and data.table (v1.17.0) packages. The 12 monthly CHELSA precipitation rasters for 2015 were loaded and stacked into a multilayer raster object. Annual precipitation for 2015 was computed by summing the 12 monthly layers using calc(..., sum) with na.rm = TRUE. Point-based extraction of precipitation values was performed using the extract() function from the raster package, which interpolates cell values at each sampling coordinate.









# PCA of env data {.tabset}

## PCA - biplot

Elevation_m, ppt3yr, ppt30yr,pH, SOM,  perc_moisture,  phos,  nitrate,  ammonium,  herbivory_perc,  avg_SLA,  avg_SRL


![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-16-1.png)<!-- -->

## PCA - colored by contributions to the PC

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

## PCA - colored by quality of representation {hidden}

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-18-1.png)<!-- -->


## determining optimal number of clusters by average silhouette width (kmeans)

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-19-1.png)<!-- -->

## Cluster dendrogram

Environmental data only
Compute hierarchical clustering and cut into 7 clusters

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-20-1.png" width="50%" height="50%" />

## Partitioning Clusters (PCA with site_grass kmeans clusters)

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/unnamed-chunk-21-1.png" 110% />



## Visualize distance matrix




# Comparing OTUs present in F1 vs non-F1

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/venn-F1-vs-non-F1-1.png)<!-- -->

## Comparing OTUs present among grasses in F1 vs non-F1






























![](../docs/figures/venn_diagrams/F1_byGrass_venn.png){width='100%'}

![](../docs/figures/venn_diagrams/nonF1_byGrass_venn.png){width='100%'}

**Fungal subassemblage F2 only has 1 grass species (SCSC)**\
\

![](../docs/figures/venn_diagrams/F3_byGrass_venn.png){width='100%'}

![](../docs/figures/venn_diagrams/F5_byGrass_venn.png){width='100%'}

![](../docs/figures/venn_diagrams/F6_byGrass_venn.png){width='49%'}

![](../docs/figures/venn_diagrams/F7_byGrass_venn.png){width='49%'}

![](../docs/figures/venn_diagrams/F8_byGrass_venn.png){width='49%'}

![](../docs/figures/venn_diagrams/F9_byGrass_venn.png){width='49%'}

![](../docs/figures/venn_diagrams/F10_byGrass_venn.png){width='100%'}


# Fungal vs. bacterial dissimilarity {.tabset}

## Scatterplots of fungal vs. bacterial dissimilarities







```
## `geom_smooth()` using formula = 'y ~ x'
```

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_v2_files/figure-html/scatterplot-BF-Fun-sor-clus2-sor-1.png)<!-- -->

## Source or sink (F1 - fungal only)

n/a

## fungal cluster dissimilarity as predictor of bacterial dissimilarity

“When two fungal clusters are different (e.g., F1–F2 vs F1–F7), do their bacterial dissimilarities also differ?”


```
## 
## Call:
## lm(formula = Bac_beta_sor ~ Fun_beta_sor, data = combined_df)
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.245771 -0.060146 -0.004457  0.055977  0.252640 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.619647   0.002007  308.79   <2e-16 ***
## Fun_beta_sor 0.069552   0.002395   29.04   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.08466 on 53474 degrees of freedom
## Multiple R-squared:  0.01552,	Adjusted R-squared:  0.0155 
## F-statistic: 843.1 on 1 and 53474 DF,  p-value: < 2.2e-16
```

```
## 
## Call:
## lm(formula = Bac_beta_sor ~ Fun_beta_sor * Group, data = combined_df)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.29352 -0.04508 -0.00756  0.03817  0.32947 
## 
## Coefficients:
##                           Estimate Std. Error t value Pr(>|t|)    
## (Intercept)               0.503200   0.005549   90.68   <2e-16 ***
## Fun_beta_sor              0.407096   0.010765   37.82   <2e-16 ***
## Groupnon-F1              -0.467833   0.006736  -69.45   <2e-16 ***
## Fun_beta_sor:Groupnon-F1  0.313670   0.011599   27.04   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.06756 on 53472 degrees of freedom
## Multiple R-squared:  0.3731,	Adjusted R-squared:  0.3731 
## F-statistic: 1.061e+04 on 3 and 53472 DF,  p-value: < 2.2e-16
```

```
## 
## Call:
## lm(formula = Bac_beta_sor ~ Fun_beta_sor * Group + Site_pair, 
##     data = combined_df)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.25528 -0.04312 -0.00677  0.03672  0.26981 
## 
## Coefficients:
##                           Estimate Std. Error t value Pr(>|t|)    
## (Intercept)               0.592134   0.005539 106.894  < 2e-16 ***
## Fun_beta_sor              0.262001   0.010636  24.632  < 2e-16 ***
## Groupnon-F1              -0.554084   0.007145 -77.546  < 2e-16 ***
## Site_pairBLM             -0.172541   0.005747 -30.022  < 2e-16 ***
## Site_pairBNP             -0.026819   0.006242  -4.297 1.74e-05 ***
## Site_pairCAD             -0.045868   0.002486 -18.453  < 2e-16 ***
## Site_pairCNF             -0.097893   0.006700 -14.610  < 2e-16 ***
## Site_pairCPR             -0.011932   0.008683  -1.374  0.16941    
## Site_pairDMT             -0.021697   0.003560  -6.095 1.10e-09 ***
## Site_pairFCP             -0.037027   0.003450 -10.731  < 2e-16 ***
## Site_pairFMT             -0.017886   0.006246  -2.864  0.00419 ** 
## Site_pairGMT             -0.174356   0.011834 -14.733  < 2e-16 ***
## Site_pairGNF              0.010076   0.013966   0.721  0.47061    
## Site_pairHAR             -0.022500   0.002571  -8.751  < 2e-16 ***
## Site_pairHPG             -0.175921   0.010525 -16.715  < 2e-16 ***
## Site_pairKAE              0.110669   0.002973  37.219  < 2e-16 ***
## Site_pairKNZ             -0.041752   0.002366 -17.644  < 2e-16 ***
## Site_pairLAR              0.043931   0.003597  12.212  < 2e-16 ***
## Site_pairLBJ             -0.117382   0.003402 -34.503  < 2e-16 ***
## Site_pairNWP             -0.186805   0.011301 -16.529  < 2e-16 ***
## Site_pairONF             -0.181560   0.006128 -29.628  < 2e-16 ***
## Site_pairRNF             -0.244916   0.028506  -8.592  < 2e-16 ***
## Site_pairSEV             -0.023567   0.009535  -2.472  0.01345 *  
## Site_pairSFA              0.119287   0.009651  12.359  < 2e-16 ***
## Site_pairUHC             -0.142299   0.007321 -19.438  < 2e-16 ***
## Fun_beta_sor:Groupnon-F1  0.456595   0.011766  38.806  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.06369 on 53450 degrees of freedom
## Multiple R-squared:  0.443,	Adjusted R-squared:  0.4428 
## F-statistic:  1701 on 25 and 53450 DF,  p-value: < 2.2e-16
```


We’ve just shown:

Fungal β<sub>sor</sub> predicts bacterial β<sub>sor</sub> (weakly in F1, strongly in non-F1)

But if F1 is compositionally homogeneous (as we know it is) and species-rich, then:

Its β<sub>sor</sub> is low

But we don’t yet know: Is that due to low turnover (β<sub>sim</sub>) or high nestedness (β<sub>sne</sub>)?

And more importantly:

Does fungal turnover (β<sub>sim</sub>) drive bacterial dissimilarity — more than nestedness does?

Better question to test: Is fungal turnover (β<sub>sim</sub>) more predictive of bacterial β-diversity than fungal nestedness (β<sub>sne</sub>)?








1. Fungal turnover in F1 is decoupled from bacterial community structure

The fungi that vary in F1 aren’t influencing bacterial composition

Or: bacteria are structured by other factors in these samples (e.g. environment, host, site)

2. Fungal variation in F1 may be functionally irrelevant to bacteria

Even if turnover occurs, it could be:

Among redundant taxa

Within functionally equivalent guilds

Not enough to change niches, resources, or microenvironments for bacteria

3. Fungal influence on bacterial structure may require broader compositional shifts

Like those in non-F1, where fungal turnover is higher and more ecologically distinct

Suggesting threshold-like or nonlinear effects — below a certain fungal shift, bacteria don’t respond

...
There is a decoupling threshold: below a certain level of fungal community differentiation — even if it’s real turnover — bacterial communities do not track those changes.?

How much of bacterial compositional turnover is explained by:

Site (regional species pool)?

Fungal assemblage identity (local community state)?

Which is a stronger predictor?

Can fungal identity predict bacterial community structure beyond regional context?

--

2. Account for the pool explicitly using γ-diversity or incidence matrices

Use site-level γ-diversity (total taxa observed) as a covariate

Or subtract site-level effects by modeling residuals of bacterial composition from a null model (e.g. Raup–Crick, C-score deviations)

--

## Regression using residuals

If fungal cluster identity explains bacterial dissimilarity even after accounting for pool similarity, it strongly supports the idea that fungal communities locally structure bacterial assembly beyond what's available regionally.
    - By controlling for both the regional bacterial pool (site-level shared species) and fungal dissimilarity (i.e., how different the fungal communities are) — and test whether fungal subassemblage identity still explains bacterial dissimilarity.
    
    - Do fungal subassemblage assignments explain bacterial β-diversity above and beyond what’s expected from fungal compositional distance and shared regional pool?\
\

Modeling bacterial dissimilarity as a function of:
Fun_beta_sim (fungal turnover)
Pool_dist (bacterial regional pool difference between sites)\
\

bacterial turnover ~ fungal + regional pool + cluster identity:


```
## 
## Call:
## lm(formula = Bac_beta_sim ~ Fun_beta_sim + Bac_pool_sim + Fungal_cluster_pair, 
##     data = df_beta_wpool)
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.291024 -0.042695  0.000379  0.042842  0.220247 
## 
## Coefficients:
##                            Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                0.285516   0.002694 105.971   <2e-16 ***
## Fun_beta_sim               0.361806   0.005079  71.231   <2e-16 ***
## Bac_pool_sim               0.480801   0.003611 133.144   <2e-16 ***
## Fungal_cluster_pairF1_F10 -0.118824   0.002295 -51.766   <2e-16 ***
## Fungal_cluster_pairF1_F2  -0.180073   0.002766 -65.096   <2e-16 ***
## Fungal_cluster_pairF1_F3  -0.119882   0.002764 -43.367   <2e-16 ***
## Fungal_cluster_pairF1_F4  -0.144103   0.002269 -63.519   <2e-16 ***
## Fungal_cluster_pairF1_F5  -0.120914   0.002534 -47.718   <2e-16 ***
## Fungal_cluster_pairF1_F6  -0.128753   0.002231 -57.704   <2e-16 ***
## Fungal_cluster_pairF1_F7  -0.150491   0.002340 -64.300   <2e-16 ***
## Fungal_cluster_pairF1_F8  -0.140445   0.002175 -64.577   <2e-16 ***
## Fungal_cluster_pairF1_F9  -0.131187   0.002218 -59.140   <2e-16 ***
## Fungal_cluster_pairF10    -0.159528   0.004528 -35.235   <2e-16 ***
## Fungal_cluster_pairF10_F2 -0.179072   0.010302 -17.382   <2e-16 ***
## Fungal_cluster_pairF10_F3 -0.107011   0.003434 -31.163   <2e-16 ***
## Fungal_cluster_pairF10_F4 -0.159303   0.003157 -50.465   <2e-16 ***
## Fungal_cluster_pairF10_F5 -0.126182   0.003962 -31.852   <2e-16 ***
## Fungal_cluster_pairF10_F6 -0.129113   0.003840 -33.622   <2e-16 ***
## Fungal_cluster_pairF10_F7 -0.168502   0.003233 -52.120   <2e-16 ***
## Fungal_cluster_pairF10_F8 -0.134105   0.003121 -42.971   <2e-16 ***
## Fungal_cluster_pairF10_F9 -0.159780   0.003007 -53.141   <2e-16 ***
## Fungal_cluster_pairF2_F3  -0.122286   0.014412  -8.485   <2e-16 ***
## Fungal_cluster_pairF2_F4  -0.244910   0.009239 -26.508   <2e-16 ***
## Fungal_cluster_pairF2_F5  -0.208506   0.009285 -22.457   <2e-16 ***
## Fungal_cluster_pairF2_F6  -0.140555   0.005227 -26.890   <2e-16 ***
## Fungal_cluster_pairF2_F7  -0.174405   0.006034 -28.903   <2e-16 ***
## Fungal_cluster_pairF2_F8  -0.180920   0.007067 -25.601   <2e-16 ***
## Fungal_cluster_pairF2_F9  -0.169815   0.004789 -35.460   <2e-16 ***
## Fungal_cluster_pairF3_F4  -0.105371   0.003183 -33.106   <2e-16 ***
## Fungal_cluster_pairF3_F5  -0.163868   0.008648 -18.948   <2e-16 ***
## Fungal_cluster_pairF3_F6  -0.205383   0.003346 -61.373   <2e-16 ***
## Fungal_cluster_pairF3_F7  -0.184386   0.003337 -55.251   <2e-16 ***
## Fungal_cluster_pairF3_F8  -0.157711   0.003050 -51.715   <2e-16 ***
## Fungal_cluster_pairF3_F9  -0.120684   0.003303 -36.533   <2e-16 ***
## Fungal_cluster_pairF4     -0.220994   0.009262 -23.861   <2e-16 ***
## Fungal_cluster_pairF4_F5  -0.164680   0.005846 -28.168   <2e-16 ***
## Fungal_cluster_pairF4_F6  -0.163796   0.003532 -46.372   <2e-16 ***
## Fungal_cluster_pairF4_F7  -0.178788   0.003301 -54.154   <2e-16 ***
## Fungal_cluster_pairF4_F8  -0.197457   0.002980 -66.250   <2e-16 ***
## Fungal_cluster_pairF4_F9  -0.191056   0.003115 -61.341   <2e-16 ***
## Fungal_cluster_pairF5     -0.153357   0.008889 -17.252   <2e-16 ***
## Fungal_cluster_pairF5_F6  -0.131754   0.004188 -31.456   <2e-16 ***
## Fungal_cluster_pairF5_F7  -0.150454   0.003861 -38.963   <2e-16 ***
## Fungal_cluster_pairF5_F8  -0.122235   0.003772 -32.408   <2e-16 ***
## Fungal_cluster_pairF5_F9  -0.101171   0.003554 -28.467   <2e-16 ***
## Fungal_cluster_pairF6     -0.224283   0.007391 -30.345   <2e-16 ***
## Fungal_cluster_pairF6_F7  -0.188404   0.004190 -44.969   <2e-16 ***
## Fungal_cluster_pairF6_F8  -0.146629   0.003428 -42.769   <2e-16 ***
## Fungal_cluster_pairF6_F9  -0.127590   0.003385 -37.694   <2e-16 ***
## Fungal_cluster_pairF7     -0.206979   0.004858 -42.602   <2e-16 ***
## Fungal_cluster_pairF7_F8  -0.159840   0.003242 -49.298   <2e-16 ***
## Fungal_cluster_pairF7_F9  -0.161023   0.003053 -52.743   <2e-16 ***
## Fungal_cluster_pairF8     -0.160218   0.003636 -44.065   <2e-16 ***
## Fungal_cluster_pairF8_F9  -0.165677   0.002936 -56.435   <2e-16 ***
## Fungal_cluster_pairF9     -0.167507   0.003428 -48.868   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.06383 on 54416 degrees of freedom
##   (2702 observations deleted due to missingness)
## Multiple R-squared:  0.478,	Adjusted R-squared:  0.4775 
## F-statistic: 922.9 on 54 and 54416 DF,  p-value: < 2.2e-16
```

\
isolate the residuals and test the contribution of fungal subassemblages after controlling for pool + turnover:


```
## 
## Call:
## lm(formula = Bac_beta_sim_resid ~ Fungal_cluster_pair, data = df_resid)
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.299476 -0.043887  0.001015  0.044787  0.235119 
## 
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                0.0243291  0.0007631  31.881  < 2e-16 ***
## Fungal_cluster_pairF1_F10 -0.0121126  0.0014084  -8.600  < 2e-16 ***
## Fungal_cluster_pairF1_F2  -0.0896073  0.0023244 -38.550  < 2e-16 ***
## Fungal_cluster_pairF1_F3  -0.0293151  0.0023734 -12.351  < 2e-16 ***
## Fungal_cluster_pairF1_F4  -0.0536594  0.0017000 -31.564  < 2e-16 ***
## Fungal_cluster_pairF1_F5  -0.0161719  0.0018394  -8.792  < 2e-16 ***
## Fungal_cluster_pairF1_F6  -0.0220391  0.0013542 -16.275  < 2e-16 ***
## Fungal_cluster_pairF1_F7  -0.0363736  0.0013530 -26.884  < 2e-16 ***
## Fungal_cluster_pairF1_F8  -0.0333497  0.0012423 -26.845  < 2e-16 ***
## Fungal_cluster_pairF1_F9  -0.0189083  0.0011687 -16.179  < 2e-16 ***
## Fungal_cluster_pairF10    -0.0424626  0.0041948 -10.123  < 2e-16 ***
## Fungal_cluster_pairF10_F2 -0.0701455  0.0104425  -6.717 1.87e-11 ***
## Fungal_cluster_pairF10_F3  0.0355832  0.0025022  14.221  < 2e-16 ***
## Fungal_cluster_pairF10_F4 -0.0315742  0.0023302 -13.550  < 2e-16 ***
## Fungal_cluster_pairF10_F5  0.0096460  0.0033108   2.913 0.003576 ** 
## Fungal_cluster_pairF10_F6  0.0214404  0.0029637   7.234 4.74e-13 ***
## Fungal_cluster_pairF10_F7 -0.0299046  0.0023018 -12.992  < 2e-16 ***
## Fungal_cluster_pairF10_F8  0.0046295  0.0021335   2.170 0.030016 *  
## Fungal_cluster_pairF10_F9 -0.0394547  0.0022918 -17.215  < 2e-16 ***
## Fungal_cluster_pairF2_F3  -0.0136984  0.0147482  -0.929 0.352987    
## Fungal_cluster_pairF2_F4  -0.1391947  0.0093463 -14.893  < 2e-16 ***
## Fungal_cluster_pairF2_F5  -0.0928017  0.0093463  -9.929  < 2e-16 ***
## Fungal_cluster_pairF2_F6  -0.0204185  0.0049684  -4.110 3.97e-05 ***
## Fungal_cluster_pairF2_F7  -0.0506213  0.0058272  -8.687  < 2e-16 ***
## Fungal_cluster_pairF2_F8  -0.0604400  0.0069849  -8.653  < 2e-16 ***
## Fungal_cluster_pairF2_F9  -0.0464437  0.0044474 -10.443  < 2e-16 ***
## Fungal_cluster_pairF3_F4   0.0036740  0.0026825   1.370 0.170812    
## Fungal_cluster_pairF3_F5  -0.0290293  0.0086091  -3.372 0.000747 ***
## Fungal_cluster_pairF3_F6  -0.0802716  0.0026807 -29.945  < 2e-16 ***
## Fungal_cluster_pairF3_F7  -0.0523496  0.0025577 -20.467  < 2e-16 ***
## Fungal_cluster_pairF3_F8  -0.0351368  0.0023040 -15.250  < 2e-16 ***
## Fungal_cluster_pairF3_F9   0.0157531  0.0024288   6.486 8.90e-11 ***
## Fungal_cluster_pairF4     -0.1061536  0.0093463 -11.358  < 2e-16 ***
## Fungal_cluster_pairF4_F5  -0.0357811  0.0055799  -6.412 1.44e-10 ***
## Fungal_cluster_pairF4_F6  -0.0296180  0.0028017 -10.571  < 2e-16 ***
## Fungal_cluster_pairF4_F7  -0.0428221  0.0024548 -17.444  < 2e-16 ***
## Fungal_cluster_pairF4_F8  -0.0756625  0.0022322 -33.897  < 2e-16 ***
## Fungal_cluster_pairF4_F9  -0.0650734  0.0023527 -27.659  < 2e-16 ***
## Fungal_cluster_pairF5     -0.0518707  0.0089959  -5.766 8.16e-09 ***
## Fungal_cluster_pairF5_F6  -0.0081938  0.0037491  -2.186 0.028856 *  
## Fungal_cluster_pairF5_F7  -0.0368670  0.0034597 -10.656  < 2e-16 ***
## Fungal_cluster_pairF5_F8   0.0080608  0.0031613   2.550 0.010779 *  
## Fungal_cluster_pairF5_F9   0.0368798  0.0027677  13.325  < 2e-16 ***
## Fungal_cluster_pairF6     -0.1309574  0.0074499 -17.578  < 2e-16 ***
## Fungal_cluster_pairF6_F7  -0.0686673  0.0037889 -18.123  < 2e-16 ***
## Fungal_cluster_pairF6_F8  -0.0246008  0.0028282  -8.698  < 2e-16 ***
## Fungal_cluster_pairF6_F9   0.0163727  0.0024222   6.760 1.40e-11 ***
## Fungal_cluster_pairF7     -0.1096525  0.0047197 -23.233  < 2e-16 ***
## Fungal_cluster_pairF7_F8  -0.0317269  0.0024978 -12.702  < 2e-16 ***
## Fungal_cluster_pairF7_F9  -0.0292020  0.0021605 -13.517  < 2e-16 ***
## Fungal_cluster_pairF8     -0.0402264  0.0031140 -12.918  < 2e-16 ***
## Fungal_cluster_pairF8_F9  -0.0365432  0.0020351 -17.957  < 2e-16 ***
## Fungal_cluster_pairF9     -0.0599562  0.0029984 -19.996  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.06587 on 54418 degrees of freedom
## Multiple R-squared:  0.1323,	Adjusted R-squared:  0.1315 
## F-statistic: 159.6 on 52 and 54418 DF,  p-value: < 2.2e-16
```

- We modeled bacterial turnover (β<sub>sim</sub>) residuals, controlling for: 1) fungal turnover (β<sub>sim</sub>) and 2) regional bacterial species pool similarity, then we tested whether fungal cluster pair identity (i.e. transitions between fungal community states) still explains residual variation in bacterial turnover.

- We calculated R² = 13.2% of the residual variation is still explained by fungal cluster pairing (p < 2e-16, highly significant overall). We also found many specific cluster pair coefficients are strongly negative and highly significant.

- Discussion points: 
These coefficients are the expected change in bacterial turnover (after controlling for fungal β<sub>sim</sub> and regional pool similarity) for each fungal subassemblages pair, compared to the reference level (the intercept), i.e., they quantify the additional, identity-specific effect of transitioning between fungal subassemblages.

Fungal cluster identity still predicts bacterial turnover, even when:
- Fungal compositional turnover is already accounted for
- Regional species pool differences are already accounted for 

This implies that:
Not all fungal turnover is equivalent in its effects on bacterial structure

What fungal state the bacterial community in (e.g., F1 vs F3 vs F7) matters beyond how different the fungal communities are compositionally

There's something about the identity of the fungal clusters/emergent properties of their constituent communities — beyond just their dissimilarity — that influences how bacteria assemble.\
\


Now comparing those results those when controlling for fungal total dissimilarity ( as opposed to turnover) and bacterial regional pool total dissimilarity:


```
## 
## Call:
## lm(formula = Bac_beta_sim_resid ~ Fungal_cluster_pair, data = df_resid2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.26909 -0.04567 -0.00037  0.04650  0.23263 
## 
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                0.0204359  0.0007955  25.690  < 2e-16 ***
## Fungal_cluster_pairF1_F10  0.0066615  0.0014681   4.537 5.71e-06 ***
## Fungal_cluster_pairF1_F2  -0.0511291  0.0024230 -21.102  < 2e-16 ***
## Fungal_cluster_pairF1_F3  -0.0156867  0.0024740  -6.341 2.31e-10 ***
## Fungal_cluster_pairF1_F4  -0.0370087  0.0017721 -20.884  < 2e-16 ***
## Fungal_cluster_pairF1_F5  -0.0304235  0.0019173 -15.868  < 2e-16 ***
## Fungal_cluster_pairF1_F6  -0.0173919  0.0014116 -12.321  < 2e-16 ***
## Fungal_cluster_pairF1_F7  -0.0195874  0.0014103 -13.889  < 2e-16 ***
## Fungal_cluster_pairF1_F8  -0.0279759  0.0012949 -21.604  < 2e-16 ***
## Fungal_cluster_pairF1_F9  -0.0055797  0.0012183  -4.580 4.66e-06 ***
## Fungal_cluster_pairF10    -0.0901808  0.0043726 -20.624  < 2e-16 ***
## Fungal_cluster_pairF10_F2 -0.0436520  0.0108851  -4.010 6.07e-05 ***
## Fungal_cluster_pairF10_F3  0.0444445  0.0026083  17.040  < 2e-16 ***
## Fungal_cluster_pairF10_F4 -0.0009960  0.0024290  -0.410 0.681786    
## Fungal_cluster_pairF10_F5  0.0041735  0.0034512   1.209 0.226553    
## Fungal_cluster_pairF10_F6 -0.0317761  0.0030894 -10.286  < 2e-16 ***
## Fungal_cluster_pairF10_F7 -0.0561588  0.0023993 -23.406  < 2e-16 ***
## Fungal_cluster_pairF10_F8 -0.0256100  0.0022239 -11.516  < 2e-16 ***
## Fungal_cluster_pairF10_F9 -0.0561617  0.0023890 -23.509  < 2e-16 ***
## Fungal_cluster_pairF2_F3   0.0152238  0.0153733   0.990 0.322046    
## Fungal_cluster_pairF2_F4  -0.1016061  0.0097425 -10.429  < 2e-16 ***
## Fungal_cluster_pairF2_F5  -0.0543610  0.0097425  -5.580 2.42e-08 ***
## Fungal_cluster_pairF2_F6  -0.0205953  0.0051790  -3.977 7.00e-05 ***
## Fungal_cluster_pairF2_F7  -0.0226512  0.0060742  -3.729 0.000192 ***
## Fungal_cluster_pairF2_F8  -0.0686934  0.0072809  -9.435  < 2e-16 ***
## Fungal_cluster_pairF2_F9  -0.0420814  0.0046359  -9.077  < 2e-16 ***
## Fungal_cluster_pairF3_F4  -0.0079425  0.0027962  -2.840 0.004507 ** 
## Fungal_cluster_pairF3_F5  -0.0479590  0.0089740  -5.344 9.12e-08 ***
## Fungal_cluster_pairF3_F6  -0.0359411  0.0027943 -12.862  < 2e-16 ***
## Fungal_cluster_pairF3_F7   0.0016466  0.0026661   0.618 0.536830    
## Fungal_cluster_pairF3_F8   0.0058904  0.0024017   2.453 0.014185 *  
## Fungal_cluster_pairF3_F9   0.0557289  0.0025318  22.012  < 2e-16 ***
## Fungal_cluster_pairF4     -0.1109378  0.0097425 -11.387  < 2e-16 ***
## Fungal_cluster_pairF4_F5  -0.0182134  0.0058164  -3.131 0.001741 ** 
## Fungal_cluster_pairF4_F6  -0.0599118  0.0029205 -20.514  < 2e-16 ***
## Fungal_cluster_pairF4_F7  -0.0574511  0.0025588 -22.452  < 2e-16 ***
## Fungal_cluster_pairF4_F8  -0.0838230  0.0023268 -36.026  < 2e-16 ***
## Fungal_cluster_pairF4_F9  -0.0674211  0.0024524 -27.492  < 2e-16 ***
## Fungal_cluster_pairF5     -0.0586659  0.0093772  -6.256 3.97e-10 ***
## Fungal_cluster_pairF5_F6  -0.0998120  0.0039081 -25.540  < 2e-16 ***
## Fungal_cluster_pairF5_F7  -0.1150153  0.0036064 -31.892  < 2e-16 ***
## Fungal_cluster_pairF5_F8  -0.0394160  0.0032952 -11.961  < 2e-16 ***
## Fungal_cluster_pairF5_F9  -0.0189585  0.0028850  -6.571 5.03e-11 ***
## Fungal_cluster_pairF6     -0.0826247  0.0077656 -10.640  < 2e-16 ***
## Fungal_cluster_pairF6_F7  -0.0341321  0.0039495  -8.642  < 2e-16 ***
## Fungal_cluster_pairF6_F8  -0.0256946  0.0029481  -8.716  < 2e-16 ***
## Fungal_cluster_pairF6_F9   0.0253929  0.0025248  10.057  < 2e-16 ***
## Fungal_cluster_pairF7     -0.0685378  0.0049197 -13.931  < 2e-16 ***
## Fungal_cluster_pairF7_F8  -0.0287286  0.0026036 -11.034  < 2e-16 ***
## Fungal_cluster_pairF7_F9  -0.0124825  0.0022520  -5.543 2.99e-08 ***
## Fungal_cluster_pairF8     -0.0750490  0.0032460 -23.121  < 2e-16 ***
## Fungal_cluster_pairF8_F9  -0.0389564  0.0021213 -18.364  < 2e-16 ***
## Fungal_cluster_pairF9     -0.0775758  0.0031255 -24.820  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.06866 on 54418 degrees of freedom
## Multiple R-squared:  0.1434,	Adjusted R-squared:  0.1426 
## F-statistic: 175.2 on 52 and 54418 DF,  p-value: < 2.2e-16
```

Total fungal dissimilarity is slightly more influential over bacterial turnover than fungal turnover. Still, not all fungal compositional dissimilarity is equal.
The identity of the fungal community state (i.e., subassemblage membership) has predictive power over bacterial turnover beyond what is explained by simple differences in fungal composition or site-level species availability. Said differently: Transitions between specific fungal states leave distinct bacterial signatures, even if the fungal communities are equally dissimilar in total composition or shared taxa. Example: F1_F2 vs F1_F5
Both may have similar β<sub>sor</sub>, but the transition F1 → F2 has a much stronger effect on bacterial turnover than F1 → F5. But this might be where we are seeing a host effect - F2 is only SCSC and F5 has SCSC, BOER, and BOGR. 





What about bacterial total dissimilarity?


```
## 
## Call:
## lm(formula = Bac_beta_sor_resid ~ Fungal_cluster_pair, data = df_resid3)
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.257806 -0.036063 -0.000083  0.037135  0.209522 
## 
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                0.0155412  0.0006483  23.972  < 2e-16 ***
## Fungal_cluster_pairF1_F10 -0.0057449  0.0011965  -4.801 1.58e-06 ***
## Fungal_cluster_pairF1_F2  -0.0374382  0.0019747 -18.959  < 2e-16 ***
## Fungal_cluster_pairF1_F3   0.0812394  0.0020163  40.292  < 2e-16 ***
## Fungal_cluster_pairF1_F4  -0.0148177  0.0014442 -10.260  < 2e-16 ***
## Fungal_cluster_pairF1_F5  -0.0358378  0.0015626 -22.935  < 2e-16 ***
## Fungal_cluster_pairF1_F6  -0.0208762  0.0011504 -18.147  < 2e-16 ***
## Fungal_cluster_pairF1_F7  -0.0245058  0.0011494 -21.321  < 2e-16 ***
## Fungal_cluster_pairF1_F8  -0.0249636  0.0010554 -23.654  < 2e-16 ***
## Fungal_cluster_pairF1_F9  -0.0163813  0.0009929 -16.499  < 2e-16 ***
## Fungal_cluster_pairF10    -0.0920758  0.0035636 -25.838  < 2e-16 ***
## Fungal_cluster_pairF10_F2 -0.0098479  0.0088712  -1.110    0.267    
## Fungal_cluster_pairF10_F3  0.0505642  0.0021257  23.787  < 2e-16 ***
## Fungal_cluster_pairF10_F4 -0.0190560  0.0019796  -9.626  < 2e-16 ***
## Fungal_cluster_pairF10_F5 -0.0235042  0.0028127  -8.357  < 2e-16 ***
## Fungal_cluster_pairF10_F6 -0.0101822  0.0025178  -4.044 5.26e-05 ***
## Fungal_cluster_pairF10_F7 -0.0517210  0.0019554 -26.450  < 2e-16 ***
## Fungal_cluster_pairF10_F8 -0.0232045  0.0018125 -12.803  < 2e-16 ***
## Fungal_cluster_pairF10_F9 -0.0570092  0.0019470 -29.281  < 2e-16 ***
## Fungal_cluster_pairF2_F3   0.1231597  0.0125291   9.830  < 2e-16 ***
## Fungal_cluster_pairF2_F4  -0.0347378  0.0079400  -4.375 1.22e-05 ***
## Fungal_cluster_pairF2_F5  -0.0406306  0.0079400  -5.117 3.11e-07 ***
## Fungal_cluster_pairF2_F6  -0.0563484  0.0042208 -13.350  < 2e-16 ***
## Fungal_cluster_pairF2_F7  -0.0328150  0.0049503  -6.629 3.42e-11 ***
## Fungal_cluster_pairF2_F8  -0.0972497  0.0059339 -16.389  < 2e-16 ***
## Fungal_cluster_pairF2_F9  -0.0394175  0.0037782 -10.433  < 2e-16 ***
## Fungal_cluster_pairF3_F4   0.0204802  0.0022789   8.987  < 2e-16 ***
## Fungal_cluster_pairF3_F5  -0.0077461  0.0073137  -1.059    0.290    
## Fungal_cluster_pairF3_F6   0.0389200  0.0022773  17.090  < 2e-16 ***
## Fungal_cluster_pairF3_F7   0.0518838  0.0021729  23.878  < 2e-16 ***
## Fungal_cluster_pairF3_F8   0.0439946  0.0019573  22.477  < 2e-16 ***
## Fungal_cluster_pairF3_F9   0.0754474  0.0020634  36.565  < 2e-16 ***
## Fungal_cluster_pairF4     -0.0418579  0.0079400  -5.272 1.36e-07 ***
## Fungal_cluster_pairF4_F5  -0.0325138  0.0047403  -6.859 7.01e-12 ***
## Fungal_cluster_pairF4_F6  -0.0155051  0.0023801  -6.514 7.36e-11 ***
## Fungal_cluster_pairF4_F7  -0.0225397  0.0020854 -10.808  < 2e-16 ***
## Fungal_cluster_pairF4_F8  -0.0517862  0.0018963 -27.309  < 2e-16 ***
## Fungal_cluster_pairF4_F9  -0.0461854  0.0019987 -23.108  < 2e-16 ***
## Fungal_cluster_pairF5     -0.0720443  0.0076423  -9.427  < 2e-16 ***
## Fungal_cluster_pairF5_F6  -0.0743485  0.0031850 -23.343  < 2e-16 ***
## Fungal_cluster_pairF5_F7  -0.0897576  0.0029391 -30.539  < 2e-16 ***
## Fungal_cluster_pairF5_F8  -0.0378527  0.0026856 -14.095  < 2e-16 ***
## Fungal_cluster_pairF5_F9  -0.0288196  0.0023512 -12.257  < 2e-16 ***
## Fungal_cluster_pairF6     -0.0859069  0.0063289 -13.574  < 2e-16 ***
## Fungal_cluster_pairF6_F7  -0.0327010  0.0032188 -10.160  < 2e-16 ***
## Fungal_cluster_pairF6_F8  -0.0304913  0.0024026 -12.691  < 2e-16 ***
## Fungal_cluster_pairF6_F9   0.0161886  0.0020577   7.867 3.69e-15 ***
## Fungal_cluster_pairF7     -0.0636573  0.0040095 -15.877  < 2e-16 ***
## Fungal_cluster_pairF7_F8  -0.0345887  0.0021219 -16.301  < 2e-16 ***
## Fungal_cluster_pairF7_F9  -0.0204164  0.0018354 -11.124  < 2e-16 ***
## Fungal_cluster_pairF8     -0.0633510  0.0026454 -23.947  < 2e-16 ***
## Fungal_cluster_pairF8_F9  -0.0410799  0.0017288 -23.762  < 2e-16 ***
## Fungal_cluster_pairF9     -0.0709016  0.0025472 -27.835  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.05596 on 54418 degrees of freedom
## Multiple R-squared:  0.2233,	Adjusted R-squared:  0.2226 
## F-statistic: 300.9 on 52 and 54418 DF,  p-value: < 2.2e-16
```

higher, cool. Controlling for host-effect now:


```
## 
## Call:
## lm(formula = Bac_sor_resid_grass ~ Fungal_cluster_pair, data = df_resid_grass_sor)
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.244679 -0.034205 -0.001061  0.033724  0.198605 
## 
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                0.0145362  0.0005980  24.306  < 2e-16 ***
## Fungal_cluster_pairF1_F10 -0.0002785  0.0011038  -0.252 0.800768    
## Fungal_cluster_pairF1_F2  -0.0407429  0.0018216 -22.366  < 2e-16 ***
## Fungal_cluster_pairF1_F3   0.0693351  0.0018600  37.277  < 2e-16 ***
## Fungal_cluster_pairF1_F4  -0.0152797  0.0013323 -11.469  < 2e-16 ***
## Fungal_cluster_pairF1_F5  -0.0252124  0.0014415 -17.491  < 2e-16 ***
## Fungal_cluster_pairF1_F6  -0.0316143  0.0010612 -29.790  < 2e-16 ***
## Fungal_cluster_pairF1_F7  -0.0149902  0.0010603 -14.138  < 2e-16 ***
## Fungal_cluster_pairF1_F8  -0.0335921  0.0009736 -34.505  < 2e-16 ***
## Fungal_cluster_pairF1_F9  -0.0086659  0.0009159  -9.462  < 2e-16 ***
## Fungal_cluster_pairF10    -0.0469039  0.0032874 -14.268  < 2e-16 ***
## Fungal_cluster_pairF10_F2 -0.0142807  0.0081836  -1.745 0.080983 .  
## Fungal_cluster_pairF10_F3  0.0463410  0.0019609  23.632  < 2e-16 ***
## Fungal_cluster_pairF10_F4 -0.0285556  0.0018261 -15.637  < 2e-16 ***
## Fungal_cluster_pairF10_F5  0.0233749  0.0025946   9.009  < 2e-16 ***
## Fungal_cluster_pairF10_F6 -0.0190414  0.0023226  -8.198 2.49e-16 ***
## Fungal_cluster_pairF10_F7 -0.0224133  0.0018039 -12.425  < 2e-16 ***
## Fungal_cluster_pairF10_F8 -0.0385337  0.0016720 -23.047  < 2e-16 ***
## Fungal_cluster_pairF10_F9 -0.0308032  0.0017961 -17.150  < 2e-16 ***
## Fungal_cluster_pairF2_F3   0.1248669  0.0115579  10.804  < 2e-16 ***
## Fungal_cluster_pairF2_F4  -0.0322347  0.0073245  -4.401 1.08e-05 ***
## Fungal_cluster_pairF2_F5  -0.0362838  0.0073245  -4.954 7.30e-07 ***
## Fungal_cluster_pairF2_F6  -0.0643813  0.0038937 -16.535  < 2e-16 ***
## Fungal_cluster_pairF2_F7  -0.0310564  0.0045666  -6.801 1.05e-11 ***
## Fungal_cluster_pairF2_F8  -0.0972474  0.0054739 -17.766  < 2e-16 ***
## Fungal_cluster_pairF2_F9  -0.0395984  0.0034853 -11.361  < 2e-16 ***
## Fungal_cluster_pairF3_F4   0.0073773  0.0021022   3.509 0.000450 ***
## Fungal_cluster_pairF3_F5  -0.0148278  0.0067468  -2.198 0.027971 *  
## Fungal_cluster_pairF3_F6   0.0239312  0.0021008  11.392  < 2e-16 ***
## Fungal_cluster_pairF3_F7   0.0520707  0.0020044  25.978  < 2e-16 ***
## Fungal_cluster_pairF3_F8   0.0322785  0.0018056  17.877  < 2e-16 ***
## Fungal_cluster_pairF3_F9   0.0736665  0.0019034  38.702  < 2e-16 ***
## Fungal_cluster_pairF4     -0.0518947  0.0073245  -7.085 1.41e-12 ***
## Fungal_cluster_pairF4_F5  -0.0198160  0.0043729  -4.532 5.87e-06 ***
## Fungal_cluster_pairF4_F6  -0.0236030  0.0021956 -10.750  < 2e-16 ***
## Fungal_cluster_pairF4_F7  -0.0235911  0.0019238 -12.263  < 2e-16 ***
## Fungal_cluster_pairF4_F8  -0.0611967  0.0017493 -34.984  < 2e-16 ***
## Fungal_cluster_pairF4_F9  -0.0469254  0.0018437 -25.451  < 2e-16 ***
## Fungal_cluster_pairF5     -0.0444327  0.0070499  -6.303 2.95e-10 ***
## Fungal_cluster_pairF5_F6  -0.0836759  0.0029381 -28.479  < 2e-16 ***
## Fungal_cluster_pairF5_F7  -0.0608788  0.0027113 -22.454  < 2e-16 ***
## Fungal_cluster_pairF5_F8  -0.0481399  0.0024774 -19.432  < 2e-16 ***
## Fungal_cluster_pairF5_F9  -0.0010221  0.0021690  -0.471 0.637461    
## Fungal_cluster_pairF6     -0.1020882  0.0058383 -17.486  < 2e-16 ***
## Fungal_cluster_pairF6_F7  -0.0402868  0.0029693 -13.568  < 2e-16 ***
## Fungal_cluster_pairF6_F8  -0.0396996  0.0022164 -17.912  < 2e-16 ***
## Fungal_cluster_pairF6_F9   0.0072492  0.0018982   3.819 0.000134 ***
## Fungal_cluster_pairF7     -0.0356544  0.0036987  -9.640  < 2e-16 ***
## Fungal_cluster_pairF7_F8  -0.0389303  0.0019575 -19.888  < 2e-16 ***
## Fungal_cluster_pairF7_F9   0.0056223  0.0016931   3.321 0.000899 ***
## Fungal_cluster_pairF8     -0.0723700  0.0024404 -29.655  < 2e-16 ***
## Fungal_cluster_pairF8_F9  -0.0491562  0.0015948 -30.822  < 2e-16 ***
## Fungal_cluster_pairF9     -0.0482688  0.0023498 -20.542  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.05162 on 54418 degrees of freedom
## Multiple R-squared:  0.2317,	Adjusted R-squared:  0.231 
## F-statistic: 315.6 on 52 and 54418 DF,  p-value: < 2.2e-16
```

After controlling for:
    - Fungal compositional dissimilarity (β<sub>sor</sub>)
    - Regional bacterial species pool similarity (pool β<sub>sor</sub>)
    - Plant host identity (Grass_pair)

We modeled the residual bacterial dissimilarity (β<sub>sor</sub>) and asked:

Does fungal subassemblage identity (cluster pairing) still explain variation?
- A: yes! 23.1%!\

Emergent properties of fungal subassemblages reveal how fungal communities serve as the architects of bacterial community structure, even after controlling for fungal compositional dissimilarity, the regional species of bacteria, and the plant host identity. 

This means:
- The identity of the fungal community state, not just its composition or distance, matters for bacterial assembly
- Some transitions between fungal clusters lead to consistently greater bacterial restructuring, others to less
- This is not explained by host plant or species pool availability

What remains is fungal subassemblage-specific filtering of bacterial turnover

This is our BFI angle... a cross-site, compositional and identity-level signal in bacterial community outcomes.
What do we mean by an "identity-level signal"?
In this context, we’re distinguishing between:

1. Compositional dissimilarity (β<sub>sor</sub>)
How different are two fungal communities based on species presence/absence?

This tells us how much communities differ, but not who they are.

2. Subassemblage identity (e.g., F1, F2, F3...)
What discrete community state (cluster) is a sample in?

This is a qualitative label that groups communities with similar structure and presumed function or assembly history.

-> Does the identity of the fungal cluster pair (e.g., F1 vs F3) explain bacterial turnover after controlling for how different those communities are compositionally?

And the answer is yes — substantially so.
This is not just a beta-diversity correlation. This is a much stronger ecological statement:

🔹 Two fungal sample pairs with the same β<sub>sor</sub> can have:
Very different fungal cluster pairings (e.g., F1 vs F2 vs F3 vs F7)

Very different impacts on bacterial turnover

→ That means the community state itself matters, not just the dissimilarity.

Why fungal identity might matter beyond composition:
1. Functional differences among clusters
F1 and F3 may have distinct dominant guilds (e.g., symbionts, decomposers, pathogens)

→ Even if two clusters are equally dissimilar, transitions involving functionally distinct states will have different effects on bacteria.

2. Differences in ecological assembly rules
One cluster might be dispersal-limited, another environmentally filtered

Or one is a stable attractor state, the other a transient stage

These properties can influence how predictable and structured the associated bacterial community is.

3. Fungal clusters as habitat templates
Fungal communities aren’t just biomass — they structure the rhizosphere

They influence carbon flow, exudates, hyphal networks, redox microenvironments

Different fungal states = different bacterial niches, even if compositionally similar

Implications: 
Bacterial community assembly is sensitive to the identity of the fungal biotic environment, not just to compositional gradients or environmental/host context.

This supports the idea that fungal clusters act as filtering regimes — discrete, recognizable, and functionally important community states that structure bacterial turnover.

This identity-level structuring effect is:
    - Cross-site
    - Host-independent (controlled for Grass)
    - Not a compositional artifact (controlled for β<sub>sor</sub>)
    - Not a biogeographic artifact (controlled for species pool)
\
\



# Distance–Decay Plots

Pairwise spatial vs ecological distance
Regression (linear or exponential decay or loess)

### Spatial distance matrices and decay modeling



#### Methods

To assess **isolation by distance**, we constructed a geographic distance matrix (`GeoDist`) representing the pairwise Euclidean distances (in kilometers) between all sample locations, derived from sample coordinates.

We evaluated **spatial structure in ecological dissimilarity** by modeling pairwise community dissimilarity (e.g., Bray–Curtis) as a function of geographic distance. This framework quantifies spatial dependence in compositional variation, consistent with expectations under dispersal limitation or spatially structured environmental filtering.

To characterize the form of spatial decay, we fit multiple models, including **linear regression**, **log-linear regression** (exponential decay), and **non-parametric LOESS smoothing**. Model performance was compared visually, and significance of spatial structure was assessed using **Mantel tests**, which evaluate global correlation between distance matrices [@borcard2018numerical].

Because geographic distance is often correlated with other spatially structured variables (e.g., climate, edaphic gradients, host identity), we first tested the spatial structure of each **explanatory distance matrix** by modeling it as a function of geographic distance. Where spatial autocorrelation was present, we applied **spatial detrending**: the explanatory distance matrix was regressed against geographic distance, and the residuals were retained. These **spatially detrended explanatory matrices** represent the variation independent of spatial position, following recommended procedures for controlling spatial structure in distance-based modeling [@borcard2018numerical].

These detrended explanatory matrices (e.g., climatic dissimilarity, environmental gradients, trait distances) were then used in place of geographic distance to model ecological dissimilarity. This allowed us to test whether **non-spatial drivers** explain variation in community structure after accounting for the spatial component.

#### Results: Spatial dependence and explanatory dissimilarity

Pairwise ecological dissimilarity increased with geographic distance, consistent with **spatially structured variation** in community composition.  
Mantel tests confirmed significant associations between ecological and geographic distances across all groups (*r* = [...], *p* = [...]), indicating spatial autocorrelation in community dissimilarity.

Decay model fits revealed [linear / exponential / non-linear] patterns depending on group, with [group A] showing [steeper / flatter] decay relative to [group B]. The fitted LOESS models suggested [continuous / threshold-like / saturating] decay in ecological dissimilarity with spatial separation.

Several **explanatory dissimilarity matrices** (e.g., [climate, environment, trait]) also exhibited significant spatial structure when modeled as a function of geographic distance, indicating that spatial position may confound their ecological effects.

To account for this, each explanatory distance matrix was **spatially detrended** using regression against geographic distance, and the residuals were retained. These residualized matrices represent **non-spatial components** of the explanatory variables [@borcard2018numerical].

When these detrended matrices were used to model ecological dissimilarity, we observed [stronger / weaker / similar] patterns relative to models using raw explanatory distances. This suggests that [spatial autocorrelation / non-spatial environmental gradients] explain a substantial portion of the observed ecological variation.


#### Figures and Tables



## Spatial Correlogram
Moran’s I or Mantel-based correlogram
Evaluate autocorrelation over distance lags

## maybe? aes_group_order, aes_position, isoreg {stats} Isotonic / Monotone Regression
Description
Compute the isotonic (monotonically increasing nonparametric) least squares regression which is piecewise constant.





