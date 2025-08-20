---
title: "MRM Results"
author: "Kelli Feeser"
date: "2025-07-18"
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 5
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
                  "nsamples_at_site_within_Fun_sor_clus2","ngrasses_at_site_within_Fun_sor_clus2",
                  "Bac_gamma_Site","Fun_gamma_Site",
                  "Bac_Observed","Fun_Observed",
                  "Bac_Chao1","Fun_Chao1",
                  "Bac_InvSimpson","Fun_InvSimpson",
                  "Bac_Shannon","Fun_Shannon")

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
              "nsamples_at_site_within_Fun_sor_clus2","ngrasses_at_site_within_Fun_sor_clus2",
                  "Bac_gamma_Site","Fun_gamma_Site",
                  "Bac_Observed","Fun_Observed",
                  "Bac_Chao1","Fun_Chao1",
                  "Bac_InvSimpson","Fun_InvSimpson",
                  "Bac_Shannon","Fun_Shannon")

vard_all_numeric <- c("Latitude","Longitude","Elevation_m",
              "GDD3yr_m.std","ppt3yr_m.std",
              "soil_water_content_m.std","pH_m.std","phos_m.std","ammonium_m.std","SOM_m.std",
              "avg_SRL_m.std","avg_SLA_m.std","herbivory_perc_m.std",
              "nsamples_per_Site",
              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "nsamples_at_site_within_Fun_sor_clus2","ngrasses_at_site_within_Fun_sor_clus2",
                  "Bac_gamma_Site","Fun_gamma_Site",
                  "Bac_Observed","Fun_Observed",
                  "Bac_Chao1","Fun_Chao1",
                  "Bac_InvSimpson","Fun_InvSimpson",
                  "Bac_Shannon","Fun_Shannon")

vard_all_numeric_env <- c("GDD3yr_m.std","ppt3yr_m.std","soil_water_content_m.std","pH_m.std","phos_m.std","ammonium_m.std","SOM_m.std","avg_SRL_m.std","avg_SLA_m.std","herbivory_perc_m.std",
                          "nsamples_per_Site",
              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "nsamples_at_site_within_Fun_sor_clus2","ngrasses_at_site_within_Fun_sor_clus2",
                  "Bac_gamma_Site","Fun_gamma_Site",
                  "Bac_Observed","Fun_Observed",
                  "Bac_Chao1","Fun_Chao1",
                  "Bac_InvSimpson","Fun_InvSimpson",
                  "Bac_Shannon","Fun_Shannon")

vard_all_numeric_intpred <- c("nsamples_per_Site",
                              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "nsamples_at_site_within_Fun_sor_clus2","ngrasses_at_site_within_Fun_sor_clus2",
                  "Bac_gamma_Site","Fun_gamma_Site",
                  "Bac_Observed","Fun_Observed",
                  "Bac_Chao1","Fun_Chao1",
                  "Bac_InvSimpson","Fun_InvSimpson",
                  "Bac_Shannon","Fun_Shannon")
vard_all_numeric_env_intpred <-union(vard_all_numeric_env,vard_all_numeric_intpred)

vard_all_numeric_env_intpred_NOTSTD <- c("Latitude","Longitude","Elevation_m",
              "GDD3yr","ppt3yr",
              "soil_water_content","pH","phos","ammonium","SOM",
              "avg_SRL","avg_SLA","herbivory_perc",
                  "Bac_gamma_Site","Fun_gamma_Site",
                  "Bac_Observed","Fun_Observed",
                  "Bac_Chao1","Fun_Chao1",
                  "Bac_InvSimpson","Fun_InvSimpson",
                  "Bac_Shannon","Fun_Shannon",
              "nsamples_per_Site",
              "nsamples_perBac_sor_clusters","nsamples_perFun_sor_clusters",
              "ngrass_persite","ngrass_perBac_sor_clusters","ngrass_perFun_sor_clusters",
              "nsamples_at_site_within_Fun_sor_clus2","ngrasses_at_site_within_Fun_sor_clus2")
```

#### generate distance matrices of env var and Lat/long distance matrix calc


``` r
var_Fun_sor_clus2 <- levels(sd$Fun_sor_clus2)
var_Fun_sor_clusters <- levels(sd$Fun_sor_clusters)
var_Bac_sor_clusters <- levels(sd$Bac_sor_clusters)
var_Site <- levels(sd$Site)
var_Grass <- levels(sd$Grass)

# Create an empty list to store the distance matrices
env_dist_matrices <- list("all"=list(),"allNSTD"=list(),"Site"=list(),"Grass"=list(),"Bac_sor_clusters"=list(),
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

# allNSTD NOT STANDARDIZED
for (var in vard_all_numeric_env_intpred_NOTSTD) {
  # Calculate geodistance matrices 
  Bac_all.geo<-as(subset(sd, select = c(Longitude,Latitude)), "data.frame")
  Bac_all.geodist_mat <- as.dist(geodist(Bac_all.geo, measure = 'geodesic' )/1000) #converting it to km
  
  Fun_all.geo<-as(subset(sd, select = c(Longitude,Latitude)), "data.frame")
  Fun_all.geodist_mat <- as.dist(geodist(Fun_all.geo, measure = 'geodesic' )/1000) #converting it to km
  
  # Store the geodist matrices in the list using variable name as key
  env_dist_matrices$allNSTD[["geodist_Bac"]] <- Bac_all.geodist_mat
  env_dist_matrices$allNSTD[["geodist_Fun"]] <- Fun_all.geodist_mat

  # Subset the data for the current variable
  Bac_subset <- subset(as.data.frame(sample_data(Bac_wholecommunity)), select = var)
  Fun_subset <- subset(as.data.frame(sample_data(Fun_wholecommunity)), select = var)
  
  # Calculate distance matrices and store them in the list
  Bac_dist_matrix <- dist(Bac_subset, method = "euclidean", diag = TRUE, upper = FALSE)
  Fun_dist_matrix <- dist(Fun_subset, method = "euclidean", diag = TRUE, upper = FALSE)
  
  # Store the matrices in the list using variable name as key
  env_dist_matrices$allNSTD[[paste0(var,"_Bac")]] <- Bac_dist_matrix
  env_dist_matrices$allNSTD[[paste0(var,"_Fun")]] <- Fun_dist_matrix

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


# saveRDS(env_dist_matrices, file = "../processed_data/clean_rds_saves/env_dist_matrices_MRM.rds")

saveRDS(env_dist_matrices, file = "../docs/processed_data/clean_rds_saves/env_dist_matrices_MRM.rds")
```




\
\

## load functions








------------------------------------------------------------------------

------------------------------------------------------------------------

\
\

# Results

## Results - Fungi

\

### Landscape-scale: All samples (agnostic to site) {.tabset}

#### Pure spatial effects (S)

Distance-decay relationships between geographic distance (in km) between communities and i) total community pairwise dissimilarity (β~sor~), ii) spatial turnover-resultant dissimilarity (β~sim~), and iii) nestedness-resultant dissimilarity (β~sne~) using 1,000 permutations. Differences between bacterial and fungal model parameters were assessed via block-site bootstrap whether the parameters of both models are equal (n = 1,000 bootstrap resamples). Both tests were conducted independently, one for the equality of the first parameters of both models, another for the equality of the second parameters (slopes) of both models.







The main current hypotheses about the origin of beta diversity are as follows:

1) Species composition is uniform over large areas. This hypothesis, which plays the role of a null model, emphasizes the role of biological interactions. It suggests that communities are dominated by a limited suite of competitively superior species (Pitman et al. 1999, 2001); beta diversity is small.

2) Species composition fluctuates in a random, autocorrelated way. This hypothesis emphasizes spatially limited dispersal history. Models derived from neutral theory state that all species are demographically and competitively equal. Differences are created through spatially limited dispersal of species drawn at random from a metacommunity, plus possibly the appearance of newly evolved species in different areas. Neutral models differ in the details of the mechanisms that they invoke (Bell 2001, Hubbell 2001, He 2005).

3) Species distributions are related to environmental conditions. This hypothesis emphasizes environmental control. Landscapes are mosaics where species composition is controlled by environmental site characteristics (Whittaker 1956, Bray and Curtis 1957, Hutchinson 1957, Gentry 1988, Tuomisto et al. 1995).

Testing these hypotheses is important for understanding the functioning of ecosystems, for the conservation of biodiversity, and for ecosystem management. Regarding the establishment of natural reserves, e.g., hypothesis 1 implies that all parts of the ecosystem are equivalent. Reserves can be located anywhere. Hypothesis 2 implies that different parts of the ecosystem may, for historical reasons, sustain different species compositions, although these parts are environmentally equivalent. Portions of space supporting the different species compositions should be preserved. Reserves must be large, allowing the dynamics to go on without many species going extinct. Hypothesis 3 implies that all parts of the ecosystem are not equivalent. Reserves must represent the different types of habitat and each portion must be of sufficient size to be sustainable. The parts representing favorable dispersion routes must be especially preserved.
(https://esajournals.onlinelibrary.wiley.com/doi/10.1890/05-0549)


When studying the origin of beta diversity, one must consider different hypotheses and answer the following questions. (1) Is the variation in species composition among sites random, i.e., devoid of significant spatial pattern? A positive answer will support hypothesis 1. (2) Is there significant spatial patchiness (different from random) in the distributions of species? A positive answer will support hypothesis 2, and possibly hypothesis 3 if the environmental variables influencing species distributions are spatially structured. (3) Can the environmental variables explain a significant proportion of the community composition variation? A positive answer will support hypothesis 3, which is compatible with hypothesis 2.

Empirical data must be used to determine the likelihood of each hypothesis in different systems and at different spatial scales. To test these hypotheses, the variation of community composition at many sites must be analyzed to determine if significant spatial patterns (different from random) are present in the data and if the environmental variables explain a significant proportion of the community composition variation. In this contribution, we explain how hypotheses about the origin of beta diversity can be tested by partitioning the spatial variation of community composition (presence– absence or abundance data) with respect to environmental variables and spatial base functions. Next we set out to assess the appropriateness and robustness of two partitioning approaches used by researchers to assess the likelihood of different mechanisms structuring beta diversity.

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-Spatial-rawresults-Fun)MRM results for all Fungal samples assessing βsor ~ S (Spatial - geographic distance)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0169 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 2005.13 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7846 </td>
   <td style="text-align:center;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> geodist </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> 0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
</tbody>
</table>

\

##### Spatial decay plots




<img src="../docs/github_MRM_SEM__fungi_figures/plot-Fun-spatial-decay-1.png" height="70%" />

\

#### Pure environmental effects (E) {.tabset .tabset-pills}

##### Climate

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-E-Climate-rawresults-Fun)MRM results for all fungal samples assessing βsor ~ E_climate (Environmental - Climate)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0096 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 567.36 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.8281 </td>
   <td style="text-align:center;"> 0.009 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0164 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 9, 93, 255) !important;"> 0.0100 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
</tbody>
</table>

\

##### Edaphic

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-E-Edaphic-rawresults-Fun)MRM results for all fungal samples assessing βsor ~ E_edaphic (Environmental - Edaphic)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0163 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 482.99 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.8310 </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ammonium </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0265 </td>
   <td style="text-align:center;"> 0.025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> phos </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 13, 96, 255) !important;"> 0.0144 </td>
   <td style="text-align:center;"> 0.219 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pH </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 11, 94, 255) !important;"> 0.0087 </td>
   <td style="text-align:center;"> 0.006 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> soil_water_content </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 7, 90, 255) !important;"> -0.0065 </td>
   <td style="text-align:center;"> 0.198 </td>
  </tr>
</tbody>
</table>

\

##### Plant-Associated

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-E-Plant-rawresults-Fun)MRM results for all fungal samples assessing βsor ~ E_plant (Environmental - Plant-Associated)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0245 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 978.17 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7942 </td>
   <td style="text-align:center;"> 0.997 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 9, 93, 255) !important;"> 0.0200 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SLA </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 6, 90, 255) !important;"> 0.0106 </td>
   <td style="text-align:center;"> 0.004 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SRL </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0044 </td>
   <td style="text-align:center;"> 0.224 </td>
  </tr>
</tbody>
</table>

\

##### All Environmental (Climate, Edaphic, Plant-Assoc.) {.tabset .tabset-pills}

###### All environmental variables (Full model)

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-E-All-rawresults-Fun)MRM results full model for all fungal samples assessing βsor ~ E_all (Environmental - Climate, Edaphic, and Plant-Associated)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0456 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 620.81 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.8044 </td>
   <td style="text-align:center;"> 0.457 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ammonium </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0293 </td>
   <td style="text-align:center;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 16, 100, 255) !important;"> 0.0185 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> phos </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 16, 100, 255) !important;"> 0.0185 </td>
   <td style="text-align:center;"> 0.077 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 14, 97, 255) !important;"> 0.0146 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 6, 90, 255) !important;"> -0.0130 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SLA </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 13, 96, 255) !important;"> 0.0104 </td>
   <td style="text-align:center;"> 0.003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> soil_water_content </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 8, 92, 255) !important;"> -0.0065 </td>
   <td style="text-align:center;"> 0.206 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pH </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 11, 94, 255) !important;"> 0.0047 </td>
   <td style="text-align:center;"> 0.176 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SRL </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 9, 93, 255) !important;"> -0.0019 </td>
   <td style="text-align:center;"> 0.618 </td>
  </tr>
</tbody>
</table>

\

###### Down-selected model




All predictor variables included in down-selected MRM model if $P$-value ≤ 0.05 and the order of model terms was determined by ranking the absolute value of the regression coefficients for the significant model terms.\

*Not significant:* Int, soil_water_content, pH, phos, avg_SRL\


**Down-selected model summary:**\

$R^2$-value = 0.0456, $P$-value = 0.001, $F_{test}$ = 620.81, $F_{test}-Pvalue$ = 0.001

   -These terms were significant ($P$-value < 0.05): Intercept, ammonium, herbivory_perc, ppt3yr, GDD3yr, avg_SLA (sorted by decreasing coefficient)
   \

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-E-All-rawresults-DS-Fun)MRM results down-selected model for all fungal samples assessing βsor ~ E_all (Environmental - Climate, Edaphic, and Plant-Associated)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0436 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 1064.42 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.8066 </td>
   <td style="text-align:center;"> 0.333 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 12, 95, 255) !important;"> 0.0187 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ammonium </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0153 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 10, 93, 255) !important;"> 0.0152 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0143 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SLA </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 9, 93, 255) !important;"> 0.0098 </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
</tbody>
</table>

\

#### Mixed effects (E \* S) {.tabset .tabset-pills}

##### All variables (Full model)

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-ES-All-rawresults-Fun)MRM results full mixed model for all fungal samples assessing βsor ~ E*S (Environmental - Climate, Edaphic, and Plant-Associated)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0809 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 1028.29 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7776 </td>
   <td style="text-align:center;"> 0.930 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0219 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ammonium </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0205 </td>
   <td style="text-align:center;"> 0.046 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 14, 97, 255) !important;"> 0.0182 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SLA </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 11, 94, 255) !important;"> 0.0096 </td>
   <td style="text-align:center;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 5, 89, 255) !important;"> -0.0084 </td>
   <td style="text-align:center;"> 0.013 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> phos </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 11, 94, 255) !important;"> 0.0079 </td>
   <td style="text-align:center;"> 0.441 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> soil_water_content </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 5, 89, 255) !important;"> -0.0078 </td>
   <td style="text-align:center;"> 0.120 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SRL </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 7, 90, 255) !important;"> -0.0029 </td>
   <td style="text-align:center;"> 0.421 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pH </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 9, 93, 255) !important;"> 0.0023 </td>
   <td style="text-align:center;"> 0.504 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> geodist </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 8, 92, 255) !important;"> 0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
</tbody>
</table>

\

##### Down-selected model



\

All predictor variables included in down-selected MRM model if $P$-value ≤ 0.05 and the order of model terms was determined by ranking the absolute value of the regression coefficients for the significant model terms.\

*Not significant:* Int, soil_water_content, pH, phos, avg_SRL\


**Down-selected model summary:**\

$R^2$-value = 0.0809, $P$-value = 0.001, $F_{test}$ = 1028.29, $F_{test}-Pvalue$ = 0.001

   -These terms were significant ($P$-value < 0.05): Intercept, GDD3yr, ammonium, herbivory_perc, avg_SLA, ppt3yr, geodist (sorted by decreasing coefficient)
   \


<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-ES-All-rawresults-DS-Fun)MRM results down-selected mixed model for all fungal samples assessing βsor ~ E*S (Environmental - Climate, Edaphic, and Plant-Associated)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.0793 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 1678.69 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7754 </td>
   <td style="text-align:center;"> 0.984 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.0230 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 14, 97, 255) !important;"> 0.0183 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ammonium </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 3, 86, 255) !important;"> -0.0176 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SLA </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 11, 94, 255) !important;"> 0.0094 </td>
   <td style="text-align:center;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 6, 90, 255) !important;"> -0.0087 </td>
   <td style="text-align:center;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> geodist </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 8, 92, 255) !important;"> 0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
</tbody>
</table>

\

#### Derived measures {.tabset .tabset-pills}

##### All variables (Full model)

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-Intpred-All-rawresults-Fun)MRM results full model for all fungal samples assessing βsor ~ D (Derived measures)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.3596 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 3645.79 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7112 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_persite </td>
   <td style="text-align:center;color: white !important;background-color: rgba(58, 85, 140, 255) !important;"> 0.1666 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrasses_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.1584 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Shannon </td>
   <td style="text-align:center;color: white !important;background-color: rgba(64, 69, 136, 255) !important;"> 0.0964 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 52, 129, 255) !important;"> 0.0278 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Shannon </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 127, 255) !important;"> 0.0239 </td>
   <td style="text-align:center;"> 0.003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0183 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_per_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(72, 41, 121, 255) !important;"> -0.0151 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_InvSimpson </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 42, 122, 255) !important;"> -0.0110 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_perBac_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 46, 124, 255) !important;"> 0.0032 </td>
   <td style="text-align:center;"> 0.244 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perBac_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> -0.0006 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Observed </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 46, 124, 255) !important;"> 0.0004 </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 46, 124, 255) !important;"> 0.0004 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Chao1 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> -0.0001 </td>
   <td style="text-align:center;"> 0.125 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.033 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Chao1 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.049 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Observed </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_InvSimpson </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.796 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.050 </td>
  </tr>
</tbody>
</table>

\

##### Down-selected model



All predictor variables included in down-selected MRM model if $P$-value ≤ 0.05 and the order of model terms was determined by ranking the absolute value of the regression coefficients for the significant model terms.\

*Not significant:* ngrass_perBac_sor_clusters, Bac_Observed, Fun_Chao1, Bac_InvSimpson\


**Down-selected model summary:**\

$R^2$-value = 0.3596, $P$-value = 0.001, $F_{test}$ = 3645.79, $F_{test}-Pvalue$ = 0.001

   -These terms were significant ($P$-value < 0.05): Intercept, ngrass_persite, ngrasses_at_site_within_Fun_sor_clus2, Fun_Shannon, ngrass_perFun_sor_clusters, Bac_Shannon, nsamples_at_site_within_Fun_sor_clus2, nsamples_per_Site, Fun_InvSimpson, nsamples_perBac_sor_clusters, Fun_Observed, nsamples_perFun_sor_clusters, Fun_gamma_Site, Bac_Chao1, Bac_gamma_Site (sorted by decreasing coefficient)
   \

\

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-Intpred-All-rawresults-DS-Fun)MRM results down-selected model for all fungal samples assessing βsor ~ D (Derived measures)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.3168 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 4517.08 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7193 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_persite </td>
   <td style="text-align:center;color: white !important;background-color: rgba(59, 82, 139, 255) !important;"> 0.1601 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrasses_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.1554 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 52, 129, 255) !important;"> 0.0337 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Shannon </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 127, 255) !important;"> 0.0251 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 48, 126, 255) !important;"> 0.0174 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_per_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(72, 41, 121, 255) !important;"> -0.0135 </td>
   <td style="text-align:center;"> 0.003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_InvSimpson </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 44, 122, 255) !important;"> -0.0055 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Observed </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> 0.0007 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perBac_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> -0.0005 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> 0.0003 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Chao1 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.017 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.318 </td>
  </tr>
</tbody>
</table>

\

#### All PredVar {.tabset .tabset-pills}

##### All variables (Full model)

\

Full Model Summary:\

  - $R^2$-value = 0.406, $P$-value = 0.001, $F_{test}$ = 2852.34, $F_{test}-Pvalue$ = 0.001
  
  - These terms were significant ($P$-value < 0.05): Intercept, ngrass_persite, ngrasses_at_site_within_Fun_sor_clus2, Fun_Shannon, ngrass_perFun_sor_clusters, ppt3yr, ammonium, nsamples_at_site_within_Fun_sor_clus2, GDD3yr, nsamples_per_Site, herbivory_perc, Fun_InvSimpson, soil_water_content, nsamples_perBac_sor_clusters, Fun_Observed, nsamples_perFun_sor_clusters, Fun_gamma_Site, geodist, Bac_gamma_Site (sorted by decreasing coefficient)

\
\


<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-Var-All-rawresults-Fun)MRM results full model for all fungal samples assessing βsor ~ All (All variables and measures)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.406 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 2852.34 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.6943 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_persite </td>
   <td style="text-align:center;color: white !important;background-color: rgba(54, 92, 141, 255) !important;"> 0.1776 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrasses_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.1757 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Shannon </td>
   <td style="text-align:center;color: white !important;background-color: rgba(64, 70, 136, 255) !important;"> 0.0839 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 56, 130, 255) !important;"> 0.0261 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> -0.0214 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ammonium </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> -0.0205 </td>
   <td style="text-align:center;"> 0.014 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 56, 129, 255) !important;"> 0.0205 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> -0.0178 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_per_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> -0.0174 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 53, 129, 255) !important;"> 0.0163 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Shannon </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 52, 129, 255) !important;"> 0.0103 </td>
   <td style="text-align:center;"> 0.207 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_InvSimpson </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> -0.0090 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> phos </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 52, 128, 255) !important;"> 0.0081 </td>
   <td style="text-align:center;"> 0.276 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> soil_water_content </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> -0.0075 </td>
   <td style="text-align:center;"> 0.048 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_perBac_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 127, 255) !important;"> 0.0053 </td>
   <td style="text-align:center;"> 0.062 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> pH </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 127, 255) !important;"> 0.0048 </td>
   <td style="text-align:center;"> 0.064 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SLA </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0014 </td>
   <td style="text-align:center;"> 0.609 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> avg_SRL </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0008 </td>
   <td style="text-align:center;"> 0.797 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perBac_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 49, 126, 255) !important;"> -0.0007 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Observed </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0005 </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0004 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_InvSimpson </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0001 </td>
   <td style="text-align:center;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Chao1 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 49, 126, 255) !important;"> -0.0001 </td>
   <td style="text-align:center;"> 0.116 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 49, 126, 255) !important;"> -0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> geodist </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 51, 126, 255) !important;"> 0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Observed </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 49, 126, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.514 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 49, 126, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_Chao1 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 49, 126, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.410 </td>
  </tr>
</tbody>
</table>


\

##### Down-selected model



All predictor variables included in down-selected MRM model if $P$-value ≤ 0.05 and the order of model terms was determined by ranking the absolute value of the regression coefficients for the significant model terms.\

*Not significant:* pH, phos, avg_SRL, avg_SLA, ngrass_perBac_sor_clusters, Bac_Observed, Bac_Chao1, Fun_Chao1, Bac_InvSimpson, Bac_Shannon\


**Down-selected model summary:**\

$R^2$-value = 0.3894, $P$-value = 0.001, $F_{test}$ = 4657.98, $F_{test}-Pvalue$ = 0.001

   -These terms were significant ($P$-value < 0.05): Intercept, ngrass_persite, ngrasses_at_site_within_Fun_sor_clus2, Fun_Shannon, ngrass_perFun_sor_clusters, ppt3yr, GDD3yr, herbivory_perc, nsamples_at_site_within_Fun_sor_clus2, nsamples_per_Site, Fun_InvSimpson, nsamples_perBac_sor_clusters, nsamples_perFun_sor_clusters, Fun_Observed, Fun_gamma_Site, geodist, Bac_gamma_Site (sorted by decreasing coefficient)
   \

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:display-MRM-Var-All-rawresults-DS-Fun-raw)MRM results down-selected model for all fungal samples assessing βsor ~ All (All variables and measures)</caption>
 <thead>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model Rsquared = 0.3894 (p-value = 0.001)</div></th></tr>
<tr><th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: left; font-style: italic; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Model F.test = 4657.98 (F.p-value = 0.001)</div></th></tr>
  <tr>
   <th style="text-align:left;"> terms </th>
   <th style="text-align:center;"> coef </th>
   <th style="text-align:center;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Intercept </td>
   <td style="text-align:center;color: white !important;background-color: rgba(67, 191, 113, 255) !important;"> 0.7040 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_persite </td>
   <td style="text-align:center;color: white !important;background-color: rgba(56, 87, 140, 255) !important;"> 0.1689 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrasses_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(68, 1, 84, 255) !important;"> -0.1676 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Shannon </td>
   <td style="text-align:center;color: white !important;background-color: rgba(64, 69, 136, 255) !important;"> 0.0874 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ngrass_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(69, 55, 129, 255) !important;"> 0.0285 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ppt3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(72, 41, 121, 255) !important;"> -0.0248 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GDD3yr </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 42, 122, 255) !important;"> -0.0209 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> herbivory_perc </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 52, 129, 255) !important;"> 0.0197 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_at_site_within_Fun_sor_clus2 </td>
   <td style="text-align:center;color: white !important;background-color: rgba(70, 52, 128, 255) !important;"> 0.0178 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_per_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 122, 255) !important;"> -0.0140 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_InvSimpson </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 45, 123, 255) !important;"> -0.0098 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perBac_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> -0.0005 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nsamples_perFun_sor_clusters </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> 0.0004 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_Observed </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> 0.0003 </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fun_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> -0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> geodist </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> 0.0001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bac_gamma_Site </td>
   <td style="text-align:center;color: white !important;background-color: rgba(71, 47, 125, 255) !important;"> 0.0000 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
</tbody>
</table>

\
\
\

## Residuals




\
\
\

## Decay plots of significant PredVar {.tabset .tabset-pills}

\

##### pH STANDARDIZED decay plots




<img src="../docs/github_MRM_SEM__fungi_figures/plot-Fun-pH-decay-1.png" height="70%" />

\

##### pH NOT STANDARDIZED decay plots




<img src="../docs/github_MRM_SEM__fungi_figures/plot-Fun-allNSTD-spatial-decay-1.png" height="70%" />

\

##### Fungal Shannon decay plots




<img src="../docs/github_MRM_SEM__fungi_figures/plot-Fun-Fun_Shannon-decay-1.png" height="70%" />

\

##### Fungal InvSimpson decay plots




<img src="../docs/github_MRM_SEM__fungi_figures/plot-Fun-Fun_InvSimpson-decay-1.png" height="70%" />

\

##### Fungal Observed decay plots




<img src="../docs/github_MRM_SEM__fungi_figures/plot-Fun-Fun_Observed-decay-1.png" height="70%" />

\


\
\

