# RAM data analyses

setwd("~/Desktop/ksu-paired-amplicon-workflow/code")

# Set LANL proxies
Sys.setenv('HTTP_PROXY'='http://proxyout.lanl.gov:8080')
Sys.setenv('HTTPS_PROXY'='http://proxyout.lanl.gov:8080')

source("../../black-sheep-club/code/sheepish_scripts.R")
source("ksu_colors.R")
# clean cache - doesnt work
# clean_cache(clean = FALSE, path = "../docs/github_nestedness_clusters/")




# load rds

##########
# phylo #
Bac_wholecommunity<-readRDS(file = "../processed_data/clean_rds_saves/Bac_wholecommunity.rds")
Fun_wholecommunity <- readRDS(file="../processed_data/clean_rds_saves/Fun_wholecommunity.rds")
##########

# edit and save sample data ----

## add # grass hosts per site -----
# sample_data(Bac_wholecommunity)$ngrass_persite <- 
#   ave(as.numeric(factor(sample_data(Bac_wholecommunity)$Grass)), 
#       sample_data(Bac_wholecommunity)$Site, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$ngrass_persite <- 
#   ave(as.numeric(factor(sample_data(Fun_wholecommunity)$Grass)), 
#       sample_data(Fun_wholecommunity)$Site, FUN = function(x) length(unique(x)))

## add # grass hosts per BF clusters -----
### ngrass_perFun_sor_clusters
# sample_data(Bac_wholecommunity)$ngrass_perFun_sor_clusters <- 
#   ave(as.numeric(factor(sample_data(Bac_wholecommunity)$Grass)),
#       sample_data(Bac_wholecommunity)$Fun_sor_clusters, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$ngrass_perFun_sor_clusters <- 
#   ave(as.numeric(factor(sample_data(Fun_wholecommunity)$Grass)), 
#       sample_data(Fun_wholecommunity)$Fun_sor_clusters, FUN = function(x) length(unique(x)))

### ngrass_perBac_sor_clusters -----
# sample_data(Bac_wholecommunity)$ngrass_perBac_sor_clusters <- 
#   ave(as.numeric(factor(sample_data(Bac_wholecommunity)$Grass)), 
#       sample_data(Bac_wholecommunity)$Bac_sor_clusters, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$ngrass_perBac_sor_clusters <- 
#   ave(as.numeric(factor(sample_data(Fun_wholecommunity)$Grass)), 
#       sample_data(Fun_wholecommunity)$Bac_sor_clusters, FUN = function(x) length(unique(x)))

### nsamples_at_site_within_Fun_sor_clus2 -----
# Average number of samples per site within each Fun_sor_clus2 group
# sd_Bac <- as(sample_data(Bac_wholecommunity), "data.frame")
# sd_Fun <- as(sample_data(Fun_wholecommunity), "data.frame")
# # Count n samples per Site per Fun_sor_clus2 group
# group_site_counts_Bac <- sd_Bac %>%
#   group_by(Site, Fun_sor_clus2) %>%
#   summarise(nsamples_perSite_byFun_sor_clus2 = n(), .groups = "drop")
# group_site_counts_Fun <- sd_Fun %>%
#   group_by(Site, Fun_sor_clus2) %>%
#   summarise(nsamples_perSite_byFun_sor_clus2 = n(), .groups = "drop")
# # Join counts back to each sample by group and site
# sd_Bac <- left_join(sd_Bac, group_site_counts_Bac, by = c("Site","Fun_sor_clus2"))
# sd_Fun <- left_join(sd_Fun, group_site_counts_Fun, by = c("Site","Fun_sor_clus2"))
# # Assign back to phyloseq object
# sample_data(Bac_wholecommunity)$nsamples_at_site_within_Fun_sor_clus2 <- sd_Bac$nsamples_perSite_byFun_sor_clus2
# sample_data(Fun_wholecommunity)$nsamples_at_site_within_Fun_sor_clus2 <- sd_Fun$nsamples_perSite_byFun_sor_clus2


### ngrasses_at_site_within_Fun_sor_clus2 -----
# sd_Bac <- as(sample_data(Bac_wholecommunity), "data.frame")
# sd_Fun <- as(sample_data(Fun_wholecommunity), "data.frame")
# # Count unique grasses per Site within each Fun_sor_clus2 group
# grass_counts_Bac <- sd_Bac %>%
#   group_by(Fun_sor_clus2, Site) %>%
#   summarise(n_grasses_site_group = n_distinct(Grass), .groups = "drop")
# grass_counts_Fun <- sd_Fun %>%
#   group_by(Fun_sor_clus2, Site) %>%
#   summarise(n_grasses_site_group = n_distinct(Grass), .groups = "drop")
# # Join back to each sample
# sd_Bac <- left_join(sd_Bac, grass_counts_Bac, by = c("Fun_sor_clus2", "Site"))
# sd_Fun <- left_join(sd_Fun, grass_counts_Fun, by = c("Fun_sor_clus2", "Site"))
# # Assign back to phyloseq object
# sample_data(Bac_wholecommunity)$ngrasses_at_site_within_Fun_sor_clus2 <- sd_Fun$n_grasses_site_group
# sample_data(Fun_wholecommunity)$ngrasses_at_site_within_Fun_sor_clus2 <- sd_fun$n_grasses_site_group




### nsamples_at_site_within_Bac_sor_clusters & Fun_sor_clusters -----
# # Average number of samples per site within each Bac_sor_clusters group
# sd_Bac <- as(sample_data(Bac_wholecommunity), "data.frame")
# sd_Fun <- as(sample_data(Fun_wholecommunity), "data.frame")
# # Count n samples per Site per Bac_sor_clusters group
# group_site_counts_Bac <- sd_Bac %>%
#   group_by(Site, Bac_sor_clusters) %>%
#   summarise(nsamples_perSite_byBac_sor_clusters = n(), .groups = "drop")
# group_site_counts_Fun <- sd_Fun %>%
#   group_by(Site, Fun_sor_clusters) %>%
#   summarise(nsamples_perSite_byFun_sor_clusters = n(), .groups = "drop")
# # Join counts back to each sample by group and site
# sd_Bac <- left_join(sd_Bac, group_site_counts_Bac, by = c("Site","Bac_sor_clusters"))
# sd_Fun <- left_join(sd_Fun, group_site_counts_Bac, by = c("Site","Bac_sor_clusters"))
# sd_Bac <- left_join(sd_Bac, group_site_counts_Fun, by = c("Site","Fun_sor_clusters"))
# sd_Fun <- left_join(sd_Fun, group_site_counts_Fun, by = c("Site","Fun_sor_clusters"))
# # Assign back to phyloseq object
# sample_data(Bac_wholecommunity)$nsamples_at_site_within_Bac_sor_clusters <- sd_Bac$nsamples_perSite_byBac_sor_clusters
# sample_data(Fun_wholecommunity)$nsamples_at_site_within_Bac_sor_clusters <- sd_Fun$nsamples_perSite_byBac_sor_clusters
# sample_data(Bac_wholecommunity)$nsamples_at_site_within_Fun_sor_clusters <- sd_Bac$nsamples_perSite_byFun_sor_clusters
# sample_data(Fun_wholecommunity)$nsamples_at_site_within_Fun_sor_clusters <- sd_Fun$nsamples_perSite_byFun_sor_clusters


### ngrasses_at_site_within_Bac_sor_clusters & Fun_sor_clusters -----
# sd_Bac <- as(sample_data(Bac_wholecommunity), "data.frame")
# sd_Fun <- as(sample_data(Fun_wholecommunity), "data.frame")
# # Count unique grasses per Site within each Fun_sor_clus2 group
# grass_counts_Bac <- sd_Bac %>%
#   group_by(Site,Bac_sor_clusters) %>%
#   summarise(n_grasses_site_Bac_sor_clusters = n_distinct(Grass), .groups = "drop")
# grass_counts_Fun <- sd_Fun %>%
#   group_by(Site,Fun_sor_clusters) %>%
#   summarise(n_grasses_site_Fun_sor_clusters = n_distinct(Grass), .groups = "drop")
# # Join back to each sample
# sd_Bac <- left_join(sd_Bac, grass_counts_Bac, by = c( "Site","Bac_sor_clusters"))
# sd_Fun <- left_join(sd_Fun, grass_counts_Bac, by = c( "Site","Bac_sor_clusters"))
# sd_Bac <- left_join(sd_Bac, grass_counts_Fun, by = c( "Site","Fun_sor_clusters"))
# sd_Fun <- left_join(sd_Fun, grass_counts_Fun, by = c( "Site","Fun_sor_clusters"))
# # Assign back to phyloseq object
# sample_data(Bac_wholecommunity)$ngrasses_at_site_within_Bac_sor_clusters <- sd_Bac$n_grasses_site_Bac_sor_clusters
# sample_data(Fun_wholecommunity)$ngrasses_at_site_within_Bac_sor_clusters <- sd_Fun$n_grasses_site_Bac_sor_clusters
# sample_data(Bac_wholecommunity)$ngrasses_at_site_within_Fun_sor_clusters <- sd_Bac$n_grasses_site_Fun_sor_clusters
# sample_data(Fun_wholecommunity)$ngrasses_at_site_within_Fun_sor_clusters <- sd_Fun$n_grasses_site_Fun_sor_clusters





## add n samples per site  -----
# sample_data(Bac_wholecommunity)$nsamples_per_Site <- ave(as.numeric(factor(sample_data(Bac_wholecommunity)$SampleID)), sample_data(Bac_wholecommunity)$Site, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$nsamples_per_Site <- ave(as.numeric(factor(sample_data(Fun_wholecommunity)$SampleID)), sample_data(Fun_wholecommunity)$Site, FUN = function(x) length(unique(x)))

## add n samples per Bac_sor_clusters -----
# sample_data(Bac_wholecommunity)$nsamples_perBac_sor_clusters <- ave(as.numeric(factor(sample_data(Bac_wholecommunity)$SampleID)), sample_data(Bac_wholecommunity)$Bac_sor_clusters, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$nsamples_perBac_sor_clusters <- ave(as.numeric(factor(sample_data(Fun_wholecommunity)$SampleID)), sample_data(Fun_wholecommunity)$Bac_sor_clusters, FUN = function(x) length(unique(x)))

## add n samples per Fun_sor_clusters -----
# sample_data(Bac_wholecommunity)$nsamples_perFun_sor_clusters <- ave(as.numeric(factor(sample_data(Bac_wholecommunity)$SampleID)), sample_data(Bac_wholecommunity)$Fun_sor_clusters, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$nsamples_perFun_sor_clusters <- ave(as.numeric(factor(sample_data(Fun_wholecommunity)$SampleID)), sample_data(Fun_wholecommunity)$Fun_sor_clusters, FUN = function(x) length(unique(x)))

## add ngrass per Bac_sor_clusters -----
# sample_data(Bac_wholecommunity)$ngrass_perBac_sor_clusters <- ave(as.numeric(factor(sample_data(Bac_wholecommunity)$Grass)), sample_data(Bac_wholecommunity)$Bac_sor_clusters, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$ngrass_perBac_sor_clusters <- ave(as.numeric(factor(sample_data(Fun_wholecommunity)$Grass)), sample_data(Fun_wholecommunity)$Bac_sor_clusters, FUN = function(x) length(unique(x)))

## add ngrass per Fun_sor_clusters -----
# sample_data(Bac_wholecommunity)$ngrass_perFun_sor_clusters <- ave(as.numeric(factor(sample_data(Bac_wholecommunity)$Grass)), sample_data(Bac_wholecommunity)$Fun_sor_clusters, FUN = function(x) length(unique(x)))
# sample_data(Fun_wholecommunity)$ngrass_perFun_sor_clusters <- ave(as.numeric(factor(sample_data(Fun_wholecommunity)$Grass)), sample_data(Fun_wholecommunity)$Fun_sor_clusters, FUN = function(x) length(unique(x)))

## add site gamma -----
# sample_data(Bac_wholecommunity)$Bac_gamma_Site <- as.numeric(bwc_alpha_Site$Bac_gamma_Site)
# sample_data(Bac_wholecommunity)$Fun_gamma_Site <- as.numeric(fwc_alpha_Site$Fun_gamma_Site)

# sample_data(Fun_wholecommunity)$Bac_gamma_Site <- as.numeric(bwc_alpha_Site$Bac_gamma_Site)
# sample_data(Fun_wholecommunity)$Fun_gamma_Site <- as.numeric(fwc_alpha_Site$Fun_gamma_Site)

# use estimate.richness() to calc alpha div and append _Bac to bacterial results and _Fun to fungal results. add both results to each objects sample_data 





















## change 'soil_moisture' to 'soil_dry_perc'-----
# sample_data(Bac_wholecommunity)$soil_dry_perc <- as.numeric(sample_data(Bac_wholecommunity)$soil_moisture)
# sample_data(Fun_wholecommunity)$soil_dry_perc <- as.numeric(sample_data(Fun_wholecommunity)$soil_moisture)

## change 'perc_moisture'*100 to 'soil_water_content'-----
# sample_data(Bac_wholecommunity)$soil_water_content <- as.numeric((sample_data(Bac_wholecommunity)$perc_moisture)*100)
# sample_data(Fun_wholecommunity)$soil_water_content <- as.numeric((sample_data(Fun_wholecommunity)$perc_moisture)*100)














# perform_mean_standardization for soil_water_content
# Bac_wholecommunity <- perform_mean_standardization(Bac_wholecommunity)
# Fun_wholecommunity <- perform_mean_standardization(Fun_wholecommunity)
## save ----
# saveRDS(Bac_wholecommunity,file = "../processed_data/clean_rds_saves/Bac_wholecommunity.rds")
# saveRDS(Fun_wholecommunity,file="../processed_data/clean_rds_saves/Fun_wholecommunity.rds")
# 
# Fun_wholecommunity.r  = transform_sample_counts(Fun_wholecommunity, function(x) x / sum(x) )
# Bac_wholecommunity.r  = transform_sample_counts(Bac_wholecommunity, function(x) x / sum(x) )
# 
# saveRDS(Bac_wholecommunity.r,file = "../processed_data/clean_rds_saves/Bac_wholecommunity.r.rds")
# saveRDS(Fun_wholecommunity.r,file="../processed_data/clean_rds_saves/Fun_wholecommunity.r.rds")
## ENDsave ----

# double check
# colnames(sample_data(Bac_wholecommunity))
# colnames(sample_data(Fun_wholecommunity))


## ENDedit and save sample data ----


##########
# nmds #
Bac_wc_sor_k5.ord <- readRDS(file = "../processed_data/clean_rds_saves/Bac_wc_sor_k5.ord.rds")
Fun_wc_sor_k4.ord <- readRDS(file = "../processed_data/clean_rds_saves/Fun_wc_sor_k4.ord.rds")
##########


##########
# misc #
Bac_wholecommunity.r<-readRDS(file = "../processed_data/clean_rds_saves/Bac_wholecommunity.r.rds")
Fun_wholecommunity.r<-readRDS(file = "../processed_data/clean_rds_saves/Fun_wholecommunity.r.rds")
sd<-as(sample_data(Fun_wholecommunity), "data.frame") # metadata for phyloseq
##########




##########
# colors #
col_n14 <- c("B1"="#730025","B2"="#AF0039","B3"="#E8004C","B4"="#FF65A3","B5"="#9E4D97",
             "B6"="#4D42B3","B7"="#7678ed","B8"="#5B7898","B9"="#17A398","B10"="#74A57F",
             "B11"="#B6AF40","B12"="#f7b801", "B13"="#f18701", "B14"="#f35b04")
# creation: https://coolors.co/730025-AF0039-E8004C-FF65A3-9E4D97-4D42B3-7678ed-5B7898-17A398-74A57F-B6AF40-f7b801-f18701-f35b04


col_n10 <- c("F1"="#8E0152","F2"="#C51B7D","F3"="#DE77AE","F4"="#F1B6DA","F5"="#C5C2EA",
             "F6"="#8DC9BB","F7"="#86C37E","F8"="#7FBC41","F9"="#4D9221","F10"="#276419")


col_domainBac <- "#006e90"
col_domainBac_dk <- "#004E66"

col_domainFun <- "#f18f01"
col_domainFun_dk <- "#B76E01"




Site_colors_list<-readRDS(file = "../processed_data/clean_rds_saves/Site_colors_list_fixed.rds")
names(Site_colors_list)
latlong_sitenames<-Site_colors_list$latlong_sitenames
color_latlong_mapping<-Site_colors_list$color_latlong_mapping
latlong_cols<-Site_colors_list$latlong_cols

latlong_cols<-readRDS(file = "../processed_data/clean_rds_saves/latlong_cols.rds")


site_levels<-Site_colors_list$site_levels_orderedfactor
bac_grass_cols<-c("#96A13A", "#994f0b", "#537D8D", "#21295C", "#90708C")
##########


###############################
# read-in alpha and gamma div #
Fun_gamma_Site.df<-readRDS(file="../processed_data/clean_rds_saves/Fun_gamma_Site.df.rds")
Bac_gamma_Site.df<-readRDS(file="../processed_data/clean_rds_saves/Bac_gamma_Site.df.rds")
fwc_alpha_Site<-readRDS(file="../processed_data/clean_rds_saves/fwc_alpha_Site.rds")
bwc_alpha_Site<-readRDS(file="../processed_data/clean_rds_saves/bwc_alpha_Site.rds")
###############################