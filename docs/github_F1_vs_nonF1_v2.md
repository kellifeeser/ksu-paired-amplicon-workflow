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





