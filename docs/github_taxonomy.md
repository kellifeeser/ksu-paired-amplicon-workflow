---
title: "**KSU paired amplicon Taxonomy**"
subtitle: "Taxa plots of clean 16S and ITS OTU tables (EDGE samples excluded)"
author: "Kelli Feeser"
date: '2023-09-20'
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 3
    fig.caption: yes
    keep_md: yes
  html_document: 
    code_folding: hide
    df_print: paged
    css: test.css
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 3
  html_notebook:
    code_folding: hide
    df_print: paged
    css: test.css
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 3
editor_options:
  chunk_output_type: inline
---

\
<div class="homelink">
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
</div>








# Set-up project naming from reproducible code {.unlisted .unnumbered .hidden}




# Set-up {.unlisted .unnumbered .hidden}





# Import clean OTU tables





All EDGE samples excluded \
OTU tables rarefied to the following sequencing depths:

-   16S: 9,048 
-   ITS: 10,116


**Bacterial & Archaeal Dataset:**

- 23,156 OTUs
- 533 samples
\

**Fungal Dataset:**

- 6,749 OTUs
- 509 samples
\

# Set-up metadata strata {.unlisted .unnumbered .hidden}

# Available metadata {.unlisted .unnumbered}


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

# Set-up taxonomy for plotting {.unlisted .unnumbered .hidden}

\

## Global: Calculate  mean relative abundance by tax rank and export csv of relative abundance 

### merge samples within dataset 



### tax glom and export 
(no generating code just copy and replace)



## Samples: Calculate relative abundance by tax rank and export csv of relative abundance {.unlisted .unnumbered .hidden} 


1. create vectors of top 10 taxa names to plot for all ranks
  - auto-generated code found: 
  a. set minimum threshold of 0.5% all-sample (a.k.a global) mean relative abundance
    - (so that taxa below this threshold won't get plotted)
2. tax glom by each rank
3. transform to relative abundance
3. psmelt
4. add column "[rank]_all" to preserve names not in top 10 
5. recode all taxa not in top 10 to by "LowAbundance" & revalue with specifics later (in dat_Bac.[rank].r and in dat_Fun.[rank].r)


### generating code: 


```r
Bac.rank.names<-rank_names(Bac)[2:6]
# add this line to beginning
  #  cat('\n # Set min plotting threshold to 0.5% relative abundance (all-sample a.k.a global mean) \n')

#also adding psmelt step

for(rank in Bac.rank.names) {

  cat('\n## \n')

  cat('################## \n')

  cat('# Bac:', rank, '# \n')

  cat('################## \n')

  cat('\n')
  
   cat('min_nname_Bac_', rank, '<-length(unique(Bac_', rank, '_Mean_Abund$', 
       rank, '[Bac_', rank, '_Mean_Abund$Bac_', rank, '_Mean > 0.5]))',
       sep = '')
  
  cat('\n \n ')

    cat('if (min_nname_Bac_', rank, ' < 10){
  Bac.', rank, '.names.to.plot<-top_n(Bac_', rank, '_Mean_Abund, min_nname_Bac_', rank, ', Bac_', rank, '_Mean)$',rank, ' 
} else {
  Bac.', rank, '.names.to.plot<-top_n(Bac_', rank, '_Mean_Abund, 10, Bac_', rank, '_Mean)$', rank, '
}', sep = '')

  cat('\n# \n')
  
  cat('\nBac.',rank,'.A <- tax_glom(Bac, taxrank="',rank,'")\n',sep = '')
  
  cat('Bac.',rank,' <- prune_taxa(taxa_sums(Bac.',rank,'.A) > 0, Bac.',rank,'.A)\n',sep = '')

  cat('Bac.',rank,'.r  = transform_sample_counts(Bac.',rank,', function(x) x / sum(x) )\n',sep = '')

  cat('dat_Bac.',rank,'.r <- psmelt(Bac.',rank,'.r)\n',sep = '')

  cat('dat_Bac.',rank,'.r$',rank,' <- as.character(dat_Bac.',rank,'.r$',rank,') \n',sep = '')

  cat('dat_Bac.',rank,'.r$',rank,'_all <- dat_Bac.',rank,'.r$',rank,' \n',sep = '')
  
  cat('dat_Bac.',rank,'.r$',rank,' <- if_else(dat_Bac.',rank,'.r$',rank,' %in% Bac.',rank,'.names.to.plot, dat_Bac.',rank,'.r$',rank,', "LowAbundance") \n',sep = '')

  cat('\n## \n')

  cat('\n \n')

}
```


```r
Fun.rank.names<-rank_names(Fun)[2:7] #change 6 to 7 if fungal

# add this line to beginning
  #  cat('\n # Set min plotting threshold to 0.5% relative abundance (all-sample a.k.a global mean) \n')

#also adding psmelt step

for(rank in Fun.rank.names) {

  cat('\n## \n')

  cat('################## \n')

  cat('# Fun:', rank, '# \n')

  cat('################## \n')

  cat('\n')
  
   cat('min_nname_Fun_', rank, '<-length(unique(Fun_', rank, '_Mean_Abund$', 
       rank, '[Fun_', rank, '_Mean_Abund$Fun_', rank, '_Mean > 0.5]))',
       sep = '')
  
  cat('\n \n ')

    cat('if (min_nname_Fun_', rank, ' < 10){
  Fun.', rank, '.names.to.plot<-top_n(Fun_', rank, '_Mean_Abund, min_nname_Fun_', rank, ', Fun_', rank, '_Mean)$',rank, ' 
} else {
  Fun.', rank, '.names.to.plot<-top_n(Fun_', rank, '_Mean_Abund, 10, Fun_', rank, '_Mean)$', rank, '
}', sep = '')

  cat('\n# \n')
  
  cat('\nFun.',rank,'.A <- tax_glom(Fun, taxrank="',rank,'")\n',sep = '')
  
  cat('Fun.',rank,' <- prune_taxa(taxa_sums(Fun.',rank,'.A) > 0, Fun.',rank,'.A)\n',sep = '')

  cat('Fun.',rank,'.r  = transform_sample_counts(Fun.',rank,', function(x) x / sum(x) )\n',sep = '')

  cat('dat_Fun.',rank,'.r <- psmelt(Fun.',rank,'.r)\n',sep = '')

  cat('dat_Fun.',rank,'.r$',rank,' <- as.character(dat_Fun.',rank,'.r$',rank,') \n',sep = '')

  cat('dat_Fun.',rank,'.r$',rank,'_all <- dat_Fun.',rank,'.r$',rank,' \n',sep = '')
  
  cat('dat_Fun.',rank,'.r$',rank,' <- if_else(dat_Fun.',rank,'.r$',rank,' %in% Fun.',rank,'.names.to.plot, dat_Fun.',rank,'.r$',rank,', "LowAbundance") \n',sep = '')

  cat('\n## \n')

  cat('\n \n')

}
```

### create vectors of top 10 taxa names

#### Bac

(paste in previous generated code)



#### Fun




## Group low abundance (!%inc% top 10 taxa)

(no generating code just copy paste)

### Bac


### Fun


#select metadata of interest (do later)

```r
dat_Bac.Phylum.r2<-subset(dat_Bac.Phylum.r, select=c(OTU, Sample, Abundance, Basin, Site, BasinSite, Depth, Depth2, Pit, Phylum))

# save dat files
saveRDS(dat_Bac.Phylum.r2, file = "../processed_data/clean_rds_saves/tax_dat/dat_Bac.Phylum.r2.rds")
```


##



## restore dat files




# **Full Dataset** {.unnumbered .tabset .tabset-pills}

## Grass replicates, grouped by Site {.unnumbered .tabset}

### Phylum {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Phylum_Full_GrassRep_Site.png){width="103%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Phylum_Full_GrassRep_Site.png){width="99%"}

### Class {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Class_Full_GrassRep_Site.png){width="115%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Class_Full_GrassRep_Site.png){width="99%"}

### Order {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Order_Full_GrassRep_Site.png){width="99%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Order_Full_GrassRep_Site.png){width="99%"}

### Family {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Family_Full_GrassRep_Site.png){width="99%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Family_Full_GrassRep_Site.png){width="99%"}


## Site replicates, grouped by Grass {.unnumbered .tabset}

### Phylum {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Phylum_Full_SiteRep_Grass.png){width="99%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Phylum_Full_SiteRep_Grass.png){width="99%"}

### Class {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Class_Full_SiteRep_Grass.png){width="99%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Class_Full_SiteRep_Grass.png){width="99%"}

### Order {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Order_Full_SiteRep_Grass.png){width="99%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Order_Full_SiteRep_Grass.png){width="99%"}

### Family {.unnumbered .tabset .tabset-pills}

#### Bacteria-Archaea {.unnumbered}

![](../figures/taxa_plots/BA_Family_Full_SiteRep_Grass.png){width="99%"}

#### Fungi {.unnumbered}

![](../figures/taxa_plots/Fun_Family_Full_SiteRep_Grass.png){width="99%"}



\

# **Across Different Sites by Grass Hosts** {.unnumbered .tabset}

## Phylum {.unnumbered .tabset .tabset-pills}

### Bacteria-Archaea {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-23.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-24.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-25.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-26.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-27.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-28.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-29.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-30.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-31.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-32.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-33.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-34.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-35.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-36.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-37.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-38.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-39.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-40.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-41.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-42.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-43.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-44.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-45.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-46.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-47.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-48.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-49.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-50.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-51.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Phylum-52.png)<!-- -->

### Fungi {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-23.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-24.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-25.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-26.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-27.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-28.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-29.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-30.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-31.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-32.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-33.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-34.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-35.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-36.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-37.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-38.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-39.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-40.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-41.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-42.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-43.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-44.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-45.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-46.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-47.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-48.png)<!-- -->

####  SCP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-49.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-50.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-51.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-52.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-53.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-54.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-55.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Phylum-56.png)<!-- -->

## Class {.unnumbered .tabset .tabset-pills}

### Bacteria-Archaea {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-23.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-24.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-25.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-26.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-27.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-28.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-29.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-30.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-31.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-32.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-33.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-34.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-35.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-36.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-37.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-38.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-39.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-40.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-41.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-42.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-43.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-44.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-45.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-46.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-47.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-48.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-49.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-50.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-51.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Class-52.png)<!-- -->

### Fungi {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-23.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-24.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-25.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-26.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-27.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-28.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-29.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-30.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-31.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-32.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-33.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-34.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-35.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-36.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-37.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-38.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-39.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-40.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-41.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-42.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-43.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-44.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-45.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-46.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-47.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-48.png)<!-- -->

####  SCP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-49.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-50.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-51.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-52.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-53.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-54.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-55.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Class-56.png)<!-- -->

## Order {.unnumbered .tabset .tabset-pills}

### Bacteria-Archaea {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-23.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-24.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-25.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-26.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-27.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-28.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-29.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-30.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-31.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-32.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-33.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-34.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-35.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-36.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-37.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-38.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-39.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-40.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-41.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-42.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-43.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-44.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-45.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-46.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-47.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-48.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-49.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-50.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-51.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Order-52.png)<!-- -->

### Fungi {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-23.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-24.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-25.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-26.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-27.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-28.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-29.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-30.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-31.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-32.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-33.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-34.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-35.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-36.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-37.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-38.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-39.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-40.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-41.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-42.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-43.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-44.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-45.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-46.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-47.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-48.png)<!-- -->

####  SCP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-49.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-50.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-51.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-52.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-53.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-54.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-55.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Order-56.png)<!-- -->

## Family {.unnumbered .tabset .tabset-pills}

### Bacteria-Archaea {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-23.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-24.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-25.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-26.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-27.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-28.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-29.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-30.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-31.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-32.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-33.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-34.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-35.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-36.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-37.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-38.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-39.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-40.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-41.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-42.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-43.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-44.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-45.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-46.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-47.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-48.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-49.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-50.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-51.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Bac-Family-52.png)<!-- -->

### Fungi {.unnumbered .tabset}


####  BLM {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-1.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-2.png)<!-- -->

####  BNP {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-3.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-4.png)<!-- -->

####  CAD {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-5.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-6.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-7.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-8.png)<!-- -->

####  CNF {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-9.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-10.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-11.png)<!-- -->

####  CPR {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-12.png)<!-- -->

####  DMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-13.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-14.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-15.png)<!-- -->

####  FCP {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-16.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-17.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-18.png)<!-- -->

####  FMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-19.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-20.png)<!-- -->

####  GMT {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-21.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-22.png)<!-- -->

####  GNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-23.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-24.png)<!-- -->

####  HAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-25.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-26.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-27.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-28.png)<!-- -->

####  HPG {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-29.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-30.png)<!-- -->

####  KAE {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-31.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-32.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-33.png)<!-- -->

####  KNZ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-34.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-35.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-36.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-37.png)<!-- -->

####  LAR {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-38.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-39.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-40.png)<!-- -->

####  LBJ {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-41.png)<!-- -->

#####  BUDA {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-42.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-43.png)<!-- -->

####  NWP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-44.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-45.png)<!-- -->

####  ONF {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-46.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-47.png)<!-- -->

####  RNF {.unnumbered .tabset .tabset-pills}   


#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-48.png)<!-- -->

####  SCP {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-49.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-50.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-51.png)<!-- -->

####  SEV {.unnumbered .tabset .tabset-pills}   


#####  BOER {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-52.png)<!-- -->

#####  BOGR {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-53.png)<!-- -->

####  SFA {.unnumbered .tabset .tabset-pills}   


#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-54.png)<!-- -->

####  UHC {.unnumbered .tabset .tabset-pills}   


#####  ANGE {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-55.png)<!-- -->

#####  SCSC {.unnumbered}   

![](figures/taxa_plots/autogen-SitebyGrass-Fun-Family-56.png)<!-- -->

\

