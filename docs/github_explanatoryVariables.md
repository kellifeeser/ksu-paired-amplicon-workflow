---
title: "Overview of Explanatory Variables"
subtitle: "Analyzing and visualizing KSU explanatory variables"
author: "Kelli Feeser"
date: "2024-07-10"
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
  html_document:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
  html_notebook:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
editor_options:
  chunk_output_type: inline
---

\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::

\

------------------------------------------------------------------------

Document last updated: 2024-07-10

------------------------------------------------------------------------

\

# Set-up {.unlisted .unnumbered .hidden}





## load packages



\

## load rds



# Metadata structure

\

## Sampling Variables

[*Categorical*]{.underline}

-   **Site**
    -   n = 22
        -   FCP - Four Canyon Preserve; Oklahoma, 36.0235,-99.9439
-   **Grassland type**
    -   n = 4
    -   tallgrass, mixed grass, shortgrass, desert
-   **Grass host species**
    -   n = 5
        -   ANGE (*Andropogon gerardii* / Big bluestem)
        -   SCSC (*Schizachyrium scoparium* / Little bluestem)
        -   BOER (*Bouteloua eriopoda* / Black grama)
        -   BOGR (*B. gracilis* / Blue grama)
        -   BUDA (*B. dactyloides* / Buffalograss)
-   ~~**Latitudinal Bin**~~
    -   ~~n = 4~~
    -   ~~North, North Central, South Central, South~~
-   ~~**Longitudinal Gradient**:~~
    -   ~~n = 3~~
    -   ~~East, Middle, West~~

[*Continuous*]{.underline}

-   **Elevation** (in meters)
    -   ranges from -20 to 2,747 m
-   **Latitude**
    -   29.23005 to 41.12200° N
-   **Longitude**
    -   -108.28760 to -94.13184° W\
        \

## Climate Data

[*Continuous*]{.underline}

-   **ppt** = mean annual precipitation (determined over 3- and 30-year windows and 2015)
-   **GDD** = growing degree days (determined over 3- and 30-year windows and 2015)\
    \

## Edaphic Variables

[*Continuous: (min, max values)*]{.underline}

-   **pH**: (5.05, 8.36)
-   **SOM** (via LoI): (0.45, 11.14)
-   **soil moisture**: (0.65, 0.99%)
-   **phosphorous**: (0.171, 0.269)
-   **ammonium**: (0.87, 1.38)
-   **nitrate**: (0.35, 0.55)\
    \

## Plant Traits

[*Continuous: (min, max values)*]{.underline}

-   **avg_SLA**: specific leaf area (98.4, 191)
-   **avg_SRL**: specific root length (659.4, 3306.4)

    -   Large values of specific leaf area (SLA) and specific root length (SRL) reflect large plant investment in resource acquisition; small values indicate investment in plant tissue longevity
-   **herbivory_perc**: (0, 17%)
    -   average site level damage estimate for herbivory, averaged over all species and individuals at the site; could be used to indicate herbivory pressure at the site level

\

# Data Standardization/Transformations

\
All continuous data predictors (climate, edaphic, and plant trait) were mean standardized, i.e., scaled to mean = 0 and SD = 1.\
\



## Collinearity {.tabset .tabset-pills}

I assessed multicollinearity and removed correlated predictors, retaining ammonium over nitrate and soil moisture over similar measurements. For climate, only retaining 3yr values.\

Viewing tables of variable-variable correlations by category. Tables have been filtered to pearson correlation values \> 0.9 or \<-0.9.\



### Sampling {.unnumbered}

\

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Variable Category </th>
   <th style="text-align:left;"> Var1 </th>
   <th style="text-align:left;"> Var2 </th>
   <th style="text-align:right;"> Correlation </th>
   <th style="text-align:left;"> Var1 Cat </th>
   <th style="text-align:left;"> Var2 Cat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Sampling </td>
   <td style="text-align:left;"> Longitude </td>
   <td style="text-align:left;"> Elevation_m </td>
   <td style="text-align:right;"> -0.9076341 </td>
   <td style="text-align:left;"> Sampling </td>
   <td style="text-align:left;"> Sampling </td>
  </tr>
</tbody>
</table>


### Climate {.unnumbered}

\

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Variable Category </th>
   <th style="text-align:left;"> Var1 </th>
   <th style="text-align:left;"> Var2 </th>
   <th style="text-align:right;"> Correlation </th>
   <th style="text-align:left;"> Var1 Cat </th>
   <th style="text-align:left;"> Var2 Cat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> GDD3yr_m.std </td>
   <td style="text-align:left;"> GDD2015_m.std </td>
   <td style="text-align:right;"> 0.9962364 </td>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> Climate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> ppt3yr_m.std </td>
   <td style="text-align:left;"> ppt2015_m.std </td>
   <td style="text-align:right;"> 0.9513075 </td>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> Climate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> ppt30yr_m.std </td>
   <td style="text-align:left;"> ppt3yr_m.std </td>
   <td style="text-align:right;"> 0.9415934 </td>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> Climate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> ppt30yr_m.std </td>
   <td style="text-align:left;"> ppt2015_m.std </td>
   <td style="text-align:right;"> 0.9071337 </td>
   <td style="text-align:left;"> Climate </td>
   <td style="text-align:left;"> Climate </td>
  </tr>
</tbody>
</table>

Retaining GDD3yr over GDD2015 (degree growing days) & similarly, ppt3yr (mean annual precipitation)\

### Edaphic {.unnumbered}

\

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Variable Category </th>
   <th style="text-align:left;"> Var1 </th>
   <th style="text-align:left;"> Var2 </th>
   <th style="text-align:right;"> Correlation </th>
   <th style="text-align:left;"> Var1 Cat </th>
   <th style="text-align:left;"> Var2 Cat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Edaphic </td>
   <td style="text-align:left;"> ammonium_m.std </td>
   <td style="text-align:left;"> nitrate_m.std </td>
   <td style="text-align:right;"> 1.0000000 </td>
   <td style="text-align:left;"> Edaphic </td>
   <td style="text-align:left;"> Edaphic </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Edaphic </td>
   <td style="text-align:left;"> phos_m.std </td>
   <td style="text-align:left;"> ammonium_m.std </td>
   <td style="text-align:right;"> 0.9868129 </td>
   <td style="text-align:left;"> Edaphic </td>
   <td style="text-align:left;"> Edaphic </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Edaphic </td>
   <td style="text-align:left;"> phos_m.std </td>
   <td style="text-align:left;"> nitrate_m.std </td>
   <td style="text-align:right;"> 0.9868129 </td>
   <td style="text-align:left;"> Edaphic </td>
   <td style="text-align:left;"> Edaphic </td>
  </tr>
</tbody>
</table>

Retaining soil_moisture over GWC and percent soil moisture (complement). Retaining ammonium over nitrate because Rudgers2021 did. I am considering removing phos.

### Plant Trait {.unnumbered}

\
n/a\
\
\

### Mixed {.unnumbered}

\

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Variable Category </th>
   <th style="text-align:left;"> Var1 </th>
   <th style="text-align:left;"> Var2 </th>
   <th style="text-align:right;"> Correlation </th>
   <th style="text-align:left;"> Var1 Cat </th>
   <th style="text-align:left;"> Var2 Cat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Mixed </td>
   <td style="text-align:left;"> Longitude </td>
   <td style="text-align:left;"> ppt30yr_m.std </td>
   <td style="text-align:right;"> 0.9525351 </td>
   <td style="text-align:left;"> Sampling </td>
   <td style="text-align:left;"> Climate </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mixed </td>
   <td style="text-align:left;"> Longitude </td>
   <td style="text-align:left;"> ppt3yr_m.std </td>
   <td style="text-align:right;"> 0.9050114 </td>
   <td style="text-align:left;"> Sampling </td>
   <td style="text-align:left;"> Climate </td>
  </tr>
</tbody>
</table>

\

Precipitation is highly correlated to longitude. Interesting...\
\


# Summary stats of variables {.tabset .tabset-pills}

For these variable summaries, I am showing *non-standardized*/raw data values.\

##  Latitude  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  29.23   31.96   34.98   35.15   39.07   41.12 




###  Histograms of  Latitude  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_Latitude.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_Latitude.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_Latitude.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_Latitude.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_Latitude.png){width=90%}

##  Longitude  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-108.29 -104.53  -98.91 -100.25  -97.52  -94.13 




###  Histograms of  Longitude  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_Longitude.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_Longitude.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_Longitude.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_Longitude.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_Longitude.png){width=90%}

##  Elevation_m  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  -19.8   335.0   635.0   917.3  1551.0  2747.0 




###  Histograms of  Elevation_m  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_Elevation_m.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_Elevation_m.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_Elevation_m.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_Elevation_m.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_Elevation_m.png){width=90%}

##  pH  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  5.050   6.670   7.250   7.124   7.770   8.360 




###  Histograms of  pH  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_pH.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_pH.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_pH.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_pH.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_pH.png){width=90%}

##  SOM  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.4508  2.0087  4.3897  4.4057  6.8384 11.1393 




###  Histograms of  SOM  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_SOM.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_SOM.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_SOM.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_SOM.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_SOM.png){width=90%}

##  soil_moisture  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.6474  0.8291  0.8780  0.8705  0.9333  0.9889 




###  Histograms of  soil_moisture  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_soil_moisture.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_soil_moisture.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_soil_moisture.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_soil_moisture.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_soil_moisture.png){width=90%}

##  phos  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1705  0.1841  0.1937  0.1975  0.2028  0.2690 




###  Histograms of  phos  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_phos.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_phos.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_phos.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_phos.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_phos.png){width=90%}

##  ammonium  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.8722  0.9233  0.9976  1.0096  1.0470  1.3796 




###  Histograms of  ammonium  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_ammonium.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_ammonium.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_ammonium.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_ammonium.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_ammonium.png){width=90%}

##  ppt3yr  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  188.4   415.2   606.2   616.5   858.3  1064.2 




###  Histograms of  ppt3yr  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_ppt3yr.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_ppt3yr.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_ppt3yr.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_ppt3yr.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_ppt3yr.png){width=90%}

##  GDD3yr  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   2048    3930    4427    4475    5010    6005 




###  Histograms of  GDD3yr  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_GDD3yr.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_GDD3yr.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_GDD3yr.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_GDD3yr.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_GDD3yr.png){width=90%}

##  avg_SLA  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  98.42  124.81  140.01  141.69  155.90  191.04 




###  Histograms of  avg_SLA  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_avg_SLA.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_avg_SLA.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_avg_SLA.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_avg_SLA.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_avg_SLA.png){width=90%}

##  avg_SRL  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  659.4  1523.6  1723.4  1857.6  2150.4  3306.4 




###  Histograms of  avg_SRL  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_avg_SRL.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_avg_SRL.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_avg_SRL.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_avg_SRL.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_avg_SRL.png){width=90%}

##  herbivory_perc  {.unnumbered} 

Summary Statistics: 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   1.042   2.625   3.450   4.479  17.000 




###  Histograms of  herbivory_perc  {.unnumbered .tabset} 

 
####  All Sites  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_herbivory_perc.png){width=50%}

####  By Site  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bysite_herbivory_perc.png){width=90%}

####  By Grass  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_bygrass_herbivory_perc.png){width=60%}

####  By Fun Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byFun_sor_clusters_herbivory_perc.png){width=90%}

####  By Bac Clusters  {.unnumbered} 

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/figures/explanatory_variables/histogram_byBac_sor_clusters_herbivory_perc.png){width=90%}




# Check variance of variables {.tabset .tabset-pills}

[tbd]














# IGNORE testing  {.hidden .unlisted .unnumbered}








# Summary table of variables {.hidden .unlisted}









