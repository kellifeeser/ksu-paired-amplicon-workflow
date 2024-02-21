---
title: "Overview of Explanatory Variables"
subtitle: "Analyzing and visualizing KSU explanatory variables"
author: "Kelli Feeser"
date: '2023-10-02'
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

\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::


```r
opts <- options(knitr.kable.NA = "")
```





\

# Set-up {.hidden .unlisted .unnumbered}

\

# Metadata structure

\

## Sampling Variables

[*Categorical*]{.underline}

-   **Site**
    -   n = 23
-   **Grassland type**
    -   n = 4
    -   tallgrass, mixed grass, shortgrass, desert
-   **Grass host species**
    -   n = 5
        -   ANGE (*Andropogon gerardii* / Big bluestem)
        -   SCSC (*Schizachyrium scoparium* / Little bluestem)
        -   BOER (*B. eriopoda* / Black grama)
        -   BOGR (*B. gracilis* / Blue grama)
        -   BUDA (*Bouteloua dactyloides* / Buffalograss)
-   **Latitudinal Bin**
    -   n = 4
    -   North, North Central, South Central, South
-   **Longitudinal Gradient**:
    -   n = 3
    -   East, Middle, West

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

-   **GDD** = growing degree days (determined over 3- and 30-year windows and 2015)
-   **ppt** = mean annual precipitation (determined over 3- and 30-year windows and 2015)\
    \

## Edaphic Variables

[*Continuous*]{.underline}

-   **soil_moisture**
-   **ammonium**
-   **nitrate**
-   **phosphorous**
-   **SOM** (via LoI)
-   **pH**\
    \

## Plant Traits

[*Continuous*]{.underline}

-   **avg_SRL**: specific root length
-   **avg_SLA**: specific leaf area
    -   Large values of specific leaf area (SLA) and specific root length (SRL) reflect large plant investment in resource acquisition; small values indicate investment in plant tissue longevity
-   **herbivory_perc**:
    -   average site level damage estimate for herbivory, averaged over all species and individuals at the site; could be used to indicate herbivory pressure at the site level
    -   ranges from 1:17 (%)

\

# Data Standardization/Transformations

\
All continuous data (climate, edaphic, and plant trait) were mean standardized. All predictors were scaled to mean = 0 and SD = 1.\
\





## Collinearity {.tabset .tabset-pills}

I assessed multicollinearity and removed correlated predictors, retaining ammonium over nitrate and soil moisture over similar measurements. For climate, only retaining 3yr values.\

Viewing tables of variable-variable correlations by category. Tables have been filtered to pearson correlation values \> 0.9 or \<-0.9.\



### Sampling {.unnumbered}

\
\




### Climate {.unnumbered}

\
\

Retaining GDD3yr over GDD2015 (degree growing days) & similarly, ppt3yr (mean annual precipitation)\

### Edaphic {.unnumbered}

\
\

Retaining soil_moisture over GWC and percent soil moisture (complement). Retaining ammonium over nitrate because Rudgers2021 did. I am considering removing phos.

### Plant Trait {.unnumbered}

\
n/a\
\
\

### Mixed {.unnumbered}

\
\

Precipitation is highly correlated to longitude. Interesting...\


# Summary by variable {.tabset .tabset-pills}

For these variable summaries, I am showing *non-standardized*/raw data values.
\



```r
# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)

# Define the list of explanatory variable names
#var_all <- c("var1", "var2", "var3")  # Add all variable names here

# Define the dataframe containing the data
Bac_all_meta_df1 <- data.frame(sample_data(Bac_m.std))

idx <- match(var_all_ut, names(Bac_all_meta_df1))
idx <- sort(c(idx))

Bac_all_meta_df <- Bac_all_meta_df1[,idx] 
Bac_all_meta_dfN <- select_if(Bac_all_meta_df, is.numeric)

# Loop through each explanatory variable
for (var in var_all_numeric_ut) {
  
  # Print the current variable being explored
  cat("## ", var, " {.unnumbered} \n\n")
  
  # Summary statistics
  summary_stats <- summary(Bac_all_meta_dfN[[var]])
  cat("Summary Statistics:\n")
  print(summary_stats)
  cat("\n")
  
  # Histogram
  hist_plot <- ggplot(Bac_all_meta_dfN, aes(x = !!sym(var))) +
    geom_histogram(fill = "skyblue", color = "black", bins = 20) +
    labs(title = paste("Histogram of", var),
         x = var, y = "Frequency") +
    theme_minimal()
  
  # Save histogram plot
  hist_file <- paste0("../figures/explanatory_variables/histogram_", var, ".png")
  ggsave(hist_file, hist_plot, width = 6, height = 4)
  
  # Print histogram plot
  cat("Histogram Plot:\n")
  # knitr::include_graphics(hist_file)
  cat("![](../figures/explanatory_variables/histogram_",var,".png)", sep = "")
  cat("\n\n")
  
  # Check variance
  # cat("Variance:\n")
  # var_val <- var(Bac_all_meta_df[[var]])
  # cat("Variance of", var, ":", var_val, "\n\n")
  
  # Check variations by "Site" variable
  # cat("Variations in ", var, "by Site, Latitudinal Bin, Longitudinal Gradient, Grass Host:\n")
  # site_variations <- Bac_all_meta_df %>%
  #   group_by(Site) %>%
  #   summarise(mean_val = mean(!!sym(var), na.rm = TRUE),
  #             sd_val = sd(!!sym(var), na.rm = TRUE))
  # 
  # print(site_variations)
  # cat("\n\n")
}
```

##  Latitude  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  29.23   31.96   36.02   35.37   39.07   41.12 

Histogram Plot:
![](../figures/explanatory_variables/histogram_Latitude.png)

##  Longitude  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-108.29 -104.53  -98.91 -100.27  -97.52  -94.13 

Histogram Plot:
![](../figures/explanatory_variables/histogram_Longitude.png)

##  Elevation_m  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  -19.8   335.0   635.0   916.4  1551.0  2747.0 

Histogram Plot:
![](../figures/explanatory_variables/histogram_Elevation_m.png)

##  GDD3yr  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   2048    3935    4427    4480    5010    6005 

Histogram Plot:
![](../figures/explanatory_variables/histogram_GDD3yr.png)

##  ppt3yr  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  188.4   415.2   606.2   617.2   858.3  1064.2 

Histogram Plot:
![](../figures/explanatory_variables/histogram_ppt3yr.png)

##  avg_SRL  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  659.4  1523.6  1732.1  1858.3  2150.4  3306.4 

Histogram Plot:
![](../figures/explanatory_variables/histogram_avg_SRL.png)

##  soil_moisture  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.6474  0.8291  0.8780  0.8713  0.9333  0.9889 

Histogram Plot:
![](../figures/explanatory_variables/histogram_soil_moisture.png)

##  pH  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  5.050   6.670   7.250   7.109   7.750   8.360 

Histogram Plot:
![](../figures/explanatory_variables/histogram_pH.png)

##  phos  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1705  0.1828  0.1937  0.1975  0.2041  0.2690 

Histogram Plot:
![](../figures/explanatory_variables/histogram_phos.png)

##  ammonium  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.8722  0.9233  0.9976  1.0100  1.0470  1.3796 

Histogram Plot:
![](../figures/explanatory_variables/histogram_ammonium.png)

##  SOM  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.4508  2.0087  4.3897  4.4058  6.8384 11.1393 

Histogram Plot:
![](../figures/explanatory_variables/histogram_SOM.png)

##  avg_SLA  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  98.42  124.81  139.78  141.27  155.90  191.04 

Histogram Plot:
![](../figures/explanatory_variables/histogram_avg_SLA.png)

##  herbivory_perc  {.unnumbered} 

Summary Statistics:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   0.625   2.625   3.428   4.375  17.000 

Histogram Plot:
![](../figures/explanatory_variables/histogram_herbivory_perc.png)

```r
# summary(aov(soil_moisture ~ Site, data = Bac_all_meta_df))
# 
# m1<-(aov(soil_moisture ~ Grass*Site+Bin+Gradient, data = Bac_all_meta_df))
# m2<-(aov(soil_moisture ~ Grass+Bin+Gradient, data = Bac_all_meta_df))
# 
# # fit the regression model
# model_sampling <- lm(soil_moisture ~ Grass+Bin+Gradient+Elevation_m+Grassland, data = Bac_all_meta_df)
# model_climate <- lm(soil_moisture ~ GDD3yr+ppt3yr, data = Bac_all_meta_df)
# model_edaphic <- lm(soil_moisture ~ soil_moisture+pH+phos+ammonium+SOM, data = Bac_all_meta_df)
# model_plant <- lm(soil_moisture ~ avg_SRL+avg_SLA+herbivory_perc, data = Bac_all_meta_df)
# 
# 
# # get the F statistics and performance metrics
# summary(model)$fstatistic[1]
# 89.51454 
# 
# summary(model)$r.squared
# 0.6063617
# 
# summary(model)$adj.r.squared
# 0.5995878
# 
# # load package
# library(car)
# 
# # calculate VIF for each predictor variable from fitted model
# vif(model,type="predictor")
```

