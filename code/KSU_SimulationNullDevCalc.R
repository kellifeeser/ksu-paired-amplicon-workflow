#######################
### Code for example metacommunity simulation and beta-null deviation calculations
### with "Differentiating between niche and neutral assembly in metacommunities using
### null models of beta-diversity"
### Prepared May 14, 2014 
### Authors Caroline Tucker, Lauren Shoemaker, Brett Melbourne
#######################

setwd("/Users/L347123/Desktop/ksu-paired-amplicon-workflow/code")# install.packages("~/Downloads/statnet.common_4.1.4.tar", repos = NULL, type="source")

## Load required source files and libraries
library(reldist)
library(phyloseq)
library(vegan)
library(bipartite)
#save the two R files below in your working directory
source("MetacommunityDynamicsFctsOikos.r")
source("PANullDevFctsOikos.r")

Bac.AllG<-readRDS(file="../processed_data/clean_rds_saves/BacArch_min2_rare9048_v1.rds")
comm_min2<-prune_taxa(taxa_sums(Bac.AllG) > 1, Bac.AllG)
#18516 species, 533 patches

Fun.AllG<-readRDS(file="../processed_data/clean_rds_saves/Fun_min2_rare10116_v2.rds")

# Fun_min2_rare10116_noEDGE_ANGE_v1<-readRDS(file="ksufunrdsobjects/Fun_min2_rare10116_noEDGE_ANGE_v1.rds")
# Fun_min2_rare10116_noEDGE_BOER_v1<-readRDS(file="ksufunrdsobjects/Fun_min2_rare10116_noEDGE_BOER_v1.rds")
# Fun_min2_rare10116_noEDGE_BOGR_v1<-readRDS(file="../processed_data/clean_rds_saves/Fun_min2_rare10116_noEDGE_BOGR_v1.rds")
# Fun_min2_rare10116_noEDGE_BUDA_v1<-readRDS(file="ksufunrdsobjects/Fun_min2_rare10116_noEDGE_BUDA_v1.rds")
# Fun_min2_rare10116_noEDGE_SCSC_v1<-readRDS(file="ksufunrdsobjects/Fun_min2_rare10116_noEDGE_SCSC_v1.rds")

# BacArch_min2_rare9048_noEDGE_ANGE_v1<-readRDS(file="ksufunrdsobjects/BacArch_min2_rare9048_noEDGE_ANGE_v1.rds")
# BacArch_min2_rare9048_noEDGE_BOER_v1<-readRDS(file="ksufunrdsobjects/BacArch_min2_rare9048_noEDGE_BOER_v1.rds")
 BacArch_min2_rare9048_noEDGE_BOGR_v1<-readRDS(file="../processed_data/clean_rds_saves/BacArch_min2_rare9048_noEDGE_BOGR_v1.rds")
# BacArch_min2_rare9048_noEDGE_BUDA_v1<-readRDS(file="ksufunrdsobjects/BacArch_min2_rare9048_noEDGE_BUDA_v1.rds")
# BacArch_min2_rare9048_noEDGE_SCSC_v1<-readRDS(file="ksufunrdsobjects/BacArch_min2_rare9048_noEDGE_SCSC_v1.rds")

#below are 10 phyloseq objects, I ran all 3 through the pipeline individually
  # comm_min2<-prune_taxa(taxa_sums(Fun_min2_rare10116_noEDGE_ANGE_v1) > 1, Fun_min2_rare10116_noEDGE_ANGE_v1)
  #2368 species, 98 patches

  #comm_min2<-prune_taxa(taxa_sums(Fun_min2_rare10116_noEDGE_BOER_v1) > 1, Fun_min2_rare10116_noEDGE_BOER_v1)
  #1376 species, 78 patches

  #comm_min2<-prune_taxa(taxa_sums(Fun_min2_rare10116_noEDGE_BOGR_v1) > 1, Fun_min2_rare10116_noEDGE_BOGR_v1)
  #2148 species, 92 patches

  #comm_min2<-prune_taxa(taxa_sums(Fun_min2_rare10116_noEDGE_BUDA_v1) > 1, Fun_min2_rare10116_noEDGE_BUDA_v1)
  #1885 species, 80 patches

  #comm_min2<-prune_taxa(taxa_sums(Fun_min2_rare10116_noEDGE_SCSC_v1) > 1, Fun_min2_rare10116_noEDGE_SCSC_v1)
  #3547 species, 161 patches

  # comm_min2<-prune_taxa(taxa_sums(BacArch_min2_rare9048_noEDGE_ANGE_v1) > 1, BacArch_min2_rare9048_noEDGE_ANGE_v1)
  #10363 species, 106 patches

  #comm_min2<-prune_taxa(taxa_sums(BacArch_min2_rare9048_noEDGE_BOER_v1) > 1, BacArch_min2_rare9048_noEDGE_BOER_v1)
  #6152 species, 84 patches

  comm_min2<-prune_taxa(taxa_sums(BacArch_min2_rare9048_noEDGE_BOGR_v1) > 1, BacArch_min2_rare9048_noEDGE_BOGR_v1)
  #7422 species, 86 patches

  #comm_min2<-prune_taxa(taxa_sums(BacArch_min2_rare9048_noEDGE_BUDA_v1) > 1, BacArch_min2_rare9048_noEDGE_BUDA_v1)
  #7843 species, 83 patches

#comm_min2<-prune_taxa(taxa_sums(BacArch_min2_rare9048_noEDGE_SCSC_v1) > 1, BacArch_min2_rare9048_noEDGE_SCSC_v1)
#13047 species, 174 patches

# Set up
#############################################################################
## Set metacommunity size, time length
patches <- nsamples(comm_min2)  # Number of patches (# of sites from phyloseq object)
species <- ntaxa(comm_min2)  # Number of species (# of OTUs from phyloseq object)
time <- 150	   # Length of model run (generations) was 150 (keep this)

## Set parameters for metacommunity dynamics (don't change these)
Rbest <- rep(NA, species)	# intrinsic growth-rate patch type 2 (optimal patch)
d <- rep(0.05, species)		# migration rate

Rbest <- rep(1.45, species) # Species sorting parameterization

a <- 1/600					# Beverton-holt alpha for all species. This is fixed.

R <- matrix(1.095833, nrow=species, ncol=patches) # intrinsic growth-rate patch type 1 (non-optimal patch)
diag(R) <- 1.45
# diag(R) <- Rbest #cutting this line and replacing it with the above


# Data array for storing all results
dat <- array(NA, c(species, patches, time))
dat[,,1] <- rep(150, species*patches)	# starting conditions--150 species in each patch

## Stochastic metacommunity - run for 150 years (this sets up the random/stochastic initial community for null model)
stochasticRun <- rstoch(R, d, a, patches, species, dat) 
stoch <- stochasticRun[,,time] # use the last time point for null deviation analyses
stoch <- ifelse(stoch[,] <2, 0, stoch[,]) # threshold number of individuals

dune<-t(stoch)

## Deterministic metacommunity - run for 150 years (I didn't run the deterministic initial 
#community set up, just the stoch one. This is why this code is commented out)
deterministicRun <- rdet(R, d, a, patches, species, dat)
det <- deterministicRun[,,time]
det <- ifelse(det[,] <2, 0, det[,])

dune.det<-t(det)
#############################################################################



### Prepare and calculate abundance beta-null deviation metric - STOCHASTIC
#############################################################################
  ## Adjusted from Stegen et al 2012 GEB
sp.site.matrix_stoch <- dune
rand_stoch <- 999
null.alphas_stoch <- matrix(NA, ncol(dune), rand_stoch)
null.alpha_stoch <- matrix(NA, ncol(dune), rand_stoch)
expected_beta_stoch <- matrix(NA, 1, rand_stoch)
null.gamma_stoch <- matrix(NA, 1, rand_stoch)
null.alpha.comp_stoch <- numeric()
bucket_bray_res_stoch <- matrix(NA, patches, rand_stoch)

sp.site.matrix_stoch = ceiling(sp.site.matrix_stoch/max(sp.site.matrix_stoch)) 
mean.alpha_stoch = sum(sp.site.matrix_stoch)/nrow(sp.site.matrix_stoch) #mean.alpha_stoch
gamma_stoch <- ncol(sp.site.matrix_stoch) #gamma_stoch

obs_beta_stoch <- 1-mean.alpha_stoch/gamma_stoch
obs_beta_all_stoch <- 1-rowSums(sp.site.matrix_stoch)/gamma_stoch

##Generate null patches
for (randomize in 1:rand_stoch) {  
	null.dist_stoch = dune
	for (species in 1:ncol(null.dist_stoch)) {
		tot.abund = sum(null.dist_stoch[,species])
		null.dist_stoch[,species] = 0
		for (individual in 1:tot.abund) {
			sampled.site = sample(c(1:nrow(sp.site.matrix_stoch)), 1)
			null.dist_stoch[sampled.site, species] = null.dist_stoch[sampled.site, species] + 1
		}
	}
	
	##Calculate null deviation for null patches and store
	null.alphas_stoch[,randomize] <- apply(null.dist_stoch, 2, function(x){sum(ifelse(x > 0, 1, 0))})
	null.gamma_stoch[1, randomize] <- sum(ifelse(rowSums(null.dist_stoch)>0, 1, 0))
	expected_beta_stoch[1, randomize] <- 1 - mean(null.alphas_stoch[,randomize]/null.gamma_stoch[,randomize])
	null.alpha.mean_stoch <- mean(null.alphas_stoch[,randomize])
	null.alpha.comp_stoch <- c(null.alpha.comp_stoch, null.alpha.mean_stoch)
	
	bucket_bray_stoch <- as.matrix(vegdist(null.dist_stoch, "bray"))
	diag(bucket_bray_stoch) <- NA
	bucket_bray_res_stoch[,randomize] <- apply(bucket_bray_stoch, 2, FUN="mean", na.rm=TRUE)
	
} ## end randomize loop
#############################################################################


### Prepare and calculate abundance beta-null deviation metric - DETERMINISTIC
#############################################################################
sp.site.matrix_det <- dune.det
rand_det <- 999
null.alphas_det <- matrix(NA, ncol(dune.det), rand_det)
null.alpha_det <- matrix(NA, ncol(dune.det), rand_det)
expected_beta_det <- matrix(NA, 1, rand_det)
null.gamma_det <- matrix(NA, 1, rand_det)
null.alpha.comp_det <- numeric()
bucket_bray_res_det <- matrix(NA, patches, rand_det)

sp.site.matrix_det = ceiling(sp.site.matrix_det/max(sp.site.matrix_det)) 
mean.alpha_det = sum(sp.site.matrix_det)/nrow(sp.site.matrix_det) #mean.alpha_det
gamma_det <- ncol(sp.site.matrix_det) #gamma_det

obs_beta_det <- 1-mean.alpha_det/gamma_det
# obs_beta_all_det <- 1-rowSums(sp.site.matrix_det)/gamma_det

##Generate null patches
for (randomize in 1:rand_det) {  
  null.dist_det = dune.det
  for (species in 1:ncol(null.dist_det)) {
    tot.abund = sum(null.dist_det[,species])
    null.dist_det[,species] = 0
    for (individual in 1:tot.abund) {
      sampled.site = sample(c(1:nrow(sp.site.matrix_det)), 1)
      null.dist_det[sampled.site, species] = null.dist_det[sampled.site, species] + 1
    }
  }
  
  ##Calculate null deviation for null patches and store
  null.alphas_det[,randomize] <- apply(null.dist_det, 2, function(x){sum(ifelse(x > 0, 1, 0))})
  null.gamma_det[1, randomize] <- sum(ifelse(rowSums(null.dist_det)>0, 1, 0))
  expected_beta_det[1, randomize] <- 1 - mean(null.alphas_det[,randomize]/null.gamma_det[,randomize])
  null.alpha.mean_det <- mean(null.alphas_det[,randomize])
  null.alpha.comp_det <- c(null.alpha.comp_det, null.alpha.mean_det)
  
  bucket_bray_det <- as.matrix(vegdist(null.dist_det, "bray"))
  diag(bucket_bray_det) <- NA
  bucket_bray_res_det[,randomize] <- apply(bucket_bray_det, 2, FUN="mean", na.rm=TRUE)
  
} ## end randomize loop
#############################################################################


## Calculate beta-diversity for obs metacommunity
beta_comm_abund <- phyloseq::distance(comm_min2, "bray")
res_beta_comm_abund <- as.matrix(as.dist(beta_comm_abund))
diag(res_beta_comm_abund) <- NA
  # min(res_beta_comm_abund, na.rm = T)
  # max(res_beta_comm_abund, na.rm = T)
# output beta diversity (Bray)
beta_div_metacomm_mean <- apply(res_beta_comm_abund, 2, FUN="mean", na.rm=TRUE) # by col/site

# Calc abundance beta-null deviation
abund_null_dev_stoch <- beta_div_metacomm_mean - mean(bucket_bray_res_stoch)
abund_null_dev_det <- beta_div_metacomm_mean - mean(bucket_bray_res_det)

# Calc obs alpha
veganotu = function(physeq) {

  OTU = otu_table(physeq)
  if (taxa_are_rows(OTU)) {
    OTU = t(OTU)
  }
  return(as(OTU, "matrix"))
}
sp.site.matrix <- as.matrix(veganotu(comm_min2))

obs.alphas <- apply(sp.site.matrix, 2, function(x){sum(ifelse(x > 0, 1, 0))})

obs_otu_count <- estimate_richness(comm_min2, measures = "Observed")
obs_otu_count_mean <- mean(obs_otu_count$Observed)
obs_mean_alpha <- sum(t(otu_table(comm_min2)))/nrow(t(otu_table(comm_min2)))
obs_gamma <- estimate_richness(comm_min2, measures = "Observed", split=F)


# format outputs
obs_summary <- data.frame("n_samples" = nsamples(comm_min2),
                          "obs_otu_count_mean" = obs_otu_count_mean,
                          "obs_calc_alpha_mean" = mean(obs.alphas),
                          "obs_gamma" = ntaxa(comm_min2),
                          "obs_mean_beta" = mean(beta_div_metacomm_mean))

null_summary <- data.frame("null_mean_alpha_stoch" = null.alpha.mean_stoch,
                           "null_mean_alpha_det" = null.alpha.mean_det,
                           "null_gamma_stoch" = sum(null.dist_stoch),
                           "null_gamma_det" = sum(null.dist_det),
                           "null_mean_beta_stoch" = mean(bucket_bray_res_stoch),
                           "null_mean_beta_det" = mean(bucket_bray_res_det))

run_summary <- data.frame(mean.alpha_stoch,mean.alpha_det,
                               gamma_stoch,gamma_det,
                               obs_beta_stoch,obs_beta_det)

all_summaryA <- rbind(t(obs_summary), t(null_summary), t(run_summary))
all_summaryB <- c(rep("obs_summary", length(obs_summary)),
                      rep("null_summary", length(null_summary)),
                      rep("run_summary", length(run_summary)))
all_summary <- data.frame("measure" = row.names(all_summaryA),
                           "values" = all_summaryA,
                           "source" = all_summaryB)
  
output.by.sample.df <- data.frame(obs_otu_count, beta_div_metacomm_mean, 
                                  abund_null_dev_stoch, abund_null_dev_det)
  

write.csv(output.by.sample.df,
          file="../processed_data/BetaNullDeviation/Bac.AllG_BnullDev_abund_bysample.csv")
write.csv(all_summary, row.names = F,
          file="../processed_data/BetaNullDeviation/Bac.AllG_BnullDev_abund_summary.csv")

# write.csv(output.by.sample.df,
#           file="../processed_data/BetaNullDeviation/Fun.BOGR_BnullDev_abund_bysample.csv")
# write.csv(all_summary, row.names = F,
#           file="../processed_data/BetaNullDeviation/Fun.BOGR_BnullDev_abund_summary.csv")


# write.csv(output.by.sample.df,file="../processed_data/BetaNullDeviation/Bac.BOGR_BnullDev_abund_bysample.csv")
# write.csv(all_summary, row.names = F,
#           file="../processed_data/BetaNullDeviation/Bac.BOGR_BnullDev_abund_summary.csv")




# Repeat w Jaccard
#############################################################################
##Calculate beta-diversity for metacommunity
# dune_bin <- siteXsp_prep(dune, plot_names_in_col1=FALSE)
# 
# beta_comm <- vegdist(dune_bin, "jaccard")  	# Calculate beta-diversity
# # beta_comm <- phyloseq::distance(dune_bin, "jaccard")  	# Calculate beta-diversity
# res_beta_comm <- as.matrix(as.dist(beta_comm))
# diag(res_beta_comm) <- NA
# beta_div_stoch <- apply(res_beta_comm, 2, FUN="mean", na.rm=TRUE) 	# Calculate patch mean value
# 
# ## Calculate PA null deviation
# nullobj <- null_distributions(dune_bin, test_func = vegdist, method = "jaccard", reps=999)		# generate null distributions
# nulldev <- null_deviations(dune_bin, nullobj, vegdist, method="jaccard")		# Calculate null deviations using the expected value method
# 
# ### Store results, where each value is the PA beta-null deviation value for a pairwise comparison (distance matrix) between patches
# res_nulldev <- as.matrix(as.dist(nulldev$null_devs_eval))
# diag(res_nulldev) <- NA
# PA_null_dev <- apply(res_nulldev, 2, FUN="mean", na.rm=TRUE) #Calculate patch mean value
#############################################################################





### Outputs:
# mean.alpha_stoch
# mean.alpha_det
# 
# gamma_stoch
# gamma_det
# 
# obs_beta_stoch # 1-mean.alpha_stoch/gamma_stoch
# obs_beta_det # 1-mean.alpha_det/gamma_det


#beta_div_metacomm_mean - Bray-Curtis beta-diversity for the metacommunity, average value (of all pairwise comparisons) for each patch
#abund_null_dev_stoch - abundance null deviation values or the metacommunity, average value (of all pairwise comparisons) for each patch
  #beta_div_stoch  - Jaccard beta-diversity for the metacommunity, average value (of all pairwise comparisons) for each patch
  #PA_null_dev - presence-absence null deviation values or the metacommunity, average value (of all pairwise comparisons) for each patch

# write.csv(as.data.frame(beta_div_metacomm),file="../processed_data/BetaNullDeviation/Bac.BOGR_BC_metacomm.csv")
# write.csv(as.data.frame(abund_null_dev_stoch),file="../processed_data/BetaNullDeviation/Bac.BOGR_BnullDev_abund_stoch.csv")
# write.csv(as.data.frame(abund_null_dev_det),file="../processed_data/BetaNullDeviation/Bac.BOGR_BnullDev_abund_det.csv")


# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Fun_ANGE.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Fun_BOER.csv")
# write.csv(abund_null_dev_df,file="../processed_data/BetaNullDeviation/BnullDev_abund_stoch_Fun_BOGR.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Fun_BUDA.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Fun_SCSC.csv")

# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Bac_ANGE.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Bac_BOER.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Bac_BOGR.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Bac_BUDA.csv")
# write.csv(abund_null_dev_df,file="Betanull_out/BnullDev_abund_stoch_Bac_SCSC.csv")
