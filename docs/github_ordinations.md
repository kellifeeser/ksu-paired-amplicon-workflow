---
title: "**KSU paired amplicon community ordinations**"
subtitle: "Comparative NMDS plots of 16S and ITS data (EDGE samples excluded), updated to include adonis2 analyses (permANOVA by metadata)"
author: "Kelli Feeser"
date: '2023-10-02'
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 2
    fig.caption: yes
    keep_md: yes
  html_document: 
    code_folding: hide
    css: test.css
    fig_height: 4
    fig_width: 5.5
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 2
  html_notebook:
    code_folding: hide
    df_print: paged
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 2
editor_options:
  chunk_output_type: inline
---

<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank">Back to Home</a>


```r
opts <- options(knitr.kable.NA = "")
```





# Set-up {.unlisted}

## Import clean OTU tables {.unlisted}







\

## Ordinate all grasses and by-host (trying k 1-7) {.unlisted}















\

## QC, stress check and validation of ordinations {.unlisted}




```r
ord_checkfit_df = data.frame()

for (name in comm.ord.names.by.grass) {
  
  output = extract.nmds.checkfit(get(name))

  ord_checkfit_df = rbind(ord_checkfit_df, output)

}
```


```r
# Ideal stress value is < 0.05 (but k > 5 makes interpretation difficult)
    # Higher than 0.2 is poor (risks for false interpretation).
    # 0.1 - 0.2 is fair (some distances can be misleading for interpretation).
    # 0.05 - 0.1 is good (can be confident in inferences from plot).
    # Less than 0.05 is excellent (this can be rare).


ord_checkfit_df$stress<-round(ord_checkfit_df$stress,3)
ord_checkfit_df$nonmetric.fit.r2<-round(ord_checkfit_df$nonmetric.fit.r2,3)
ord_checkfit_df$linear.fit.r2<-round(ord_checkfit_df$linear.fit.r2,3)


# Final choices on k values

## AllG
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[1])
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[2])
  
  # flipping x axis coords for ease of interpretation
    # Fun.AllG.k5.ord$points[,1]<-Fun.AllG.k5.ord$points[,1]*-1 # already done
  
  saveRDS(Bac.AllG.k5.ord, file="../processed_data/clean_rds_saves/Bac.AllG.k5.ord.rds")
  saveRDS(Fun.AllG.k5.ord, file="../processed_data/clean_rds_saves/Fun.AllG.k5.ord.rds")

## ANGE
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[3])
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[4])
  
  #flip x coord of ITS Fun.ANGE.k5.ord
     # Fun.ANGE.k5.ord$points[,1]<-Fun.ANGE.k5.ord$points[,1]*-1 # already done
  
  saveRDS(Bac.ANGE.k5.ord, file="../processed_data/clean_rds_saves/Bac.ANGE.k5.ord.rds")
  saveRDS(Fun.ANGE.k5.ord, file="../processed_data/clean_rds_saves/Fun.ANGE.k5.ord.rds")

## BOER
  saveRDS(Bac.BOER.k5.ord, file="../processed_data/clean_rds_saves/Bac.BOER.k5.ord.rds")
  saveRDS(Fun.BOER.k5.ord, file="../processed_data/clean_rds_saves/Fun.BOER.k5.ord.rds")

## BOGR
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[7])
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[8])
  
  saveRDS(Bac.BOGR.k5.ord, file="../processed_data/clean_rds_saves/Bac.BOGR.k5.ord.rds")
  saveRDS(Fun.BOGR.k5.ord, file="../processed_data/clean_rds_saves/Fun.BOGR.k5.ord.rds")

## BUDA
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[9])
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[10])
  
  # flipping y axis coords for ease of interpretation
    # Fun.BUDA.k6.ord$points[,2]<-Fun.BUDA.k6.ord$points[,2]*-1 # already done
  
  saveRDS(Bac.BUDA.k6.ord, file="../processed_data/clean_rds_saves/Bac.BUDA.k6.ord.rds")
  saveRDS(Fun.BUDA.k6.ord, file="../processed_data/clean_rds_saves/Fun.BUDA.k6.ord.rds")

## SCSC
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[11])
  subset(ord_checkfit_df,ord_checkfit_df$input_data==comm.names.by.grass[12])
  
  saveRDS(Bac.SCSC.k5.ord, file="../processed_data/clean_rds_saves/Bac.SCSC.k5.ord.rds")
  saveRDS(Fun.SCSC.k5.ord, file="../processed_data/clean_rds_saves/Fun.SCSC.k5.ord.rds")
```





\

## Set-up metadata {.unlisted}

Available metadata:


```
##  [1] "SampleID"       "ITS_ID"         "sample_name"   
##  [4] "Replicate"      "Site"           "Site_Grass"    
##  [7] "Site.Rep"       "Grass"          "Grass_Rep"     
## [10] "Edge"           "SiteName"       "MAT_degC"      
## [13] "MAP_mm"         "CollectionDate" "Latitude"      
## [16] "Longitude"      "Elevation_m"    "Grassland"     
## [19] "Gradient"       "Bin"            "julianday"     
## [22] "coll_GDD"       "GDD30yr"        "GDD3yr"        
## [25] "GDD2015"        "ppt30yr"        "ppt3yr"        
## [28] "ppt2015"        "soil_moisture"  "GWC"           
## [31] "perc_moisture"  "pH"             "phos"          
## [34] "ammonium"       "nitrate"        "SOM"           
## [37] "herbivory_perc" "avg_SLA"        "avg_SRL"
```

\

## adonis2 tables {.unlisted .unnumbered .hidden}

### by grass {.unlisted .unnumbered .hidden}



\

### by Bin {.unlisted .unnumbered .hidden}



### by Gradient {.unlisted .unnumbered .hidden}



\

### save adonis2 outputs {.unlisted .unnumbered}





## Generate plots for later viewing {.unlisted .unnumbered .hidden}

### color by grass {.unlisted .unnumbered}



### color by bin {.unlisted .unnumbered}













### color by gradient {.unlisted .unnumbered}













# Data overview {.tabset .tabset-pills}

All EDGE samples excluded\
OTU tables rarefied (16S: 9,048 & ITS: 10,116 seqs/sample\
'Taxa' are OTUs\

## AllG (All Grasses) {.unnumbered}

**Bacterial & Archaeal Dataset:**


```r
Bac.AllG
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 23156 taxa and 533 samples ]
## sample_data() Sample Data:       [ 533 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 23156 taxa by 6 taxonomic ranks ]
```

\

**Fungal Dataset:**


```r
Fun.AllG
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 6749 taxa and 509 samples ]
## sample_data() Sample Data:       [ 509 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 6749 taxa by 7 taxonomic ranks ]
```

\

## ANGE (*Andropogon gerardii* / Big bluestem) {.unnumbered}

**Bacterial & Archaeal Dataset:**


```r
Bac.ANGE
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 14268 taxa and 106 samples ]
## sample_data() Sample Data:       [ 106 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 14268 taxa by 6 taxonomic ranks ]
```

\

**Fungal Dataset:**


```r
Fun.ANGE
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 2985 taxa and 98 samples ]
## sample_data() Sample Data:       [ 98 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 2985 taxa by 7 taxonomic ranks ]
```

\

## BOER (*B. eriopoda* / Black grama) {.unnumbered}

**Bacterial & Archaeal Dataset:**


```r
Bac.BOER
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 8374 taxa and 84 samples ]
## sample_data() Sample Data:       [ 84 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 8374 taxa by 6 taxonomic ranks ]
```

\

**Fungal Dataset:**


```r
Fun.BOER
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 1662 taxa and 78 samples ]
## sample_data() Sample Data:       [ 78 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 1662 taxa by 7 taxonomic ranks ]
```

\

## BOGR (*B. gracilis* / Blue grama) {.unnumbered}

**Bacterial & Archaeal Dataset:**


```r
Bac.BOGR
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 10108 taxa and 86 samples ]
## sample_data() Sample Data:       [ 86 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 10108 taxa by 6 taxonomic ranks ]
```

\

**Fungal Dataset:**


```r
Fun.BOGR
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 2668 taxa and 92 samples ]
## sample_data() Sample Data:       [ 92 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 2668 taxa by 7 taxonomic ranks ]
```

\

## BUDA (*Bouteloua dactyloides* / Buffalograss) {.unnumbered}

**Bacterial & Archaeal Dataset:**


```r
Bac.BUDA
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 11048 taxa and 83 samples ]
## sample_data() Sample Data:       [ 83 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 11048 taxa by 6 taxonomic ranks ]
```

\

**Fungal Dataset:**


```r
Fun.BUDA
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 2369 taxa and 80 samples ]
## sample_data() Sample Data:       [ 80 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 2369 taxa by 7 taxonomic ranks ]
```

\

## SCSC (*Schizachyrium scoparium* / Little bluestem) {.unnumbered}

**Bacterial & Archaeal Dataset:**


```r
Bac.SCSC
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 17568 taxa and 174 samples ]
## sample_data() Sample Data:       [ 174 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 17568 taxa by 6 taxonomic ranks ]
```

\

**Fungal Dataset:**


```r
Fun.SCSC
```

```
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 4347 taxa and 161 samples ]
## sample_data() Sample Data:       [ 161 samples by 39 sample variables ]
## tax_table()   Taxonomy Table:    [ 4347 taxa by 7 taxonomic ranks ]
```

\

# NMDS By Grass Host

\
- ANGE (*Andropogon gerardii* / Big bluestem)\
- SCSC (*Schizachyrium scoparium* / Little bluestem)\
- BOER (*B. eriopoda* / Black grama)\
- BOGR (*B. gracilis* / Blue grama)\
- BUDA (*Bouteloua dactyloides* / Buffalograss)\
\

![NMDS plots of all samples, colored by grass host](../analyses/ordinations/NMDS_AllG_colorGrass.png){out.width="400px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGrass, 
                    comm==comm.names.by.grass[1])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2        F      Pr(>F) 
------------------  -----  ----------  -------  -------  --------
Bac.AllG.Grass        4       18.6      0.132    20.12    0.001  
Bac.AllG.Residual    528     122.2      0.868                    
Bac.AllG.Total       532     140.8      1.000                    

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGrass, 
                    comm==comm.names.by.grass[2])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2       F      Pr(>F) 
------------------  -----  ----------  -------  ------  --------
Fun.AllG.Grass        4       13.2      0.064    8.67    0.001  
Fun.AllG.Residual    504     192.5      0.936                   
Fun.AllG.Total       508     205.7      1.000                   

# Subset by Grass Host

## Colored by Latitudinal Bin {.tabset .tabset-pills}

### AllG (All Grasses) {.unnumbered}

![NMDS plots of all samples, colored by latitudinal bin](../analyses/ordinations/NMDS_AllG_colorBin.png){out.width="400px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[1])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2        F      Pr(>F) 
------------------  -----  ----------  -------  -------  --------
Bac.AllG.Bin          3       7.9       0.056    10.48    0.001  
Bac.AllG.Residual    529     132.9      0.944                    
Bac.AllG.Total       532     140.8      1.000                    

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[2])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2       F      Pr(>F) 
------------------  -----  ----------  -------  ------  --------
Fun.AllG.Bin          3       11.3      0.055    9.79    0.001  
Fun.AllG.Residual    505     194.4      0.945                   
Fun.AllG.Total       508     205.7      1.000                   

### ANGE (*Andropogon gerardii* / Big bluestem) {.unnumbered}

![NMDS plots of ANGE host-associated samples, colored by latitudinal bin](../analyses/ordinations/NMDS_ANGE_colorBin.png){out.height="50%"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[3])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2       F      Pr(>F) 
------------------  -----  ----------  -------  ------  --------
Bac.ANGE.Bin          3       4.4       0.157    6.33    0.001  
Bac.ANGE.Residual    102      23.8      0.843                   
Bac.ANGE.Total       105      28.2      1.000                   

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[4])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Fun.ANGE.Bin         3       6.4       0.174    6.59    0.001  
Fun.ANGE.Residual    94      30.6      0.826                   
Fun.ANGE.Total       97      37.0      1.000                   

### BOER (*B. eriopoda* / Black grama) {.unnumbered}

![NMDS plots of BOER host-associated samples, colored by latitudinal bin](../analyses/ordinations/NMDS_BOER_colorBin.png){out.width="400px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[5])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2        F      Pr(>F) 
------------------  ----  ----------  -------  -------  --------
Bac.BOER.Bin         3        6        0.354    14.58    0.001  
Bac.BOER.Residual    80       11       0.646                    
Bac.BOER.Total       83       17       1.000                    

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[6])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Fun.BOER.Bin         3       5.4       0.194    5.94    0.001  
Fun.BOER.Residual    74      22.3      0.806                   
Fun.BOER.Total       77      27.7      1.000                   

### BOGR (*B. gracilis* / Blue grama) {.unnumbered}

![NMDS plots of BOGR host-associated samples, colored by latitudinal bin](../analyses/ordinations/NMDS_BOGR_colorBin.png){out.width="400px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[7])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Bac.BOGR.Bin         3       2.9       0.168    5.51    0.001  
Bac.BOGR.Residual    82      14.3      0.832                   
Bac.BOGR.Total       85      17.2      1.000                   

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[8])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Fun.BOGR.Bin         3       4.0       0.126    4.24    0.001  
Fun.BOGR.Residual    88      27.7      0.874                   
Fun.BOGR.Total       91      31.8      1.000                   

### BUDA (*Bouteloua dactyloides* / Buffalograss) {.unnumbered}

![NMDS plots of BUDA host-associated samples, colored by latitudinal bin](../analyses/ordinations/NMDS_BUDA_colorBin.png){out.width="400px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[9])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Bac.BUDA.Bin         3       2.6       0.171    5.45    0.001  
Bac.BUDA.Residual    79      12.4      0.829                   
Bac.BUDA.Total       82      15.0      1.000                   

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[10])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2      F      Pr(>F) 
------------------  ----  ----------  ------  ------  --------
Fun.BUDA.Bin         3       4.3       0.14    4.11    0.001  
Fun.BUDA.Residual    76      26.5      0.86                   
Fun.BUDA.Total       79      30.8      1.00                   

### SCSC (*Schizachyrium scoparium* / Little bluestem) {.unnumbered}

![NMDS plots of SCSC host-associated samples, colored by latitudinal bin](../analyses/ordinations/NMDS_SCSC_colorBin.png){out.width="400px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[11])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2      F      Pr(>F) 
------------------  -----  ----------  ------  ------  --------
Bac.SCSC.Bin          3       4.0       0.09    5.58    0.001  
Bac.SCSC.Residual    170      40.8      0.91                   
Bac.SCSC.Total       173      44.8      1.00                   

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predBin, 
                    comm==comm.names.by.grass[12])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2       F      Pr(>F) 
------------------  -----  ----------  -------  ------  --------
Fun.SCSC.Bin          3       5.3       0.081    4.62    0.001  
Fun.SCSC.Residual    157      60.0      0.919                   
Fun.SCSC.Total       160      65.3      1.000                   

\

## Colored by Longitudinal Gradient {.tabset .tabset-pills}

### AllG (All Grasses) {.unnumbered}

![NMDS plots of all samples, colored by longitudinal gradient](../analyses/ordinations/NMDS_AllG_colorGradient.png){out.width="600px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[1])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2        F      Pr(>F) 
------------------  -----  ----------  -------  -------  --------
Bac.AllG.Gradient     2       17.5      0.124    37.57    0.001  
Bac.AllG.Residual    530     123.3      0.876                    
Bac.AllG.Total       532     140.8      1.000                    

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[2])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2       F      Pr(>F) 
------------------  -----  ----------  ------  -------  --------
Fun.AllG.Gradient     2       10.4      0.05    13.45    0.001  
Fun.AllG.Residual    506     195.3      0.95                    
Fun.AllG.Total       508     205.7      1.00                    

### ANGE (*Andropogon gerardii* / Big bluestem) {.unnumbered}

![NMDS plots of ANGE host-associated samples, colored by longitudinal gradient](../analyses/ordinations/NMDS_ANGE_colorGradient.png){out.width="600px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[3])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs    R2       F      Pr(>F) 
------------------  -----  ----------  -----  -------  --------
Bac.ANGE.Gradient     1       2.8       0.1    11.62    0.001  
Bac.ANGE.Residual    104      25.4      0.9                    
Bac.ANGE.Total       105      28.2      1.0                    

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[4])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2      F      Pr(>F) 
------------------  ----  ----------  ------  ------  --------
Fun.ANGE.Gradient    1       1.8       0.05    5.04    0.001  
Fun.ANGE.Residual    96      35.2      0.95                   
Fun.ANGE.Total       97      37.0      1.00                   

### BOER (*B. eriopoda* / Black grama) {.unnumbered}

![NMDS plots of BOER host-associated samples, colored by longitudinal gradient](../analyses/ordinations/NMDS_BOER_colorGradient.png){out.width="600px"}\
\
\
\
\
\
\

<p class="text-center" style="background-color: aliceblue">**[NA on stats here - only 1 factor level]**</p>

\
\
\
\
\
\
\
\
\
\
\


```r
# knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
#                     comm==comm.names.by.grass[5])))[,1:5], "simple", 
#              digits =c (0,1,3,2,3), 
#              align = 'c')

# knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
#                     comm==comm.names.by.grass[6])))[,1:5], "simple", 
#              digits =c (0,1,3,2,3), 
#              align = 'c')
```

### BOGR (*B. gracilis* / Blue grama) {.unnumbered}

![NMDS plots of BOGR host-associated samples, colored by longitudinal gradient](../analyses/ordinations/NMDS_BOGR_colorGradient.png){out.width="600px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[7])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Bac.BOGR.Gradient    2       2.6       0.152    7.45    0.001  
Bac.BOGR.Residual    83      14.5      0.848                   
Bac.BOGR.Total       85      17.2      1.000                   

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[8])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Fun.BOGR.Gradient    2       3.5       0.109    5.46    0.001  
Fun.BOGR.Residual    89      28.3      0.891                   
Fun.BOGR.Total       91      31.8      1.000                   

### BUDA (*Bouteloua dactyloides* / Buffalograss) {.unnumbered}

![NMDS plots of BUDA host-associated samples, colored by longitudinal gradient](../analyses/ordinations/NMDS_BUDA_colorGradient.png){out.width="600px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[9])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F     Pr(>F) 
------------------  ----  ----------  -------  -----  --------
Bac.BUDA.Gradient    2       2.6       0.172    8.3    0.001  
Bac.BUDA.Residual    80      12.4      0.828                  
Bac.BUDA.Total       82      15.0      1.000                  

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[10])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df    SumOfSqs     R2       F      Pr(>F) 
------------------  ----  ----------  -------  ------  --------
Fun.BUDA.Gradient    2       3.0       0.097    4.14    0.001  
Fun.BUDA.Residual    77      27.8      0.903                   
Fun.BUDA.Total       79      30.8      1.000                   

### SCSC (*Schizachyrium scoparium* / Little bluestem) {.unnumbered}

![NMDS plots of SCSC host-associated samples, colored by longitudinal gradient](../analyses/ordinations/NMDS_SCSC_colorGradient.png){out.width="600px"}


```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[11])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2        F      Pr(>F) 
------------------  -----  ----------  -------  -------  --------
Bac.SCSC.Gradient     2       5.9       0.131    12.93    0.001  
Bac.SCSC.Residual    171      38.9      0.869                    
Bac.SCSC.Total       173      44.8      1.000                    

```r
knitr::kable((as.data.frame(subset(adonis.out.array_predGradient, 
                    comm==comm.names.by.grass[12])))[,1:5], "simple", 
             digits =c (0,1,3,2,3), 
             align = 'c')
```

                     Df     SumOfSqs     R2       F      Pr(>F) 
------------------  -----  ----------  -------  ------  --------
Fun.SCSC.Gradient     2       3.4       0.052    4.37    0.001  
Fun.SCSC.Residual    158      61.8      0.948                   
Fun.SCSC.Total       160      65.3      1.000                   

\
