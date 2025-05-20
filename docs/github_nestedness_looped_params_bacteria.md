---
title: "nestedness_looped_params"
author: "Kelli Feeser"
date: "2025-05-16"
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
---

\

# Set-up {.unlisted .unnumbered .hidden}



## load packages


``` r
library("vegan"); packageVersion("vegan") # ‘2.6.4’
library("phyloseq"); packageVersion("phyloseq") # ‘1.41.1’
library("betapart"); packageVersion("betapart") # ‘1.6’
library("ecodist"); packageVersion("ecodist") # ‘2.0.9’
library("measurements"); packageVersion("measurements") # ‘1.5.1’
library("geosphere"); packageVersion("geosphere") # ‘1.5.18’
  # The legacy packages maptools, rgdal, and rgeos, underpinning the sp package,
  # which was just loaded, were retired in October 2023.
  # Please refer to R-spatial evolution reports for details, especially
  # https://r-spatial.org/r/2023/05/15/evolution4.html.
  # It may be desirable to make the sf package available;
  # package maintainers should consider adding sf to Suggests:.
library("gdata"); packageVersion("gdata") # ‘2.19.0’
# library("spam"); packageVersion("spam") # ‘2.9.1’
library("ggplot2"); packageVersion("ggplot2") # ‘3.4.4’
library("ggpubr"); packageVersion("ggpubr") # ‘0.6.0’
library("cowplot"); packageVersion("cowplot") # ‘1.1.1’
library("geodist"); packageVersion("geodist") # ‘0.0.8’
library(kableExtra)
# detach("package:spam", unload = TRUE)
source("RAM_bulk_harvester.R")
```

![](../docs/github_looped-params_figures/load-packages-1.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-2.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-3.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-4.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-5.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-6.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-7.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-8.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-9.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-10.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-11.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-12.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-13.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-14.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-15.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-16.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-17.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-18.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-19.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-20.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-21.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-22.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-23.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-24.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-25.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-26.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-27.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-28.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-29.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-30.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-31.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-32.png)<!-- -->![](../docs/github_looped-params_figures/load-packages-33.png)<!-- -->

## load cache & rds



### Edaphic/environmental variables: generate distance matrices

### list of env var


``` r
vard_sample <- c("Site","Grass","Site_Grass","Grassland","Latitude","Longitude","Elevation_m")

vard_intpred <- c("Site","Grass","Site_Grass",
                  "Bac_sor_clusters","Fun_sor_clusters",
                  "nsamples_per_Site",
                  "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
                  "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
                  "Bac_gamma_Site","Fun_gamma_Site")

vard_climate <- c("GDD3yr_m.std","ppt3yr_m.std")

vard_edaphic <- c("soil_water_content_m.std","pH_m.std","phos_m.std","ammonium_m.std","SOM_m.std")

vard_plant <- c("avg_SRL_m.std","avg_SLA_m.std","herbivory_perc_m.std")

vard_all <- c("Site","Grass","Site_Grass","Grassland","Latitude","Longitude","Elevation_m",
              "GDD3yr_m.std","ppt3yr_m.std",
              "soil_water_content_m.std","pH_m.std","phos_m.std","ammonium_m.std","SOM_m.std",
              "avg_SRL_m.std","avg_SLA_m.std","herbivory_perc_m.std",
              "Bac_sor_clusters","Fun_sor_clusters",
              "nsamples_per_Site",
              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "Bac_gamma_Site","Fun_gamma_Site")

vard_all_numeric <- c("Latitude","Longitude","Elevation_m",
              "GDD3yr_m.std","ppt3yr_m.std",
              "soil_water_content_m.std","pH_m.std","phos_m.std","ammonium_m.std","SOM_m.std",
              "avg_SRL_m.std","avg_SLA_m.std","herbivory_perc_m.std",
              "nsamples_per_Site",
              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "Bac_gamma_Site","Fun_gamma_Site")

vard_all_numeric_env <- c("GDD3yr_m.std","ppt3yr_m.std","soil_water_content_m.std","pH_m.std","phos_m.std","ammonium_m.std","SOM_m.std","avg_SRL_m.std","avg_SLA_m.std","herbivory_perc_m.std",
                          "nsamples_per_Site",
              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "Bac_gamma_Site","Fun_gamma_Site")

vard_all_numeric_intpred <- c("nsamples_per_Site",
                              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "Bac_gamma_Site","Fun_gamma_Site")
vard_all_numeric_env_intpred <-union(vard_all_numeric_env,vard_all_numeric_intpred)
```

#### generate distance matrices of env var and Lat/long distance matrix calc


``` r
var_Fun_sor_clus2 <- levels(sd$Fun_sor_clus2)
var_Fun_sor_clusters <- levels(sd$Fun_sor_clusters)
var_Bac_sor_clusters <- levels(sd$Bac_sor_clusters)
var_Site <- levels(sd$Site)
var_Grass <- levels(sd$Grass)

# Create an empty list to store the distance matrices
env_dist_matrices <- list("all"=list(),"Site"=list(),"Grass"=list(),"Bac_sor_clusters"=list(),
                          "Fun_sor_clusters"=list(),"Fun_sor_clus2"=list())

  
# all
for (var in vard_all_numeric_env_intpred) {
  # Calculate geodistance matrices 
  Bac_all.geo<-as(subset(sd, select = c(Longitude,Latitude)), "data.frame")
  Bac_all.geodist_mat <- as.dist(geodist(Bac_all.geo, measure = 'geodesic' )/1000) #converting it to km
  
  Fun_all.geo<-as(subset(sd, select = c(Longitude,Latitude)), "data.frame")
  Fun_all.geodist_mat <- as.dist(geodist(Fun_all.geo, measure = 'geodesic' )/1000) #converting it to km
  
  # Store the geodist matrices in the list using variable name as key
  env_dist_matrices$all[["geodist_Bac"]] <- Bac_all.geodist_mat
  env_dist_matrices$all[["geodist_Fun"]] <- Fun_all.geodist_mat

  # Subset the data for the current variable
  Bac_subset <- subset(as.data.frame(sample_data(Bac_wholecommunity)), select = var)
  Fun_subset <- subset(as.data.frame(sample_data(Fun_wholecommunity)), select = var)
  
  # Calculate distance matrices and store them in the list
  Bac_dist_matrix <- dist(Bac_subset, method = "euclidean", diag = TRUE, upper = FALSE)
  Fun_dist_matrix <- dist(Fun_subset, method = "euclidean", diag = TRUE, upper = FALSE)
  
  # Store the matrices in the list using variable name as key
  env_dist_matrices$all[[paste0(var,"_Bac")]] <- Bac_dist_matrix
  env_dist_matrices$all[[paste0(var,"_Fun")]] <- Fun_dist_matrix

}

# var_Site
for (var in var_Site) {
  # Subset the data for the current variable
  sd_subset <- subset(sd, Site == var)
  
  subset.geo<-as(subset(sd_subset, select = c(Longitude,Latitude)), "data.frame")
  subset.geodist_mat <- as.dist(geodist(subset.geo, measure = 'geodesic' )/1000) #convert to km

  # Store the matrices in the list using variable name as key
  env_dist_matrices$Site[[paste0(var,"_geodist")]] <- subset.geodist_mat
  
  for (var2 in vard_all_numeric_env_intpred) {
    sd_subsubset <- subset(sd_subset, select = var2)
  
    # Calculate distance matrices and store them in the list
    subset_dist_matrix <- dist(sd_subsubset, method = "euclidean", diag = T, upper = F)
  
    # Store the matrices in the list using variable name as key
    env_dist_matrices$Site[[paste0(var,"_",var2)]] <- subset_dist_matrix
  }
}

# var_Grass
for (var in var_Grass) {
  # Subset the data for the current variable
  sd_subset <- subset(sd, Grass == var)
  
  subset.geo<-as(subset(sd_subset, select = c(Longitude,Latitude)), "data.frame")
  subset.geodist_mat <- as.dist(geodist(subset.geo, measure = 'geodesic' )/1000) #convert to km

  # Store the matrices in the list using variable name as key
  env_dist_matrices$Grass[[paste0(var,"_geodist")]] <- subset.geodist_mat
  
  for (var2 in vard_all_numeric_env_intpred) {
    sd_subsubset <- subset(sd_subset, select = var2)
  
    # Calculate distance matrices and store them in the list
    subset_dist_matrix <- dist(sd_subsubset, method = "euclidean", diag = T, upper = F)
  
    # Store the matrices in the list using variable name as key
    env_dist_matrices$Grass[[paste0(var,"_",var2)]] <- subset_dist_matrix
  }
}

# var_Bac_sor_clusters
for (var in var_Bac_sor_clusters) {
  # Subset the data for the current variable
  sd_subset <- subset(sd, Bac_sor_clusters == var)
  
  subset.geo<-as(subset(sd_subset, select = c(Longitude,Latitude)), "data.frame")
  subset.geodist_mat <- as.dist(geodist(subset.geo, measure = 'geodesic' )/1000) #convert to km

  # Store the matrices in the list using variable name as key
  env_dist_matrices$Bac_sor_clusters[[paste0(var,"_geodist")]] <- subset.geodist_mat
  
  for (var2 in vard_all_numeric_env_intpred) {
    sd_subsubset <- subset(sd_subset, select = var2)
  
    # Calculate distance matrices and store them in the list
    subset_dist_matrix <- dist(sd_subsubset, method = "euclidean", diag = T, upper = F)
  
    # Store the matrices in the list using variable name as key
    env_dist_matrices$Bac_sor_clusters[[paste0(var,"_",var2)]] <- subset_dist_matrix
  }
}

# var_Fun_sor_clusters
for (var in var_Fun_sor_clusters) {
  # Subset the data for the current variable
  sd_subset <- subset(sd, Fun_sor_clusters == var)
  
  subset.geo<-as(subset(sd_subset, select = c(Longitude,Latitude)), "data.frame")
  subset.geodist_mat <- as.dist(geodist(subset.geo, measure = 'geodesic' )/1000) #convert to km

  # Store the matrices in the list using variable name as key
  env_dist_matrices$Fun_sor_clusters[[paste0(var,"_geodist")]] <- subset.geodist_mat
  
  for (var2 in vard_all_numeric_env_intpred) {
    sd_subsubset <- subset(sd_subset, select = var2)
  
    # Calculate distance matrices and store them in the list
    subset_dist_matrix <- dist(sd_subsubset, method = "euclidean", diag = T, upper = F)
  
    # Store the matrices in the list using variable name as key
    env_dist_matrices$Fun_sor_clusters[[paste0(var,"_",var2)]] <- subset_dist_matrix
  }
}

# var_Fun_sor_clus2
for (var in var_Fun_sor_clus2) {
  # Subset the data for the current variable
  sd_subset <- subset(sd, Fun_sor_clus2 == var)
  
  subset.geo<-as(subset(sd_subset, select = c(Longitude,Latitude)), "data.frame")
  subset.geodist_mat <- as.dist(geodist(subset.geo, measure = 'geodesic' )/1000) #convert to km

  # Store the matrices in the list using variable name as key
  env_dist_matrices$Fun_sor_clus2[[paste0(var,"_geodist")]] <- subset.geodist_mat
  
  for (var2 in vard_all_numeric_env_intpred) {
    sd_subsubset <- subset(sd_subset, select = var2)
  
    # Calculate distance matrices and store them in the list
    subset_dist_matrix <- dist(sd_subsubset, method = "euclidean", diag = T, upper = F)
  
    # Store the matrices in the list using variable name as key
    env_dist_matrices$Fun_sor_clus2[[paste0(var,"_",var2)]] <- subset_dist_matrix
  }
}

# var_Grass


# saveRDS(env_dist_matrices, file = "../processed_data/clean_rds_saves/env_dist_matrices2.rds")
```

\
\

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\

# Results - Bacteria

\

## Landscape-scale: All samples (agnostic to site) {.tabset}

### Pure spatial effects (S)

Distance-decay relationships between geographic distance (in km) between communities and i) total community pairwise dissimilarity (β~sor~), ii) spatial turnover-resultant dissimilarity (β~sim~), and iii) nestedness-resultant dissimilarity (β~sne~) using 1,000 permutations. Differences between bacterial and fungal model parameters were assessed via block-site bootstrap whether the parameters of both models are equal (n = 1,000 bootstrap resamples). Both tests were conducted independently, one for the equality of the first parameters of both models, another for the equality of the second parameters (slopes) of both models.




``` r
# (MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~ env_dist_matrices[["all"]][["geodist_Bac"]],nperm=1000))
#$r.squared R2 0.1529891     pval 0.0010000

# vard_all_numeric_env_intpred
#  [1] "GDD3yr_m.std"                 "ppt3yr_m.std"                 "soil_water_content_m.std"     "pH_m.std"                    
#  [5] "phos_m.std"                   "ammonium_m.std"               "SOM_m.std"                    "avg_SRL_m.std"               
#  [9] "avg_SLA_m.std"                "herbivory_perc_m.std"         "nsamples_per_Site"            "nsamples_perBac_sor_clusters"
# [13] "nsamples_perFun_sor_clusters" "ngrass_persite"               "ngrass_perBac_sor_clusters"   "ngrass_perFun_sor_clusters"  
# [17] "Bac_gamma_Site"               "Fun_gamma_Site"      

# Spatial ----
MRM.all_Bac.linear.sor_Spatial<-MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
      env_dist_matrices[["all"]][["geodist_Bac"]],
    method = "linear", nperm = 1000)
# endSpatial ----

# Environmental:Climate ----
MRM.all_Bac.linear.sor_E_Climate<-MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
     env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]],
    method = "linear", nperm = 1000)
# endEnvironmental:Climate ----


# Environmental:Edaphic ----
MRM.all_Bac.linear.sor_E_Edaphic<-MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
      env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["pH_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["phos_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ammonium_m.std_Bac"]],
    method = "linear", nperm = 1000)
MRM.all_Bac.linear.sor_E_Edaphic
```

```
## $coef
##                                                              betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                            0.6115309025 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                   0.0135245566 0.001
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                   0.0490271406 0.001
## env_dist_matrices[["all"]][["phos_m.std_Bac"]]                                                                 0.0003235113 0.955
## env_dist_matrices[["all"]][["ammonium_m.std_Bac"]]                                                             0.0073731754 0.149
## 
## $r.squared
##        R2      pval 
## 0.3274488 0.0010000 
## 
## $F.test
##         F    F.pval 
## 14226.626     0.001
```

``` r
# endEnvironmental:Edaphic ----


# Environmental:Plant ----
MRM.all_Bac.linear.sor_E_Plant <- MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
      env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]],
    method = "linear", nperm = 1000)
MRM.all_Bac.linear.sor_E_Plant
```

```
## $coef
##                                                          betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                        0.6849615585 0.314
## env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]]                                                         -0.0052974013 0.008
## env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]]                                                         -0.0001846545 0.923
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                   0.0104194653 0.001
## 
## $r.squared
##         R2       pval 
## 0.01755741 0.00100000 
## 
## $F.test
##        F   F.pval 
## 696.2733   0.0010
```

``` r
# endEnvironmental:Plant ----


# Environmental:All ----
MRM.all_Bac.linear.sor_E_All<-MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
     env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["pH_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["phos_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ammonium_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]],
    method = "linear", nperm = 1000)
# endEnvironmental:All ----


# Mixed (E*S):All ----
MRM.all_Bac.linear.sor_ES_All <- MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
     env_dist_matrices[["all"]][["geodist_Bac"]] +
      env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["pH_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["phos_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ammonium_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]],
    method = "linear", nperm = 1000)
# endMixed (E*S):All ----

# Var:Intpred ----
MRM.all_Bac.linear.sor_Var_Intpred <- MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
      env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]] + 
      env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["ngrass_persite_Bac"]] + 
      env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]] + 
      env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]],
    method = "linear", nperm = 1000)
# endVar:Intpred ----


# Var:All ----
MRM.all_Bac.linear.sor_Var_All <- MRM(betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]] ~  
     env_dist_matrices[["all"]][["geodist_Bac"]] +
      env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["pH_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["phos_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["ammonium_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]] + 
      env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]] + 
      env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["ngrass_persite_Bac"]] + 
      env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]] + 
      env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]] + 
      env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]],
    method = "linear", nperm = 1000)
# endVar:All ----
```



The main current hypotheses about the origin of beta diversity are as follows:

1) Species composition is uniform over large areas. This hypothesis, which plays the role of a null model, emphasizes the role of biological interactions. It suggests that communities are dominated by a limited suite of competitively superior species (Pitman et al. 1999, 2001); beta diversity is small.

2) Species composition fluctuates in a random, autocorrelated way. This hypothesis emphasizes spatially limited dispersal history. Models derived from neutral theory state that all species are demographically and competitively equal. Differences are created through spatially limited dispersal of species drawn at random from a metacommunity, plus possibly the appearance of newly evolved species in different areas. Neutral models differ in the details of the mechanisms that they invoke (Bell 2001, Hubbell 2001, He 2005).

3) Species distributions are related to environmental conditions. This hypothesis emphasizes environmental control. Landscapes are mosaics where species composition is controlled by environmental site characteristics (Whittaker 1956, Bray and Curtis 1957, Hutchinson 1957, Gentry 1988, Tuomisto et al. 1995).

Testing these hypotheses is important for understanding the functioning of ecosystems, for the conservation of biodiversity, and for ecosystem management. Regarding the establishment of natural reserves, e.g., hypothesis 1 implies that all parts of the ecosystem are equivalent. Reserves can be located anywhere. Hypothesis 2 implies that different parts of the ecosystem may, for historical reasons, sustain different species compositions, although these parts are environmentally equivalent. Portions of space supporting the different species compositions should be preserved. Reserves must be large, allowing the dynamics to go on without many species going extinct. Hypothesis 3 implies that all parts of the ecosystem are not equivalent. Reserves must represent the different types of habitat and each portion must be of sufficient size to be sustainable. The parts representing favorable dispersion routes must be especially preserved.
(https://esajournals.onlinelibrary.wiley.com/doi/10.1890/05-0549)


When studying the origin of beta diversity, one must consider different hypotheses and answer the following questions. (1) Is the variation in species composition among sites random, i.e., devoid of significant spatial pattern? A positive answer will support hypothesis 1. (2) Is there significant spatial patchiness (different from random) in the distributions of species? A positive answer will support hypothesis 2, and possibly hypothesis 3 if the environmental variables influencing species distributions are spatially structured. (3) Can the environmental variables explain a significant proportion of the community composition variation? A positive answer will support hypothesis 3, which is compatible with hypothesis 2.

Empirical data must be used to determine the likelihood of each hypothesis in different systems and at different spatial scales. To test these hypotheses, the variation of community composition at many sites must be analyzed to determine if significant spatial patterns (different from random) are present in the data and if the environmental variables explain a significant proportion of the community composition variation. In this contribution, we explain how hypotheses about the origin of beta diversity can be tested by partitioning the spatial variation of community composition (presence– absence or abundance data) with respect to environmental variables and spatial base functions. Next we set out to assess the appropriateness and robustness of two partitioning approaches used by researchers to assess the likelihood of different mechanisms structuring beta diversity.


```
## $coef
##                                             betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                           6.226672e-01 1.000
## env_dist_matrices[["all"]][["geodist_Bac"]]                                                   9.318868e-05 0.001
## 
## $r.squared
##        R2      pval 
## 0.1529891 0.0010000 
## 
## $F.test
##         F    F.pval 
## 21111.858     0.001
```

\

### Pure environmental effects (E) {.tabset .tabset-pills}

#### Climate


```
## $coef
##                                                  betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                 0.641237788 0.001
## env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]]                                                   -0.003748681 0.031
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                    0.045535238 0.001
## 
## $r.squared
##        R2      pval 
## 0.1837113 0.0010000 
## 
## $F.test
##         F    F.pval 
## 13152.655     0.001
```

\

#### Edaphic


```
## $coef
##                                                              betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                            0.6115309025 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                   0.0135245566 0.001
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                   0.0490271406 0.001
## env_dist_matrices[["all"]][["phos_m.std_Bac"]]                                                                 0.0003235113 0.955
## env_dist_matrices[["all"]][["ammonium_m.std_Bac"]]                                                             0.0073731754 0.149
## 
## $r.squared
##        R2      pval 
## 0.3274488 0.0010000 
## 
## $F.test
##         F    F.pval 
## 14226.626     0.001
```

\

#### Plant-Associated


```
## $coef
##                                                          betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                        0.6849615585 0.314
## env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]]                                                         -0.0052974013 0.008
## env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]]                                                         -0.0001846545 0.923
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                   0.0104194653 0.001
## 
## $r.squared
##         R2       pval 
## 0.01755741 0.00100000 
## 
## $F.test
##        F   F.pval 
## 696.2733   0.0010
```

\

#### All Environmental {.tabset .tabset-pills}

#### All variables


```
## $coef
##                                                              betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                            0.5805576685 0.001
## env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]]                                                               0.0026688166 0.071
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                               0.0301481689 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                   0.0065073436 0.006
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                   0.0448278408 0.001
## env_dist_matrices[["all"]][["phos_m.std_Bac"]]                                                                 0.0037567400 0.431
## env_dist_matrices[["all"]][["ammonium_m.std_Bac"]]                                                             0.0002637479 0.952
## env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]]                                                             -0.0023160412 0.113
## env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]]                                                              0.0021744134 0.140
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                       0.0097719064 0.001
## 
## $r.squared
##        R2      pval 
## 0.4180396 0.0010000 
## 
## $F.test
##        F   F.pval 
## 9328.393    0.001
```

\

#### Down-selected model

All predictor variables included in down-selected MRM model if $p$-value ≤ 0.01.\

*Not significant:* phos, ammonium, avg_SRL, avg_SLA \


```
## $coef
##                                                              betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                             0.581070202 0.001
## env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]]                                                                0.002871445 0.045
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                                0.030851370 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                    0.009019081 0.001
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                    0.044770974 0.001
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                        0.009548210 0.001
## 
## $r.squared
##        R2      pval 
## 0.4163862 0.0010000 
## 
## $F.test
##         F    F.pval 
## 16677.885     0.001
```


### Mixed effects (E \* S) {.tabset .tabset-pills}

#### All variables


```
## $coef
##                                                              betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                            5.700091e-01 0.001
## env_dist_matrices[["all"]][["geodist_Bac"]]                                                                    3.973991e-05 0.001
## env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]]                                                              -8.563296e-04 0.609
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                               2.102718e-02 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                   6.002457e-03 0.006
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                   4.387625e-02 0.001
## env_dist_matrices[["all"]][["phos_m.std_Bac"]]                                                                -5.433208e-04 0.918
## env_dist_matrices[["all"]][["ammonium_m.std_Bac"]]                                                             3.843039e-03 0.359
## env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]]                                                             -2.713268e-03 0.066
## env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]]                                                              1.843893e-03 0.207
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                       9.630448e-03 0.001
## 
## $r.squared
##        R2      pval 
## 0.4327294 0.0010000 
## 
## $F.test
##        F   F.pval 
## 8915.540    0.001
```

\

#### Down-selected model

All predictor variables included in down-selected MRM model if $p$-value ≤ 0.01.\

*Not significant:* GDD3yr, phos, ammonium, avg_SLA \


```
## $coef
##                                                              betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                            5.719529e-01 0.001
## env_dist_matrices[["all"]][["geodist_Bac"]]                                                                    3.964825e-05 0.001
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                               2.139460e-02 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                   7.986346e-03 0.001
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                   4.377421e-02 0.001
## env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]]                                                             -2.521818e-03 0.095
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                       9.519357e-03 0.001
## 
## $r.squared
##        R2      pval 
## 0.4317503 0.0010000 
## 
## $F.test
##         F    F.pval 
## 14800.575     0.001
```

\

### Derived measures {.tabset .tabset-pills}

#### All variables


```
## $coef
##                                                                  betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                                6.132139e-01 0.001
## env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]]                                                             -1.101603e-03 0.021
## env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]]                                                   1.904166e-03 0.001
## env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]]                                                   5.021911e-05 0.025
## env_dist_matrices[["all"]][["ngrass_persite_Bac"]]                                                                 2.533240e-03 0.469
## env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]]                                                     1.250635e-02 0.001
## env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]]                                                     8.510752e-03 0.001
## env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]]                                                                 1.807563e-05 0.001
## env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]]                                                                -3.471799e-05 0.001
## 
## $r.squared
##        R2      pval 
## 0.2510436 0.0010000 
## 
## $F.test
##        F   F.pval 
## 4897.018    0.001
```

\

#### Down-selected model

All predictor variables included in down-selected MRM model if $p$-value ≤ 0.01.\

*Not significant:* ngrass_persite_Bac\


```
## $coef
##                                                                  betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                                6.132977e-01 0.001
## env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]]                                                             -8.310788e-04 0.002
## env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]]                                                   1.905605e-03 0.001
## env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]]                                                   5.389795e-05 0.016
## env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]]                                                     1.251785e-02 0.001
## env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]]                                                     8.371470e-03 0.002
## env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]]                                                                 1.801575e-05 0.001
## env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]]                                                                -3.650145e-05 0.001
## 
## $r.squared
##        R2      pval 
## 0.2509216 0.0010000 
## 
## $F.test
##        F   F.pval 
## 5593.010    0.001
```

\

### All PredVar {.tabset .tabset-pills}

#### All variables






\

Full Model Summary:\

  - $R^2$-value = 0.5194, $P$-value = 0.001, $F_{test}$ = 7017.98, $F_{test}-Pvalue$ = 0.001
  
    - These terms were significant ($P$-value < 0.05):  (sorted by decreasing coefficient)

\
\



```
## $coef
##                                                                  betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                                5.470762e-01 0.001
## env_dist_matrices[["all"]][["geodist_Bac"]]                                                                        2.946224e-05 0.001
## env_dist_matrices[["all"]][["GDD3yr_m.std_Bac"]]                                                                   9.462208e-04 0.558
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                                   1.750727e-02 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                       5.475340e-03 0.008
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                       3.892120e-02 0.001
## env_dist_matrices[["all"]][["phos_m.std_Bac"]]                                                                     3.199045e-03 0.434
## env_dist_matrices[["all"]][["ammonium_m.std_Bac"]]                                                                -9.188637e-04 0.843
## env_dist_matrices[["all"]][["avg_SRL_m.std_Bac"]]                                                                 -3.733545e-05 0.984
## env_dist_matrices[["all"]][["avg_SLA_m.std_Bac"]]                                                                 -7.581344e-04 0.559
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                           1.022410e-02 0.001
## env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]]                                                             -1.497733e-03 0.001
## env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]]                                                   1.127648e-03 0.001
## env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]]                                                  -4.845988e-05 0.013
## env_dist_matrices[["all"]][["ngrass_persite_Bac"]]                                                                 1.198784e-02 0.001
## env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]]                                                     9.534016e-03 0.001
## env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]]                                                     1.005991e-02 0.001
## env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]]                                                                 7.985898e-06 0.001
## env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]]                                                                -3.035574e-05 0.001
## 
## $r.squared
##        R2      pval 
## 0.5194428 0.0010000 
## 
## $F.test
##        F   F.pval 
## 7017.978    0.001
```


\

#### Down-selected model


```
## $coef
##                                                                  betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                                5.468599e-01 0.001
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                       3.882527e-02 0.001
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                                   1.755755e-02 0.001
## env_dist_matrices[["all"]][["ngrass_persite_Bac"]]                                                                 1.172080e-02 0.002
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                           1.021355e-02 0.001
## env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]]                                                     9.852880e-03 0.001
## env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]]                                                     9.580636e-03 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                       7.256542e-03 0.001
## env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]]                                                             -1.490614e-03 0.002
## env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]]                                                   1.122729e-03 0.001
## env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]]                                                  -4.503312e-05 0.017
## env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]]                                                                -3.110363e-05 0.001
## env_dist_matrices[["all"]][["geodist_Bac"]]                                                                        3.060170e-05 0.001
## env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]]                                                                 8.248948e-06 0.001
## 
## $r.squared
##        R2      pval 
## 0.5190096 0.0010000 
## 
## $F.test
##        F   F.pval 
## 9700.769    0.001
```

All predictor variables included in down-selected MRM model if $P$-value ≤ 0.05 and the order of model terms was determined by ranking the absolute value of the regression coefficients for the significant model terms.\

*Not significant:* \


**Down-selected model summary:**\

$R^2$-value = 0.519, $P$-value = 0.001, $F_{test}$ = 9700.77, $F_{test}-Pvalue$ = 0.001

    - These terms were significant ($P$-value < 0.05):  (sorted by decreasing coefficient)


```
## $coef
##                                                                  betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]]  pval
## Int                                                                                                                5.468599e-01 0.001
## env_dist_matrices[["all"]][["pH_m.std_Bac"]]                                                                       3.882527e-02 0.001
## env_dist_matrices[["all"]][["ppt3yr_m.std_Bac"]]                                                                   1.755755e-02 0.001
## env_dist_matrices[["all"]][["ngrass_persite_Bac"]]                                                                 1.172080e-02 0.002
## env_dist_matrices[["all"]][["herbivory_perc_m.std_Bac"]]                                                           1.021355e-02 0.001
## env_dist_matrices[["all"]][["ngrass_perFun_sor_clusters_Bac"]]                                                     9.852880e-03 0.001
## env_dist_matrices[["all"]][["ngrass_perBac_sor_clusters_Bac"]]                                                     9.580636e-03 0.001
## env_dist_matrices[["all"]][["soil_water_content_m.std_Bac"]]                                                       7.256542e-03 0.001
## env_dist_matrices[["all"]][["nsamples_per_Site_Bac"]]                                                             -1.490614e-03 0.002
## env_dist_matrices[["all"]][["nsamples_perBac_sor_clusters_Bac"]]                                                   1.122729e-03 0.001
## env_dist_matrices[["all"]][["nsamples_perFun_sor_clusters_Bac"]]                                                  -4.503312e-05 0.017
## env_dist_matrices[["all"]][["Fun_gamma_Site_Bac"]]                                                                -3.110363e-05 0.001
## env_dist_matrices[["all"]][["geodist_Bac"]]                                                                        3.060170e-05 0.001
## env_dist_matrices[["all"]][["Bac_gamma_Site_Bac"]]                                                                 8.248948e-06 0.001
## 
## $r.squared
##        R2      pval 
## 0.5190096 0.0010000 
## 
## $F.test
##        F   F.pval 
## 9700.769    0.001
```

\



# IGNORE {.hidden}


``` r
decay.Bac_all.exp.sor<-decay.model(y=betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sor"]], x=env_dist_matrices[["all"]][["geodist_Bac"]], y.type="dissim", model.type="exp",perm = 1000)
# $aic -264040.7
# $pseudo.r.squared 0.1566976

decay.Bac_all.exp.sim<-decay.model(y=betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sim"]], x=env_dist_matrices[["all"]][["geodist_Bac"]], y.type="dissim", model.type="exp")
# $aic -241756
# $pseudo.r.squared 0.1260104

decay.Bac_all.exp.sne<-decay.model(y=betapart_results[["Bac"]][["all"]][["pairwise"]][["beta.sne"]], x=env_dist_matrices[["all"]][["geodist_Bac"]], y.type="dissim", model.type="exp")
# $aic -264040.7
# $pseudo.r.squared 0.1566976 0.0003461677


decay.Fun_all.exp.sor<-decay.model(y=betapart_results[["Fun"]][["all"]][["pairwise"]][["beta.sor"]], x=env_dist_matrices[["all"]][["geodist_Fun"]], y.type="dissim", model.type="exp",perm = 1000)
# $aic -130861.6
# $pseudo.r.squared 0.0211216

decay.Fun_all.exp.sim<-decay.model(y=betapart_results[["Fun"]][["all"]][["pairwise"]][["beta.sim"]], x=env_dist_matrices[["all"]][["geodist_Fun"]], y.type="dissim", model.type="exp")
# $aic -117996.9
# $pseudo.r.squared 0.01433185

decay.Fun_all.exp.sne<-decay.model(y=betapart_results[["Fun"]][["all"]][["pairwise"]][["beta.sne"]], x=env_dist_matrices[["all"]][["geodist_Fun"]], y.type="dissim", model.type="exp")
# $aic -442536.6
# $pseudo.r.squared 0.003166138

# Site-block bootstrap

# Assessing the differences between parameters of two distance-decay models computed with decay.model().
zdepDDBF_All_sor<-zdep(decay.Bac_all.exp.sor, decay.Fun_all.exp.sor, resamples=500, st.val = c(1, 0))

zdepDDBF_All_sim<-zdep(decay.Bac_all.exp.sim, decay.Fun_all.exp.sim, resamples=500, st.val = c(1, 0))

zdepDDBF_All_sne<-zdep(decay.Bac_all.exp.sne, decay.Fun_all.exp.sne, resamples=500, st.val = c(1, 0))

# plot.decay.pretty(decay.Fun_F1.exp.sor, col="#C51B7D", add=F, main="F1", 
#            xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
#            col.line="#8E0152",xaxp = c(0,1500,3),
#            ylab="",xlab="")
# 
# plot.decay.pretty(decay.Fun_nonF1.exp.sor, col="#7FBC41", add=T, main="non-F1",
#            xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
#            col.line="#276419",xaxp = c(0,1500,3),
#            ylab="",xlab="")
# mtext("Distance between Communities (in km)", side = 1, line = -2, outer = TRUE)
```


``` r
plot.decay.pretty(decay.Bac_all.exp.sor, col="#006e90", main="Bacteria\n",
           lty=1,lwd=5,cex.main=1.1,
           xlim = c(0,1600),ylim = c(0,1),col.line="#004E66",
           xaxp = c(0,1500,3),
           ylab="Total\nDissimilarity",xlab="")
# text(2, 0.1, paste0("a = ", round(decay.Bac_all.exp.sor$first.parameter,3),", b = ",formatC(decay.Bac_all.exp.sor$second.parameter,digits=3, format="e")),adj = c(0,0), cex=0.8)
mtext(paste0("βsor ~ S: pseudo-R2 = ", round(decay.Bac_all.exp.sor$pseudo.r.squared,3),
             ", p-value = ",round(decay.Bac_all.exp.sor$p.value,3)), 
      side = 3, line = 0.25, outer = F,adj = c(0,0), cex=0.7) # side 1=bottom, 2=left, 3=top, 4=right
```



(ref:DD-BF-all-fig-caption) Distance decay models of pairwise bacterial (blue) and fungal (orange) community dissimilarities, across all sites and samples. Models were fit using negative exponential to describe decay of community similarity with spatial distance (in km). The first model parameter ('a') is the intercept, the second parameter ('b') is the slope, the $pseudo-R^2$ being proportion of the variation in the dependent variable that the model accounts for, calculated as []. A) Bac βsor \~ S: $pseudo-R^2$ = , a = , b = , $p$-value = . B) Fungal βsor \~ S: $pseudo-R^2$ = , a = , b = , $p$-value = . Both model parameters differed between domains (βsor \~ S assessed via block-site bootstrap; 'a' $p$-value = , 'b' $p$-value = ).




